/*
 * Copyright 2014-2018 NTT Corporation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package jp.co.ntt.atrs.app.common.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 空ファイルチェックアノテーション実装クラス
 * @author NTT 電電太郎
 */
public class UploadFileNotEmptyValidator
                                        implements
                                        ConstraintValidator<UploadFileNotEmpty, MultipartFile> {

    /**
     * 空ファイルチェックアノテーション
     */
    private UploadFileNotEmpty constraint;

    /**
     * {@inheritDoc}
     */
    @Override
    public void initialize(UploadFileNotEmpty constraint) {
        this.constraint = constraint;
    }

    /**
     * 空ファイルチェックを行う
     * @param multipartFile アップロードファイル
     * @param context バリデータコンテキスト
     * @return チェック結果
     */
    @Override
    public boolean isValid(MultipartFile multipartFile,
            ConstraintValidatorContext context) {
        if (!constraint.check()) {
            return true;
        }
        if (multipartFile == null
                || !StringUtils.hasLength(multipartFile.getOriginalFilename())) {
            return true;
        }
        return !multipartFile.isEmpty();
    }

}

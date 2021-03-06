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
package jp.co.ntt.atrs.app.a0;

import jp.co.ntt.atrs.domain.service.a1.AtrsUserDetails;

import org.springframework.stereotype.Component;

/**
 * 認証情報を扱うためのヘルパークラス。
 * @author NTT 電電太郎
 */
@Component
public class AuthenticationHelper {

    /**
     * 認証済みのユーザか確認する。
     * @param userDetails 認証情報を保持するオブジェクト
     * @return 認証済みのユーザの場合は<code>true</code>を返却。
     */
    public boolean isAuthenticatedPrincipal(AtrsUserDetails userDetails) {
        return (userDetails != null);
    }

}

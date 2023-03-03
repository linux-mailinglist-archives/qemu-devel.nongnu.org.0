Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2766A9F7E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:47:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAQl-0004e2-Mm; Fri, 03 Mar 2023 13:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQY-0004cY-Mu
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:46:47 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQW-0000fN-FS
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:46:46 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c4so2217547pfl.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=N2upLABscZLAgOCnyJh9VokjzNhrtfLlel6t0bLhJlDbxDpQp09e5Or7f3fgj1hydA
 Kvqu9TjlPjiagkovIOTMby8R3dqehIfqCxiSmtK9Ht2BNNKaHMuadiASiGn8hawtIrIS
 X7UbjoPLJmDRKWiT9pg0lzgnjtZ3h9NKlKFjcODtQaUf8VDmDJTTpdv/iAdkU/rUf56P
 mKi4+hBmK4O74Yi8CPDDQXnMlfhsQsPDMdaYP/5jyW4GwEK8aP1vOZ4lFRcx27oI+mUq
 f3pX8ccYEd1Z36d0QxAjrv6+Yw5pCP6Yj+PFvcakJUMjVGimOYU8G/SWmpA8WSH7doyt
 dYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=Q5VTe9P+Po5PKYxwM9Cklc0ZtYAl1kX4JQXvlk0KVTF2VJfDpXadwAj0N02SmjrKPB
 vHXm65n/VWYXP72zTUfB8UYGxAGmo0y4htGr0z+Wr7/FBHQPy7gFGkMiWduE7D8bQXvt
 bV6A6LhrocYJdXrxLJDi46OSKEKwrm3mCkK9sRmNHCA4feZLEi12WhB7hqVRVySxkp4a
 CpZO5aj0Gru+fwdZK3Mf4PlnZa7rwkRvHH1UGD1J1yotZgM58ksEPI69AG+xowzo0JY+
 1wedka5uET7pEk3dEOF5n22BF0ZgdCk0EVcfi6/88Qvr4evjpXTDwIchtqe+/hNswckN
 +bcw==
X-Gm-Message-State: AO0yUKVYuaj8NjqrsBYxyLfaVJw62LfkrKmCK0fadL7IkiXv2gmTQswq
 rH7PqtCRHw6J5Wz3VNg8ZF0j8iVknRYteoo2qUtbgw==
X-Google-Smtp-Source: AK7set9WbtpkawGxYvCFwOG2Y584fZLU+q+7YUgWEFackEpfbfF9dHrwFE3c4uGBsFUj+D4NWOITipwTtvSZ0i5tHuk=
X-Received: by 2002:a63:135f:0:b0:503:130c:aca2 with SMTP id
 31-20020a63135f000000b00503130caca2mr2351271pgt.5.1677869202996; Fri, 03 Mar
 2023 10:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-22-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:31 +0000
Message-ID: <CAFEAcA-44S55OsA=hHk4RJcqctBpnr4nOE=8OupoUk00AXPRMA@mail.gmail.com>
Subject: Re: [PATCH v2 21/76] target/cris: Drop cris_alu_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


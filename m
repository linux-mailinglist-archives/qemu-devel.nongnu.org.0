Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CA68DDBF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQdl-0003N6-Su; Tue, 07 Feb 2023 11:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQdf-0003MJ-Og
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:16:11 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQde-0004zu-2t
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:16:11 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 16so1373549pfo.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D15ojix7S/dW0gh9eQLarUDEbRYJSBIC0ARRAr0VTPY=;
 b=eDThrvabP3e1KH/KaaRcPqi9nWFZm5A0WzRmESPwFQKGgyvvro9bprFDubtDRNEzGZ
 kUZyQvFk3gCyz3KoQ8gFhfH31aWmU5m9sDPIsaC84LOh7k6mTz5sSgYyfzEjapWwNjvE
 Rq6vmHo99d6hU3WjlzrBKf++ptXTXxHp5Wjn1V0ooeodPeZ1MA+PbarPxnECDxwbafC/
 yVoapnr1T5vPwszfNq1jQXT2Ljr9vjNfyThWch0ZJOhdIS95XA4Hxbhugiv+4uLJyX5f
 X6cgM3/4uAHdm/EadMFN/0yJBE68DyvKv8IDFPyMGodykfkcXjART+CWVFMQMSJrVE08
 oK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D15ojix7S/dW0gh9eQLarUDEbRYJSBIC0ARRAr0VTPY=;
 b=W0JELOelUphhGvGshaToEbm9lKNeAhrJfUspM3QTrpgfLdH0FEZXJNhdqnUGTVhNS3
 AouKDLlZQoAhwkAwHShyLIg63s2Zf4owyOTyW5ERaY9euPWsrluDJ5VaBm+5d66tqIuf
 kQVHWe7/cQCnHB29D2rk6JtPtHVCgfrSEzvfG5GXqZn78EGTCnpzXQkMHTcy1u18Bz6j
 I9ASRNFYmfWRQoDkoUv0XvWCss+rLPQmqLJk2jRHJDikQu6DPKe0g9AfslmXlcXxpgbq
 quy14lrDz/JzuTCbVtXZfAXzBOujROE4eXXvfPcUx+MDM5DIov9HD3WSHjbIe07zhh/5
 hZYw==
X-Gm-Message-State: AO0yUKXwazL78fG0MW3Q6eMozsS56bas0Mc2ybVN0He4w99oAQl8pGwB
 iP9oEsw0hdYf1z0O6XarTNbH9Xs4Sdj87CpM49Imiw==
X-Google-Smtp-Source: AK7set/M6L3cGsH8RNcssOntfvNC0XB5V6haHO665b7Cqj1EORXSuOGvjCtdSM/1fIzUl6EdfHplzddWvGo+eBpTMX8=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr909010pfb.48.1675786567983; Tue, 07
 Feb 2023 08:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-12-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 16:15:56 +0000
Message-ID: <CAFEAcA9D1KWX1YKx45zR6Rxco=empC8TxK_NaHGkcvsXrgQ=BQ@mail.gmail.com>
Subject: Re: [PATCH 11/22] target/arm: Pipe ARMSecuritySpace through ptw.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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

On Tue, 24 Jan 2023 at 00:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add input and output space members to S1Translate.
> Set and adjust them in S1_ptw_translate, and the
> various points at which we drop secure state.
> Initialize the space in get_phys_addr; for now
> leave get_phys_addr_with_secure considering only
> secure vs non-secure spaces.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> @@ -2825,11 +2850,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>      ARMMMUIdx s1_mmu_idx;
>
>      /*
> -     * The page table entries may downgrade secure to non-secure, but
> -     * cannot upgrade an non-secure translation regime's attributes
> -     * to secure.
> +     * The page table entries may downgrade secure to NonSecure, but

"Secure" (just for consistency of capitalization)

> +     * cannot upgrade a NonSecure translation regime's attributes
> +     * to Secure or Realm.
>       */
>      result->f.attrs.secure = is_secure;
> +    result->f.attrs.space = ptw->in_space;
>
>      switch (mmu_idx) {
>      case ARMMMUIdx_Phys_S:

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


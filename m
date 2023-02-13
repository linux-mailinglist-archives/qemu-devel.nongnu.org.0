Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCB694BFA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbIe-0001bG-Ev; Mon, 13 Feb 2023 11:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbIb-0001aU-KV
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:03:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbIY-0003dg-TW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:03:25 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso1562841pjb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676304201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X80PbizfnDoldN/bOQ71iNj5f/kcVkBtU3toBDbvYEg=;
 b=jo33h4Dk+4JXqeI5hn2Qr1xrN3Me03Tc3YBGo39/JoIsg4jyRiCWZ7z94BLa/N6fL7
 bEvi0GPN+pCJiY6BAcYWjCgKFvYH22qpOC+7fcjpqhEFQ20zW5PuDgCShqHCVZ5q9GmZ
 se5Cx3czy8wwuCTkVQQC5TwOjrJmx2clg3HBZ8Mg3JhzX0Gb9FSIZ04QUOl/PyOpCFmX
 CGUfVpQJ0kLamV8jAupOFWsHjvQCda6MZPzW4ekWtiK6MNQrT565Z7TcF2lPaRvhB33D
 aoi+CACj54iWF7DIV0U75O/kgfz/4D58q4XPc/720m/TJFP/0pVcsYx6IxEMjNeH1C5K
 Y1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676304201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X80PbizfnDoldN/bOQ71iNj5f/kcVkBtU3toBDbvYEg=;
 b=iylKjJUBeTRaMNHCRJ7SX02Bm1Zo7yqPX2+XAVclF3LVw0jZ5Ii/DPf4zDV7RKtjR1
 HLoKoR9eGWK4yr2WYdDWldRPxg76dlaWx84X6cTOmWBRsiz098vYIJ3vQIK/SJXCwTD+
 gHjV4pU2AOr2sCo8nm3pyHA8LDnm48fukFehH4xpWWLNCAQR39Ci6DeRrpjwMeBa22x2
 kTFEvV2JhSt1lItapjKecOi9B0Tvn1dFEPMvSLxO3d6bdeBHCf9vL8BNSg6gHMZzkm1Q
 ZI9mixkrIRlNVHViJMDM9hU8FITNBxbnN2590KN/7QOWU1Ex9wbV8PPA/9ih0rRhyZeS
 IPvw==
X-Gm-Message-State: AO0yUKU+HyzE/M8WKfEi+yhN+eegNBR6fp3D6VjdXcuhslvyPjacz2mA
 Se0n/bxFFrWvTEDK4uE3dZ6zoeagU+ZcimvBQ1G6IWpT9WbIyw==
X-Google-Smtp-Source: AK7set98ERjw/vRTBKXftGE4gBcuia4g58eCT/cvcClGMfRVrL6i5+hqO9u4Xo0E6MJ0ZjRswl5fgLLzp1paZI+8VRU=
X-Received: by 2002:a17:902:7c8e:b0:198:ef8f:4d89 with SMTP id
 y14-20020a1709027c8e00b00198ef8f4d89mr5799614pll.15.1676304200737; Mon, 13
 Feb 2023 08:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-2-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-2-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:03:09 +0000
Message-ID: <CAFEAcA88sBjZFVzw_cChm18nXLJd4DA0QbadvaAPAJMQNJm1iw@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>


> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index d0483bf051..a0c9bea06b 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -282,8 +282,8 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
>  static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
>                                   uint64_t modifier, ARMPACKey key)
>  {
> -    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
> -        return pauth_computepac_architected(data, modifier, key);
> +    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
> +        return pauth_computepac_architected(data, modifier, key, false);
>      } else {
>          return pauth_computepac_impdef(data, modifier, key);
>      }
> --
> 2.25.1

Just noticed -- this should I guess be in a later patch, because
it's added an extra argument to the function call without changing
the function definition or declaration, so I think this patch
won't compile as-is.

-- PMM


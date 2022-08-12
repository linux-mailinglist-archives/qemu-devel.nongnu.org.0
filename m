Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3C59143B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXta-0000Q0-9A
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMXZh-0002jt-P5
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:31:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMXZg-0000PV-4O
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:31:53 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id b144so2232953yba.13
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EKUCmZ2o55rayFYvbyN7ScQTJ/yPWqRuqFY/2vQ1xE0=;
 b=NeYmXW+NcVBlLAzhN7rc7RvKQ5GmeTsZ5OBK5VzG+Xix71dp9EP+43HLKahU5mxE3u
 ghqV72AQm3DMO2nG8lAlJgMan/a8tKvTP9h9lQsRUgLb9Darah35Skn8zchid7zT+rG9
 dYFIXRf7gflvPzy3VFi8PnWiY49wdDxM/tunbUPoRfpkbZd2JM3hBOUynzfETrcG94Wu
 cei05m1varLxzu7bJO4QD/VjKCvw0sOOJxrvLqja7x+QciR4ndv95sRicnbFDK8qWkAH
 G2ZRVrfxWS5NqyWCvB2Rjpr9Rzz/LkRscmi/XWHN63MM4U7V2y6ODOQ3pRKMD7yaAJEC
 7F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EKUCmZ2o55rayFYvbyN7ScQTJ/yPWqRuqFY/2vQ1xE0=;
 b=Wu1FnEdu2UgZgDtfJ2RU16hdqeG2ovZsTKrqvZmcVqxJRVlQHMnug8mscXXqnx5W9c
 cT6KW7dr1YGuPJNAhoMZ+PwXtls7XX+jnmSmm+gFLOrP1mi8lLxcSkdAXWc10A9TM26E
 GFQHvWMs3WH8QDncH5Z2riv+M3oW1NnYwdEnPTKELxypVG2vGtpk2uzSffsiy+8iR/hF
 tazqxE0b3UmX79wXPwHo/R9UGtCVR5uBFJ/S06TsMDKTz/mR0Oc761XhD66O1UQYMhmD
 Muq6g7whqdIZMd0iUrnAexMSBT63pBJakdBGhPrleYvbcD4Wv/dFfN+bli8n2E/H8Cdd
 bjvg==
X-Gm-Message-State: ACgBeo26bx6uYhbD+qqW6GgVpC/lFMxvN+Vx8SG50a+1MM//x8iMZnY4
 0b6H5W/U49cZIvNQv5NPh9VMpllskm1GYmSe45JvZw==
X-Google-Smtp-Source: AA6agR7M0dqznfpwNqBl0RwGPQZP0n/JDUpWBpjEgp2SQnOq9Bf0pW7vc54mWayerusKpr/sDOEtYionOrj+ONj6IYo=
X-Received: by 2002:a5b:10:0:b0:684:2180:a637 with SMTP id
 a16-20020a5b0010000000b006842180a637mr1592714ybp.85.1660321911086; 
 Fri, 12 Aug 2022 09:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 17:31:40 +0100
Message-ID: <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).

> Richard Henderson (62):
>   accel/tcg: Introduce PageEntryExtra
>   target/arm: Enable PageEntryExtra
>   target/arm: Fix MTE check in sve_ldnfff1_r
>   target/arm: Record tagged bit for user-only in sve_probe_page
>   target/arm: Use PageEntryExtra for MTE
>   target/arm: Use PageEntryExtra for BTI
>   include/exec: Remove target_tlb_bitN from MemTxAttrs
>   target/arm: Create GetPhysAddrResult
>   target/arm: Fix ipa_secure in get_phys_addr
>   target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v6
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
>   target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
>   target/arm: Remove is_subpage argument to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to v8m_security_lookup
>   target/arm: Add is_secure parameter to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to get_phys_addr_v5
>   target/arm: Add is_secure parameter to get_phys_addr_v6
>   target/arm: Add secure parameter to get_phys_addr_pmsav8
>   target/arm: Add is_secure parameter to pmsav7_use_background_region
>   target/arm: Add is_secure parameter to get_phys_addr_lpae
>   target/arm: Add is_secure parameter to get_phys_addr_pmsav7
>   target/arm: Add is_secure parameter to regime_translation_disabled
>   target/arm: Add is_secure parameter to get_phys_addr_pmsav5

Is it possible to rearrange this patchset so the easy
refactoring patches that do "use a struct to return
values from get_phys_addr and friends" are at the front
(ie before the stuff that touches core code) ?
That way they're easy to take into the tree early while
the rest of the series is still under review...

thanks
-- PMM


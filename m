Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548532DAD5C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:36:51 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9ZS-0005Rg-AP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9VU-0001T4-Lb; Tue, 15 Dec 2020 07:32:44 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9VR-0007P6-Ns; Tue, 15 Dec 2020 07:32:43 -0500
Received: by mail-il1-x141.google.com with SMTP id u12so18956405ilv.3;
 Tue, 15 Dec 2020 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fYEZJR8qaaO5Oyy5/+LEGFBxyAgNb7vXeKpC77BOp+E=;
 b=sBTkMgjak/YBF8tojfPLy6RnHuefVip1AnwWTjUBUKD0L+ZvbWDbEV+gn3Bip+MazV
 bfzqLh5R4TYnxam3BmoiiuhkLZm5/pqAsCcQAPtxh1IDX+SrNuM2S2roqxlOf/oZ271P
 HPii4l+fwsuOolm1uNAurRDUnG4nEGT66aMaTvtpkw44LmIz9vmMUPd9KPp4v1j6fprr
 +Ht0KWOafDX1oDrB3n5Vc4vO2/zQq/J1bLY4551pnj8lyp8ldiQK47Yu077t2bH53qHP
 xUyhOGigYzZfgXUgWSDsMt5eR+ktE0O+hJLjvA7+WMVlHA2SrG3nMiTKjHaP6GYF58JE
 lBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYEZJR8qaaO5Oyy5/+LEGFBxyAgNb7vXeKpC77BOp+E=;
 b=uSaHtJxY13Wb8owhrp8CLPL+uNZkGpYbVBeszyP3vlB0XIYGnBmyAnSZqsF0wS+aI8
 lJghA8KATet4sKlvP1g2wl8v+fCL5jwJ3Op8fpZTYGVPZp4vmdY26N26agkSl4DZZ43Z
 Or1FhnSaMQO7ZidvKV+jdUDJMaKvIinqDzP1cMQy8IQCmhgNoWLalcHToKJMuwHeBza2
 dLK9LuLse+N69B9o2Z+npgCtRSvct4vte2eXwsQ0UlwB8uFiE+ujVONINTznhIofRHrg
 yIoCmCOrirntnjhlQix2zCTSLKKAC4EuNv0pa/OONYeVyDSnfzeH4jERTYtqSla3SiRp
 pGWw==
X-Gm-Message-State: AOAM530Ab5gHBw+PBOEXUijlhbtKNdolcV4zhhDemG3kaKVNOmh/F8mK
 vxA/Etc1RoIADIyomqvHcYV20oEpTnPpBy78db4=
X-Google-Smtp-Source: ABdhPJyv9+5zDrhzw8TLZ1TWRN8dN0U3Eaoppww1ED1BAQzCBg+BHT9ChbJvBayhxwBzPS/dn4Wyjw6ca5+aU7k5iLE=
X-Received: by 2002:a05:6e02:104b:: with SMTP id
 p11mr41499536ilj.241.1608035557878; 
 Tue, 15 Dec 2020 04:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-6-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-6-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 15 Dec 2020 13:32:27 +0100
Message-ID: <CABoDooMTrk0eNwH+tJ6u2zagup9bf5vaBYbXkcMO8qwaYiVD9A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/arm: add aarch32 ID register fields to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 12:52 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> Add entries present in ARM DDI 0487F.c (August 2020).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index efa977eaca..fb81eed776 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1823,6 +1823,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
>  FIELD(ID_ISAR6, FHM, 8, 4)
>  FIELD(ID_ISAR6, SB, 12, 4)
>  FIELD(ID_ISAR6, SPECRES, 16, 4)
> +FIELD(ID_ISAR6, BF16, 20, 4)
> +FIELD(ID_ISAR6, I8MM, 24, 4)
>
>  FIELD(ID_MMFR0, VMSA, 0, 4)
>  FIELD(ID_MMFR0, PMSA, 4, 4)
> @@ -1833,6 +1835,24 @@ FIELD(ID_MMFR0, AUXREG, 20, 4)
>  FIELD(ID_MMFR0, FCSE, 24, 4)
>  FIELD(ID_MMFR0, INNERSHR, 28, 4)
>
> +FIELD(ID_MMFR1, L1HVDVA, 0, 4)
> +FIELD(ID_MMFR1, L1UNIVA, 4, 4)
> +FIELD(ID_MMFR1, L1HVDSW, 8, 4)
> +FIELD(ID_MMFR1, L1UNISW, 12, 4)
> +FIELD(ID_MMFR1, L1HVD, 16, 4)
> +FIELD(ID_MMFR1, L1UNI, 20, 4)
> +FIELD(ID_MMFR1, L1TSTCLN, 24, 4)
> +FIELD(ID_MMFR1, BPRED, 28, 4)
> +
> +FIELD(ID_MMFR2, L1HVDFG, 0, 4)
> +FIELD(ID_MMFR2, L1HVDBG, 4, 4)
> +FIELD(ID_MMFR2, L1HVDRNG, 8, 4)
> +FIELD(ID_MMFR2, HVDTLB, 12, 4)
> +FIELD(ID_MMFR2, UNITLB, 16, 4)
> +FIELD(ID_MMFR2, MEMBARR, 20, 4)
> +FIELD(ID_MMFR2, WFISTALL, 24, 4)
> +FIELD(ID_MMFR2, HWACCFLG, 28, 4)
> +
>  FIELD(ID_MMFR3, CMAINTVA, 0, 4)
>  FIELD(ID_MMFR3, CMAINTSW, 4, 4)
>  FIELD(ID_MMFR3, BPMAINT, 8, 4)
> @@ -1851,6 +1871,8 @@ FIELD(ID_MMFR4, LSM, 20, 4)
>  FIELD(ID_MMFR4, CCIDX, 24, 4)
>  FIELD(ID_MMFR4, EVT, 28, 4)
>
> +FIELD(ID_MMFR5, ETS, 0, 4)
> +
>  FIELD(ID_PFR0, STATE0, 0, 4)
>  FIELD(ID_PFR0, STATE1, 4, 4)
>  FIELD(ID_PFR0, STATE2, 8, 4)
> @@ -1869,6 +1891,10 @@ FIELD(ID_PFR1, SEC_FRAC, 20, 4)
>  FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
>  FIELD(ID_PFR1, GIC, 28, 4)
>
> +FIELD(ID_PFR2, CSV3, 0, 4)
> +FIELD(ID_PFR2, SSBS, 4, 4)
> +FIELD(ID_PFR2, RAS_FRAC, 8, 4)
> +
>  FIELD(ID_AA64ISAR0, AES, 4, 4)
>  FIELD(ID_AA64ISAR0, SHA1, 8, 4)
>  FIELD(ID_AA64ISAR0, SHA2, 12, 4)
> @@ -1983,6 +2009,8 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
>  FIELD(ID_DFR0, PERFMON, 24, 4)
>  FIELD(ID_DFR0, TRACEFILT, 28, 4)
>
> +FIELD(ID_DFR1, MTPMU, 0, 4)
> +
>  FIELD(DBGDIDR, SE_IMP, 12, 1)
>  FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
>  FIELD(DBGDIDR, VERSION, 16, 4)
> --
> 2.20.1
>
>


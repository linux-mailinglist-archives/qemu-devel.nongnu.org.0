Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1A43AC80
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:57:23 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGOd-0007ZG-5m
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFXR-00020J-Hn; Tue, 26 Oct 2021 02:02:22 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFXN-0001KH-TC; Tue, 26 Oct 2021 02:02:21 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 40ADF79FEE;
 Tue, 26 Oct 2021 06:02:16 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdh6v6v3Tz3LVf;
 Tue, 26 Oct 2021 06:02:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C290AC372;
 Tue, 26 Oct 2021 06:02:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id h20so13985844qko.13;
 Mon, 25 Oct 2021 23:02:15 -0700 (PDT)
X-Gm-Message-State: AOAM532/GR6k95IPErW+fONzrn81GtsViQ1+SL3tmb4dzm14dWWZGc4o
 T5Ui2BO+XLxsx2FGg2JocqEgo6wzcsPZC+qEVzg=
X-Google-Smtp-Source: ABdhPJx6jG+WbuQMMdKif6AISMtrNVsf+QgTb5QkaQ9qp2XAEcYqt1KNCoUMn5+f9qTD+1l2rkeUMwvUZHBBb2NwSfk=
X-Received: by 2002:a37:a956:: with SMTP id s83mr17277743qke.244.1635228135408; 
 Mon, 25 Oct 2021 23:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-16-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-16-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:02:04 -0500
X-Gmail-Original-Message-ID: <CACNAnaGM0+QkXf7_PEeXkZGBD_ePpEOWgQy7qiPsbdVY8VB6UQ@mail.gmail.com>
Message-ID: <CACNAnaGM0+QkXf7_PEeXkZGBD_ePpEOWgQy7qiPsbdVY8VB6UQ@mail.gmail.com>
Subject: Re: [PATCH 15/24] bsd-user/arm/target_arch_elf.h: arm get hwcap
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement get_elf_hwcap to get the first word of hardware capabilities.
>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_elf.h | 72 +++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
> index 15b5c66511..02d25b8926 100644
> --- a/bsd-user/arm/target_arch_elf.h
> +++ b/bsd-user/arm/target_arch_elf.h
> @@ -31,6 +31,76 @@
>  #define USE_ELF_CORE_DUMP
>  #define ELF_EXEC_PAGESIZE       4096
>
> -#define ELF_HWCAP 0
> +#define ELF_HWCAP get_elf_hwcap()
> +
> +#define GET_FEATURE(feat, hwcap) \
> +    do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
> +
> +#define GET_FEATURE_ID(feat, hwcap) \
> +    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
> +
> +enum {
> +    ARM_HWCAP_ARM_SWP       = 1 << 0,
> +    ARM_HWCAP_ARM_HALF      = 1 << 1,
> +    ARM_HWCAP_ARM_THUMB     = 1 << 2,
> +    ARM_HWCAP_ARM_26BIT     = 1 << 3,
> +    ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
> +    ARM_HWCAP_ARM_FPA       = 1 << 5,
> +    ARM_HWCAP_ARM_VFP       = 1 << 6,
> +    ARM_HWCAP_ARM_EDSP      = 1 << 7,
> +    ARM_HWCAP_ARM_JAVA      = 1 << 8,
> +    ARM_HWCAP_ARM_IWMMXT    = 1 << 9,
> +    ARM_HWCAP_ARM_CRUNCH    = 1 << 10,
> +    ARM_HWCAP_ARM_THUMBEE   = 1 << 11,
> +    ARM_HWCAP_ARM_NEON      = 1 << 12,
> +    ARM_HWCAP_ARM_VFPv3     = 1 << 13,
> +    ARM_HWCAP_ARM_VFPv3D16  = 1 << 14,
> +    ARM_HWCAP_ARM_TLS       = 1 << 15,
> +    ARM_HWCAP_ARM_VFPv4     = 1 << 16,
> +    ARM_HWCAP_ARM_IDIVA     = 1 << 17,
> +    ARM_HWCAP_ARM_IDIVT     = 1 << 18,
> +    ARM_HWCAP_ARM_VFPD32    = 1 << 19,
> +    ARM_HWCAP_ARM_LPAE      = 1 << 20,
> +    ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
> +};
> +
> +static uint32_t get_elf_hwcap(void)
> +{
> +    ARMCPU *cpu = ARM_CPU(thread_cpu);
> +    uint32_t hwcaps = 0;
> +
> +    hwcaps |= ARM_HWCAP_ARM_SWP;
> +    hwcaps |= ARM_HWCAP_ARM_HALF;
> +    hwcaps |= ARM_HWCAP_ARM_THUMB;
> +    hwcaps |= ARM_HWCAP_ARM_FAST_MULT;
> +
> +    /* probe for the extra features */
> +    /* EDSP is in v5TE and above */
> +    GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
> +    GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
> +    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
> +    GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
> +    GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
> +    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
> +    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
> +    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
> +    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
> +
> +    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
> +        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
> +        hwcaps |= ARM_HWCAP_ARM_VFPv3;
> +        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
> +            hwcaps |= ARM_HWCAP_ARM_VFPD32;
> +        } else {
> +            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
> +        }
> +    }
> +    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
> +
> +    return hwcaps;
> +}
> +
> +#undef GET_FEATURE
> +#undef GET_FEATURE_ID
>
>  #endif /* _TARGET_ARCH_ELF_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>


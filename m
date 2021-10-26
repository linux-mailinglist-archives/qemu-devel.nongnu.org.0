Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15043AC2F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:17:52 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfFmP-0005s9-SY
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFY8-0002Hi-6E; Tue, 26 Oct 2021 02:03:04 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFXy-0001MK-2c; Tue, 26 Oct 2021 02:03:03 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 470407A47E;
 Tue, 26 Oct 2021 06:02:51 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdh7b0B6Sz3Lqw;
 Tue, 26 Oct 2021 06:02:51 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id DB207D289;
 Tue, 26 Oct 2021 06:02:50 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f51.google.com with SMTP id d6so8822827qvb.3;
 Mon, 25 Oct 2021 23:02:50 -0700 (PDT)
X-Gm-Message-State: AOAM530nUBScaWsIaZbC1qG85MBXav0n9uxB8MSDO8ICGa1+OcIyfIhp
 2v6EL/VzjduYUQCtOsalkbBsDHPFRLyOVcDGQwU=
X-Google-Smtp-Source: ABdhPJxPZI04DzaTyjs0oENw7TJ+tFX2PCPsX5c6e7o2HS8nO/H9DJwJY07/xmq70eVKFmt7P2c4dmLjMvwqTiX6yC0=
X-Received: by 2002:ad4:5966:: with SMTP id eq6mr20846496qvb.64.1635228170591; 
 Mon, 25 Oct 2021 23:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-17-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-17-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:02:39 -0500
X-Gmail-Original-Message-ID: <CACNAnaHx_sOt8=C5PDZZ1x63A3k1Lkpd2xH63M6xeOzLt6aaSQ@mail.gmail.com>
Message-ID: <CACNAnaHx_sOt8=C5PDZZ1x63A3k1Lkpd2xH63M6xeOzLt6aaSQ@mail.gmail.com>
Subject: Re: [PATCH 16/24] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement the extended HW capabilities for HWCAP2.
>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_elf.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
> index 02d25b8926..4a0215d02e 100644
> --- a/bsd-user/arm/target_arch_elf.h
> +++ b/bsd-user/arm/target_arch_elf.h
> @@ -32,6 +32,7 @@
>  #define ELF_EXEC_PAGESIZE       4096
>
>  #define ELF_HWCAP get_elf_hwcap()
> +#define ELF_HWCAP2 get_elf_hwcap2()
>
>  #define GET_FEATURE(feat, hwcap) \
>      do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
> @@ -64,6 +65,14 @@ enum {
>      ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
>  };
>
> +enum {
> +    ARM_HWCAP2_ARM_AES      = 1 << 0,
> +    ARM_HWCAP2_ARM_PMULL    = 1 << 1,
> +    ARM_HWCAP2_ARM_SHA1     = 1 << 2,
> +    ARM_HWCAP2_ARM_SHA2     = 1 << 3,
> +    ARM_HWCAP2_ARM_CRC32    = 1 << 4,
> +};
> +
>  static uint32_t get_elf_hwcap(void)
>  {
>      ARMCPU *cpu = ARM_CPU(thread_cpu);
> @@ -100,6 +109,19 @@ static uint32_t get_elf_hwcap(void)
>      return hwcaps;
>  }
>
> +static uint32_t get_elf_hwcap2(void)
> +{
> +    ARMCPU *cpu = ARM_CPU(thread_cpu);
> +    uint32_t hwcaps = 0;
> +
> +    GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
> +    GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
> +    GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
> +    GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
> +    GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
> +    return hwcaps;
> +}
> +
>  #undef GET_FEATURE
>  #undef GET_FEATURE_ID
>
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>


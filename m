Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F065931344D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 15:04:00 +0100 (CET)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l978s-00031I-0T
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 09:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l92ED-00047Q-MK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:49:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l92Dm-00074g-Sz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:48:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id u14so16117121wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 00:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ib/WMUU6le7YHu6cgh+/bOmwNxz6LnCOXsegbw1ypc4=;
 b=q63EbRPiEIvSv+eccMlVvtodPx9Nf9RgavB/wG6ke6VhNOk0xmkl9WH+jgN4sjzYEz
 rSLT+wGDeCY+I3cCarE+eYfdZurQs4i/QhDeWLyM3084KqJSlE2sBIuqDqpnUCVPD9sB
 xfnvH4TL+vG7SWCwMU24r6d3ZCyUzf/BOifk6cglSM/Y6Gl749rKuIKyX06U2HeF40hZ
 sLBwnCIWlUYAB6R1mCGgdBDRyftDYHd82OdXiH2PEJUMZgiR81x2GCm9n0sCAxnBtyuG
 n8289+brGc9rd58SfvF6cu3SmX6fmOzaZlxhqLBqb8np6pCnMa0SYVgSszqMp4J2pP3X
 tX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ib/WMUU6le7YHu6cgh+/bOmwNxz6LnCOXsegbw1ypc4=;
 b=mCjCr1ZCfFh7MT/OMoUnhMjuq5AFFSLrWe1OJNl0DR4FTCBGAyTGtdZdPkxZ7wDJKG
 vP7HXmdefADxwrZ5y39S2QXGbYgB2DW7aOAMilHJJTgXpum293Ptq5SD0Vosrw/KifPe
 XkzAqAxqfCJzp4VAHfYAgFogF8H25BOEMf21mFXGLq/L0PdF7WFdvOh5mtUCiBYYJltY
 Ky+e5ecJTzWcBaCcfUNi3g8SkWCLIP2dcpPT6dzx0GYk6D3baFzRfTrh/wmihQJcjF4I
 p7jdhAghnbQF1KYjy/9ELctDCxsoRh0YU5Mv6aehQe1y6KrE/koNXHvA832w2oaOYfsp
 rfdw==
X-Gm-Message-State: AOAM5300EZ7Zqb7gdcfDGkUtmWKY6LMqznXMTDOMGYarJh/dtJZMvafi
 6qySVjnStve27nRpinsh3mJeCw==
X-Google-Smtp-Source: ABdhPJxjv3j/FmzxQZt378MrdXLAixEbC5XednK2m4ZcKjgAKTe3OLaTGWeGsnbCIzIlazlImmkmOg==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr19562474wrn.382.1612774103948; 
 Mon, 08 Feb 2021 00:48:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e4sm27559080wrw.96.2021.02.08.00.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 00:48:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE51B1FF7E;
 Mon,  8 Feb 2021 08:48:21 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
Date: Mon, 08 Feb 2021 08:42:57 +0000
In-reply-to: <20210207232310.2505283-6-f4bug@amsat.org>
Message-ID: <87im73aqsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> What this code does is out of my league, but refactoring it allow
> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
> patch.

The assertion that the table entry is current is just a simple
housekeeping one. The details of how the MTE implementation uses
(abuses?) the iotlb entries requires a closer reading of the code.

> ---
>  include/exec/exec-all.h |  9 +++++++++
>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>  target/arm/mte_helper.c | 11 ++---------
>  target/arm/sve_helper.c | 10 ++--------
>  4 files changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index f933c74c446..c5e8e355b7f 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_u=
long vaddr,
>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
> +
> +/*
> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
> + * because we just found the mapping.
> + */
> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_m=
mu_idx,
> +                                            uint64_t ptr,
> +                                            MMUAccessType ptr_access,
> +                                            uintptr_t index);

Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
case so we can eliminate the call to an empty function.

>  #else
>  static inline void tlb_init(CPUState *cpu)
>  {
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 8a7b779270a..a6247da34a0 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>  }
>=20=20
> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_m=
mu_idx,
> +                                            uint64_t ptr,
> +                                            MMUAccessType ptr_access,
> +                                            uintptr_t index)
> +{
> +#ifdef CONFIG_DEBUG_TCG
> +    CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
> +    target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
> +                               ? entry->addr_read
> +                               : tlb_addr_write(entry));
> +    g_assert(tlb_hit(comparator, ptr));
> +#endif
> +}
> +
>  static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
>                                        target_ulong page, target_ulong ma=
sk)
>  {
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 6cea9d1b506..f47d3b4570e 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env,=
 int ptr_mmu_idx,
>       * matching tlb entry + iotlb entry.
>       */
>      index =3D tlb_index(env, ptr_mmu_idx, ptr);
> -# ifdef CONFIG_DEBUG_TCG
> -    {
> -        CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
> -        target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
> -                                   ? entry->addr_read
> -                                   : tlb_addr_write(entry));
> -        g_assert(tlb_hit(comparator, ptr));
> -    }
> -# endif
> +    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
> +                                           ptr_access, index);
>      iotlbentry =3D &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
>=20=20
>      /* If the virtual page MemAttr !=3D Tagged, access unchecked. */
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index c8cdf7618eb..a5708da0f2f 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bool=
 nofault,
>      {
>          uintptr_t index =3D tlb_index(env, mmu_idx, addr);
>=20=20
> -# ifdef CONFIG_DEBUG_TCG
> -        CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, addr);
> -        target_ulong comparator =3D (access_type =3D=3D MMU_DATA_LOAD
> -                                   ? entry->addr_read
> -                                   : tlb_addr_write(entry));
> -        g_assert(tlb_hit(comparator, addr));
> -# endif
> -
> +        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
> +                                               access_type, index);
>          CPUIOTLBEntry *iotlbentry =3D &env_tlb(env)->d[mmu_idx].iotlb[in=
dex];
>          info->attrs =3D iotlbentry->attrs;
>      }

with the inline fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE116142C2B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:35:30 +0100 (CET)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXDF-0001Lt-V7
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itXC0-0000oN-AN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:34:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itXBz-0004QS-5x
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:34:12 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53271)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itXBy-0004PO-UN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:34:11 -0500
Received: by mail-wm1-x342.google.com with SMTP id m24so14503771wmc.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 05:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=36I1afLaasvc8t8RZQBjBzDxxBnL7AdUroXH6Xfhdg0=;
 b=gbKt6kfYkHz9ocanVDbmqVFqmEC1xpdsGdKysT3vPXVHdgj2+QKMIek3E28UKG102/
 z5UxIzBFAicn87eRKZcJx1wF6ksIAHAYDDxDqJjkTeQannYIzW218ELGdIGb+EkHbg7l
 jCv4JC0FS6j3A1GHd6VjqtEZuHJdTkv3t2Hsh1SepgV0Fde9Da48OQi2BGiy9Nvb3vxL
 5z9gKzK747CCgvSvdPZiCnvCqEiCLyXjOOMV+CCcm/7xG6PSZRlF5hBbqzrMMUzcKSaJ
 sL+8YOOcZu80etYSoA9BP5M/bRdx9Ji9fXeXdIxJM2R7F30zB39IftsG2xZVbdfdb82/
 cfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=36I1afLaasvc8t8RZQBjBzDxxBnL7AdUroXH6Xfhdg0=;
 b=DFH1L33yz1gkob4Y/dNRjVkmteim+xwNbGZgfDwVn6ggpa7M7ejvvOsbT/OV6mqzre
 mLZXGwgndNKtgkCB1S+s7CgJcQ+Ce/DnSBaDYgHy+aaqdcKll2IWOzM6T+45ZDJGPcr5
 /QbfJJ520cJWfh1BmCZnxMTjAJo1wbyTrLxvu4Kb6PyBE59FIOy4k0VY6v9oxqE1Iz8w
 D7vmiTl8AptIL7/pa6GojAZHLJMMP3Ue0tY0PWoogpFie7s4nKtrSEKFRmOtvCRt1Dd5
 nEJ9KoJ6+MmcwHnVbrdZHsaotckopgjiJ8FC6xQ8oqNoPLLQ/iPlKVQfsPcLslLnCL70
 DHhw==
X-Gm-Message-State: APjAAAX4yyTMxwSX4yVZnwKa56mQKzUl0cXNfDM1kjIPABwfU+jiqxxK
 JvKpQEpnrI7XkFZ0T0Y2cIg9hg==
X-Google-Smtp-Source: APXvYqxAEgHW32o7XZwFF92qEnt9HGmyR338BbG67dgQZURd5gjK64p55x8qUlUFoT5gnuKz4yqaBA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr18871876wmb.0.1579527249222; 
 Mon, 20 Jan 2020 05:34:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p18sm23147050wmb.8.2020.01.20.05.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 05:34:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21A881FF87;
 Mon, 20 Jan 2020 13:34:07 +0000 (GMT)
References: <20200109024907.2730-1-richard.henderson@linaro.org>
 <20200109024907.2730-2-richard.henderson@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/9] cputlb: Merge tlb_table_flush_by_mmuidx into
 tlb_flush_one_mmuidx_locked
In-reply-to: <20200109024907.2730-2-richard.henderson@linaro.org>
Date: Mon, 20 Jan 2020 13:34:07 +0000
Message-ID: <87pnfe2qwg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There is only one caller for tlb_table_flush_by_mmuidx.  Place
> the result at the earlier line number, due to an expected user
> in the near future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  accel/tcg/cputlb.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a991ea2964..1a81886e58 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -224,11 +224,16 @@ static void tlb_mmu_resize_locked(CPUArchState *env=
, int mmu_idx)
>      }
>  }
>=20=20
> -static inline void tlb_table_flush_by_mmuidx(CPUArchState *env, int mmu_=
idx)
> +static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
>  {
>      tlb_mmu_resize_locked(env, mmu_idx);
> -    memset(env_tlb(env)->f[mmu_idx].table, -1, sizeof_tlb(env, mmu_idx));
>      env_tlb(env)->d[mmu_idx].n_used_entries =3D 0;
> +    env_tlb(env)->d[mmu_idx].large_page_addr =3D -1;
> +    env_tlb(env)->d[mmu_idx].large_page_mask =3D -1;
> +    env_tlb(env)->d[mmu_idx].vindex =3D 0;
> +    memset(env_tlb(env)->f[mmu_idx].table, -1, sizeof_tlb(env, mmu_idx));
> +    memset(env_tlb(env)->d[mmu_idx].vtable, -1,
> +           sizeof(env_tlb(env)->d[0].vtable));
>  }
>=20=20
>  static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t m=
mu_idx)
> @@ -289,16 +294,6 @@ void tlb_flush_counts(size_t *pfull, size_t *ppart, =
size_t *pelide)
>      *pelide =3D elide;
>  }
>=20=20
> -static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
> -{
> -    tlb_table_flush_by_mmuidx(env, mmu_idx);
> -    env_tlb(env)->d[mmu_idx].large_page_addr =3D -1;
> -    env_tlb(env)->d[mmu_idx].large_page_mask =3D -1;
> -    env_tlb(env)->d[mmu_idx].vindex =3D 0;
> -    memset(env_tlb(env)->d[mmu_idx].vtable, -1,
> -           sizeof(env_tlb(env)->d[0].vtable));
> -}
> -
>  static void tlb_flush_by_mmuidx_async_work(CPUState *cpu, run_on_cpu_dat=
a data)
>  {
>      CPUArchState *env =3D cpu->env_ptr;


--=20
Alex Benn=C3=A9e


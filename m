Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ECB142DE3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:43:33 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYH6-0002Zz-BS
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itY7o-0008N6-IF
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:33:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itY7n-0005tn-Cd
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:33:56 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46395)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itY7n-0005tF-65
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:33:55 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so29753990wrl.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 06:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OrS29nHuqMvog06bNTk5Jqed9OQgl9PaFnJbYfvAjnY=;
 b=ZE7zrGVfMqUuvxgfX8w5Tl1MXfsO4e+66EQkgYLSbE3CIN0ICdHq05iYVdZi696U6+
 NE8hm+jGSMEBF6syoNEzj6ffplTMNzine/Nb/iHKajG+ms1TFPHNHwYdJlChXt+9DnsA
 kyvcvEL+r7bPSkvdiZdDsS4f7VUULLdRRE32VRjvY57TVbLjVk74wnM7i0S4wgvfZCfr
 k7tilzhuCa06zBDYRABqV936mNOUHgJTPnMA7mYDAssje3n5b/ThcpE6jI1SPxlVgBaa
 Dz1WEHd/KJyhSEOaP014O6Q+wEbqDAWdnFzAZcCNUEg7noOtxEa7R/s57MAqMHWdtLp/
 c0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OrS29nHuqMvog06bNTk5Jqed9OQgl9PaFnJbYfvAjnY=;
 b=RBPUiiv3NBnKr8fVUUWRLFvRz7c5wT6uTcL++UncqbM8elqBAa/k1MmsB5N3Lr3ER9
 9/yzWHfkc/+28Vm3AkD+Yf1x+b7hcw/D8/kKgbn7XO11hY/KYUoi6yYeYjc3/QjnXvZK
 Ti/3mIGebY0AYMZw4PE311UsuZmC/XTBqiujoLfwmrGBI8RiIpFYHps2QKlmqz42TWRD
 GVDP1rFoDAN7mzkZO1ZA1X7L5J6hkJr7Bo5kAw2pAQJUy1UZaETZ90rrzIg25V+synar
 Mw4g+vo1dNSVP5eSuUeH9s7PQ0zWdzZ7LWkv/RYocgOK3Pg/OO3zHuZQlAEbbKjiJvQP
 4s0A==
X-Gm-Message-State: APjAAAWzncjYzi/wEKDwiiLeLbReDzVE12z4a7uX9cRxSGZmvEJ8dU8B
 i1ZVTdUhjtYtmJ74G8LtCApF6A==
X-Google-Smtp-Source: APXvYqxdJaq+tjqwlkNjA3yZxE27RrcB8vklN/vHDwlCT/UHbutDytwO22j88xr0XdUHcUWuaHtViw==
X-Received: by 2002:adf:f308:: with SMTP id i8mr18345662wro.42.1579530833941; 
 Mon, 20 Jan 2020 06:33:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u1sm970578wmc.5.2020.01.20.06.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 06:33:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 537D71FF87;
 Mon, 20 Jan 2020 14:33:52 +0000 (GMT)
References: <20200109024907.2730-1-richard.henderson@linaro.org>
 <20200109024907.2730-9-richard.henderson@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 8/9] cputlb: Initialize tlbs as flushed
In-reply-to: <20200109024907.2730-9-richard.henderson@linaro.org>
Date: Mon, 20 Jan 2020 14:33:52 +0000
Message-ID: <87zhei19kf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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

> There's little point in leaving these data structures half initialized,
> and relying on a flush to be done during reset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  accel/tcg/cputlb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c7c34b185b..761e9d44d7 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -240,6 +240,7 @@ static void tlb_mmu_init(CPUTLBDesc *desc, CPUTLBDesc=
Fast *fast, int64_t now)
>      fast->mask =3D (n_entries - 1) << CPU_TLB_ENTRY_BITS;
>      fast->table =3D g_new(CPUTLBEntry, n_entries);
>      desc->iotlb =3D g_new(CPUIOTLBEntry, n_entries);
> +    tlb_mmu_flush_locked(desc, fast);
>  }
>=20=20
>  static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t m=
mu_idx)
> @@ -260,8 +261,8 @@ void tlb_init(CPUState *cpu)
>=20=20
>      qemu_spin_init(&env_tlb(env)->c.lock);
>=20=20
> -    /* Ensure that cpu_reset performs a full flush.  */
> -    env_tlb(env)->c.dirty =3D ALL_MMUIDX_BITS;
> +    /* All tlbs are initialized flushed. */
> +    env_tlb(env)->c.dirty =3D 0;
>=20=20
>      for (i =3D 0; i < NB_MMU_MODES; i++) {
>          tlb_mmu_init(&env_tlb(env)->d[i], &env_tlb(env)->f[i], now);


--=20
Alex Benn=C3=A9e


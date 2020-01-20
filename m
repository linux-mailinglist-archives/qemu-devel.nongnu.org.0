Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C328142C68
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:42:24 +0100 (CET)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXJv-0007nF-BG
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itXIK-0006OZ-H2
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:40:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itXIJ-0001AH-8D
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:40:44 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itXII-00018x-1B
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:40:43 -0500
Received: by mail-wr1-x441.google.com with SMTP id b6so29654131wrq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=fHrde87/BSdZVamOcVW6+hVOVFmE6NoQDdhJSFP7HSY=;
 b=zOEv8U330vxN+B38HjDfhP1E9R6KfRsiKmJCYfqtQsInmBpEiKAlsbY7jd5dqwhYmP
 A8Nbf0f2+ji+oAbkMzGy0BKoJ6XieVODB0cWnMN7mZVJJa0BdV3FUeyLa9RtNzVO0CC5
 QdvZ4Zb7pKhJTuvuc+e4kTzhDyF1q7ueUy+kP74LeCMGN8mGhXP0pVjTq/JGO40AfD1e
 C/pv71jyMwqtkw8FGl/uw5XPadzR3hZ8eiytdD2t5ToBPTvXWEC1S6eI1aW+Lgc8c0Pc
 BheQi2W0taiXdMeKDhxFOEPwvUsP5oKb+QcS89FRaHe4JUeWdxXj8FTAnZbBZwILX//N
 rYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=fHrde87/BSdZVamOcVW6+hVOVFmE6NoQDdhJSFP7HSY=;
 b=l1wSWJXILZfrcOQc93PWNkdgFuwDis5YvlJWfHiP8Y2c2/GZI7tRtxGQl9SxYMei76
 GFlqxkH8bg3pAa1tVGWrhyz0BlvJHDJE1qTuJS9jDV1U2Ix6bZAoLE8oJnhI/BOhU7pJ
 3JySEv6BSzgfRTwjwtmFhOWl/rtugR8xE4qTRb/BLFkvVJjQvm5h2ol1HDn47bqaz4El
 0itH71LH6dA8KMaNe9ebt9w9kyVnxe2u9rpcQwY8Ma9ptS39sp0AjxIVLoav+O/tzVfP
 VwuDh1FRryo1RnmI+y0MECZVaZYDr4B+NTaa4L2Jj8GBsFCj92b6y9K0MXHCg9D9gywh
 7UwQ==
X-Gm-Message-State: APjAAAVbNzLlJZZouQto9j2BivPXsLu+BM+OMeZf4sqeIsEXBj3CiTtB
 FIZWyYBZT50HXA0/3EMplxd1Qw==
X-Google-Smtp-Source: APXvYqy8KX/QGo9kflrhuV5H53S+O/oVnttmaI+UpgIavXxsYCkL/R9euW0je4rbEQ9mIZx7cEK6nA==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr19053508wrr.73.1579527640701; 
 Mon, 20 Jan 2020 05:40:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm23291128wml.31.2020.01.20.05.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 05:40:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F37E21FF87;
 Mon, 20 Jan 2020 13:40:38 +0000 (GMT)
References: <20200109024907.2730-1-richard.henderson@linaro.org>
 <20200109024907.2730-5-richard.henderson@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/9] cputlb: Hoist tlb portions in tlb_mmu_resize_locked
In-reply-to: <20200109024907.2730-5-richard.henderson@linaro.org>
Date: Mon, 20 Jan 2020 13:40:38 +0000
Message-ID: <87eevu2qll.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

> No functional change, but the smaller expressions make
> the code easier to read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  accel/tcg/cputlb.c | 35 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 49c605b6d8..c7dc1dc85a 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -115,8 +115,8 @@ static void tlb_dyn_init(CPUArchState *env)
>=20=20
>  /**
>   * tlb_mmu_resize_locked() - perform TLB resize bookkeeping; resize if n=
ecessary
> - * @env: CPU that owns the TLB
> - * @mmu_idx: MMU index of the TLB
> + * @desc: The CPUTLBDesc portion of the TLB
> + * @fast: The CPUTLBDescFast portion of the same TLB
>   *
>   * Called with tlb_lock_held.
>   *
> @@ -153,10 +153,9 @@ static void tlb_dyn_init(CPUArchState *env)
>   * high), since otherwise we are likely to have a significant amount of
>   * conflict misses.
>   */
> -static void tlb_mmu_resize_locked(CPUArchState *env, int mmu_idx)
> +static void tlb_mmu_resize_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast)
>  {
> -    CPUTLBDesc *desc =3D &env_tlb(env)->d[mmu_idx];
> -    size_t old_size =3D tlb_n_entries(&env_tlb(env)->f[mmu_idx]);
> +    size_t old_size =3D tlb_n_entries(fast);
>      size_t rate;
>      size_t new_size =3D old_size;
>      int64_t now =3D get_clock_realtime();
> @@ -198,14 +197,15 @@ static void tlb_mmu_resize_locked(CPUArchState *env=
, int mmu_idx)
>          return;
>      }
>=20=20
> -    g_free(env_tlb(env)->f[mmu_idx].table);
> -    g_free(env_tlb(env)->d[mmu_idx].iotlb);
> +    g_free(fast->table);
> +    g_free(desc->iotlb);
>=20=20
>      tlb_window_reset(desc, now, 0);
>      /* desc->n_used_entries is cleared by the caller */
> -    env_tlb(env)->f[mmu_idx].mask =3D (new_size - 1) << CPU_TLB_ENTRY_BI=
TS;
> -    env_tlb(env)->f[mmu_idx].table =3D g_try_new(CPUTLBEntry, new_size);
> -    env_tlb(env)->d[mmu_idx].iotlb =3D g_try_new(CPUIOTLBEntry, new_size=
);
> +    fast->mask =3D (new_size - 1) << CPU_TLB_ENTRY_BITS;
> +    fast->table =3D g_try_new(CPUTLBEntry, new_size);
> +    desc->iotlb =3D g_try_new(CPUIOTLBEntry, new_size);
> +
>      /*
>       * If the allocations fail, try smaller sizes. We just freed some
>       * memory, so going back to half of new_size has a good chance of wo=
rking.
> @@ -213,25 +213,24 @@ static void tlb_mmu_resize_locked(CPUArchState *env=
, int mmu_idx)
>       * allocations to fail though, so we progressively reduce the alloca=
tion
>       * size, aborting if we cannot even allocate the smallest TLB we sup=
port.
>       */
> -    while (env_tlb(env)->f[mmu_idx].table =3D=3D NULL ||
> -           env_tlb(env)->d[mmu_idx].iotlb =3D=3D NULL) {
> +    while (fast->table =3D=3D NULL || desc->iotlb =3D=3D NULL) {
>          if (new_size =3D=3D (1 << CPU_TLB_DYN_MIN_BITS)) {
>              error_report("%s: %s", __func__, strerror(errno));
>              abort();
>          }
>          new_size =3D MAX(new_size >> 1, 1 << CPU_TLB_DYN_MIN_BITS);
> -        env_tlb(env)->f[mmu_idx].mask =3D (new_size - 1) << CPU_TLB_ENTR=
Y_BITS;
> +        fast->mask =3D (new_size - 1) << CPU_TLB_ENTRY_BITS;
>=20=20
> -        g_free(env_tlb(env)->f[mmu_idx].table);
> -        g_free(env_tlb(env)->d[mmu_idx].iotlb);
> -        env_tlb(env)->f[mmu_idx].table =3D g_try_new(CPUTLBEntry, new_si=
ze);
> -        env_tlb(env)->d[mmu_idx].iotlb =3D g_try_new(CPUIOTLBEntry, new_=
size);
> +        g_free(fast->table);
> +        g_free(desc->iotlb);
> +        fast->table =3D g_try_new(CPUTLBEntry, new_size);
> +        desc->iotlb =3D g_try_new(CPUIOTLBEntry, new_size);
>      }
>  }
>=20=20
>  static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
>  {
> -    tlb_mmu_resize_locked(env, mmu_idx);
> +    tlb_mmu_resize_locked(&env_tlb(env)->d[mmu_idx], &env_tlb(env)->f[mm=
u_idx]);
>      env_tlb(env)->d[mmu_idx].n_used_entries =3D 0;
>      env_tlb(env)->d[mmu_idx].large_page_addr =3D -1;
>      env_tlb(env)->d[mmu_idx].large_page_mask =3D -1;


--=20
Alex Benn=C3=A9e


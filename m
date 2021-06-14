Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7C3A6117
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:41:03 +0200 (CEST)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsk1e-00025E-VJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsk0e-0001LX-Gh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:40:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsk0b-0006RN-Gr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:40:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so12673059wmd.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cCX8bCd21ia2df3n/pxEp+Kukgquzx/W7AofSGzbmNI=;
 b=tWU2R3isW4xfiv94k7FRKyJkXgWUutXhD7pR1SFD9uy4fw0H7psUjhoX5OdpbiWcbZ
 4CXAkiei/OnINMWslo7IgSivwWi/Ym/Fzp1dyP1O0enOz7HSxa0ZdqYwMk1mVANk9OdN
 FIVkROOX6Zp3LzkR49F1LTc+7Rbl5M5cjF83wCDQBgkqSVmPUKZUASiMdJ4AEpSrxcsc
 PFnVN2IeXo5UNHw7yZHNyanu3X+P2fX1VVS6NJ0xea8KX587M94CcbW1nJrbMJu9FJyj
 dkn1EXUP0ZO4+D9wvy8hp5ImwqNT0sFA3m5lM5tZPW4sKxGzEOAOyFoQVbGEPnOHxDG1
 Y2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cCX8bCd21ia2df3n/pxEp+Kukgquzx/W7AofSGzbmNI=;
 b=olAGn84w0O3jzmn4AJU2O6rbMM1qhV1YFrlfmj0f4Q7qcUYjveRqZFNQDkd/ioejEz
 RHRbnuza1ESOrvtq6/M3h6ey1mxuLvhZyngIPwHPq0Waz0+UCUsPJf4eVzNCmdqP0E92
 RxRqFnsq1p0HcJKOxyiSWQHYyGP8xlv+3QkJ35h/SqxjGU0JEwujUD6ddMnFrxptFVif
 233jaHaToBeXDa8+nMBohriwmrB/Kig456bIdZaj1WDWWCfYOlS767uctFmWsmUURAjJ
 BrV+yEN/BWFNzuIIFuNm33bD6HtX7i5E8cZPFf4mJhUIbGjzykxP9zbCwtNPoD1wz2co
 1utw==
X-Gm-Message-State: AOAM5308rt1fJtSDrauCFqBdsHQl1y9nvqGw+bpGveBY94v1Ui4ZXkLg
 hdLL55NhOcifvt2E6Nre13ODnA==
X-Google-Smtp-Source: ABdhPJx/5cWqJeZ2m3XtfiGHFsbBLEWfPKy+Zz82t9mofOtW8foXVv/FORkqIDKks3qlQ21AIIUVrQ==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr32071777wmk.147.1623667195640; 
 Mon, 14 Jun 2021 03:39:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm12777093wmj.36.2021.06.14.03.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 03:39:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A99A1FF7E;
 Mon, 14 Jun 2021 11:39:54 +0100 (BST)
References: <20210613002505.898859-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: Probe the proper permissions for atomic ops
Date: Mon, 14 Jun 2021 11:18:12 +0100
In-reply-to: <20210613002505.898859-1-richard.henderson@linaro.org>
Message-ID: <87lf7ck9vp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We had a single ATOMIC_MMU_LOOKUP macro that probed for
> read+write on all atomic ops.  This is incorrect for
> plain atomic load and atomic store.
>
> For user-only, we rely on the host page permissions.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/390
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
>=20=20
> -/* Probe for a read-modify-write atomic operation.  Do not allow unalign=
ed
> - * operations, or io operations to proceed.  Return the host address.  */
> +/*
> + * Probe for an atomic operation.  Do not allow unaligned operations,
> + * or io operations to proceed.  Return the host address.
> + *
> + * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
> + */
>  static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
> -                               TCGMemOpIdx oi, uintptr_t retaddr)
> +                               TCGMemOpIdx oi, int prot, uintptr_t retad=
dr)
>  {
>      size_t mmu_idx =3D get_mmuidx(oi);
> -    uintptr_t index =3D tlb_index(env, mmu_idx, addr);
> -    CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr);
> -    target_ulong tlb_addr =3D tlb_addr_write(tlbe);
>      MemOp mop =3D get_memop(oi);
>      int a_bits =3D get_alignment_bits(mop);
>      int s_bits =3D mop & MO_SIZE;
> +    uintptr_t index;
> +    CPUTLBEntry *tlbe;
> +    target_ulong tlb_addr;
>      void *hostaddr;
>=20=20
>      /* Adjust the given return address.  */
> @@ -1775,15 +1779,45 @@ static void *atomic_mmu_lookup(CPUArchState *env,=
 target_ulong addr,
>          goto stop_the_world;
>      }
>=20=20
> +    index =3D tlb_index(env, mmu_idx, addr);
> +    tlbe =3D tlb_entry(env, mmu_idx, addr);
> +
>      /* Check TLB entry and enforce page permissions.  */
> -    if (!tlb_hit(tlb_addr, addr)) {
> -        if (!VICTIM_TLB_HIT(addr_write, addr)) {
> -            tlb_fill(env_cpu(env), addr, 1 << s_bits, MMU_DATA_STORE,
> -                     mmu_idx, retaddr);
> -            index =3D tlb_index(env, mmu_idx, addr);
> -            tlbe =3D tlb_entry(env, mmu_idx, addr);
> +    if (prot & PAGE_WRITE) {
> +        tlb_addr =3D tlb_addr_write(tlbe);
> +        if (!tlb_hit(tlb_addr, addr)) {
> +            if (!VICTIM_TLB_HIT(addr_write, addr)) {
> +                tlb_fill(env_cpu(env), addr, 1 << s_bits,
> +                         MMU_DATA_STORE, mmu_idx, retaddr);
> +                index =3D tlb_index(env, mmu_idx, addr);
> +                tlbe =3D tlb_entry(env, mmu_idx, addr);
> +            }
> +            tlb_addr =3D tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
> +        }
> +
> +        /* Let the guest notice RMW on a write-only page.  */
> +        if ((prot & PAGE_READ) &&
> +            unlikely(tlbe->addr_read !=3D (tlb_addr & ~TLB_NOTDIRTY))) {
> +            tlb_fill(env_cpu(env), addr, 1 << s_bits,
> +                     MMU_DATA_LOAD, mmu_idx, retaddr);
> +            /*
> +             * Since we don't support reads and writes to different addr=
esses,
> +             * and we do have the proper page loaded for write, this sho=
uldn't
> +             * ever return.  But just in case, handle via stop-the-world.
> +             */
> +            goto stop_the_world;
> +        }
> +    } else /* if (prot & PAGE_READ) */ {

I guess the compiler doesn't have enough info to know that !PROT_WRITE
implies PROT_READ and ends up doing an extra check it doesn't need to other=
wise?

Otherwise seems sane to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


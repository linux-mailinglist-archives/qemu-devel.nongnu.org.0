Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01C6FD64
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 12:04:45 +0200 (CEST)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpVBU-0004LP-Ar
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 06:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hpVBH-0003uE-PR
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hpVBG-0000bx-J3
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:04:31 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hpVBG-0000aw-81
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:04:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id n9so38828057wru.0
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=CYIsMAowRRPZP1EH0kYkEwE7mhPR2C9nSBYFWmnWiKc=;
 b=lJGcHGj6SF4wRDLyUAI+vZrddBq5hZibVci16M3CISgM8KH7S4RTFko3mOQz+7pxI1
 6p8T9W4rHRrgn6sthuvr1LqruV6uJ8nUg2vB7sc81S6KSnjS5c00e94GLMv4PUjecfVd
 z1/3NxAGJMHFC7/PfVJS/11ZryoNe6C1cXWPYrm86eVp5fA6rvh8QwlpRte9qcMVq7ps
 AeLH6CjFEd1p0P6HKM7mWds52Oy9IRfS16DPU8DDO47HiM6uIXerDNEKo1wzBFFqbQzz
 KvqEebsz0BM7nBrKbQwjUwIus86WwUMyWX8jQ1qPI5+IEn+yA91fpp/AplrBc0DCCzkd
 UzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=CYIsMAowRRPZP1EH0kYkEwE7mhPR2C9nSBYFWmnWiKc=;
 b=ok3eWPf73tBzcPCE4OfkuN7XEEuEYGXYOcES3Z4p5WR/S2MBYz1tnja9N+RTwC/IQv
 KfRM4yo3DJe61veZARQrycdM+NWYRZMu2rdYaSf4DO2t2jBr34kziicyntHkQL7NRfLh
 XEl9i8qNTK+aU5+TCDliTZGGjrtsylLUw0qn4L7N26M8oC3wKl7ulnp3aJiDxbIXgi55
 ZLmDra/nkre9wBFGSBpwlDePUovARdB10WJPo6BnYGiL0SiGjYYcXbgElnLcE2TkG665
 EWlhWGUFNdOAmZypjIKG96/2dMji3HkkRrViVtC2dqWlYlBQvFmWnGAaEl7e5IdVOHaV
 f5CA==
X-Gm-Message-State: APjAAAXkfjCRIVaUoFh7+kISBE88smI0JDsX6+xFssTadwSx4PehNI/5
 ry6Zh146TI5qyHvrx+8xewUF+w==
X-Google-Smtp-Source: APXvYqwanxIKZ3QDmKCVjoH1mRPzaIw2Xqu2icCVOwG+K2K1IG6DV4ICx0ZyXjBerNteKHBEddVz2w==
X-Received: by 2002:a05:6000:12c8:: with SMTP id
 l8mr21704006wrx.72.1563789868862; 
 Mon, 22 Jul 2019 03:04:28 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id a64sm38469178wmf.1.2019.07.22.03.04.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 03:04:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3CCB1FF87;
 Mon, 22 Jul 2019 11:04:27 +0100 (BST)
References: <20190719210326.15466-1-richard.henderson@linaro.org>
 <20190719210326.15466-3-richard.henderson@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190719210326.15466-3-richard.henderson@linaro.org>
Date: Mon, 22 Jul 2019 11:04:27 +0100
Message-ID: <87muh6v104.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH for-4.2 02/24] cputlb: Add
 tlb_flush_asid_by_mmuidx and friends
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Since we have remembered ASIDs, we can further minimize flushing
> by comparing against the one we want to flush.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 16 +++++++++++++
>  include/qom/cpu.h       |  1 +
>  accel/tcg/cputlb.c      | 51 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 9c77aa5bf9..0d890e1e60 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -240,6 +240,22 @@ void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *c=
pu, uint16_t idxmap);
>   */
>  void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid,
>                               uint16_t idxmap, uint16_t dep_idxmap);
> +/**
> + * tlb_flush_asid_by_mmuidx:
> + * @cpu: Originating CPU of the flush
> + * @asid: Address Space Identifier
> + * @idxmap: bitmap of MMU indexes to flush if asid matches
> + *
> + * For each mmu index, if @asid matches the value previously saved via
> + * tlb_set_asid_for_mmuidx, flush the index.
> + */
> +void tlb_flush_asid_by_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idx=
map);
> +/* Similarly, broadcasting to all cpus. */
> +void tlb_flush_asid_by_mmuidx_all_cpus(CPUState *cpu, uint32_t asid,
> +                                       uint16_t idxmap);
> +/* Similarly, waiting for the broadcast to complete.  */
> +void tlb_flush_asid_by_mmuidx_all_cpus_synced(CPUState *cpu, uint32_t as=
id,
> +                                              uint16_t idxmap);
>  /**
>   * tlb_set_page_with_attrs:
>   * @cpu: CPU to add this TLB entry for
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 5ee0046b62..4ae6ea3e1d 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -283,6 +283,7 @@ struct hax_vcpu_state;
>  typedef union {
>      int           host_int;
>      unsigned long host_ulong;
> +    uint64_t      host_uint64;

Missing an access helper, although host_uint64 doesn't make sense, 64 is
64 always:

  #define RUN_ON_CPU_UINT64(i)    ((run_on_cpu_data){.uint64 =3D (i)})

>      void         *host_ptr;
>      vaddr         target_ptr;
>  } run_on_cpu_data;
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c68f57755b..3ef68a11bf 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -540,6 +540,57 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, t=
arget_ulong addr)
>      tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
>  }
>
> +static void tlb_flush_asid_by_mmuidx_async_work(CPUState *cpu,
> +                                                run_on_cpu_data data)
> +{
> +    CPUTLB *tlb =3D cpu_tlb(cpu);
> +    uint32_t asid =3D data.host_uint64;
> +    uint16_t idxmap =3D data.host_uint64 >> 32;
> +    uint16_t to_flush =3D 0, work;
> +
> +    assert_cpu_is_self(cpu);
> +
> +    for (work =3D idxmap; work !=3D 0; work &=3D work - 1) {
> +        int mmu_idx =3D ctz32(work);
> +        if (tlb->d[mmu_idx].asid =3D=3D asid) {
> +            to_flush |=3D 1 << mmu_idx;
> +        }
> +    }
> +
> +    if (to_flush) {
> +        tlb_flush_by_mmuidx_async_work(cpu, RUN_ON_CPU_HOST_INT(to_flush=
));
> +    }
> +}
> +
> +void tlb_flush_asid_by_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idx=
map)
> +{
> +    run_on_cpu_data data =3D { .host_uint64 =3D deposit64(asid, 32, 32,
> idxmap) };

Then this would be:
     uint64_t asid_idx_map =3D deposit64(asid, 32, 32, idxmap);
     ...
     async_run_on_cpu(cpu, tlb_flush_asid_by_mmuidx_async_work, RUN_ON_CPU_=
UINT64(data))

Not a massive win but consistent with the other *_run_on calls and
easier to grep.

> +
> +    if (cpu->created && !qemu_cpu_is_self(cpu)) {
> +        async_run_on_cpu(cpu, tlb_flush_asid_by_mmuidx_async_work, data);
> +    } else {
> +        tlb_flush_asid_by_mmuidx_async_work(cpu, data);
> +    }
> +}
> +
> +void tlb_flush_asid_by_mmuidx_all_cpus(CPUState *src_cpu,
> +                                       uint32_t asid, uint16_t idxmap)
> +{
> +    run_on_cpu_data data =3D { .host_uint64 =3D deposit64(asid, 32, 32, =
idxmap) };
> +
> +    flush_all_helper(src_cpu, tlb_flush_asid_by_mmuidx_async_work, data);
> +    tlb_flush_asid_by_mmuidx_async_work(src_cpu, data);
> +}
> +
> +void tlb_flush_asid_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
> +                                              uint32_t asid, uint16_t id=
xmap)
> +{
> +    run_on_cpu_data data =3D { .host_uint64 =3D deposit64(asid, 32, 32, =
idxmap) };
> +
> +    flush_all_helper(src_cpu, tlb_flush_asid_by_mmuidx_async_work, data);
> +    async_safe_run_on_cpu(src_cpu, tlb_flush_asid_by_mmuidx_async_work, =
data);
> +}
> +
>  void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idxm=
ap,
>                               uint16_t depmap)
>  {

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e


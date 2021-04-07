Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D4E357497
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:55:06 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDKS-0007AT-QE
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUDJL-0006KP-7U
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:53:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUDJI-0000dV-Q5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:53:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id f12so13082352wro.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mLGGcPfkV8Pn4msloxgDpKeRWj15up7XwOfp4utPj1g=;
 b=zXcRcb/1f5kC1DpRKVn51hIu4zcCYcjughTvOehz9zvTevvoUTMWrposmaRy0WxNgT
 7nMK5BiJUfG0aE/En2VzHrxzngd7vWF1Mcxnmbz3kLtMPZgQ5h948VmBrZDv5s2Vuyzs
 QuIt2h3HBnTnCinSnYxlh1GzpzBzZohmVwCVsywTF5so8BXWLq1q6Qp2ylkLpjQZrAZy
 /zmpK68B0u8KvJ23h6JVymskNoYwXLOKQV7IzYDYsObY/778hfg7/jpf7cZxIiJmbFQJ
 3+EuZGhTWRWXWMfBBAGOW/cCGXPCohHR912s95LlxqqOpMGU/ld9Su71/ocowKBFhx6f
 Wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mLGGcPfkV8Pn4msloxgDpKeRWj15up7XwOfp4utPj1g=;
 b=YkkP3kE4yMkRob5wSorndAbUmq6Zk59bcPBKmEQjY1kvhZSnSJ/OTufDsXJYRBEKiX
 8cvE8a3tht36GD0ZdAbYtGq6+S9sFePHn01WhkTiWQBu85uMtQK/Tl+RqoI7MYqMODOh
 GFw2k/NPBuO+hGUTHRnIaHP51vBRRaB0NJc42fS3bSV/V+q/ZJQCWphs5tIF9ey+JON1
 ClgW0g++4rntPFuH5gbukZ8IBLJL2xzChSXn70tj9NXlrmE5HyqAkZlizZmqJcUtFiR/
 2VxDskpYtiJmx3PTU7ukrndkF2WL246K0UtIYS3+tMqfREn0G+9YjshL9eEt1iji/KQE
 UpOA==
X-Gm-Message-State: AOAM530HUcfqzzFJHmeDNaIUK4wFjT/q93I8ha1eEfqHcoh0lF5I7L0z
 0lPaKYfjkjEpuV1CRazk4I4vvg==
X-Google-Smtp-Source: ABdhPJzUqmgh7FIDe9B4PPseN+JqG7CKCtnMlvZ40VAOKlFo3VWxLvNk6Cx8y7XVw4CQyZJDlKGUpg==
X-Received: by 2002:adf:f403:: with SMTP id g3mr5936144wro.367.1617821630854; 
 Wed, 07 Apr 2021 11:53:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j30sm45241976wrj.62.2021.04.07.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 11:53:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE7741FF7E;
 Wed,  7 Apr 2021 19:53:48 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Wed, 07 Apr 2021 19:39:29 +0100
In-reply-to: <20210406174031.64299-4-richard.henderson@linaro.org>
Message-ID: <877dleuds3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: 1921948@bugs.launchpad.net, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> Therefore, the first failure is always either the first byte of the
> access, or the first byte of the granule.
>
> In addition, some of the arithmetic is off for last-first -> count.
> This does not become directly visible until a later patch that passes
> single bytes into this function, so ptr =3D=3D ptr_last.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948

Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
automatically copy patches to the appropriate bugs which is useful if
you don't have the Cc for the reporter.

Anyway I'm trying to get the kasas unit tests running as a way of
testing this (and maybe expanding with a version of Andrey's test). I
suspect this may be a PEBCAC issue but I built an MTE enabled kernel
with:

  CONFIG_HAVE_ARCH_KASAN=3Dy
  CONFIG_HAVE_ARCH_KASAN_SW_TAGS=3Dy
  CONFIG_HAVE_ARCH_KASAN_HW_TAGS=3Dy
  CONFIG_CC_HAS_KASAN_GENERIC=3Dy
  CONFIG_KASAN=3Dy
  # CONFIG_KASAN_GENERIC is not set
  CONFIG_KASAN_HW_TAGS=3Dy
  CONFIG_KASAN_STACK=3D1
  CONFIG_KASAN_KUNIT_TEST=3Dm
  CONFIG_TEST_KASAN_MODULE=3Dm

and was able to boot it. But when I insmod the kasan tests:

  insmod test_kasan.ko

it looks like it just keeps looping failing on the same test:

  Ignoring spurious kernel translation fault at virtual address dead0000000=
0010a
  WARNING: CPU: 0 PID: 1444 at arch/arm64/mm/fault.c:364 __do_kernel_fault+=
0xc4/0x1bc
  Modules linked in: test_kasan(+)
  CPU: 0 PID: 1444 Comm: kunit_try_catch Tainted: G    B   W         5.11.0=
-ajb-kasan #3
  Hardware name: linux,dummy-virt (DT)
  pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=3D--)
  pc : __do_kernel_fault+0xc4/0x1bc
  lr : __do_kernel_fault+0xc4/0x1bc
  sp : ffffffc01191b900
  x29: ffffffc01191b900 x28: fcffff8001f7a880
  x27: fcffff8001c01e00 x26: 0000000000000000
  x25: 0000000000000001 x24: 00000000000000f4
  x23: 0000000020400009 x22: dead00000000010a
  x21: 0000000000000025 x20: ffffffc01191b9d0
  x19: 0000000097c08004 x18: 0000000000000000
  x17: 000000000000000a x16: 000017a83fb75794
  x15: 0000000000000030 x14: 6c656e72656b2073
  x13: ffffffc010e21be0 x12: 00000000000001aa
  x11: 000000000000008e x10: ffffffc010e2d930
  x9 : 000000000003a6d0 x8 : ffffffc010e21be0
  x7 : ffffffc010e2cbe0 x6 : 0000000000000d50
  x5 : ffffff8007f9c850 x4 : ffffffc01191b700
  x3 : 0000000000000001 x2 : 0000000000000000
  x1 : 0000000000000000 x0 : fcffff8001f7a880
  Call trace:
   __do_kernel_fault+0xc4/0x1bc
   do_translation_fault+0x98/0xb0
   do_mem_abort+0x44/0xb0
   el1_abort+0x40/0x6c
   el1_sync_handler+0x6c/0xb0
   el1_sync+0x70/0x100
   kasan_update_kunit_status+0x6c/0x1ac
   kasan_report_invalid_free+0x34/0xa0
   ____kasan_slab_free.constprop.0+0xf8/0x1a0
   __kasan_slab_free+0x10/0x20
   slab_free_freelist_hook+0xf8/0x1a0
   kfree+0x148/0x25c
   kunit_destroy_resource+0x15c/0x1bc
   string_stream_destroy+0x20/0x80
   kunit_do_assertion+0x190/0x1e4
   kmalloc_double_kzfree+0x158/0x190 [test_kasan]
   kunit_try_run_case+0x78/0xa4
   kunit_generic_run_threadfn_adapter+0x20/0x2c
   kthread+0x134/0x144
   ret_from_fork+0x10/0x38
  ---[ end trace 5acd02cdb9b3d3f0 ]---

but maybe I'm using the kunit tests wrong. It's my first time playing
with them.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 8be17e1b70..c87717127c 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>                      uint64_t ptr, uintptr_t ra)
>  {
>      int mmu_idx, ptr_tag, bit55;
> -    uint64_t ptr_last, ptr_end, prev_page, next_page;
> -    uint64_t tag_first, tag_end;
> -    uint64_t tag_byte_first, tag_byte_end;
> -    uint32_t esize, total, tag_count, tag_size, n, c;
> +    uint64_t ptr_last, prev_page, next_page;
> +    uint64_t tag_first, tag_last;
> +    uint64_t tag_byte_first, tag_byte_last;
> +    uint32_t total, tag_count, tag_size, n, c;
>      uint8_t *mem1, *mem2;
>      MMUAccessType type;
>=20=20
> @@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>=20=20
>      mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
>      type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    esize =3D FIELD_EX32(desc, MTEDESC, ESIZE);
>      total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
>=20=20
>      /* Find the addr of the end of the access, and of the last element. =
*/
> -    ptr_end =3D ptr + total;
> -    ptr_last =3D ptr_end - esize;
> +    ptr_last =3D ptr + total - 1;
>=20=20
>      /* Round the bounds to the tag granule, and compute the number of ta=
gs. */
>      tag_first =3D QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
> -    tag_end =3D QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
> -    tag_count =3D (tag_end - tag_first) / TAG_GRANULE;
> +    tag_last =3D QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
> +    tag_count =3D ((tag_last - tag_first) / TAG_GRANULE) + 1;
>=20=20
>      /* Round the bounds to twice the tag granule, and compute the bytes.=
 */
>      tag_byte_first =3D QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
> -    tag_byte_end =3D QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
> +    tag_byte_last =3D QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
>=20=20
>      /* Locate the page boundaries. */
>      prev_page =3D ptr & TARGET_PAGE_MASK;
>      next_page =3D prev_page + TARGET_PAGE_SIZE;
>=20=20
> -    if (likely(tag_end - prev_page <=3D TARGET_PAGE_SIZE)) {
> +    if (likely(tag_last - prev_page <=3D TARGET_PAGE_SIZE)) {
>          /* Memory access stays on one page. */
> -        tag_size =3D (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
> +        tag_size =3D ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANUL=
E)) + 1;
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, total,
>                                    MMU_DATA_LOAD, tag_size, ra);
>          if (!mem1) {
> @@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, next_page -=
 ptr,
>                                    MMU_DATA_LOAD, tag_size, ra);
>=20=20
> -        tag_size =3D (tag_byte_end - next_page) / (2 * TAG_GRANULE);
> +        tag_size =3D ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) +=
 1;
>          mem2 =3D allocation_tag_mem(env, mmu_idx, next_page, type,
> -                                  ptr_end - next_page,
> +                                  ptr_last - next_page + 1,
>                                    MMU_DATA_LOAD, tag_size, ra);
>=20=20
>          /*
> @@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>      }
>=20=20
>      /*
> -     * If we failed, we know which granule.  Compute the element that
> -     * is first in that granule, and signal failure on that element.
> +     * If we failed, we know which granule.  For the first granule, the
> +     * failure address is @ptr, the first byte accessed.  Otherwise the
> +     * failure address is the first byte of the nth granule.
>       */
>      if (unlikely(n < tag_count)) {
> -        uint64_t fail_ofs;
> -
> -        fail_ofs =3D tag_first + n * TAG_GRANULE - ptr;
> -        fail_ofs =3D ROUND_UP(fail_ofs, esize);
> -        mte_check_fail(env, desc, ptr + fail_ofs, ra);
> +        uint64_t fault =3D (n =3D=3D 0 ? ptr : tag_first + n * TAG_GRANU=
LE);
> +        mte_check_fail(env, desc, fault, ra);
>      }
>=20=20
>   done:


--=20
Alex Benn=C3=A9e


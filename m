Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B759B6C8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:37:34 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuVZ-0004kn-8s
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuTF-0001tG-3A
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:35:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuTC-0002F3-S3
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:35:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso8968082pjd.1
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=G0er53w9hj2ikpuaCDPDqmqMEy6k8fBjQBL8KbGzO1U=;
 b=QctmIb1GhDl3Xcd2KeMfxMpyryvHK937UFmVWXInBkuN5+xzp45G6eIapGwtKoi8Tz
 E+QPm1aw5eq4/udc5mo683jd7e7m8VdhbgGvcSwjnFkXWmySkpjWtRK7Drc5iXjy0FDY
 KtxWltsCogCAEFGjbNijr45cZX1FHnOtbx8Q6vsAW5I0oJwIE05oebQt1Di2Rgq7E5Fa
 P3RufdGD+yzA4o5uZVY21RCpbinsBw+2bLS+NsAEBQMb0TIrhyViJl3F4rertMLQzISI
 izVBNVsV0chOnEVVRGF6pBMFsG5I969aBWCNSNjTTFFaWPW1oY1rBYf54avemRVrDRPj
 TT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=G0er53w9hj2ikpuaCDPDqmqMEy6k8fBjQBL8KbGzO1U=;
 b=IysNPUoZGUwyKbmDzHZDf5pfpFbJKLgLRyQNJPQTIKREh1sFg60f3xNacmxWniSU0W
 7joGrEtqjs+T/YhMN1jvaqctZRtxMXmPXkHBKCXeUVsfR8pjo8337ocZc/j6FuywUJUW
 7G/FmjIntgLxiN6X/0zcCtMIxejxsVN653KtUCL3HYHjQ9Zet2G7ebj7D1ZjLqbyaXjg
 KXI3xoOL+z8sLiLxCBKfCalABbCsVlXd9sBob1wTAUwYysjeu37H8foIFRSvDbmvZ8FO
 G6W9QJi6n/O+TW+G+Py+UMvoyhyx0rI9iuIAL70ZtykYhcBFrxRY3mAxQXK7pw0fkUdo
 caOw==
X-Gm-Message-State: ACgBeo0M506z8W+5gLJwyJzwLzRzMiKYI9CmBL18bwa1VW1Iw3RlLFVy
 IKDR8889JFJo0FPpDQLeh57YWlLlYS92ssX9UHb0wxbDtV0=
X-Google-Smtp-Source: AA6agR4f2U06V/b6/GNamJqi1AJQQxMKMmD4RDvAOHEGLVvdxBUES0h/E0NW+CyVQjQDk9Oy2jPXBStkiUIwUOTHV3s=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr17755981plf.83.1661124905361; Sun, 21
 Aug 2022 16:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-12-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:34:39 +1000
Message-ID: <CAKmqyKObv1sgL-k30FDx3N-ztL_Yrki5tAfc+bL6x7Urexm5FQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/21] accel/tcg: Move qemu_ram_addr_from_host_nofail
 to physmem.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 1:34 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The base qemu_ram_addr_from_host function is already in
> softmmu/physmem.c; move the nofail version to be adjacent.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/cpu-common.h |  1 +
>  accel/tcg/cputlb.c        | 12 ------------
>  softmmu/physmem.c         | 12 ++++++++++++
>  3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 2281be4e10..d909429427 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -72,6 +72,7 @@ typedef uintptr_t ram_addr_t;
>  void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
>  /* This should not be used by devices.  */
>  ram_addr_t qemu_ram_addr_from_host(void *ptr);
> +ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
>  RAMBlock *qemu_ram_block_by_name(const char *name);
>  RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>                                     ram_addr_t *offset);
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 43bd65c973..80a3eb4f1c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1283,18 +1283,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                              prot, mmu_idx, size);
>  }
>
> -static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
> -{
> -    ram_addr_t ram_addr;
> -
> -    ram_addr = qemu_ram_addr_from_host(ptr);
> -    if (ram_addr == RAM_ADDR_INVALID) {
> -        error_report("Bad ram pointer %p", ptr);
> -        abort();
> -    }
> -    return ram_addr;
> -}
> -
>  /*
>   * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
>   * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dc3c3e5f2e..d4c30e99ea 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2460,6 +2460,18 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
>      return block->offset + offset;
>  }
>
> +ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
> +{
> +    ram_addr_t ram_addr;
> +
> +    ram_addr = qemu_ram_addr_from_host(ptr);
> +    if (ram_addr == RAM_ADDR_INVALID) {
> +        error_report("Bad ram pointer %p", ptr);
> +        abort();
> +    }
> +    return ram_addr;
> +}
> +
>  static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
>                                   MemTxAttrs attrs, void *buf, hwaddr len);
>  static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
> --
> 2.34.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA05F649A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:56:53 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOYd-0002je-S6
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOSG-0006Kg-E5
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:50:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogOSE-0000uR-JB
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:50:16 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so1359587pjk.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y5FbqLy3u9hidSG5UHsJSAmUianUDxYomPEUaIADc70=;
 b=NvTVlzysfVNpaxPOPqtGUjdKzy+fp7JgHB1qFqddi8+8iSTmZcgao9tk43Ofm1G2Is
 4fd5vaAKjiSsyUfLCNNPhmgjzduKZMsWbPSGnY10CwST4MrEU5i4h+ZYuaBazA6Xk15g
 gtWxoN46K04GKKuYRJ5LJWp8um2D51aewBcpbcdHU5KqwdF4yIJiKNDqh1cCbCEZXJ8o
 dXP5Pwc8ERv0AOfLc0LhViTVzyUURNIAxF0ysh02a4eK6BgZjwmA+Fk0LzUmpIiwsI2/
 fL8GuZTLyxCJIK7ne47AxMEPPm6AnKc7zAf3VgxGXlYIDsNDWDQhHVJ4rUd0OLGV7PXR
 7Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5FbqLy3u9hidSG5UHsJSAmUianUDxYomPEUaIADc70=;
 b=geDrO4IyHe9dAiP6xZaAc9tchaKNLvEgUO4CgpuiIgHSF6xnzrKSj0jxfLKvdcXUGk
 Weyvjv8a6o6XkRHLxdt/BHBEWfFHUPopeInW+MfCVlg+k+FErbQt3QcKXQeevnZ92SYx
 yrCtvkoKK6M+ZyZ98S631IOXTwuT4+8zRch3Mt3Q78FwvrNfZtSlGtzvDKG8GogvlrCf
 woBEgMPz6jaiJsSpA+iDWPqr9Azr+g25CivSuSSvsQbyppCkFAVq77ovvJqcZgUGv78/
 qwO5Bn2svm2W2glmIbDkX6GG/7CxPvGhWiVX4YEVzZ43rs+Z7RRmgJ0yHSoVheoGE/v/
 2B1A==
X-Gm-Message-State: ACrzQf3UQKD3AhaLd0Fwn/lIbg0JR+/UaXF99mr1FCxhMsYEYecJQ0FU
 tI7Kqe+J7M1Lry799gLx9rhUxcWP1TS28Wfnj8xAmA==
X-Google-Smtp-Source: AMsMyM4itylqMvBlJv3baCMtPgFoxu/JQ5kPPTbR1Hu6UGmnnODcZg2IxBxQX5PHcU6JdynyagFg/MZT3YCTQC6mFV4=
X-Received: by 2002:a17:90b:1d11:b0:20a:9b3a:bf10 with SMTP id
 on17-20020a17090b1d1100b0020a9b3abf10mr4412510pjb.215.1665053412951; Thu, 06
 Oct 2022 03:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
 <CAFEAcA-6HprXJ9u3orCMyPtaVGgDAU6R_zZ4jQi_NG2NmyaYvA@mail.gmail.com>
 <SJ1PR12MB6290CCA4E526946666A4005FC95C9@SJ1PR12MB6290.namprd12.prod.outlook.com>
In-Reply-To: <SJ1PR12MB6290CCA4E526946666A4005FC95C9@SJ1PR12MB6290.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 11:50:00 +0100
Message-ID: <CAFEAcA_5ybKHMLMZccV1r3hT2g6yfmtRGK5g8at8e8jMRPvhuw@mail.gmail.com>
Subject: Re: A few QEMU questiosn
To: a b <blue_3too@hotmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 6 Oct 2022 at 08:34, a b <blue_3too@hotmail.com> wrote:
>
> Thanks a lot Peter for the clarification. It is very helpful.
>
> My naive understanding is that each MMU has only 1 TLB, why do we need an array of CPUTLBDescFast structures? How are these different CPUTLBDescFast data structures correlate with a hardware TLB?
>
> 220 typedef struct CPUTLB {
> 221     CPUTLBCommon c;
> 222     CPUTLBDesc d[NB_MMU_MODES];
> 223     CPUTLBDescFast f[NB_MMU_MODES];
> 224 } CPUTLB;

QEMU's "TLB" doesn't really correlate with a hardware TLB
except in that they're serving vaguely similar purposes.
A hardware TLB is a h/w structure which accelerates the lookup
  virtual-address => (physical-address, permissions)
QEMU's TLB is a software data structure which accelerates
the lookup
  virtual-address => (host virtual address or device MemoryRegion structure)

It's not an emulation of the "real" CPU TLB. (Note that this
means that you can't use QEMU to look at performance behaviour
around whether guest code is hitting or missing in the TLB,
and that the size of QEMU's TLB is unrelated to the size of a
TLB on the real CPU.)

Further, the set of things that can be done fast in hardware
differs from the set of things that can be done fast in
software. In hardware, a TLB is a "content-addressable
memory" that essentially checks every entry in parallel to
find the match in fixed time. In this kind of hardware it's
easy to add checks like "and it should match the right ASID"
or "and it must be an entry for EL2" without it making the
lookup slower. In software, you can't do that kind of parallel
lookup, so we must use a different structure. Instead of
having one TLB that can store entries for multiple contexts
at once and where we check that the context is correct when
we look up the address, we have effectively a separate TLB
for each context, so we can look up the address in an O(1)
data structure that has exactly one entry for the address,
and know that if it is present it is the correct entry.

The aim of the QEMU TLB design is to make the "fast path"
lookup of guest virtual address to host virtual address for
RAM accesses as fast as possible (it is a handful of
instructions directly generated as part of the JIT output);
the slow path for faults, hardware accesses, etc, is handled
in C code and is less performance critical.

> Why do we want to store a shifted (n_entries-1) in mask?
> 184 typedef struct CPUTLBDescFast {
> 185     /* Contains (n_entries - 1) << CPU_TLB_ENTRY_BITS */
> 186     uintptr_t mask;
> 187     /* The array of tlb entries itself. */
> 188     CPUTLBEntry *table;
> 189 } CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));

The mask field is a pre-calculated value that is going to
be used as part of the "given a virtual address, find the
table entry" lookup. Because the number of entries in the table
varies, the part of the address we need to use as the index
also varies. We pre-calculate the mask in a convenient format
for the generated JIT code because if we stored just n_entries
here it would cost us an extra instruction or two in the fast path.
(To understand these data structures you probably want to also
be looking at the code that generates the lookup code, which
you can find under tcg/, usually in a function named
tcg_out_tlb_load or tcg_out_tlb_read or similar.)

> Why doesn't CPUTLBEntry have information like ASID, shared
> (or global) bits?  How do we know if the TLB entry is a match
> for a particular process?

We don't store the ASID because it would be slow to do a check
on it when we got a TLB hit, and it would be too expensive to
have an entire separate TLB per-ASID. Instead we simply flush
the appropriate TLB when the ASID is changed. That means that
we can rely on a TLB hit being for the current context/process.

-- PMM


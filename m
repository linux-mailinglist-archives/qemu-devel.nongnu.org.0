Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EF42CA7A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 21:56:35 +0200 (CEST)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1makMc-0005On-Ai
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 15:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1makLg-0004eY-H6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:55:36 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1makLe-0003qe-IV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:55:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id m14so3412618pfc.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1zR7X9vL8MbEad4Y0H6fooLaidRcYCNq2qUr09s+j30=;
 b=nXZt18NpzlDfz5e9znDX4W3AgTzLvcvAFKl/qWwIuAC+/EapywPXcjdvqGwWvgE1R5
 KyMLZlGGlWbDFVblzxHzAGTJDmpZNUPxSw93MpFT1rfj3IRIXI3/wrCX5iKZwfqosRJB
 i3Qio1vyqSg/+kzhQCEBAbNXkMdtg8qrz4Rd8UPxzHALmqWzPYrqTLSoobGDS5PFh6zn
 QaCdyNbd4T/f3fsJ95YFLJjrOXjmvZB/WgmML2C49CrxYwCrPuKcV/W+bmLn9InkTEqT
 gb9fphtJL1y5y4aqI5HKpxulL1PxCETpI17WUPFKi7SIESLLEEqNEwQv8IzC9pOSUwu3
 ONgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1zR7X9vL8MbEad4Y0H6fooLaidRcYCNq2qUr09s+j30=;
 b=AO9vcbQQ3HUJfAATJ0rtHaAkuXk5sJCu8a4YtBY10x7+OP6bIuUJY6UY77ei7qS3FY
 QT2D8prVjEZ2IvOXHtHUTMuMFELVnz4iC+zMmbRPKyl03APcIaXSSQ9b0bLWYi3cRUZJ
 1q7lnmg2jt/KxU5HqajorunhM9d4LtQpdm07rzAZmQYvLhfUHM+IU3LCKXMiYJBpkBb6
 Qz4YT+VlcRkrWCp9bTHKEzdXbqK/UrZNcniJORfK1hEXgIxT91vq9mtTJga9jSlFSTKI
 EW4ACQuIBP43dZl+Zv8FBQubegbEan8MRO8e3YLYqU04fsjqA7pl4UVtyDJSzorGY4nE
 Ezfg==
X-Gm-Message-State: AOAM531/0HSzullG+FoelC1F8Jkc7+6pdel49Mi7sCvjT37aDEs1y7Sp
 XrmmOVVbYOn/vphEXigyCxAke5I8z2Gw9A==
X-Google-Smtp-Source: ABdhPJwI+0egYIMUDcQZzAXVyNqiwBmLOYxpwrFa8X3iiOX9EkXMS5qDDbgKQrrNrsNSYVpdmNI4Pg==
X-Received: by 2002:a63:e10d:: with SMTP id z13mr910019pgh.375.1634154931074; 
 Wed, 13 Oct 2021 12:55:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d14sm288044pfr.123.2021.10.13.12.55.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:55:30 -0700 (PDT)
Subject: Re: [PULL 00/15] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211013182239.991127-1-richard.henderson@linaro.org>
Message-ID: <baa7ae9d-53e9-6755-c856-07a500793ecf@linaro.org>
Date: Wed, 13 Oct 2021 12:55:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 11:22 AM, Richard Henderson wrote:
> The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:
> 
>    Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211013
> 
> for you to fetch changes up to 76e366e728549b3324cc2dee6745d6a4f1af18e6:
> 
>    tcg: Canonicalize alignment flags in MemOp (2021-10-13 09:14:35 -0700)
> 
> ----------------------------------------------------------------
> Use MO_128 for 16-byte atomic memory operations.
> Add cpu_ld/st_mmu memory primitives.
> Move helper_ld/st memory helpers out of tcg.h.
> Canonicalize alignment flags in MemOp.
> 
> ----------------------------------------------------------------
> BALATON Zoltan (1):
>        memory: Log access direction for invalid accesses
> 
> Richard Henderson (14):
>        target/arm: Use MO_128 for 16 byte atomics
>        target/i386: Use MO_128 for 16 byte atomics
>        target/ppc: Use MO_128 for 16 byte atomics
>        target/s390x: Use MO_128 for 16 byte atomics
>        target/hexagon: Implement cpu_mmu_index
>        accel/tcg: Add cpu_{ld,st}*_mmu interfaces
>        accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
>        target/mips: Use cpu_*_data_ra for msa load/store
>        target/mips: Use 8-byte memory ops for msa load/store
>        target/s390x: Use cpu_*_mmu instead of helper_*_mmu
>        target/sparc: Use cpu_*_mmu instead of helper_*_mmu
>        target/arm: Use cpu_*_mmu instead of helper_*_mmu
>        tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
>        tcg: Canonicalize alignment flags in MemOp
> 
>   docs/devel/loads-stores.rst   |  52 +++++-
>   include/exec/cpu_ldst.h       | 332 ++++++++++++++++++-----------------
>   include/tcg/tcg-ldst.h        |  74 ++++++++
>   include/tcg/tcg.h             | 158 -----------------
>   target/hexagon/cpu.h          |   9 +
>   accel/tcg/cputlb.c            | 393 ++++++++++++++----------------------------
>   accel/tcg/user-exec.c         | 385 +++++++++++++++++------------------------
>   softmmu/memory.c              |  20 +--
>   target/arm/helper-a64.c       |  61 ++-----
>   target/arm/m_helper.c         |   6 +-
>   target/i386/tcg/mem_helper.c  |   2 +-
>   target/m68k/op_helper.c       |   1 -
>   target/mips/tcg/msa_helper.c  | 389 ++++++++++-------------------------------
>   target/ppc/mem_helper.c       |   1 -
>   target/ppc/translate.c        |  12 +-
>   target/s390x/tcg/mem_helper.c |  13 +-
>   target/sparc/ldst_helper.c    |  14 +-
>   tcg/tcg-op.c                  |   7 +-
>   tcg/tcg.c                     |   1 +
>   tcg/tci.c                     |   1 +
>   accel/tcg/ldst_common.c.inc   | 307 +++++++++++++++++++++++++++++++++
>   21 files changed, 1032 insertions(+), 1206 deletions(-)
>   create mode 100644 include/tcg/tcg-ldst.h
>   create mode 100644 accel/tcg/ldst_common.c.inc

Applied, thanks.

r~



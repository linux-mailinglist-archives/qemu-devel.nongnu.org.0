Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7E3CCB53
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 00:35:06 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5FNI-0008SH-K2
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 18:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m5FMM-0007nK-Ot
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 18:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m5FMJ-0003sk-Cj
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 18:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626647641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UB4nQWcgWKoiMT/sBmHhaaeGbmJ4IfVI6W0FkNYDsq0=;
 b=J0Ao+ungAfaboP3V0id/vcDT5ln3Ph+Tt9etvqjK4hHmmRZcQFM1gOJd0ozsrrNqQxXJ8/
 vpFTLdcg2B8O2SGfDonGk0mZzKaGfvTK4FZH2iUXo216AICCK270G5EsLip7NxKBv4caEk
 STRMFgxFqgrFbbmkEcRVWIo6HV2WuVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-86Im_MecNiWpLZ12qETqbQ-1; Sun, 18 Jul 2021 18:34:00 -0400
X-MC-Unique: 86Im_MecNiWpLZ12qETqbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2165F100B3AC;
 Sun, 18 Jul 2021 22:33:59 +0000 (UTC)
Received: from [10.10.112.175] (ovpn-112-175.rdu2.redhat.com [10.10.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8005F3AA2;
 Sun, 18 Jul 2021 22:33:58 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] Atomic cleanup + clang-12 build fix
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <02732f06-3add-e8d3-a3d9-953ad0708755@redhat.com>
Date: Sun, 18 Jul 2021 18:33:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:24 PM, Richard Henderson wrote:
> This is intended to fix building with clang-12 on i386.
> In the process, I found bugs wrt handling of guest memory in target/
> with respect to atomics, fixed by unifying the api between softmmu
> and user-only and removing some ifdefs under target/.
> 
> Unification of the api allowed some further cleanups.
> 
> I think that patches 1-5 fix all of the bugs, and that 6-10 are only
> cleanup and could be left to next cycle.
> 
> Changes for v3:
>   * Dropped the typeof_strip_qual patch with broader testing.
>   * Squashed an include fix for trace/mem.h, with plugins enabled.
>   * Applied Phil's R-b.
> 
> 
> r~
> 
> 
> Richard Henderson (10):
>   qemu/atomic: Use macros for CONFIG_ATOMIC64
>   qemu/atomic: Remove pre-C11 atomic fallbacks
>   qemu/atomic: Add aligned_{int64,uint64}_t types
>   tcg: Rename helper_atomic_*_mmu and provide for user-only
>   accel/tcg: Standardize atomic helpers on softmmu api
>   accel/tcg: Fold EXTRA_ARGS into atomic_template.h
>   accel/tcg: Remove ATOMIC_MMU_DECLS
>   accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
>   trace: Fold mem-internal.h into mem.h
>   accel/tcg: Push trace info building into atomic_common.c.inc
> 
>  configure                     |   7 -
>  accel/tcg/atomic_template.h   | 141 +++++++++-----------
>  accel/tcg/tcg-runtime.h       |  46 -------
>  include/qemu/atomic.h         | 243 ++++------------------------------
>  include/qemu/stats64.h        |   2 +-
>  include/tcg/tcg.h             |  78 +++++------
>  softmmu/timers-state.h        |   2 +-
>  trace/mem-internal.h          |  50 -------
>  trace/mem.h                   |  50 +++++--
>  accel/tcg/cputlb.c            |  49 +------
>  accel/tcg/user-exec.c         |  41 +++---
>  linux-user/hppa/cpu_loop.c    |   2 +-
>  plugins/core.c                |   2 +-
>  target/arm/helper-a64.c       |   8 +-
>  target/i386/tcg/mem_helper.c  |  15 +--
>  target/m68k/op_helper.c       |  19 +--
>  target/ppc/mem_helper.c       |  16 +--
>  target/s390x/tcg/mem_helper.c |  19 +--
>  tcg/tcg-op.c                  |  47 ++-----
>  util/qsp.c                    |   4 +-
>  accel/tcg/atomic_common.c.inc | 107 +++++++++++++--
>  21 files changed, 321 insertions(+), 627 deletions(-)
>  delete mode 100644 trace/mem-internal.h
> 

This series fixes the clang i686 build issue for me. Thanks Richard!

Tested-by: Cole Robinson <crobinso@redhat.com>

- Cole



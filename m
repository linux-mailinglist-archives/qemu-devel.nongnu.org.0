Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47678AFB36
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 13:12:30 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i80Y1-0003RM-6B
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 07:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i80XA-0002zF-Bn
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 07:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i80X8-0000O0-2L
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 07:11:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60278)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i80X7-0000N4-Qz; Wed, 11 Sep 2019 07:11:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AC731918645;
 Wed, 11 Sep 2019 11:11:32 +0000 (UTC)
Received: from [10.36.117.155] (ovpn-117-155.ams2.redhat.com [10.36.117.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD75F5DD61;
 Wed, 11 Sep 2019 11:11:30 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <76806ca4-3fca-fbb2-a8ca-f7664f696e15@redhat.com>
Date: Wed, 11 Sep 2019 13:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 11 Sep 2019 11:11:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH v2 00/28] s390x/tcg:
 mem_helper: Fault-safe handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.09.19 09:57, David Hildenbrand wrote:
> This is the successor of
>     "[PATCH v1 0/4] s390x/tcg: MOVE (MVC): Fault-safe handling"
> 
> ----
> 
> This series fixes a bunch of issues related to some mem helpers and makes
> sure that they are fault-safe, meaning no system state is modified in case
> a fault is triggered.
> 
> I can spot tons of other issues with other mem helpers that will have
> to be fixed later. Also, fault-safe handling for some instructions
> (especially TR) might be harder to implement (you don't know what will
> actually be accessed upfront - we might need a buffer and go over
> inputs twice). Focusing on the MOVE instructions for now.
> 
> ----
> 
> Newer versions of glibc use memcpy() in memmove() for forward moves. The
> implementation makese use of MVC. The TCG implementation of MVC is
> currently not able to handle faults reliably when crossing pages. MVC
> can cross with 256 bytes at most two pages.
> 
> In case we get a fault on the second page, we already moved data. When
> continuing after the fault we might try to move already overwritten data,
> which is very bad in case we have overlapping data on a forward move.
> 
> Triggered for now only by rpmbuild (crashes when checking the spec file)
> and rpm (database corruptions). This fixes installing Fedora rawhide (31)
> under TCG.
> 
> This was horrible to debug as it barely triggers and we fail at completely
> different places.
> 
> Cc: Stefano Brivio <sbrivio@redhat.com>
> Cc: Florian Weimer <fweimer@redhat.com>
> 
> v1 -> v2:
> - Include many fixes
> - Fix more instructions
> - Use the new probe_access() function
> - Include "tests/tcg: target/s390x: Test MVO"
> 
> David Hildenbrand (28):
>   s390x/tcg: Reset exception_index to -1 instead of 0
>   s390x/tcg: MVCL: Zero out unused bits of address
>   s390x/tcg: MVCL: Detect destructive overlaps
>   s390x/tcg: MVCL: Process max 2k bytes at a time
>   s390x/tcg: MVC: Increment the length once
>   s390x/tcg: MVC: Use is_destructive_overlap()
>   s390x/tcg: MVPG: Check for specification exceptions
>   s390x/tcg: MVPG: Properly wrap the addresses
>   s390x/tcg: MVCLU/MVCLE: Process max 4k bytes at a time
>   s390x/tcg: MVCS/MVCP: Check for special operation exceptions
>   s390x/tcg: MVCS/MVCP: Properly wrap the length
>   s390x/tcg: MVST: Check for specification exceptions
>   s390x/tcg: MVST: Fix storing back the addresses to registers
>   s390x/tcg: Always use MMU_USER_IDX for CONFIG_USER_ONLY
>   s390x/tcg: Fault-safe memset
>   s390x/tcg: Fault-safe memmove
>   s390x/tcg: MVCS/MVCP: Use access_memmove_idx()
>   s390x/tcg: MVC: Fault-safe handling on destructive overlaps
>   s390x/tcg: MVCLU: Fault-safe handling
>   s390x/tcg: OC: Fault-safe handling
>   s390x/tcg: XC: Fault-safe handling
>   s390x/tcg: NC: Fault-safe handling
>   s390x/tcg: MVCIN: Fault-safe handling
>   s390x/tcg: MVN: Fault-safe handling
>   s390x/tcg: MVZ: Fault-safe handling
>   s390x/tcg: MVST: Fault-safe handling
>   s390x/tcg: MVO: Fault-safe handling
>   tests/tcg: target/s390x: Test MVO
> 
>  target/s390x/cpu.h              |   4 +
>  target/s390x/helper.h           |   2 +-
>  target/s390x/insn-data.def      |   2 +-
>  target/s390x/mem_helper.c       | 672 ++++++++++++++++++++++----------
>  target/s390x/translate.c        |  12 +-
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/mvo.c           |  25 ++
>  7 files changed, 507 insertions(+), 211 deletions(-)
>  create mode 100644 tests/tcg/s390x/mvo.c
> 

I guess, for a minimal review besides the obvious fixes, looking at

"s390x/tcg: Fault-safe memset" and "s390x/tcg: Fault-safe memmove" and
"s390x/tcg: MVC: Fault-safe handling on destructive overlaps"  makes
sense. They contain the real magic used within remaining patches.

-- 

Thanks,

David / dhildenb


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D842930CFC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 13:00:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWfGl-0002Ay-2R
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 07:00:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf4B-0000q0-3P
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf49-0004qH-Ry
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:47:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46802)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>) id 1hWf49-0004nn-J1
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE6C8A3EA4;
	Fri, 31 May 2019 10:47:16 +0000 (UTC)
Received: from [10.36.116.233] (ovpn-116-233.ams2.redhat.com [10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB76271AE;
	Fri, 31 May 2019 10:47:15 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <53d0b27c-6a9b-c410-033f-db5796f02046@redhat.com>
Date: Fri, 31 May 2019 12:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-1-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 31 May 2019 10:47:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v1 00/23] s390x/tcg: Vector Instruction
 Support Part 4
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Denys Vlasenko <dvlasenk@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31.05.19 12:44, David Hildenbrand wrote:
> This is the final part of vector instruction support for s390x. It is based
> on part 2, which is will send a pull-request for to Conny soon.
> 
> Part 1: Vector Support Instructions
> Part 2: Vector Integer Instructions
> Part 3: Vector String Instructions
> Part 4: Vector Floating-Point Instructions
> 
> The current state can be found at (kept updated):
>     https://github.com/davidhildenbrand/qemu/tree/vx
> 
> It is based on:
> - [PATCH v2 0/5] s390x/tcg: Vector Instruction Support Part 3
> - [PATCH v1 0/2] s390x: Fix vector register alignment
> 
> With the current state I can boot Linux kernel + user space compiled with
> SIMD support. This allows to boot distributions compiled exclusively for
> z13, requiring SIMD support. Also, it is now possible to build a complete
> kernel using rpmbuild as quite some issues have been sorted out.
> 
> While the current state works fine for me with RHEL 8, I am experiencing
> some issues with newer userspace versions (I suspect glibc). I'll have
> to look into the details first - could be a BUG in !vector
> instruction or a BUG in a vector instruction that was until now unused.
> 
> In this part, all Vector Floating-Point Instructions introduced with the
> "Vector Facility" are added. Also, the "qemu" model is changed to a
> z13 machine.
> 
> David Hildenbrand (23):
>   s390x: Use uint64_t for vector registers
>   s390x/tcg: Introduce tcg_s390_vector_exception()
>   s390x/tcg: Export float_comp_to_cc() and float(32|64|128)_dcmask()
>   s390x/tcg: Implement VECTOR FP ADD
>   s390x/tcg: Implement VECTOR FP COMPARE (AND SIGNAL) SCALAR
>   s390x/tcg: Implement VECTOR FP COMPARE (EQUAL|HIGH|HIGH OR EQUAL)
>   s390x/tcg: Implement VECTOR FP CONVERT FROM FIXED 64-BIT
>   s390x/tcg: Implement VECTOR FP CONVERT FROM LOGICAL 64-BIT
>   s390x/tcg: Implement VECTOR FP CONVERT TO FIXED 64-BIT
>   s390x/tcg: Implement VECTOR FP CONVERT TO LOGICAL 64-BIT
>   s390x/tcg: Implement VECTOR FP DIVIDE
>   s390x/tcg: Implement VECTOR LOAD FP INTEGER
>   s390x/tcg: Implement VECTOR LOAD LENGTHENED
>   s390x/tcg: Implement VECTOR LOAD ROUNDED
>   s390x/tcg: Implement VECTOR FP MULTIPLY
>   s390x/tcg: Implement VECTOR FP MULTIPLY AND (ADD|SUBTRACT)
>   s390x/tcg: Implement VECTOR FP PERFORM SIGN OPERATION
>   s390x/tcg: Implement VECTOR FP SQUARE ROOT
>   s390x/tcg: Implement VECTOR FP SUBTRACT
>   s390x/tcg: Implement VECTOR FP TEST DATA CLASS IMMEDIATE
>   s390x/tcg: Allow linux-user to use vector instructions
>   s390x/tcg: We support the Vector Facility
>   s390x: Bump the "qemu" CPU model up to a stripped-down z13
> 
>  hw/s390x/s390-virtio-ccw.c      |   2 +
>  linux-user/s390x/signal.c       |   4 +-
>  target/s390x/Makefile.objs      |   1 +
>  target/s390x/arch_dump.c        |   8 +-
>  target/s390x/cpu.c              |   3 +
>  target/s390x/cpu.h              |   5 +-
>  target/s390x/cpu_models.c       |   4 +-
>  target/s390x/excp_helper.c      |  21 +-
>  target/s390x/fpu_helper.c       |   4 +-
>  target/s390x/gdbstub.c          |  16 +-
>  target/s390x/gen-features.c     |  10 +-
>  target/s390x/helper.c           |  10 +-
>  target/s390x/helper.h           |  46 +++
>  target/s390x/insn-data.def      |  45 +++
>  target/s390x/internal.h         |   4 +
>  target/s390x/kvm.c              |  16 +-
>  target/s390x/machine.c          | 128 +++----
>  target/s390x/tcg_s390x.h        |   2 +
>  target/s390x/translate.c        |   2 +-
>  target/s390x/translate_vx.inc.c | 274 ++++++++++++++
>  target/s390x/vec_fpu_helper.c   | 644 ++++++++++++++++++++++++++++++++
>  21 files changed, 1145 insertions(+), 104 deletions(-)
>  create mode 100644 target/s390x/vec_fpu_helper.c
> 

Nasty git "-identity" + manual "-cc" collision.

CC'ing some more people.

-- 

Thanks,

David / dhildenb


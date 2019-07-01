Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947038E50
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 17:02:40 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZGO7-0000UT-D5
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 11:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hZFgX-0002VR-94
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hZFgV-0001HY-QW
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:17:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hZFgT-0001Bd-Md; Fri, 07 Jun 2019 10:17:33 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FEF881124;
 Fri,  7 Jun 2019 14:17:30 +0000 (UTC)
Received: from localhost (dhcp-192-191.str.redhat.com [10.33.192.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E87F88EE;
 Fri,  7 Jun 2019 14:17:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Jun 2019 16:16:53 +0200
Message-Id: <20190607141727.29018-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 07 Jun 2019 14:17:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 00/34] s390x updates
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 33556237f652d8a712d0b6d29ecb442e6b65fe=
42:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-7-2=
019' into staging (2019-06-07 11:17:28 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20190607-2

for you to fetch changes up to c984c4e8e31e57c44b3674d9dd8ed6aa5e68306e:

  Merge tag 's390x-tcg-2019-06-07' into s390-next-staging (2019-06-07 16:=
06:27 +0200)

----------------------------------------------------------------
s390x updates:
- tcg: finalize implementation for the vector facility and
  add it to the 'qemu' cpu model
- linux-user: properly generate ELF_HWCAP

----------------------------------------------------------------

Cornelia Huck (1):
  MAINTAINERS: cover tests/migration/s390x/

David Hildenbrand (32):
  s390x/tcg: Implement VECTOR FIND ANY ELEMENT EQUAL
  s390x/tcg: Implement VECTOR FIND ELEMENT EQUAL
  s390x/tcg: Implement VECTOR FIND ELEMENT NOT EQUAL
  s390x/tcg: Implement VECTOR ISOLATE STRING
  s390x/tcg: Implement VECTOR STRING RANGE COMPARE
  s390x: Align vector registers to 16 bytes
  s390x: Use uint64_t for vector registers
  s390x/tcg: Fix max_byte detection for stfle
  s390x/tcg: Store only the necessary amount of doublewords for STFLE
  s390x/tcg: Introduce tcg_s390_vector_exception()
  s390x/tcg: Export float_comp_to_cc() and float(32|64|128)_dcmask()
  s390x/tcg: Implement VECTOR FP ADD
  s390x/tcg: Implement VECTOR FP COMPARE (AND SIGNAL) SCALAR
  s390x/tcg: Implement VECTOR FP COMPARE (EQUAL|HIGH|HIGH OR EQUAL)
  s390x/tcg: Implement VECTOR FP CONVERT FROM FIXED 64-BIT
  s390x/tcg: Implement VECTOR FP CONVERT FROM LOGICAL 64-BIT
  s390x/tcg: Implement VECTOR FP CONVERT TO FIXED 64-BIT
  s390x/tcg: Implement VECTOR FP CONVERT TO LOGICAL 64-BIT
  s390x/tcg: Implement VECTOR FP DIVIDE
  s390x/tcg: Implement VECTOR LOAD FP INTEGER
  s390x/tcg: Implement VECTOR LOAD LENGTHENED
  s390x/tcg: Implement VECTOR LOAD ROUNDED
  s390x/tcg: Implement VECTOR FP MULTIPLY
  s390x/tcg: Implement VECTOR FP MULTIPLY AND (ADD|SUBTRACT)
  s390x/tcg: Implement VECTOR FP PERFORM SIGN OPERATION
  s390x/tcg: Implement VECTOR FP SQUARE ROOT
  s390x/tcg: Implement VECTOR FP SUBTRACT
  s390x/tcg: Implement VECTOR FP TEST DATA CLASS IMMEDIATE
  s390x/tcg: Allow linux-user to use vector instructions
  s390x/tcg: We support the Vector Facility
  s390x: Bump the "qemu" CPU model up to a stripped-down z13
  linux-user: elf: ELF_HWCAP for s390x

Richard Henderson (1):
  s390x/tcg: Use tcg_gen_gvec_bitsel for VECTOR SELECT

 hw/s390x/s390-virtio-ccw.c       |   2 +
 include/elf.h                    |   1 +
 linux-user/elfload.c             |  28 ++
 linux-user/s390x/signal.c        |   4 +-
 target/s390x/Makefile.objs       |   3 +-
 target/s390x/arch_dump.c         |   8 +-
 target/s390x/cpu.c               |   3 +
 target/s390x/cpu.h               |   5 +-
 target/s390x/cpu_models.c        |   4 +-
 target/s390x/excp_helper.c       |  21 +-
 target/s390x/fpu_helper.c        |   4 +-
 target/s390x/gdbstub.c           |  16 +-
 target/s390x/gen-features.c      |  10 +-
 target/s390x/helper.c            |  10 +-
 target/s390x/helper.h            |  84 +++++
 target/s390x/insn-data.def       |  58 +++
 target/s390x/internal.h          |   4 +
 target/s390x/kvm.c               |  16 +-
 target/s390x/machine.c           | 128 +++----
 target/s390x/misc_helper.c       |  11 +-
 target/s390x/tcg_s390x.h         |   2 +
 target/s390x/translate.c         |   2 +-
 target/s390x/translate_vx.inc.c  | 507 +++++++++++++++++++++++--
 target/s390x/vec.h               |  40 ++
 target/s390x/vec_fpu_helper.c    | 625 +++++++++++++++++++++++++++++++
 target/s390x/vec_string_helper.c | 473 +++++++++++++++++++++++
 26 files changed, 1930 insertions(+), 139 deletions(-)
 create mode 100644 target/s390x/vec_fpu_helper.c
 create mode 100644 target/s390x/vec_string_helper.c

--=20
2.20.1



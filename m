Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1AC217DA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 13:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRbHO-0001Kr-NJ
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 07:44:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRbGL-0000mW-16
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRbGJ-0000Hh-QA
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:42:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hRbGJ-0000Gs-It; Fri, 17 May 2019 07:42:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1033D3086205;
	Fri, 17 May 2019 11:42:49 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 810685C706;
	Fri, 17 May 2019 11:42:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 13:42:43 +0200
Message-Id: <20190517114243.8998-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 17 May 2019 11:42:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM v2 s390x 00/40] s390x/tcg: s390x/tcg:
 Vector Instruction Support Part 2
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pull request is not for master.

Hi Cornelia,

This time a signed pull request :)

The following changes since commit 85fa94e16927af2717093e5b8fe225206ec39e=
16:

  s390/css: handle CCW_FLAG_SKIP (2019-05-17 08:16:02 +0200)

are available in the Git repository at:

  https://github.com/davidhildenbrand/qemu.git tags/s390x-tcg-2019-05-17-=
2

for you to fetch changes up to db156ebfae0d7707d81d13234e2fd43dd3347298:

  s390x/tcg: Implement VECTOR TEST UNDER MASK (2019-05-17 10:54:13 +0200)

----------------------------------------------------------------
Implement all Vector Integer Instructions introduced with the
"Vector Facility" for s390x TCG.

----------------------------------------------------------------
David Hildenbrand (40):
  s390x/tcg: Implement VECTOR ADD
  s390x/tcg: Implement VECTOR ADD COMPUTE CARRY
  s390x/tcg: Implement VECTOR ADD WITH CARRY
  s390x/tcg: Implement VECTOR ADD WITH CARRY COMPUTE CARRY
  s390x/tcg: Implement VECTOR AND (WITH COMPLEMENT)
  s390x/tcg: Implement VECTOR AVERAGE
  s390x/tcg: Implement VECTOR AVERAGE LOGICAL
  s390x/tcg: Implement VECTOR CHECKSUM
  s390x/tcg: Implement VECTOR ELEMENT COMPARE *
  s390x/tcg: Implement VECTOR COMPARE *
  s390x/tcg: Implement VECTOR COUNT LEADING ZEROS
  s390x/tcg: Implement VECTOR COUNT TRAILING ZEROS
  s390x/tcg: Implement VECTOR EXCLUSIVE OR
  s390x/tcg: Implement VECTOR GALOIS FIELD MULTIPLY SUM (AND ACCUMULATE)
  s390x/tcg: Implement VECTOR LOAD COMPLEMENT
  s390x/tcg: Implement VECTOR LOAD POSITIVE
  s390x/tcg: Implement VECTOR (MAXIMUM|MINIMUM) (LOGICAL)
  s390x/tcg: Implement VECTOR MULTIPLY AND ADD *
  s390x/tcg: Implement VECTOR MULTIPLY *
  s390x/tcg: Implement VECTOR NAND
  s390x/tcg: Implement VECTOR NOR
  s390x/tcg: Implement VECTOR NOT EXCLUSIVE OR
  s390x/tcg: Implement VECTOR OR
  s390x/tcg: Implement VECTOR OR WITH COMPLEMENT
  s390x/tcg: Implement VECTOR POPULATION COUNT
  s390x/tcg: Implement VECTOR ELEMENT ROTATE LEFT LOGICAL
  s390x/tcg: Implement VECTOR ELEMENT ROTATE AND INSERT UNDER MASK
  s390x/tcg: Implement VECTOR ELEMENT SHIFT
  s390x/tcg: Implement VECTOR SHIFT LEFT (BY BYTE)
  s390x/tcg: Implement VECTOR SHIFT LEFT DOUBLE BY BYTE
  s390x/tcg: Implement VECTOR SHIFT RIGHT ARITHMETIC
  s390x/tcg: Implement VECTOR SHIFT RIGHT LOGICAL *
  s390x/tcg: Implement VECTOR SUBTRACT
  s390x/tcg: Implement VECTOR SUBTRACT COMPUTE BORROW INDICATION
  s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW INDICATION
  s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW COMPUTE BORROW
    INDICATION
  s390x/tcg: Implement VECTOR SUM ACROSS DOUBLEWORD
  s390x/tcg: Implement VECTOR SUM ACROSS QUADWORD
  s390x/tcg: Implement VECTOR SUM ACROSS WORD
  s390x/tcg: Implement VECTOR TEST UNDER MASK

 target/s390x/Makefile.objs      |    2 +-
 target/s390x/cc_helper.c        |   17 +
 target/s390x/helper.c           |    1 +
 target/s390x/helper.h           |   66 ++
 target/s390x/insn-data.def      |  137 +++
 target/s390x/internal.h         |    1 +
 target/s390x/translate.c        |    2 +
 target/s390x/translate_vx.inc.c | 1420 +++++++++++++++++++++++++++++++
 target/s390x/vec_int_helper.c   |  616 ++++++++++++++
 9 files changed, 2261 insertions(+), 1 deletion(-)
 create mode 100644 target/s390x/vec_int_helper.c

--=20
2.20.1



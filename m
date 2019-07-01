Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468B24B5F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 11:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT0z2-0007KJ-Gw
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 05:22:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hT0xJ-0006ma-9t
	for qemu-devel@nongnu.org; Tue, 21 May 2019 05:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hT0xH-0007aI-D6
	for qemu-devel@nongnu.org; Tue, 21 May 2019 05:21:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hT0xD-0007XL-Ic; Tue, 21 May 2019 05:21:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0275186668;
	Tue, 21 May 2019 09:20:54 +0000 (UTC)
Received: from localhost (ovpn-204-120.brq.redhat.com [10.40.204.120])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C9875D9C8;
	Tue, 21 May 2019 09:20:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2019 11:20:47 +0200
Message-Id: <20190521092048.28492-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 21 May 2019 09:20:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 00/54] s390x update
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
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Note: I'm only sending the changed headers update to spare everybody ano=
ther
patch avalanche. The remainder of the patches is unchanged, save for the
changed commit ids of the cpumodel patches on top of the headers update.]

The following changes since commit d8276573da58e8ce78dab8c46dd660efd664bc=
b7:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190510' into =
staging (2019-05-16 13:15:08 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20190521-2

for you to fetch changes up to 4d727d1aa0e5cbf9f5f00968698dfa34c7b47b08:

  s390x/cpumodel: wire up 8561 and 8562 as gen15 machines (2019-05-21 10:=
40:03 +0200)

----------------------------------------------------------------
s390x update:
- have the bios tolerate bootmap signature entries
- next chunk of vector instruction support in tcg
- a headers update against Linux 5.2-rc1
- add more facilities and gen15 machines to the cpu model

----------------------------------------------------------------

Christian Borntraeger (8):
  s390x/cpumodel: ignore csske for expansion
  s390x/cpumodel: Miscellaneous-Instruction-Extensions Facility 3
  s390x/cpumodel: msa9 facility
  s390x/cpumodel: vector enhancements
  s390x/cpumodel: enhanced sort facility
  s390x/cpumodel: add Deflate-conversion facility
  s390x/cpumodel: add gen15 defintions
  s390x/cpumodel: wire up 8561 and 8562 as gen15 machines

Cornelia Huck (3):
  s390/ipl: cast to SCSIDevice directly
  s390/css: handle CCW_FLAG_SKIP
  linux headers: update against Linux 5.2-rc1

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

Jason J. Herne (1):
  s390-bios: Skip bootmap signature entries

Markus Armbruster (1):
  pc-bios/s390-ccw: Clean up harmless misuse of isdigit()

Thomas Huth (1):
  pc-bios/s390: Update firmware image with "Skip bootmap signature
    entries" fix

--=20
2.20.1



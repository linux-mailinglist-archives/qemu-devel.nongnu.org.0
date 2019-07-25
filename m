Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B7742DC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 03:25:10 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqSVI-0008Uu-OV
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 21:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqSV4-00085q-4D
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 21:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqSV3-0006Ip-52
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 21:24:54 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:21509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1hqSV2-0006IF-Th
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 21:24:53 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 02:24:48 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 02:24:49 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 02:24:49 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v3 0/1] configure: Define target access
 alignment in configure
Thread-Index: AQHVQofA53jAC+HLk02+ryKZKcZsYQ==
Date: Thu, 25 Jul 2019 01:24:49 +0000
Message-ID: <8a5c6ca782b64899b7d6fbf47e8e6869@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Subject: [Qemu-devel] [PATCH v3 0/1] configure: Define target access
 alignment in configure
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
Cc: ehabkost@redhat.com, arikalo@wavecomp.com, mark.cave-ayland@ilande.co.uk,
 jcmvbkbc@gmail.com, atar4qemu@gmail.com, amarkovic@wavecomp.com,
 aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the define of target access alignment earlier from=0A=
target/foo/cpu.h to configure.=0A=
=0A=
Suggested in Richard Henderson's reply to "[PATCH 1/4] tcg: TCGMemOp=0A=
is now accelerator independent MemOp"=0A=
=0A=
Analysed target/foo/cpu.h for more candidates to define earlier but        =
     =0A=
did not spot any other straight forward predicates.=0A=
=0A=
Possible future clean ups:=0A=
- TCG_GUEST_DEFAULT_MO and TCG_TARGET_DEFAULT_MO seems like duplicates=0A=
- TARGET_INSN_START_EXTRA_WORDS 1 seems redundant as ifndef value is 1=0A=
=0A=
v2:=0A=
- split cosmetic changes into separate patch=0A=
- cc corresponding maintainers=0A=
=0A=
v3:=0A=
- dropped cosmetic changes=0A=
- improved commit message=0A=
=0A=
Tony Nguyen (1):=0A=
  configure: Define target access alignment in configure=0A=
=0A=
 configure             | 10 +++++++++-=0A=
 include/exec/poison.h |  1 +=0A=
 include/qom/cpu.h     |  2 +-=0A=
 target/alpha/cpu.h    |  2 --=0A=
 target/hppa/cpu.h     |  1 -=0A=
 target/mips/cpu.h     |  2 --=0A=
 target/sh4/cpu.h      |  2 --=0A=
 target/sparc/cpu.h    |  2 --=0A=
 target/xtensa/cpu.h   |  2 --=0A=
 tcg/tcg.c             |  2 +-=0A=
 tcg/tcg.h             |  8 +++++---=0A=
 11 files changed, 17 insertions(+), 17 deletions(-)=0A=
=0A=
-- =0A=
1.8.3.1=0A=


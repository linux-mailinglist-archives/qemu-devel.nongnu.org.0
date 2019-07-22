Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE26F7F5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 05:28:37 +0200 (CEST)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpP08-0008OR-97
	for lists+qemu-devel@lfdr.de; Sun, 21 Jul 2019 23:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39019)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpOzw-0007zy-AP
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpOzv-0000rd-CX
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:28:24 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:45386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1hpOzv-0000ql-6x
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:28:23 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 04:27:28 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 04:28:21 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 04:28:21 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 2/2] configure: Cosmetic yes to "yes" for
 consistency
Thread-Index: AQHVQD2CTHoghAdGp0K1G/lCTRkU4w==
Date: Mon, 22 Jul 2019 03:28:20 +0000
Message-ID: <1563766100248.83249@bt.com>
References: <945056df7ff54ce6b272dce64721d916@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <945056df7ff54ce6b272dce64721d916@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-devel] [PATCH v2 2/2] configure: Cosmetic yes to "yes" for
 consistency
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
 jcmvbkbc@gmail.com, aurelien@aurel32.net, amarkovic@wavecomp.com,
 atar4qemu@gmail.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>=0A=
---=0A=
 configure | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/configure b/configure=0A=
index 8316a16..c07687c 100755=0A=
--- a/configure=0A=
+++ b/configure=0A=
@@ -7433,7 +7433,7 @@ esac=0A=
 target_bigendian=3D"no"=0A=
 case "$target_name" in=0A=
   armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|mips64|moxie|or1=
k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus|xtensaeb)=0A=
-  target_bigendian=3Dyes=0A=
+  target_bigendian=3D"yes"=0A=
   ;;=0A=
 esac=0A=
 target_softmmu=3D"no"=0A=
-- =0A=
1.8.3.1=0A=


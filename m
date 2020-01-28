Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495F14B1B0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 10:23:24 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwN5f-0002o0-31
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 04:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mkysel@tachyum.com>) id 1iwN4x-0002PK-RT
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:22:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mkysel@tachyum.com>) id 1iwN4w-0006iA-JE
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:22:39 -0500
Received: from mail.tachyum.com ([66.160.133.170]:13863)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mkysel@tachyum.com>) id 1iwN4w-0006gq-Du
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:22:38 -0500
Received: by mail.tachyum.com (Postfix, from userid 1001)
 id 9C25522A; Tue, 28 Jan 2020 01:22:40 -0800 (PST)
Received: from THQ-IP-EX1.tachyum.com (relayhost.tachyum.com [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tachyum.com (Postfix) with ESMTPS id DCF6D22A;
 Tue, 28 Jan 2020 01:22:29 -0800 (PST)
Received: from THQ-IP-EX1.tachyum.com (10.7.1.6) by THQ-IP-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1779.2; Tue, 28
 Jan 2020 01:22:19 -0800
Received: from THQ-IP-EX1.tachyum.com ([10.7.1.6]) by THQ-IP-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.1779.007; Tue, 28 Jan 2020 01:22:19 -0800
From: Matus Kysel <mkysel@tachyum.com>
Subject: RE: [PATCH] Handling SIGSETXID used by glibc NPTL setuid/setgid
Thread-Topic: [PATCH] Handling SIGSETXID used by glibc NPTL setuid/setgid
Thread-Index: AQHVzGQqrHSj9zHGnEiyLpT/roCO4qf/3uCg
Date: Tue, 28 Jan 2020 09:22:19 +0000
Message-ID: <aaa382580ce746dd844e27825dc87039@tachyum.com>
References: <20200116115700.127951-1-mkysel@tachyum.com>
In-Reply-To: <20200116115700.127951-1-mkysel@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.241.78]
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.160.133.170
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

It seems my patch was ignore. Ping!
=20
https://patchew.org/QEMU/20200116115700.127951-1-mkysel@tachyum.com/

-----Original Message-----
From: Matus Kysel <mkysel@tachyum.com>=20
Sent: =B9tvrtok 16. janu=E1ra 2020 12:57
Cc: Matus Kysel <mkysel@tachyum.com>; Riku Voipio <riku.voipio@iki.fi>; Lau=
rent Vivier <laurent@vivier.eu>; open list:All patches CC here <qemu-devel@=
nongnu.org>
Subject: [PATCH] Handling SIGSETXID used by glibc NPTL setuid/setgid

Used same style to handle another glibc reserved signal SIGSETXID (33), tha=
t is used by glibc NPTL setuid/setgid functions. This should fix problems w=
ith application using those functions and failing with error "qemu:handle_c=
pu_signal received signal outside vCPU context".

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
---
 linux-user/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c index 0128bde4d2..c5=
9221fd0a 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -66,11 +66,16 @@ static uint8_t host_to_target_signal_table[_NSIG] =3D {
     [SIGPWR] =3D TARGET_SIGPWR,
     [SIGSYS] =3D TARGET_SIGSYS,
     /* next signals stay the same */
-    /* Nasty hack: Reverse SIGRTMIN and SIGRTMAX to avoid overlap with
-       host libpthread signals.  This assumes no one actually uses SIGRTMA=
X :-/
-       To fix this properly we need to do manual signal delivery multiplex=
ed
-       over a single host signal.  */
+    /*
+     * Nasty hack: Swap SIGRTMIN and SIGRTMIN + 1 with SIGRTMAX and SIGRTM=
AX - 1
+     * to avoid overlap with host libpthread (NPTL glibc) signals.
+     * This assumes no one actually uses SIGRTMAX and SIGRTMAX - 1 :-/
+     * To fix this properly we need to do manual signal delivery multiplex=
ed
+     * over a single host signal.
+     */
     [__SIGRTMIN] =3D __SIGRTMAX,
+    [__SIGRTMIN + 1] =3D __SIGRTMAX - 1,
+    [__SIGRTMAX - 1] =3D __SIGRTMIN + 1,
     [__SIGRTMAX] =3D __SIGRTMIN,
 };
 static uint8_t target_to_host_signal_table[_NSIG];
--
2.17.1



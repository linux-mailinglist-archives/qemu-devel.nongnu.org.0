Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5224191FD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:08:21 +0200 (CEST)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnYa-0004V9-8V
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJr-0005P9-15; Mon, 27 Sep 2021 05:53:08 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJo-0004JD-TC; Mon, 27 Sep 2021 05:53:06 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3UhO-1mVLY32i9q-000fFI; Mon, 27
 Sep 2021 11:52:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] hmp: Drop a bogus sentence from set_password's
 documentation
Date: Mon, 27 Sep 2021 11:52:51 +0200
Message-Id: <20210927095252.2374148-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
References: <20210927095252.2374148-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W5eKuZJZkohu9ArgsTMECMm94Wxyc0D+jGZpw2qqlQto0cOp1Tm
 h5vu+vJNJ3b6ndJZOlQ3idoow36x8T1F0yBC+bmLemElz6TSE2/idJ9UgdtV8gMAfRHi0QY
 xGccOzJ7DL/605fEqQZy9NrAYph1HIgGneW54S/xEm9HJWpvznB84daokkyynf+iIgYOQmR
 M5TJ9WaB3JItdf0Rux8sQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:62oNxCQzLCk=:+HDUsyxpsc2pi/Xmo98+/7
 HPn3iBvGTuKapFLnO+v1szvAK6Hpt89XX2x8h0IUne2Z0GoU8YzPGSpu1VMzZMjhPlST9JUI6
 k74gyHgGKqQK54S04BwbRBLILWMMjTbBkpAik3kuLZTw6AzdKn45m8wK/0gtpac4W596H+CL9
 DomXZcxMsLByZN0RvIK+ni+UDTAUxhhns2Fqlie9RTge1rsAQUSDQJ8Y4pkHTCf42E4dsgkz/
 EwfoBJHl0PrnAciU7d+clgyJSWWdAx+90vmM64qO+q4IUYdTB/RfHQeWRCGJGCcDVy83sRqx4
 Ofqj7VZDF2nnxgcuKvlVcKUIzp3ewNtlgkUKuk/gi00VE+6wsgD5dzrqYXofDhyC5RsTpitGh
 O+eqiKsg9Mszf4p7Qb5QJq4BYOxI0a2wmB5WdniEbblRVAZp8GaqO0rJZ6poiy8XSnXrjtG/r
 tpijQn4MzOBho7oRyXrUKj+n7fe+og/bg1xyX/TTSOzpkxNBg4I3OKHwAeh4hwujksI80qlcs
 +VfRFXvg/GRGceskv71tZK8vRMMT8+dff/ozNgk4tzHtbBNGOICTj8ru7oh4bKJSUeQigsJPH
 up6C7LEcjqkaDx4Uunt8J6mJf34b3CZ9Ly9FWWp0k+mN42DYETTE63fOwh5EmzZDvIGVv0qqG
 lotvi722CPGl/RBqVu5V816Sh6ThEA8D7BQa4gdhD5Vz4Wg/H7B/tJRJi7ZsdvLmaK36rct4s
 /MCx50YrH3NOeivK7Q89ua3u1zOF1FwN/sBnbQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210909081219.308065-3-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hmp-commands.hx | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce2cd9d..cf723c69acb7 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1522,12 +1522,11 @@ ERST
 
 SRST
 ``set_password [ vnc | spice ] password [ action-if-connected ]``
-  Change spice/vnc password.  Use zero to make the password stay valid
-  forever.  *action-if-connected* specifies what should happen in
-  case a connection is established: *fail* makes the password change
-  fail.  *disconnect* changes the password and disconnects the
-  client.  *keep* changes the password and keeps the connection up.
-  *keep* is the default.
+  Change spice/vnc password.  *action-if-connected* specifies what
+  should happen in case a connection is established: *fail* makes the
+  password change fail.  *disconnect* changes the password and
+  disconnects the client.  *keep* changes the password and keeps the
+  connection up.  *keep* is the default.
 ERST
 
     {
-- 
2.31.1



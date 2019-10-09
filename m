Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24CD177E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 20:21:51 +0200 (CEST)
Received: from localhost ([::1]:53741 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIGas-0007sm-Ih
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 14:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iICNl-0006D7-J6
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iICNj-0006Ak-Lv
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:52:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iICNj-0006Aa-Gm
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:51:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE10930224AC
 for <qemu-devel@nongnu.org>; Wed,  9 Oct 2019 13:51:58 +0000 (UTC)
Received: from localhost (ovpn-116-110.ams2.redhat.com [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F2F5D6B2;
 Wed,  9 Oct 2019 13:51:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace: add --group=all to tracing.txt
Date: Wed,  9 Oct 2019 14:51:54 +0100
Message-Id: <20191009135154.10970-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 09 Oct 2019 13:51:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tracetool needs to know the group name ("all", "root", or a specific
subdirectory).  Also remove the stdin redirection because tracetool.py
needs the path to the trace-events file.  Update the documentation.

Fixes: 2098c56a9bc5901e145fa5d4759f075808811685
       ("trace: move setting of group name into Makefiles")
Launchpad: https://bugs.launchpad.net/bugs/1844814
Reported-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/tracing.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
index 8231bbf5d1..8c0376fefa 100644
--- a/docs/devel/tracing.txt
+++ b/docs/devel/tracing.txt
@@ -317,7 +317,8 @@ probes:
                          --binary path/to/qemu-binary \
                          --target-type system \
                          --target-name x86_64 \
-                         <trace-events-all >qemu.stp
+                         --group=3Dall \
+                         trace-events-all >qemu.stp
=20
 To facilitate simple usage of systemtap where there merely needs to be p=
rintf
 logging of certain probes, a helper script "qemu-trace-stap" is provided=
.
--=20
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F6F451E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 11:57:06 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT1wv-0000Td-19
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 05:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iT1vs-0008Ud-12
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:56:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iT1vq-000192-R3
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:55:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59929
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iT1tu-0000B5-Ks
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573210438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s5hx/Ucb4hWJIhpg0FdBXhst8yso9KlPH/9MF4FIRJg=;
 b=cpDCXV9XdrcJFO88lGaVhQ4yyLOmcwXBNlzttSltlsID3b5NC3qTqP/0Y+BTjWFt3fHkYn
 n1g65wosgRagWYvTMgP02a58ZOfhXc8L3BujtwKbE4lIdzJ0Fp2bzsf+eqQ6qSUGB7CqCh
 SRuemhMXxGXZzpoibScc2qVNzVsQP5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-tJmgPNL7P8aR9esZBCJrzA-1; Fri, 08 Nov 2019 05:53:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D151005500
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 10:53:54 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB95460BE2;
 Fri,  8 Nov 2019 10:53:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2] documentation: link to nightly documentation
Date: Fri,  8 Nov 2019 11:53:49 +0100
Message-Id: <20191108105349.402883-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tJmgPNL7P8aR9esZBCJrzA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Link to the documentation built from qemu.git/master once a day.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v2:
 * Use a qemu.org URL, not a wiki.qemu.org URL [danpb]
---
 documentation.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation.md b/documentation.md
index f4ef9f4..662750c 100644
--- a/documentation.md
+++ b/documentation.md
@@ -3,6 +3,8 @@ title: QEMU documentation
 permalink: /documentation/
 ---
=20
+The latest development version documentation is available [here](https://w=
iki.qemu.org/docs/index.html).
+
 The [QEMU user manual](https://qemu.weilnetz.de/qemu-doc.html) can be read=
 online, courtesy of Stefan Weil.
 More documentation is found in the <a href=3D"https://git.qemu.org/?p=3Dqe=
mu.git;a=3Dtree;f=3Ddocs;hb=3Dmaster">`docs`</a>
 directory of the QEMU git tree.
--=20
2.23.0



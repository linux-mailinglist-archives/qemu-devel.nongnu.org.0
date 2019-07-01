Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE303461E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 14:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY89n-0002pV-RA
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 08:03:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY84W-0007u9-9l
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY7zM-0000Qu-Rr
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:52:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60683)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hY7zL-0000Pb-VC
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:52:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E45C8CB56
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 11:52:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D93B60C9E;
	Tue,  4 Jun 2019 11:52:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A33B211386A3; Tue,  4 Jun 2019 13:52:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 13:52:19 +0200
Message-Id: <20190604115221.28364-2-armbru@redhat.com>
In-Reply-To: <20190604115221.28364-1-armbru@redhat.com>
References: <20190604115221.28364-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 04 Jun 2019 11:52:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] MAINTAINERS: Add qemu-bridge-helper.c to
 "Network device backends"
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a96829ea83..8b73f1f0d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1936,6 +1936,7 @@ M: Jason Wang <jasowang@redhat.com>
 S: Maintained
 F: net/
 F: include/net/
+F: qemu-bridge-helper.c
 T: git https://github.com/jasowang/qemu.git net
 F: qapi/net.json
=20
--=20
2.21.0



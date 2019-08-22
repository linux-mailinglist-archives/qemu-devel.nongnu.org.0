Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0E9935B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 14:27:04 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0mBD-0006P4-NY
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 08:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i0m8B-0003rj-Cv
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 08:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i0m8A-0004Cr-69
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 08:23:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i0m89-0004Bb-TQ
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 08:23:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 634D68125C;
 Thu, 22 Aug 2019 12:23:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3289768370;
 Thu, 22 Aug 2019 12:23:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A903B11655F2; Thu, 22 Aug 2019 14:23:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 14:23:50 +0200
Message-Id: <20190822122350.29852-3-armbru@redhat.com>
In-Reply-To: <20190822122350.29852-1-armbru@redhat.com>
References: <20190822122350.29852-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 22 Aug 2019 12:23:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] contrib/gitdm: Add armbru@pond.sub.org to
 group-map-redhat
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just to get the (few) accidental uses of my private e-mail address
attributed correctly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 contrib/gitdm/group-map-redhat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-red=
hat
index 6d05c6b54f..d15db2d35e 100644
--- a/contrib/gitdm/group-map-redhat
+++ b/contrib/gitdm/group-map-redhat
@@ -5,3 +5,4 @@
 david@gibson.dropbear.id.au
 laurent@vivier.eu
 pjp@fedoraproject.org
+armbru@pond.sub.org
--=20
2.21.0



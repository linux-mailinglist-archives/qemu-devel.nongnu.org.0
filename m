Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5551A1021
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:23:57 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLq4y-0000qS-86
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jLq3u-00083E-KY
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jLq3t-0000QX-Oj
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:50 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:15905)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jLq3t-0000Ov-GM
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qg827KIvdKEzs6jvNwGqMNXyL08iW2Xpsw7/s+ZIo+U=;
 b=V8o7vYc51hqOZDOa1Gg4S5mY2soj2zTUTUK6aXiAhU+IwVM61h72ZOhV
 eTp6R/vXIMDIfriIwFU4MzTR1jRJCTsf063qWPdSTF2xBkEpzSQCRadS5
 vZ/cSmeAEIXIvQEv6Z/ULywPlb7VUJlt7PpCLy4a8tplEuMXmqA/t5MfW I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kEEUF3m5QJdGP+nVunsvGYsRB0qPKBIMKb/0kGJ3Ad5qvTmdLxzqw07ltbH+HjkMS71Lrl6qAZ
 yaqI6F3eG7Ljvf+RIJ4y5SPiYNj2f/YSQoguctmkfywB1hHd8dYISMCx2YiySk4t6THD2BQCLP
 knLe7MnbkruiyE3zrnKMGimmjyRfL/DuVm0FlJIL58nV+zkLXePqoukx+rwJVM+fHTfww1YqlB
 xHvSG8Zx8+xBzBZrflAGWY1Q724URub+FE+lbwk29Fg0NiOIHzB4pSav/fbtBaxYHZbvF4WFqP
 4ps=
X-SBRS: 2.7
X-MesageID: 15974527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15974527"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 2/3] xen-block: Fix uninitialized variable
Date: Tue, 7 Apr 2020 16:22:36 +0100
Message-ID: <20200407152237.1468704-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200407152237.1468704-1-anthony.perard@citrix.com>
References: <20200407152237.1468704-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.155.144
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 7f5d9b206d1e ("object-add: don't create return value if
failed"), qmp_object_add() don't write any value in 'ret_data', thus
has random data. Then qobject_unref() fails and abort().

Fix by initialising 'ret_data' properly.

Fixes: 5f07c4d60d09 ("qapi: Flatten object-add")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200406164207.1446817-1-anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 07bb32e22b51..99cb4c67cb09 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -860,7 +860,7 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
     XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
     Error *local_err = NULL;
     QDict *opts;
-    QObject *ret_data;
+    QObject *ret_data = NULL;
 
     iothread->id = g_strdup(id);
 
-- 
Anthony PERARD



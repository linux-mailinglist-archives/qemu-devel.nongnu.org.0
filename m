Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4BE7264
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:08:10 +0100 (CET)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4kj-0001I8-2j
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xs-0004O6-5D
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xm-0002Xr-JZ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55383
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xm-0002XK-8f
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rjjz3MsAGUfHfQ9MWUBX1nt5O6CnXPytlrmKQsKSedM=;
 b=bh0XOthtOMRiztCTm8rYF90DTRE9QlNSBd8E5fDeAvBFBFUIxc4Zv8oWh6weaH1yXv5Plb
 1tDZRAOxAd9ay1ZsE+H4iJpOL8K8q+msMxwbU43jaiPK7LOEJ/IVMqLE1y0Rwmt5Usgbsj
 5ZGTtkwj/zSX5V4w30OgntILMlLhUOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-qrVjP8ooM2G6QniIJQdXkw-1; Mon, 28 Oct 2019 08:17:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A88476;
 Mon, 28 Oct 2019 12:17:28 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B465D6BB;
 Mon, 28 Oct 2019 12:17:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 69/69] qemu-iotests: restrict 264 to qcow2 only
Date: Mon, 28 Oct 2019 13:15:01 +0100
Message-Id: <20191028121501.15279-70-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: qrVjP8ooM2G6QniIJQdXkw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

264 is unprepared to run with different formats, for example luks needs
handling keys, cloop doesn't support image creation, vpc creates image
larger than requested (which breaks "Backup completed: 5242880" in test
output).

The test is here to check nbd-reconnect feature and we actually don't
need it for all formats. Let's restrict it to qcow2 only.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20191025145023.6182-1-vsementsov@virtuozzo.com
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/264 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index c8cd97ae2b..131366422b 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -24,6 +24,8 @@ import iotests
 from iotests import qemu_img_create, qemu_io_silent_check, file_path, \
         qemu_nbd_popen, log
=20
+iotests.verify_image_format(supported_fmts=3D['qcow2'])
+
 disk_a, disk_b, nbd_sock =3D file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri =3D 'nbd+unix:///?socket=3D' + nbd_sock
 size =3D 5 * 1024 * 1024
--=20
2.21.0



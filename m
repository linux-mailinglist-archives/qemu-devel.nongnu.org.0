Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E292143D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:53:16 +0100 (CET)
Received: from localhost ([::1]:53368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itt1v-0008JS-4b
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itscW-0007KO-R9
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itscV-0002Qf-Ov
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:00 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60891
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itscU-0002Ow-U8
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LChwemckiLjUJ17lsVwLXIff87pjDfNhrjcC19rE6aM=;
 b=JUoyiJxfHj6pd0UGmMjK3cCZ//HK/SiZIqjYoZ2/P94Ahbh3+r+SRR9ZeQ3nDZ2u4K7eyC
 PmHaTNwbxQz9Fz2X4tpm+FO4fWQYOid/A4Wx0RJ5zaMtQrP9BuQ+NnR2uBDXoo+KfGSAJF
 voQ+iJQe3VkLiDLedvwOrYaIgogL3To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-VyfcQI9UMXWn8vImQOH8Mg-1; Tue, 21 Jan 2020 07:26:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C67107ACC7;
 Tue, 21 Jan 2020 12:26:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 375F860BE0;
 Tue, 21 Jan 2020 12:26:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 030/109] virtiofsd: add vhost-user.json file
Date: Tue, 21 Jan 2020 12:23:14 +0000
Message-Id: <20200121122433.50803-31-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: VyfcQI9UMXWn8vImQOH8Mg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Install a vhost-user.json file describing virtiofsd.  This allows
libvirt and other management tools to enumerate vhost-user backend
programs.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 .gitignore                                | 1 +
 Makefile                                  | 1 +
 tools/virtiofsd/50-qemu-virtiofsd.json.in | 5 +++++
 3 files changed, 7 insertions(+)
 create mode 100644 tools/virtiofsd/50-qemu-virtiofsd.json.in

diff --git a/.gitignore b/.gitignore
index efad605e1a..bc0a035f9c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 /config-target.*
 /config.status
 /config-temp
+/tools/virtiofsd/50-qemu-virtiofsd.json
 /elf2dmp
 /trace-events-all
 /trace/generated-events.h
diff --git a/Makefile b/Makefile
index b4ffb0c3d9..a87e06ad93 100644
--- a/Makefile
+++ b/Makefile
@@ -329,6 +329,7 @@ endif
=20
 ifdef CONFIG_LINUX
 HELPERS-y +=3D virtiofsd$(EXESUF)
+vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
 endif
=20
 # Sphinx does not allow building manuals into the same directory as
diff --git a/tools/virtiofsd/50-qemu-virtiofsd.json.in b/tools/virtiofsd/50=
-qemu-virtiofsd.json.in
new file mode 100644
index 0000000000..9bcd86f8dc
--- /dev/null
+++ b/tools/virtiofsd/50-qemu-virtiofsd.json.in
@@ -0,0 +1,5 @@
+{
+  "description": "QEMU virtiofsd vhost-user-fs",
+  "type": "fs",
+  "binary": "@libexecdir@/virtiofsd"
+}
--=20
2.24.1



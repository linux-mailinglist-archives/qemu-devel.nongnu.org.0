Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA959DEB12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:37:34 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMW0D-0004Hc-N6
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iMVR5-0004Q6-9h
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iMVR0-0004T5-7P
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:01:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37911
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iMVR0-0004Sz-3O
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+hP7fPYDJJKhRNFfnqGM1Azp0QsnYMDYIRrTz9X32k=;
 b=ZOnN4h2cjhcv6l2KXi/9BaSLyTtT9HYqgMKYwQg+3/GQoPtcvUulsoVBI0Fo8o42U6pV2v
 TUgcu3XriciNdUQoYWedJyfhsF0BgCiLx6X01IyImQYtfYbUtI57OKU4tiFMLFyTOQlqVt
 lcyWFexpqjJarOg2ICfvx/z8yXrqvvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-cCoFHhGSNYmJ0MhJNVCYTg-1; Mon, 21 Oct 2019 07:00:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3488800D41;
 Mon, 21 Oct 2019 11:00:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
 [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B241B60619;
 Mon, 21 Oct 2019 11:00:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com
Subject: [PATCH 28/30] virtiofsd: add vhost-user.json file
Date: Mon, 21 Oct 2019 11:58:30 +0100
Message-Id: <20191021105832.36574-29-dgilbert@redhat.com>
In-Reply-To: <20191021105832.36574-1-dgilbert@redhat.com>
References: <20191021105832.36574-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cCoFHhGSNYmJ0MhJNVCYTg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: piaojun@huawei.com, eguan@linux.alibaba.com, vgoyal@Redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Install a vhost-user.json file describing virtiofsd.  This allows
libvirt and other management tools to enumerate vhost-user backend
programs.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 .gitignore                                  | 1 +
 Makefile                                    | 1 +
 contrib/virtiofsd/50-qemu-virtiofsd.json.in | 5 +++++
 3 files changed, 7 insertions(+)
 create mode 100644 contrib/virtiofsd/50-qemu-virtiofsd.json.in

diff --git a/.gitignore b/.gitignore
index 7de868d1ea..e9f621be06 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 /config-target.*
 /config.status
 /config-temp
+/contrib/virtiofsd/50-qemu-virtiofsd.json
 /elf2dmp
 /trace-events-all
 /trace/generated-events.h
diff --git a/Makefile b/Makefile
index 694a871384..20531a32ae 100644
--- a/Makefile
+++ b/Makefile
@@ -317,6 +317,7 @@ HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =
=3D qemu-bridge-helper$(EXE
=20
 ifdef CONFIG_LINUX
 HELPERS-y +=3D virtiofsd$(EXESUF)
+vhost-user-json-y +=3D contrib/virtiofsd/50-qemu-virtiofsd.json
=20
 ifdef CONFIG_VIRGL
 ifdef CONFIG_GBM
diff --git a/contrib/virtiofsd/50-qemu-virtiofsd.json.in b/contrib/virtiofs=
d/50-qemu-virtiofsd.json.in
new file mode 100644
index 0000000000..9bcd86f8dc
--- /dev/null
+++ b/contrib/virtiofsd/50-qemu-virtiofsd.json.in
@@ -0,0 +1,5 @@
+{
+  "description": "QEMU virtiofsd vhost-user-fs",
+  "type": "fs",
+  "binary": "@libexecdir@/virtiofsd"
+}
--=20
2.23.0



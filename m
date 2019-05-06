Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53A14997
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 14:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNcmO-0008Oy-9e
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 08:31:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1hNYQ8-0006ZS-Cl
	for qemu-devel@nongnu.org; Mon, 06 May 2019 03:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1hNYQ7-0008WI-DO
	for qemu-devel@nongnu.org; Mon, 06 May 2019 03:52:20 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:44367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hqm03ster@gmail.com>) id 1hNYQ6-0008Vc-2r
	for qemu-devel@nongnu.org; Mon, 06 May 2019 03:52:18 -0400
Received: by mail-qk1-x741.google.com with SMTP id w25so1217958qkj.11
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=o5xX3C8tLGSyzOs3XjyCI/c5jOX+7y4gxe446FXclO4=;
	b=LEab/cdrENZfYOeLAMJbXAit0664xTbbgSwQzhltS2srzsdd3tK9BQK6ti2jvpi5Kg
	WHLQJGYjF88zIzVmLo0G0xNtdRVnT6995/+4V0t6s0OZkBsW9IKq+F1e8FYoX09aZCyP
	jJ2ClD8E0baBIhOZrZZ5867j8a//w/3EV1B7kt70zEWOeG82TGQxys3jOEfP57kw+9gn
	FroI47isaRIQ6iJv+j3SxCOWGwWNOIf4lBL5kPx5nzhxH39PlN5HhMAOhb7UIjr2mHd2
	SK2XtFPZT6zP3I/om6ZL+cTvUOxyrQhABcVDmx9Vanun80+IAVyz+zQGfrGEG82c4Kxs
	swsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=o5xX3C8tLGSyzOs3XjyCI/c5jOX+7y4gxe446FXclO4=;
	b=EnUEnldYq0rYwfUvdfNLNgFrO8Eg0I2pstECW5LNYAntq2eB8wFJSJ86J7rhX4eSNR
	cd6vxWYmnZ7h76BPgzzOCt9uHyB4hY8kojNUjg0oEKYmHVzRafB7C47NI4iD/FR0PrPZ
	pxAXKNB7gydtyOR6bNfgLt4yk5CoDsvnPSrtXwzlzrm0gcOfEOF9JHsdHKJ9RyF7na+S
	yEm92T0xphG5GX6nA2ezPbvq9nnpe9U6+pyTQUF9KqqdUvxxf/GMMe74nNJ6q628exTB
	41Ut/tD5YbBgrLmrb1nZo+Ej7yTuQPzYQD8zh8lONPSgemxM25pIp3dYsXQ8d3K7nUWO
	N8Gg==
X-Gm-Message-State: APjAAAUATilDHfaRNMfESbQfiucf8iHjGa7AK1n9uxTLyZaQjhhwhPHJ
	9PcfJWjebmJJ7vLZd1jsl4qb69t6KlPGxJiU5kA=
X-Google-Smtp-Source: APXvYqy2ZjPKUsoWkJ1G99ABRoTybQk01HKjoTzE/SV52MMz2cWpO+8vuM8DtxstGMp5tVQ067fGcT0XHCOPqYn8JH0=
X-Received: by 2002:a37:a5c6:: with SMTP id o189mr5022926qke.318.1557129136290;
	Mon, 06 May 2019 00:52:16 -0700 (PDT)
MIME-Version: 1.0
From: Hou Qiming <hqm03ster@gmail.com>
Date: Mon, 6 May 2019 15:50:18 +0800
Message-ID: <CABSdmrnNW6f=P64PviPP8CTJ5SVfYS8_6kmAtpw9yPObTEkpxg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
X-Mailman-Approved-At: Mon, 06 May 2019 08:29:53 -0400
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Patch: Precautionary glBindTexture in
 surface_gl_update_texture
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 48d1f092a7960d711fb2c77ab8d3f9d0a0ca0d5c Mon Sep 17 00:00:00 2001
From: HQM <hqm03ster@gmail.com>
Date: Mon, 6 May 2019 15:37:59 +0800
Subject: [PATCH] Precautionary glBindTexture and surface->texture validation
 in surface_gl_update_texture

In a GVT-g setup with dmabuf and GTK GUI, the current 2D texture at
surface_gl_update_texture is not necessarily
surface->texture. Adding a glBindTexture fixes related crashes and
artifacts, and is generally more secure.

Signed-off-by: HQM <hqm03ster@gmail.com>
---
 ui/console-gl.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index a56e1cd..c1cb3bd 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -92,13 +92,17 @@ void surface_gl_update_texture(QemuGLShader *gls,

     assert(gls);

-    glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT,
-                  surface_stride(surface) /
surface_bytes_per_pixel(surface));
-    glTexSubImage2D(GL_TEXTURE_2D, 0,
-                    x, y, w, h,
-                    surface->glformat, surface->gltype,
-                    data + surface_stride(surface) * y
-                    + surface_bytes_per_pixel(surface) * x);
+    if (surface->texture) {
+        glBindTexture(GL_TEXTURE_2D, surface->texture);
+        glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT,
+                      surface_stride(surface)
+                      / surface_bytes_per_pixel(surface));
+        glTexSubImage2D(GL_TEXTURE_2D, 0,
+                        x, y, w, h,
+                        surface->glformat, surface->gltype,
+                        data + surface_stride(surface) * y
+                        + surface_bytes_per_pixel(surface) * x);
+    }
 }

 void surface_gl_render_texture(QemuGLShader *gls,
-- 
2.17.1

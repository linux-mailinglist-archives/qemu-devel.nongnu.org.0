Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79940264FFB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 21:57:59 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGShi-0002md-G0
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 15:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSai-0006cE-Ov
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSag-0000lj-P2
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599767442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9vNKAG8qHMhl5vDePVh8sY3FceBRYSzy2AKH9J7ecE=;
 b=NDwtBBrHJtLT6HBigEAH+8MSHeH2GNlZqvpgRH2muoTn98hqpIcB3ChGOS3mCm3xkEOlPZ
 16iieloiTU3Zg938zx6ZMjnhF7jxGSExPhatu89WfptO35aeI89l+C7rMAqJqCsJ/gA4//
 rLOrYaexiuRNCfenPOFesFha0nVQ7MI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-YZcJghuJOX2brIf5dhqGbQ-1; Thu, 10 Sep 2020 15:50:40 -0400
X-MC-Unique: YZcJghuJOX2brIf5dhqGbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F3C010082E6;
 Thu, 10 Sep 2020 19:50:39 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E95315C1BD;
 Thu, 10 Sep 2020 19:50:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/18] chardev: Rename WIN_CHARDEV to CHARDEV_WIN
Date: Thu, 10 Sep 2020 15:49:02 -0400
Message-Id: <20200910194903.4104696-18-ehabkost@redhat.com>
In-Reply-To: <20200910194903.4104696-1-ehabkost@redhat.com>
References: <20200910194903.4104696-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename instance and class type checkers to match the
TYPE_CHARDEV_* constant names and the QOM type name strings
("chardev-*").

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/chardev/char-win.h |  2 +-
 chardev/char-pipe.c        |  2 +-
 chardev/char-win.c         | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/chardev/char-win.h b/include/chardev/char-win.h
index 485521469c..0e718d60c4 100644
--- a/include/chardev/char-win.h
+++ b/include/chardev/char-win.h
@@ -44,7 +44,7 @@ typedef struct WinChardev WinChardev;
 #define NRECVBUF 2048
 
 #define TYPE_CHARDEV_WIN "chardev-win"
-DECLARE_INSTANCE_CHECKER(WinChardev, WIN_CHARDEV,
+DECLARE_INSTANCE_CHECKER(WinChardev, CHARDEV_WIN,
                          TYPE_CHARDEV_WIN)
 
 void win_chr_set_file(Chardev *chr, HANDLE file, bool keep_open);
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index fd12c9e63b..96854cfe99 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -43,7 +43,7 @@
 static int win_chr_pipe_init(Chardev *chr, const char *filename,
                              Error **errp)
 {
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
     OVERLAPPED ov;
     int ret;
     DWORD size;
diff --git a/chardev/char-win.c b/chardev/char-win.c
index d4fb44c4dc..39cfd12177 100644
--- a/chardev/char-win.c
+++ b/chardev/char-win.c
@@ -30,7 +30,7 @@
 
 static void win_chr_read(Chardev *chr, DWORD len)
 {
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
     int max_size = qemu_chr_be_can_write(chr);
     int ret, err;
     uint8_t buf[CHR_READ_BUF_LEN];
@@ -61,7 +61,7 @@ static void win_chr_read(Chardev *chr, DWORD len)
 static int win_chr_serial_poll(void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
-    WinChardev *s = WIN_CHARDEV(opaque);
+    WinChardev *s = CHARDEV_WIN(opaque);
     COMSTAT status;
     DWORD comerr;
 
@@ -75,7 +75,7 @@ static int win_chr_serial_poll(void *opaque)
 
 int win_chr_serial_init(Chardev *chr, const char *filename, Error **errp)
 {
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
     COMMCONFIG comcfg;
     COMMTIMEOUTS cto = { 0, 0, 0, 0, 0};
     COMSTAT comstat;
@@ -142,7 +142,7 @@ int win_chr_serial_init(Chardev *chr, const char *filename, Error **errp)
 int win_chr_pipe_poll(void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
-    WinChardev *s = WIN_CHARDEV(opaque);
+    WinChardev *s = CHARDEV_WIN(opaque);
     DWORD size;
 
     PeekNamedPipe(s->file, NULL, 0, NULL, &size, NULL);
@@ -156,7 +156,7 @@ int win_chr_pipe_poll(void *opaque)
 /* Called with chr_write_lock held.  */
 static int win_chr_write(Chardev *chr, const uint8_t *buf, int len1)
 {
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
     DWORD len, ret, size, err;
 
     len = len1;
@@ -192,7 +192,7 @@ static int win_chr_write(Chardev *chr, const uint8_t *buf, int len1)
 static void char_win_finalize(Object *obj)
 {
     Chardev *chr = CHARDEV(obj);
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
 
     if (s->hsend) {
         CloseHandle(s->hsend);
@@ -214,7 +214,7 @@ static void char_win_finalize(Object *obj)
 
 void win_chr_set_file(Chardev *chr, HANDLE file, bool keep_open)
 {
-    WinChardev *s = WIN_CHARDEV(chr);
+    WinChardev *s = CHARDEV_WIN(chr);
 
     s->keep_open = keep_open;
     s->file = file;
-- 
2.26.2



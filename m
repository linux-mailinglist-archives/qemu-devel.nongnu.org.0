Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC4264FFA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 21:57:58 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGShh-0002lm-Ac
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 15:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSai-0006ZY-05
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:50:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40318
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSaf-0000lT-LU
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599767440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlA62odmh2HZphdCDpVBp6BSdOLXWunBO2fvyN59ZUk=;
 b=DpOy/iCI9w+y6/i1fgWbgmSgLoYXkhRrHaOKwQ98gSyjbbEg7jfl//YLfaCnVw5lpwslhT
 fNbz+dm4zOQrRqiFrRXziCbkvNVCD9JWUZWRPtdKTYp3+I6qYS6Lq+wLh5aTgzdD/GW1jF
 haufTUopy8GZy64iDPTbZvAKwW9Jv1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-OSLEgkZ3P3OoN4F4IxhaUA-1; Thu, 10 Sep 2020 15:50:39 -0400
X-MC-Unique: OSLEgkZ3P3OoN4F4IxhaUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA0E1074640;
 Thu, 10 Sep 2020 19:50:38 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64BD55C1BD;
 Thu, 10 Sep 2020 19:50:32 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] chardev: Rename WCTABLET_CHARDEV to CHARDEV_WCTABLET
Date: Thu, 10 Sep 2020 15:49:01 -0400
Message-Id: <20200910194903.4104696-17-ehabkost@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 chardev/wctablet.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 95e005f5a5..c5b0be0451 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -86,7 +86,7 @@ struct TabletChardev {
 typedef struct TabletChardev TabletChardev;
 
 #define TYPE_CHARDEV_WCTABLET "chardev-wctablet"
-DECLARE_INSTANCE_CHECKER(TabletChardev, WCTABLET_CHARDEV,
+DECLARE_INSTANCE_CHECKER(TabletChardev, CHARDEV_WCTABLET,
                          TYPE_CHARDEV_WCTABLET)
 
 
@@ -187,7 +187,7 @@ static QemuInputHandler wctablet_handler = {
 
 static void wctablet_chr_accept_input(Chardev *chr)
 {
-    TabletChardev *tablet = WCTABLET_CHARDEV(chr);
+    TabletChardev *tablet = CHARDEV_WCTABLET(chr);
     int len, canWrite;
 
     canWrite = qemu_chr_be_can_write(chr);
@@ -208,7 +208,7 @@ static void wctablet_chr_accept_input(Chardev *chr)
 static int wctablet_chr_write(struct Chardev *chr,
                               const uint8_t *buf, int len)
 {
-    TabletChardev *tablet = WCTABLET_CHARDEV(chr);
+    TabletChardev *tablet = CHARDEV_WCTABLET(chr);
     unsigned int i, clen;
     char *pos;
 
@@ -297,7 +297,7 @@ static int wctablet_chr_write(struct Chardev *chr,
 
 static int wctablet_chr_ioctl(Chardev *chr, int cmd, void *arg)
 {
-    TabletChardev *tablet = WCTABLET_CHARDEV(chr);
+    TabletChardev *tablet = CHARDEV_WCTABLET(chr);
     QEMUSerialSetParams *ssp;
 
     switch (cmd) {
@@ -317,7 +317,7 @@ static int wctablet_chr_ioctl(Chardev *chr, int cmd, void *arg)
 
 static void wctablet_chr_finalize(Object *obj)
 {
-    TabletChardev *tablet = WCTABLET_CHARDEV(obj);
+    TabletChardev *tablet = CHARDEV_WCTABLET(obj);
 
     qemu_input_handler_unregister(tablet->hs);
     g_free(tablet);
@@ -328,7 +328,7 @@ static void wctablet_chr_open(Chardev *chr,
                               bool *be_opened,
                               Error **errp)
 {
-    TabletChardev *tablet = WCTABLET_CHARDEV(chr);
+    TabletChardev *tablet = CHARDEV_WCTABLET(chr);
 
     *be_opened = true;
 
-- 
2.26.2



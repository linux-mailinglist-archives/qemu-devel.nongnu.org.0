Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C23402973
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:10:32 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNarv-0004ji-Bt
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaBR-00018g-S7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaBQ-0000Vs-9o
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kbs1DsLIvJdmf816ZYXtbGyx19Q2exBJdVzzAqV6yiA=;
 b=NmQRqBR5mrz5eyxC/SVp/W7pUCUsUO1v20Jf5eICiuUZHdi+gp+ghJmkVedaqEgNWKUl5l
 JGLAJOeDR5TLxlkNx26q0VttSyzTXKJIc0PuIYjYrscCh3g0XY1vofH/bTDctTIIx2pfwg
 kD47OjX0L7+/T+lbvTX06DGpjIUhfbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-JipiMNN5P1OLOX8nYeC1rQ-1; Tue, 07 Sep 2021 08:26:33 -0400
X-MC-Unique: JipiMNN5P1OLOX8nYeC1rQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D7C4107ACCA
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:26:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F624781EE;
 Tue,  7 Sep 2021 12:26:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 31/32] tests/vm: bump fedora VM to f32
Date: Tue,  7 Sep 2021 16:19:42 +0400
Message-Id: <20210907121943.3498701-32-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Rust version shipped in Fedora 30 is < 1.36, and would not let the
build work with --offline. The one in Fedora 31 has some issues with
--offline (https://github.com/rust-lang/cargo/issues/7582)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/vm/fedora | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/vm/fedora b/tests/vm/fedora
index b977efe4a2..03abc8ebe3 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -23,11 +23,11 @@ class FedoraVM(basevm.BaseVM):
     name = "fedora"
     arch = "x86_64"
 
-    base = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/"
-    link = base + "Server/x86_64/iso/Fedora-Server-netinst-x86_64-30-1.2.iso"
+    base = "https://archives.fedoraproject.org/pub/fedora/linux/releases/32/"
+    link = base + "Server/x86_64/iso/Fedora-Server-netinst-x86_64-32-1.6.iso"
     repo = base + "Server/x86_64/os/"
     full = base + "Everything/x86_64/os/"
-    csum = "5e4eac4566d8c572bfb3bcf54b7d6c82006ec3c6c882a2c9235c6d3494d7b100"
+    csum = "7f4afd2a26c718f9f15e4bbfd9c2e8849f81036d2a82a4e81fa4a313a833da9c"
     size = "20G"
     pkgs = [
         # tools
@@ -106,7 +106,7 @@ class FedoraVM(basevm.BaseVM):
         self.console_wait_send("1) [ ] Standard Part",     "1\n")
         self.console_wait_send("1) [x] Standard Part",     "c\n")
 
-        self.console_wait_send("7) [!] Root password",     "7\n")
+        self.console_wait_send("7) [x] Root password",     "7\n")
         self.console_wait("Password:")
         self.console_send("%s\n" % self._config["root_pass"])
         self.console_wait("Password (confirm):")
@@ -116,7 +116,6 @@ class FedoraVM(basevm.BaseVM):
         self.console_wait_send("1) [ ] Create user",       "1\n")
         self.console_wait_send("3) User name",             "3\n")
         self.console_wait_send("ENTER:", "%s\n" % self._config["guest_user"])
-        self.console_wait_send("4) [ ] Use password",      "4\n")
         self.console_wait_send("5) Password",              "5\n")
         self.console_wait("Password:")
         self.console_send("%s\n" % self._config["guest_pass"])
-- 
2.33.0.113.g6c40894d24



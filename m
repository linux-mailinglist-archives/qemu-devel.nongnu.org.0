Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AA40294E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:00:06 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNahp-0004Oz-Lf
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9s-0007VK-TM
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9o-0008Ky-1W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9791jZ10f+guLwmYZ4PgfVHbEm9I+Y2Hi55Pr1OZiLA=;
 b=edR5y4+XGySs3FMR92/eJfVGQWRA+WckSZquUSYC7XFgsTvCNoBq9EwQqkdTeOAOjY3ugi
 eQPPT38YGMU2+a8tCkplMMVcK1ZJ7kQvIsoHisxIJypBquD0kkMCgoxIqAiev3ASxDT9lw
 pISD79egXVfwydnJLhHr45UtmUv3ZMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-n3ZDuuajOXijXA5gQcKA-w-1; Tue, 07 Sep 2021 08:24:50 -0400
X-MC-Unique: n3ZDuuajOXijXA5gQcKA-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FCF107ACE4
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:24:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF1D1972D;
 Tue,  7 Sep 2021 12:24:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 23/32] qga/rust: build and link an empty static library
Date: Tue,  7 Sep 2021 16:19:34 +0400
Message-Id: <20210907121943.3498701-24-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Cargo.lock      |  4 ++++
 Cargo.toml      |  1 +
 qga/Cargo.toml  |  9 +++++++++
 qga/lib.rs      |  0
 qga/meson.build | 20 +++++++++++++++++++-
 5 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 qga/Cargo.toml
 create mode 100644 qga/lib.rs

diff --git a/Cargo.lock b/Cargo.lock
index f2cd0ee96e..2f5b202605 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -68,3 +68,7 @@ version = "0.0.1"
 dependencies = [
  "common",
 ]
+
+[[package]]
+name = "qga"
+version = "0.1.0"
diff --git a/Cargo.toml b/Cargo.toml
index f4a078e62d..3db0646413 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -1,5 +1,6 @@
 [workspace]
 members = [
+  "qga",
   "rust/common",
   "tests",
 ]
diff --git a/qga/Cargo.toml b/qga/Cargo.toml
new file mode 100644
index 0000000000..a3bffd1fec
--- /dev/null
+++ b/qga/Cargo.toml
@@ -0,0 +1,9 @@
+[package]
+name = "qga"
+version = "0.1.0"
+edition = "2018"
+publish = false
+
+[lib]
+path = "lib.rs"
+crate-type = ["staticlib"]
diff --git a/qga/lib.rs b/qga/lib.rs
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/qga/meson.build b/qga/meson.build
index 1b050d8c53..d272892ced 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -54,9 +54,27 @@ qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
 
 qga_ss = qga_ss.apply(config_host, strict: false)
 
+qga_rs = declare_dependency()
+if with_rust
+  cargo_qga = custom_target('cargo-qga',
+                            build_by_default: true,
+                            output: ['libqga.args', 'libqga.a'],
+                            build_always_stale: true,
+                            command: [cargo_wrapper,
+                                      meson.current_build_dir(),
+                                      meson.current_source_dir(),
+                                      meson.build_root(),
+                                      rs_build_type,
+                                      rust_target_triple,
+                                      'build-lib'])
+  qga_rs = declare_dependency(
+    link_args: '@' + cargo_qga[0].full_path(),
+    sources: cargo_qga)
+endif
+
 qga = executable('qemu-ga', qga_ss.sources(),
                  link_args: config_host['LIBS_QGA'].split(),
-                 dependencies: [qemuutil, libudev],
+                 dependencies: [qemuutil, libudev, qga_rs],
                  install: true)
 all_qga = [qga]
 
-- 
2.33.0.113.g6c40894d24



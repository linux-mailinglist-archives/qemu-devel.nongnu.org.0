Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9840292E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:50:00 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaY3-0003Gu-2F
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaA3-0007Yv-8S
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9z-0008O6-2S
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKPtpOZMSLrfi3J3GNueFxhqe6Xhi8tG3kmnxuyuDJo=;
 b=CjES8Tju0jEUIzEJjQWd6gLB8mDO1P+SbMdcuMGVlpHqwR3XJrqMucTWn7ug+CHWR2zUkh
 nmrtW7HpC76zFSKO8Hinn4Wwb30QlVIEh0smFe/M+JtB9sWqLdewffB9y4yTZClHmJvijM
 5925fYiNsrA8wbPUVnL+08oH7HrEZTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-YvYcT9rvPneGZowcM3LXyQ-1; Tue, 07 Sep 2021 08:25:03 -0400
X-MC-Unique: YvYcT9rvPneGZowcM3LXyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F04BA84A5E0
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:25:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E90377701;
 Tue,  7 Sep 2021 12:24:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 24/32] qga/rust: generate QGA QAPI types FFI bindings
Date: Tue,  7 Sep 2021 16:19:35 +0400
Message-Id: <20210907121943.3498701-25-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Use qapi-gen to generate low-level C FFI bindings for QAPI types,
include them to the build.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Cargo.lock      |  3 +++
 qga/Cargo.toml  |  3 +++
 qga/lib.rs      |  1 +
 qga/meson.build | 11 +++++++++++
 qga/qapi_ffi.rs |  8 ++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 qga/qapi_ffi.rs

diff --git a/Cargo.lock b/Cargo.lock
index 2f5b202605..ad5bb47762 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -72,3 +72,6 @@ dependencies = [
 [[package]]
 name = "qga"
 version = "0.1.0"
+dependencies = [
+ "common",
+]
diff --git a/qga/Cargo.toml b/qga/Cargo.toml
index a3bffd1fec..807acc947e 100644
--- a/qga/Cargo.toml
+++ b/qga/Cargo.toml
@@ -4,6 +4,9 @@ version = "0.1.0"
 edition = "2018"
 publish = false
 
+[dependencies]
+common = { path = "../rust/common" }
+
 [lib]
 path = "lib.rs"
 crate-type = ["staticlib"]
diff --git a/qga/lib.rs b/qga/lib.rs
index e69de29bb2..17cf43a5e9 100644
--- a/qga/lib.rs
+++ b/qga/lib.rs
@@ -0,0 +1 @@
+mod qapi_ffi;
diff --git a/qga/meson.build b/qga/meson.build
index d272892ced..88d59bef0c 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -56,10 +56,21 @@ qga_ss = qga_ss.apply(config_host, strict: false)
 
 qga_rs = declare_dependency()
 if with_rust
+  qga_qapi_rs_outputs = [
+    'qga-qapi-ffi-types.rs',
+  ]
+
+  qapi_gen_rs_files = custom_target('QGA QAPI Rust bindings',
+                                    output: qga_qapi_rs_outputs,
+                                    input: 'qapi-schema.json',
+                                    command: [ qapi_gen, '-r', '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                                    depend_files: qapi_gen_depends)
+
   cargo_qga = custom_target('cargo-qga',
                             build_by_default: true,
                             output: ['libqga.args', 'libqga.a'],
                             build_always_stale: true,
+                            depends: [qapi_gen_rs_files],
                             command: [cargo_wrapper,
                                       meson.current_build_dir(),
                                       meson.current_source_dir(),
diff --git a/qga/qapi_ffi.rs b/qga/qapi_ffi.rs
new file mode 100644
index 0000000000..1f4ade9318
--- /dev/null
+++ b/qga/qapi_ffi.rs
@@ -0,0 +1,8 @@
+#![allow(dead_code)]
+
+use common::libc;
+
+include!(concat!(
+    env!("MESON_BUILD_ROOT"),
+    "/qga/qga-qapi-ffi-types.rs"
+));
-- 
2.33.0.113.g6c40894d24



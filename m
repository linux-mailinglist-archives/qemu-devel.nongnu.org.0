Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BA4028D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:31:10 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaFp-0004Tl-N1
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7l-00030p-6f
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7j-0007ih-4t
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEILewch93OybQzOl1KrIHEQYi+z0OjUCe2lBj5iJTs=;
 b=Fo4xHWMORUGOZ1OFGPmm84h0BJ+TuGtB0NZmMFoAJUOMUqGyRNz1TXEvimE0T9BxHMHCYp
 HzhWMdrq3mcZJhcEPGyR5BeZZ0qFnbiyE1DD/eh8/t1Le1vHvtMuYvn6BbjcgQPFZicE+5
 ezv4tliLkBwi1qmdqFlvorpnt7Q7Axw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-LTk4ZeZ0Mcew0-p8UmKfbw-1; Tue, 07 Sep 2021 08:22:44 -0400
X-MC-Unique: LTk4ZeZ0Mcew0-p8UmKfbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87472188E3C1
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:22:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236BE6B545;
 Tue,  7 Sep 2021 12:22:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 13/32] rust: use vendored-sources
Date: Tue,  7 Sep 2021 16:19:24 +0400
Message-Id: <20210907121943.3498701-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Most likely, QEMU will want tighter control over the sources, rather
than relying on crates.io downloading, use a git submodule with all the
dependencies. However, cargo --offline was added in 1.36.

"cargo vendor" helps gathering and updating the dependencies.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                 | 8 ++++++++
 meson.build               | 7 ++++++-
 .cargo/config.toml.in     | 5 +++++
 .cargo/meson.build        | 5 +++++
 .gitmodules               | 4 ++++
 rust/vendored             | 1 +
 scripts/archive-source.sh | 2 +-
 scripts/cargo_wrapper.py  | 1 +
 8 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 .cargo/config.toml.in
 create mode 100644 .cargo/meson.build
 create mode 160000 rust/vendored

diff --git a/configure b/configure
index 470b90543f..82a94ab93b 100755
--- a/configure
+++ b/configure
@@ -2068,6 +2068,14 @@ if test -z "$ninja"; then
     fi
 fi
 
+case "$with_rust" in
+  auto|enabled)
+    if test -e "${source_path}/.git"; then
+      git_submodules="${git_submodules} rust/vendored"
+    fi
+    ;;
+esac
+
 # Check that the C compiler works. Doing this here before testing
 # the host CPU ensures that we had a valid CC to autodetect the
 # $cpu var (and we should bail right here if that's not the case).
diff --git a/meson.build b/meson.build
index a21c70d77f..29d218d35a 100644
--- a/meson.build
+++ b/meson.build
@@ -108,7 +108,11 @@ endif
 
 bzip2 = find_program('bzip2', required: install_edk2_blobs)
 
-cargo = find_program('cargo', required: get_option('with_rust'))
+cargo = find_program('cargo',
+                     required: get_option('with_rust'),
+                     # require --offline support (1.36), but fixed (1.42)
+                     version: '>= 1.42')
+
 with_rust = cargo.found()
 cargo_wrapper = [
   find_program('scripts/cargo_wrapper.py'),
@@ -126,6 +130,7 @@ if with_rust
       error('cross-compiling, but no Rust target-triple defined.')
     endif
   endif
+  subdir('.cargo')
 endif
 config_host_data.set('CONFIG_WITH_RUST', with_rust)
 
diff --git a/.cargo/config.toml.in b/.cargo/config.toml.in
new file mode 100644
index 0000000000..d1531aa52a
--- /dev/null
+++ b/.cargo/config.toml.in
@@ -0,0 +1,5 @@
+[source.crates-io]
+replace-with = "vendored-sources"
+
+[source.vendored-sources]
+directory = "@vendored_directory@"
diff --git a/.cargo/meson.build b/.cargo/meson.build
new file mode 100644
index 0000000000..4e7c296ab0
--- /dev/null
+++ b/.cargo/meson.build
@@ -0,0 +1,5 @@
+configure_file(output: 'config.toml',
+               input: 'config.toml.in',
+               configuration: {
+                   'vendored_directory': meson.source_root() / 'rust/vendored'
+               })
diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..f767a4f386 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,7 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "rust/vendored"]
+	path = rust/vendored
+	#url = https://gitlab.com/qemu-project/qemu-rust-vendored.git
+	url = https://github.com/elmarco/qemu-rust-vendored.git
diff --git a/rust/vendored b/rust/vendored
new file mode 160000
index 0000000000..7077bbbd11
--- /dev/null
+++ b/rust/vendored
@@ -0,0 +1 @@
+Subproject commit 7077bbbd11a67d60062a9483f996113a349a4ca1
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index c6169db69f..03afcee8b9 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -26,7 +26,7 @@ sub_file="${sub_tdir}/submodule.tar"
 # independent of what the developer currently has initialized
 # in their checkout, because the build environment is completely
 # different to the host OS.
-submodules="dtc slirp meson ui/keycodemapdb"
+submodules="dtc slirp meson ui/keycodemapdb rust/vendored"
 submodules="$submodules tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3"
 sub_deinit=""
 
diff --git a/scripts/cargo_wrapper.py b/scripts/cargo_wrapper.py
index 75518e8c02..c07f51494b 100644
--- a/scripts/cargo_wrapper.py
+++ b/scripts/cargo_wrapper.py
@@ -78,6 +78,7 @@ def get_cargo_rustc(
         target_dir,
         "--manifest-path",
         manifest_path,
+        "--offline",
     ]
     cargo_cmd += cargo_rustc_args
     if args.target_triple:
-- 
2.33.0.113.g6c40894d24



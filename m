Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292996A48AE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:56:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhj2-0003OI-FV; Mon, 27 Feb 2023 12:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhix-0003NZ-7o
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhiv-0004Mj-MF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3Nog1fgcHNKlxcsiRIt88xpa7VcBQJEhsDy4muCKSw=;
 b=PnXm4N/E2vvec+AGWU0JAEvbwjg3ltLSwrzW6Rnq4Ygr4T2X4Z4bcu9L1G0qdZ1J/UkU28
 u2j6QiW//9/NXeh5L72Jqa3Cholni2vpUqh7CYPdi1cbeA6VSoDiFwhiTlA6bmJ7yK2Fhg
 eWtMl2MmKmz43hGYlRoEEXTMVjzJNFo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-ePcXVJd7MMiZ1-xnBA6KmA-1; Mon, 27 Feb 2023 12:55:39 -0500
X-MC-Unique: ePcXVJd7MMiZ1-xnBA6KmA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so9865517edb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3Nog1fgcHNKlxcsiRIt88xpa7VcBQJEhsDy4muCKSw=;
 b=Vmqrz2jdRq0Wv1dAUVV/VnsgMbX+bgxNKt9jkMZadHOUAaR2VjpOVM9GVMQKwIvse0
 yg6+/molb0424Oh+79eJ1BGq1rVONTHcnWMO+mLUjTA7954K0aU6PyTQ5xAN6nA3SAjx
 IceHg+iLd3UIf8dsK5aq3HVTwhV+VHcRqHOJd09I/Z3oKXNQAyY46HGIJ2WQo8XSqXQG
 c55f1dhZrp/xmezjha5MbQ+hJ7QCJ7p+a0Qcln/VLHXLScWW9MuOKLZij7/h5vE7JYZg
 yR0SHuFSC1o/23uJ1WEIdKdy51FMedbrfHj3Sp/jU1670jl+9AhtyozNxT1R6POau2iq
 yMlg==
X-Gm-Message-State: AO0yUKW4jhVE7k24kMq80TQIogdowKTDLckVvaADwAUzHGFJEylMOFsz
 gapBqwPGmhIJGnzPpyN9g4eZe+e+hFf4B1hAgH7TuDIF3TlCVINhNcRBB0d3tP9g6WpduoQHYrp
 ft6ibahi86YYjMi6HaBsiE0P4VqJI8uhK07gvFyD+gsMTBrv1/Blu876BaW4lQYrY+zbIMKUC
X-Received: by 2002:a17:906:1c17:b0:8b1:88aa:46da with SMTP id
 k23-20020a1709061c1700b008b188aa46damr34237438ejg.48.1677520538373; 
 Mon, 27 Feb 2023 09:55:38 -0800 (PST)
X-Google-Smtp-Source: AK7set98aALMz/VrJxeWbyg65WG7lXpq3Pn23HWv7b+UqwSLnuwel28cQoW4dffoEbGiQ32ArSoyZw==
X-Received: by 2002:a17:906:1c17:b0:8b1:88aa:46da with SMTP id
 k23-20020a1709061c1700b008b188aa46damr34237419ejg.48.1677520537973; 
 Mon, 27 Feb 2023 09:55:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a1709064e4f00b008ee64893786sm3522985ejw.99.2023.02.27.09.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 04/13] configure: protect against escaping venv when running
 Meson
Date: Mon, 27 Feb 2023 18:55:15 +0100
Message-Id: <20230227175524.710880-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If neither --python nor --meson are specified, Meson's generated
build.ninja will invoke Python script using the interpreter *that Meson
itself is running under*; not the one identified by configure.

This is only an issue if Meson's Python interpreter is not "the first
one in the path", which is the one that is used if --python is not
specified.  A common case where this happen is when the "python3" binary
comes from a virtual environment but Meson is not installed (with pip)
in the virtual environment.  In this case (presumably) whoever set up
the venv wanted to use the venv's Python interpreter to build QEMU,
while Meson might use a different one, for example an enterprise
distro's older runtime.

So, detect whether a virtual environment is setup, and if the virtual
environment does not have Meson, use the meson submodule.  Meson will
then run under the virtual environment's Python interpreter.

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index cf6db3d5518c..a1912463c94e 100755
--- a/configure
+++ b/configure
@@ -1044,11 +1044,24 @@ if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
-# Suppress writing compiled files
-python="$python -B"
+# Resolve PATH + suppress writing compiled files
+python="$(command -v "$python") -B"
+
+has_meson() {
+  local python_dir=$(dirname "$python")
+  # PEP405: pyvenv.cfg is either adjacent to the Python executable
+  # or one directory above
+  if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.cfg; then
+    # Ensure that Meson and Python come from the same virtual environment
+    test -x "$python_dir/meson" &&
+      test "$(command -v meson)" -ef "$python_dir/meson"
+  else
+    has meson
+  fi
+}
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
+    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
         meson=meson
     elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
-- 
2.39.1



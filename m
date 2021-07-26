Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D75B3D5B96
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:30:09 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81cO-0002kf-Hs
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WH-0005YP-0k
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WE-0008R9-TH
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id e2so11312358wrq.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sE8AHXwCcmk/41Hwf9/dPSWG/yzq4enhkHMBHWg8JOk=;
 b=k2uc9YMHDWKyCA9pPwwqZTgQKa4Pkm/L3p6weS1TUJO3hQpNZfDMgG0p9iOGH4ykED
 GfL/42xlnfqoUykgwpSHMP0sP03tyx/rv2koU4jIX+iy1wNgZQMCHbOfRN7oboP28Lcs
 1jBHBcsIqW+tTnNEbjfR50/dEUdKjhzeL/ESXNd3JzBxSj8h6gNOXcH8fxnHJ/C77Hr0
 E7v4QgvyNttCFfRyHHUzb+fTa08cK4N5EJZXz1rtw0LeXdp4XAoplHmH+gBDiu90jFyd
 aMAiFWKpQbiWU4404BpNnlOnXua8wpd19rnMspcVrzZpV+Mj/WI+B3wxLv7jKxpyxO5b
 lg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sE8AHXwCcmk/41Hwf9/dPSWG/yzq4enhkHMBHWg8JOk=;
 b=NPN9m93MFfi9UFrXnoyxskSSMOSsdo37fPL3oYrwHZUrFkI9liFG46tS6UgfrCCqmq
 Ppq3miTwbhkZN2DNqhi6u5s5WN2dTLYK1fZezdhHdMcmPo4bBc6bAGCAtejWWp18XGoN
 iZ13JAVPSNpI1NVUjLu03sUdpr1UF57cwVDk06tHw+fiEA3LLXTxjQOQwen85M6jyUMy
 qneBzVgFBBOEeoFTNJLTjO8mh3TqAVRM15i4XubssBCj9D5H8HcAn+e0I4Mxhj1GhRgQ
 oGgeHzsZcT+lFJiqfOti7fK18I9aGnYPI3E8gbw70frLDq4vEooeoLigjjJGaJK3GdnF
 wu0g==
X-Gm-Message-State: AOAM533uG7b/4Q0mvicwqFnrk8JfUj4jITNlQQtoFgOs5JrjDTvLjy5Y
 HaqJ0VdMw7LjvshTZJcZhhsynBDiammQmQ==
X-Google-Smtp-Source: ABdhPJzEsZjqEAjlZN6jPYtiWP2z09BXd7gK/Khrh8xShPJaQfN0nHPjXRHCrA/9Akt/hq1elOy5FQ==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr19093938wrp.272.1627309425138; 
 Mon, 26 Jul 2021 07:23:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 05/10] docs/devel: Format literals correctly
Date: Mon, 26 Jul 2021 15:23:33 +0100
Message-Id: <20210726142338.31872-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

Fix various places in the devel section of the manual which were
using single backticks when double backticks (for literal text)
were intended.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/qgraph.rst      |  8 ++++----
 docs/devel/tcg-plugins.rst | 14 +++++++-------
 docs/devel/testing.rst     |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index 318534d4b08..39e293687e6 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -66,11 +66,11 @@ Notes for the nodes:
 Edges
 ^^^^^^
 
-An edge relation between two nodes (drivers or machines) `X` and `Y` can be:
+An edge relation between two nodes (drivers or machines) ``X`` and ``Y`` can be:
 
-- ``X CONSUMES Y``: `Y` can be plugged into `X`
-- ``X PRODUCES Y``: `X` provides the interface `Y`
-- ``X CONTAINS Y``: `Y` is part of `X` component
+- ``X CONSUMES Y``: ``Y`` can be plugged into ``X``
+- ``X PRODUCES Y``: ``X`` provides the interface ``Y``
+- ``X CONTAINS Y``: ``Y`` is part of ``X`` component
 
 Execution steps
 ^^^^^^^^^^^^^^^
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 7e54f128375..047bf4ada7c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -34,11 +34,11 @@ version they were built against. This can be done simply by::
   QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 The core code will refuse to load a plugin that doesn't export a
-`qemu_plugin_version` symbol or if plugin version is outside of QEMU's
+``qemu_plugin_version`` symbol or if plugin version is outside of QEMU's
 supported range of API versions.
 
-Additionally the `qemu_info_t` structure which is passed to the
-`qemu_plugin_install` method of a plugin will detail the minimum and
+Additionally the ``qemu_info_t`` structure which is passed to the
+``qemu_plugin_install`` method of a plugin will detail the minimum and
 current API versions supported by QEMU. The API version will be
 incremented if new APIs are added. The minimum API version will be
 incremented if existing APIs are changed or removed.
@@ -146,12 +146,12 @@ Example Plugins
 
 There are a number of plugins included with QEMU and you are
 encouraged to contribute your own plugins plugins upstream. There is a
-`contrib/plugins` directory where they can go.
+``contrib/plugins`` directory where they can go.
 
 - tests/plugins
 
 These are some basic plugins that are used to test and exercise the
-API during the `make check-tcg` target.
+API during the ``make check-tcg`` target.
 
 - contrib/plugins/hotblocks.c
 
@@ -163,7 +163,7 @@ with linux-user execution as system emulation tends to generate
 re-translations as blocks from different programs get swapped in and
 out of system memory.
 
-If your program is single-threaded you can use the `inline` option for
+If your program is single-threaded you can use the ``inline`` option for
 slightly faster (but not thread safe) counters.
 
 Example::
@@ -251,7 +251,7 @@ which will lead to a sorted list after the class breakdown::
   ...
 
 To find the argument shorthand for the class you need to examine the
-source code of the plugin at the moment, specifically the `*opt`
+source code of the plugin at the moment, specifically the ``*opt``
 argument in the InsnClassExecCount tables.
 
 - contrib/plugins/lockstep.c
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8f572255d32..8a9cda33a5d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -775,7 +775,7 @@ The base test class has also support for tests with more than one
 QEMUMachine. The way to get machines is through the ``self.get_vm()``
 method which will return a QEMUMachine instance. The ``self.get_vm()``
 method accepts arguments that will be passed to the QEMUMachine creation
-and also an optional `name` attribute so you can identify a specific
+and also an optional ``name`` attribute so you can identify a specific
 machine and get it more than once through the tests methods. A simple
 and hypothetical example follows:
 
@@ -1062,7 +1062,7 @@ Here is a list of the most used variables:
 AVOCADO_ALLOW_LARGE_STORAGE
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Tests which are going to fetch or produce assets considered *large* are not
-going to run unless that `AVOCADO_ALLOW_LARGE_STORAGE=1` is exported on
+going to run unless that ``AVOCADO_ALLOW_LARGE_STORAGE=1`` is exported on
 the environment.
 
 The definition of *large* is a bit arbitrary here, but it usually means an
@@ -1076,7 +1076,7 @@ skipped by default. The definition of *not safe* is also arbitrary but
 usually it means a blob which either its source or build process aren't
 public available.
 
-You should export `AVOCADO_ALLOW_UNTRUSTED_CODE=1` on the environment in
+You should export ``AVOCADO_ALLOW_UNTRUSTED_CODE=1`` on the environment in
 order to allow tests which make use of those kind of assets.
 
 AVOCADO_TIMEOUT_EXPECTED
@@ -1090,7 +1090,7 @@ property defined in the test class, for further details::
 Even though the timeout can be set by the test developer, there are some tests
 that may not have a well-defined limit of time to finish under certain
 conditions. For example, tests that take longer to execute when QEMU is
-compiled with debug flags. Therefore, the `AVOCADO_TIMEOUT_EXPECTED` variable
+compiled with debug flags. Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` variable
 has been used to determine whether those tests should run or not.
 
 GITLAB_CI
-- 
2.20.1



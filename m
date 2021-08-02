Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9B3DD52A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:07:10 +0200 (CEST)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWir-0006PK-Hk
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaP-0000aV-1b
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:25 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaN-0003b8-2q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id h14so21135297wrx.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aGF2G+/n9eScQIPDnrsebLNRQ810Fm+XJpMurXM/QN0=;
 b=LQpFA+y6L3wcvpBV31JKdzI2L16uGmqXRBzTOUULfDoMwYEB6yEtkVZGj3xqZkRrQH
 ujsqGsi9UI48q7AxR8nfsjDbY33MgP5vAFtN1CZXhZf71zdHKO4rBWLFbBc6MdGHt2xc
 bb+jaqHLofVYmKVkyJh6J/H1H6Ywdi/XvtjHCTjED39iQZwFWOhvq+nUOo3H/VBTzi1H
 6K2metXIt5qvZF+9JasT2vOYzEhaUAtRYpJJKwPsRrHh8bfa+5qfIExpwDyCkLOC/EUg
 XN10pyukdp5XkdSxB0M/NOzHPEW4AAAHcpjQmZ8DTK/22GXHXgNHGN82NYcgbLxhWv6o
 ezFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGF2G+/n9eScQIPDnrsebLNRQ810Fm+XJpMurXM/QN0=;
 b=D9rJ6NA3PTkdZP1xvh9d8kc6ETn7yAS2YS6hkPe/CPDxAKzmsHg+urAVWtvjIJLZnX
 irRt3PgRztAcrPU6R9+2zqtlssoeAqoqhuj9r2+y/wUFwp5Hnyv/1+SbkYaQIZgboWrh
 iZqTLYgOzOZ8TJg3iaREEYztKt/Vrb6bKWoZfEY/PO4MVianXs2hSrg9O9nzx5dKLujd
 f4qsB2CkGutHnv6bIL2sCjm2Ib8N2vAKN31C7mdwxovf3B9X8wt4/xAMo56UKPPu2AOS
 YTTgF3kJuZz3JDhqQd7pE3vCFBcsaw/WmmNYBNVDdRd0aX9ARRSwjdXDR+OQmQv4zxEf
 5dkg==
X-Gm-Message-State: AOAM530QDO1p28YRitBm9emjVXVRd4sIMFdZS+mpDDhKkwxMZn0EpODz
 TRwD0Egiy2s/A3yukAmA0VSJHVQ+knMwFA==
X-Google-Smtp-Source: ABdhPJwPf9zgrXKXL9Uk6z7S/Uak5v4Nk3UFvhoAnkyghJ8+jkOtLtlsQAhSsTzSMOxnA9lR8FNI/A==
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr17164874wrw.410.1627905501832; 
 Mon, 02 Aug 2021 04:58:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] docs/devel: Format literals correctly
Date: Mon,  2 Aug 2021 12:58:02 +0100
Message-Id: <20210802115812.10731-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210726142338.31872-6-peter.maydell@linaro.org
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



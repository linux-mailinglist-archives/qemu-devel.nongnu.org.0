Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8C3BBAAE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:00:25 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LOq-0003cG-CV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKZ-0003n3-Tw
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKW-0003uj-6v
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so3170567wmq.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUCtUCM64aRxGNaCg1xd5DUjdkSweWOZotrf0QNPjs4=;
 b=ippZKCzFb3IICaYt0Mtq7cfAVXmaRbBO8C5sOOi8FmqTmOJswQie2KJSbn0D/O/O8J
 miUTGDToQJS6ZrAwriX3aFpERjGxi2JGsBvzmOrIJmO2QZgy6WBsnpMFGdvDJUeuJTeD
 6Eg3xLqrleaDYgS98aAc2v21phZUANKys3sOBaHpGDYUIKOz1/5Ek6dYb7VGMuc9lBS5
 9eZT8IsDUbvKtIcBa71tlHHxOudBzHmUgrQ1z5hzZZF5aNrfW0SHyHokGKxpvannFCHr
 6pA5VWkUJcJCdNzN0VKNlADEyrfrmc0dwG0Q4u/a9M+q1k2R316FnmeB8TqB5CUdAVEm
 w8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUCtUCM64aRxGNaCg1xd5DUjdkSweWOZotrf0QNPjs4=;
 b=MHx4eyePXrqAfbhlLlu5bCmnqiFzUuqagKHT7rC+JOiUdkl/YYNTcZBXi0ktbt3AUj
 kHsUlgOhFaqCgGNjTOaz+RCAJUk2d9HgYum2Ap3C295gVgt52oY5UxHidB/miQJnwtM1
 g3ncgEpgGgYwbqB0b18ULkHvKEDJMfgZG+TRt1LB8gViRmfoOQoRg/awZUa6I3cy3PUs
 1nFpGm/j8XZNhvbDA7OBu4DXSBF5QTj1fDGXg97fejIfpJ28QWutdyRPFqBggN30l83g
 KywJ5rkELcPs61/NptXQDYLiS7CormGBt08p0iGAYah0K18KWJU5cwcHxWY/qpurSWAi
 11kA==
X-Gm-Message-State: AOAM530xdrKdlcbeE3ZGCA/wgmwBtvBAPnH8n3kEhpjjOEqj92h7g79G
 0gKVfcZo0E+QdwxiqXN38ggNGH9lvmmuBwRt
X-Google-Smtp-Source: ABdhPJzWkThU4Pg78wdk2GerNkcu2b73QZKU7TO4BeOLApyVcS09cWf7dyuaIpOIGAIGL0rFlHsRvw==
X-Received: by 2002:a05:600c:35c6:: with SMTP id
 r6mr10861604wmq.14.1625478954588; 
 Mon, 05 Jul 2021 02:55:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] docs: Add license note to the HTML page footer
Date: Mon,  5 Jul 2021 10:55:46 +0100
Message-Id: <20210705095547.15790-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The standard Sphinx/RTD HTML page footer gives a copyright line
(based on the 'copyright' variable set in conf.py) and a line "Built
with Sphinx using a theme provided by Read the Docs" (which can be
disabled via the html_show_sphinx variable, but we leave it enabled).
As a free software project, we'd like to also mention the license
QEMU and its manual are released under.

Add a template footer.html which defines the 'extrafooter' block that
the RtD theme provides for this purpose.  The new line of text will
go below the existing copyright and sphinx-acknowledgement lines.
(Unfortunately the RTD footer template does not permit putting it
after the copyright but before the sphinx-acknowledgement.)

We use the templating functionality to make the new text also be a
hyperlink to the about/license.html page of the manual.

Unlike rst files, HTML template files are not reported to our depfile
plugin, so we maintain a manual list in meson.build.  New template
files should be rare, so not being able to auto-generate the
dependency info is not too awkward.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I know nothing about Jinja, and have merely cargo-culted the
"make a link to a document" stuff from the handling of the
optional copyright link in /usr/share/sphinx_rtd_theme/footer.html ...
---
 docs/_templates/footer.html | 12 ++++++++++++
 docs/meson.build            |  3 ++-
 MAINTAINERS                 |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 docs/_templates/footer.html

diff --git a/docs/_templates/footer.html b/docs/_templates/footer.html
new file mode 100644
index 00000000000..4c15e17d2a8
--- /dev/null
+++ b/docs/_templates/footer.html
@@ -0,0 +1,12 @@
+{% extends "!footer.html" %}
+{% block extrafooter %}
+
+<!-- Empty para to force a blank line after "Built with Sphinx ..." -->
+<p></p>
+
+{% trans path=pathto('about/license') %}
+<p><a href="{{ path }}">QEMU and this manual are released under the
+GNU General Public License, version 2.</a></p>
+{% endtrans %}
+{{ super() }}
+{% endblock %}
diff --git a/docs/meson.build b/docs/meson.build
index 855e3916e90..300b1343291 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -44,6 +44,7 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qapidoc.py',
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
+  sphinx_template_files = [ meson.source_root() / 'docs/_templates/footer.html' ]
 
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
 
@@ -76,7 +77,7 @@ if build_docs
                 output: 'docs.stamp',
                 input: files('conf.py'),
                 depfile: 'docs.d',
-                depend_files: sphinx_extn_depends,
+                depend_files: [ sphinx_extn_depends, sphinx_template_files ],
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
diff --git a/MAINTAINERS b/MAINTAINERS
index cfbf7ef79bc..790d857f6c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3410,6 +3410,7 @@ S: Maintained
 F: docs/conf.py
 F: docs/*/conf.py
 F: docs/sphinx/
+F: docs/_templates/
 
 Miscellaneous
 -------------
-- 
2.20.1



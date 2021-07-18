Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F33CC931
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:53:34 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56IX-00084t-RC
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bk-0003kS-HA
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bi-0003VR-E1
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so11068708wmi.2
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C6ty/bKNq9kcYcHoqFuthemChfcdB6FKy5dP98tkNXo=;
 b=x1F9//sjml4X/zZ1ET/mIpm30w8b5WSv2bmYJ96SNROTFVepeUGmcGDtBZupxMcXMj
 E/Vat9hiks8vHs51UEKISF1qME8fNQUnYc3GhcwOjlxmtIpofqq/RgR51FM4upOlfaIb
 OtX2XZb/l8/J3u0qFUIPI/I6k3YiUoXedXKEq+YL5d7whKgD7ggP3MaokphyXNa0O4Pv
 hyzl6fiqJL6SD8sUGs6XvE79oW2jLzB+UJ6MWrIiM6zFFRgfaOVSvuraewB1vBmUmF6h
 S/yxXO8cOROiki8vXe68bgQg3MeZrYq9pnNuyWZoUPExiDUQ1i7F9913alYIhK8UETYZ
 gu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C6ty/bKNq9kcYcHoqFuthemChfcdB6FKy5dP98tkNXo=;
 b=ChBsmlybxZYoHAcqiqlxSN3/3LkhUFVLagqKFNHmJ4Wn/xf+uABDEswYgUch6YgoVD
 cnU2McGKg08H7GVSi3SPzttVnMz/H7G9CXidc+Miou4MNlm55lUlLu9hDBxt7bmQFMIC
 fR/G6VGGDYJinn2EvEXpMYDKHA41+XokYhcFByHM8MngO+S8Y3+HvHFA8YDGVQRf7o2x
 WzEb+YRv6wMMVrCBbApzZdg4V/zQLfvnQ47P8FqZUQCj3PSF4dB4c+BaEb09Wa8nRDdp
 cu8w/VlVZS3W4f8ltHrNB3ht6iAO+9j/WJuiGZDcYAgaHDKv3dDath5ADU7XomOkvz3Z
 Jh+A==
X-Gm-Message-State: AOAM532r9EtnwTheWME63wgXPR3hBw1JAkFX8t1nMrblCseYhiSEdRcU
 010EHWcgUhRr+z/o1JktY6kPD1ycEFbI0A==
X-Google-Smtp-Source: ABdhPJxviDAjc8yFgN01wa9gjEyD15wItzKX+rL+jutqryTc+Z8vh8IIMktykSgVVZdSb5dieB3d3w==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr27308755wma.178.1626612388494; 
 Sun, 18 Jul 2021 05:46:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] docs: Add license note to the HTML page footer
Date: Sun, 18 Jul 2021 13:46:16 +0100
Message-Id: <20210718124621.13395-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-7-peter.maydell@linaro.org
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
index 9100f9a0439..814d103fe16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3451,6 +3451,7 @@ S: Maintained
 F: docs/conf.py
 F: docs/*/conf.py
 F: docs/sphinx/
+F: docs/_templates/
 
 Miscellaneous
 -------------
-- 
2.20.1



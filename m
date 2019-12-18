Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707821246F2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:36:35 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYZ8-0001SE-2L
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3o-0007Fm-OU
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3m-00038J-J0
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:11 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3m-00034S-Bw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:10 -0500
Received: by mail-wm1-x331.google.com with SMTP id b19so1554986wmj.4
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uGE6rR1IJJ9r/VKOprUnSz1PtFT2C2MrjAAe7zPzb4Q=;
 b=iS90RVAv5i5quMQlaS/MzeNOfPVYMasCfz6tWH9PE7j+cHYtkiYtH9WDC7ImeL9MpE
 g4cs9OyVIZxs2Bp/vdz7LM0khhTZU4zJuJgbbknoK9EWuDxc8mfjHWeJkY3bYGLU3BQM
 gVSf8ORmVcuwIcdQVUkz7T47o/rNqVyx9zzprblgU2lMOF7GWhMUoCBWAKRLJbO4eyfT
 +uHdbHqznKNBO5LQGoPYqAsY/FFecaia/GxpD04Vu7ZwPKe9KQS3R4q7oxCXFdtLwWdi
 pwjAXJklZvCPDCHKzg6fOrRxTovHqC0OafJVWwpmJDEtT+eGlxUsTe5hUASjhLvzvRl/
 tKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=uGE6rR1IJJ9r/VKOprUnSz1PtFT2C2MrjAAe7zPzb4Q=;
 b=ltR8H83DL4ZZC2DOg90hfArDlTzs3O7i6PQp5590jc3bWYYRsJEUzhh3cfxcTZvQdt
 2nbVVz/uM4jgqQqUtzphNRsLO5bvuFf3qI+7LchuWb/tBTbJ3PD3o++QQlo09qvv/7pP
 I46pigzKIUzAU+7jGirCtorCnjYjlRIuNREKQbAgD4aUzDhh2Bg0tmsEgf+miKqCgRdk
 9ZDLw8sovd7WXVOkt4hhF8wKcmX2iYLTspKsgYv+c59Hzmu4/kYEqSqgJkuhg8ncfGef
 RnIVfC71KbWvr0j6IWadxPHVboQPBf+zZ/Abk/ZLS0xnRu7HZBDememNR5m6S8QqAIVA
 60FA==
X-Gm-Message-State: APjAAAXkokJ7BeCSIQQUZKWJXxW7x3HvAEAIu2kErwjbUosvXplvI+g2
 DLjWjgZZXNAwsAvyKPl+JawJ2wjV
X-Google-Smtp-Source: APXvYqwyUIk/v9CbhOnh0rY6sjXSvnzb7XTGj8exJm1iK6Hd3LO5QAyBMxey92unekmamoz/tWmoWg==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr2831196wmd.23.1576670649194;
 Wed, 18 Dec 2019 04:04:09 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 66/87] docs/conf.py: Enable use of kerneldoc sphinx extension
Date: Wed, 18 Dec 2019 13:02:32 +0100
Message-Id: <1576670573-48048-67-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190521122519.12573-4-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/conf.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index b7edb06..259c604 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,7 +54,7 @@ needs_sphinx = '1.3'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['qmp_lexer']
+extensions = ['kerneldoc', 'qmp_lexer']
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -216,3 +216,8 @@ texinfo_documents = [
 
 
 
+# We use paths starting from qemu_docdir here so that you can run
+# sphinx-build from anywhere and the kerneldoc extension can still
+# find everything.
+kerneldoc_bin = os.path.join(qemu_docdir, '../scripts/kernel-doc')
+kerneldoc_srctree = os.path.join(qemu_docdir, '..')
-- 
1.8.3.1




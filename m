Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB425101B8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:18:31 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMxS-0000oU-6T
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMsl-0002Px-8j
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMsj-0006rf-J1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650986016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tg70HeYkXGO4/uYPTx82iDmW7eUFvWtM5RrV76eQJ48=;
 b=EYKkxxZvCIG5SO0j4yaDYHab5oHx2D1DgDwcAPczkulLn8dKx7lwzecKyUBt8TRbRt5jYx
 9wRIN+3tfvnH4hUCBxBBX5N6C+ZyZ29BMVhObyCYZuzCZIXrWW9sQWMEiBmypzAQtNRf6X
 nJ4eboaqGYVIGU/Ub7n6yJ35YOc5Pvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-hDin_bGfNM-JsX4yGshM_Q-1; Tue, 26 Apr 2022 11:13:33 -0400
X-MC-Unique: hDin_bGfNM-JsX4yGshM_Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F28BB3820F6A;
 Tue, 26 Apr 2022 15:13:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF73154ED07;
 Tue, 26 Apr 2022 15:13:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] github: fix config mistake preventing repo lockdown
 commenting
Date: Tue, 26 Apr 2022 16:13:23 +0100
Message-Id: <20220426151323.729982-4-berrange@redhat.com>
In-Reply-To: <20220426151323.729982-1-berrange@redhat.com>
References: <20220426151323.729982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit updated the repo lockdown config to the new
format:

  commit 9b89cdb2a5064a87b8a7172fa1748d46aa37a9df
  Author: Alex Bennée <alex.bennee@linaro.org>
  Date:   Mon Oct 4 16:43:08 2021 +0100

    .github: move repo lockdown to the v2 configuration

Unfortunately the config key names used were wrong, resulting in
the repo lockdown throwing warnings:

  Unexpected input(s) 'pull-comment', 'lock-pull', 'close-pull',
  valid inputs are ['github-token', 'exclude-issue-created-before',
  'exclude-issue-labels', 'issue-labels', 'issue-comment',
  'skip-closed-issue-comment', 'close-issue', 'lock-issue',
  'issue-lock-reason', 'exclude-pr-created-before', 'exclude-pr-labels',
  'pr-labels', 'pr-comment', 'skip-closed-pr-comment', 'close-pr',
  'lock-pr', 'pr-lock-reason', 'process-only', 'log-output']

It still locked down the pull requests, due to its default config,
but didn't leave the friendly message explaining why.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .github/workflows/lockdown.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
index ad8b8f7e30..d5e1265cff 100644
--- a/.github/workflows/lockdown.yml
+++ b/.github/workflows/lockdown.yml
@@ -15,7 +15,7 @@ jobs:
     steps:
       - uses: dessant/repo-lockdown@v2
         with:
-          pull-comment: |
+          pr-comment: |
             Thank you for your interest in the QEMU project.
 
             This repository is a read-only mirror of the project's repostories hosted
@@ -26,5 +26,5 @@ jobs:
             functionality). However, we get a lot of patches, and so we have some
             guidelines about contributing on the project website:
             https://www.qemu.org/contribute/
-          lock-pull: true
-          close-pull: true
+          lock-pr: true
+          close-pr: true
-- 
2.35.1



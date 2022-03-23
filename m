Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BA4E51B5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:58:59 +0100 (CET)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzdi-0002LZ-T3
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:58:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzQc-0001ZH-TX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:45:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzQZ-0001Xi-Lt
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648035921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c6RwEIOWd9gK8K79DEKR8TjUkF5ZTHVyUmaos++ns38=;
 b=YewTodxjJzFR/F7tildp5yXepHmJIk3QyPlb4PEUhBAE+Djk58JxkX7vWNJGWViFMRZlhQ
 Ii7KioXicX1xNYXdag07ve/s6xoL3e0BQ+r3y/rs1g1Fv7n/2plFyGp6Cavvg1oSthUtK0
 JZAusx5gfLIVPcUh7Yd+kEYGNNj4Ma0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-epMc09eEPICsQyJBvbQyHQ-1; Wed, 23 Mar 2022 07:45:18 -0400
X-MC-Unique: epMc09eEPICsQyJBvbQyHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A232D85A5A8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:45:18 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0942279A9;
 Wed, 23 Mar 2022 11:45:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] github: fix config mistake preventing repo lockdown commenting
Date: Wed, 23 Mar 2022 11:45:16 +0000
Message-Id: <20220323114516.4163532-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The config key names were all wrong, resulting in the repo lockdown
throwing warnings:

  Unexpected input(s) 'pull-comment', 'lock-pull', 'close-pull',
  valid inputs are ['github-token', 'exclude-issue-created-before',
  'exclude-issue-labels', 'issue-labels', 'issue-comment',
  'skip-closed-issue-comment', 'close-issue', 'lock-issue',
  'issue-lock-reason', 'exclude-pr-created-before', 'exclude-pr-labels',
  'pr-labels', 'pr-comment', 'skip-closed-pr-comment', 'close-pr',
  'lock-pr', 'pr-lock-reason', 'process-only', 'log-output']

It still locked down the pull requests, due to its default config,
but didn't leave the friendly message explaining why.

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
2.34.1



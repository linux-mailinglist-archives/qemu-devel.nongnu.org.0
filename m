Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6C3AE8B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:05:15 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIfy-00037R-AU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIca-0000Af-1R
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcW-0001LG-4z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624276899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2T3s0YrOAkw6q2c0FxDcaIroWF3CehhFnOu5kuyJnk=;
 b=Nppk9lQ59iEnesByBJc+YTAjk7Jtvwr5LE8HHPdCxseSPEZWgvmuKdCcKtuPgJnxf1HL7n
 Woj4qGFQaky0sHeR8BaIjkd/tQvkNuoFjHSJ4ijLwYf2bLgF9P66qyFtSuIl2uS0OXpwOZ
 k7pMCBgMi70tXIlS2BD7OjygPb+9ew0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-X5Md6lirNwuXoRwo9YKPWA-1; Mon, 21 Jun 2021 08:01:35 -0400
X-MC-Unique: X5Md6lirNwuXoRwo9YKPWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACFA88015F8;
 Mon, 21 Jun 2021 12:01:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D21C419C46;
 Mon, 21 Jun 2021 12:01:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/7] Update documentation to refer to new location for issues
Date: Mon, 21 Jun 2021 14:01:22 +0200
Message-Id: <20210621120125.116377-5-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
References: <20210621120125.116377-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210619154253.553446-1-sw@weilnetz.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .github/lockdown.yml | 6 +++---
 README.rst           | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.github/lockdown.yml b/.github/lockdown.yml
index 07fc2f31ee..d3546bd2bc 100644
--- a/.github/lockdown.yml
+++ b/.github/lockdown.yml
@@ -14,11 +14,11 @@ issues:
     at https://gitlab.com/qemu-project/qemu.git.
     The project does not process issues filed on GitHub.
 
-    The project issues are tracked on Launchpad:
-    https://bugs.launchpad.net/qemu
+    The project issues are tracked on GitLab:
+    https://gitlab.com/qemu-project/qemu/-/issues
 
     QEMU welcomes bug report contributions. You can file new ones on:
-    https://bugs.launchpad.net/qemu/+filebug
+    https://gitlab.com/qemu-project/qemu/-/issues/new
 
 pulls:
   comment: |
diff --git a/README.rst b/README.rst
index a92c7394b7..79b19f1481 100644
--- a/README.rst
+++ b/README.rst
@@ -131,16 +131,16 @@ will be tagged as my-feature-v2.
 Bug reporting
 =============
 
-The QEMU project uses Launchpad as its primary upstream bug tracker. Bugs
+The QEMU project uses GitLab issues to track bugs. Bugs
 found when running code built from QEMU git or upstream released sources
 should be reported via:
 
-* `<https://bugs.launchpad.net/qemu/>`_
+* `<https://gitlab.com/qemu-project/qemu/-/issues>`_
 
 If using QEMU via an operating system vendor pre-built binary package, it
 is preferable to report bugs to the vendor's own bug tracker first. If
 the bug is also known to affect latest upstream code, it can also be
-reported via launchpad.
+reported via GitLab.
 
 For additional information on bug reporting consult:
 
-- 
2.27.0



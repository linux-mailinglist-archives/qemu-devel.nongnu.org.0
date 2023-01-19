Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BB673AD2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVO0-0006u9-80; Thu, 19 Jan 2023 08:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIVNw-0006pQ-1U
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIVNu-0005pe-14
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674136517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CWLLMLWbpxQTa4GtO51fRN+Ezc42dECgcZu4dRaCVP4=;
 b=TRVTCN2+2bB2P44VHqhTTqWhcFNwbw/PiMrzSQjf07mJ4xVzx/VNJEvPr3JaSIh7a//GDB
 jeFF6KUp6luWUN/LmNX5Ey62yVLKTj1EhJCYTmFrR9Rqa3O49R3aELZGhfevzmmjta/5u7
 Bf5Z/rytsRj6QI3D9RXg80kfGb5mYpo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-1a0Pi_g7O-KILbf-V72xXg-1; Thu, 19 Jan 2023 08:55:15 -0500
X-MC-Unique: 1a0Pi_g7O-KILbf-V72xXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80DEA2807D68;
 Thu, 19 Jan 2023 13:55:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1686492C3E;
 Thu, 19 Jan 2023 13:55:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] travis.yml: Use the libfdt from the distro instead of the
 submodule
Date: Thu, 19 Jan 2023 14:55:12 +0100
Message-Id: <20230119135512.2040062-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

No need to compile-test third party submodules over and over again if
we can simply use the pre-build library from the distribution instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index fb3baabca9..e24c99fdb9 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -128,6 +128,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -162,6 +163,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -195,6 +197,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -237,6 +240,7 @@ jobs:
           - libattr1-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgnutls28-dev
           - libiscsi-dev
           - liblttng-ust-dev
@@ -281,6 +285,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
-- 
2.31.1



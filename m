Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C8673AF1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:59:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVS5-0001jb-9w; Thu, 19 Jan 2023 08:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIVRu-0001W3-Ji
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIVRs-0006df-B2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674136763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=G+STkm+UfDid6AuN4+EW7rF5qa1EhY8Ms81mDISFtvc=;
 b=cFF5jNC7dfTcqmC0j4DeiFEivkNBd3FC+uNMI7nroHTVIlEGz2zmklJvqSFj24jhXkXPvs
 1SsS0luUHmXoKF6B819Q9GBNSvktm8uXDW0/hPTQRIoDc+FhNcA9ZCan+NIhWamaoVFWF1
 pBQQcoBOhnIWZcv/dld2feAmSAtHlPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-1ifg63kZNiil53q7l3z86A-1; Thu, 19 Jan 2023 08:59:17 -0500
X-MC-Unique: 1ifg63kZNiil53q7l3z86A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9505C8A0116;
 Thu, 19 Jan 2023 13:59:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBEA91415108;
 Thu, 19 Jan 2023 13:59:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] travis.yml: Remove the generic addons section
Date: Thu, 19 Jan 2023 14:59:14 +0100
Message-Id: <20230119135914.2040853-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Each job uses its own addons section nowadays, so the generic section
is completely unused and outdated, thus we can remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index e24c99fdb9..b6b7fc9cef 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -16,43 +16,6 @@ cache:
   - $HOME/avocado/data/cache
 
 
-addons:
-  apt:
-    packages:
-      # Build dependencies
-      - libaio-dev
-      - libattr1-dev
-      - libbrlapi-dev
-      - libcap-ng-dev
-      - libcacard-dev
-      - libgcc-7-dev
-      - libgnutls28-dev
-      - libgtk-3-dev
-      - libiscsi-dev
-      - liblttng-ust-dev
-      - libncurses5-dev
-      - libnfs-dev
-      - libpixman-1-dev
-      - libpng-dev
-      - librados-dev
-      - libsdl2-dev
-      - libsdl2-image-dev
-      - libseccomp-dev
-      - libspice-protocol-dev
-      - libspice-server-dev
-      - libssh-dev
-      - liburcu-dev
-      - libusb-1.0-0-dev
-      - libvdeplug-dev
-      - libvte-2.91-dev
-      - libzstd-dev
-      - ninja-build
-      - sparse
-      - uuid-dev
-      # Tests dependencies
-      - genisoimage
-
-
 # The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
 # to prevent IRC notifications from forks. This was created using:
 # $ travis encrypt -r "qemu/qemu" "irc.oftc.net#qemu"
-- 
2.31.1



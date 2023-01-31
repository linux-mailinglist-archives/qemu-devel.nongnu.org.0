Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99F682A1F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndE-0002k8-7g; Tue, 31 Jan 2023 05:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncu-0002LJ-E9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002V0-JM
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jokM7kBtAjMF+RDDG5Sp7e35ER38WslTU89YvHQHcLo=;
 b=KcqC0QqfZMgJp9z3cJrKizmYa4r5WThSvV2ww0YTMg9UgyniVOvX11fh6S/cZY7diJKtpo
 PI4oSZtqyLY+4kNAyn67HjtkA7sX8OZhhVs8YE9DX3nRLi1znbNEY6/9oHYe6tnvqd84zf
 t/DXUAhdp8xcMtBiI+jKRW4cLhbeod4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-ei-cxLX8PnqgmVIpGN6YdA-1; Tue, 31 Jan 2023 05:12:17 -0500
X-MC-Unique: ei-cxLX8PnqgmVIpGN6YdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBA0E800186;
 Tue, 31 Jan 2023 10:12:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE28EC15BAD;
 Tue, 31 Jan 2023 10:12:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 07/27] travis.yml: Remove the generic addons section
Date: Tue, 31 Jan 2023 11:11:45 +0100
Message-Id: <20230131101205.1499867-8-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Message-Id: <20230119135914.2040853-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 788e14c08c..cf088ba4cf 100644
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



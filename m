Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3696B129F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01h-00013X-VM; Wed, 08 Mar 2023 15:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01b-00012U-T5
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01a-0006vF-CE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3NJSDdK9IidexqUuWYWIIP6h2jYWPfBhqOpNB2Un4c=;
 b=Cdnmh5xrm3f4rPErTMZ4cYsmxGiwQ3+ve38krnJ32OLq0fGNqQWx1O1vblEBQI8ppyTLtU
 zGezhYmNoSzPFStPjXfSL9ckftcgXz8xXSvRE3B+5qBfiZTSUD0D+OpxWwTzAcnqdyLxKo
 bYjtrDAE8ECHLYAq1xKIkcdRP2uaF/A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-8b-4i6QZPee7o7mx6JosfQ-1; Wed, 08 Mar 2023 15:04:24 -0500
X-MC-Unique: 8b-4i6QZPee7o7mx6JosfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6115438041DA;
 Wed,  8 Mar 2023 20:04:24 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 713ED2026D4B;
 Wed,  8 Mar 2023 20:04:23 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/5] qga/win32: Remove change action from MSI installer
Date: Wed,  8 Mar 2023 22:04:15 +0200
Message-Id: <20230308200419.453688-2-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
References: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

Remove the 'change' button from "Programs and Features" because it does
not checks if a user is an admin or not. The installer has no components
to choose from and always installs everything. So the 'change' button is
not obviously needed but can create a security issue.

resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2167423
fixes: CVE-2023-0664 (part 1 of 2)

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Yan Vugenfirer <yvugenfi@redhat.com>
Reported-by: Brian Wiltse <brian.wiltse@live.com>
---
 qga/installer/qemu-ga.wxs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 51340f7ecc..feb629ec47 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -31,6 +31,7 @@
       />
     <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
     <Property Id="WHSLogo">1</Property>
+    <Property Id="ARPNOMODIFY" Value="yes" Secure="yes" />
     <MajorUpgrade
       DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
       />
-- 
2.25.1



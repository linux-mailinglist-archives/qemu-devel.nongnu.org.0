Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A03996D5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:13:21 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loazA-0006LR-QL
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaxf-0003cz-Q2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaxc-0003du-Ik
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622679103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1B2iFDZCPWoV9tUDGowtsj4DNGR8ic8SPjErO59zQs=;
 b=hSJ24urmsUz9E9XN3rNtpvSI1bBIVhbcN2amsCyeN0F3INqCwNV6WnD2A7ysO1E+07uxGU
 /qVgEkWBLCBEYEmMRKLgo9HLCPhT1bh2DPPYHm4RZCmW3+/QswYgZJMkvVfenQyaO2Td2X
 Flgv96qha0UCTb+mZIQOAWyRNfQkgis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-7gz2AxCRMbujPjy-0McKQA-1; Wed, 02 Jun 2021 20:11:40 -0400
X-MC-Unique: 7gz2AxCRMbujPjy-0McKQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B618F180FD6F;
 Thu,  3 Jun 2021 00:11:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B358318EF6;
 Thu,  3 Jun 2021 00:11:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] GitLab: Add "Feature Request" issue template.
Date: Wed,  2 Jun 2021 20:11:29 -0400
Message-Id: <20210603001129.1319515-3-jsnow@redhat.com>
In-Reply-To: <20210603001129.1319515-1-jsnow@redhat.com>
References: <20210603001129.1319515-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on Peter Krempa's libvirt template, feature.md.

CC: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 .gitlab/issue_templates/feature_request.md

diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_templates/feature_request.md
new file mode 100644
index 00000000000..fc58ca27634
--- /dev/null
+++ b/.gitlab/issue_templates/feature_request.md
@@ -0,0 +1,32 @@
+<!--
+This is the upstream QEMU issue tracker.
+
+Please note that QEMU, like most open source projects, relies on
+contributors who have motivation, skills and available time to work on
+implementing particular features.
+
+Feature requests can be helpful for determining demand and interest, but
+they are not a guarantee that a contributor will volunteer to implement
+it. We welcome and encourage even draft patches to implement a feature
+be sent to the mailing list where it can be discussed and developed
+further by the community.
+
+Thank you for your interest in helping us to make QEMU better!
+-->
+
+## Goal
+<!-- Describe the final result you want to achieve. Avoid design specifics. -->
+
+
+## Technical details
+<!-- Describe technical details, design specifics, suggestions, versions, etc. -->
+
+
+## Additional information
+
+
+<!--
+The line below ensures that proper tags are added to the issue.
+Please do not remove it.
+-->
+/label ~"kind::Feature Request"
-- 
2.31.1



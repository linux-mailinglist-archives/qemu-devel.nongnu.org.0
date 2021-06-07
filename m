Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E877339E08F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:32 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHFr-00023y-W6
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEb-0000Gx-QO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEa-0002Br-8i
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623079931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtJ4P3cEqbwxIn8w1BNM1Sv2xZQ9vGWLHYrDiV6wZiQ=;
 b=aRKc6ImonK2v7jy1AkTsLcgpwxAYEjKxPZ8MIdciTnrGqzv1k22gKJJ3nkiAsdDb6qIaCx
 aKA2w2dQwB1JXpQMzRlGts1QNc25D/Ofo9qP67pt6BvRI+F7O+fSh9TRzVnXO666kexlkF
 zCEM2Ct8YygWzKoD2zoPmAE8MT3sGiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-TxmFX0uhOHODx1mnxi3glQ-1; Mon, 07 Jun 2021 11:32:09 -0400
X-MC-Unique: TxmFX0uhOHODx1mnxi3glQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62BF80EDA7;
 Mon,  7 Jun 2021 15:32:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A04BF5D9D3;
 Mon,  7 Jun 2021 15:32:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] GitLab: Add "Feature Request" issue template.
Date: Mon,  7 Jun 2021 11:31:55 -0400
Message-Id: <20210607153155.1760158-3-jsnow@redhat.com>
In-Reply-To: <20210607153155.1760158-1-jsnow@redhat.com>
References: <20210607153155.1760158-1-jsnow@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 .gitlab/issue_templates/feature_request.md

diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_templates/feature_request.md
new file mode 100644
index 0000000000..fc58ca2763
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



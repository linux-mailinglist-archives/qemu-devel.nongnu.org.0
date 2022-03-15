Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65AA4D9677
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:39:05 +0100 (CET)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2hr-0000hK-5n
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:39:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU2eW-0007C4-FH
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU2eR-0003gO-D9
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647333327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2e3e+JPO1CD8bk6glkDMuke5JW/E0hF210ukicwduY8=;
 b=ggtpF2we/+vMVpzVepKjoOroA1YvVRXKwCGdPBc1YiBfWyWaVqbtUjrE0lzbZ4hHTxDIjI
 jXROlxbMHPE4RDrNAUD+YjwOZIyoFTHz6aGT6V1839xPrHukL+Nw5Cp/moHSnek1X0YZev
 Ck43gYUG+MSOWdOBi8cUK0W9xrSu8GI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-3MdQ-bpbNZKwmZLkQ_Zp9w-1; Tue, 15 Mar 2022 04:35:26 -0400
X-MC-Unique: 3MdQ-bpbNZKwmZLkQ_Zp9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C0A3C025D8;
 Tue, 15 Mar 2022 08:35:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49C795B4237;
 Tue, 15 Mar 2022 08:35:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0?] meson: Update to version 0.61.3
Date: Tue, 15 Mar 2022 09:35:21 +0100
Message-Id: <20220315083521.280024-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.61.3 contains an important fix which helps to see the
output of failed qemu-iotests on the console again:
https://gitlab.com/qemu-project/meson/-/commit/7534cf34f83b9c43

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 12f9f04ba0..5cf5575a7c 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
+Subproject commit 5cf5575a7c76746935dcd9a9e380803c85023c04
-- 
2.27.0



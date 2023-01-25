Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DD67AF8B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 11:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKcts-0003N2-Tr; Wed, 25 Jan 2023 05:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKctq-0003MB-Ja
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKctp-0005pS-0R
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674642060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PSv0jllAclgkXV9e3XG7dLmpbzt+XcF97XzPOjOogS0=;
 b=VNpsbuYEcmIUd3XMNA/gYYjVeedU4BYKxCmQk36uWm9C/v6PGyclslLz0AD9/NLdUs29WA
 TN3YX2Hh6ygs/fS3pOLRCcU7V/8l9wo7OJvGE+X0DUozuSe3NQc91iA7lupIp4q2+Nt6Wz
 lFnqgIZ1PcxFm30mLaEWD631laMSr8c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-Ayx7E7rUOQC2of0h4J9C4Q-1; Wed, 25 Jan 2023 05:20:56 -0500
X-MC-Unique: Ayx7E7rUOQC2of0h4J9C4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9981C270AC;
 Wed, 25 Jan 2023 10:20:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0CA42203;
 Wed, 25 Jan 2023 10:20:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	wenchao.wang@intel.com
Subject: [PATCH] docs/about/deprecated: Mark HAXM as deprecated
Date: Wed, 25 Jan 2023 11:20:53 +0100
Message-Id: <20230125102053.902098-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The HAXM project has been retired (see https://github.com/intel/haxm#status),
so we should mark the code in QEMU as deprecated (and finally remove it
unless somebody else picks the project up again - which is quite unlikely
since there are now whpx and hvf on these operating systems, too).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3f4d678eb4..da2e6fe63d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -93,6 +93,12 @@ form is preferred.
 The HPET setting has been turned into a machine property.
 Use ``-machine hpet=off`` instead.
 
+``-accel hax`` (since 8.0)
+''''''''''''''''''''''''''
+
+The HAXM project has been retired (see https://github.com/intel/haxm#status).
+Use "whpx" (on Windows) or "hvf" (on macOS) instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.31.1



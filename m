Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A03E2E0A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:56:53 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2DM-0003ej-68
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC28N-0000Hd-M0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC28M-0004RS-Bm
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628265101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zel/7QtniuwILT5KLvd7desrZ5h+POHcV1UuQU5VRxs=;
 b=EOoj8hVbnwmrWwYyGhfXnbQAxr8/qak/9QKYZue0w4CQlIhkAR/rVdPf8TO1WNm6EBFup8
 DDYwa79jIPK7E74p6rsE5goU7+9aW327Z8kCiuU2UUAQf8p+lENbZy4b1vOV3NPIeDgQrP
 GdMzDyTwkyjV2BKKM88D+UuJFvjxvPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-KLOgG37sPC6esrGsLj2BBA-1; Fri, 06 Aug 2021 11:51:38 -0400
X-MC-Unique: KLOgG37sPC6esrGsLj2BBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4004C107ACF5;
 Fri,  6 Aug 2021 15:51:37 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0EE56A056;
 Fri,  6 Aug 2021 15:51:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] docs/devel: create "QEMU API" section
Date: Fri,  6 Aug 2021 11:51:31 -0400
Message-Id: <20210806155132.1955881-7-jsnow@redhat.com>
In-Reply-To: <20210806155132.1955881-1-jsnow@redhat.com>
References: <20210806155132.1955881-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/index.rst       |  4 +---
 docs/devel/section-api.rst | 10 ++++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 docs/devel/section-api.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index b146ce00f7a..9f9e96204fc 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -12,14 +12,12 @@ modifying QEMU's source code.
    section-community-governance
    section-development
    section-testing-debugging
+   section-api
    section-tcg
    section-subsystems
    control-flow-integrity
    s390-dasd-ipl
-   qom
    block-coroutine-wrapper
    multi-process
    ebpf_rss
    vfio-migration
-   qapi-code-gen
-   writing-qmp-commands
diff --git a/docs/devel/section-api.rst b/docs/devel/section-api.rst
new file mode 100644
index 00000000000..d62b614fe3d
--- /dev/null
+++ b/docs/devel/section-api.rst
@@ -0,0 +1,10 @@
+QEMU API
+========
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   qapi-code-gen
+   writing-qmp-commands
+   qom
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1733E2DFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:54:05 +0200 (CEST)
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2Af-0005u4-0a
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC28J-0000CY-6p
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mC28G-0004KH-CT
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628265095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jygsom2uz5IddsJ83EZXAPI6mU79vaHtzXCJAeAZD0=;
 b=NdqxD1UfY7+ZVOFkMVRb6LqLeCyKiyh3chgVIcDwXd3jxHTs+cL/KIvxinDYDhaA+t5SDy
 Q1cWvkvuVj4hemz7Y/stO3Boi80b/3BcQ4rPvH2+fCR8B5os6e8s5zCPQ9f6NkhWyr2L/D
 g1j4zYrWLJqnrE/q3suJYEU8KJScZ5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-qjr_N3TpM-qpW-ZIfTKzhw-1; Fri, 06 Aug 2021 11:51:34 -0400
X-MC-Unique: qjr_N3TpM-qpW-ZIfTKzhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C39E875048;
 Fri,  6 Aug 2021 15:51:33 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 111401B5C0;
 Fri,  6 Aug 2021 15:51:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] docs/devel: create "Community & Governance" subsection
Date: Fri,  6 Aug 2021 11:51:26 -0400
Message-Id: <20210806155132.1955881-2-jsnow@redhat.com>
In-Reply-To: <20210806155132.1955881-1-jsnow@redhat.com>
References: <20210806155132.1955881-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Plonk the Code of Conduct and Conflict Resolution Policy guides into a
new "Community & Governance" subsection.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst                        | 3 +--
 docs/devel/section-community-governance.rst | 9 +++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 docs/devel/section-community-governance.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 5522db72411..008d489d751 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -9,8 +9,7 @@ modifying QEMU's source code.
    :maxdepth: 2
    :includehidden:
 
-   code-of-conduct
-   conflict-resolution
+   section-community-governance
    build-system
    style
    kconfig
diff --git a/docs/devel/section-community-governance.rst b/docs/devel/section-community-governance.rst
new file mode 100644
index 00000000000..2c7e07257d1
--- /dev/null
+++ b/docs/devel/section-community-governance.rst
@@ -0,0 +1,9 @@
+Community & Governance
+======================
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   code-of-conduct
+   conflict-resolution
-- 
2.31.1



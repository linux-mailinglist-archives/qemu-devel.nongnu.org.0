Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870546C819E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjT2-0005SV-Lr; Fri, 24 Mar 2023 11:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjT0-0005NM-BF
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSy-0001lg-Ly
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMB52kmlumHzgD+a9uM1vB6Tr6zmxvym1oafFsPRxVY=;
 b=cbg2GYCqY/4eFJeLJGnyCS/HblCi8Clw+tXg0hTx6ivZpqXGwZtP+PgruZWLKsqyA1j6PD
 PV/H6XF5fJgfq8kQqrke0ePaTCq4MSqQKNx4sq4Wh6wm4bn7j4lltGInZeIkws2OD2vNWL
 3oUULqGzzDtFxobnQmkBfNdY4RFA8KI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Q15ALiHRPR-pRxn8dEeIbw-1; Fri, 24 Mar 2023 11:36:30 -0400
X-MC-Unique: Q15ALiHRPR-pRxn8dEeIbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE45438221DF;
 Fri, 24 Mar 2023 15:36:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A144140E950;
 Fri, 24 Mar 2023 15:36:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 8/8] Revert "docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation"
Date: Fri, 24 Mar 2023 16:36:10 +0100
Message-Id: <20230324153610.224673-9-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

This reverts commit 1d0a8eba38cdddd028ea02c6e0b68f0a4c9a3cbf.

The commit made the wrong assumption that 64-bit distros are most
common these days on arm devices, but as Liviu Ionescu pointed out,
the recommended OS for the very popular Raspberry Pi boards is still
the 32-bit variant, and thus likely still used by a lot of people:

 https://www.raspberrypi.com/software/operating-systems/

Thus it's likely still a little bit too early to put this host
environment on the deprecation list and we should wait a little
bit longer 'til 64-bit distros are the predominant ones.

Message-Id: <20230317165504.613172-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 33b942283f..1ca9dc33d6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -206,15 +206,6 @@ be an effective use of its limited resources, and thus intends to discontinue
 it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
-System emulation on 32-bit arm hosts (since 8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''
-
-Since QEMU needs a strong host machine for running full system emulation, and
-all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
-support for running any system emulation on 32-bit arm hosts in general. Use
-64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
-continues to be supported on 32-bit arm hosts, too)
-
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1



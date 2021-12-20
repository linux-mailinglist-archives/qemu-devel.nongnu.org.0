Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F947B11C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:31:37 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLZY-0001AG-2v
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1mzKba-0006HI-M8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1mzKbX-0003I9-NS
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aKNxBepNzmtkgKDMePqjloKPUY74B789Lsc9IYZw+Yo=;
 b=DuqWyE/k8fnuhPcUaOiqOkFgwagaOIBdsYDrOMNRhVqVWXsMSEt4ql6t8oPcsfQm0wSOMd
 otwIx/pXgEOEANGw/NAHFQcy5yWBVk0U69OSd+EClKM7fXDR0ayUjBfcNj6Z9DDRcEvTZG
 gLXDJ3D5GUHsf7efw8F+gzOV0eBFbKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-RPu_Q77hOFW4azZHwK6p6w-1; Mon, 20 Dec 2021 09:56:31 -0500
X-MC-Unique: RPu_Q77hOFW4azZHwK6p6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FFE0801B0B
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:56:30 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94E3572FA6;
 Mon, 20 Dec 2021 14:56:25 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] schemas: add missing vim modeline
Date: Mon, 20 Dec 2021 15:56:24 +0100
Message-Id: <20211220145624.52801-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to f7160f3218 "schemas: Add vim modeline"

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/audio.json  | 1 +
 qapi/compat.json | 1 +
 qapi/replay.json | 1 +
 qapi/trace.json  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/qapi/audio.json b/qapi/audio.json
index 9cba0df8a4..fe3b506ec3 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -1,4 +1,5 @@
 # -*- mode: python -*-
+# vim: filetype=python
 #
 # Copyright (C) 2015-2019 Zoltán Kővágó <DirtY.iCE.hu@gmail.com>
 #
diff --git a/qapi/compat.json b/qapi/compat.json
index dd7261ae2a..c53b69fe3f 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -1,4 +1,5 @@
 # -*- Mode: Python -*-
+# vim: filetype=python
 
 ##
 # = Compatibility policy
diff --git a/qapi/replay.json b/qapi/replay.json
index bfd83d7591..b4d1ba253b 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -1,4 +1,5 @@
 # -*- Mode: Python -*-
+# vim: filetype=python
 #
 
 ##
diff --git a/qapi/trace.json b/qapi/trace.json
index eedfded512..119509f565 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -1,4 +1,5 @@
 # -*- mode: python -*-
+# vim: filetype=python
 #
 # Copyright (C) 2011-2016 Lluís Vilanova <vilanova@ac.upc.edu>
 #
-- 
2.33.1



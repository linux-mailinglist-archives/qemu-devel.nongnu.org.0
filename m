Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B023349E1C6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:58:57 +0100 (CET)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3QV-00080Z-0c
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xj-0005dX-3m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xg-0000NO-V4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643282948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LD/BvmwFxeDFmz1CA0PqMx56Fm1tSxQo7h+DwLqdHOc=;
 b=g5P7ezzptBTl9ZQ0TspHDafeYEQ7KqGbZrefQNVwgQll8dtlNXM7IxhjNun5GZfeSX1G1Y
 NavmriAHRtHl+TgOEI0jen5DrqV+l2S8ybXCHYbvjYdh7kOk4oTwLuot1No1lRMq/flRiD
 iGJowL/KAgMuKEdvjmWIoErX7b+Zpwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-DWPVtN8NPsGWuAPzW_E7fQ-1; Thu, 27 Jan 2022 06:29:05 -0500
X-MC-Unique: DWPVtN8NPsGWuAPzW_E7fQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B7464092;
 Thu, 27 Jan 2022 11:29:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D041C75535;
 Thu, 27 Jan 2022 11:29:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FA3E11384A5; Thu, 27 Jan 2022 12:28:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] schemas: add missing vim modeline
Date: Thu, 27 Jan 2022 12:28:52 +0100
Message-Id: <20220127112859.222484-2-armbru@redhat.com>
In-Reply-To: <20220127112859.222484-1-armbru@redhat.com>
References: <20220127112859.222484-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: peter.maydell@linaro.org, Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

Similar to f7160f3218 "schemas: Add vim modeline"

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20211220145624.52801-1-victortoso@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/audio.json  | 1 +
 qapi/compat.json | 1 +
 qapi/replay.json | 1 +
 qapi/trace.json  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/qapi/audio.json b/qapi/audio.json
index 693e327c6b..0785e70a50 100644
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
2.31.1



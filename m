Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36E5FC7C8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:53:17 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oid6g-0000vE-Um
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnY-00052j-NS
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnX-0006jp-7f
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxMpdLsJ7uP78UBqiB7q9xhpRgLVZZ5xaoHG9WUYigM=;
 b=NyNTB+TbpaE4flFF6yEhIGGmyeuVaCfYaNqMp2YizhBiB6N9fo3TlHVUZSqYWGr2td4Rj3
 PXO91gK6gsk/+HFzro0zWUxLUgxtn7QO2U3Qxo8R4+FGJSXblCxfYn7DUWmiRRxzBK6wkd
 vStftFHWCjS+cYkQagveNC1ZZEXy5mk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-IclPhM71OqOQxXrRdIRihQ-1; Wed, 12 Oct 2022 10:33:22 -0400
X-MC-Unique: IclPhM71OqOQxXrRdIRihQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 145F51C068C9;
 Wed, 12 Oct 2022 14:33:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E2AC2144B20;
 Wed, 12 Oct 2022 14:33:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: dinglimin <dinglimin@cmss.chinamobile.com>,
 =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
Subject: [PULL 02/16] tests/migration: remove the unused local variable
Date: Wed, 12 Oct 2022 16:33:02 +0200
Message-Id: <20221012143316.988561-3-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: dinglimin <dinglimin@cmss.chinamobile.com>

Remove the unused local variable "records".

Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
Reviewed-by: Ján Tomko <jtomko@redhat.com>
Message-Id: <20220928080555.2263-1-dinglimin@cmss.chinamobile.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/migration/guestperf/engine.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 87a6ab2009..59fca2c70b 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -65,7 +65,6 @@ def _vcpu_timing(self, pid, tid_list):
         return records
 
     def _cpu_timing(self, pid):
-        records = []
         now = time.time()
 
         jiffies_per_sec = os.sysconf(os.sysconf_names['SC_CLK_TCK'])
-- 
2.31.1



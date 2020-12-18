Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92972DE189
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:54:36 +0100 (CET)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDP9-0000H5-UN
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCc-00035W-7I
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCa-0004Y6-A9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrzrX6iuzJhbcG2ZgfN5m25KcePFqyYFOUMkOpfCM58=;
 b=X872hwezfga6jbBG83iPs7QZL9CW9oyjWoC5C9gjbaYo+Iqmu7auDoGYMWp5P4KjbXu5aG
 /Zy3yAEyEEHg7cnYSM5V02Ubv2tmgTLm95KHl+4jc4AtwW+qH/DtGIyYVQXW5De9TyhWLI
 X/OKkf+FfuUgRYqufsRW22KTFUSWiZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-RZdtS8yuPX2007VWnWBwkQ-1; Fri, 18 Dec 2020 05:41:31 -0500
X-MC-Unique: RZdtS8yuPX2007VWnWBwkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90E51005D44;
 Fri, 18 Dec 2020 10:41:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B818B60C15;
 Fri, 18 Dec 2020 10:41:27 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 02/15] monitor:braces {} are necessary for all arms of this
 statement
Date: Fri, 18 Dec 2020 10:41:04 +0000
Message-Id: <20201218104117.199096-3-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yutao Ai <aiyutao@huawei.com>

Fix the errors by add {}

Signed-off-by: Yutao Ai <aiyutao@huawei.com>
Message-Id: <20201125014514.55562-3-aiyutao@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/misc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index fde6e36a0b..09f9a74d78 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -492,8 +492,10 @@ static void hmp_singlestep(Monitor *mon, const QDict *qdict)
 static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_try_str(qdict, "device");
-    if (!device)
+    if (!device) {
         device = "tcp::" DEFAULT_GDBSTUB_PORT;
+    }
+
     if (gdbserver_start(device) < 0) {
         monitor_printf(mon, "Could not open gdbserver on device '%s'\n",
                        device);
@@ -559,10 +561,11 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     }
 
     len = wsize * count;
-    if (wsize == 1)
+    if (wsize == 1) {
         line_size = 8;
-    else
+    } else {
         line_size = 16;
+    }
     max_digits = 0;
 
     switch(format) {
@@ -583,10 +586,11 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     }
 
     while (len > 0) {
-        if (is_physical)
+        if (is_physical) {
             monitor_printf(mon, TARGET_FMT_plx ":", addr);
-        else
+        } else {
             monitor_printf(mon, TARGET_FMT_lx ":", (target_ulong)addr);
+        }
         l = len;
         if (l > line_size)
             l = line_size;
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60D4D0BA5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:04:08 +0100 (CET)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMOd-0002F1-BZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7O-0008Ac-QD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7N-0005hp-8U
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=C5iMlbASgWPDeqAnFhrKVLwJynE4rvo4lxsx89mo1qx3w+R6JHove8Bzs2Fp3ajZRUTAjV
 dMUZ+fcODGMZZkGYUJFyN3lLq/z34nd5tVyLqoumzcFzp2yvWwB+mjS57Ig7Oo8+POu+l5
 fXhja7ixwNMCUmn07G27CWlHIfLEBQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-vF8lqwu7OLeaSFFmvsOK_Q-1; Mon, 07 Mar 2022 17:46:14 -0500
X-MC-Unique: vF8lqwu7OLeaSFFmvsOK_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so266775wme.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=XphTW7bJdZkcayG68qWsrHBDDoT/LDsLtmwZomwTNisOif/dTpwuNTt8ygw0V43YJZ
 Nt399nND1Pc0d9kaPAAWtKbJ/EZ4qAAUCFNX3cgU7lejLM4N/wx0dNKEQ4EG/oGO566U
 dY/FD751e8cwN6cn3dji/U3qQ0+9U6tm47bvkVKP3nSc3iw22mbjszs7SPyCf5azcbD8
 kIXyW/DFueBeFyi8QXUWEFk96vj1lHDeCF8K3uVfqOy1mwtoKujxRnyfWDu+EdW2oJLi
 byWc/xqXf4dhWYAXoj0QWW/UpKGfz5NDY+4L9KgmIfoNxuB64RuA4SL4cN7hI0imDpzs
 gU+g==
X-Gm-Message-State: AOAM530ud3rO80gjuPPbZA2jqvopMi8R1vc5nFSWqD+2DBjuiXlPNtGx
 By8Vnlr6XKP3SUfcWSk2U/ji27jof1KRdY4TJd493m7CK3nKMVrhsN/iosbBB6NQ1/Fc0HtyR1m
 SUMGqH2RVxmGAExr96x7NZs5dExH7FnvHWQLqROFsZEojtFBpFrBF4XP/BGEi
X-Received: by 2002:a05:600c:1e02:b0:389:a488:4b7f with SMTP id
 ay2-20020a05600c1e0200b00389a4884b7fmr959552wmb.57.1646693172936; 
 Mon, 07 Mar 2022 14:46:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzym8RAKHkT81526Rvqo1htDvC0CuuCLlrJK99miQSP75S2h9suqTa9YyTsEjlthk8hw5NjGw==
X-Received: by 2002:a05:600c:1e02:b0:389:a488:4b7f with SMTP id
 ay2-20020a05600c1e0200b00389a4884b7fmr959531wmb.57.1646693172653; 
 Mon, 07 Mar 2022 14:46:12 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c4e9400b003898e252cd4sm594738wmq.12.2022.03.07.14.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:12 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 31/47] hw/misc/pvpanic: Use standard headers instead
Message-ID: <20220307224357.682101-32-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

QEMU side has already imported pvpanic.h from linux, remove bit
definitions from include/hw/misc/pvpanic.h, and use
include/standard-headers/linux/pvpanic.h instead.
Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220221122717.1371010-2-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pvpanic.h | 8 --------
 hw/misc/pvpanic-isa.c     | 4 +++-
 hw/misc/pvpanic-pci.c     | 4 +++-
 hw/misc/pvpanic.c         | 5 +++--
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ca3c5bb533..7f16cc9b16 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -22,14 +22,6 @@
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-/* The bit of supported pv event, TODO: include uapi header and remove this */
-#define PVPANIC_F_PANICKED      0
-#define PVPANIC_F_CRASHLOADED   1
-
-/* The pv event value */
-#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
-#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
-
 /*
  * PVPanicState for any device type
  */
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index a39fcdd1fc..b84d4d458d 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/isa/isa.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
 
@@ -64,7 +65,8 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
-    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 62e1be68c1..99cf7e2041 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/pci/pci.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
 
@@ -53,7 +54,8 @@ static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
 }
 
 static Property pvpanic_pci_properties[] = {
-    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index e2cb4a5d28..1540e9091a 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -21,12 +21,13 @@
 #include "hw/qdev-properties.h"
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
+#include "standard-headers/linux/pvpanic.h"
 
 static void handle_event(int event)
 {
     static bool logged;
 
-    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASHLOADED) && !logged) {
+    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASH_LOADED) && !logged) {
         qemu_log_mask(LOG_GUEST_ERROR, "pvpanic: unknown event %#x.\n", event);
         logged = true;
     }
@@ -36,7 +37,7 @@ static void handle_event(int event)
         return;
     }
 
-    if (event & PVPANIC_CRASHLOADED) {
+    if (event & PVPANIC_CRASH_LOADED) {
         qemu_system_guest_crashloaded(NULL);
         return;
     }
-- 
MST



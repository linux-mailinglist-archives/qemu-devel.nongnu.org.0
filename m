Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6B6F06E3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:53:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps23N-0006sz-G8; Thu, 27 Apr 2023 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps23K-0006nB-Pi
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:52:54 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps23I-0001DV-1p
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:52:54 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 275919966
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5UzTMqjl9MzAeIOBzcmxWkngX1612RIKZh0ujC45NGQN5FlHY01je
 htvWDvSPv7bZDf0fYt0a42y8EwBvsfQx9RmHQBrqik0Ei0W8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZhPaojUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fdcj4upNA0dzz
 +0JBBk/NDGA3f2//K3uH4GAhux7RCXqFIYWu3Ul1DKASPh/EMGFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk6aJUQeaz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuewYYOEK4LULSlTtkWnn
 V/BvEHBOyw5Kf+Z2xG+4G2Sr/CayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVWoF5zzBkzp5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR87KfamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:7mQn86keBHiNR6AjqOgB0x4JiYHpDfL23DAbv31ZSRFFG/FwWf
 re+MjzsiWE8gr5PUtLpTnuAtjnfZqxz+8W3WBzB8bYYOCZghrQEGgK1+KLqEyCJ8SXzI5gPM
 xbAs9D4bPLfD1HpPe/yiWDV/gb/Pm73JaBudr+pk0dMD2CqJsN0+66MGum+4FNKjWufaBJbK
 Z0L/ApxgadRQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AH9vC4WoAnVO6n7j2y3dhaxvmUZoeanHnzlHtGV6?=
 =?us-ascii?q?pJU9bEpyWE0CZxLwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUIZRDg0OdgmB8OCJxvcm7W8uCjUj4JuVNUdOtK0?=
 =?us-ascii?q?/huqZFipiEAyPkwqeXdpy?=
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 09:52:42 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-74dfa88c37cso580793485a.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682603562; x=1685195562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ee0L2ekBMCB56JKHi679wWZVx+il2yanjOYUhkhs5U=;
 b=QzLzMyVPPu2GBXQaJc/YbR65iDbR3EGHvAHmXmXGye7Q8hJSy9avolZ2nTvoqAI23n
 /fSyQ650i/fDqGer6SafylzOd7zpaR+YUlSnF1mhrID/rfA7+bqr4iUkePnWvuGB7WkR
 IjcDINVGC382aCGCXX/PbIkoDSfyjPX4NJ5pP345MS9KyDwlExepn9+Pcja8TrpeN219
 Wiew+hibfjSO8VmHEzHYJUUVcfellL+kG54iY/nAdY5a1X3Ogh5wDegtrHkyIPKOnI28
 PZSXbGqMWag5ZyHpIUp27ffSUOGRddETeMsL0L2y+DuRP5wOxYkbbE4kjK+Kj5PvLvZJ
 28wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682603562; x=1685195562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ee0L2ekBMCB56JKHi679wWZVx+il2yanjOYUhkhs5U=;
 b=gynlb+AbKsntsNVlDosYFrLGJaZ7AJaFOeXVhw6/Os1KEO4zhBoRxUFpGJMu9qwFBH
 Eg/no/57EVQ9nxTRHRSEXIIjJFJrZA2I2wnWD6DhsFgLbDrgo76/6P1vPBFleUN2wL7w
 EtbtJ7kiuAbaaT+WJjT1FJJ1G2VFkOjGaFAsdZRePA3KZ6nFUTdLkbUp66HKz9mrUngA
 wLY1fCvK+XdO8PZDm/UYASq4Z6hbgD5lFi5zqDVDdZBw+rjh6VbmtE22j/A0EQ4y00Bm
 qX1sVobOjn0qSulFGXCv6qkcI0WmSWi2nWG7crKkjSeZaO7UTkmNNqBu+u/4+npz6krW
 h6GQ==
X-Gm-Message-State: AC+VfDzPDrkCkDL8NJfNOeSk2M24zbEYulzcmNq99lNu7sPuj2mhAdjI
 RT7bWwepVGrfb2X+D7e2x6itf7qzXKJbuUVtrLyg05i3aNVJr7CobdfhKuDr8HohaRjdpE5h7EC
 TZS2I35WiQfFo+QyXf4kyqQHbnrP4gFJGMJ2YtHGKwjQ=
X-Received: by 2002:ad4:5ccc:0:b0:5ef:6142:cb05 with SMTP id
 iu12-20020ad45ccc000000b005ef6142cb05mr2247883qvb.20.1682603561970; 
 Thu, 27 Apr 2023 06:52:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HEJtRqpFq5p/iKp5ApiMKP2VzgGIyypg5UEWGYgqhHt/I3TrUyb8/DIJ2EYdAxo+BCz8jFQ==
X-Received: by 2002:ad4:5ccc:0:b0:5ef:6142:cb05 with SMTP id
 iu12-20020ad45ccc000000b005ef6142cb05mr2247848qvb.20.1682603561694; 
 Thu, 27 Apr 2023 06:52:41 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a0ca952000000b005dd8b9345d3sm5622567qva.107.2023.04.27.06.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 06:52:41 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] apic: disable reentrancy detection for apic-msi
Date: Thu, 27 Apr 2023 09:52:33 -0400
Message-Id: <20230427135233.2973922-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

As the code is designed for re-entrant calls to apic-msi, mark apic-msi
as reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
Based-on: <20230426161951.2948996-1-alxndr@bu.edu>

 hw/intc/apic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 20b5a94073..ac3d47d231 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -885,6 +885,13 @@ static void apic_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->io_memory, OBJECT(s), &apic_io_ops, s, "apic-msi",
                           APIC_SPACE_SIZE);
 
+    /*
+     * apic-msi's apic_mem_write can call into ioapic_eoi_broadcast, which can
+     * write back to apic-msi. As such mark the apic-msi region re-entrancy
+     * safe.
+     */
+    s->io_memory.disable_reentrancy_guard = true;
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, apic_timer, s);
     local_apics[s->id] = s;
 
-- 
2.39.0



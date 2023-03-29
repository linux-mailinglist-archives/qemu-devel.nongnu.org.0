Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AE46CDA27
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:09:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVXA-0000rk-C6; Wed, 29 Mar 2023 09:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4450486d3=Mark.Syms@citrix.com>)
 id 1phTRM-00089j-Pf
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:54:04 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4450486d3=Mark.Syms@citrix.com>)
 id 1phTRK-0006uB-Si
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680087242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GADAyKytr/XOUOsSzCpFJLI8OYouf6rYBKHpVl/jpr4=;
 b=KBUXms5jvh8Qx5YwDKaRTlZpHJEflEBF7mhLA4irSwIWrQZoeCUPv+jg
 ib8wHNaQZPlQJya5lXb4LdWe59B49fzn+t0VlHKHhVje7aep5VWeAkFkB
 4TNIueEPbDdlfWfNChWpOo1ZMhuJzHb0fb7rOuWQOe+s1SMPCKHIStN7/ s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103413673
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:b3XDaKLYKDLnO1hxFE+RhZUlxSXFcZb7ZxGr2PjKsXjdYENShGBVz
 2scCj2AP/uDM2rxKYx/Otvl9ksOu8fczdRnGlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HL25C2
 8ZGbws9NDqKoLuk2Zu5dfZj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWue6yhT/EYjhDgFmUubA28y7YywkZPL3FaYKOJoXRG5oO9qqej
 l7C52jjKx4HCNaS9huF612Ip++SoiyuDer+E5Xnr6U30TV/3Fc7ERATSB63rOe0jma4XNRQL
 VFS/TAhxZXe72TyEIO7BUfh5ifZ4FhFAYE4//AGBB+l+oTb7yijWC8/fmRrYft/ptYfRwM12
 Qrc9z/2PgCDoIF5WFrEqOjF/GPiZXRFRYMRTXRaFFVYurEPtKl210uSFYg7TcZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhKTyszA3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bYGWE2w40QMN4qWrFF5ufkWZ4umkWyKBBbK45lcLBO
 heP6Wu9GrcJVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzX3SFTyfepHsGTRfJjwjQfL0EzflX1
 WGzLZz9Uh73yM1PkFKLegvq+eR1mnpvmz6LGPgWDX2PiNKjWZJccp9dWHPmUwzzxPrsTNn9m
 zqHC/a39g==
IronPort-HdrOrdr: A9a23:wEs+/qNpAq+ZcsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; d="scan'208";a="103413673"
To: <qemu-devel@nongnu.org>
CC: <tim.smith@cloud.com>, <mark.syms@cloud.com>, Mark Syms
 <mark.syms@citrix.com>
Subject: [PATCH] Ensure the PV ring is drained on disconnect
Date: Wed, 29 Mar 2023 11:53:44 +0100
Message-ID: <20230329105344.3465706-2-mark.syms@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329105344.3465706-1-mark.syms@citrix.com>
References: <20230329105344.3465706-1-mark.syms@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=4450486d3=Mark.Syms@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Mar 2023 09:08:07 -0400
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
Reply-to:  Mark Syms <mark.syms@citrix.com>
From:  Mark Syms via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Also ensure all pending AIO is complete.

Signed-off-by: Mark Syms <mark.syms@citrix.com>
---
 hw/block/dataplane/xen-block.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 734da42ea7..067f8e2f45 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
 
     dataplane->more_work = 0;
 
+    if (dataplane->sring == 0) {
+        return done_something;
+    }
+
     rc = dataplane->rings.common.req_cons;
     rp = dataplane->rings.common.sring->req_prod;
     xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
@@ -666,11 +670,23 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 {
     XenDevice *xendev;
+    XenBlockRequest *request, *next;
 
     if (!dataplane) {
         return;
     }
 
+    /* Ensure we have drained the ring */
+    do {
+        xen_block_handle_requests(dataplane);
+    } while (dataplane->more_work);
+
+    /* Now ensure that all inflight requests are complete */
+    QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
+        blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
+                      request);
+    }
+
     xendev = dataplane->xendev;
 
     aio_context_acquire(dataplane->ctx);
-- 
2.39.2



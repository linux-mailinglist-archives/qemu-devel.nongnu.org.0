Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9A2B7B21
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:23:59 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKd4-0005An-S9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ2-0008VB-T0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:48 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ0-0003eo-Te
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:48 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t9so1386715edq.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQyuD1TAfpwTnEM4g2uQyeb7uUybRaaaBt1SZkktnpg=;
 b=sV3XObuMEG0tLJA+MSVIJ+xEew+eoxs6MsfmNBYjAZ5Xb90AGVsbUt3mimJxah5zcT
 Q0exT/f36ZMWW3V+TSJVUFbONMzK6dk9buNq2rPmGTC9K+ZY4Y6IbpFAE3TG95yWEc8w
 1d1HoQ60dEdaEelTMhIfKWorkp+emFjKREnKywKtzEGxXHOHCSoMzMoS5ae5Eytequ2f
 q/YRvYxZXyS3Q5ET7ODYPDOCKTNEKSHisgC+LgKQ3D5BZdpc8ft4qC+/+PiQFY7nQmC0
 r4fBiEQbc7YlsMiYWEIzCXvfnSgSYIN2I0shx9Wpv4pONDif3Wp5cW51XqeLMvFz+SZC
 m5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OQyuD1TAfpwTnEM4g2uQyeb7uUybRaaaBt1SZkktnpg=;
 b=uK+s42hagaNfhb39A4Jqr9QDocHpBuh/BmTROXxhyaVzUxEiXdE7EI+aNtWMxPnCIH
 8HwisV5SxDZELAjjTsZbsUomEOljOigst23VjjqYjrLhr94a36hBvNcu/kcurgEPMTR5
 3pEuxLY6vfmNvLXmtyzH8QQmmyL8Nwjx9cYI20VK5ss+jIM7jzOr5Zw/LtByQM6qrrOi
 oWGFLPiNNU09mYxeiV2HhElpASgK6pPtbJQqXAw1TSuRdgxkeMiPZQdWPUU409A8bQ7+
 gZltKJ42nGW9ziWUQJQJPdf7EXAAGcROZyggWORhT+O4N8g4cLNxkbD32udPGLTuj0dG
 baMg==
X-Gm-Message-State: AOAM533YBQgkSzbHsYH8l3IYDeuAAKlDJwXKdW+d3swq/otTDBpgO9zI
 T5BkRLWqECe7N+dRHy3faQUa0Qm2cJ4=
X-Google-Smtp-Source: ABdhPJxzveRzZJSwaaE4vx6wjtoi0OwbJDJ8bDUiy4q4q4R4i5KujOgDjZzlaBjKSPGBX5OpZpsG0g==
X-Received: by 2002:aa7:ce82:: with SMTP id y2mr25558873edv.6.1605694785108;
 Wed, 18 Nov 2020 02:19:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] docs: Fix some typos (found by codespell)
Date: Wed, 18 Nov 2020 11:19:35 +0100
Message-Id: <20201118101940.132594-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Fix also a similar typo in a code comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20201117193448.393472-1-sw@weilnetz.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/can.txt                  | 8 ++++----
 docs/interop/vhost-user.rst   | 2 +-
 docs/replay.txt               | 2 +-
 docs/specs/ppc-spapr-numa.rst | 2 +-
 docs/system/deprecated.rst    | 4 ++--
 docs/tools/virtiofsd.rst      | 2 +-
 hw/vfio/igd.c                 | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/can.txt b/docs/can.txt
index 5838f6620c..0d310237df 100644
--- a/docs/can.txt
+++ b/docs/can.txt
@@ -19,7 +19,7 @@ interface to implement because such device can be easily connected
 to systems with different CPU architectures (x86, PowerPC, Arm, etc.).
 
 In 2020, CTU CAN FD controller model has been added as part
-of the bachelor theses of Jan Charvat. This controller is complete
+of the bachelor thesis of Jan Charvat. This controller is complete
 open-source/design/hardware solution. The core designer
 of the project is Ondrej Ille, the financial support has been
 provided by CTU, and more companies including Volkswagen subsidiaries.
@@ -31,7 +31,7 @@ testing lead to goal change to provide environment which provides complete
 emulated environment for testing and RTEMS GSoC slot has been donated
 to work on CAN hardware emulation on QEMU.
 
-Examples how to use CAN emulation for SJA1000 based borads
+Examples how to use CAN emulation for SJA1000 based boards
 ==========================================================
 
 When QEMU with CAN PCI support is compiled then one of the next
@@ -106,8 +106,8 @@ This open-source core provides CAN FD support. CAN FD drames are
 delivered even to the host systems when SocketCAN interface is found
 CAN FD capable.
 
-The PCIe borad emulation is provided for now (the device identifier is
-ctucan_pci). The defauld build defines two CTU CAN FD cores
+The PCIe board emulation is provided for now (the device identifier is
+ctucan_pci). The default build defines two CTU CAN FD cores
 on the board.
 
 Example how to connect the canbus0-bus (virtual wire) to the host
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 6d4025ba6a..d6085f7045 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -530,7 +530,7 @@ descriptor table (split virtqueue) or descriptor ring (packed
 virtqueue). However, it can't work when we process descriptors
 out-of-order because some entries which store the information of
 inflight descriptors in available ring (split virtqueue) or descriptor
-ring (packed virtqueue) might be overrided by new entries. To solve
+ring (packed virtqueue) might be overridden by new entries. To solve
 this problem, slave need to allocate an extra buffer to store this
 information of inflight descriptors and share it with master for
 persistent. ``VHOST_USER_GET_INFLIGHT_FD`` and
diff --git a/docs/replay.txt b/docs/replay.txt
index 87a64ae068..5b008ca491 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -328,7 +328,7 @@ between the snapshots. Each of the passes include the following steps:
  1. loading the snapshot
  2. replaying to examine the breakpoints
  3. if breakpoint or watchpoint was met
-    - loading the snaphot again
+    - loading the snapshot again
     - replaying to the required breakpoint
  4. else
     - proceeding to the p.1 with the earlier snapshot
diff --git a/docs/specs/ppc-spapr-numa.rst b/docs/specs/ppc-spapr-numa.rst
index 5fca2bdd8e..ffa687dc89 100644
--- a/docs/specs/ppc-spapr-numa.rst
+++ b/docs/specs/ppc-spapr-numa.rst
@@ -198,7 +198,7 @@ This is how it is being done:
 * user distance 121 and beyond will be interpreted as 160
 * user distance 10 stays 10
 
-The reasoning behind this aproximation is to avoid any round up to the local
+The reasoning behind this approximation is to avoid any round up to the local
 distance (10), keeping it exclusive to the 4th NUMA level (which is still
 exclusive to the node_id). All other ranges were chosen under the developer
 discretion of what would be (somewhat) sensible considering the user input.
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bbaae0d97c..d98464098f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -473,7 +473,7 @@ default configuration.
 
 The CPU model runnability guarantee won't apply anymore to
 existing CPU models.  Management software that needs runnability
-guarantees must resolve the CPU model aliases using te
+guarantees must resolve the CPU model aliases using the
 ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
 command.
 
@@ -660,7 +660,7 @@ Splitting RAM by default between NUMA nodes had the same issues as ``mem``
 parameter with the difference that the role of the user plays QEMU using
 implicit generic or board specific splitting rule.
 Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
-it's supported by used machine type) to define mapping explictly instead.
+it's supported by used machine type) to define mapping explicitly instead.
 Users of existing VMs, wishing to preserve the same RAM distribution, should
 configure it explicitly using ``-numa node,memdev`` options. Current RAM
 distribution can be retrieved using HMP command ``info numa`` and if separate
diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 34a9e40146..866b7db3ee 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -174,7 +174,7 @@ Using ':' as the separator a rule is of the form:
 - 'bad' - If a client tries to use a name matching 'key' it's
   denied using EPERM; when the server passes an attribute
   name matching 'prepend' it's hidden.  In many ways it's use is very like
-  'ok' as either an explict terminator or for special handling of certain
+  'ok' as either an explicit terminator or for special handling of certain
   patterns.
 
 **key** is a string tested as a prefix on an attribute name originating
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 64e332746b..470205f487 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -535,7 +535,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     }
 
     /*
-     * Assume we have no GMS memory, but allow it to be overrided by device
+     * Assume we have no GMS memory, but allow it to be overridden by device
      * option (experimental).  The spec doesn't actually allow zero GMS when
      * when IVD (IGD VGA Disable) is clear, but the claim is that it's unused,
      * so let's not waste VM memory for it.
-- 
2.28.0




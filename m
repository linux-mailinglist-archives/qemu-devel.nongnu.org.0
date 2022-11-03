Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681A618414
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcvy-000233-Jw; Thu, 03 Nov 2022 12:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuN-0000fV-3g; Thu, 03 Nov 2022 12:17:35 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuL-00084W-8i; Thu, 03 Nov 2022 12:17:34 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6bsM-1p6LkF018A-0180oq; Thu, 03
 Nov 2022 17:17:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Han Han <hhan@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/10] qapi: virtio: Fix the introduced version
Date: Thu,  3 Nov 2022 17:17:18 +0100
Message-Id: <20221103161727.4116147-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JolXwqhIzXl6TgmlE66LPT08izVsetaqDmpUeYyQEmsCdw7SBtL
 UjYUQ6Mi9JtfdvBgiQq3QZL4Ov/Ncube25HGW7ugNLRn7MRTHYxBhANzDlaIU13/hEQtzpx
 Kbxdbhzlfvyfu59FTy4P+E8wKHEynQrJ0lLxGYpXTfxnuaXMi+X40sY+2ACdYzYjZArsqif
 jD5aDKwUNG1AYsw+QvxSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KofxmvFRXp4=:0L//+OUboVv2e7c3iX1M2B
 rK0jRYRkvF106VNOydRUXEi8YD/CFgoqWfdq7C4/pJ0J8kYvGHmGNm0EED4DJfOCbogbE5x5Q
 2tNPklPU8Pq53GmJZO0NYVtkI01dMIf7psB07VHUAI+ozHg3bH8Wrppcvw8Lu4JwMjSGj8k63
 3RihME8vYwk4l3jdIlSxnKC3HGr5jEstMU1yrfTwi3BRokbJXgV+AjZdNOxyEbYnFtFO3bgMA
 gKWLJq825NoCEzao7UwuMHZV+94qIko8D1LxE0Yd9Dpd084sfbiAUBdGnzFp1AJOHDWQrFA/2
 EQeVbfpIOQGi6eC45o/a7MXqfZD7jXefguy9oj5AAbygU/aOitvzErAraSWUer7ubyQbtZEoQ
 j04Pys5qd4dNwAxEBAi3X5z5J1gRJRvAHRl4tqfG1E/0I+ccGik4A8TL3kvO20oZDD0Yu5enk
 jTW+JNcspHlmhAdpayRDSx6VMpzH47pmgaCSFancPkZJxQt1/WBUyh0zBAM8+/Nm/JidMEY6g
 ebJAoAdVgp+SdHKN6Nu5bRyFXoUtjUwuE9I7DV4ztnMEARaBwgusUXWJeo3zyI7KSQFlve7VZ
 b590+oXgsoUF+j41HZo4H5SiCZ0U1KKALGQiHPVhRa3ZFjEdkI/PTVI45T6VaLjKti7Ws4Ulr
 ztfs/c8JlUyHDZtDd0w9bU4mUdEADotTpCo08QcL+qdsRIU8lwMh+uMb8VlVeVxCOsVVTIwTJ
 msSHXjMBKql2JZ/AXJ/bWrNlvaU2liocEJbM2QE/U7lx8s3uyBvk+hJHhpD8yk8eHZcr/+ZQi
 oJUMf+2
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Han Han <hhan@redhat.com>

The items of qapi/virtio.json are introduced at a5ebce38576. They will be
in the version 7.2 not 7.1.

Signed-off-by: Han Han <hhan@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221101014647.3000801-1-hhan@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qapi/virtio.json | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index e47a8fb2e0a9..872c7e36236c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -15,7 +15,7 @@
 #
 # @name: Name of the VirtIODevice
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 { 'struct': 'VirtioInfo',
@@ -32,7 +32,7 @@
 #
 # Returns: List of gathered VirtIODevices
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Example:
 #
@@ -97,7 +97,7 @@
 #
 # @log-size: vhost_dev log_size
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -167,7 +167,7 @@
 #             Present if the given VirtIODevice has an active vhost
 #             device.
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -206,7 +206,7 @@
 #
 # Returns: VirtioStatus of the virtio device
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -452,7 +452,7 @@
 #
 # @unknown-statuses: Virtio device statuses bitmap that have not been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VirtioDeviceStatus',
@@ -471,7 +471,7 @@
 # @unknown-protocols: Vhost user device protocol features bitmap that
 #                     have not been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VhostDeviceProtocols',
@@ -492,7 +492,7 @@
 # @unknown-dev-features: Virtio device features bitmap that have not
 #                        been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VirtioDeviceFeatures',
@@ -535,7 +535,7 @@
 #
 # @signalled-used-valid: VirtQueue signalled_used_valid flag
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -576,7 +576,7 @@
 #        shadow_avail_idx will not be displayed in the case where
 #        the selected VirtIODevice has a running vhost device.
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -666,7 +666,7 @@
 #
 # @used-size: vhost_virtqueue used_size
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -699,7 +699,7 @@
 #
 # Returns: VirtVhostQueueStatus of the vhost_virtqueue
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -767,7 +767,7 @@
 #
 # @flags: List of descriptor flags
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -787,7 +787,7 @@
 #
 # @ring: VRingAvail ring[] entry at provided index
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -805,7 +805,7 @@
 #
 # @idx: VRingUsed index
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -829,7 +829,7 @@
 #
 # @used: VRingUsed info
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -857,7 +857,7 @@
 #
 # Returns: VirtioQueueElement information
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
-- 
2.37.3



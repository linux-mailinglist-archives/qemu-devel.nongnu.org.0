Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A761DDE8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDb-0008Cv-G6; Sat, 05 Nov 2022 15:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0008Bi-K0; Sat, 05 Nov 2022 15:52:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDX-0003a2-4Q; Sat, 05 Nov 2022 15:52:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MZCKd-1oVhSG371l-00V64U; Sat, 05
 Nov 2022 20:52:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Han Han <hhan@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/7] qapi: virtio: Fix the introduced version
Date: Sat,  5 Nov 2022 20:52:21 +0100
Message-Id: <20221105195227.354769-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GqfFrXNjcQTzegjZbwXCZ4PBVMAjIpDh8xID31h0V05cZGwkafX
 NjplMS3h/cBOlJE6YatAlE+fuo6CwvS6A32l65nbgnIYW2pbex7/XSsTf1DDG43y0uBOVto
 dCIXDEUgKrm1Nv2WSH7ig1WnyxSldmCI2R5piui4lsVz5Z7OXnCOLQ5+cPaqC88mOLbBKE3
 KhtK5U5GSV02w/HtjbmXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wN4IuNOOg/Q=:vAJZ0FgSa/SRJB23LFjf2p
 R2fd18Y+v2Cyz5u2lbuTZkHYFQ5f+x8FFnfosnc4IsBncVtJ+kbQ5U/lGlG64vXmVzrnxDue9
 MWCyQbykkE3QGNYrwXm9zMq8KuMpV89uTUyT0bCzDu+N79ltMj23lAQZG/DFAjhP4r+zv0FHP
 vvtGZOlPi87q14q257fTdZEFGm0nFBOzQO2v4NFT/PXsZDlR16+md64Q/wvmSz96PrAW3+nU8
 79RVi9pFie8O+zvAMHg+8emy0teY/HZjcx6IUN2JjRn3uUZo2IjRgvnYUEEzJcznTk2UBxx4L
 BYt7oAShQy5kmyGuP/Z4+Jvp926nvmafTn6Cz4SCkc3y2OGYlR29GQjkmTQ8AFm3Jt1obyff/
 lctP61TvVsc9uzysYlbu7tEUGqJ0y302xHrRj8zXcYqNW1JZ86E2OmfU1eNNSYWTmMtzKGwaM
 fdC1nSuQCsV68+3lvYAJ3v6o6fKG6sbvCSGkmeMuWa8Hwcr88mdp4VW+SFgKwhhichbNGU9sa
 SfVDqDWK3BsAlY9xQwO2/bHxKc4yzGIus6N4elLGbLAUKz7gbBFHA7Htt8am9FAKkOv39jWM+
 sXwgnhMzyQoCbVs6Hb48QAhPEuVhnK8kIpENbtqcT1V1RruEu4yxrvG+u2TQ1jP5SEUK5tFK6
 pYO7+qQOPGN9uvO7YOaFt7m/HdHLghXyyl41/gJV2IB7LbD0pJKyd5BUksmbQCqbjo0r7MW8F
 AKNyIjeJR/NqzF6lqWODIX/leQMg9uimWbf0l1LZgsVSqNr5iBPV5R3ZvFmfO2S61Q2vQ02Wo
 QzuaQlw
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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



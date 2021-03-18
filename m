Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC333FD96
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:12:36 +0100 (CET)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMj5P-00063F-Gc
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3f-0004Hg-To
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:54698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3d-0005re-Pk
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:47 -0400
IronPort-SDR: wC7nD/3PcYLUne/93nlvDyGPU0IsUxT8+5HC6Ox0vajR1iYc/kOYbK/fWkeesWNAn/MpK1ton2
 hUVcaZSmNqeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189681333"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189681333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:39 -0700
IronPort-SDR: ata36DlWdHpFnPaX5n7HZG6RejG2k3i2JQswaxoTtQHyN0uHgbcUSOGzJ/Slwz3Kib+hxH/Nm8
 gleUFsLc5IAg==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412898197"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:37 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V3 1/7] qapi/net.json: Add IP_PROTOCOL definition
Date: Thu, 18 Mar 2021 11:04:54 +0800
Message-Id: <20210318030500.55352-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318030500.55352-1-chen.zhang@intel.com>
References: <20210318030500.55352-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add IP_PROTOCOL as enum include TCP,UDP, ICMP... for other QMP commands.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 qapi/net.json | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..dc4c87dc7b 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -714,3 +714,33 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @IP_PROTOCOL:
+#
+# Transport layer protocol.
+#
+# Just for IPv4.
+#
+# @tcp: Transmission Control Protocol.
+#
+# @udp: User Datagram Protocol.
+#
+# @dccp: Datagram Congestion Control Protocol.
+#
+# @sctp: Stream Control Transmission Protocol.
+#
+# @udplite: Lightweight User Datagram Protocol.
+#
+# @icmp: Internet Control Message Protocol.
+#
+# @igmp: Internet Group Management Protocol.
+#
+# @ipv6: IPv6 Encapsulation.
+#
+# TODO: Need to add more transport layer protocol.
+#
+# Since: 6.0
+##
+{ 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
+    'icmp', 'igmp', 'ipv6' ] }
-- 
2.25.1



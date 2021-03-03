Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C974B32B3E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:23:48 +0100 (CET)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ35-000704-Bs
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0X-0005At-0y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:09 -0500
Received: from mga18.intel.com ([134.134.136.126]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0U-0005Ag-Ed
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:08 -0500
IronPort-SDR: NHWSuU/HIsgfkPCc17ThNtnt8OzjTwrnX9zrVMtGXHyHxIYjUjfDjsrsisayDMcohNFk2WZ1d9
 quVvYlk6dwSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732194"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:02 -0800
IronPort-SDR: DY0bhDegMVy0R5bPkI8ms8v0xQHFbdxZG/56n9RwjC0qF3tQxVjxqLrHztp7vmAY3Ajpc4CIdI
 OcerndVptdAA==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407059965"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:20:59 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 1/7] qapi/net.json: Add IP_PROTOCOL definition
Date: Wed,  3 Mar 2021 12:15:33 +0800
Message-Id: <20210303041539.1032415-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Zhang Chen <chen.zhang@intel.com>

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



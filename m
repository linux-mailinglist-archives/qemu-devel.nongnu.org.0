Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C91FA962
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:02:22 +0200 (CEST)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5bx-0008N5-7J
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mi-0001qh-Nj
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44993
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mg-0005kI-6O
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592289993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=/kEiaq0IrQZNKeI0/BswEAzv4Zf9MTTd1ITASsYEk9Q=;
 b=dXlYzbjydyYDt9SWAluXVQJt5UStLKvZ52h58Ivh+0KQ0aMNwBnnfCgpxwAuZPVgrXRcpx
 J3vV0ld82pb9NDo69wzTdU18/r0XaNovCmFcawcM+OHlKFgezLexWJf+P/2jKCqSmCOmGM
 088pipzE6VWJAzx2StrjlaYSj4VNhj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-SuiwDCYgOnuQtSWeHfNnHw-1; Tue, 16 Jun 2020 02:46:31 -0400
X-MC-Unique: SuiwDCYgOnuQtSWeHfNnHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3084A18585A1;
 Tue, 16 Jun 2020 06:46:30 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BEBC8202D;
 Tue, 16 Jun 2020 06:46:28 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 17/33] net: cadence_gem: Fix up code style
Date: Tue, 16 Jun 2020 14:45:28 +0800
Message-Id: <1592289944-13727-18-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fix the code style for register definitions.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/cadence_gem.c | 204 ++++++++++++++++++++++++++-------------------------
 1 file changed, 103 insertions(+), 101 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 247a52f..22d0d16 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -43,110 +43,112 @@
     } \
 } while (0)
 
-#define GEM_NWCTRL        (0x00000000/4) /* Network Control reg */
-#define GEM_NWCFG         (0x00000004/4) /* Network Config reg */
-#define GEM_NWSTATUS      (0x00000008/4) /* Network Status reg */
-#define GEM_USERIO        (0x0000000C/4) /* User IO reg */
-#define GEM_DMACFG        (0x00000010/4) /* DMA Control reg */
-#define GEM_TXSTATUS      (0x00000014/4) /* TX Status reg */
-#define GEM_RXQBASE       (0x00000018/4) /* RX Q Base address reg */
-#define GEM_TXQBASE       (0x0000001C/4) /* TX Q Base address reg */
-#define GEM_RXSTATUS      (0x00000020/4) /* RX Status reg */
-#define GEM_ISR           (0x00000024/4) /* Interrupt Status reg */
-#define GEM_IER           (0x00000028/4) /* Interrupt Enable reg */
-#define GEM_IDR           (0x0000002C/4) /* Interrupt Disable reg */
-#define GEM_IMR           (0x00000030/4) /* Interrupt Mask reg */
-#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintenance reg */
-#define GEM_RXPAUSE       (0x00000038/4) /* RX Pause Time reg */
-#define GEM_TXPAUSE       (0x0000003C/4) /* TX Pause Time reg */
-#define GEM_TXPARTIALSF   (0x00000040/4) /* TX Partial Store and Forward */
-#define GEM_RXPARTIALSF   (0x00000044/4) /* RX Partial Store and Forward */
-#define GEM_HASHLO        (0x00000080/4) /* Hash Low address reg */
-#define GEM_HASHHI        (0x00000084/4) /* Hash High address reg */
-#define GEM_SPADDR1LO     (0x00000088/4) /* Specific addr 1 low reg */
-#define GEM_SPADDR1HI     (0x0000008C/4) /* Specific addr 1 high reg */
-#define GEM_SPADDR2LO     (0x00000090/4) /* Specific addr 2 low reg */
-#define GEM_SPADDR2HI     (0x00000094/4) /* Specific addr 2 high reg */
-#define GEM_SPADDR3LO     (0x00000098/4) /* Specific addr 3 low reg */
-#define GEM_SPADDR3HI     (0x0000009C/4) /* Specific addr 3 high reg */
-#define GEM_SPADDR4LO     (0x000000A0/4) /* Specific addr 4 low reg */
-#define GEM_SPADDR4HI     (0x000000A4/4) /* Specific addr 4 high reg */
-#define GEM_TIDMATCH1     (0x000000A8/4) /* Type ID1 Match reg */
-#define GEM_TIDMATCH2     (0x000000AC/4) /* Type ID2 Match reg */
-#define GEM_TIDMATCH3     (0x000000B0/4) /* Type ID3 Match reg */
-#define GEM_TIDMATCH4     (0x000000B4/4) /* Type ID4 Match reg */
-#define GEM_WOLAN         (0x000000B8/4) /* Wake on LAN reg */
-#define GEM_IPGSTRETCH    (0x000000BC/4) /* IPG Stretch reg */
-#define GEM_SVLAN         (0x000000C0/4) /* Stacked VLAN reg */
-#define GEM_MODID         (0x000000FC/4) /* Module ID reg */
-#define GEM_OCTTXLO       (0x00000100/4) /* Octects transmitted Low reg */
-#define GEM_OCTTXHI       (0x00000104/4) /* Octects transmitted High reg */
-#define GEM_TXCNT         (0x00000108/4) /* Error-free Frames transmitted */
-#define GEM_TXBCNT        (0x0000010C/4) /* Error-free Broadcast Frames */
-#define GEM_TXMCNT        (0x00000110/4) /* Error-free Multicast Frame */
-#define GEM_TXPAUSECNT    (0x00000114/4) /* Pause Frames Transmitted */
-#define GEM_TX64CNT       (0x00000118/4) /* Error-free 64 TX */
-#define GEM_TX65CNT       (0x0000011C/4) /* Error-free 65-127 TX */
-#define GEM_TX128CNT      (0x00000120/4) /* Error-free 128-255 TX */
-#define GEM_TX256CNT      (0x00000124/4) /* Error-free 256-511 */
-#define GEM_TX512CNT      (0x00000128/4) /* Error-free 512-1023 TX */
-#define GEM_TX1024CNT     (0x0000012C/4) /* Error-free 1024-1518 TX */
-#define GEM_TX1519CNT     (0x00000130/4) /* Error-free larger than 1519 TX */
-#define GEM_TXURUNCNT     (0x00000134/4) /* TX under run error counter */
-#define GEM_SINGLECOLLCNT (0x00000138/4) /* Single Collision Frames */
-#define GEM_MULTCOLLCNT   (0x0000013C/4) /* Multiple Collision Frames */
-#define GEM_EXCESSCOLLCNT (0x00000140/4) /* Excessive Collision Frames */
-#define GEM_LATECOLLCNT   (0x00000144/4) /* Late Collision Frames */
-#define GEM_DEFERTXCNT    (0x00000148/4) /* Deferred Transmission Frames */
-#define GEM_CSENSECNT     (0x0000014C/4) /* Carrier Sense Error Counter */
-#define GEM_OCTRXLO       (0x00000150/4) /* Octects Received register Low */
-#define GEM_OCTRXHI       (0x00000154/4) /* Octects Received register High */
-#define GEM_RXCNT         (0x00000158/4) /* Error-free Frames Received */
-#define GEM_RXBROADCNT    (0x0000015C/4) /* Error-free Broadcast Frames RX */
-#define GEM_RXMULTICNT    (0x00000160/4) /* Error-free Multicast Frames RX */
-#define GEM_RXPAUSECNT    (0x00000164/4) /* Pause Frames Received Counter */
-#define GEM_RX64CNT       (0x00000168/4) /* Error-free 64 byte Frames RX */
-#define GEM_RX65CNT       (0x0000016C/4) /* Error-free 65-127B Frames RX */
-#define GEM_RX128CNT      (0x00000170/4) /* Error-free 128-255B Frames RX */
-#define GEM_RX256CNT      (0x00000174/4) /* Error-free 256-512B Frames RX */
-#define GEM_RX512CNT      (0x00000178/4) /* Error-free 512-1023B Frames RX */
-#define GEM_RX1024CNT     (0x0000017C/4) /* Error-free 1024-1518B Frames RX */
-#define GEM_RX1519CNT     (0x00000180/4) /* Error-free 1519-max Frames RX */
-#define GEM_RXUNDERCNT    (0x00000184/4) /* Undersize Frames Received */
-#define GEM_RXOVERCNT     (0x00000188/4) /* Oversize Frames Received */
-#define GEM_RXJABCNT      (0x0000018C/4) /* Jabbers Received Counter */
-#define GEM_RXFCSCNT      (0x00000190/4) /* Frame Check seq. Error Counter */
-#define GEM_RXLENERRCNT   (0x00000194/4) /* Length Field Error Counter */
-#define GEM_RXSYMERRCNT   (0x00000198/4) /* Symbol Error Counter */
-#define GEM_RXALIGNERRCNT (0x0000019C/4) /* Alignment Error Counter */
-#define GEM_RXRSCERRCNT   (0x000001A0/4) /* Receive Resource Error Counter */
-#define GEM_RXORUNCNT     (0x000001A4/4) /* Receive Overrun Counter */
-#define GEM_RXIPCSERRCNT  (0x000001A8/4) /* IP header Checksum Error Counter */
-#define GEM_RXTCPCCNT     (0x000001AC/4) /* TCP Checksum Error Counter */
-#define GEM_RXUDPCCNT     (0x000001B0/4) /* UDP Checksum Error Counter */
-
-#define GEM_1588S         (0x000001D0/4) /* 1588 Timer Seconds */
-#define GEM_1588NS        (0x000001D4/4) /* 1588 Timer Nanoseconds */
-#define GEM_1588ADJ       (0x000001D8/4) /* 1588 Timer Adjust */
-#define GEM_1588INC       (0x000001DC/4) /* 1588 Timer Increment */
-#define GEM_PTPETXS       (0x000001E0/4) /* PTP Event Frame Transmitted (s) */
-#define GEM_PTPETXNS      (0x000001E4/4) /* PTP Event Frame Transmitted (ns) */
-#define GEM_PTPERXS       (0x000001E8/4) /* PTP Event Frame Received (s) */
-#define GEM_PTPERXNS      (0x000001EC/4) /* PTP Event Frame Received (ns) */
-#define GEM_PTPPTXS       (0x000001E0/4) /* PTP Peer Frame Transmitted (s) */
-#define GEM_PTPPTXNS      (0x000001E4/4) /* PTP Peer Frame Transmitted (ns) */
-#define GEM_PTPPRXS       (0x000001E8/4) /* PTP Peer Frame Received (s) */
-#define GEM_PTPPRXNS      (0x000001EC/4) /* PTP Peer Frame Received (ns) */
+#define GEM_NWCTRL        (0x00000000 / 4) /* Network Control reg */
+#define GEM_NWCFG         (0x00000004 / 4) /* Network Config reg */
+#define GEM_NWSTATUS      (0x00000008 / 4) /* Network Status reg */
+#define GEM_USERIO        (0x0000000C / 4) /* User IO reg */
+#define GEM_DMACFG        (0x00000010 / 4) /* DMA Control reg */
+#define GEM_TXSTATUS      (0x00000014 / 4) /* TX Status reg */
+#define GEM_RXQBASE       (0x00000018 / 4) /* RX Q Base address reg */
+#define GEM_TXQBASE       (0x0000001C / 4) /* TX Q Base address reg */
+#define GEM_RXSTATUS      (0x00000020 / 4) /* RX Status reg */
+#define GEM_ISR           (0x00000024 / 4) /* Interrupt Status reg */
+#define GEM_IER           (0x00000028 / 4) /* Interrupt Enable reg */
+#define GEM_IDR           (0x0000002C / 4) /* Interrupt Disable reg */
+#define GEM_IMR           (0x00000030 / 4) /* Interrupt Mask reg */
+#define GEM_PHYMNTNC      (0x00000034 / 4) /* Phy Maintenance reg */
+#define GEM_RXPAUSE       (0x00000038 / 4) /* RX Pause Time reg */
+#define GEM_TXPAUSE       (0x0000003C / 4) /* TX Pause Time reg */
+#define GEM_TXPARTIALSF   (0x00000040 / 4) /* TX Partial Store and Forward */
+#define GEM_RXPARTIALSF   (0x00000044 / 4) /* RX Partial Store and Forward */
+#define GEM_HASHLO        (0x00000080 / 4) /* Hash Low address reg */
+#define GEM_HASHHI        (0x00000084 / 4) /* Hash High address reg */
+#define GEM_SPADDR1LO     (0x00000088 / 4) /* Specific addr 1 low reg */
+#define GEM_SPADDR1HI     (0x0000008C / 4) /* Specific addr 1 high reg */
+#define GEM_SPADDR2LO     (0x00000090 / 4) /* Specific addr 2 low reg */
+#define GEM_SPADDR2HI     (0x00000094 / 4) /* Specific addr 2 high reg */
+#define GEM_SPADDR3LO     (0x00000098 / 4) /* Specific addr 3 low reg */
+#define GEM_SPADDR3HI     (0x0000009C / 4) /* Specific addr 3 high reg */
+#define GEM_SPADDR4LO     (0x000000A0 / 4) /* Specific addr 4 low reg */
+#define GEM_SPADDR4HI     (0x000000A4 / 4) /* Specific addr 4 high reg */
+#define GEM_TIDMATCH1     (0x000000A8 / 4) /* Type ID1 Match reg */
+#define GEM_TIDMATCH2     (0x000000AC / 4) /* Type ID2 Match reg */
+#define GEM_TIDMATCH3     (0x000000B0 / 4) /* Type ID3 Match reg */
+#define GEM_TIDMATCH4     (0x000000B4 / 4) /* Type ID4 Match reg */
+#define GEM_WOLAN         (0x000000B8 / 4) /* Wake on LAN reg */
+#define GEM_IPGSTRETCH    (0x000000BC / 4) /* IPG Stretch reg */
+#define GEM_SVLAN         (0x000000C0 / 4) /* Stacked VLAN reg */
+#define GEM_MODID         (0x000000FC / 4) /* Module ID reg */
+#define GEM_OCTTXLO       (0x00000100 / 4) /* Octects transmitted Low reg */
+#define GEM_OCTTXHI       (0x00000104 / 4) /* Octects transmitted High reg */
+#define GEM_TXCNT         (0x00000108 / 4) /* Error-free Frames transmitted */
+#define GEM_TXBCNT        (0x0000010C / 4) /* Error-free Broadcast Frames */
+#define GEM_TXMCNT        (0x00000110 / 4) /* Error-free Multicast Frame */
+#define GEM_TXPAUSECNT    (0x00000114 / 4) /* Pause Frames Transmitted */
+#define GEM_TX64CNT       (0x00000118 / 4) /* Error-free 64 TX */
+#define GEM_TX65CNT       (0x0000011C / 4) /* Error-free 65-127 TX */
+#define GEM_TX128CNT      (0x00000120 / 4) /* Error-free 128-255 TX */
+#define GEM_TX256CNT      (0x00000124 / 4) /* Error-free 256-511 */
+#define GEM_TX512CNT      (0x00000128 / 4) /* Error-free 512-1023 TX */
+#define GEM_TX1024CNT     (0x0000012C / 4) /* Error-free 1024-1518 TX */
+#define GEM_TX1519CNT     (0x00000130 / 4) /* Error-free larger than 1519 TX */
+#define GEM_TXURUNCNT     (0x00000134 / 4) /* TX under run error counter */
+#define GEM_SINGLECOLLCNT (0x00000138 / 4) /* Single Collision Frames */
+#define GEM_MULTCOLLCNT   (0x0000013C / 4) /* Multiple Collision Frames */
+#define GEM_EXCESSCOLLCNT (0x00000140 / 4) /* Excessive Collision Frames */
+#define GEM_LATECOLLCNT   (0x00000144 / 4) /* Late Collision Frames */
+#define GEM_DEFERTXCNT    (0x00000148 / 4) /* Deferred Transmission Frames */
+#define GEM_CSENSECNT     (0x0000014C / 4) /* Carrier Sense Error Counter */
+#define GEM_OCTRXLO       (0x00000150 / 4) /* Octects Received register Low */
+#define GEM_OCTRXHI       (0x00000154 / 4) /* Octects Received register High */
+#define GEM_RXCNT         (0x00000158 / 4) /* Error-free Frames Received */
+#define GEM_RXBROADCNT    (0x0000015C / 4) /* Error-free Broadcast Frames RX */
+#define GEM_RXMULTICNT    (0x00000160 / 4) /* Error-free Multicast Frames RX */
+#define GEM_RXPAUSECNT    (0x00000164 / 4) /* Pause Frames Received Counter */
+#define GEM_RX64CNT       (0x00000168 / 4) /* Error-free 64 byte Frames RX */
+#define GEM_RX65CNT       (0x0000016C / 4) /* Error-free 65-127B Frames RX */
+#define GEM_RX128CNT      (0x00000170 / 4) /* Error-free 128-255B Frames RX */
+#define GEM_RX256CNT      (0x00000174 / 4) /* Error-free 256-512B Frames RX */
+#define GEM_RX512CNT      (0x00000178 / 4) /* Error-free 512-1023B Frames RX */
+#define GEM_RX1024CNT     (0x0000017C / 4) /* Error-free 1024-1518B Frames RX */
+#define GEM_RX1519CNT     (0x00000180 / 4) /* Error-free 1519-max Frames RX */
+#define GEM_RXUNDERCNT    (0x00000184 / 4) /* Undersize Frames Received */
+#define GEM_RXOVERCNT     (0x00000188 / 4) /* Oversize Frames Received */
+#define GEM_RXJABCNT      (0x0000018C / 4) /* Jabbers Received Counter */
+#define GEM_RXFCSCNT      (0x00000190 / 4) /* Frame Check seq. Error Counter */
+#define GEM_RXLENERRCNT   (0x00000194 / 4) /* Length Field Error Counter */
+#define GEM_RXSYMERRCNT   (0x00000198 / 4) /* Symbol Error Counter */
+#define GEM_RXALIGNERRCNT (0x0000019C / 4) /* Alignment Error Counter */
+#define GEM_RXRSCERRCNT   (0x000001A0 / 4) /* Receive Resource Error Counter */
+#define GEM_RXORUNCNT     (0x000001A4 / 4) /* Receive Overrun Counter */
+#define GEM_RXIPCSERRCNT  (0x000001A8 / 4) /* IP header Checksum Err Counter */
+#define GEM_RXTCPCCNT     (0x000001AC / 4) /* TCP Checksum Error Counter */
+#define GEM_RXUDPCCNT     (0x000001B0 / 4) /* UDP Checksum Error Counter */
+
+#define GEM_1588S         (0x000001D0 / 4) /* 1588 Timer Seconds */
+#define GEM_1588NS        (0x000001D4 / 4) /* 1588 Timer Nanoseconds */
+#define GEM_1588ADJ       (0x000001D8 / 4) /* 1588 Timer Adjust */
+#define GEM_1588INC       (0x000001DC / 4) /* 1588 Timer Increment */
+#define GEM_PTPETXS       (0x000001E0 / 4) /* PTP Event Frame Transmitted (s) */
+#define GEM_PTPETXNS      (0x000001E4 / 4) /*
+                                            * PTP Event Frame Transmitted (ns)
+                                            */
+#define GEM_PTPERXS       (0x000001E8 / 4) /* PTP Event Frame Received (s) */
+#define GEM_PTPERXNS      (0x000001EC / 4) /* PTP Event Frame Received (ns) */
+#define GEM_PTPPTXS       (0x000001E0 / 4) /* PTP Peer Frame Transmitted (s) */
+#define GEM_PTPPTXNS      (0x000001E4 / 4) /* PTP Peer Frame Transmitted (ns) */
+#define GEM_PTPPRXS       (0x000001E8 / 4) /* PTP Peer Frame Received (s) */
+#define GEM_PTPPRXNS      (0x000001EC / 4) /* PTP Peer Frame Received (ns) */
 
 /* Design Configuration Registers */
-#define GEM_DESCONF       (0x00000280/4)
-#define GEM_DESCONF2      (0x00000284/4)
-#define GEM_DESCONF3      (0x00000288/4)
-#define GEM_DESCONF4      (0x0000028C/4)
-#define GEM_DESCONF5      (0x00000290/4)
-#define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF       (0x00000280 / 4)
+#define GEM_DESCONF2      (0x00000284 / 4)
+#define GEM_DESCONF3      (0x00000288 / 4)
+#define GEM_DESCONF4      (0x0000028C / 4)
+#define GEM_DESCONF5      (0x00000290 / 4)
+#define GEM_DESCONF6      (0x00000294 / 4)
 #define GEM_DESCONF6_64B_MASK (1U << 23)
-#define GEM_DESCONF7      (0x00000298/4)
+#define GEM_DESCONF7      (0x00000298 / 4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
 #define GEM_INT_Q1_MASK                 (0x00000640 / 4)
-- 
2.5.0



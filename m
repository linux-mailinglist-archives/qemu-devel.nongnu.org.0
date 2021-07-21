Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD803D1136
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6D7d-00045s-NU
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sohu0106@126.com>) id 1m6D6M-0002KC-PD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:21:34 -0400
Received: from mail-m965.mail.126.com ([123.126.96.5]:56664)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sohu0106@126.com>) id 1m6D6H-0001Ul-5v
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yU65v
 YM6APh1WOgCheDlA38u0WaYBeEWQdLYIVqzc48=; b=FZc69zuFHxzj3LlZ6+r3y
 YUAmDUX/cHM0h9AVEReH/vhD1RtgzBPXDEZlAwEBGpyizFVpWjAUT47ZgeuR7W+h
 XZVDMOZWsKRhJ6weYPDNbKKshbMlGlwGeit1a/q91jrQUHl8SIvsb1g0tL++MJ9K
 R+HsmOH++obj7ERHK5z7iw=
Received: from localhost.localdomain (unknown [153.3.131.59])
 by smtp10 (Coremail) with SMTP id NuRpCgD3o7chJvhgEpzbrQ--.17475S2;
 Wed, 21 Jul 2021 21:50:27 +0800 (CST)
From: NAME <sohu0106@126.com>
To: jiri@resnulli.us,
	jasowang@redhat.com
Subject: [RFC] Fix rocker device null pointer crash. qemu config r->fp_ports
 with "-device rocker,
 len-ports=10" when guest config port larget then r->fp_ports(10)
 r->fp_port[port] is null-pointer,
 qemu will crash null-pointer Reported-by: chenzhe <chenzhe@huawei.com>
Date: Wed, 21 Jul 2021 19:39:12 +0800
Message-Id: <20210721113912.14483-1-sohu0106@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgD3o7chJvhgEpzbrQ--.17475S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry7Aw4ktFykCFWUZry7Jrb_yoW5CF4fpa
 nYqry2qrZ2kasYqr4jqF1YqFWDJ3WIyFW8Gw40yr1akrZrKFW3Zr10kwn0vFy5Wr9xAFy2
 ga13GF4DZ390vFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNBM_UUUUU=
X-Originating-IP: [153.3.131.59]
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/1tbi3APWHlpEBnwboQAAsJ
Received-SPF: pass client-ip=123.126.96.5; envelope-from=sohu0106@126.com;
 helo=mail-m965.mail.126.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: sohu0106 <sohu0106@126.com>

Signed-off-by: sohu0106 <sohu0106@126.com>
---
 hw/net/rocker/rocker.c    | 10 +++++-----
 hw/net/rocker/rocker_fp.c |  5 +++--
 hw/net/rocker/rocker_fp.h |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 31f2340fb9..431af3982f 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -174,7 +174,7 @@ static int tx_consume(Rocker *r, DescInfo *info)
     }
 
     pport = rocker_get_pport_by_tx_ring(r, desc_get_ring(info));
-    if (!fp_port_from_pport(pport, &port)) {
+    if (!fp_port_from_pport(r, pport, &port)) {
         return -ROCKER_EINVAL;
     }
 
@@ -287,7 +287,7 @@ static int cmd_get_port_settings(Rocker *r,
     }
 
     pport = rocker_tlv_get_le32(tlvs[ROCKER_TLV_CMD_PORT_SETTINGS_PPORT]);
-    if (!fp_port_from_pport(pport, &port)) {
+    if (!fp_port_from_pport(r, pport, &port)) {
         return -ROCKER_EINVAL;
     }
     fp_port = r->fp_port[port];
@@ -357,7 +357,7 @@ static int cmd_set_port_settings(Rocker *r,
     }
 
     pport = rocker_tlv_get_le32(tlvs[ROCKER_TLV_CMD_PORT_SETTINGS_PPORT]);
-    if (!fp_port_from_pport(pport, &port)) {
+    if (!fp_port_from_pport(r, pport, &port)) {
         return -ROCKER_EINVAL;
     }
     fp_port = r->fp_port[port];
@@ -538,7 +538,7 @@ int rocker_event_mac_vlan_seen(Rocker *r, uint32_t pport, uint8_t *addr,
     int pos;
     int err;
 
-    if (!fp_port_from_pport(pport, &port)) {
+    if (!fp_port_from_pport(r, pport, &port)) {
         return -ROCKER_EINVAL;
     }
     fp_port = r->fp_port[port];
@@ -690,7 +690,7 @@ int rocker_port_eg(Rocker *r, uint32_t pport,
     FpPort *fp_port;
     uint32_t port;
 
-    if (!fp_port_from_pport(pport, &port)) {
+    if (!fp_port_from_pport(r, pport, &port)) {
         return -ROCKER_EINVAL;
     }
 
diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
index cbeed65bd5..45b5020106 100644
--- a/hw/net/rocker/rocker_fp.c
+++ b/hw/net/rocker/rocker_fp.c
@@ -108,9 +108,10 @@ int fp_port_set_settings(FpPort *port, uint32_t speed,
     return ROCKER_OK;
 }
 
-bool fp_port_from_pport(uint32_t pport, uint32_t *port)
+bool fp_port_from_pport(Rocker *r, uint32_t pport, uint32_t *port)
 {
-    if (pport < 1 || pport > ROCKER_FP_PORTS_MAX) {
+    if (pport < 1 || pport > ROCKER_FP_PORTS_MAX ||
+        pport >= rocker_fp_ports(r)) {
         return false;
     }
     *port = pport - 1;
diff --git a/hw/net/rocker/rocker_fp.h b/hw/net/rocker/rocker_fp.h
index 7ff57aac01..bd1c2588f6 100644
--- a/hw/net/rocker/rocker_fp.h
+++ b/hw/net/rocker/rocker_fp.h
@@ -37,7 +37,7 @@ int fp_port_get_settings(FpPort *port, uint32_t *speed,
                          uint8_t *duplex, uint8_t *autoneg);
 int fp_port_set_settings(FpPort *port, uint32_t speed,
                          uint8_t duplex, uint8_t autoneg);
-bool fp_port_from_pport(uint32_t pport, uint32_t *port);
+bool fp_port_from_pport(Rocker *r, uint32_t pport, uint32_t *port);
 World *fp_port_get_world(FpPort *port);
 void fp_port_set_world(FpPort *port, World *world);
 bool fp_port_check_world(FpPort *port, World *world);
-- 
2.25.1



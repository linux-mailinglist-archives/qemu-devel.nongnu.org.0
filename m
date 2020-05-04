Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640251C38DD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:06:22 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVZrZ-0004FU-BD
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjr-00032t-0j; Mon, 04 May 2020 07:58:23 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjo-000224-TI; Mon, 04 May 2020 07:58:22 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MVubb-1jfr8A0guj-00RoZr; Mon, 04 May 2020 13:58:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] hw/mem/pc-dimm: Fix line over 80 characters warning
Date: Mon,  4 May 2020 13:57:45 +0200
Message-Id: <20200504115758.283914-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
References: <20200504115758.283914-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uoOCv6SWCIzT4rAEh7LAxYnD9eqhHUN9UdFbneX2A8S7JYa3EQt
 nlWJ+zqUlSEhHLroSD3BCNjdwhg5KHsmShG/KornRceMx1B0k/I9k9iAvjZMKV6EZS3abth
 04lCc8AN0n1Aw8h+HTanmiXiEIU7sra5qNS6uNOt7e1zF8sKj7TRGL2l2ct/oIGyBC2k+pB
 w65YW6NRLBz9755Lmfr0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C4xhP5OJBIY=:YID2BNSHBArahqvD0vXEcA
 UecVbj8vK7q4VOn+xj4MJCrGCpCQz9qqF4tG4PZcPkislLyJBL0S2o4njAwNkicEhxuXd2HYs
 KJFIWrsozEnRnMHzZznv4P1Ahcm/SKTRPymbML9pc/C/v6uavfiR8A4gig+rfttLa4asHIzsG
 b74IrlnDC+g4q4WrnrPp1VZiLJuqPS6V1KODWIzWnCDI+DpvrSUBBsgUdUmqBSx9JDDci0e9g
 ogqhleLGrppfxLvcGux3ht2Ff1xO6afR6cYYTEKGIKMFzl8H5yqqFPVZjqNxmHcs6q58UIzpa
 LwVeoQ8q7rHY5QZaxgHYaSqPR+wCcuSdAObNHpt02LNIMH+JFIhTEixcN/2+s6kAT/NF6aHx9
 CjFzSuR+zKoMpfA7wuk5XkDoa+ad5dkx0DJzmdNW9tvars8FtUk3IrAIA4yo819KZr9nwy35G
 1pcvPT5ichydgyuikg8hOpcQM26a/0R7FKCdj5HeTH8ItCV9BnCP75Qo+NAipqbEyqxOx2jFG
 I66Sn7FFa5dvjYs64K0817NxFiZ10tAeMPsEh/YR1KfWqSP9wIEBGW1zcxtIOxtOLycCbaAXb
 IRNhI2N29L7WD6LO8sqcYOQ7ZHROh+F23c6tc4ahii3auweQfH1EbpkEvdaESxvvhGR3BruKv
 wxnJbMLwjhp1EW9mzlNwXLYDf2TAFxzTQUqZOIUeiDOlYNH7+dhcVCX5N2B5C1ahhSEbcTfRI
 7aVwKzIpF7saryP+89kzi+CT7v/QRP81GdUPBINFRcXcSwZZ7M9twGB/LIy7v6L0bpa4l/ZEX
 315QqLxBeEA/StubPGKiADwwv5nl9HSspHVxtXGpKfwrJ6dlxlYzEqVGgecJvXx7Gpd1wzu
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 07:58:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20200310180510.19489-3-wainersm@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/mem/pc-dimm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 36edfcf46799..6d62588fea8c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -218,7 +218,8 @@ static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
 
 static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
 {
-    return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP, &error_abort);
+    return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP,
+                                    &error_abort);
 }
 
 static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
-- 
2.26.2



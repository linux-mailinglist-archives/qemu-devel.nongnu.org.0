Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BB47A136
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 16:47:22 +0100 (CET)
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myyPB-0003fL-35
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 10:47:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNH-0002Cr-Hn
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNE-0002zy-SG
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:23 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M9Ib1-1msdFi0Eel-006Kvl; Sun, 19
 Dec 2021 16:45:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user: netlink: update IFLA_BRPORT entries
Date: Sun, 19 Dec 2021 16:45:14 +0100
Message-Id: <20211219154514.2165728-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219154514.2165728-1-laurent@vivier.eu>
References: <20211219154514.2165728-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UUEvUZHt/6/tstQK4xeCCCkXLvCfZtJ/gBrxM+l0LnyJ36JeD/+
 24vaZ8ykDLcnPuE0PmzRFwVwwhQE8ST71J7XK/lc/e7cyAxkCRFOG77A3S8yCQvUvyy42k5
 SqXsx35do5KZnblVtYkL8aT51mrYsYDDpTMrsKvByT5/DOQ8G+sIIRLX3lG+V7FWWVKH0VE
 A+IYSeC8JKsGCtEsPErSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XXRTBJZqVDs=:6xhh/tfQTTnOMIU2dlMPQm
 jqxeCsZHoTJrQKgdcAqNeFIFGD2tpKgA9OkQj6HJT2MSOWUyK921QC9yQzmnKg/Y9lq/IKogw
 UMuB+3gNyItL4K0TcMYoRAdMTgoh6VewJU6TYCFCWf2WUhtblNp0Svo9BU4n2coJyyzqEWYJI
 eEe7CkQzkTaWTu4i9uVleHSIX+0dIJXmnQb8TlFKUVp71wnRZ8JnvON57Dd0I43ZjNnp+258v
 Et+AoIG35gWUr+P2AoiU5UGjHrGLKsDx6cAJTAi7rlCr+7pzYZYav3mgXyjvO1oZW0L3kCx0E
 L1TRPROWOpjGSInOtIT8hwJjJ1lRE4fWxL/UXhS+ebCB/ssTB9dxyN6iMS5wv0DHa+KE/DIc/
 BxQBTrOdjmrDTfKnuHHuobAXe2gK7JoNa2ugvEVE5aE8Qc/sGsMovlzMSpTBykiWRBF/xfB03
 cSpW0B3Nr8enOG8Ag58XwTfRrvywETFINNycGotLVJ3rDKLfbmt4n/vcmkKUTaY0vImnfZp4D
 L5HONIruutDixIwcmZJQsF6Mo1zAUHTurSpYU/sPAG4qx3Hk7GtspfVB7Dsl7z3RBdMptjjRJ
 2Oe7G7beqwNGIPaFb4YqtqIjYIH9DLwKiRvfeljdBdEPhMe8DrwAbEStQsd370KOvlondnzVl
 zlTURRG5N3jGVrfWOV0n9ooZdoR5OLjNOj86CaMv/hxYTCDTs2CM+N7jjPaRZd5BIQIU=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT and IFLA_BRPORT_MCAST_EHT_HOSTS_CNT

  # QEMU_LOG=unimp ip a
  Unknown QEMU_IFLA_BRPORT type 37
  Unknown QEMU_IFLA_BRPORT type 38

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 36e4a4c2aae8..a17d05c07923 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -182,6 +182,8 @@ enum {
     QEMU_IFLA_BRPORT_BACKUP_PORT,
     QEMU_IFLA_BRPORT_MRP_RING_OPEN,
     QEMU_IFLA_BRPORT_MRP_IN_OPEN,
+    QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT,
+    QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_CNT,
     QEMU___IFLA_BRPORT_MAX
 };
 
@@ -607,6 +609,8 @@ static abi_long host_to_target_slave_data_bridge_nlattr(struct nlattr *nlattr,
     /* uin32_t */
     case QEMU_IFLA_BRPORT_COST:
     case QEMU_IFLA_BRPORT_BACKUP_PORT:
+    case QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT:
+    case QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_CNT:
         u32 = NLA_DATA(nlattr);
         *u32 = tswap32(*u32);
         break;
-- 
2.33.1



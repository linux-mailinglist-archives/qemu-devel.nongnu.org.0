Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C72199A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 09:25:04 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtQvY-0002SM-1Q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 03:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jtQuG-0001Me-4c
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 03:23:44 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jtQuE-0007Sa-Cs
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 03:23:43 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Miqvq-1kVnzS1jeu-00etj7; Thu, 09 Jul 2020 09:23:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user: add new netlink types
Date: Thu,  9 Jul 2020 09:23:31 +0200
Message-Id: <20200709072332.890440-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1C9UKERMMOFA60EbsBAd1ZZSImyfPXgsTXtdMtBwpr3UaIvdhtT
 atmV9mVjSBfPhZ0gsiF7cHE7BZ714ZAM0DX7+dwf1w3rVXTFiwUEqwpiI0XuUzYkKZip6xf
 EGOSSAW786yYOM8aKnvdJAGZMgBNlXpy5DZ5Fgq2M3a/8cCmOhc91BAmUcmC1TFUXS7pd0J
 M+0Wx87JAG3xMIgxoMXUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eeekCbeyoro=:MFwzgeHV9EiTsMbTCQdO5t
 Gg4l46Q+YS1heSc+AINuU9LzUYibf72eeolEoY+m0izuHBxPQx85B0Ri7XBoWBiq48NFI8cW3
 bS+Z0B509KkMOmHOw58kJjL4/iewd7Zj6je/CeL9bNQJzeO/Z3C1w16pusI2lgTWImP5cWeMx
 KgkHuP7W+73wWMSPy8JLnWHY1YJpaU+wn63ekBR5krGL89+vPsyCN6CRpilNvCHiNmetpYFdk
 HU2vgzPfApkP4qrUFWRwQJ34hxA6ZQ0Yvlbs2pyu55zpz/1xMlPqvSgpopPcunS5yqyAl9SyD
 1xG68DAbfgNS9QhMNMs6olknYyZBs10pYVfbloyZK4iML8mXgHwaD84TcJJwbaqmZx4IE1Sbp
 PKhhYcAlmM/X2vT3A3Lbil+GqprSoJkzqB0cZwwd9Yldk4twAgzoIAudsYiOyjjntgCNYRDEh
 Hp+bFhQ+s+NqjqNWcP/WAxFbcbsvKfQQ89i7NNnSal/ceGwAdtVJ5gDwbRCnSA2Rl6RDRDzo6
 6l+jtbldV55Uo4XNF/tO6O2waWmGibi+qwLOyiLfFyL+lBJp5DQ6M138giA132/MDtxvGwgQm
 ydMRxOwIX2Ak3ATi0Y5/TBO6itb/HzYIUL1OnR761wcgXfy6OrPZ5WEKQNT6dxdFlLB0irMwP
 bTblu9Lmuv3qb8vCbIAs2FqqBwi4j31NuhEPJBkPci3T4hczSAGuEJmRv9rNAxE7Wxpiturat
 Jujsuzf7IaYBzDxH/NJbrWe4SxqENC2atzxdILmYXxJR4f548/4lExF0GHRFaiBCjpu8fdlLF
 5HoXsv6Lo41AElNR4KvceT2eukpm2xT9fslaDNvJTHLiL/oi+X+Vcqnis8NOkO8hLLT243i
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 03:23:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only implement IFLA_PERM_ADDRESS to fix the following error:

  Unknown host QEMU_IFLA type: 54

The couple of other ones, IFLA_PROP_LIST and IFLA_ALT_IFNAME, have
been introduced to be used with RTM_NEWLINKPROP, RTM_DELLINKPROP and
RTM_GETLINKPROP that are not implemented by QEMU.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index c0687c52e62b..5d49a53552b2 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -133,6 +133,9 @@ enum {
     QEMU_IFLA_NEW_IFINDEX,
     QEMU_IFLA_MIN_MTU,
     QEMU_IFLA_MAX_MTU,
+    QEMU_IFLA_PROP_LIST,
+    QEMU_IFLA_ALT_IFNAME,
+    QEMU_IFLA_PERM_ADDRESS,
     QEMU___IFLA_MAX
 };
 
@@ -807,6 +810,7 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
     /* binary stream */
     case QEMU_IFLA_ADDRESS:
     case QEMU_IFLA_BROADCAST:
+    case QEMU_IFLA_PERM_ADDRESS:
     /* string */
     case QEMU_IFLA_IFNAME:
     case QEMU_IFLA_QDISC:
-- 
2.26.2



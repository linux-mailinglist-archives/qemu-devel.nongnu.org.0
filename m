Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBF47A135
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 16:47:22 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myyPA-0003fA-S2
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 10:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNG-0002Cn-EK
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNE-00030G-SH
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:22 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MpTpc-1m9RXk1AJ2-00psMY; Sun, 19
 Dec 2021 16:45:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user: netlink: update IFLA entries
Date: Sun, 19 Dec 2021 16:45:12 +0100
Message-Id: <20211219154514.2165728-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YbGErMePGx5Ct1jMBRoZE72MR8C5ADFfTqXSPNNVx6VcAnGHwRA
 py2YLRf5Z5aNQ36jaxBrSd8Y/Vv4yBBCpqnpK1SXoDK76EKgigtYU09/6JnWnN/WhuAhYAV
 NiKIjBQco8VJRuchDrxKv4L6ZAzP6k3KGA85WSg1wuw0w0oZPvW1yu5K3V4zlTRCYofRByn
 MtIiK3Zt91iS1BkukMjmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ou9a1k+77tM=:eIW08us5hS4IHjGPXpQRJO
 lrxFdw69PcYM+fBnO7owpu9G8te7rxRcLcfmaJ/HxWgaVn8ZkvnPsjdFnjWb8o+f89F4mFGoD
 EtAbYC0lxS/kWl4kypnolX2h68iGH9Z/ANqu7i3VVXXUGgs0EFMVDrgkRhkhavL3uoliY9g53
 exXmyfcf45sCrZZPtih0XO7CtJwLPMeb9khduPj3X9T/YOrRYJnPZY2wfZJNdYFS+q/z8ppYc
 gnVEqp0E9Rs+C2DfwyUfRdW6vD+yP1h61hLY9B10Gw6lf4/zy9p0psXMVVGcVci5CAUF1ZO8q
 nawt6Dye/GhTRJLxPFvQh86jKWdLBxwMRsH6rQaervqMoa9vcFbtq8mhtqMs6KEvM44VLTzeK
 RrUPLWKcr4Nhl7TEUNRZJrAKI8qgvaighv0VlYYfCbjhiNslE32lwb4zNV+kBxUAtB3dLgxYO
 tznPFD+WTh3F+KNZVopRJr9m0eKdWvfmXZw9QBephT4mUBq/WuPiuwdj2+/Lldes/8t2A/I6x
 pf2KXGJfzY6ZWro5hLan87DsnVnq2EX4aBMrH6bAMQEmBXlgumtA2IfCu9H7GfcvEXy2F4TO2
 Id9icDzojggergxDsWcYygytZQFjvd7PCd3y90kp2pEv396LNqHhm7k8e7czhaKO3R7W4FoFZ
 Z8pRkXyvVlURbo1t+1CixWr5On0VZ5VY2U2ftbFCp7EYYS/tZahNVgaxtBElHTxIOkeU=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add IFLA_PHYS_PORT_ID, IFLA_PARENT_DEV_NAME, IFLA_PARENT_DEV_BUS_NAME

  # QEMU_LOG=unimp ip a
  Unknown host QEMU_IFLA type: 56
  Unknown host QEMU_IFLA type: 57
  Unknown host QEMU_IFLA type: 34

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 69410899590c..14c19a90b2b0 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -138,6 +138,9 @@ enum {
     QEMU_IFLA_PROP_LIST,
     QEMU_IFLA_ALT_IFNAME,
     QEMU_IFLA_PERM_ADDRESS,
+    QEMU_IFLA_PROTO_DOWN_REASON,
+    QEMU_IFLA_PARENT_DEV_NAME,
+    QEMU_IFLA_PARENT_DEV_BUS_NAME,
     QEMU___IFLA_MAX
 };
 
@@ -818,9 +821,12 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
     case QEMU_IFLA_ADDRESS:
     case QEMU_IFLA_BROADCAST:
     case QEMU_IFLA_PERM_ADDRESS:
+    case QEMU_IFLA_PHYS_PORT_ID:
     /* string */
     case QEMU_IFLA_IFNAME:
     case QEMU_IFLA_QDISC:
+    case QEMU_IFLA_PARENT_DEV_NAME:
+    case QEMU_IFLA_PARENT_DEV_BUS_NAME:
         break;
     /* uin8_t */
     case QEMU_IFLA_OPERSTATE:
-- 
2.33.1



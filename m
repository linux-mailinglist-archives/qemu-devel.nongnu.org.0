Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EF48634B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:57:53 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QSu-0002Sw-1g
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qf-Gu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDV-0004kv-3B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:03 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N3omW-1mNFkA40GW-00zrgF; Thu, 06
 Jan 2022 11:41:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] linux-user: netlink: update IFLA_BRPORT entries
Date: Thu,  6 Jan 2022 11:41:37 +0100
Message-Id: <20220106104137.732883-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qMlJa67lAwAatw8J0ptJJtYadK0yHDP3nzuKOVdVq6sd2nzmwkI
 mrTIkSfHQaGPQr50DWje2ByRa31gAA/0YlWXkKgFKgFLz0jaGg0k0SsbSPKtwcH9rxc6oK6
 B7yLLY5pNcD6etMe9rPIw/gWDoun9Sl9p9OyCrT3JkyjqS0O0KY2OCOSimSthb34CUw6+1b
 CgKRKOpOLAu9gEJCAQGEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LvGLgAU4T8c=:uGyChumY6LkBvXo9FvxTEF
 jI9/KfLc84O0RS90Umv1f+JYQpouViupVQKGm706VT9oS/hluNIqmt9zR9AAW9ovL3tp+aW4n
 h1MApnWfNlJ/dX41G7KQQg70OBZa/S/Azt9RDukGrX61DNsodYHIZEfxXVOUcVeXXieCayJ1U
 ftVTh+hsJuZjy5acqsZwNjnxNzcz5loZpxUi+ZiW3KQl7SGLWXmZ6WMGONBR2kzFJYculG4jU
 PNHAmBJ9z3hZ8VPbYUIjhwpPk/Tecv/EXQCBgjg224/OoK6nKSLNdv0rjaq6S+ckrk1utEz/F
 2Gf9hVaoM681HTr1g5/084/CeCMpgSCMQZeqJRvG05sd9aKQfkS2z610RAQ2uGMjHeXMWZ91b
 vvO72+pXB/dpoL6JGM3YRudbHTejsOKXXTnrmtOOYieCB8NwJVeh7jziGA7IEIGvsGeYUvIIP
 wLdwj6RH8Gaa/fZbgBYDlp3TOAJ+NHwbAl2THzW/biRlVIxS1esL1FhWG7qTjLhMT1+N4yrbK
 9VdbAErISownm+QK9tF0RvPtl92H372NHPGMU42OpsvV0RGeeIQRgyeRDe72ArSTaohgFnBE6
 Mql80DuYZMI48Bxn4ewYv9DTyYLA/SU2SbY+RNGJBaLLaZgF06TbtgWc//qvnN+CfXBvkKAY2
 SH8yvgdnFXydqlptq4KUep63ufTgYKPQB+d8qviK3g73F7e/sUDOH4m9QWoDMt541Em0=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT and IFLA_BRPORT_MCAST_EHT_HOSTS_CNT

  # QEMU_LOG=unimp ip a
  Unknown QEMU_IFLA_BRPORT type 37
  Unknown QEMU_IFLA_BRPORT type 38

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211219154514.2165728-3-laurent@vivier.eu>
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



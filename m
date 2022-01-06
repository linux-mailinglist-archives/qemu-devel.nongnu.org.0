Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328B48633F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:54:34 +0100 (CET)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QPh-0005Vv-2K
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:54:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qd-G6
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:51829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0004kc-1n
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:02 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mv3M8-1mEQ3W0TDc-00r1yZ; Thu, 06
 Jan 2022 11:41:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 25/27] linux-user: netlink: update IFLA entries
Date: Thu,  6 Jan 2022 11:41:35 +0100
Message-Id: <20220106104137.732883-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:to9HmmIBhb8v6OzzSBs/Yui6qw5GuUVzV+HNSdIY2inzoOoBezn
 MbxtOc/KUVX6E1ArNy194/4a3UJg6yxPKU6BphLVexbKnhwUA+QX2ZlUpJRWNRidR+zdKjf
 aaRM6Zt02tE4SzK+SuB2IVus801Q68d6UzWULLrHYtQ2ErqPVhC49nsp4fFueOXtOEtXBO+
 QnVS2bZqrwA6Lb4XAl3Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U8kV77ecKfY=:GR4+3g+kZmVr/yfiSR/FFP
 NKsK/NuCjDaRKhIWp4apbKk1nUGNQ+jdzpu8F9Mx3AIkzIBkPI2wk8Lqyjd2u0Xkuu4/5j/yw
 1s10x3ue5dDY6Es/4Ajvu3OcK8x5xbZVG5udK12dK0c3pEkpY1554NW0sQ7DVNuSVQdOg/kIX
 jrhGipzQs04teVdHz2FP8W93WNoaQnXFp8xXRswlpxSQlPhgzH+roc/SvWGQF3j5ktad/Tzp0
 wMLtgM15VxnZ+AWYvwJrEX44Uwy53XwvSmiU5gb/4NOQvRB06oTMI7+i2B1HJV6VO3MKu0voT
 BaMmSK3pVNtwSLMF+zaGUiFKhZotRZHEm9JmRxkHdju/qxdjiEvrvg2wAJXf3Gdr8HlHzYneu
 LTXL638V3D9xvXrjFCNcQnkjVSnG0d/hrZnZ35QtB1o8vbJn/5C0DsHH0s7oPLD9k5mzsR299
 3wFYi1e9sYqDJweSiX6I/AsFrQSebLoH0rpOVdcMPqufMI7eFUJLiUSccjiDfyaVkYjcobrQz
 VXnvITszGIHz6Id8UAJHGdVaCAvI5iCbdUDV9qe677KCFs1fJtM1YtQ8AOtsfN1mmNJnVj8fR
 91rNsRuL3WM9U13AxZtGjbXv5Gc2Pzg9ZVyuH1i3/eTWht0jH/QtH6fDD/Z6E0S/bpLDye0q8
 RH/PPa/P/EZp2yG+LNBm/Epqd+jEj9DKC1M76FH0hDmoSu3wDyFMx3+90Q4TBIHB6wqY=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Add IFLA_PHYS_PORT_ID, IFLA_PARENT_DEV_NAME, IFLA_PARENT_DEV_BUS_NAME

  # QEMU_LOG=unimp ip a
  Unknown host QEMU_IFLA type: 56
  Unknown host QEMU_IFLA type: 57
  Unknown host QEMU_IFLA type: 34

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211219154514.2165728-1-laurent@vivier.eu>
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



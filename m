Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD31447039
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 20:46:41 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjReB-0000Ej-Tu
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 15:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mjRZq-0006Zd-JI; Sat, 06 Nov 2021 15:42:10 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mjRZn-0000qi-NV; Sat, 06 Nov 2021 15:42:10 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsqMq-1mTpUv1532-00t8gi; Sat, 06
 Nov 2021 20:42:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw: m68: virt: Add compat machines for 6.1
Date: Sat,  6 Nov 2021 20:41:57 +0100
Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106194158.4068596-1-laurent@vivier.eu>
References: <20211106194158.4068596-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4coAIJQZ1O1Gtjb6hxLT7yksr1YdLnCIjlNkzcWGvaHwQW2NLbk
 560zoDO9on+w5BqQFTEDq3GSfdFcqdjNuX0+l5ytFDIYaY5hF0SSjGPBnhRKP7T48PK7OK/
 8R04BmWjWWY3YB0rHqJzvK94Xfqeg03WofXGEYrnUzJ27yQ2obwKIIaiR8iJjwM89vwGW+Z
 u9sPCgJJU5UfJHfIv/3yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tLVoaNQtTvE=:0CrhGU6v9GHoojpn5Q1FiX
 8WJQ0DEUl730kN+jye/FjlpEE0vjl+q5BbjozWVCgfxZxjh4WFIJ8Z2Z9Ry5itSdneRMpgXef
 0ABMPioqXDf1Simw5ZNZ8BZOR0TVX7V3Cqn/wqaTfGJUk2ixJHQBDakxhul7Gmbpr+VaVF4RE
 XCAXq50XCTcR5LRUsyEWk683RVr7o6OaLCg4Jo6B1pqRL0rw3BlYFJzqWVXRDMVDtYDpjzSE6
 gqWDMirhBwaCqOkseuOLdQMF6vBchzmTmuvR+0Q7w1vMpc5e76xJzka++aAJ6RLcGKjfU8hEx
 IceXRrIlByIeM471XgZhBpdvy/6zT9FXVj736gNctgFEQDr93itPgP4x/4MRv/ZDsFMozr+uv
 CbBuvtRseYZL/0l/KhJG/PJ9jQ90qv10lwWnrKMC7Qur6RUIh6uOIWbOIowD8FDA55NksqMVw
 emESd2Q0QLNLXvzsE1iPR716XNcJzmW3/vJieOvxq17G3AzS+X1LnP/UCvMBEOV/oAI9+VI4b
 n6X+9FI62LlSSwQb85ED/sFXXy+0477r95jTGO7i3PiU3C3gUkjWjsuHm+sFIdC3wQIMFJaIV
 D4t0+cTwnHqZFXEToHaUW6nkl6FbqD/l3uvTpYmA8noaHZOgVWO57dtE49AUZSJo4aTV0Mm/F
 arxCXdtGl3m/zgITCR/7/0x5MxH5U+WjO1mH5NVBaR5jAdAqodDVsRq47VLBqw0tNwtg=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing machine type for m68k/virt

Cc: qemu-stable@nongnu.org
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 4e8bce5aa6f7..0d9e3f83c169 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(6, 1, true)
+
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
-DEFINE_VIRT_MACHINE(6, 0, true)
+DEFINE_VIRT_MACHINE(6, 0, false)
-- 
2.31.1



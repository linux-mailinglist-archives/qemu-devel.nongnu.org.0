Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B195534EB07
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:50:43 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFha-0000u9-O2
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lRFWB-00045w-9Z
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:55 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lRFW9-0005LH-MN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:55 -0400
Received: from localhost.localdomain ([82.142.14.126]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MvazO-1ljb5D38ys-00sfUr; Tue, 30 Mar 2021 16:38:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its
 length is 0
Date: Tue, 30 Mar 2021 16:38:46 +0200
Message-Id: <20210330143846.721955-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330143846.721955-1-laurent@vivier.eu>
References: <20210330143846.721955-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JBkfnHovGgA1nN0wduoDHw3qWDq0L/MawnAXkWs2wGwHHMUQepp
 N/7ckiwnQX0H9v/nwQQE2KLDs7Og62L4dInE3bipmldqlqp1SwWB+EiDJJ8zO+75bcK5ov5
 ndy8NQhYQXDna/jB+tHP7FlHY4Fi/JlaxiSneQDdEmSSDDUoUJvCengAKTIoUhfY21qNLOR
 Kcew2P59TWqojgOUxwgtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dNAdnacb9DI=:lr+sGNLV9IpAvrUVEvSOWi
 mbx3LTxi+G67b6bS/2JAHHRpvWIAqKpqN+ZknLtq6D9NjHAnLLzUAnDNPSRIhEu7KKjeZbJiT
 3d1LgoBpPzo9erKwxwYlcpKhSF3pvRCNE2OtMJPTGUXfzR8AKgT8qg83Wf487FBI9NPa/BSPC
 xFiYugXprE2kTluIX/kmho+NHF8/XWEC9xJQKp+DhJpC0lw5rXPo8datmHjBP63X751GBiBi1
 e8elI7y9M+cUR0jvtICCHLI9T9UPNhRhOS8LkMB8dlYf4bxF+JHzyVfmByXaqbbws1QcrZ9Nz
 1xUEkt0ozH4iBainbj5gqOOLfjfwVna8LitMY4XP12vY4J97a7+d9wydBEt98DCpw8raW/bbZ
 efyxdLiafVsjRlI6HjaEU/clN0Y4G+739nhd8vA98UAUVzkIvPktuejP5WXmq3qnQdlFVCejD
 rz9SU+zf+aNA3yIXPdmtfsrvCx5q23SAkKwkfyaOQ0VgaLNnLRz4
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Fortier?= <frf@ghgsat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frédéric Fortier <frf@ghgsat.com>

getsockopt(fd, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, *optval, *optlen)
syscall allows optval to be NULL/invalid if optlen points to a size of
zero. This allows userspace to query the length of the array they should
use to get the full membership list before allocating memory for said
list, then re-calling getsockopt with proper optval/optlen arguments.

Notable users of this pattern include systemd-networkd, which in the
(albeit old) version 237 tested, cannot start without this fix.

Signed-off-by: Frédéric Fortier <frf@ghgsat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210328180135.88449-1-frf@ghgsat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 294779c86f4d..95d79ddc437a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3025,7 +3025,7 @@ get_timeout:
                 return -TARGET_EINVAL;
             }
             results = lock_user(VERIFY_WRITE, optval_addr, len, 1);
-            if (!results) {
+            if (!results && len > 0) {
                 return -TARGET_EFAULT;
             }
             lv = len;
-- 
2.30.2



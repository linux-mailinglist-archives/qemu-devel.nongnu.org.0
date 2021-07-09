Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94683C2A63
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:33:36 +0200 (CEST)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xBn-000466-Ki
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x72-0006IV-Il; Fri, 09 Jul 2021 16:28:40 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x70-0007WA-GZ; Fri, 09 Jul 2021 16:28:40 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mg6mG-1lWSuW3JIE-00hicH; Fri, 09
 Jul 2021 22:28:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] misc: Remove redundant new line in perror()
Date: Fri,  9 Jul 2021 22:28:20 +0200
Message-Id: <20210709202824.578187-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J6kOkAk+oPhRqAsrle/AXdwElsBIWnS618TcwQy75zMPk9BFr4i
 4sJmvBDz4Z19DDfBwdwbsjmMWy+fpGG0PBDTReYGVjyrhUHctInobqedb+yupm9OzkpG+VA
 rlSXRzuai0R6wT/NFWJTQjUuXRQcWDytiED0UiHJsonqDI7FW4YpzOIEXL4w7vSp7D/wrVr
 J+32R5sxmi/V8A2jQCZQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X7BHhnCPEis=:a06GWP/V0JyYbliN+ZJV7G
 MGkcVv57zfSvnVjvnLSMU1Od1JZED1sZLe7bjFntaWJ2qsXBfMEgsJnOfYPtoMiczUpeY8DhK
 iPfJxct9ZQmAz/mpnIcdSzbV6M7CwPBl6FOg3q3vPMwAXyPlPKj86hMI3gAOxw9BgCmzt9RX9
 vNNmgNRvZW3n2QfOYr5TmKhwCbjjI4hwlwDeqbs7gEY+IG5GsViKMWpF4W9Eu0nY5gc5weo4b
 THrN3niKRPB25wDavg4McU1DZjWX7xSHjhBdX896S93XearD59+Ot73igC4KuE27YsbdgO1fm
 2VZhrslgrF6X4K+3XlQ4sb6EVyIMK3b5FDmOJ8hbDqFE3f782/7//hRrBNxQHptrxhNlX08Cd
 Km8brrnwYmWdAoKY8RPwkGFVej4dqPwh6sJPYlOP8tJBtMlUUdSSNmGtEX07fMfYYYlG0Cm/j
 99PreTqwr2OPCR/O5f+ID/DBFc3fjuTyMKU4dsIOpAMBeYrUiq3165K0rBiNNFT46VIVy0Gcg
 DzUKDJbDWcbCKsk+VyG9GzHKbOTgLqbJJGfQDgAayZhbw2qaCuTGlX5sFjByAXFv5NT30SLUO
 nsj4NW3LMMd+CFDUIMJyuvh0tH4Nefyc3ndyoNSsr7tNLgh8mGiM87dv2pkBYoWq9bSEoFryQ
 Rnbom0kjAkfVFz5fPoT5wYb3clnxeCvw0fKIcGMBNZO29YziHY+NuT2plR0qzH54mJtKp4v5Z
 fywdcDMb+ehh2N4ibC+KqLhFCRcD6utBmENPWig5Rvi9dQJHK7VxSQS+/emaOJpVf7RCcGCIS
 std9BbHxc6RWcFvoEY0xv0HvFqbHrwaN4AE0DwHokpUzbA/65XfRGRpKigPybQYLtJ28fec
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210706094433.1766952-1-lizhijian@cn.fujitsu.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 migration/rdma.c | 2 +-
 softmmu/cpus.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index b6cc4bef4a8e..38a099f7eec0 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1131,7 +1131,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
                     IBV_ACCESS_REMOTE_WRITE
                     );
         if (!local->block[i].mr) {
-            perror("Failed to register local dest ram block!\n");
+            perror("Failed to register local dest ram block!");
             break;
         }
         rdma->total_registrations++;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index c3caaeb26ec1..071085f840b0 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -325,7 +325,7 @@ static void sigbus_reraise(void)
         sigaddset(&set, SIGBUS);
         pthread_sigmask(SIG_UNBLOCK, &set, NULL);
     }
-    perror("Failed to re-raise SIGBUS!\n");
+    perror("Failed to re-raise SIGBUS!");
     abort();
 }
 
-- 
2.31.1



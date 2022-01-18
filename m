Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC2492747
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:32:05 +0100 (CET)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oai-00088O-9K
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:32:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbz-0004px-Aq; Tue, 18 Jan 2022 07:29:19 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbw-0001wm-OP; Tue, 18 Jan 2022 07:29:18 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N2BQM-1mAf0t0S6A-013bb5; Tue, 18
 Jan 2022 13:28:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] softmmu: Provide a clue as to why device tree loading
 failed
Date: Tue, 18 Jan 2022 13:28:43 +0100
Message-Id: <20220118122847.636461-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FmmG+CKTpvo/5jEj8swnrjyejv81D0GmNPY47wdn4u0pt4CkhIF
 NYwHVr62qfnoeDJ704mBjQDPyajyysAHtqt/O7Y4bgV0Edf67IEGXkSzvU/+KfEZPfgWTQT
 /h+gMFrHJsbHm9R7bz3AtYzWanbZz99TZlNsKcIU56nIyoCuskWzxt4xoLiWZULGcVJwhKC
 wlRjXtG2ZGZx5hPOLnZoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4DWjIaCnvgc=:ERHdBs68Qvtv0pIHiawS/2
 7g85dZNSHSNnGP7M1Lx1n86Y8GGYq+Eu4jqgyPeE+fjHvZQ4OQoXXNcUPfPA2qUImg6fGVwrM
 THarRWo8S57RVFkTwNaNO9T6cAOgpm9pFmGPH1EDD//FnKBSFCtp8WbuWudl3xg6UOC0jiAdM
 b3DczNMG4Kq2lXIZzhqRPKwxbZrT/wghVt5B9gtRPdxbk4X2Rm65Mvb/x7XRW/HK4S0GhByGh
 gkVAOFv73LHHmNTQ568cpFkOtZiJ8jsCk6A0Byx4cwSZpx8j/CpGLFL8WYVKmCpoouFdYi7tf
 W6Cboyd635tZzs9Z3qbP3csDz8P5rUUbI1IrDRkVlAKTOZKulTLIE4hWO1mofSat0cy8hgymG
 hNHoBniKDqA9zA2nc9Pmrlpe0u1eCnRmsEVUb3WQBwD7dJmGURFdHdyw7AEbqrYgEgY+6YQs8
 j3D/t+nS7hHzd2xgVFiePN7XI24qpUKnUi31teJaKRqj9K0t/Uq+cwxZc88GZ0EhCQv169jA+
 VrBxxui6bltdtNFZOFlsfECYMvJ1Z7dJDU0cXjd6clXSXE3sy2zto9L3Wuco2QsyvpNTa5T8d
 9Dw8wvsZ+uac6+QkNEO1GNBls90zHIWbw/9ajUARsope4r+J5PLYpXRofDqdbOQTd86WMJ2Zk
 hpjSAXQjmm0zaZxUC+PRROA4WYJBxPLeOd9rfs6cgNLoSxEL9XkWDBRjip8NtiSZEMDk=
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bernhard Beschow <shentey@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

fdt_open_into() obligingly returns an error code in case the operation
failed. So be obliging as well and use it in the error message.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220116114649.40859-1-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/device_tree.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3965c834ca62..31d106694048 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -60,7 +60,8 @@ void *create_device_tree(int *sizep)
     }
     ret = fdt_open_into(fdt, fdt, *sizep);
     if (ret) {
-        error_report("Unable to copy device tree in memory");
+        error_report("%s: Unable to copy device tree into memory: %s",
+                     __func__, fdt_strerror(ret));
         exit(1);
     }
 
@@ -104,7 +105,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
 
     ret = fdt_open_into(fdt, fdt, dt_size);
     if (ret) {
-        error_report("Unable to copy device tree in memory");
+        error_report("%s: Unable to copy device tree into memory: %s",
+                     __func__, fdt_strerror(ret));
         goto fail;
     }
 
-- 
2.34.1



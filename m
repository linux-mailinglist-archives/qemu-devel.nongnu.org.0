Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEB3C2A69
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:35:44 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xDr-00005z-HR
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x71-0006GX-J2; Fri, 09 Jul 2021 16:28:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6z-0007Vq-Vt; Fri, 09 Jul 2021 16:28:39 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MrQMz-1lQ6370lb5-00oY7A; Fri, 09
 Jul 2021 22:28:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] virtiofsd: Add missing newline in error message
Date: Fri,  9 Jul 2021 22:28:19 +0200
Message-Id: <20210709202824.578187-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9Vian2QjcDtP8ThPcT0I0Nv37G1saVYZFgcuhQrH41Ob+pXtPso
 kq9jnV7PFRublPzdF+jx4UrPEhqFJaPpaJI4tHgNmI8xrCnIHWMvmmkxhoNVJzaaHovczeL
 P/+tOarETBAmsMHph4luDUAhhVEqSjC5FMvFoQuijpSEdG7nKdgh/loDSlpubmnr6OPj8tX
 w84wnyrR/FSKa801lXbNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G9c0xHWL4e0=:3R5vWFpzF68LH8IAD9pCS2
 bGBNRNk/DA+V6sD7Sg9dVEChLkVZHtNUtYiPhOdyVH0Ox7Ne2Fr6IGh2kjlgDb1/aIettTRhT
 YtQFZ/vGM9sNMwX7+5NpTyau8cXmXo2f4boAgX7RGYmbZLH0SBo3l+1Kwdnit4CgHvKcmasfd
 I7zC+Z/TNnyLC2iFySwTYORSRTKUkWc6u1Q5JOM2tZKjjQ+2N7IlluItloDVBQ+xoJ05GanPR
 Z7f7gRrS4NxCRk+J1hxA9VTx7Wq9WRNURz/3hRegnIefstSQF3cul1mtRzlpwtAXkxfkChbwV
 ROjEcK6NCiTsbU4r+y1Tm7Sg/QDRIJXqw4RhBRqts19uujyoPgb5Qf5UaHNYagiG5m6QH8y2M
 24qdxHYYNbK+nTcaiX8a3Ojc9hnNX+KJNoAQ3Qa+gY3Xrm8Dy8ubgO0qfZMzBs7nxeOm7si1O
 lLbADifOCE+eZiEW7UvONJFwzDSlAQpWxEj0I1oRWQ8HSEW8cOiWv/MZOVS0QwaMMB/XRHmLJ
 yLDlRzUpEg8uFVw/2wreeJ6b2281DUCcj5iXO1CRwhC2K2lTlRAc5g1QXFoTr+cufT5kGnOwy
 r9XqpcBqpL9GK5pGfpfVDw4rfh4Qq+bxorvxQSLeqKcTnWtNQLc7Xv4zu5SV3rlRRPxMmwYYC
 IDpIc/pxgUfz1DJF612y1sjf+ftLGvvnQiiVW1n69w/DjXVVms/QbUyotGapLpYYL0JJo140E
 +Tya4SqOF4MaEOJxCxg8A+P7Rg71u2IisCOwqYEVnPB2/UWlo87UQesYNBi+DVEOlhDD35lGI
 XRqI0i5fslW1umFuXuc5q0azg/au3NAkj0wdXu9zZXmsDoQxNvlHJMOei/VOw8Ve+FPiO6P
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tools/virtiofsd/fuse_virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fa4aff9b0ee8..fc2564a6033d 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -917,7 +917,7 @@ static bool fv_socket_lock(struct fuse_session *se)
     dir = qemu_get_local_state_pathname("run/virtiofsd");
 
     if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
-        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s",
+        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s\n",
                  __func__, dir, strerror(errno));
         return false;
     }
-- 
2.31.1



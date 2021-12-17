Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC6479543
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:12:41 +0100 (CET)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJao-0000Xi-W8
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:12:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYm-00060m-JC; Fri, 17 Dec 2021 15:10:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:55467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYk-0001Kg-TG; Fri, 17 Dec 2021 15:10:32 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPXxi-1nC0gc3A9K-00MeAN; Fri, 17
 Dec 2021 21:10:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] docs/block-replication.txt: Fix replication top-id command
 demo
Date: Fri, 17 Dec 2021 21:10:16 +0100
Message-Id: <20211217201019.1652798-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ssDFRdxDU16rVQvfzMzWFZ47dYx4Nv9mVinYp71rDC1gBkVny77
 0Tm9NPLR5qWRURP9TlhOms110cyPsAPLbVrePzJCTYd2Uu7wF6/ioOU1MDqyWlxlqWi47f8
 Qnoq8u58hviyW5OETWCvAXS+kk1dpWji5nJf4nbReTywOmdmp790Pb/w26GWJ/wHAIR8QRQ
 mAQzNlTXHkPt4E2nYkBVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ekthWI3McGs=:ke8MFEY93nnxy6QVecBJAA
 181Iecl6D8J6vchjkB+9NLWTaGkR2QKf+Xcqj7SlQ0j2p9hDmXlj98xtwj2lFkLDEvqnZ/GBA
 s6YbwILa0KiX93oe46xDSgLMankYPN+grdnKCvS1/9FdOFhggssXNJmn6Hq26g8v1I/vvFBLW
 ijbU83Xn+dckWdUCMeEb+5i04jclA+Zv49lGsRVPG7I7FtlRX9+ZStuEhDpd8ICXcn+VuyX4s
 +uLZ7T7KheBxW3bGAZZbf9CXqihCjA/pFzxkr27C0eSHXZqQFioUdmUcMA2anLszRMel1a85h
 eFrM8fb+eTryNXegWRLW1XAJa3mJDoadRDzp6PhI3yxCsPOgNWZPK74BaQu4rujDrJofLyEfc
 NL0FRrjwW+VHd/RA8w0Qn0YHhdPYYRqQKkhHy4Te6Qlo6/3cYRNJRhOy6rovXNbrsVwVxGDBZ
 VKO/1psXrGxJVfLKd2oIOMpCoX38ce7xvE4916HUSSRPXO4ZHR22pPq6CCUS8q15I1JBq+Frt
 f/0qpgPw/D1x5BGvM9cafL/Y1yrXUVIWJQAOZ3xMRLKnoPf8O9kK7VaCVkydKb4DJahOhHK+a
 NGOmu0vbCp/fHVk1j8csztyUpV0gBeAYLF4nbInP7vuvBVkMY4+2Jdcz0VdfWtDZhG0Z5q+rW
 2c7yVcCfB70vwHyVmRQNginMaZv/fis9Ie4PpD6wapppC/tEJ89Kl2EEC3Ritq55Hk30=
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
Cc: qemu-trivial@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

This demo not correct, the original childs1 can't pass the
the bdrv_is_root_node check in replcation_start().
Keep consistent with docs/COLO-FT.txt

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211018085044.2788276-1-chen.zhang@intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/block-replication.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index b0f23761c6e7..e1b28a6cc117 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -179,7 +179,7 @@ Primary:
 
 Secondary:
   -drive if=none,driver=raw,file.filename=1.raw,id=colo1 \
-  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=childs1
+  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=top-disk1
          file.file.filename=active_disk.qcow2,\
          file.driver=qcow2,\
          file.backing.file.filename=hidden_disk.qcow2,\
-- 
2.33.1



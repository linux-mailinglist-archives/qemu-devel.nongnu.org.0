Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C738177B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:10:19 +0200 (CEST)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrFS-0006Y2-0z
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9A-0005kZ-Nm; Sat, 15 May 2021 06:03:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:54887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr99-0006NH-2P; Sat, 15 May 2021 06:03:48 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MtOSu-1lMKPo2u46-00usfH; Sat, 15
 May 2021 12:03:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] qapi: spelling fix (addtional)
Date: Sat, 15 May 2021 12:03:25 +0200
Message-Id: <20210515100335.1245468-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f8zYeEzuDZNvbqvCYJTQYPvCrBHo4j/Z+OGCfx/feA1Fp8/9dgB
 WbPSdTkkrjM36R3MmwxNRiR8RANmHPkKRhgSeZ/tMsO+GXjkKPNK/CHq0B5x8/t4WVy2tZX
 PWXND46MsHJLVk6XNN6Ivak6iouh7DL9RQZePCs5mxCC+o1pkyPX4KMW/XFFxGzFFMXAu/X
 Utjk2Lu6ZkSd/MCiKxUKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dgFrppF26gs=:UeJq68j6Hr22M1KvmV8qxr
 ZeFCCADPZfBJtJj0dHtZH7B4/PREbkd1NhcPJGCUSFSYmfFzDbrE77ciat8fkKpJFN3N0oDnm
 R2wojxsphXd71/g2CdtKZ/W1YDkk6VtdL6OL9I5oTIkRNDbhzg5bo7jxXMa4rBucy0CCpdaA5
 o07m/2izA1UrGWpWuexHXicPo4Ra7pR59cGNlI/pn7ezOV7dmW6OdtcBWwVwieYbR1aeWvYvE
 IIFFPlZpKHJ2jd9SAwLUtjZ2b1/OXWLvVSnH47KwTGCYxtjB+eHmRy8HI7hqHvppmca/PVhrr
 DibRZqhq5a8n/FofyBzQYUP1ZqqKP0ISjzvk7DFOY/LK7BXAE3yhngyAqnlQxovu/6WuYRe8E
 GoWb0Vhl4/gBabewtR5WNEiqd8CxGLHEVTXILBUPFY/AgI3yVllCKj4yV4U0Og0UElY9F6+kT
 uiNXZPs4g7BjGsh65YDt2aVstAuIkq4lmMA3SGZAWX0yD+zR85M2GzZb4W/4fSBATiuMMhPS8
 XZhZr2mjeV1kTPIworT8HA=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

Fixes: 3d0d3c30ae3a259bff176f85a3efa2d0816695af
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d56459..40d70c434a09 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -251,8 +251,8 @@
 #
 # @max_queue_size: the maximum number of packets to keep in the queue for
 #                  comparing with incoming packets from @secondary_in.  If the
-#                  queue is full and addtional packets are received, the
-#                  addtional packets are dropped. (default: 1024)
+#                  queue is full and additional packets are received, the
+#                  additional packets are dropped. (default: 1024)
 #
 # @vnet_hdr_support: if true, vnet header support is enabled (default: false)
 #
-- 
2.31.1



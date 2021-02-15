Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17131B9D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:54:10 +0100 (CET)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdOD-0003O9-DR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFu-00046l-MR
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFm-0000fh-LM
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:33 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQMqN-1lXr4X3ndp-00MMqP; Mon, 15 Feb 2021 13:45:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] linux-user: Add missing TARGET___O_TMPFILE for hppa and
 alpha
Date: Mon, 15 Feb 2021 13:45:10 +0100
Message-Id: <20210215124519.720265-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Js7in6gK8aAOzL2AY+rsXNEGdm9OXejg39NF2XcOp7KRz7Y/Xce
 ZEPvZ/Xtvmx/HiLu5O3OuszdIPSvsfC9m7ubcFiX3n0DcOs8fFUwZEhcC2cIFt/3dx1nl4f
 pNSwV6NAgp0+qIze+Id5BC7KoxM1wET3IBv74Fq/q97OayqKrptCdX/SjVcJh1cfnRB7eVO
 sgU3k7y8CaHC6R08aJvtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:agyGsgrcf3w=:n1tti4B0/Az7Pv3TxKzNny
 ouDIHM7lezquCMjLzBwlltPHqUp+Wm3s/7nxYgnWbCBem4v0oPxHNvTDYCrxp1jiva5Nmsqe4
 tLF9OlHRZzj8z4FOPXk13ns0DGfY97zAkjabdp/w63W0KDPM33sqYSLzZ2hvj9TBE07juS2Y8
 xRDjjKjnLsfMXIAXwauPYJhE7ncL7iOaqEv41ZOnzov0ltfdcnwyVLuCzO5TvvLQv7vR5KW6y
 QttotAxdCAxnChIWlIyFOADl+r6g9OH406RA3aKo/YuUjaiQ7uLkTjNY0iNNTswML8JFGOqdj
 4d8/Wun8kFtHEvqjhaNj9aO46n8g5/vUlwCBJgomdPAzskVHT/orxrwwYLaC2vrOYJIGNEw3S
 KgOfRuQsmJF5lVaVL5XXoQvIgQSkaX2w9qiMPJIM1ZLyq/VVACTpUF0JI312i
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The hppa and alpha targets miss the #define of the TARGET___O_TMPFILE
and as such fail to run a trivial symlink command like

    ln -s /bin/bash /tmp

which results in an -EINVAL return code.

Adding the define fixes the problem.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210201155922.GA18291@ls3530.fritz.box>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_fcntl.h | 1 +
 linux-user/hppa/target_fcntl.h  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
index e16ed1d4157f..99774d731727 100644
--- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -23,6 +23,7 @@
 #define TARGET_O_CLOEXEC     010000000
 #define TARGET___O_SYNC      020000000
 #define TARGET_O_PATH        040000000
+#define TARGET___O_TMPFILE  0100000000
 
 #define TARGET_F_GETLK         7
 #define TARGET_F_SETLK         8
diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
index bd966a59b8d4..9eaeef9d8e7b 100644
--- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -21,6 +21,7 @@
 #define TARGET_O_CLOEXEC     010000000
 #define TARGET___O_SYNC      000100000
 #define TARGET_O_PATH        020000000
+#define TARGET___O_TMPFILE   040000000
 
 #define TARGET_F_RDLCK         1
 #define TARGET_F_WRLCK         2
-- 
2.29.2



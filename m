Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B636D2260
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:25:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFfK-0004JA-4S; Fri, 31 Mar 2023 10:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@umbrella>) id 1piFfI-0004IM-9e
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:40 -0400
Received: from c-71-237-47-177.hsd1.co.comcast.net ([71.237.47.177]
 helo=umbrella) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imp@umbrella>) id 1piFfF-0003uc-Ut
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:40 -0400
Received: from imp (uid 730) (envelope-from imp@umbrella) id 1801d
 by umbrella (DragonFly Mail Agent v0.13+ on umbrella);
 Fri, 31 Mar 2023 08:18:33 -0600
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH 1/7] bsd-user: Remove obsolete prototypes
Date: Fri, 31 Mar 2023 08:18:27 -0600
Message-Id: <20230331141833.3647-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
References: <20230331141833.3647-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=71.237.47.177; envelope-from=imp@umbrella;
 helo=umbrella
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HELO_NO_DOMAIN=0.001,
 KHOP_HELO_FCRDNS=0.399, PDS_RDNS_DYNAMIC_FP=0.01, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These prototypes have been obsolete since 304f944e5104.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 41d84e0b81..4062ee720f 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -169,12 +169,6 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6, abi_long arg7,
                             abi_long arg8);
-abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
-                           abi_long arg2, abi_long arg3, abi_long arg4,
-                           abi_long arg5, abi_long arg6);
-abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
-                            abi_long arg2, abi_long arg3, abi_long arg4,
-                            abi_long arg5, abi_long arg6);
 void gemu_log(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 extern __thread CPUState *thread_cpu;
 void cpu_loop(CPUArchState *env);
-- 
2.39.2



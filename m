Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2365AA2F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzSF-0003TD-3y; Sun, 01 Jan 2023 09:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fantasquex@gmail.com>)
 id 1pBz3U-0007RW-OW
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:11:16 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fantasquex@gmail.com>)
 id 1pBz3T-0000y4-2H
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:11:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id b2so26748009pld.7
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 06:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2s9s+LSnWuwyx009MKisSDfzCgleD3oVJn+wydHgoZw=;
 b=WDfihsYz8TC3gp9z4h/Zip+f8G/8pOPnT7Etg/rY/y7UP/Y2gVaQ/IH0V2Oo1ILxQW
 HwAtZM5sqDZ6fx3Qw3l0pSjiobjeFmzi+phq41WXm3KTzPkxsOWFbyTh279R5VzZdpjp
 wPBi31D4uKSHkvPPzGlQazikqbz6R3GoHv5+R2ipQCc4JGoda/7fUD3nb1cMQKJqDPFn
 ElC13BaqNwdkNJWPVI33xcX9Pa/GJLalOTOJYCtQ5xrepAL4oiurA2CDnA6VjlbA5Fac
 /ZZQ7Bo40k/7/bbhlhvMqsdpfVGGbEErZqxVIPkXv6VK8MuGg3xvzzbiABY31QNAMbka
 PAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2s9s+LSnWuwyx009MKisSDfzCgleD3oVJn+wydHgoZw=;
 b=7Y0erIiQY9RShJMu2AtQtR2IpfwCWSJKCHnV2FCz5qNKexHrD3SklthHiiSVvWZeAg
 FrIzMxK1Jt/ltkcizYxbF21tN74DRGbLkviSylHSB3P/mraSLgOob/XxTzKeJJlMYAbl
 ecjQ4qDG+7nWuQNqG15XIbNHR8yhUuMQ6ryviCI36cROIF/q//G4nOKmzu4S9MtXCRfs
 tk3Lve5pAW1fr7OSEQ/ESSD577N7m1+bvRK22L7+uC9l0FOLZkSSZgga6Fmyc+Pgiuyt
 rtiEvmwIIY0nRrlt098Sks70q/wEKtGlYF7ARZ8JqcQJdf77cSvBTDJWzwkr1zta0ar5
 DGuA==
X-Gm-Message-State: AFqh2kquhNspqa3pMgE0Wuq9bgEV2zsjHrnRAyMY52zDcs50MaLjAthP
 +1lebIZWtcZUcj4BQMui3LQPUJ2VPtpYAA==
X-Google-Smtp-Source: AMrXdXtPYuHzqQRbFVsCAAn///NlyZ5JcREt5pRDqJUikITf5OVOS76TA05GSNcC5kLFwZVN8veKAw==
X-Received: by 2002:a05:6a21:c008:b0:af:8448:5137 with SMTP id
 bm8-20020a056a21c00800b000af84485137mr49608573pzc.39.1672582272518; 
 Sun, 01 Jan 2023 06:11:12 -0800 (PST)
Received: from fanta-arch.localdomain ([156.59.96.158])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a654cc8000000b00478dad38eacsm15672402pgt.38.2023.01.01.06.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 06:11:12 -0800 (PST)
From: Letu Ren <fantasquex@gmail.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	Letu Ren <fantasquex@gmail.com>
Subject: [PATCH] linux-user: add more netlink protocol constants
Date: Sun,  1 Jan 2023 22:11:05 +0800
Message-Id: <20230101141105.12024-1-fantasquex@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=fantasquex@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 01 Jan 2023 09:36:33 -0500
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

Currently, qemu strace only prints four protocol contants. This patch
adds others listed in "linux/netlink.h".

Signed-off-by: Letu Ren <fantasquex@gmail.com>
---
I found this issue when running networkmanager using qemu-user.
`socket(PF_NETLINK,SOCK_RAW,16) = -1 errno=93 (Protocol not supported)`
I don't know whether this protocol can be implemented. However, a better
log is much easier.

 linux-user/strace.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd..a2b2aa7248 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -506,21 +506,69 @@ print_socket_protocol(int domain, int type, int protocol)
         case NETLINK_ROUTE:
             qemu_log("NETLINK_ROUTE");
             break;
+        case NETLINK_UNUSED:
+            qemu_log("NETLINK_UNUSED");
+            break;
+        case NETLINK_USERSOCK:
+            qemu_log("NETLINK_USERSOCK");
+            break;
+        case NETLINK_FIREWALL:
+            qemu_log("NETLINK_FIREWALL");
+            break;
+        case NETLINK_SOCK_DIAG:
+            qemu_log("NETLINK_SOCK_DIAG");
+            break;
+        case NETLINK_NFLOG:
+            qemu_log("NETLINK_NFLOG");
+            break;
+        case NETLINK_XFRM:
+            qemu_log("NETLINK_XFRM");
+            break;
+        case NETLINK_SELINUX:
+            qemu_log("NETLINK_SELINUX");
+            break;
+        case NETLINK_ISCSI:
+            qemu_log("NETLINK_ISCSI");
+            break;
         case NETLINK_AUDIT:
             qemu_log("NETLINK_AUDIT");
             break;
+        case NETLINK_FIB_LOOKUP:
+            qemu_log("NETLINK_FIB_LOOKUP");
+            break;
+        case NETLINK_CONNECTOR:
+            qemu_log("NETLINK_CONNECTOR");
+            break;
         case NETLINK_NETFILTER:
             qemu_log("NETLINK_NETFILTER");
             break;
+        case NETLINK_IP6_FW:
+            qemu_log("NETLINK_IP6_FW");
+            break;
+        case NETLINK_DNRTMSG:
+            qemu_log("NETLINK_DNRTMSG");
+            break;
         case NETLINK_KOBJECT_UEVENT:
             qemu_log("NETLINK_KOBJECT_UEVENT");
             break;
+        case NETLINK_GENERIC:
+            qemu_log("NETLINK_GENERIC");
+            break;
+        case NETLINK_SCSITRANSPORT:
+            qemu_log("NETLINK_SCSITRANSPORT");
+            break;
+        case NETLINK_ECRYPTFS:
+            qemu_log("NETLINK_ECRYPTFS");
+            break;
         case NETLINK_RDMA:
             qemu_log("NETLINK_RDMA");
             break;
         case NETLINK_CRYPTO:
             qemu_log("NETLINK_CRYPTO");
             break;
+        case NETLINK_SMC:
+            qemu_log("NETLINK_SMC");
+            break;
         default:
             qemu_log("%d", protocol);
             break;
-- 
2.39.0



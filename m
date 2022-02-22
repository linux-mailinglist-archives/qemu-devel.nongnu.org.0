Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AAB4BFF44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:51:38 +0100 (CET)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYO1-0005Oh-3h
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:51:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqU-0008H7-3y; Tue, 22 Feb 2022 11:17:01 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqR-0005e6-0Y; Tue, 22 Feb 2022 11:16:57 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M9nAB-1nGmfh3aVR-005paZ; Tue, 22
 Feb 2022 17:16:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] target/rx: Remove unused ENV_OFFSET definition
Date: Tue, 22 Feb 2022 17:16:20 +0100
Message-Id: <20220222161624.382218-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tOLTymzmv1rc+r+k7Jio9ZzNAhcV4CW/jkaYD4Dll2BsYXr/DJr
 i6Fqc4ypsAerqmMr0fdO1ST2RmPIP7gg7Po0FL3lJaLWddUionBC9/qq470Go+Yab7lGzGU
 BPL6r5+x7aqAefjg8CsI5lebyqGmyQqYsYT8wgFnunCxAb1ZG6aAsQ4MoAG4fZLM3S9HjZY
 +Z34tUJlhp3mqSYJwRtWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GzvL5ChLAVc=:dtPDQCLp2KEzMQUcUNKK/c
 Z24b9LnxkDhO45L0cMGPCmPqbVBxD+48kQx2zfSkeiGGu+KbbozyvjGSSAsXVxtiwD9d+MNvs
 siRWQ9bS0DSYLtAT9TCltdNozb5U1zbePCexEBVO1vVkNUha12KYcuPNDxPkLvZiXCjCcIXE0
 1mk/9DxRbyEV3mjvn9+Tx7KSqS0fauoWIPwcluE52tNMOEQty75LyeEapqW8P/1zym9VGGG81
 ngNEtY4qTX8DaoBkMYIYmR2HkdrbLbpwcZwgV05QEx2TI6k+yhEhmANHUgi1FuDU04WBjk7ST
 nUf2Jw/+RI42bEEJjbGNZUZhVwFjD+nuwYpF2fYycn/mpNfMAZhBmTF0J15Q/sswk0tiT36qN
 gokPX0PNazeko1A4rXn5VXks9MPoEzhG4sffkyCIWs+9XhgJlE9K9RXLjkWHdGIfOEZ3yc4Bv
 igNZPpI9omCEaDSSvjwTzRMt0YGVQ9ZFXV2oWNYpulXjmxZGpPXsXIJXpkAohsosT+KVKh/hg
 jaQ0ceFmZzodqsU+ex3mrXZPII9snL9deyArF01v/tlZAE4D1+co6Bvru5+6NO+wHHtyFOPAp
 CcvtZVKGN3BpkxcfSP8T1bdkdg6JszXWJ0OAXWpaJxfwyYz8ZB6bkEX5Hwk24V6Jqi3+CKQC2
 IG3zM3DwqxX3iUauHvWmvyBYWYvztNOL3IQxq4nAmSmLdZJMykEjb8ntp3jIn1dBq4BQ=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The last use of ENV_OFFSET was removed in 5e1401969b
("cpu: Move icount_decr to CPUNegativeOffsetState");
the commit of target/rx came in just afterward.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220203001252.37982-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/rx/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 657db84ef0a5..58adf9edf692 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -116,8 +116,6 @@ struct RXCPU {
 
 typedef RXCPU ArchCPU;
 
-#define ENV_OFFSET offsetof(RXCPU, env)
-
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
-- 
2.35.1



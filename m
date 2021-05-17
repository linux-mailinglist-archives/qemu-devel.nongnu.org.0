Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57453383CBF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:54:44 +0200 (CEST)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiO2-0006vv-WA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlv-0006pi-Ih
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:25 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004Xm-9z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:19 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQy0N-1m5aEY3SfH-00O0co; Mon, 17
 May 2021 20:14:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 45/59] linux-user/s390x: Add build asserts for sigset sizes
Date: Mon, 17 May 2021 20:14:10 +0200
Message-Id: <20210517181424.8093-46-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R6HjJXjyG1ZInBrhVPsshMwqybr4sLAVUEny48o6ZhIf1mi7PzT
 +PZTF1WmyhaFwMNsvATMX0RKeFdOEhokugXuGupyd/cFeQnOUBpIxVxGELitlxUc7fbUP8o
 4aAHZY3ae0iN60PbQewzm9o+v7mfqUD9DhpNot1aFloecxBhuIDbhedXFNn075sbeqFaTMr
 6efYBRbsHc4FEEbNN7ZbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z9d6FwXX8vc=:1PwEbhzYXdRekt/aMv7H+Q
 XRy473ldfFu+pAVKNpeN//U4oez2RfzHHX/8QpcibWXWnbV66guC5rX0VdePq0NCUymdnN2mk
 5w4DUga+ApS2eRvM7bXt8kOW6HBNaTBtaFAsdQqQTuL356V9RyMnMF3uf1Cm3ik3NZZw0D7Wy
 3sOPfyy7gm16ToHVQRg3O24U/kMUlKOvrWSNvRxypzfsK8gRWMzNAASf1Qi0nbfOQ6pH08gYb
 rvMWx1bOGajXtx6vrnOJM1CYQlJUei23cK+bPgiQzIl6OvCzQ9KjX4lytjp89BPwK8obeRj7Z
 43ODrKnCFXI95qouhGInUCfOp6zu+TnI/BuKEvZc85toaoq3j0fkvBYHuJU5OhEEdvoyJZreL
 zsSGQA8ed59Hy/jObXoplGNH6P3ElU5zQcW/Ig/Ab/eNsHmkmRkMQevSuKIU3JgfaVr58pVMp
 71jWx7rPN85YjC+DXNQJluSL2PVu6CTztBTk6+p0qAvWqU1s3yMFTcmAlaYOF5StAzw/Eabl8
 AaNAoafOf3Se+GyuDD4isU=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

At point of usage, it's not immediately obvious that
we don't need a loop to copy these arrays.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 81ba59b46af5..839a7ae4b3d6 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -141,6 +141,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
+    /* Make sure that we're initializing all of oldmask. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
 
     save_sigregs(env, &frame->sregs);
@@ -266,6 +268,9 @@ long do_sigreturn(CPUS390XState *env)
         force_sig(TARGET_SIGSEGV);
         return -TARGET_QEMU_ESIGRETURN;
     }
+
+    /* Make sure that we're initializing all of target_set. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(target_set.sig) != 1);
     __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
     target_to_host_sigset_internal(&set, &target_set);
-- 
2.31.1



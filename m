Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0A4E6065
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:34:17 +0100 (CET)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIvA-0003qs-1u
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:34:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhq-00060d-Q7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:30 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhp-0003RZ-53
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:30 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZCrZ-1nc1f40q2b-00VCV1; Thu, 24
 Mar 2022 09:20:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] linux-user: Fix missing space in error message
Date: Thu, 24 Mar 2022 09:20:13 +0100
Message-Id: <20220324082016.3463521-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bPz0y/RG92IsAAKj0NqSt4bsoIEWFQO4M+8uFIYnLxN+Uuht/n9
 S8hm6gDChgWL7qwySTryBXf83rQoxKK7WetuK2mAv9Qk8SK8TMJJdQv1Uf/X2kRCKmhQCMN
 4l9YmA2bpjdWFU3/z34IdfPcfjR25uWMbvqqYlNuJCgqsG9dCa8t9P6ZWVi/YDIFAXiu1ua
 NlGa1tQQJLW0cKdghpfRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z48gS2SW2bE=:lyA3pvYCBAqjZMi6nfItoQ
 7UzwqBnzNO8tLmGYVkDgQsNr+rHMZEOM7IgFq7T0hu+L89O8DMHeuxFZzcx5p+1VxQnIqcXBC
 bhdOTRgNAWQ9EeAtoL6QAPPqhWTvoWGfu5V2bXDIWy1V86d/s3SXPzUqOoCJMkYskEk1jDnCV
 oGLQowI70UJ7L23hh997yXHiEpdlbbYTVykoFmdG4HxmU8wwSrMql7TwEEEz59XTOjWGvKAgj
 onA7gbqpQ2XEBOeqSOVAlzced18v8kf+aXtkns+XViCBiDYvgepvEgIky2zkh7IueGh2PpPat
 IoHkkAPEynwYCbY/lOlOm9a/6Ufv3ubsJnTHaB0vNniyy3ZYRN0d/kwyisO/V3FJorxckKCJR
 C3aulLR1xb/sakYPlMVzl5U09gw1WckcXqSQS22CZxassEJSzHILkx53Fx8tAWU5OXtZ+V03J
 bTRfCiTcQkdik4Hlym+saDTI4TfgCuoKVYMknN9enq55K6jC/Dvk5HhrUmnv3rS1H569Sz6Nc
 soAsq5hq1VPRoiCjmGsR7wuuoQeCUtOSOAqx9+610srYL7iXXtm/jgt8uzudYzt2hdO6GfAN2
 NNpzs0IwAPpmFpt9fZFUpoSN/aPzDmZpA3T6JY4SNnOVcyjsRmdxg9DIRj0X7f32yCM8mNUiE
 TsOYlIoCC7rCwVs1TJ962ar10Qm9AeO5svMwUaeVJulUpPjvTxAPKrFN34vfVg2JelUo=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Patrick Venture <venture@google.com>, Fergus Henderson <fergus@google.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fergus Henderson <fergus@google.com>

Signed-off-by: Fergus Henderson <fergus@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220310192148.1696486-1-venture@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9628a38361cb..c45da4d63375 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2504,7 +2504,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
-                     "space at %p (%s) for use as guest address space (check your"
+                     "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
                      "using -R option)", reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
-- 
2.35.1



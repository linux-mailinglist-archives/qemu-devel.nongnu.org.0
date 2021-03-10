Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4E334AEF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:06:06 +0100 (CET)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6xx-00025t-JA
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eA-0003Dt-TM; Wed, 10 Mar 2021 16:45:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dz-0004So-GE; Wed, 10 Mar 2021 16:45:38 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEVqu-1lVb5f2Eji-00FzDW; Wed, 10 Mar 2021 22:45:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] scripts/tracetool: Replace the word 'whitelist'
Date: Wed, 10 Mar 2021 22:44:55 +0100
Message-Id: <20210310214504.1183162-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qpitq5CgkFUqaFtQMka6uBMZKo6QhrEm9G9ozTr/r5gz+Nkocrw
 z3PnTzGgFnVi/SIOPhVMRS+gV3DxSuO6TAdO+Kw05k5mb/edCkkjlRcKEB5gqSRJN2Vgp4o
 BFOgpdt/0vkL64teTtQIS4lS9Huxq6/JIOApg/GxCTYV/M3AufKi+zGG0eXt0Pplbrd2MNa
 maUKZzAN9xtg1U2fcDf1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oCZP1Vi+dZ8=:IWS4c70WFN2MeUGXx6Ov3j
 wcTqMHuH7xzvVyvzknJBivnhD4/ZVz/lnkGX9txfFD1SiE8lKv7AhcADNi1RDnXirzGjpVKq1
 JcZFK7SLDAooPk2AeWS+7fLk1ujPverSL66H1tmHt1t3fYtmUm0fZhX64xRn7e0CyuKs+RBUl
 KKeWV40ZOz0TDJauqc2gkfQo42PtNf9LeW1T2T5qo3o+9XaMBJ41jVLMnKP/MWBC17ISrTSLY
 4G5dNou75xteIWRDw0C8l2RneUTITJWvVeS5xi7NItSq3rbvA5W+gopDnF1I//aXjhjfVT2F3
 tfd2M6I01AGbPEF1531G99W1FAxAGPYW9xorTRNHp/ZB91kCx+HgAPF+Tcy76wanbKz9KWMYo
 inOv/5KzemTdREHzZO1ezYcI+JkOC/uur76Qc2EJnI/TbkVYtXZG/E0+p8Yl27JWVFcnIHsaH
 GDM1bwv1cQ==
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210303184644.1639691-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/tracetool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 96b1cd69a52c..5bc94d95cfc7 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -100,7 +100,7 @@ def validate_type(name):
         if bit == "const":
             continue
         if bit not in ALLOWED_TYPES:
-            raise ValueError("Argument type '%s' is not in whitelist. "
+            raise ValueError("Argument type '%s' is not allowed. "
                              "Only standard C types and fixed size integer "
                              "types should be used. struct, union, and "
                              "other complex pointer types should be "
-- 
2.29.2



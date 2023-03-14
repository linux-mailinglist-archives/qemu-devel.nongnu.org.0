Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A56B9726
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:04:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc52O-0001Jx-4d; Tue, 14 Mar 2023 09:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52M-0001Jf-G9; Tue, 14 Mar 2023 09:49:58 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52K-0002ev-VQ; Tue, 14 Mar 2023 09:49:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mr8zO-1qHPoU1l4A-00oIDQ; Tue, 14
 Mar 2023 14:49:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/3] qemu-options.hx: remove stray quote
Date: Tue, 14 Mar 2023 14:49:48 +0100
Message-Id: <20230314134950.569342-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314134950.569342-1-laurent@vivier.eu>
References: <20230314134950.569342-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MTq0DicKlBNk5US0e5n/WkY7Ju4gmkNHngz5fwysSnWejVIAsSD
 /QWREycxXDL+o2IwzJLq03Km7gTAPheS/Hmul2uhXiulHWxIO9OyM+56t7RWhBKuXnKGIPN
 foE+rL+T5SGzTi9LoaNgPiLfP2HFrORuuwb27OaX6WZYTtcrGRieTExnQwDjR/+3Md1lVP6
 PXK871Wj8NklR8h1O5myw==
UI-OutboundReport: notjunk:1;M01:P0:x9e0CALPf3w=;iihk2yY3QGZXlm8qRbyMstu1HNK
 M/aF2R9WKpmCA1T8Pk7jrYH4lYElsvJHXuNmP+ATTcdTdY+AQlM7QsU7l0AoI1LzIrKLi6U1a
 oAxOb4+cZ20NV+w7NKJrklE9JbfPff/m8qjhUlZu5vo/49w1Ve9yBD/ct7k6tdaHRpQvt04Nl
 ap9DjRouTn9dnJigqn4pIBH758I9VRXL4BSE5OIRZ7Atmcu526oR+gknYkkpd0N8HBmNYz7O4
 U/tGNPF6sxPDkKs92a2Sa0VY6pvmjHj+S2AzzfGz/IzpBrFE7nqOiG7NLtatNRN0EhsI/SOHb
 rLoO3B6LTWf0rQnX1OLSIbF2OtOwNg2snO+M/qlQJWjeTJtQ3dLPIzC3ty1LEIEkmao2hUwSJ
 WsQiJf3enw/chb9hEddbnwD/4I0G9PPiZW8F3+wkN+OZjt3Q65p2VSswzQjAjw//HOSzZ0wCS
 lwqZQcAOFtU8gzXifU10dMD3r8c1Uy3MF8K1DUwAO8EQIDq1NVZAzfQTOBfCCQP5kcv0p3f2e
 iAaKW5mJXngMVnMCjN+QL++k4aPjfZKQ9eBgcWMrxVpy5a99bIGyderbVJceZ+aJHus+7twsz
 maBjEm0SQQGGeN1niw78kMMWt0nKpMXcku1UuoQTPNR9qthJ5jBdqd9lJNzSnJEnvt1nSsKgO
 SRhmLeqYIXl7BXGUlVPux1wEhu0jwLxTCQc56AL1uQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230202223121.252073-1-jsnow@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index d42f60fb9178..59bdf67a2c51 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1606,7 +1606,7 @@ SRST
 
     .. parsed-literal::
 
-        |qemu_system_x86| -drive file=a -drive file=b"
+        |qemu_system_x86| -drive file=a -drive file=b
 
     is interpreted like:
 
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A653A256FAD
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 20:17:31 +0200 (CEST)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCRtS-0003jD-BL
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 14:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kCRsT-0003Jl-Ka
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 14:16:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kCRsR-0006LG-Sc
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 14:16:29 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MrhDg-1kzmmA2YgG-00njKN; Sun, 30 Aug 2020 20:16:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: fix ppc/termbits.h
Date: Sun, 30 Aug 2020 20:16:20 +0200
Message-Id: <20200830181620.422036-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PdaKPpRFr5UzfURB+WUfOPUavwZ0gqZ+5kZyAs5enDhJ/dFUgKG
 Y/OXn0DE7QCvU9r4oZimUFXZNPzPFtnojcyvyRxfqNRpKZ0MvouZl2TPqMMv8j8jCMWQ3n6
 hO+2DqYEdU6eN05iMjZQP57n/RHFnl9K5M8iIjaGse3uykArxZttkx724hXxV30sqVqa1e4
 RZzm09VG1y/+Qm2vHh0FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HPM5PoIHVvE=:evjc9K7Cm8xeDS/nC8SPXu
 O+GmUx3/EDXu/9Yl9Wkfa6BScWOKyr9Bib+QaPqoFEycyO9m22v82RapJEbmUwMat/gYo82Hf
 LNCpAQhHRp/Wk1P5Sq1vtYVd9KYR42iPbsE5uaBTOjI5erFpuzUGVw7kqErHpQLDNUu5qtkPg
 nP+dNsj7NuIWUqOvLjuBeOMGO9XpM9LXUiXihsDTx5Wx+DjUPzcV1o7ECtI80nukHWu6ohxPB
 wmZHbNrPm7x23DKuCzttPEmMSwcRHrQ99AOoMPxhFKqVFcUZrqvPoheAGG6Xmgmwyxvfus669
 Dx6Hun6qUK6f/J0qd7fN5TrBkiTgQ/Z4AOjgSLldP6AVYS+Wx1/2tz6pOYrfObvP8sr5PHkwW
 VAdEKcHtwOW4ojs+h4OX7Pq766+E+ppt6N4amndcVbHuWwdCKgJ+12rSUgTighCylzPg6YRUB
 4PzQV5hguFfQ79kr96O0eF3whuVryNlHX8yYrzkoWt7b4ptzJHgqiCzcf+5aTLsDN4Uqa4UaQ
 TCiCLjIYOLOL4N2yAaMbkjtqbam2Rzt/jLbZfWbbwNDm/j29h7SLT1Y7KTfVUFBkons2w9+JY
 L3xg94UsCPy05PmGLCq4mb9xv4xd4a+FNeKHQGO/hu7wYYpOjKrSR5cW87iH0IenQIMEFLEeF
 5hfD9GzA3jVrARzZdvU14amzJJSgDU5Xx2GCXYwPC20rt5rRsS6NGkjRdnULUTLNW5JvVUp29
 jVR1L9+4oajhCdPbWGl7xwSN6+ufeNV1ik1vHBInIV6WZ8VnFLISrpyOcx2xiupV6zWCQqiPT
 XEYvJYi1uwuBvs9asxpeZCG9jgjxOkAtYT+QELugAQA74qGDPNSGgAFXnaUOTLOvXDEEiay
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 14:16:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Laurent Vivier <laurent@vivier.eu>, Filip.Bozuta@syrmia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On ppc, in termios, c_line is after c_cc, not before .

Fixes: c218b4ede4f9 ("linux-user: Add missing termbits types and values definitions")
Cc: Filip.Bozuta@syrmia.com
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ppc/termbits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/ppc/termbits.h b/linux-user/ppc/termbits.h
index 7066d1e5523d..eb226e099980 100644
--- a/linux-user/ppc/termbits.h
+++ b/linux-user/ppc/termbits.h
@@ -14,8 +14,8 @@ struct target_termios {
     target_tcflag_t c_oflag;               /* output mode flags */
     target_tcflag_t c_cflag;               /* control mode flags */
     target_tcflag_t c_lflag;               /* local mode flags */
-    target_cc_t c_line;                    /* line discipline */
     target_cc_t c_cc[TARGET_NCCS];         /* control characters */
+    target_cc_t c_line;                    /* line discipline */
     target_speed_t c_ispeed;               /* input speed */
     target_speed_t c_ospeed;               /* output speed */
 };
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93C4BFEFD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:39:44 +0100 (CET)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYCU-0004oN-4z
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq8-0007yC-Hf; Tue, 22 Feb 2022 11:16:36 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq5-0005Xn-S3; Tue, 22 Feb 2022 11:16:36 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MfqCF-1ntPoC3cnx-00gGrj; Tue, 22
 Feb 2022 17:16:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] qemu-options: fix incorrect description for '-drive index='
Date: Tue, 22 Feb 2022 17:16:22 +0100
Message-Id: <20220222161624.382218-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W3be25eMGrIwj+ZQIR8oJ2BZ2AfhUMIDi7sSacHu7CJYPovVnGx
 jFdAZluKcjSouI9Pi1QjnLNU648IbcCldljXW686ZRxV8ePwI38yn5iDqwVTUpkIz2P2N2h
 E0qo3xDaU2Q9gjEws2NWak+xtbTHlryb/7StUWaL0PumctfTazoU5rweDe24zqazhVY/uvt
 X6tgtgcBIpwhFKaYqA7UQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9hxDYsm8f/s=:D2kqxTlZZxWjVIDaCAZG/l
 UPxdcPlTLMdBs9iNzquwDjWZg+59n85enF5PgZBnB9HRKB1pdl8UYnFdyTUQ4IuZVpJojQ47/
 INKtJnb6bALX0IMFRjqOZX01wirfOElDvw3kvagM4a6sohfRRMMUgC+0LpMtjejxGOJU6sqGt
 ztwfNLl926qWpd7DrIpIVL4eB1v4nbwW7T1BuZh5RaOKscRaXit7rgOQaQfIwwD/tIPy4gqot
 /MmQqe0eFT5UGmMFcOwTBADI7EmHCWTnTQbV+kEsx4VDGZtz0IVOAt2GKhKklko9VaRXgeYny
 EgWnPzzqQzs4UTtnjTht/DL22gTax6yjiP8pTT8I+g2silAcX2dd34/m7yUZKJCmDfqdI0Ghu
 Hhm/RyNfEpsjDQaSMYootZkrcqERPCmqfAW6jpCNqOJV6OFGEP4AQiVDjmRBClPWKwsPcoDAI
 67O5xhapmgtMHVyQZT2l4LQ39l2cJOWGAmjDiuHzjjAtKZ4FIpW43+0Q1X7OX1AepimptWGlp
 nMBhMlyFioHOElcaL8q/ZmjSq85kqlG3aoI+5GZaP+vHg7Hk650cfJ4U5ARJMkOrluFcxIB3e
 sWrmG1hAkw01qzzUV2CabKXOAm3IA/Pzb48ANrhU2qOGxGe1HAUUbkZTSOhJNeUa2qE/TXiQi
 VGE8q4zcXqKMhExKVeSFVL3/SSy7k1TQTqHtTPEgMr82GO7D8wtHlKsPvZR9Odcc37NQ=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

qemu-options.hx contains grammar that a native English-speaking
person would never use.

Replace "This option defines where is connected the drive" by
"This option defines where the drive is connected".

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/853
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220202143422.912070-1-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ae6a42aa3..094a6c1d7c28 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1377,7 +1377,7 @@ SRST
         the bus number and the unit id.
 
     ``index=index``
-        This option defines where is connected the drive by using an
+        This option defines where the drive is connected by using an
         index in the list of available connectors of a given interface
         type.
 
-- 
2.35.1



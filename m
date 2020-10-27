Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4029BC5D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 17:40:45 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXS1c-0000YU-Ex
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 12:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kXRru-0006x7-Dx; Tue, 27 Oct 2020 12:30:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kXRrh-0001aD-JC; Tue, 27 Oct 2020 12:30:39 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MzQTm-1kBXKA2P68-00vOj1; Tue, 27 Oct 2020 17:30:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] qdev: Fix two typos
Date: Tue, 27 Oct 2020 17:30:13 +0100
Message-Id: <20201027163014.247336-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027163014.247336-1-laurent@vivier.eu>
References: <20201027163014.247336-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vutHXu59JqKlWK1+atu2+NTtJrPr7Bxt8jFHvwZupN3YX+wT/yn
 qqOvIxo5DAcxm4mCiOLArZp9zEhF2Unqww6aky+7QNChpeMR4fAkfAIkgSLP7w/6Xx1JVFp
 N6H4uB1+1qDf2BseKbQwewAfAe1B640YDYgSrsh9qWHpI7T94v8AtUw4RdvjNDg9P011LZV
 R68fvbXWDo7VbhMdIqYxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:prEYApemcak=:SFFemDd9lW7h0u5MZiQrcF
 Jh16Ja6kxp20SpPHL7q78ylUy48krJD9Lwe621mQog/eyNlsYZCRwNieQ36PIwJNvc5XpBNFA
 ywcWfgPqewi52H/Wzf1GnIskFLr77wEp7aYoMQqGgwmNl1xwJ38hRVrph7F6Pm1VM2XZEOAXo
 cMAyjvPv0R5ZxInGMpoMdxewBazXt2dDax1QrIpNmXCdRBYTX9ETcpNNlY891WDBEGXbdX8ux
 li4aJRFMK69bBGN8PS7p2eVxtpzed8fULSZYhTtsdg/Sgu5k97Q6WRx75aAnrqtzrsGAfXq4a
 LeQyL4lc3V2aIJ7HCo3nrXarWs8JGT32f9nSYULZjcOyvUKEuM6m8pKRiZ6QUniToAlkWZJPM
 fwG5btOoUZN1vcFlX6gQLQXCysFfvcFye92vcB1mJzpLHwal5z+VY/zdGL2WuvibjBB+gtqsx
 f6tFT7VwKw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 12:30:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201019163702.471239-2-mlevitsk@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/qdev-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 868973319eea..37611868045b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -163,8 +163,8 @@ struct NamedClockList {
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
- *            When accessed outsize big qemu lock, must be accessed with
- *            atomic_load_acquire()
+ *            When accessed outside big qemu lock, must be accessed with
+ *            qatomic_load_acquire()
  * @reset: ResettableState for the device; handled by Resettable interface.
  *
  * This structure should not be accessed directly.  We declare it here
-- 
2.26.2



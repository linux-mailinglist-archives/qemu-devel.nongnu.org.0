Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7804DDB2A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:03:30 +0100 (CET)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDCT-0007eu-LS
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:03:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtM-00087i-PE; Fri, 18 Mar 2022 09:43:44 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtL-0005Ig-6X; Fri, 18 Mar 2022 09:43:44 -0400
Received: from quad ([82.142.28.230]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1PPJ-1oGBmN2Av5-012sEp; Fri, 18
 Mar 2022 14:43:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/pci/pci.c: Fix typos of "Firewire",
 and of "controller" on same line
Date: Fri, 18 Mar 2022 14:43:32 +0100
Message-Id: <20220318134333.2901052-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318134333.2901052-1-laurent@vivier.eu>
References: <20220318134333.2901052-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yjn0dvgFYl048uvfSVcIlYLAZRr9QHHxp0csHsqdZeVhxCI/FdA
 +WE3LCLQn8IPWNPL+aAaNE0MzI2z1VBc4LQI+qPyM3HUpd/CIfsJCDwmHLlDgxmAydS5OIt
 0qG7qNEdHHv4ZCSx1BNJNNxtEj5iS9YzzeU6T34I+Z1XLGEv+gRsO7Bya1s1ZG6YX+525Gd
 Djb8cWBZfVbjD71TDNybQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kr6bSQxOxL0=:VNn4WSJqyZUfDFwWSzyzPT
 KfrRHxooSNjRWpJSMnM0xCTGuzlUXBBcTr6jrD3hRzxEBA+7CxghGHl9sUjzktvH0qZPLYlIF
 AFBVBe+Z+ljxjNOPRcd1LV8Cyzo1/NpTCrx7gxxvfgyNjY4Zr4apsJopA3o13sC4LLDcUP7p9
 10f3nr0rKTSNAUqpqUzBI+CwlIglud46hDtlK3iM1mgMH5B1zgi6ITlhOVZ1GsjoGNMpY6iDH
 IFDL82wRXe4laZOGR7HnHfWiYFYPwU7BywmCnjUoGhTfFOvlsv8fv63RbwNinmwanghCvuqfL
 4OnAl8W4GBBK5MxAsJiUnGz5dBPy2VL3SghIrVYBvcQ/wXwylEMBVQCmOEz+678VAQkmgt/zX
 Hvx5NJGY61Pxy2TYw7kYGp6AbHYLCQo2/N5/Y+I1DYBpWb4BKMFYsVFIJ825Yl0N7llOsJNYg
 TJYqqurbfqqBWoy4VBXCpwj80fYTaJA2dBP4QD/9/LqVY+Cn5z+AXAT+3hITsilUTCP0hREvJ
 F1mYGpYxYxvg2BzGzplToaDc36SmgxPoY8622NKgo5ut5TMZuC6KqXmCB15cSAVFZJ8x2J7CT
 2pu567/+89D1wyVyejqPZCZlyzQ/H7LwNnFvkSpMjxh40ZVxNOontCQIcfIcpDdzZnHG3K4FA
 IpNwfBxruMwecLbBMWtilhsDpm7Vf+XTbtQjJpM6kdCYWYPeLSxJp3BloSJ6aCJaeem4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <quic_rcran@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rebecca Cran <quic_rcran@quicinc.com>

Signed-off-by: Rebecca Cran <quic_rcran@quicinc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220318101124.912-1-quic_rcran@quicinc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5cb1232e271d..dae9119bfe5f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1697,7 +1697,7 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0x0902, "Mouse", "mouse"},
     { 0x0A00, "Dock station", "dock", 0x00ff},
     { 0x0B00, "i386 cpu", "cpu", 0x00ff},
-    { 0x0c00, "Fireware contorller", "fireware"},
+    { 0x0c00, "Firewire controller", "firewire"},
     { 0x0c01, "Access bus controller", "access-bus"},
     { 0x0c02, "SSA controller", "ssa"},
     { 0x0c03, "USB controller", "usb"},
-- 
2.35.1



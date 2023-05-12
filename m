Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7917006B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrI-0005zK-SB; Fri, 12 May 2023 07:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrG-0005yK-HJ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrF-0002Nx-0X
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MiuGK-1qRHy22WXc-00esN3; Fri, 12
 May 2023 13:22:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 6/9] linux-user: Add new flag VERIFY_NONE
Date: Fri, 12 May 2023 13:22:35 +0200
Message-Id: <20230512112238.85272-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+xfPM3iDdaLbeBVT++aWi23UYN92M5nHH0NUXbj6UzguDtFcrL2
 FTPYde8iFLEbh3Qx8c2gvBHkia/4MP+Vfao1fbAVQN2YhsjwoIdeQrk/DmcfbEGnmwC5kGe
 M7rMtDVpJPCN+JIETUFe1wbUs+Q/mm2HlAVYK68X/+olmAqqjSxZMwyk2YH6/QWZR3Ve8w3
 1YoEL2cjksXlkFPtGsgZQ==
UI-OutboundReport: notjunk:1;M01:P0:qfM9XZ/vedY=;Q62LfUdFee6vl7PbCKaSCYpwiGw
 6/U5r18ddctOWSsohng9gowTudb9a731Dw9RpVjrddvaexYcEI15MgfVKjK1ZTwSWjiPBJqMN
 8ew89SvKb52Ufg4EQN06NNmnz8+DIcLQif55cMjsXtIrd1esisTgg0Jby4D1vXyfzgn8h0bD9
 3bCToWfU+RYOilrwj0BcrZTIL4LpeUlz4MNanuIYDIJ58xbaAD1/LkmAiEpCUtCQqTbIC8jpJ
 szmDu74IePoM4hWUGT+rqTTiosQUbx0JIuDawAuPZBa+6WMhEWRDZH504oXU7H6ZUe6JT7gyC
 xhPCWcD7HQin98Ns9IzgOadQ73MN8NEE81eOoXvyXch1z8DvfGlkcs0mq0GLya2x7MBKVB/OD
 fQhK6HondrVtcMLf2ZlRLrHWGwIvR1dmeTAdW3nw5dU9l2GkhLJbE41z/MS4k2XUuvb5LKNhD
 ezLNu2Ljq0suEvNDlzqThN6Br0qM3Yx/Dq+Z9iUIsNoA4xn9zfBk3iK7+9B+yHRjTN3tuSOZl
 siIUG8Xf954GdwqER/jS2z1PerLfxB42ES9kUYsH9GoG9G4ebfU4DqJ34xzyb3BAtL1pnJZG6
 3Xap6FCm6+d7bzqQmxuE/rY4JXvHgRNYu+F7CNoLBqRcx+HGR6z+xDrS/+sqncr1qzWMU/CHR
 9b0SipoxSCapyV69mYAtp66roFClyKDiix2YamooKw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

This can be used to validate that an address range is mapped but without
being readable or writable.

It will be used by an updated implementation of mincore().

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230422100314.1650-2-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index e2e93fbd1d5d..92f9f5af41c7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -168,6 +168,7 @@ abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
 
+#define VERIFY_NONE  0
 #define VERIFY_READ  PAGE_READ
 #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-- 
2.40.1



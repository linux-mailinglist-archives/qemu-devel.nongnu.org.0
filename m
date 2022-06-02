Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39353B909
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:36:54 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwk4K-0002vW-UB
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTX-0000jT-5G
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:51 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTV-0001Fi-Hi
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:50 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MmUDf-1nWR422KMD-00iRIP; Thu, 02
 Jun 2022 13:58:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/19] linux-user/strace: Adjust get_thread_area for m68k
Date: Thu,  2 Jun 2022 13:58:36 +0200
Message-Id: <20220602115837.2013918-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1i7W3jUYi+QzdhOVXBzBgAwSkthVMLDcViHEt268kF6hzJUTHls
 42N81pfhCQLkI7K2avYmtSkLilpBe/7bjAVID3I5xcqjFXj4s7gDZuYSQDXBXhiQ5upzdnC
 J6+qO9aiY7Tt4JKo6SwgkPpHIO0NfKGkz128Umiqe1JBaiIS9utYQOe+88T/txf/xzH43ca
 zpMbLl+Z10TU3e0OGys9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWWXOEpeBKY=:Xd0oqVL5il1pHXarfkD11C
 Y7XS5H8Q3RaTAGARl90Fr50HPXyvzbVvv74sdv6X9uld6teKpA2Fx/JZH5nKMkv3s5ZF3OIWO
 nHNzrmpQzcObprc11fayI8EXghoK02rZdNq0E8si24NLsD30fVD/x+7z4xkE0ruHXY82WUyX/
 2sKu2/hslThDqlFnGmSxn6Ncm2/57Uct8mvywZ5LxMpSEtIWAwa7qYKhQ31D05IEBsYwf3iyN
 wsv+j1fMuSL7X58mnYCCsRgGMJVZc1dbez9qUFNffqeEB0WBuYDlOOE//nLPrtBiEQMGqTXo5
 8tFpALWvL4wXok/a74RRo1rgq8FmlTgfe4phZDCrrZpfLwVbJakLT5D9pMp8KybrESLrbR3gb
 uIANw3I8s3QqosHL+9r64hWyzcwO8I6ZFgwmx8OEiOAVAnaXalQgUjwU1onacIdSTBxX+2ZgU
 ISUOhTOM35d/QsllQhZTOrMBx99f9x/OayhwuIu25Qh8nrEtCqZ6DfTQydNxTUJzVYm3PFaB8
 BreZ/+tN/vFzYvhq4lz/ex6PsPMDYv7Da7JZNLHpvm0RcEnA5I2HR36l8FBWCtoOZr3sKZVyP
 ZYoZLi16qC2ChUnbs89n7ThYhA5tV393fhqs+FamLQN28qecAZQz6XdUoh7NUysAFaqq37dCM
 o3S6SIKiU+cdDeQOYgyJDsDMWVTveTXZcYhAGm8xlSp5pMJ4Y50u1kmJ9kQIA6LqDvDEbOTXv
 TRgg9viJw7rxMtn8DxsTfkmdDMljAhAOcbNmZg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Unlike i386, m68k get_thread_area has no arguments.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-17-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 278596acd131..72e17b1acf00 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -384,8 +384,13 @@
 { TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_thread_area
+#if defined(TARGET_I386) && defined(TARGET_ABI32)
 { TARGET_NR_get_thread_area, "get_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
   NULL, NULL },
+#elif defined(TARGET_M68K)
+{ TARGET_NR_get_thread_area, "get_thread_area" , "%s()",
+  NULL, print_syscall_ret_addr },
+#endif
 #endif
 #ifdef TARGET_NR_gettid
 { TARGET_NR_gettid, "gettid" , "%s()", NULL, NULL },
-- 
2.36.1



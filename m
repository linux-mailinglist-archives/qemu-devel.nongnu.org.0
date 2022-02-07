Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C874AB7F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:51:11 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0fu-0003I5-Bl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNb-000671-4p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:11 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00079v-8y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:09 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MrQMz-1o5CN93eHH-00oXMM; Mon, 07
 Feb 2022 09:28:05 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] linux-user/syscall: Translate TARGET_RLIMIT_RTTIME
Date: Mon,  7 Feb 2022 09:27:59 +0100
Message-Id: <20220207082759.180431-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jg9+agnubygE5SdtZeG1ukGgzNqycvCNS5EYRI27i1V/9G6pbDE
 adWadQsBbXrCQHO/8WOZovhxp30bsL/gyyY/G7KVhrSJ/6U7zqwnjlkqSqJbanT080mtBqk
 /rXfU4gDTvXJdg7iusef05Euh8OtTMHtLri4mbVADvRSceA8wyzqXaYA+8A2P1QJsyjSdaJ
 GQL05x5CTM22gW5mZVJ7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C0++J47Hr4Y=:9qV7nTbe1O8H6NhJ+rpydG
 t21olrx6ltCbpO+vX8HC+IQgR+c8/dtEwIVe2ar2N2jmmDh/YlxmW6c6Osl1NxaClIgGWDWoH
 OOg1tEHOhdEsxqgJQPmFhx8bakRezFd/zUAy0uFpX1pHo9bpVtvO7qrXwiVBy+v7FEnG5K/MB
 x7g9xhKNQuwDJdZp1BZIC7FeFtmbsbVM8gzPBY2cMZ/B3F8kYW7LKfb6OwYhnQIivbMZ50Uqd
 adsK4fiKzr87G+E95E5AwbUGv2KFds8q+95Br7/mwf3tOXvHKfnK5wdPYfzBmP79ND2SzBgXf
 GXhVmnM+7e+0XLlJahdTEJbeXOdCNbcu2tSZuXGobl+StRiNq/PksNR2KoZ8Jg3REi3+wHHLa
 Kqb33MpV+kvGS+YiQQX1DWERxvJYGN8hJs6hgsXP04bh/91OC9C6spqhIdVbBL5qJA4E1Sjpn
 Xdg7F6cxlG8HX77aKHvQiTlKW/EeNiJH8PJcn+QwwPeFoKOgiNqlzEz0Ni6b3owJx6Rwr8KUq
 WAj+RHjXS1sCJIOpRNPXHN5U1ym5WJjMh+Xpoar9ZFix+oOqyMmJjSr9Ipbs6laPn8sNuKeEr
 BZKsVGROGsKM6S9f6uc23/WSVl1x/VmvcZ7pFgOQxwF5oocyacQSvMRdiPiLnz5pQlsfAHwCb
 iKcjs7g7aNoKU3r8hbO7lc9kl0E+NXz8CdYmZLPn0blXpP0v0CMuFH91l+PHuevwlbC4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/generic/target_resource.h | 1 +
 linux-user/syscall.c                 | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index f04c93b12596..539d8c46772e 100644
--- a/linux-user/generic/target_resource.h
+++ b/linux-user/generic/target_resource.h
@@ -33,5 +33,6 @@ struct target_rlimit64 {
 #define TARGET_RLIMIT_MSGQUEUE          12
 #define TARGET_RLIMIT_NICE              13
 #define TARGET_RLIMIT_RTPRIO            14
+#define TARGET_RLIMIT_RTTIME            15
 
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b3948d13a9dd..b9b18a7eaffb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1053,6 +1053,8 @@ static inline int target_to_host_resource(int code)
         return RLIMIT_RSS;
     case TARGET_RLIMIT_RTPRIO:
         return RLIMIT_RTPRIO;
+    case TARGET_RLIMIT_RTTIME:
+        return RLIMIT_RTTIME;
     case TARGET_RLIMIT_SIGPENDING:
         return RLIMIT_SIGPENDING;
     case TARGET_RLIMIT_STACK:
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2844AA5F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:15:04 +0100 (CET)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNDc-0000tc-0Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBP-0006aW-Fi; Tue, 09 Nov 2021 04:12:47 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBN-00054m-IV; Tue, 09 Nov 2021 04:12:47 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQdtO-1n6yXm2Vew-00Nfq4; Tue, 09
 Nov 2021 10:12:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] hmp: Add shortcut to stop command to match cont
Date: Tue,  9 Nov 2021 10:12:33 +0100
Message-Id: <20211109091238.817997-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lhRfalLnFpUvJ3sdmhEeBscGz9xw0pJs901+NAEYLiisF9Ro+xK
 KXnpzsZDHoOdkVp37ELJHzb8T3zemf1vZszWBbKo5G0LS9G74r4SJbkG30ijjCLkW+7xAtn
 IYg6Q/7jxX222rKcuS7NgVX9rRhvPYOez83u0shLnLmTCqzP0WJVpzYHm1aTiXh5lsA7BA/
 0kvjg2qcmgDXNEKG6Zrlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pOlZqhM0fi8=:Cq6L+eE/Z7ZdVjpKG8yMpD
 xCxD29NsQmISrCxlKnP9ilX0ZZymZZi/7a90aS1VNrfnNrG/bsrq4clEVxz4TOewI3Mx725Vj
 XCnFZep9IbSi6w3wRXW0eGFb0IwFB5Gjf1NbbsxqBDHawi2hoAb1Zp1dQY6NqrgxXyX2ulZR3
 M8kUfMfDwJ26Lm38k0hSdXZw8EAnhLkRGVwZVCQBkKLEq8DUqEvhjoQK7BApjXedQpII5LxOp
 c9b7Bv8Vu33UsfrmOEzsWWTBXEijsclVel6VtGvsLbeCx9jZdzccmhW/ki2Lh9R9r0jA0THbV
 oT9/gb674XyjQppPGIjhBa5jCeA2JNtV+5S/2spVEcKqkK7/fBYrpihtqq06lgNKHR84B3YXX
 KjJflkYcx1PUiNgMSOnWqCWMS5RcowhA1mpIB83zb6yceT4TXYtPHeX/gbXTh4+Z7Y3kCcFRz
 GdorP61w2VXb18Lzhdq7YjwQ1i1YbdNJQPke0M/MJdP/y0pZ54Ex3aY0p7pF0IU5N2/dx+f/I
 hTyjvLmSLGAs6Pr4ezRaCCpzQ4zkEF/X2eAQHWFFefhdTh0EtN4M4fTOIQLgqXhKb0Z2IH56i
 TjPBnIjlq5U+Oo7Kaax5ElbsGfloMwP3RQavm+FQH3ArZwTzFlfejG6oXfVzaM9kwBvxGlpCY
 hJI6UmMdHvRfEmzvuotSkyKhGZ+Y3Ybh1fTu/GznkpCO6EohL+APlP3AmmK15fnxsAI0=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Some commands such as quit or cont have one letter alternatives but
stop is missing that. Add stop|s to match cont|c for consistency and
convenience.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20211030095225.513D4748F48@zero.eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 3a5aeba3fe8a..70a9136ac293 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -382,7 +382,7 @@ SRST
 ERST
 
     {
-        .name       = "stop",
+        .name       = "stop|s",
         .args_type  = "",
         .params     = "",
         .help       = "stop emulation",
@@ -390,7 +390,7 @@ ERST
     },
 
 SRST
-``stop``
+``stop`` or ``s``
   Stop emulation.
 ERST
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CFE369BA4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:54:30 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2on-0006TH-4h
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b2-0005sA-5P
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:17 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2az-0008AS-Fr
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:15 -0400
Received: by mail-il1-x132.google.com with SMTP id r5so1545014ilb.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yn305Hv7LfS1sfcLCaTREAMIUN04dPOLVdhMLNpl6lA=;
 b=Ge4ilK5k9L2iWq8Td8UPPaCHHd71qMqeelfIeE+Nmm9cy4m0bGKGAkPEwF5+545oJq
 cDHQRszhaqxjnUBle2rXkRSGU89WKvysxy8L9EXaew3k5LCZDFfM3W1CNM4y4CMvBZoa
 CWvcOMESxA/PSTTDHp2R8OGdmy3ZlbI/l/JbwxH+G44jsibKl2IoA29W7hBd2uPPMAzF
 trDvPI4u0IzvuZy7Ei95S+Qg/iyFmedGWRgjpa0nZoLnRdoH2Av9r7otsGz+YMZPWTqA
 sSt8FOFymWbAHhtiFrBqpqclPvZug064ImuYOr05pKHsJa7t/VXg/sz87P8OUfTwQyRx
 JvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn305Hv7LfS1sfcLCaTREAMIUN04dPOLVdhMLNpl6lA=;
 b=e8ScKr5l7v1uwyMsVND9sbMNcSRw3KPmMSVL3AjmUbrPLA71hF4QdDZE8m5U6BD1cJ
 DQ2+s2bWd2luErK4uwBgOKm7t1NhWFd/oWI3tX3iTd8YhhzgjTZd7oODAw6179AeO2bz
 X5C3Rcoox9H1a+Elf4SiV7ukFDuaRNy4rd3Y0Hp82pt2oeLUOkPW6ub5ss0m/cGua/bD
 1Jlc3/gwCwH2GXnslnAWsve7/QUf4tLSDtoZPxC3kTwy1//+JOu2Bkk5YK4TuDW6UEMn
 D030Zx2uI/p/x75c+xhhQrWMxE+bPRUgjRVdxUdlL4vqJ1eJMj93aqj4bHQSFtE9lLTX
 IenA==
X-Gm-Message-State: AOAM530XXddlNwmt5KTr14AqHrBXy1lwGdiG+6sTh9P3veU0cJPF7nhv
 i4C6uipXlqPV4V2rNaYJH+7uHpDRGTw2qKBQ
X-Google-Smtp-Source: ABdhPJzQQlF/LKRm1+Rz2arQNClbjbgSOpsVXbTY7Cejq6gosoL5ByplWl+MXX2J1rU7dSTPbZVZwA==
X-Received: by 2002:a92:1943:: with SMTP id e3mr4306132ilm.166.1619210411222; 
 Fri, 23 Apr 2021 13:40:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:10 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
Date: Fri, 23 Apr 2021 14:39:47 -0600
Message-Id: <20210423203959.78275-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ff886de98e..91603f5ac2 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -245,7 +245,7 @@ void cpu_loop(CPUX86State *env)
             }
             break;
 #endif
-#if 0
+#ifdef notyet
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
             info.si_signo = SIGBUS;
@@ -340,7 +340,7 @@ void cpu_loop(CPUX86State *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-#if 0
+#ifdef notyet
         case EXCP_DEBUG:
             {
                 int sig;
@@ -589,7 +589,7 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case TT_TFAULT:
         case TT_DFAULT:
-#if 0
+#ifdef notyet
             {
                 info.si_signo = SIGSEGV;
                 info.si_errno = 0;
@@ -609,7 +609,7 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case TT_TFAULT:
         case TT_DFAULT:
-#if 0
+#ifdef notyet
             {
                 info.si_signo = SIGSEGV;
                 info.si_errno = 0;
@@ -629,11 +629,11 @@ void cpu_loop(CPUSPARCState *env)
             break;
         case EXCP_DEBUG:
             {
-#if 0
+#ifdef notyet
                 int sig =
 #endif
                 gdb_handlesig(cs, TARGET_SIGTRAP);
-#if 0
+#ifdef notyet
                 if (sig)
                   {
                     info.si_signo = sig;
-- 
2.22.1



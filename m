Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D49369B84
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:47:43 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2iE-0005Qk-SC
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b4-0005sj-6a
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:19 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b0-0008B9-0e
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:17 -0400
Received: by mail-il1-x132.google.com with SMTP id c3so534341ils.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFYbyv1FT+tAXydS/iwoVTMJ63xlplCM/Sxb0YyvmoY=;
 b=I1CZQQAfLarnaI9CzdtVMq6HNHwxfyYrx6ctAXQjhzC0T5aeJyxk8qUariDWpA5ni1
 ozhrUzRsISg6Wyk8Cv6BdGtQDUyNeRtasuSDzECDe4yII1Wavx6tjo5hnV9ltgDkN/8U
 pzFbkvAZtcP9Zt4X7itbZTobbZ4L9WM8Emdg2iM/6aMMZI6Cr9oJtOXwx6FDqN1JxnyH
 mDkuMiWyQNJxpdkcB8oXmNuRc3hHqZjmEiBcuJFE0CzHhYZLKamqt5DWMpeuw6FePvyI
 +quZ1xiyK6laBcy/R60bmZqOlhSQDDEarN2paVonGYQB9GAEEldxCL4oHgDDKN77/idK
 mAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFYbyv1FT+tAXydS/iwoVTMJ63xlplCM/Sxb0YyvmoY=;
 b=d3mG/8kyVpd2htfV4yHG4oSyPiuEjTAVXGeO/FBMeSOo/F0LiwfxS9dRfw3A3hAMq5
 FQ2vVedKlQz0Fe9tCgu3PSciJtaUZjMEr2umytRc2WTaVXd9izhmyYGcFYUNW+avi5XR
 PzaTq/MlnWVU2wB1owkelKNOHedJ5qpw3H1+PIRcKb16YeQd8X0k6cD11ofBfRBKctsh
 rytZO8ZJfTxstLUXFOLn3HkfJ2LMl+gZRabqc6kkMcVm1qr1V0qA4I53hQz3hamY8+BB
 O0/JnYlvDnxCPWn4HcLt/0lEVIFHuzd4k2MQ/N6yAehWOj5mhO3PenU1fsnlk3vsH/HQ
 FfNg==
X-Gm-Message-State: AOAM531aRrBuMF16GGBNM+6emlzXMlwZYDV58vG6IZsB5LfE3Jv7k5UH
 frWiMXFH3xSnTddTTq3iekK5UjirOJIfZXCG
X-Google-Smtp-Source: ABdhPJw5STzXHCBDMx4UQUdK86MsGk3iY7me+HWqH5x8otPIKfr4zSaud1CCSqNXe/Srazm6zFZyAg==
X-Received: by 2002:a92:d68a:: with SMTP id p10mr4410139iln.40.1619210412803; 
 Fri, 23 Apr 2021 13:40:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:12 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
Date: Fri, 23 Apr 2021 14:39:49 -0600
Message-Id: <20210423203959.78275-5-imp@bsdimp.com>
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
 bsd-user/x86_64/target_syscall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/x86_64/target_syscall.h b/bsd-user/x86_64/target_syscall.h
index a8e6274b76..9a6e072f87 100644
--- a/bsd-user/x86_64/target_syscall.h
+++ b/bsd-user/x86_64/target_syscall.h
@@ -59,7 +59,7 @@ struct target_pt_regs {
 #define TARGET_GDT_ENTRY_TLS_MIN 12
 #define TARGET_GDT_ENTRY_TLS_MAX 14
 
-#if 0 // Redefine this
+#ifdef notyet /* Redefine this */
 struct target_modify_ldt_ldt_s {
 	unsigned int  entry_number;
         abi_ulong     base_addr;
-- 
2.22.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3743238F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:14:18 +0200 (CEST)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVHF-0007BV-28
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8z-0007iz-1d
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8o-00080M-Ai
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: by mail-io1-xd2c.google.com with SMTP id 188so16852127iou.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIQatE8dg36Pa6PMFl/HPTB8wrbRocW2ZkkMxKhIlVw=;
 b=J3Hd0QxPP+BvFU76FcNWnm71H5+zSoT37RNY0qCn5n4q43UVNuACgO4Ef/RiFlNXTK
 Dpoj87wuJAu4b8tO7kl1KPE3AK96GJYRBECydh+MzfVzpQ7F2yqppnp3O8tGvrn+Y6Dg
 7AW5I4g3SahCHUMq6N1wExivco4TbY7CGuIWP+BMsn6TfVTmMDcAwGHc2VpWW446qa7D
 /pWmAd0YE4F3I15S2096yiHFNziZga7CEA7Rj7VTyrCoqSLIS8ZBb+aMJiYA2kidls++
 W0UW6GJNnnT+VujaMuYWu3YJ3s3gMw/N/2vOAX6tbbCz36xMUwq/yQijYsZNIaCxxal9
 X2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIQatE8dg36Pa6PMFl/HPTB8wrbRocW2ZkkMxKhIlVw=;
 b=RMtP3+8Of11YY8ABKWD4apBnyy1Ti99uS5N6NrEm1TXvGGGHCYpkltefIcsmobgWWG
 C0PRrHHR6dIuPaLkRQIUmUOf7FP8wQzKF1BdKuihtwBYdVntpw8Ao7f+8x3E4RIoIHpy
 sOcJO4Pgo6X/GgNBhUpjRvZTbPQFsRj1Heapx6qjsjtXJ32/LhJKWrz2ZsDu8ybcqKMj
 1jwmdU20ybvxB1es1SubuI0QDDzz+cpd4xiXSiXm+aXFqDWOvdIAkZK6FrZx9LeEmh1G
 5r26BNlXHiIo3O5SvDFLX77eYurBxvKZzm6aXYpUJs6oSNg4fqJUJNaBn9zBl+5jIiTI
 vGhA==
X-Gm-Message-State: AOAM533lqRY6Zjnu9JUzcCNgoFRVuph5CIX94nyHeLMenISq9s7t3EBe
 aTzbHyko3/kchymKPncq+P705F9HdPtn9g==
X-Google-Smtp-Source: ABdhPJyleBmCvrQHxN1g7eX5m1nr2H2Pmy0vg1WY8I3LZtNWISxE8R4FODrT505VxkZPBugTqNxLcw==
X-Received: by 2002:a05:6638:293:: with SMTP id
 c19mr462227jaq.21.1634573127751; 
 Mon, 18 Oct 2021 09:05:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] bsd-user: TARGET_RESET define is unused, remove it
Date: Mon, 18 Oct 2021 10:04:48 -0600
Message-Id: <20211018160458.1976-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/i386/target_arch_cpu.h   | 2 --
 bsd-user/x86_64/target_arch_cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 978e8066af..b28602adbb 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5f5ee602f9..5172b230f0 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
-- 
2.32.0



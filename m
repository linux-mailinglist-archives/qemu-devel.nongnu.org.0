Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57064443981
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:18:42 +0100 (CET)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi33B-00070N-G6
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fA-0007t2-6W
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:52 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f7-0002um-0a
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:51 -0400
Received: by mail-io1-xd35.google.com with SMTP id e144so597252iof.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBbYIrt8GgDPy1/4QZKIQdNANGpuq0OiEn8qWDZ8UEI=;
 b=Q4VzVpf+cOExfAXn3gy3wLjiuPaQWSjqH2k3f/0D2iWiGYycbF/wKUyZ+au+kDUX2Y
 OSyZg7k/C+qaP8VRMpJlsWmKey9UcTRQXg5plF5rphSfzyuI2/ov2j7AgsnXls6eU2J2
 dvWR4GSuJuT2/1hp/ihqmu8W4uHq0D8EXlvTnXDhgFMreRdMfeiIT7WJkWx8cETFY7sk
 aripA5LT5Wh0qsB+PQOjh+ilFHmnmG1ROYPX/dh2JGYtgduoDJK/lGdw6cTVYMOZIzW+
 tou5xreG/Rg0VZKfwbeNK9PFIpWcUTTVDQzoOQBqzoqk/X9055ZExf1cFKF8YHEN6oFk
 RRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBbYIrt8GgDPy1/4QZKIQdNANGpuq0OiEn8qWDZ8UEI=;
 b=7uNsS1GGbA5hCwwpRulySqRGOTuLiHF7/Dpuzhn1T3juTNJzFA0LJLEG6SIiHLD7YI
 gUB/d8mOyc85+zsNX7SRNUqDDUVRJzyaF3subBUf8//A0mlKzCc0OM/Oa8s5nvMjrDep
 Ku4v8WMmFO56M4COebdECtO5n4Jy7TZBwnszwyybSr6xa2rzoFncaGcbWxwVKM5TnvHE
 2lSAd5XbYX/6vpNjsK+oB6gQa2YFy7zifRdhOQlK3vDEhVIxJAm7fhydFZ2Mn9rtX8kc
 9z4tET7WjNCY+oOmspuS9DWncY4xd+a6VnQrQ1HcROBuoPoKVQBc/px3Wa8zq84Gzhja
 N2sw==
X-Gm-Message-State: AOAM532wqSrr9Ap/KpVVqqS2daAn2f8JMzPwq9DDZSm9gYbOsxdpCO13
 xuQXeHsLyD9IoO8wyhDxc4tMkTHwe/R5lA==
X-Google-Smtp-Source: ABdhPJzgssMUhigVRBLna/CcLAtTXTDjEOYGJCYKQRaThHR51obui6BX/6nYT36D9vnrCjXZ21tbtg==
X-Received: by 2002:a05:6638:1502:: with SMTP id
 b2mr30614514jat.131.1635893627807; 
 Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/30] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Tue,  2 Nov 2021 16:52:46 -0600
Message-Id: <20211102225248.52999-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08b..55f742b0a8 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0



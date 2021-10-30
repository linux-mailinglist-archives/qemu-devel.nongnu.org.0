Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A7440ADE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:03:30 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgshW-0004G6-2A
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryU-0002DY-RG
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryO-000095-Sh
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:58 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y20so1544404pfi.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=hdvxRhN9/MmKPfvGfh1+/FXOKxtpLNrLFFuwTDTPwDY7Nh8MS0TnLMpv7zBjd0gwGU
 9Ks7LQF3Mzvx+Mwckf2v4CPQMtAl6JOvcR2HW+YelQ8Em0T57MHBoYY1SIlO9t0NGbWf
 LD+6HJnQvjNEjhaiA8Ya7W2hgCKMf3Kw3q55WzFST4fiY7Ei+D/XAudzH4zB2LU3SUUm
 3wbK2z/7x9+zWX6aHgex33o6OTaWUBdpVrRzVILXHGgJUhHIJSTZzfq8A3NuaEhXrsi/
 d63CDCaUTFMWHK5S2o/GZ5DqAOHK74v5jkedLDctl/7IEsDcSa4MKVnfXLnwH9Cqr6D9
 2bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=wdHsU4u6epNsS+BTuhgCoi1bMKhQdAi4yR9OqHyWCkBqJoYvWrqoSkYgwzSuUkyxhp
 XfcwtUpAXDix/12HDNDVBtheCVpNMR7mB72Bs8GEibuworto5tD5raDpiT8vK97R54gN
 f+KPXK7ThLBc1tWjIUkuBrnMPoLSB8OPz0XNIKVJNDB0Ym1j58RwkVOv+SFFRVRa/QHL
 IfHSDMhUaVmAX52I3Mh3PYKutSRurniIoF2/psroY64aZPCZk3KLtnQqQWua9qyXdAe6
 Ko4O5Az0br6M3Ekxi/LwMPeaJi5YHLSbJFYU9l68/93o/BMBHwjAb54KvLR2m5DEv+OV
 npug==
X-Gm-Message-State: AOAM5322QKH9Cl3VNJ3WFSZJs9/a/Zl80nDmKW1OQLLBGrHx+gZqpmya
 WWWLxgzAROE1NvaHvK0cdrTIRfpdyAsBQg==
X-Google-Smtp-Source: ABdhPJyIE9YerlcY4WIyYo6zOqsS/d2QxCa8wYVmwccZqiAoLw5NDkJwSZ4VJBdZSePJewAFfkAiYQ==
X-Received: by 2002:a65:6ab0:: with SMTP id x16mr13890226pgu.181.1635614211619; 
 Sat, 30 Oct 2021 10:16:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/66] target/arm: Fixup comment re handle_cpu_signal
Date: Sat, 30 Oct 2021 10:15:45 -0700
Message-Id: <20211030171635.1689530-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1



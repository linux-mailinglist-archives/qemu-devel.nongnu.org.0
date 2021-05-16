Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86F381F37
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:14:47 +0200 (CEST)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHXZ-0007p0-JA
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUj-00060O-St
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:49 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUY-0008Nf-Hr
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:49 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id u33so1910531qvf.9
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NhwI2DinhpUfdxRi9/Rhzl1MA34OxTKcA00kzZyzkIs=;
 b=DQSLnql/0w7yqENJX1QF7AVm0h7akgj/Zs81mrT+bD45CTANlRMcGXO/dGPtkQk9VE
 i5Ilajv7rT9GI1fRxnc7H02HviT73XgFbJwFjJaJAIXzqpjvYEl+pAkkNjOw4tDn0CoW
 F/o15f4VcSkiQD2EaNdXmWfbc/Q5uG21qUxXX5h3GC6niJ6UVTfNyTJpiEDHgUMw5MHL
 VpaDpPdcGAQsC0o7tWhfTiSEezDZq3Kz4HVbxJaoy+n/Z7p4EOKOZkaNvtBgIGcKRw7h
 LVZP22Wrq1UNr1IKNbyZUuKi/UunVoanfKSwGJgrjTJdG/rN4mznbVLJ3MN1ixwmo3/D
 VphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NhwI2DinhpUfdxRi9/Rhzl1MA34OxTKcA00kzZyzkIs=;
 b=Mv/aPl/NJYaCuBk5cMULHiVkPcEAf8qcqmehNfzYY9aR2572LA6Ov4kliq8NK/1FtF
 +FYuYy+Bh7cYd8n+7OtttJHWre2oqH2rDqB8XwpsPwTOSeza1i7g/Necmza6T1R0unha
 TEaQAlnzTv4uySJfZCKTA5tqyFcKP45V1v9w+sVCxB0U1SqsSjNe9gwGFv2WV/u5jvES
 JZD+DL5UTg/gGr3r+nR3nFgqpVL9I54Q9yC2w2R59z0sTTHELM+jL1BNFpP/7jOJDwnC
 HTmnUhCRZjGs3aibW60pVtC2XlWZ8o8RuAHYGOaHg7F7viamoRnJrO8mp7AjjN5c1qqW
 7rvg==
X-Gm-Message-State: AOAM531xnK3HN84WTrKkHgXEdj8zgQXj8wKTfahNApqOQGEmhCp6Oov8
 hisF9urta3kkk8/Qkf1lEan4TT7gRbCLMdKFBkI=
X-Google-Smtp-Source: ABdhPJzr4c229aXPwxbRzHcCvF/IGo78Dn4AFEC+9i3nVgZxla7rMexhpKtlp3PWQBol2yTPN/GF+Q==
X-Received: by 2002:a0c:90c9:: with SMTP id p67mr44837972qvp.7.1621174295650; 
 Sun, 16 May 2021 07:11:35 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j28sm8350102qkl.35.2021.05.16.07.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 07:11:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/4] MAINTAINERS: Add include/exec/gen-icount.h to 'Main
 Loop' section
Date: Sun, 16 May 2021 09:11:30 -0500
Message-Id: <20210516141133.739701-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516141133.739701-1-richard.henderson@linaro.org>
References: <20210516141133.739701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As the 'Main Loop' section covers softmmu/icount.c,
add "exec/gen-icount.h" there too.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210422064128.2318616-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f73354fc8a..6f73315dcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2429,6 +2429,7 @@ F: ui/cocoa.m
 Main loop
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
+F: include/exec/gen-icount.h
 F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
-- 
2.25.1



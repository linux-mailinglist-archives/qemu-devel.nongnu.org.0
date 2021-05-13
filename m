Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA137F7F0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:29:49 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhATM-0002z6-55
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK7-00060W-T7
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:15 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK5-0001GG-1r
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:15 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 76so25201345qkn.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLCVp6p+lxpak6IzuRy6OUB/8rfv/8V8rR0K7fXS3B4=;
 b=bQVXAX1VOCGZ3IhhqH16/c90MmKmaIFS5PUhgMHiR7Twrxy6XKimPIDgUB+gKlR+N3
 ebqhOci0ots3aPRur4AV4OkB2IWGjVzZNCNuGeqKMtoz+mILY7rRiMbcV0d07H4IeY5c
 ZhzJUYBX/q6UxZiLqNFu4bdn0hjHIaHBAf8DeVvEd6Wx1ozVxZwDvX8qap44onVF5d4j
 Vh2H8DX8gv18nEBcmqpWj04K+2l9nX6dOvFV+vp+I9MF3kCobaJ4+Wh4+ZsVk7V+/oXD
 fBh1c3JEs6GezTF2eGbi64V/S+gezbeAiVrq3fCS1c5bjMPGQS15cUTgYoFPUaXhGLgJ
 0k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLCVp6p+lxpak6IzuRy6OUB/8rfv/8V8rR0K7fXS3B4=;
 b=HzyVYIdeA8Is0GhsMRJXuQ+GdrqllfHME9Y0Jrjc40wKNz5pHdihGtb6C+bArllk3e
 D6DOmfy2Jwps5oz3eeKTey84jmr3bJvNwlpL1mWWnuuhZqMZLvd2BzMB9YSlinSuB9i4
 GpxPM3zcRTYW6xGYC0ujQz7owKUFbWzn/+LTcw5qQIYHfPSelD0Sr9nZLANUz0SVZGn5
 GUAEpCt8DybFxev9RtxlQGZMfgSRqPsBUwQj+QqVHKD3rviZv1J8Runw27NlkQ6KDiAF
 J8jmS1qNgwFXjj+0dhsiTG+y3wI+J4KTEK5XWN35hSK0mypfEK+emNJ4Fm/P+L4Qj9i9
 50mw==
X-Gm-Message-State: AOAM533/plm3kGqPplKVr1fAJlSVFhupYbW23eU0nn+5S4KmxU4PbJiY
 jRATf3PpdW4/XbVmfBr9jUe+EFgSFIyRAeBXwDM=
X-Google-Smtp-Source: ABdhPJyeGJ2Cz3cOaBGGbCBKp1oPcQADyXfC7v4tmXIY7bhzevb6iqZZz6LUKnCwb1U/5RTk+f4EUQ==
X-Received: by 2002:a05:620a:2291:: with SMTP id
 o17mr17195803qkh.150.1620908411301; 
 Thu, 13 May 2021 05:20:11 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b3sm847262qtg.55.2021.05.13.05.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:20:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop'
 section
Date: Thu, 13 May 2021 07:20:05 -0500
Message-Id: <20210513122008.207491-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513122008.207491-1-richard.henderson@linaro.org>
References: <20210513122008.207491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
index c733c53bf7..808e4ec74e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2477,6 +2477,7 @@ F: ui/cocoa.m
 Main loop
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
+F: include/exec/gen-icount.h
 F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
-- 
2.25.1



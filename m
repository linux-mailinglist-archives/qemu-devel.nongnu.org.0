Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECD2F368E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:05:29 +0100 (CET)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN6m-0007Ys-Gs
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzk-0001jE-1X
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzc-0006zA-Cs
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c124so2504978wma.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+x0GRYuxDvnfEkeYpYvCTsDtGQEJLh4PF7p7x0+/Bzg=;
 b=vGzxxiBlOVOF3NHI/eMgVCjsIuU3AadLFswtZT1iTSNaY/fl/l02Wyq3gTxbrat/m5
 /krotvMEp/yl5+1nMbxtXZlfr5U9KhjXjxgTy6PvQUlLxvku307YovxGJBzJUbddbcOn
 u7DcIHItF8IQqG49sCeQquCp7p8I6ih7fdrJbioBYEeWV83ycEP/qLC6ENzTc0bCddyE
 PaW3I/fwzdYdXU3y5mZryJdl1WWIwdLKPQW2XJz8vWVQ3U0KxW8SwRdPSj1SBQvAAXx/
 pc9xiHT1rlHm9xGTbj/m9JYRBsWIDxD4WrmAAt5mcVyBj+qfDph2c0xC9zpOQKB808YL
 M57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+x0GRYuxDvnfEkeYpYvCTsDtGQEJLh4PF7p7x0+/Bzg=;
 b=n63KKfeESEShrM331QzCCDHKYpRxIK+0w5UZ8q115rNM6N7SvXwieFyq+Xak4cvQ4r
 D/sJxeVPDSRsXQLQJByLiV/G5msAGu+YF+bgR1+ht4b3alcDkntA3FONOC/B9l4suQyk
 7P+Yx2emyxXN97R46Rj2BOc1dhxqYPqIM9ptF3jMxILqySxroJLRCPpH1qWZ5nt1FSiK
 tOWPsZSy+52bRYMDCexDUEfNkLcmqoVLhdMDEHJHnoVzrHpluqAXvbbC4OKTZSGDRa8G
 hmsVHb8M7SAcRRKwPVrmxGJOCs5RE034uVK9+oUghZob0PJG4iult57OKkR0N5q6dbVm
 QDOg==
X-Gm-Message-State: AOAM530tpvYMf0kaE8BpYo7Dx+FC6TQX37KHwgJ5nNPDAOUmG0VRsdYh
 eIQgrxyaKQ0fGICk1PSCJqsPQOLb3pzFkg==
X-Google-Smtp-Source: ABdhPJxgZ1U8gZXHg0bcX1t9QHIZLAGVQiGtRsUwqAjlwSItYzTyzx/X/1evI3hLsyYOm+jLhkONWQ==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr176455wmb.55.1610470682905;
 Tue, 12 Jan 2021 08:58:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] ui/cocoa: Update path to docs in build tree
Date: Tue, 12 Jan 2021 16:57:38 +0000
Message-Id: <20210112165750.30475-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

QEMU documentation can't be opened if QEMU is run from build tree
because executables are placed in the top of build tree after conversion
to meson.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210108213815.64678-1-r.bolshakov@yadro.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f32adc3074f..e913a514455 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1176,7 +1176,7 @@ QemuCocoaView *cocoaView;
 - (void) openDocumentation: (NSString *) filename
 {
     /* Where to look for local files */
-    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
+    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"docs/"};
     NSString *full_file_path;
 
     /* iterate thru the possible paths until the file is found */
-- 
2.20.1



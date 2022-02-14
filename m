Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899944B5A6F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:09:40 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgjD-0002A2-KR
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXN-0001u5-UX; Mon, 14 Feb 2022 13:57:26 -0500
Received: from [2607:f8b0:4864:20::1029] (port=36623
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXM-0006R2-17; Mon, 14 Feb 2022 13:57:25 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso65664pjd.1; 
 Mon, 14 Feb 2022 10:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ycHa0Cp/S2K1hnOLMDePUWT2anHQ+aB3cRrtgPqv7k=;
 b=Wv0JUPvQtwm8legk2tznRlqa7uT/TvHeJffZRHzGDcE06XXVnFRXxB5b2lpQ88GNlY
 BwpsNjiD2RjW5EGgb7/+dfpS6l8NZkwGolIRxmb+58PJm12xXqegQBY5PYsAmAvRH7kL
 5iY31r3rnoi1SnWgrzvt/bRO1HS9jCsQmBDNWCp8d1arthAGY3vl+xQ6E0YLN08rrhL/
 OAP7ypjFaUTk+7Xra6GqIYFycwvJcrSxBNaKEWzCQ806uVTIQ7Itg/uL2t6ha2YJbarS
 aL/DK6kx6LqQMXG5Bzr6M2xgtheT5Yq+IJsfOiglnlVcWuHEf4fyOY16uO+sxFofp/it
 48eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/ycHa0Cp/S2K1hnOLMDePUWT2anHQ+aB3cRrtgPqv7k=;
 b=rJQdMygqIZQ0PXnD9tcWNOrFCQmSnvziug46K1EuttTDvNyLBQaoNEIpvFIDac373a
 lbqQBi05WD5cjAfm2uU6WHNwsulcPqjN3jY4MRD3RO+G+CLkxgwNOcGC6AMeghwrRhoK
 6zD/p2TbXaAcLwf5mHQK575kM/Kq84zfpTRBk6ey/vwOEa9k/WqnHeHF1KoAp1QNOP0C
 vaiBw15KAWBD5rpiXE0azVRmZlH+jGRWeAS8Y4Cm3jDY5uFlIwn8Juj/vZIICV1U0+NJ
 rCKOJn/Hqahl7oJ3QWcJv9Hh5kPdkb89D0Hyns8hQlJabE48YQNFY23LEQqCU+mZpkwQ
 9log==
X-Gm-Message-State: AOAM530Sc0DGPljMeXmMR1jJs5G/f+ngjXRwLsr3vP1zg5eq21DPPTgk
 yZApr+tgVE82XuMg8jsHJRHh6s9uOF0=
X-Google-Smtp-Source: ABdhPJyyZq445715Oaqo3dY5DBJPzhIUz8PScRMCycSbaClP24bIFZ3MbshuBslorwSOoFOF4pvM8Q==
X-Received: by 2002:a17:90a:1c5:: with SMTP id 5mr33451pjd.106.1644865042272; 
 Mon, 14 Feb 2022 10:57:22 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id w4sm282752pgs.28.2022.02.14.10.57.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:57:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 07/16] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Mon, 14 Feb 2022 19:55:56 +0100
Message-Id: <20220214185605.28087-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Both hvf_get_segments/hvf_put_segments() functions are only
used within x86hvf.c: do not declare them as public API.

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86hvf.c | 4 ++--
 target/i386/hvf/x86hvf.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index a805c125d9..cff59f3144 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -83,7 +83,7 @@ void hvf_put_xsave(CPUState *cpu_state)
     }
 }
 
-void hvf_put_segments(CPUState *cpu_state)
+static void hvf_put_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
     struct vmx_segment seg;
@@ -166,7 +166,7 @@ void hvf_get_xsave(CPUState *cpu_state)
     x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 }
 
-void hvf_get_segments(CPUState *cpu_state)
+static void hvf_get_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
 
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index ef472a32f9..427cdc1c13 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -27,11 +27,9 @@ void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
 void hvf_put_xsave(CPUState *cpu_state);
-void hvf_put_segments(CPUState *cpu_state);
 void hvf_put_msrs(CPUState *cpu_state);
 void hvf_get_xsave(CPUState *cpu_state);
 void hvf_get_msrs(CPUState *cpu_state);
 void vmx_clear_int_window_exiting(CPUState *cpu);
-void hvf_get_segments(CPUState *cpu_state);
 void vmx_update_tpr(CPUState *cpu);
 #endif
-- 
2.34.1



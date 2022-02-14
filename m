Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF84B5A8A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:27:19 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJh0I-00041a-6C
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:27:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWP-0007Q4-Ss; Mon, 14 Feb 2022 13:56:25 -0500
Received: from [2607:f8b0:4864:20::102a] (port=33631
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWO-0006LO-1I; Mon, 14 Feb 2022 13:56:25 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso479975pjh.0; 
 Mon, 14 Feb 2022 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZ6HMC/awLS1AtcPS+4P+ISmJMCsR4IlAO4kOPlAwl4=;
 b=eHzKQ+feS0A49NHVJNYlZlUsT/OQmng7kKIAFCGSmHFdkeQmNdhJ94A8eUb9sGF3s1
 NGC443/+irQ2Ixvur3U3I/wEt98higUfDDRsJaJoxWI3rVZOTumX3KN91Y0Of/1lFmN2
 RDxPSQvardMU5Kus9CAUc54paoTS2uyG3STSi9tbyqXY+KbVNjFpLNAfW/f2uKMIBMoK
 39CN4eyaneXC4rsV40VqeA93rHpDnP/yiU55U7542voPTBFtC5G1Meij/BVmPq+il2Ds
 3ME14lHkVzLeykMmH/kCgmYa/i/ntzklHwpca6CzFksoKn+/rENJ4QS5pRCs50Gv+sEC
 UG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DZ6HMC/awLS1AtcPS+4P+ISmJMCsR4IlAO4kOPlAwl4=;
 b=WC+P8tsNDngXqA4ehHBbPxsTsFE0IEIXuIgiSlrSFEs2FMpOcfE1maaCiWVU2529/s
 LQMSl3XtlLpd7snu6wgPhwVGhT5dDD8+YW1W56zJtv/h46gL/GWvsBeGUkEQ/6NdT9rQ
 KEbonwS9cK7TC1SPbRw2FhhxGw4rquMB/BbZ45yFdi8Er39O9FpW5u4yqRhj3AJmvURO
 vDEUmykQqi31Jqw5ZXskt0RMulhmUYJ/uM+vZalf7CjyK+TH4IphxOgodUt4jwbXfwng
 LDaMyIjO6681C8wz34M0i0ZCoX7ooxfBio8ApDkkET8c+afSrms5VX+8NCMbSxM6WdNl
 +ymA==
X-Gm-Message-State: AOAM5308Xto8BB/q/fJG/BXAdHIjUN8Wsa5h/o7iUIkaS5rQwv4LQHkW
 re1LCFG1Yhm0aXPmOutAgGiC9bBkCm8=
X-Google-Smtp-Source: ABdhPJyqYJLhi5HxTgyDEi6mgH3h0THD35OEdxGapJTmzKYZtMM0jiSsQ4IIFEHycXnSVeDpMipiAg==
X-Received: by 2002:a17:903:1105:: with SMTP id
 n5mr267607plh.108.1644864982342; 
 Mon, 14 Feb 2022 10:56:22 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id j185sm35388065pfd.85.2022.02.14.10.56.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:56:22 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 01/16] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Date: Mon, 14 Feb 2022 19:55:50 +0100
Message-Id: <20220214185605.28087-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220213021215.1974-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0b845f445..ce6f4f9228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2406,6 +2406,7 @@ F: audio/alsaaudio.c
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2658,6 +2659,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.34.1



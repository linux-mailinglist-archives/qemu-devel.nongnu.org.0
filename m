Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3D382BC5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:07:59 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lic2Q-0006KK-Fu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librc-0005Ld-8S
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:48 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librZ-0003KR-Uq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:47 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so1157969wmc.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+MsLzuZDqfLZAxBKNrCafeqXV0sWDn9fgPx9NJiYpI=;
 b=N0yXozTxEdFGhrtpSq+2LtC3g12YsIB8yGnYPCt4MtFIeCPd89TNPVkM+f/SiQBlsA
 lTWc8wdH72aJKHWrB5e0yzZzRb+0zJOJgIHYCd9b6ye/4KhcxZo8zJjl+a4Dwb62j6po
 l9wfkPhKnyaeAsXGmFm0GOLGE0bcGSO2j5qYAiy1sDqCEyXThqY257id6G5pQx/Xy1wa
 pnkiVQnq5N7Xbid6SDNS/cUXH3QSf9vsccqUe/YoaMvwLV3uwEyFGBkYUXBQ+X8PCYaN
 Tuu1AvvE1U+x4CuBOCsIGlVnpkaZnS5tVAYvE/NpErkF3TsMhjWhfPOiRSyvL4ixE00w
 l3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m+MsLzuZDqfLZAxBKNrCafeqXV0sWDn9fgPx9NJiYpI=;
 b=keQTRaa5DDGC8wg+6gj0hawSEiV/OQ/NEe+g+lM2MmWq6CTvxA3KZxURtxJOF2zVEp
 4K/rkymymOGqfYvUO1nZ4EMs6McmVjqLsInnK4rwNp0+0Sf8MkV5rIdP8rUaufC3bHup
 72+Oa/Iy7v3IPBNQwrFab1wWTQrW75Zg1TI7+MYzbtqXvQNOPKo3OMKEyJPOAjy7cmWZ
 NyybgJuIYctrL3+cbFFtvrC4fQunivkHVFdcwwVJadDIR3KmNyROTJQ6dZebg2Cc1k9K
 NK/ilRBwl4NMvdkz/po0LTWRotCc90rGOWdSGsEV8BAMaD655l9cMXYJtA9ENpaOzjju
 pOnQ==
X-Gm-Message-State: AOAM532wWxSeb+q5bY2b7c5x9hBBgLBJjrBfLZRU0nZSTQDdt9LtNb3T
 39kkfv+yG2zUBckaGmBCtOIAoBwP9aodww==
X-Google-Smtp-Source: ABdhPJwlE0FH/AZTV1/bt9LrbN2BnP3ERfWBigDq0y26JqvBJOh7F6/Z34Zk5l+w+fBkGQPzj2pIgQ==
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr7297959wml.77.1621252604276; 
 Mon, 17 May 2021 04:56:44 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u16sm15846419wmj.27.2021.05.17.04.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/15] softmmu: Build target-agnostic objects once
Date: Mon, 17 May 2021 13:55:25 +0200
Message-Id: <20210517115525.1088693-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various softmmu objects aren't target specific. Move them
to the generic softmmu source set.

For our 31 softmmu targets, this is in total 330 objects
less to build!

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/meson.build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/softmmu/meson.build b/softmmu/meson.build
index 5e578b20e6c..f98a5972d23 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,21 +1,10 @@
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'arch_init.c',
-  'balloon.c',
-  'cpus.c',
   'cpus-qmp.c',
-  'cpu-throttle.c',
-  'datadir.c',
-  'globals.c',
-  'physmem.c',
   'ioport.c',
-  'rtc.c',
-  'runstate.c',
   'memory.c',
-  'memory_mapping.c',
+  'physmem.c',
   'qtest.c',
-  'vl.c',
-  'cpu-timers.c',
-  'runstate-action.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
@@ -23,9 +12,20 @@
 )])
 
 softmmu_ss.add(files(
+  'balloon.c',
   'bootdevice.c',
+  'cpus.c',
+  'cpu-throttle.c',
+  'cpu-timers.c',
+  'datadir.c',
   'dma-helpers.c',
+  'globals.c',
+  'memory_mapping.c',
   'qdev-monitor.c',
+  'rtc.c',
+  'runstate-action.c',
+  'runstate.c',
+  'vl.c',
 ), sdl, libpmem, libdaxctl)
 
 softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-- 
2.26.3



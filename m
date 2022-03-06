Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7E4CEBB7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:28:13 +0100 (CET)
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqvi-0004ez-RE
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWF-0001fc-P8
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:52 -0500
Received: from [2a00:1450:4864:20::429] (port=33486
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWD-00048O-Ls
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:51 -0500
Received: by mail-wr1-x429.google.com with SMTP id j17so19404430wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOLNRTgRZFcXCYq8OA8jxbMqyWWPp6ZZ6CP6NThIhP8=;
 b=CwsdGpCTwjSY1+w/x27L+t3lxJeu2KOYlxFQME45pTJedJTmiVCE2oUl+Jqvpe0Vq/
 9dxcOW9JhGhxbynAV4bHgKHdd9p2NYlKSYl9UOG+8P42x7kcGakwbW8xwQcUt6nm4DhB
 u1sc5NbTnRFT79BlxQ9b8G1R6SIf+M15mjzBoNPC0FG06loizSq4nnq8Z3qIyEvYe1sg
 8G0kWDgW+MP+nDvdpkuilIfKFY4b42ctgQv9/KpXX807y+GWTgrytYZrqu0GMTceJUkV
 ToxdGMWVop4laAqHQOYyhxBksFR6VmjMTgFJN5Qw2sbWy4q/NGT7yZkD4GcrZg8HX0ea
 k47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOLNRTgRZFcXCYq8OA8jxbMqyWWPp6ZZ6CP6NThIhP8=;
 b=t/G6iADguBHvgUqlW8VZiUd1oaJCgpvsgjGF1Xkit6/cCnQdYtlPgZNi0Lfxn6qRFt
 6+P2t44xJaZ0iSS/9xjPkk0iBiRXnEdjxtia0pgb4PmdgDi2G3+qgU2BgYio85TOw5hN
 /oHpSWhpt30VvlRFwKcDuCGMbTafVmP8zrvT9lKYyvEN1AIUya3tk1+B1ysmHiNPG/kx
 YsI1BPuwVIbtSlsJc0rBVxyibeJmV3vlZFj5zesXbfRFLqhzQtzB2gCkWiQ1vG9vyb6K
 uay98VXxszbca40fFrtBkzkifpqSRyFV4MxGManqkNhWYOkdnjnl0nU8H06iizXYP9Bu
 dxng==
X-Gm-Message-State: AOAM533DJxQioko+78HbrQi3T0JrJbDVk2zfwnc4JV/Rlw58ln69m13x
 ZXrcFvpprlhth42c5vRTsbqL21eYrY4=
X-Google-Smtp-Source: ABdhPJy6ruXfrsC9XujR7X8xDu3yd3tWCry0ZmQ1YVpf1vSEuTm/M3wzu9wO5OkJ4a6IN36EYnMRSQ==
X-Received: by 2002:a05:6000:1449:b0:1f1:f821:5582 with SMTP id
 v9-20020a056000144900b001f1f8215582mr825693wrx.473.1646571708242; 
 Sun, 06 Mar 2022 05:01:48 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b001f1d99e9441sm4200687wru.106.2022.03.06.05.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] softmmu: Build target-agnostic objects once
Date: Sun,  6 Mar 2022 13:59:47 +0100
Message-Id: <20220306130000.8104-21-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Various softmmu objects aren't target specific. Move them
to the generic softmmu source set.

For our 31 softmmu targets, this is in total 330 objects
less to build!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-22-f4bug@amsat.org>
---
 softmmu/meson.build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/softmmu/meson.build b/softmmu/meson.build
index 39f766ce7c1..8138248661a 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,20 +1,9 @@
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'arch_init.c',
-  'balloon.c',
-  'cpus.c',
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
@@ -22,9 +11,20 @@
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
 
 if have_tpm
-- 
2.35.1



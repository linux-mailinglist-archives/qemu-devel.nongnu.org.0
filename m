Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CC6A443F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCz-0006Kt-F5; Mon, 27 Feb 2023 09:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCU-0006FS-Tw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCT-0000fN-7p
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id c18so4312483wmr.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EzB7E811R8ZHY7qXERszEqu5NK1F8fYg7SHHwSsZGtM=;
 b=iPqXnncokRKjtkkGO8s8NIfLAVXBGdfHMF6ylMFU8q9kbfoHbY/lyJPaGaM6AN4LoT
 QLohqp2viNpR+l7hkBoAbetetpBJLIMC5R24Eh5s90ZGg5+aO/2HIoZCtF2FrNRJ1ArJ
 azRlmZOJGuOOXMEjd7ypDVAxm/QU5B5ADmeiCXHDLMfzsY12o6NQnv7FhrK0v6RCGwjb
 SJEeINU4Sh6w+r0xdxXAxAysyHcNZCJWvakxOBd0uw5ZZWy0b6OEmRtahIeRaF5M9HmI
 UIL+ZBY3uihkC3KGdaqpu5HhOqjPtS6KKkV25e3M+qapQRoGr0eK1SX+VaQmAS4IjNU2
 F4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzB7E811R8ZHY7qXERszEqu5NK1F8fYg7SHHwSsZGtM=;
 b=6gw5c0ohA8M4SlV9HbGxpqMqOYMGieKIyRUvpzP0KjQj4uTQZUZwbiVBNTk7ZP2toP
 lSxzmALgbZbmxAke+pTDce6SCkwF+eNU2FeCIZ+obqQm5rr/30NiZBZ6orxpTJT92hlD
 9OVLgMKnROZG/e5mzUM7gBsFokEOwfKqaBG/iHmsVWwXTh9Ot2gV1mC93X28rhDLsxk+
 UlSxdbxr6RpcnRX7ZXM0vMp3w6Os5XrgbPfeC0ZASpgJ94P335G/XMSLN4ZjRxJ9ragx
 Zmziwd79mMjGhuw2oiizsIGmyZZvkLDHa76KbxB22X6Ay1Y8zZV+KbIvzWkV12NZUQnw
 ZhNQ==
X-Gm-Message-State: AO0yUKU+sqjNMcaYzm97t9ESas4Dgn9AXWJQNBvG+/T7iNow/+Zx1SvV
 NXQtVrzjMBJeGXP0p/xqnwHgeFYtX2R+ALml
X-Google-Smtp-Source: AK7set82UvibxvxPicSIsxiGOsO5TvzD8/GoxnyFtqozGUjCIy+kJ8Y1h7cLuaY4qyBHOHSKU0BC/g==
X-Received: by 2002:a05:600c:4a9e:b0:3eb:2b88:8682 with SMTP id
 b30-20020a05600c4a9e00b003eb2b888682mr8277989wmp.17.1677506995444; 
 Mon, 27 Feb 2023 06:09:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003e1202744f2sm12676140wmb.31.2023.02.27.06.09.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 094/126] block/vvfat: Remove pointless check of NDEBUG
Date: Mon, 27 Feb 2023 15:01:41 +0100
Message-Id: <20230227140213.35084-85-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit 262a69f428 ("osdep.h: Prohibit disabling
assert() in supported builds") 'NDEBUG' can not be defined,
so '#ifndef NDEBUG' is dead code. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221232520.14480-5-philmd@linaro.org>
---
 block/vvfat.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d7d775bd2c..fd45e86416 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2784,13 +2784,10 @@ static int handle_commits(BDRVVVFATState* s)
             fail = -2;
             break;
         case ACTION_WRITEOUT: {
-#ifndef NDEBUG
-            /* these variables are only used by assert() below */
             direntry_t* entry = array_get(&(s->directory),
                     commit->param.writeout.dir_index);
             uint32_t begin = begin_of_direntry(entry);
             mapping_t* mapping = find_mapping_for_cluster(s, begin);
-#endif
 
             assert(mapping);
             assert(mapping->begin == begin);
-- 
2.38.1



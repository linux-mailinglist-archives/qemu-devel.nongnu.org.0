Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8082D5DFD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:36:57 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN3w-0006Au-ER
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0L-0004WA-1x; Thu, 10 Dec 2020 09:33:13 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:40822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0J-00018P-Ll; Thu, 10 Dec 2020 09:33:12 -0500
Received: by mail-io1-xd43.google.com with SMTP id r9so5712961ioo.7;
 Thu, 10 Dec 2020 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=lA8cvPywlGkvrjGCg2b4WJPzr2XygG5IaqH6rWKvJB8GQfGBgTJ3b5JCoBdxf3vTX/
 CP/YlcOp5Oq3dLK2e48u5w7pogr8QTyKgaUN1e9QyBixd892VmwvTWJQTRoeXK5iUHyS
 yP2prEb1jgkQy49OeInNcgxo3xU+Z9xWPT7ETbBpLBqhmK3JshgIN8zwBhgky5pBYf6R
 vwKLYJw/Z01Edxzh9QiPnd/tmdjGnQA9wtzTJFS2kHzkaCGtSfNreG8hbsaNzzFD6VMh
 iIgcSPMb4vcWHV57U3AHWByHyEZ8i4DwX3wkitEw8EelhT9EQEu8cgu0K2I4sv5yoFGz
 NhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=gLqwX1mAiSf4aw2sJvJasvlsKQnbqQWo+XY//CrSJtYsNnzbkrFgs7hir9EM18lnFI
 DvGrTRCuTeFAjC/jBSdLBrtpLbhIdLB7SmCup6/830nPE1kDU1HclbZGt9i4mE2GSgJa
 2/xXxeyhTmWzsxS7Xa7h5r+C2uudh3itVzQebuoNqYm/Ep0Y8NMG8vD6drEEx0uK9ycc
 SK4BVidFMSD6wbRYPFXgeHwIxJ8F0jeQAfW6bd/cj1PTxn5WkZ7+H7PA51AmxWpUpwzL
 b/gGhG3q9Z7Ph/dWKe10Z8byA4PU1cqIUFusAbAJjaOC6CmuszFVsa7c7TiMAueELuzP
 /eSw==
X-Gm-Message-State: AOAM530OJXltAaysjW8/UT6dXt3YaB1gx8BNnDAFjFCjICEJL9WT7Ygf
 J3YT5SftArB1OP91k2Ub8G1gYPDXRMo=
X-Google-Smtp-Source: ABdhPJxaDOotVnmCO2Z0Dz41/GYeWschKU8/mB7hTDTVhopRSuEID1LVZkgoRV0VwZMyneGD6T9ULw==
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr5150541iof.111.1607610788652; 
 Thu, 10 Dec 2020 06:33:08 -0800 (PST)
Received: from ubuntu ([74.119.146.240])
 by smtp.gmail.com with ESMTPSA id t16sm3443019ilb.50.2020.12.10.06.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:33:07 -0800 (PST)
Date: Thu, 10 Dec 2020 14:33:06 +0000
To: qemu-devel@nongnu.org
From: Darrell Walisser <darrell.walisser@gmail.com>
Subject: [PATCH] sdl2: Add extra mouse buttons
Message-ID: <GNUALCfDBqhCUvLwBNJaKqxcPewMtlqCnixk8xTrgI@ubuntu>
X-Priority: 1
X-Mailer: PHPMailer 6.1.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=darrell.walisser@gmail.com; helo=mail-io1-xd43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows guest to receive mouse buttons 4 and 5, aka "SIDE" button
and "EXTRA" button

Signed-off-by: Darrell Walisser <darrell.walisser@gmail.com>
---
 ui/sdl2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 189d26e2a9..a578017268 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -275,6 +275,8 @@ static void sdl_send_mouse_event(struct sdl2_console *scon, int dx, int dy,
         [INPUT_BUTTON_LEFT]       = SDL_BUTTON(SDL_BUTTON_LEFT),
         [INPUT_BUTTON_MIDDLE]     = SDL_BUTTON(SDL_BUTTON_MIDDLE),
         [INPUT_BUTTON_RIGHT]      = SDL_BUTTON(SDL_BUTTON_RIGHT),
+        [INPUT_BUTTON_SIDE]       = SDL_BUTTON(SDL_BUTTON_X1),
+        [INPUT_BUTTON_EXTRA]      = SDL_BUTTON(SDL_BUTTON_X2)
     };
     static uint32_t prev_state;
 
-- 
2.25.1




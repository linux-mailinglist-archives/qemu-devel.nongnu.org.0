Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84BF2D5E2D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:44:26 +0100 (CET)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNBB-0005e3-TT
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0L-0004WB-AN; Thu, 10 Dec 2020 09:33:14 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0J-00018M-Lu; Thu, 10 Dec 2020 09:33:13 -0500
Received: by mail-io1-xd44.google.com with SMTP id i9so5718047ioo.2;
 Thu, 10 Dec 2020 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=uIHn+FNXEDPBS5aKnRimMNEuzS9dmi83EPaP7L9BOtGaLAJY8CfDqnukS80JU60MbE
 tyf7sG2XaNFtTeRVOaecFObhw2fNCGQEcCOHuF2YfBgLc7CuY8WvwUwn4bnkBr1k/epo
 e0dUDcQLRhMVlR6rAY182+DIquGNEanidT2Yr82BRbirHnfGFBGkcuHIt6mZ9YQhCX48
 PAf4QgXYSEQF8OZ49ojSlWeyMY2C5ENzubFTW3VmkbQ5mRcQt6bAZ+Aj5rlCNQT2G2vd
 +I6lw9NF3NimDZMOrbwcjh3ZIpEGnLEltx+1YNJJXRrf0gZ2O8lPyw0z0yzOcPrdcYKL
 SpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=RUnR0RyReu3ciZ2y/8cRCp7XObPhXdpI1/45T127XOkHadHGW/fhhMPWGBDiP0Fnrj
 LDiH3OVFmOVZd5FDloRZXLXMLyIniyILLrKLDFWki0O0gXcbIp3fdD7BCY42d0kccMYg
 Ns7IiV3udT4eWfbEV2Nfh17JZJD8wjOfLmVaZbMXe5hGjYUKlWltdG9kvcsXRqzFOIkk
 viSAjuWJmkzfp/CJHLfb5THqp7Gpxg9PGpGPT9DQMPTr5GqsU4n49kO1pRudmWUJ5NDy
 Y6Um417azppB5qas0ZxxggrKm3xUYSW/a5PnDyYv2OHoWwF4/hZkJlcH+hvYHe2QzhKN
 Pr7g==
X-Gm-Message-State: AOAM530hsQsza5/y+xBnAysUKrkfnfA/nVGEj8P0gC9IK32NRLrMhY1U
 1wSHhWD2WyBjwyc/L/gSya8l3yZURxc=
X-Google-Smtp-Source: ABdhPJw1kFDhMc8AsFFp89+Pi81h1P5LAhpmaldo2Q1UkXM/6sXc8DhtokJO5ozOfuWSzkSrkHVegw==
X-Received: by 2002:a02:cc54:: with SMTP id i20mr9403523jaq.136.1607610788305; 
 Thu, 10 Dec 2020 06:33:08 -0800 (PST)
Received: from ubuntu ([74.119.146.240])
 by smtp.gmail.com with ESMTPSA id s1sm2698967iot.0.2020.12.10.06.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:33:07 -0800 (PST)
Date: Thu, 10 Dec 2020 14:33:06 +0000
To: qemu-devel@nongnu.org
From: Darrell Walisser <darrell.walisser@gmail.com>
Subject: [PATCH] sdl2: Add extra mouse buttons
Message-ID: <XXgAoOzljr9denOsyerHO3XbEkdTY0oL7WLHkZopu9w@ubuntu>
X-Priority: 1
X-Mailer: PHPMailer 6.1.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=darrell.walisser@gmail.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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




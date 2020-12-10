Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134F2D5E35
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:44:44 +0100 (CET)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNBS-000636-RI
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0L-0004WK-Cx; Thu, 10 Dec 2020 09:33:14 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1knN0J-00018k-NW; Thu, 10 Dec 2020 09:33:13 -0500
Received: by mail-il1-x143.google.com with SMTP id v3so5493519ilo.5;
 Thu, 10 Dec 2020 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=TMwOh+KchvU6bK6bHdudVOjI6XjxYAn6Sc8nnSxsceqXnNfsP4P1zlG2RfOtQKk7U4
 yLpG6V9HHUJEQ7MW5pigGsxfKx8LHxbZ61e7sgZqNYmx7klyWaczADSs75cVQ3b+AaLm
 MGFnu4LdV1QdquYkJe3WtpQzcUj8r93eCoqXbo9Vrq/hL0YWmQy2lAv2w0TmXCJksRef
 SAD15kLwZDDRP3eQPpczqxB9uaC/AlRkJWUhiW4skWWAkqblois4MaNoW5Thh3Jj2lc6
 a4QxWQTwUnzgqBbwdXPFTNJN2kMz2P0Gi66bw8aFMIM7Pxmbx4z7KQWSSD2zjcF+7YhQ
 MOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:to:from:cc:subject:message-id:mime-version;
 bh=l+WiHgdU4xiBBY9SYTWama7q6740QDxFaUE2NyHI0O8=;
 b=T8hmaartvZTKipY5sgeseBS6IYUWNk1ip06irLlB/8c5S8eoK5ruRIGXO2N6cvdKC8
 1mkmVdzN5fRYCUdkYkMxtjQ9D1+mAS/WpqBSwEcYNO/Txai/rEZ4RuhnKCWmKBQ16hbz
 itLzoCL8T8qLmIqJpkbpzWTRVOxmkfs7yUfJwpX5LrMM3IGpYkiTazze7XMBxyZY5DcY
 QZMLo3Pd3BiKBMBGF8wusmP9E1F+PVYQh2b2N5WC2Kq31/PN+0F6jnwV7zHsH/fl0HpH
 Ii8kLgt1ZVf5OKUBx+GR/0px+uQFrhdA5GVwX9XcZqERmPou1XZRh8QyZ8LAgWcfjuAc
 Juag==
X-Gm-Message-State: AOAM530Wzj7twE5HoS20oFwm3ZmNp5hYxsJQ8ZrmH9V13n+pGF4hefyb
 g08T2b+MMPzbkAPRMVz/Pi4V4dSb4zI=
X-Google-Smtp-Source: ABdhPJygpMCzOS24XsxDNeDKsjhAs80oxXnaZv0hX+u/qsJnY+80BNlnu1ZKFQ5fhXe8jnnA9PUw6Q==
X-Received: by 2002:a05:6e02:c32:: with SMTP id
 q18mr9504609ilg.203.1607610789077; 
 Thu, 10 Dec 2020 06:33:09 -0800 (PST)
Received: from ubuntu ([74.119.146.240])
 by smtp.gmail.com with ESMTPSA id c21sm3476586ilg.9.2020.12.10.06.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:33:07 -0800 (PST)
Date: Thu, 10 Dec 2020 14:33:06 +0000
To: qemu-devel@nongnu.org
From: Darrell Walisser <darrell.walisser@gmail.com>
Subject: [PATCH] sdl2: Add extra mouse buttons
Message-ID: <8aeIgKDrK0wSGHIBHqDJniFwwWSDwkhE9wZT6bQsk@ubuntu>
X-Priority: 1
X-Mailer: PHPMailer 6.1.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=darrell.walisser@gmail.com; helo=mail-il1-x143.google.com
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




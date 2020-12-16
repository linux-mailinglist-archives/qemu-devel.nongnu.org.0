Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD52DC17D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:46:18 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpX8D-0001aX-2i
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5a-0000NO-UI
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5Z-0005KN-8x
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id q75so2501805wme.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SgZ6f1R99Jp9rN3Fu2+TfzNqacn007bK0ejalp0kWYQ=;
 b=NORUMJZ4Ih9Yv5fnT6j3PC4VpqPLuu7w+xgbtg4bRnwsRkwetWNSTxrIQ56AOt1xHO
 xRMvhTJy1irNB2rac8UQ1iIGjTrXUfGkWgK7qX491cFpH+zTSWY1o8qJ0abKndaEfaAq
 qhlcWNVTyDeXJS02YYxPy6pe18uuoNgG0JxPwM8yc7f/S9GyAI8kjpIOOHvcs3GYfvVV
 2JIba9CvjPLDZyOJ2GAU4lmdfJ/PZv1PutJWB1HPQOTzVEsXFajj/ONjCq3I72SNSHfz
 mRXdArozYp5aKiimop/jxBAnM59vV/mpTbjmxbkrj6gIayqq+Wn448qBq+PYFrjyQXqi
 bISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SgZ6f1R99Jp9rN3Fu2+TfzNqacn007bK0ejalp0kWYQ=;
 b=PGpHEzxxaSdYbe044iBBJw5feCoHut20K5OTuWwl3Yd6Ukvfhr0HaksIjn1ia3dGgw
 9C3uvo5rokZ5Rb5oLXC6mDlCZymASNmEEK+rAhUZArAEj4FpWmHy62DtTf6PNdVc5InU
 a5TcJuvQw2M30i1nY/NWd6GkuTLS4AQjiBI35ZQKugIU+6zEtvt6ZvcmfFo5dd08Xy8l
 196y+/ZzyPJ3f7izzjcPs2Lp5XTjW5FWBgRWJniHUD8qSKU+h+ept25Dn7a7cjLBcIYY
 QRY1rQLECAl4XoBatsX8YT/FpmIYFb6fZl8z76nLwUTtFWwfXHJEfaRzADrQ4o/vpa2+
 dJVw==
X-Gm-Message-State: AOAM5326ciCdKqogwIU29b8k1MXRVxO3zOgLfPocJMmrD21MkOpmozRG
 0oqq5ikvd3XAEoiFTBwd/pWynR1w48o=
X-Google-Smtp-Source: ABdhPJzSpfJ2PSbLQsJ92VkDJVao8yWs0kqjG/U0GP0FHejR6mnqcwvaYb7oIgNHgsln1hOhl4l3Xw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr3559819wml.31.1608126211469;
 Wed, 16 Dec 2020 05:43:31 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm3030281wmf.35.2020.12.16.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/mips/mips-defs: Simplify ISA definitions
Date: Wed, 16 Dec 2020 14:43:17 +0100
Message-Id: <20201216134328.851840-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we don't need to duplicate 32/64-bit ISA defititions,=0D
this series remove the duplicated 64-bit variants,=0D
simplifying the overall.=0D
=0D
Changes done automatically with my editor using "find=0D
and replace".=0D
=0D
While the 'ISA_MIPS_Rx' form is shorter than 'ISA_MIPS_RELx',=0D
which one is the clearer?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  target/mips/mips-defs: Reorder CPU_MIPS5 definition=0D
  target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64=0D
  target/mips/mips-defs: Use ISA_MIPS32R2 definition to check Release 2=0D
  target/mips/mips-defs: Use ISA_MIPS32R3 definition to check Release 3=0D
  target/mips/mips-defs: Use ISA_MIPS32R5 definition to check Release 5=0D
  target/mips/mips-defs: Use ISA_MIPS32R6 definition to check Release 6=0D
  target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1=0D
  target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_R2=0D
  target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3=0D
  target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5=0D
  target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_R6=0D
=0D
 target/mips/internal.h     |   8 +-=0D
 target/mips/mips-defs.h    |  40 +--=0D
 hw/mips/boston.c           |   2 +-=0D
 linux-user/elfload.c       |   2 +-=0D
 linux-user/mips/cpu_loop.c |   6 +-=0D
 target/mips/cp0_helper.c   |  18 +-=0D
 target/mips/cp0_timer.c    |   4 +-=0D
 target/mips/cpu.c          |  12 +-=0D
 target/mips/fpu_helper.c   |   4 +-=0D
 target/mips/tlb_helper.c   |   6 +-=0D
 target/mips/translate.c    | 620 ++++++++++++++++++-------------------=0D
 11 files changed, 357 insertions(+), 365 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


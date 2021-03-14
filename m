Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B74E33A8E9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:48:01 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaSl-0000PZ-RE
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRi-0007wS-UU
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:46:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRh-0003AQ-FY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:46:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id b18so7798784wrn.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UjOIyRS4mFTIiKI4l0W7mYnWbGxFnUww+gX05+SQtgs=;
 b=gUhk7BCkuntxujshX4ge0ZOkhrn3eDE6YUFey85GMVQSC78IVtiEtkHAKx/rWmCpIZ
 3wbFJsuWst9fXlkg6MjWA7iu6L0p5vMFQzGWZo0Q3RYVNpGTnbQpVrEVF6UV8aAAK0op
 Eqbcy9WUMq+oD0oJMXsleIFEyUHbv7F2Li1oIFgZk+2nS6aitvuiBYn6XoxpiFMD4u/s
 j+usajcuUJV68L2YhOOeHlZQ9h0kGW6dvuZCfKRDdunlZDm7H0kXI1OfK1LxAWvqBsut
 /lyepD5lbW6PY/IsGzc4cG9UOaSU+9jVA/H8E7vbDnBJYvsfSTb4rVMkxRJcxIJNKQpL
 INhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UjOIyRS4mFTIiKI4l0W7mYnWbGxFnUww+gX05+SQtgs=;
 b=cfILJDe9HZ5tvHG0cAmineu30sGA9Jlu/IAS168Uixq2lCU5i+Q4KQr6TmGqYVm3gr
 L8D8nfrlnF1/ZkM7gqSZHT2IMIXnybp6mCAPVmwFYvS4TW4KAOYIkGs4FxRVCRJh453/
 r2CbynEjICWyCrHyesFuwJfPiln3o+uUQNhpJdab5HycxNNQRfjRygfLdzpbXaeHw2uY
 8lJG5Vwq5TAmV7Gg+7faF5jjKQfzmohRAesX1dJP9CJgrlD5q6fm/P+gd/GLFCm6WZVD
 K7Ythj7kJmHAxdQlKCXouzNNPzeyr68sh6+vk8rHzxZrihuL48mycLiiSsmuGv+vD+D+
 2jlw==
X-Gm-Message-State: AOAM5300kSvA3upW4e4ILzl1GXTuPzfDeOTEAx0MnUUFsDFa2n2e/k07
 opE50NIUfzSVyzKL5E7MwaiUyMZ7VQBtzQ==
X-Google-Smtp-Source: ABdhPJy0Be9wNcQeo/o4fMNSPOnN+toUm+WxERv6WQiSboYuvDblg3rGEr3HYqBM7KLpe0b1p4GYpA==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr24575261wrr.274.1615765611708; 
 Sun, 14 Mar 2021 16:46:51 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j9sm10493906wmi.24.2021.03.14.16.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:46:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] AVR patches for 2021-03-15
Date: Mon, 15 Mar 2021 00:46:45 +0100
Message-Id: <20210314234649.2614590-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-request' into staging (2021-03-14 17:47:49 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/avr-20210315=0D
=0D
for you to fetch changes up to 56b90e60c4019b08012bd8bd1459efc00b055577:=0D
=0D
  target/avr: Fix interrupt execution (2021-03-15 00:39:52 +0100)=0D
=0D
----------------------------------------------------------------=0D
AVR patches queue=0D
=0D
- Only reset 'interrupt_request' mask once all interrupts executed=0D
- Documentation and typo fixes=0D
----------------------------------------------------------------=0D
=0D
Ivanov Arkasha (1):=0D
  target/avr: Fix interrupt execution=0D
=0D
Lichang Zhao (1):=0D
  target/avr: Fix some comment spelling errors=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/misc/led: Add yellow LED=0D
  hw/avr/arduino: List board schematic links=0D
=0D
 include/hw/misc/led.h |  1 +=0D
 hw/avr/arduino.c      | 20 ++++++++++++++++----=0D
 hw/misc/led.c         |  1 +=0D
 target/avr/helper.c   | 10 ++++++----=0D
 4 files changed, 24 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


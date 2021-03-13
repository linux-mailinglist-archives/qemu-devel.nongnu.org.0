Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BE339F44
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:57:24 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7Zr-0006UR-Sg
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7XP-0005DS-HY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:54:51 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7XO-0000jS-2K
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:54:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id b18so6457300wrn.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EY6Vh34LkxSkGwScpBlwErFD94Dc0UP+wj9kGmeYDJ0=;
 b=dyx1FwboS8XVcsyCZj1SUNj4P47qcKLR4dzAIM6LHzYgGI0KuGbNPjPF7WQpf9Rqf3
 RO5DD0et7kvk8/W1FDOhjtDqpxu5Xq9tkm65/7ApedPPe18WKJCkY/h2rG9m4zzLFr7B
 It8hgz3k+6WR3t54StiX43/MjqVz2bBvJCc2I02utJbOVnnrmR2N+fRTvBjkMVp16F2c
 1cO29cY9UIjorCu8GIdGxjwClC+AWQay7mgkLpq3nSMC4yTGUPfN5K5dQQPNcRZzI0Aw
 GHwJiE/vAGXpIlK5D11htB75weHcSvgwKZa3kN5+1sDmryMTjaL7pVM3mMg20hV2homv
 pLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EY6Vh34LkxSkGwScpBlwErFD94Dc0UP+wj9kGmeYDJ0=;
 b=pGzAuQ7YVzMkvxiQzbo+920NvnmTlyp21vYYJZLvPaC9JHGtuUf6AOvFoZjGBI5zJW
 FJHZnfWF5rq2f2gQw7YikL6xVc3PPD8zQkMhsHAM6i8nlF2N3VeqJ3NEx+gY+WiOZWC7
 JJjI43wxhccPpf5nEia6qCtQzTXmz71IsCxWZVA9RlXlxOpyVQblhDAU9XzFJiN8jM+k
 0W8ET5lAO5K+FWIp1DxQ9XX6EB4XLlgHckm0Pzi4tda5MKR03u7OAF/Oy9ScbJO209XB
 UpkbKPKcpyoOMAK6eGHi/S0Lqi1rMb4ro5EIFlOs7ano1tJjnSsxtL5/cjJ2FKrmNjwi
 Jibg==
X-Gm-Message-State: AOAM533+OVuifIG1gkl7QJjVA/8GAQsGW7bwCt0XGgVdQm9mPBHamjxs
 5+c10hW/Ws9VAc/NgE+Iqw3o8I5voqMMFQ==
X-Google-Smtp-Source: ABdhPJxVrpph+S2cVIro6BC9IrpC1RpSgketddpTO3FIWIwkGxWvabBoPMnbjiklaAmVYMsXC5z30w==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr19266794wra.239.1615654487896; 
 Sat, 13 Mar 2021 08:54:47 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v9sm12972956wrn.86.2021.03.13.08.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:54:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] AVR patch queue for QEMU 6.0
Date: Sat, 13 Mar 2021 17:54:34 +0100
Message-Id: <20210313165445.2113938-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains all the AVR patches I could find on the list.=0D
=0D
Niteesh, I fixed minor issues. Do you mind reviewing on top?=0D
=0D
Pull request planned for Monday if no problem arises.=0D
=0D
Thanks,=0D
=0D
Phil.=0D
=0D
G S Niteesh Babu (2):=0D
  hw/gpio/avr_gpio: Add tracing for reads and writes=0D
  hw/avr/arduino: Add D13 LED=0D
=0D
Heecheol Yang (1):=0D
  hw/avr: Add limited support for avr gpio registers=0D
=0D
Ivanov Arkasha (1):=0D
  target/avr: Fix interrupt execution=0D
=0D
Lichang Zhao (1):=0D
  target/avr: Fix some comment spelling errors=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/misc/led: Add yellow LED=0D
  hw/avr/arduino: List board schematic links=0D
  hw/gpio/avr_gpio: Add migration VMstate=0D
  hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState=0D
  hw/gpio/avr_gpio: Simplify avr_gpio_write_port using extract32()=0D
  hw/avr/arduino: Replace magic number by gpio_port_index() call=0D
=0D
 hw/avr/atmega.h            |   2 +=0D
 include/hw/gpio/avr_gpio.h |  54 ++++++++++++=0D
 include/hw/misc/led.h      |   1 +=0D
 hw/avr/arduino.c           |  44 +++++++++-=0D
 hw/avr/atmega.c            |   8 +-=0D
 hw/gpio/avr_gpio.c         | 173 +++++++++++++++++++++++++++++++++++++=0D
 hw/misc/led.c              |   1 +=0D
 target/avr/helper.c        |  10 ++-=0D
 hw/avr/Kconfig             |   2 +=0D
 hw/gpio/Kconfig            |   3 +=0D
 hw/gpio/meson.build        |   1 +=0D
 hw/gpio/trace-events       |   5 ++=0D
 12 files changed, 294 insertions(+), 10 deletions(-)=0D
 create mode 100644 include/hw/gpio/avr_gpio.h=0D
 create mode 100644 hw/gpio/avr_gpio.c=0D
=0D
-- =0D
2.26.2=0D
=0D


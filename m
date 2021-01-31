Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA568309E39
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:48:47 +0100 (CET)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6HmA-0003cL-6s
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiS-0001hT-74; Sun, 31 Jan 2021 13:44:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiQ-0007Te-NH; Sun, 31 Jan 2021 13:44:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id 190so10801011wmz.0;
 Sun, 31 Jan 2021 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uooJJLyBqSH0JLXgEvaOK715zFIDOmfUz5/9bBdSXd0=;
 b=QqkEqhsOTKjkj7hY1wmRpIvOUmd7yCC4n3U4eQW3IazSe4PwpIiDAjaosvX8cwD6TQ
 EjMWdRM7BAnB2eaKBwKBa2fk/Fi6wz4DWXcMyv/cE4R3PYvZaDaRYPkPF1VrNALguIv0
 ctKumlFkv4f802ZsaVWwSOMW6ccXIQevBBlRexmoi7LJEkuNvMG32uoNPixwTxtP6olQ
 Fe8aJuZ7SaoBOQMMl7jh7KcX4rb3mTe5B+b3ggH7MKcl2V/orwXxGi19KIz+Dvax+DWR
 iYNVXzBT8Fyri40exuLdFW753HuXImdCNzoG3/zFF2jqzaE2yxlnlUjfO/sAurxtnydw
 F7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uooJJLyBqSH0JLXgEvaOK715zFIDOmfUz5/9bBdSXd0=;
 b=n3JgxDvddrRNaZIYNqJVRePxf+PQOX9KBhbo2BLLxJd3SBovfSgxLr0ip/kmqwQCOk
 /MIzEdtppmHfGy3WgXq80rwSdNrhLwSLN1MfyYLieWqO2fQBiuOgcBkK5FYExpT8mg5/
 B0awCvepivFFK9mClFu6vU6J0tvJR6Ic1qHvK4d7zyI1/SVXcc42oMON4wpA8fWamab/
 RajknstSyjGxcV8+5RWMBtigfT46DqYF9pHiZSNP1uPBi/PjhteCImSojyaqn0AxPNAv
 KvmFX8CUavl1dIf3FSdH++eP2Bt1YABdY0Hss4j1rLzRuwaFyYLcDEnlZOYgGF5xNApD
 /e8A==
X-Gm-Message-State: AOAM532K0YOWIBIxg+ulXhapgssYjBVaMpY41PrfxfQPMeE4+tZJ4I+J
 m7Lrstsol634W0mtMt1K3LrB5cZ08yg=
X-Google-Smtp-Source: ABdhPJx52LK3EuWyH747I2iWnc9vIO23uTSULOhBKWVeWp5hn66cQGus1RPK+lFfkNQzuzHsposfiQ==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr11762822wmh.77.1612118692428; 
 Sun, 31 Jan 2021 10:44:52 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b4sm24051410wrn.12.2021.01.31.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:44:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] hw/arm: Misc trivial fixes/cleanups
Date: Sun, 31 Jan 2021 19:44:43 +0100
Message-Id: <20210131184449.382425-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial bugfixes and cleanup patches noticed while rebasing=0D
my "Support disabling TCG on ARM (part 2)" series.=0D
=0D
Since v2:=0D
- removed incorrect patches added in v2 =3D)=0D
- more fixes for Versal board (CAN, RTC)=0D
=0D
Since v1:=0D
- added patches to remove 64-bit specific features on 32-bit build.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ=0D
  hw/arm/exynos4210: Add missing dependency on OR_IRQ=0D
  hw/arm/xlnx-versal: Versal SoC requires ZDMA=0D
  hw/arm/xlnx-versal: Versal SoC requires ZynqMP peripherals=0D
  hw/net/can: ZynqMP CAN device requires PTIMER=0D
  hw/arm: Display CPU type in machine description=0D
=0D
 hw/arm/digic_boards.c  | 2 +-=0D
 hw/arm/microbit.c      | 2 +-=0D
 hw/arm/netduino2.c     | 2 +-=0D
 hw/arm/netduinoplus2.c | 2 +-=0D
 hw/arm/orangepi.c      | 2 +-=0D
 hw/arm/stellaris.c     | 4 ++--=0D
 hw/Kconfig             | 1 +=0D
 hw/arm/Kconfig         | 5 +++++=0D
 hw/dma/Kconfig         | 3 +++=0D
 hw/dma/meson.build     | 2 +-=0D
 10 files changed, 17 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


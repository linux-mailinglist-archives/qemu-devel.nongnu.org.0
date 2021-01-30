Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9215309172
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:06:34 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fej-0005Wf-Pm
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fTz-0002ka-FC; Fri, 29 Jan 2021 20:55:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fTy-0000qn-2h; Fri, 29 Jan 2021 20:55:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so10651638wrx.4;
 Fri, 29 Jan 2021 17:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juwQODmtdvn6bCkwoawWQSLQCGd025TFqesErnaNJGk=;
 b=aXo/BvSNo1mvBU3NnkxeQi8TkxlnnlCBbz/JTlhSc1P2uBAB+GdYaWbRmPJz5Qo0hZ
 bqP98JT7yZHWwWWG0Q0DnOjejVaHk/DnK8A7ScGdZyfc2kOrbmTDDDvSmakyhsFveVwa
 dSNC13s6qE8DYs49ckmXtVma4e9CLG3h5wQQnOY7C3JJP2vMZf0Nt0heler6VZG/xE5+
 0nRfXqOfyozeweDklBeVEJQWir5aZkxCD2n663McgKgvLUQVJaGiS1hy6FArdD/tDkMo
 kcWUmHE3oiv/fXS5or4ZsZFbS414WIwvbU/YhO+IVWpzhxkcwpDUtnvqeSkiqKIlHsa2
 8sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=juwQODmtdvn6bCkwoawWQSLQCGd025TFqesErnaNJGk=;
 b=TGS8v2kJikgstAnbTy8xBAjoBwGEh63f4VjxiPPz67/0lsDmoIZFZPC12MM8RGgiyK
 aWAgLSsyvAb/NZ1fZA1Tt2PmCTWK7enJlukVxKic1r6y+57n1VoEA4glsS6IIovN5bXb
 6ekHS81ZJ/+/tMkhwaiZFZS4UnM7cdB7oSZfEhEPAAAUS9+1X104RQ+Fr8PMfj9kRxK6
 jZd74LuBPfQRzxhDokean20KKEK5y+8If55AGa/F9c0kzD17nudM80aKv97J7a/eukSH
 IaAHmCh3o3qe6rSiwSVk6JSDD/bHfYMY+LlkbGcEgxySGVfXXeL9jxigrztLUpsU42Y3
 kf9w==
X-Gm-Message-State: AOAM531DttIRhjzmppODCAKbToidT6/JKwAOBRuNECJ5OqmsKbf+yYSs
 8mWfG2RAyGqAnk0fyQZvlF8a+ggJ4fg=
X-Google-Smtp-Source: ABdhPJwATqa7akZxhOTXvXQr704cZQzfALE6d38hH/ZEMByZ6nleBgH/5Nbdi1P3oeX/wJ6n+aKSzQ==
X-Received: by 2002:adf:f452:: with SMTP id f18mr7158826wrp.11.1611971722179; 
 Fri, 29 Jan 2021 17:55:22 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s25sm16116986wrs.49.2021.01.29.17.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/arm: Misc trivial fixes/cleanups
Date: Sat, 30 Jan 2021 02:55:16 +0100
Message-Id: <20210130015519.4072469-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A pair of bugfixes and cleanup patches noticed while=0D
rebasing my "Support disabling TCG on ARM (part 2)" series.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm/Kconfig: Add missing dependency STM32F405 -> OR_IRQ=0D
  hw/arm/Kconfig: Add missing dependency EXYNOS4210 -> OR_IRQ=0D
  hw/arm: Display CPU type in machine description=0D
=0D
 hw/arm/digic_boards.c  | 2 +-=0D
 hw/arm/microbit.c      | 2 +-=0D
 hw/arm/netduino2.c     | 2 +-=0D
 hw/arm/netduinoplus2.c | 2 +-=0D
 hw/arm/orangepi.c      | 2 +-=0D
 hw/arm/stellaris.c     | 4 ++--=0D
 hw/arm/Kconfig         | 2 ++=0D
 7 files changed, 9 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


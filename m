Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3A479AF4
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 14:10:32 +0100 (CET)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myZTr-00035D-Vu
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 08:10:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOS-0005LG-1Q; Sat, 18 Dec 2021 08:05:00 -0500
Received: from [2a00:1450:4864:20::335] (port=55040
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOM-00039B-8V; Sat, 18 Dec 2021 08:04:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so3426633wmq.4;
 Sat, 18 Dec 2021 05:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXmiSCEHo/Q2CSIvOmAVdtoVbTLvt6fIYo6BfySYnOo=;
 b=gF2zIIuFnNfozepWti10reeQ4aPlSFuHg5DajA2DwJFN2AotIa9YoRWLvYfBjEI6jo
 MEal/Yj/i2lBM61teK0fQ38U/rjLaKakBgGZHLuwn8hTf2CbdmGvq0+urvh+1wbyeh8x
 5W9CILpUQMBBCZ5QD503U75FzxVsnapJw768acWiJWNMIgYznEUKVTe19g+Jp09aRawb
 OUQ1XvamOBiO+R/TgymHr5oix6upLdtDt9t8JSHXMOtjmHMvRBKKVsonrG407X85W1Tx
 /HuG8aTudrTIPk+n4gy5CTdZfrVqYkHGJFvy2J/NEIf1bbcbyQBGYCwgqziMYp30KslC
 T0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CXmiSCEHo/Q2CSIvOmAVdtoVbTLvt6fIYo6BfySYnOo=;
 b=qSWZwfG4P8E9wxQLBjxfkccNEWGAETG99oToK86F/R3D3c6blfnzJORWoMWx/9mMaf
 +EcbZUcBX4uCRozGNzX9PKPkG+1Mrcup7Fmc8EWxbW/sBEk1yrarnKiTA5CZ5Usr0K7y
 PCeoz/cBleSz/j+lyI370RcDzGy9m4PocWsHX8GxErYMI8EzWIQ6nHfOjZVtEubz0fEy
 ZCm4/RxiIDMy6MdTVoLqXmiPyayOF73ZmFAGAIYeGx9QAO0hDbw+WgAaxsyTGl3z7cz/
 +mDWXQ0bQMyhXqV+ieuswdPQYLoucBFOeAaLd/wPc24uPRiL6N1zXTmfz1S1IFq9l8uZ
 RpXw==
X-Gm-Message-State: AOAM532H/KyRqlbsT/xhGxtxMWdUJaKlH6UTiiQdQSpGiQrEW+svBMMy
 jEoFKjXmfnt1dhRB9uLxVj1XEGQed4Y=
X-Google-Smtp-Source: ABdhPJwJehI60d/jZypsQuezlmIWME7L0z229k27ynhMQa/TMXEvv5/C8xbzlmxXc58xtz857oYqDA==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr6543724wmh.184.1639832679697; 
 Sat, 18 Dec 2021 05:04:39 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id c187sm11298229wme.33.2021.12.18.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:04:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/qdev: Clarify qdev_connect_gpio_out() documentation
Date: Sat, 18 Dec 2021 14:04:32 +0100
Message-Id: <20211218130437.1516929-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches clarifying qdev_connect_gpio_out() use,=0D
basically that the qemu_irq argument is an input.=0D
=0D
Since v1:=0D
- Addressed Yanan Wang and Peter Maydell comments:=0D
- Correct qdev_init_gpio_out_named() doc=0D
- Drop i8042_setup_a20_line() wrapper=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/qdev: Cosmetic around documentation=0D
  hw/qdev: Correct qdev_init_gpio_out_named() documentation=0D
  hw/qdev: Correct qdev_connect_gpio_out_named() documentation=0D
  hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter=0D
  hw/input/pckbd: Open-code i8042_setup_a20_line() wrapper=0D
=0D
 include/hw/input/i8042.h |  1 -=0D
 include/hw/qdev-core.h   | 24 ++++++++++++++++++------=0D
 hw/core/gpio.c           | 13 +++++++------=0D
 hw/i386/pc.c             |  3 ++-=0D
 hw/input/pckbd.c         |  5 -----=0D
 5 files changed, 27 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D


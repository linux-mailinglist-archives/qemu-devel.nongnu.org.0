Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D093C1587
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:57:08 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VSd-0007m3-7N
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VQu-0005YL-MC; Thu, 08 Jul 2021 10:55:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VQs-0000cV-FA; Thu, 08 Jul 2021 10:55:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r11so2633170wro.9;
 Thu, 08 Jul 2021 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwQPj3QiBiCoFnnjQLaV3JCIX6LKlpqoJ1UyQ5vvgWo=;
 b=M635SPt2BA8HwEjuPVL2xBRENUZ90xwLvWvfJAjUfJtiMQXob5vUoZRYnRxeDS4Io/
 tOoxshiimyetk/mwm7GpBGWF5z2zdDNL7kjIsft8NQPyXwsL6lzHs17OLe3SZ1AP2moZ
 Hm9gXjacBm03HGKG7DLVzAFVjDxHs4ZxTCafudTdo621twRKbuAE0LpTx58Kiwyvn0IC
 KYalpfiJGO3dScwGCYo6W5rVyH+NuD/3yOoI9UubAsqe66Y2ggShYq/xxT/UF0N+eXeJ
 6dgSOmyOzKCp9hRPrdEIqoZIXAdlOgg/6GNwn40pt50tsayPXey2MpBWbESXuvDGdW9y
 WvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JwQPj3QiBiCoFnnjQLaV3JCIX6LKlpqoJ1UyQ5vvgWo=;
 b=jFPhO/26NlG1VjEE9o99bTDoxcXYDsE3PA9v7BCi/nveGfDl3MkV5Mw7thL23Kp7LN
 dYDlcii1JNgsgvLByLJs71qmsoIyn3D1l6jxHMvQrC1UzINVexoDUAnyBuUOCCkK1uT/
 F14L/1RiuV8W8P/lkyXd6aLodiceyzhzImE4u2CUgKGvMV6y3yZZyUsZEAe9vfZCFel9
 5QTufkvsX6I0b5KaE4DSY/yb0brvwh76bM9EzxEzFpejKtz9U5gySZd8iNpDKto0PQt+
 OKyPW0h36iALx/qnbvaz2BG99fveJDx7kQXlufz62CXPdNTeIp3uKWpHB3WZOHRIrpNM
 RZ0A==
X-Gm-Message-State: AOAM530phZtH3EC/Bun66TvJ4wjQwGOlyfjZynBZ+PQkjFAnEFCZYZRB
 0pS5jYhGuN8CFgpDWRDvyr0L3eWRSG0=
X-Google-Smtp-Source: ABdhPJwvx+mCoM5WH2HrjKzNKzSqLUi4OxMgxLYZD+xdUHMIgjHS4Sjv6ulF9BapVRxyRORzmPApPQ==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr35330793wrf.351.1625756115710; 
 Thu, 08 Jul 2021 07:55:15 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a4sm2508462wru.55.2021.07.08.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:55:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Thu,  8 Jul 2021 16:55:12 +0200
Message-Id: <20210708145514.1751773-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- renamed tests (Peter)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests: Remove uses of deprecated raspi2/raspi3 machine names=0D
  hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases=0D
=0D
 docs/devel/qgraph.rst                   | 38 ++++++++++++-------------=0D
 docs/system/deprecated.rst              |  7 -----=0D
 docs/system/removed-features.rst        |  7 +++++=0D
 tests/qtest/libqos/qgraph.h             |  6 ++--=0D
 tests/qtest/libqos/qgraph_internal.h    |  2 +-=0D
 hw/arm/raspi.c                          |  2 --=0D
 tests/qtest/boot-serial-test.c          |  2 +-=0D
 tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---=0D
 tests/unit/test-qgraph.c                |  2 +-=0D
 tests/acceptance/boot_linux_console.py  |  6 ++--=0D
 10 files changed, 39 insertions(+), 41 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


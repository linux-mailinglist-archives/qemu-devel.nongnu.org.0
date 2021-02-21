Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF4320D60
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:05:21 +0100 (CET)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDuyl-0005EH-Vo
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwT-0003a7-Jz; Sun, 21 Feb 2021 15:02:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwS-0007tQ-3u; Sun, 21 Feb 2021 15:02:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so16855064wrx.13;
 Sun, 21 Feb 2021 12:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rrLZGoQ0aWQC4pYMbtQ+AoMx9LnQn81cKjR/Zz4d3uI=;
 b=Gcd639VQOrj9didNHo9kQ8BCGvorcfYw5EVvpa+1tp/0BjvmE0+viU6n/T+Y/VS14r
 5t/VRqLpMcVEUj7sJTSqjKvS7XXOiY3U6Exwy00uPiwI5O1qGk8qQqJP2aF77iQIhzku
 kFtgKOkoDTLZnpOuRLZJU+Glb4D59KleBa3V0yIobLeH+tm4Eofi2NrHSnw8QPrYEpOc
 zL00IO3Wb6RC/5AF97UJi86rU3uDpdS1+hBmkhSZdRb/sbMIC+NwjAFBHZ8CN4puX2B4
 m5fBVU8iULCCAXf9jAIFalWHhzlk2VRwKga1X8t63vmATd7wf7K70TcVdZQCITYReOe2
 dFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rrLZGoQ0aWQC4pYMbtQ+AoMx9LnQn81cKjR/Zz4d3uI=;
 b=r55IPzm8TOj6lC0O88/q7OJ7LrLS+R/yGStK3lSkWX+tAERR8lAcfu3ca5NwrC8Dq6
 M6rzKca0MdxHNkWHfjmz49rEekFlRI8W8kKFYpE7jh5bLkSFnJpg1mz+eoeBSvhGy6Yo
 j6PV4uqEuFut3HkU9HuKwJR5z46XVSGYYqOP4RNeYJ+cJWQ7aF1tAwNPH97qIiZ+1pMO
 0BJJmlFvkMw393ZFl9E8xkOhCMyn0T3/e1VKRBba+KkuO+xvLnvHue6nYpF+E0vKOPnw
 /VsXtNKrfoSnZosnXSSF+fQ1a7rmivw2CvB4PmsnDN8PyJliMdR54p0nftDGItcI0YJ/
 7V0A==
X-Gm-Message-State: AOAM533iiFqy9yIeKOq4BZmzQq55Ty9PmMOfSAlEGRXLxAvPtcN+roCk
 e6dwi7bUV906HuGdIuKD4PURLu/2FdA=
X-Google-Smtp-Source: ABdhPJyt+mgwah4McpZt2E3XinmTjdgN0sAT96CoDAPZj7kbMz+Lu+Yq+svZsfHxxTyR9eCQ8Wn9LA==
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr11587477wra.299.1613937774062; 
 Sun, 21 Feb 2021 12:02:54 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h15sm26372144wrh.13.2021.02.21.12.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:02:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw/sh4: Kconfig cleanups
Date: Sun, 21 Feb 2021 21:02:41 +0100
Message-Id: <20210221200249.2536247-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Addressed Peter Maydell review comments from=0D
https://www.mail-archive.com/qemu-block@nongnu.org/msg80599.html=0D
=0D
Supersedes: <20210208135048.2601693-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  hw/sh4: Add missing license=0D
  hw/sh4: Add missing Kconfig dependency on SH7750 for the R2D board=0D
  hw/intc: Introduce SH_INTC Kconfig entry=0D
  hw/char: Introduce SH_SCI Kconfig entry=0D
  hw/timer: Introduce SH_TIMER Kconfig entry=0D
  hw/block: Introduce TC58128 eeprom Kconfig entry=0D
  hw/pci-host: Introduce SH_PCI Kconfig entry=0D
  hw/sh4: Remove now unused CONFIG_SH4 from Kconfig=0D
=0D
 include/hw/sh4/sh.h           | 12 +++++++++---=0D
 hw/block/tc58128.c            |  7 +++++++=0D
 hw/{sh4 =3D> pci-host}/sh_pci.c |  0=0D
 MAINTAINERS                   |  6 ++++++=0D
 hw/block/meson.build          |  2 +-=0D
 hw/char/Kconfig               |  3 +++=0D
 hw/char/meson.build           |  2 +-=0D
 hw/intc/Kconfig               |  3 +++=0D
 hw/intc/meson.build           |  2 +-=0D
 hw/pci-host/meson.build       |  1 +=0D
 hw/sh4/Kconfig                | 12 ++++++------=0D
 hw/sh4/meson.build            |  1 -=0D
 hw/timer/Kconfig              |  4 ++++=0D
 hw/timer/meson.build          |  2 +-=0D
 14 files changed, 43 insertions(+), 14 deletions(-)=0D
 rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D


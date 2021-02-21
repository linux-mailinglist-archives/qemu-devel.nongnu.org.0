Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B497320E23
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:03:33 +0100 (CET)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwpA-0003As-DL
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwl9-0000Zo-Ig; Sun, 21 Feb 2021 16:59:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwl6-0000bQ-VW; Sun, 21 Feb 2021 16:59:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so17095281wrx.4;
 Sun, 21 Feb 2021 13:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xyNZmRLpUahts1KqhBBLOjSeSr2mmMcTLRo0FRva/h0=;
 b=LPN/dMHgfLTh+6QUGnlW6wT1hhpRT44nyIGTRUz276Y5SNQ+41kl0fxsVKMks2TGWS
 yrdsPJ5pQFAhYMP17b3FbAQhTk3vis/6Kr1ZQj1RWVT13cVNmAL/ECBB1Qi1HE0jOgUc
 Ax4IW2WnNKTLlqG95WvQd8dtCOvFQkFzibW3iwr+5Lvq5d96AfxDVx+79l6Pb9pwf31u
 zIFzhcja0st4cKSpr8IdRvdJ0wn9cjqMVq+JYW+uRIUEzyScmIoBMuLOJj4/gKB+nxfV
 DMOxhC3scFSsSsMRPP/5ZlSjM8Nh7OwpUVO75nmGLjxo7kOCYmzoNmysprHz4bl+5sbW
 tB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xyNZmRLpUahts1KqhBBLOjSeSr2mmMcTLRo0FRva/h0=;
 b=ZHo1ODpnCmxtnMzPzOMIbFj6TyVvr9smMG9IeT3IoeZArBZjphPSrFHdttz6ZtJp+y
 5Vz38wIZTumeySDFNqUjK4jKBs8+o2XxuIx+DYI1hhAP2qwiu/e/FR60XSem+FtSg0Dv
 B6+fqyGZkk6O1pQoBj5erD6HkrUbUEB0/YKHCUxOjwP54zVpKyMTnodzLgA42tvux0IN
 mxNbrcY/5T55NWX/JVX4qHqL0UWS9vbbvEzXPAi5ToArO7IuF8gCc6edeStYJCtCVuGz
 IweOiekBAp1C0Vc0ZFfXRf53yYkHAPWCsgExiJ34wO9PZlxKLAVNvXdt5SCcgeLf/gBg
 7upA==
X-Gm-Message-State: AOAM530gvDRjTNhPftUoVb8mi1coGhVSgp8+Y3fuWpsMbXDaJifOpgnW
 0n55DPcu1ZkF6XNE28WV3SXAlTgac2U=
X-Google-Smtp-Source: ABdhPJzSCfgIU5q93GCIXXMj9+XRCDqQ8xjBksHjYSvDhYYmy2WEnd6UnrDZwvBdsihacFdQQPlyig==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr18778093wro.252.1613944758392; 
 Sun, 21 Feb 2021 13:59:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i1sm22852977wmq.12.2021.02.21.13.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] hw/sh4: Kconfig cleanups
Date: Sun, 21 Feb 2021 22:59:07 +0100
Message-Id: <20210221215915.2568943-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
 qemu-block@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 1 (license) and 7 (pci)=0D
=0D
Since v2:=0D
- Added missing TC58128/SH_PCI Kconfig entries (Peter)=0D
=0D
Since v1:=0D
- Addressed Peter Maydell review comments from=0D
https://www.mail-archive.com/qemu-block@nongnu.org/msg80599.html=0D
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
 hw/block/Kconfig              |  3 +++=0D
 hw/block/meson.build          |  2 +-=0D
 hw/char/Kconfig               |  3 +++=0D
 hw/char/meson.build           |  2 +-=0D
 hw/intc/Kconfig               |  3 +++=0D
 hw/intc/meson.build           |  2 +-=0D
 hw/pci-host/Kconfig           |  4 ++++=0D
 hw/pci-host/meson.build       |  1 +=0D
 hw/sh4/Kconfig                | 12 ++++++------=0D
 hw/sh4/meson.build            |  1 -=0D
 hw/timer/Kconfig              |  4 ++++=0D
 hw/timer/meson.build          |  2 +-=0D
 16 files changed, 50 insertions(+), 14 deletions(-)=0D
 rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D


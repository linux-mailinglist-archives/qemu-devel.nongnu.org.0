Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54EE321A02
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:17:43 +0100 (CET)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC1u-0004KY-US
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzd-00034D-3X; Mon, 22 Feb 2021 09:15:21 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzb-00010H-GB; Mon, 22 Feb 2021 09:15:20 -0500
Received: by mail-ej1-x631.google.com with SMTP id g5so29658600ejt.2;
 Mon, 22 Feb 2021 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CurWkqOb24gRG6OQV8wEhbvAmhbnE91hDXl2lsySbYc=;
 b=pC39kpOfK2p+r1qf+1xH/S2JFFC42M3I1vSbEHYemZgLH2CW2kU+0KUFNwfZutp/aI
 9B3t9Ewnxk3EuZqlrhMFuaDz5mOXB/O4jWg+LQj+lHhE/abrqB8vStwP/BkZ1EIw+0DA
 5ShDNEIyfMkAtD/V6r0wBJjiTGeJxpQhgjBCXydwK7HMYUwL5JxLkH/HmSK8CB7lSP9O
 sodG53RHUtYvXkTXeiQ+2FI1qK7m+qPxAaSFie8ByQuXB+y9F3Sv331R5ZKWZ8Vs9Tyi
 bw9ilFrlwe9r0zbRB44T3jo41+tu9uCqsrySVVlYItL+pTIQXGMuxJQ62q6BZ/y2W/Op
 TY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CurWkqOb24gRG6OQV8wEhbvAmhbnE91hDXl2lsySbYc=;
 b=hrIxgiu5KiRXIzNF7yz87JVV6HlYiSipK0MLacs8ZuKSU8s6lc0tKkPigUL0aIwGtr
 EbDbyB2GxkyQa7wiRPlDJWqDt2fQPRRBBC9DcQ9UYcTUB3J4X8Mww7WCJ7XT3x34ndpt
 ejuM6IMlJEmTxUCXbOl+AWJEGIBI3kYlWTeY+f/yiyjeL8lP5E5VRXGzyMPj/MVMpG3P
 axZTNgSKXJrroBXR3QcxMdQgHlWi2sRZLi4C3lSn3bUoFeth8mBmly2knhbjsdbcDOKa
 kWW6qgkCOKvgyZ/aztTQCAqd/HvugkN/2U56RmaXbXIUc4L4gwZZzuKpfqR1zJFZhCks
 zQHw==
X-Gm-Message-State: AOAM53353OYvxfQmhSQa4LiYHhRzCwYJ6nfhjhECH1Nf792L88Mz+XhK
 MVxjnzWj+chHrKrnd+7dyXCcQyMVdGk=
X-Google-Smtp-Source: ABdhPJztKUmVOHkl28bMYUg9RtL2EjP+XZEzxiOOxD6xmDT7lpBc41RzgdjplOnwto1ZSJTBsSkicQ==
X-Received: by 2002:a17:906:c30e:: with SMTP id
 s14mr5920825ejz.253.1614003316390; 
 Mon, 22 Feb 2021 06:15:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h2sm12096502edw.14.2021.02.22.06.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] hw/sh4: Kconfig cleanups
Date: Mon, 22 Feb 2021 15:15:06 +0100
Message-Id: <20210222141514.2646278-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Missing review: 1 (license)=0D
=0D
Since v3:=0D
- Include full MIT license text (Peter)=0D
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
 include/hw/sh4/sh.h           | 31 ++++++++++++++++++++++++++++---=0D
 hw/block/tc58128.c            | 26 ++++++++++++++++++++++++++=0D
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
 16 files changed, 88 insertions(+), 14 deletions(-)=0D
 rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06129995A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:10:53 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAhY-0005C4-6K
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAdP-0008R8-6m; Mon, 26 Oct 2020 18:06:36 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAdL-0005l3-DO; Mon, 26 Oct 2020 18:06:33 -0400
Received: by mail-ej1-x632.google.com with SMTP id gs25so16126230ejb.1;
 Mon, 26 Oct 2020 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aL5quuceH2hv9yMMQO0Q69DZ/woSC+UgyYuLQtAgKFg=;
 b=ry2ZwKE5Si0UMOAXqImFephmZ5zHH94fFYpOsksXM1xm9qZSpWEshWQ52R+Fu0bSHs
 QvjjqVRA08RhmdbjwhzzHCPIOfEnVCy506eUoJSQOoPtKFlGIcF7WQSmR8t1HTAKTPIs
 zyG0g+mhcEh0W2RGs0kv/xA8KVw/pMtEwNkXqBi3q+MRn26JQZSyenw4amz/3vwG8jyf
 Ow2kbrTQjCMm8rLfu52nTbGix+Q1G01auRX3kgU/HrRCcBEc3Mn9Rb7lkwcp5neIUyZy
 ox0yMkIVh0ib0uZai26u6AGDZSM2iFYt0HQEunGcPDQKzu5jbI8mKGIILcaxDcGRYbCA
 RQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=aL5quuceH2hv9yMMQO0Q69DZ/woSC+UgyYuLQtAgKFg=;
 b=GHMdnnK97qVy3xkXeRyLQbTuwjLy9KIOZWg9sorZWv8uEb7N1o/RsBscQDsBv5Mu1R
 B9bP1VoR1JSSfTM7+MBKtXx18LS97HaNXXspJaQ+eDWAKw/IlAedKRMXrpM58c1k4gsf
 365XXe+JwHw5/vLufCyHcgYjdirk5ioh6et7TR0DfPeTS6voWD7WXifdFQTk9UTkverv
 BpqLBBBRZpjELAGKMJ0SrPA/kI5Jn5DIr/8uSGoinAAS0nlYixCV8WGuHOwbMDweSTia
 Ot4EVEyxQAwLvsznssKx7QOBGo71uhQLjI0tMtw7TTGAbVI8DPjv37sWz03UwdQ16j6l
 AboA==
X-Gm-Message-State: AOAM532FoIzW/AE6vQrCW6v58966H4QdeO83LpohzDPO0ObWbYoheX8D
 ccvEwjC+L1XRfYRpM7LF+O7uyLP2IFA=
X-Google-Smtp-Source: ABdhPJxglkxQM13a2FMTD32xCV2dfcSWRxWvNXY0kOT/I+YWrevNPJylD8kWv0/4zq9xNZ5Pju39RQ==
X-Received: by 2002:a17:906:170f:: with SMTP id
 c15mr13931983eje.347.1603749987403; 
 Mon, 26 Oct 2020 15:06:27 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id f14sm39532edv.79.2020.10.26.15.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:06:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] LED API patches for 2020-10-26
Date: Mon, 26 Oct 2020 23:06:17 +0100
Message-Id: <20201026220624.60878-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a5fac424c76d6401ecde4ecb7d846e656d0d6e89=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
ue=3D=0D
st' into staging (2020-10-26 10:33:59 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/led-api-20201026=0D
=0D
for you to fetch changes up to 06972067c48fc21a47445b5d706368f1129f216f:=0D
=0D
  hw/arm/tosa: Replace fprintf() calls by LED devices (2020-10-26 13:44:58 =
+0=3D=0D
100)=0D
=0D
----------------------------------------------------------------=0D
API to model LED.=0D
=0D
CI jobs results:=0D
. https://cirrus-ci.com/build/4879251751043072=0D
. https://gitlab.com/philmd/qemu/-/pipelines/207661784=0D
. https://travis-ci.org/github/philmd/qemu/builds/738958191=0D
. https://app.shippable.com/github/philmd/qemu/runs/891/summary/console=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (7):=0D
  hw/misc/led: Add a LED device=0D
  hw/misc/led: Allow connecting from GPIO output=0D
  hw/misc/led: Emit a trace event when LED intensity has changed=0D
  hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1=0D
  hw/misc/mps2-fpgaio: Use the LED device=0D
  hw/misc/mps2-scc: Use the LED device=0D
  hw/arm/tosa: Replace fprintf() calls by LED devices=0D
=0D
 include/hw/misc/led.h         |  97 ++++++++++++++++++++=0D
 include/hw/misc/mps2-fpgaio.h |   2 +=0D
 include/hw/misc/mps2-scc.h    |   2 +=0D
 include/hw/qdev-core.h        |  16 ++++=0D
 hw/arm/aspeed.c               |  20 +++++=0D
 hw/arm/tosa.c                 |  40 ++++-----=0D
 hw/misc/led.c                 | 161 ++++++++++++++++++++++++++++++++++=0D
 hw/misc/mps2-fpgaio.c         |  23 +++--=0D
 hw/misc/mps2-scc.c            |  27 +++---=0D
 MAINTAINERS                   |   6 ++=0D
 hw/arm/Kconfig                |   2 +=0D
 hw/misc/Kconfig               |   5 ++=0D
 hw/misc/meson.build           |   1 +=0D
 hw/misc/trace-events          |   6 +-=0D
 14 files changed, 365 insertions(+), 43 deletions(-)=0D
 create mode 100644 include/hw/misc/led.h=0D
 create mode 100644 hw/misc/led.c=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


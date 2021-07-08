Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D73C18A7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:50:55 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YAn-0005OE-WE
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36TPnYAYKCvovkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com>)
 id 1m1Xhd-0007fi-TT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:20:45 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36TPnYAYKCvovkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com>)
 id 1m1Xhb-00040I-MM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:20:45 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso4388338qkb.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=U6n+48LR5NRD4ybZqBw/DIHVvTqxQlwgOhEinse2pV2jca8Wlu9Vk5gQmQE5DbibdF
 DdxcZwu1X6RrPfUw7B1jHIm8crpDvYmQBWDX5c4sltzLoXIITsNHWKecHRUBREvzSGMN
 kRRQdnKtNISR5tHuDUhXyKYZGq0L8n2g68psFX7xBKRkxm0UG2XSPA8byX0uF9ZB06n2
 qO0JyoVch7Me5qGK7L9edh9GTTcB7GIuDClAtbwMfHwTBSAeERdLP1Mtvmmjg8SyBbke
 FEn5+PNXTIF3+KUOGsb1788iEgAxKZ31bbqlsjnJvSQzlrlGAalioGZ8k46Km4coezbs
 +5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=H6Mtsyd2Y8DE67k51NWu14OOqv5nGSoICGFt8r91CEJiMTCx1WnTq7YsT18P9gDSPt
 ECrENBbL8uEFLnJaW7mAv+AOkr5xZhzZi2oLXOih7QbpEzMVwGPLYx7yJBK2ZJlCwTCj
 VUTOrqzG7AJT/9m98tyFDneuFxWCNbJ0G1kZKs+E7GAiPPQumtgC6SutpOWU3PhdBz5E
 sYIejpI1uPGp8DI9MpHj5bJYcazQ3Y9BwU+XULvt43VdAYVzKKH5kCqaOh1HhowbCkGS
 SWGRGpPPodPd8eDNhpgj+w5I07RXvIEyd27r6t1WDq5ygwl/l3RGnhDAbzM+1tOGGIFK
 DPKA==
X-Gm-Message-State: AOAM531aBicTDwiHPPEUvVLbt2NeT69MBRMzpga8kCkO/ODU3ZcHwOLk
 VaG47ieLLtkm0RHoCrjsn3pnAfi/gOs=
X-Google-Smtp-Source: ABdhPJwvYfS5F+COPdw2jhzWrSV85y7FbaS1KUBZWcKHB55QWkkQGmBYQAoy85PH7EPyRdJIx1Ku3BsWFaU=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:6b42:285b:df15:bf])
 (user=titusr job=sendgmr) by 2002:a05:6214:190:: with SMTP id
 q16mr31079439qvr.9.1625764841628; Thu, 08 Jul 2021 10:20:41 -0700 (PDT)
Date: Thu,  8 Jul 2021 10:20:12 -0700
Message-Id: <20210708172017.1865352-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v5 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=36TPnYAYKCvovkvwutiqqing.eqosgow-fgxgnpqpipw.qti@flex--titusr.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This patch series adds an interface to start supporting PMBus devices in QE=
MU.
I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.

PMBus is a variant of SMBus meant for digital management of power supplies.
PMBus adds to the SMBus standard by defining a number of constants and comm=
ands
used by compliant devices. The specification for PMBus can be found at:

https://pmbus.org/specification-archives/

Currently, the goal for these devices is to emulate basic functionality by
reading and writing registers. Timing, and some logical operation is not
implemented. This implementation supports nearly all available registers fo=
r
PMBus including:
   - Voltage inputs and outputs
   - Current inputs and outputs
   - Temperature sensors

Unimplimented registers get passed through to the device model, and device
models can opt out of using the standard registers with flags. The included
devices make use of these fields and illustrate how to interface with the p=
mbus
class.

Datasheets for sensors:

https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272=
.pdf

Since v4:
- switched to BIT_ULL for flags to enable 32 bit hosts

Since v3:
- added VMState descriptions. Adding PMBusPage info to the vmsd has proven =
to be tricky, it's a TODO for now.

Since v2:
- bump for feedback
- removed commented out code

Since v1:
- addressed Joel's comments
- split out tests into their own patches

Thanks for reviewing,

Titus Rwantare

Titus Rwantare (5):
  hw/i2c: add support for PMBus
  hw/misc: add ADM1272 device
  tests/qtest: add tests for ADM1272 device model
  hw/misc: add MAX34451 device
  tests/qtest: add tests for MAX34451 device model

 include/hw/i2c/pmbus_device.h |  517 +++++++++++
 hw/i2c/pmbus_device.c         | 1612 +++++++++++++++++++++++++++++++++
 hw/misc/adm1272.c             |  544 +++++++++++
 hw/misc/max34451.c            |  775 ++++++++++++++++
 tests/qtest/adm1272-test.c    |  445 +++++++++
 tests/qtest/max34451-test.c   |  336 +++++++
 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/misc/Kconfig               |    8 +
 hw/misc/meson.build           |    2 +
 tests/qtest/meson.build       |    2 +
 12 files changed, 4249 insertions(+)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

--=20
2.32.0.93.g670b81a890-goog



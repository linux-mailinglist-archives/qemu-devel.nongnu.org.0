Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A13C18D7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:02:43 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YME-00065L-F1
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KDXnYAYKCj0shstrqfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1m1Xml-0007uw-IT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:26:03 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:50029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KDXnYAYKCj0shstrqfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1m1Xmj-0005fa-J7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:26:03 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 61-20020aed21430000b029024e7e455d67so3967575qtc.16
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=K9kYRc9cSplR/H7M/UTCZgWEHZjwNylhJ+NkUU9cIZX7CJRHLZ9wAJBlR+KZwTS+gt
 c9gnaOIybtoxVD7Klrv4BtWkRy4mpAqOmdzYGvTjd8TPsRb7FPA8/GqtVKX/W4HkQC86
 gAX+aaZbo0MAeSiZADYIzzww+UzZNs4LAZ+5nGRDYW0kEJTdcMlltuiQnds7ECfhHA+/
 tdi4+aS7h0r1KDV6MfDnqO/DjAwRHjrQ0myNXrsQ9reMtBcRjhpt/N0Zvt3DP71Xz5xC
 cm3ZpXxUfhBAs3OQPa//K1ieG9Oom0HhNNiUWmabRZmN/UWTjUue/vS01xIPXWdJNJ/2
 WO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=MpkObXMhWh5SmnE78e/KyybjlVFMdeYf2SATpkDVebGEx044+j0tS4M2+OhhIxr22p
 dUrdfheOQIjTBXy0x7cbbCPsSP7uzlU+ab+OkOInFJt/FN0qJLO7FXUtBdNTQPpUWdhq
 P6F0VnE7pF0n69nhNaXgb8GzeX2WcBetKiJU9s1I8W1i2YStFwIIFmUN8MNjB+qz4Qzw
 Kt3eNlnVyzTwVeo3WAPNOJM9tMurjdG+Pk24cHGSHgIz2HokjFm7Vuu+mLm+uGJLWJ/G
 gmIV0Lo56LgRD50rk3k5PZR/zYC26QAQi80QfZ1VEZpTRDiMzx0khP5RxIbTCdnLP3HZ
 NFCw==
X-Gm-Message-State: AOAM530aSqwZDbq9ez5IbYq3FIZL+YFz8BXv96nIvJEuSYprQA9V0Otx
 j4o7BePnpKq3hAnY45P+X0/llerPoi4=
X-Google-Smtp-Source: ABdhPJwc3SkGlIOiuFtp79AsKxRQi6EMESCK3M7ENkFdDkA/AQ+PEyzO6Htvo1y+nduuJkXtTMWCp7EYplE=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:6b42:285b:df15:bf])
 (user=titusr job=sendgmr) by 2002:a05:6214:10c8:: with SMTP id
 r8mr30783053qvs.28.1625765160086; Thu, 08 Jul 2021 10:26:00 -0700 (PDT)
Date: Thu,  8 Jul 2021 10:25:51 -0700
Message-Id: <20210708172556.1868139-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v5 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3KDXnYAYKCj0shstrqfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--titusr.bounces.google.com;
 helo=mail-qt1-x84a.google.com
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



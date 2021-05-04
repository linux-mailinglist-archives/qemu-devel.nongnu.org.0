Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21E372E20
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:31:43 +0200 (CEST)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxxV-0007un-0u
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cHaRYAYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1ldxvb-0006ow-6p
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:43 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:43687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cHaRYAYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1ldxvY-0004IL-Dj
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:29:42 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 d201-20020ae9efd20000b02902e9e9d8d9dcso3859090qkg.10
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=+AP6JAThegVPXHNi/RjhLA5mOkHytxECsDnMSnhbSAg=;
 b=EM13GmCq1ylYB4LHq4oOX0XFlGFmNkRQ1urhtAVHkFBJgB7MJvXwzBeN0yjg1ZjMqb
 3w2kBUMooW1HiachFku3VViOGeYjEB9o2GuD4nlkjln/lSJsoDTHZFhmzS2Uj6DYywiF
 sAIZd3A9GbLtcrDaraHcJUMMxd9GI7EQoBdsUanKFGwQ647QOoQldz1l+hnTW8hb7SWK
 YZ5coba8U/I5Oz770yb9BwfFGqogSofSbYo3wYF1iAQilfA9sFnSfuK4RV14neXjAGg9
 rVKeSSLdHAtiZHVf41sUHB+9LOrR5FrFWW3JC8Lj2MrS5se3UszY9D8RDlLDEMty9QXC
 2GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=+AP6JAThegVPXHNi/RjhLA5mOkHytxECsDnMSnhbSAg=;
 b=VXoJU/jn1QIDqHZBVONY3d1DiS6846NnotshrB4005x47xSkVR9HIJqXWRmc85mBAk
 aRrCVdEuZbg1yyv1gmnYyjWi92gjIJEwG6ctYNI//ZT3yXtjNXFEwozgj5/mM/NlwuK6
 NG1Yc7cOfPYhcYBMTc/dTrfz22sBmFB6LsJk3OPbYCg2qQ6k9i/HUI202WbknPdQ/hER
 pHI6otP9lfVKn/6N/yuAAxMg7+URYnfi7/5AoqutdAW5FABCbUSIePbHXHeTtLsaMTe5
 cNfXAjoQIVRENaMleP7vcPQMgrOkMh0DsrGrRDztZoTMDOERzofeKJ2BM1F0fs9oFpYA
 HkeQ==
X-Gm-Message-State: AOAM532ie/hTZgri0/Im4x5ekdIRLgRPgfa2WnNx8LnbeNRJL522IrPP
 eoTsKXjegHLdevBYwLvMoETbHOtfrVw=
X-Google-Smtp-Source: ABdhPJz6Thw6jKcw+8Ekkbuzb6Ls8VNWZYZWICrts2aM7RxuY7z2cDXWPZn6g8NzRGYbGIosbOihXiW7DXg=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:85f8:a1ce:1113:b790])
 (user=titusr job=sendgmr) by 2002:ad4:4e94:: with SMTP id
 dy20mr26311812qvb.50.1620145776624; 
 Tue, 04 May 2021 09:29:36 -0700 (PDT)
Date: Tue,  4 May 2021 09:28:38 -0700
Message-Id: <20210504162841.2884846-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH 0/3] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3cHaRYAYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Thanks for reviewing,

Titus Rwantare

Titus Rwantare (3):
  hw/i2c: add support for PMBus
  hw/misc: add ADM1272 device
  hw/misc: add MAX34451 device

 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/i2c/pmbus_device.c         | 1611 +++++++++++++++++++++++++++++++++
 hw/misc/Kconfig               |    8 +
 hw/misc/adm1272.c             |  551 +++++++++++
 hw/misc/max34451.c            |  727 +++++++++++++++
 hw/misc/meson.build           |    2 +
 include/hw/i2c/pmbus_device.h |  520 +++++++++++
 tests/qtest/adm1272-test.c    |  453 +++++++++
 tests/qtest/max34451-test.c   |  344 +++++++
 tests/qtest/meson.build       |    2 +
 12 files changed, 4226 insertions(+)
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

--=20
2.31.1.527.g47e6f16901-goog



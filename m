Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F154CE90
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:23:28 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vnj-0006ZB-Qz
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VNy-0007lr-89
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VNw-00087k-CJ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id d129so11748340pgc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2xHg/8CdDh4TgNjbEj8kgAdhdbU6MUS/LEK+mybdtU=;
 b=WEnMsaUb1u66/r0f0ic6Dc3ww+aRkcBVcCMtNCgCCp+4H6OrsvU1vx/wrjSRT4umvH
 XZ17FyYFwqpn/WauFjQ/0tRe9z89RqFWbnuXO2Wz10TYw3FEuEkMp3eTYhyHiGmP+erD
 HPen9lrelMj8xWLSbDO8IMCfsVAa4002e0jQH45jVHETSQnKeJvWRGCM83KmvqLG9B1K
 sWYhWniTbAydJFyhuPXiW0csBZ4mwa22VSYWD+U7MihFvt/Vuzso0K6GsJUdOjl4Yfsn
 OplQzLSi0qTu8NyNjtTVMAqA40ZP9Nsfvdj8lD/N0A2mCR5o98/b/CIiJnK9iziHztkh
 /utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2xHg/8CdDh4TgNjbEj8kgAdhdbU6MUS/LEK+mybdtU=;
 b=78nZMub+Z5KLDvQmqicscPTMbmhremJjbbfsUDGSyIc14enUHTxLskm69DsNJvK4zf
 nglox1kw+DWZqJGzhXeRkQbYYdofPfLiUWMxs2rDooWMsnoOWiIPOOrDVp0f7PzIEm01
 IbqHRPq2YZPZ9xSHobzMJzhBNhz/8vE+B5dZ4h+qxN2gHr7ux3UK2bUaK7aMgAPCa5Tc
 MO7yRAdiwfcHl3j/ujYeWleQL3Sxk3CqyjSnrWL4pSAKoeyY71EFQVTfSKs5Q+/dphto
 i6/CYMRh6+5+8uCnYZHnv0lTzfZ58FzCozdSlMXMSYwzjZyZw3qT0PZtmT0tA11fWkZ1
 Y2LQ==
X-Gm-Message-State: AJIora+OPp1UCf7/rcg1alezzB5+54BpAcrXt1fSIIYZTnRn95aOc3jI
 PG3A8+msrvcM+EFbRon/ZzU=
X-Google-Smtp-Source: AGRyM1uVhcAxGMlzFctO+mkMFOAwpqQGIn6yHxKgWw2aCz8EP3qpQmim0rDRuWoYtSnuARb3yTkk7A==
X-Received: by 2002:a05:6a00:f09:b0:522:c250:cc4c with SMTP id
 cr9-20020a056a000f0900b00522c250cc4cmr289012pfb.66.1655308606700; 
 Wed, 15 Jun 2022 08:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.56.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:56:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 0/7] cutils: Introduce bundle mechanism
Date: Thu, 16 Jun 2022 00:56:27 +0900
Message-Id: <20220615155634.578-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

v6: Reuse get_relocated_path() in find_bundle() (Paolo Bonzini)

v5:
* Prefer qemu-bundle if it exists. (Daniel P. Berrangé)
* Check install_blobs option before installing BIOSes (Paolo Bonzini)
* Add common code to set up qemu-bundle to the top level meson.build
  (Paolo Bonzini)

v4:
* Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
  https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
* Rebased to the latest QEMU.

v3:
* Note that the bundle mechanism is for any files located relative to the
  installation tree including but not limited to datadir. (Peter Maydell)
* Fix "bridge" typo (Philippe Mathieu-Daudé)

v2: Rebased to the latest QEMU.

Akihiko Odaki (7):
  datadir: Simplify firmware directory search
  qga: Relocate a path emitted in the help text
  Remove prefixes from path configuration macros
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  ui/icons: Use bundle mechanism
  net: Use bundle mechanism

 .travis.yml                 |  2 +-
 include/qemu/cutils.h       | 21 ++++++++++++++-
 meson.build                 | 35 ++++++++++++++++--------
 net/tap.c                   |  2 +-
 pc-bios/keymaps/meson.build |  2 ++
 pc-bios/meson.build         | 19 +++++++------
 qemu-options.hx             | 11 ++++----
 qga/main.c                  |  2 +-
 scripts/oss-fuzz/build.sh   |  2 +-
 softmmu/datadir.c           | 43 +++++++-----------------------
 tests/qtest/fuzz/fuzz.c     | 15 -----------
 tests/vm/fedora             |  2 +-
 tests/vm/freebsd            |  2 +-
 tests/vm/netbsd             |  2 +-
 tests/vm/openbsd            |  2 +-
 ui/cocoa.m                  |  2 +-
 ui/gtk.c                    |  2 +-
 ui/icons/meson.build        | 32 ++++++++++++++++------
 ui/sdl2.c                   |  4 +--
 util/cutils.c               | 53 ++++++++++++++++++-------------------
 20 files changed, 132 insertions(+), 123 deletions(-)

-- 
2.32.1 (Apple Git-133)



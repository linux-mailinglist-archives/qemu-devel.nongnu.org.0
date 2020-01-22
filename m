Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC61449DE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:35:21 +0100 (CET)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu5rT-0002Dg-NO
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu5pG-0000fd-SC
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu5pF-0001iB-Gj
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:02 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44372)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu5pF-0001hi-8g
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:01 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 62so2524462pfu.11
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NU3dT7ktZF43zREp7DSy6BFGqsYrLYb8VSKn9tb9veA=;
 b=j99txnDaVcClcUR4gZIb6IFXf291NFhRyLKqY8PpbOqe4u8mVuzL0lSs7y2JW41dOc
 VW7afV6AIFpgXG0yYoGN/jp/CRmu9z0ZRA/sGdoJlDeV6XETyc1f6SMYHlQIDYCEYdW+
 yRRE72QCZJgjdYNeVgbiC7JDKVGGsZL18/+KEYJUtN60bQ2x6K6h5J0YayRMLlm6cJo/
 lqTM8RhIhdi+oGz1cT25ifCetc7qGwjAMH6oHB30homLqFCEudTBxD05qwdRkr4g1trl
 sth3BewjCXEEP1gxZ6fiCBtld1+D1lq3ukEziaGvy+/wYj5YFCLaTJzPINhYM7sdJlUs
 Ci9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NU3dT7ktZF43zREp7DSy6BFGqsYrLYb8VSKn9tb9veA=;
 b=SYaJB4+i2AiNW7rxNb9s2Z6OQ5xxtpbFXWgO5oiOfEfqDul53PClIOaPmQ4jpG/De7
 yaWge2B6dhByRkLdSaGrfT+6YVhErXY9tl9ex036mX2HIXbJr8Nxzhjk57G4QO3apTRe
 ikbt1jxizOngETS0Zed/axDQZRQjE+fJM0JvbEmtEc80tdZ/OCUTz0Vhg0YeirX9FfNx
 9coJTfSUYtwdSI5THpoT/elpS1Ots3ud6BCVGGnwkJcDMHjA0yUlSJmRRAJtuVjp9dZV
 mhuOl2xL5eY1MjzJ1pK692jaXRFns6mckhav9XkgE1SgCevWism+Snoky23+PiNHajWu
 gd2g==
X-Gm-Message-State: APjAAAX1gP3A1tRlf/wMBZYRf23rVJlXG51hNM+RKU8d4YxUGSlz7MbH
 nbheQTqi4X7H1CWHWGdS8G62lJIMQdQ=
X-Google-Smtp-Source: APXvYqwkW4d463KmyDeHuCBvyIR76d7zblgq/wbkeuSD9UzfhfISGBmC8NFXMdsoRpW1KUEyVaQB0A==
X-Received: by 2002:aa7:864f:: with SMTP id a15mr554345pfo.136.1579660379816; 
 Tue, 21 Jan 2020 18:32:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id t1sm42935209pgq.23.2020.01.21.18.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:32:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] target/hppa patch queue
Date: Tue, 21 Jan 2020 16:32:45 -1000
Message-Id: <20200122023256.27556-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42f
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3e08b2b9cb64bff2b73fa9128c0e49bfcde0dd40:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/edk2-next-20200121' into staging (2020-01-21 15:29:25 +0000)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-pa-20200121

for you to fetch changes up to a66cfb7306b7cf7a023e11536fdd942f3f9276b9:

  target/hppa: Allow, but diagnose, LDCW aligned only mod 4 (2020-01-21 15:51:54 -1000)

----------------------------------------------------------------
Improve LASI emulation
Add Artist graphics
Fix main memory allocation
Improve LDCW emulation wrt real hw

----------------------------------------------------------------
Helge Deller (3):
      hw/hppa/dino.c: Improve emulation of Dino PCI chip
      hppa: Add support for LASI chip with i82596 NIC
      hppa: Switch to tulip NIC by default

Philippe Mathieu-Daudé (3):
      hw/hppa/machine: Correctly check the firmware is in PDC range
      hw/hppa/machine: Restrict the total memory size to 3GB
      hw/hppa/machine: Map the PDC memory region with higher priority

Richard Henderson (1):
      target/hppa: Allow, but diagnose, LDCW aligned only mod 4

Sven Schnelle (4):
      ps2: accept 'Set Key Make and Break' commands
      hppa: add emulation of LASI PS2 controllers
      seabios-hppa: update to latest version
      hppa: Add emulation of Artist graphics

 hw/hppa/hppa_hardware.h     |    1 +
 hw/hppa/hppa_sys.h          |    2 +
 hw/net/i82596.h             |   55 ++
 include/hw/input/lasips2.h  |   16 +
 include/hw/input/ps2.h      |    1 +
 include/hw/net/lasi_82596.h |   29 +
 target/hppa/helper.h        |    2 +
 hw/display/artist.c         | 1450 +++++++++++++++++++++++++++++++++++++++++++
 hw/hppa/dino.c              |   97 ++-
 hw/hppa/lasi.c              |  368 +++++++++++
 hw/hppa/machine.c           |   33 +-
 hw/input/lasips2.c          |  289 +++++++++
 hw/input/ps2.c              |   15 +
 hw/net/i82596.c             |  734 ++++++++++++++++++++++
 hw/net/lasi_i82596.c        |  188 ++++++
 target/hppa/op_helper.c     |    9 +
 target/hppa/translate.c     |   15 +-
 MAINTAINERS                 |    4 +-
 hw/display/Kconfig          |    4 +
 hw/display/Makefile.objs    |    1 +
 hw/display/trace-events     |    9 +
 hw/hppa/Kconfig             |    3 +
 hw/hppa/Makefile.objs       |    2 +-
 hw/hppa/trace-events        |   10 +
 hw/input/Kconfig            |    3 +
 hw/input/Makefile.objs      |    1 +
 hw/input/trace-events       |    5 +
 hw/net/Kconfig              |    7 +
 hw/net/Makefile.objs        |    2 +
 hw/net/trace-events         |   13 +
 pc-bios/hppa-firmware.img   |  Bin 783724 -> 766136 bytes
 roms/seabios-hppa           |    2 +-
 32 files changed, 3343 insertions(+), 27 deletions(-)
 create mode 100644 hw/net/i82596.h
 create mode 100644 include/hw/input/lasips2.h
 create mode 100644 include/hw/net/lasi_82596.h
 create mode 100644 hw/display/artist.c
 create mode 100644 hw/hppa/lasi.c
 create mode 100644 hw/input/lasips2.c
 create mode 100644 hw/net/i82596.c
 create mode 100644 hw/net/lasi_i82596.c


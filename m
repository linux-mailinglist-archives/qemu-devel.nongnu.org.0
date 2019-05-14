Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E01CC4B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 17:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQZm4-00061T-SU
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 11:55:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQZjl-0004i2-TH
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQZjk-00065J-NH
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hQZjk-00060m-EM
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id d9so11451769wrx.0
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iEoVVZAVHss4n35p8GLl31rn2j4t7jeWxJ/prn1yZz4=;
	b=YrMJMAzSQyNuY2voaeiYbXp5BW7M/F+vMWeEzL5+s3BFnv0awlsN0Rn3+kt5S/wAra
	pLT3J3ljZwZCuBl2M0KolB5HZ7hRXALkWECKcUn+y9NmkQpZ6s6w2vfUTpOP15G7NYqG
	VVPZsRvoWvtPlgMx5iJqMLcqkbWc7zWS9dQI++E2FYe/+rBdmREMLKrgh+wpnk2/x7h7
	IJJSQHImdd5VRrtKUAtvZmAb2MSIB/6YNkeGzIMPeLl4jyn03uS3pgdjYsyiHBgl7Ccf
	EO49OOsJBJwrcMGxVpM+6lGyS59uh+BnSpSk7OnHJ/zhLOIflH3V4JRHjWRqikUtoBAl
	KCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iEoVVZAVHss4n35p8GLl31rn2j4t7jeWxJ/prn1yZz4=;
	b=EZHOuoiF4UGr40xVczeH6cNsrzLCtecxSZtOVsmV6Ldy0D26g2UrYe6DQesuFKIcEU
	UMIGtz5cM/2F2jDT0MzrUYyca37dFO8WcU6s9x6mLWlYYqsoxKG3da1au3EOthSPc0dF
	T3t/Q/Ca180cr/9Bcp4Os9mrCzHc0Oh4pxqQtsljIMVhpGjo5+slN1+azL3eLRbxZmrp
	0K4rgYyBGPDARkkApamgvlpAfZayHXjNasC0WhV4EG8o225IsLV+NaDQrWxwihd31BGJ
	HYepYk5oltSLXuJwqXivQ+GdyAWJGUkuoAYLuPwbdg0rFdqKNi9vLA7jjNBy+vH7ikYs
	0QIg==
X-Gm-Message-State: APjAAAWCwnnOYd2Et/PFo/jZ2BRUT37Gcm7hrCLLfQ1bef7CkXSSJyl0
	iOgL7bMDv5XmE5UEZvUWgoJxrg==
X-Google-Smtp-Source: APXvYqzYSTIIcI34QJSOmjxBi6vAsqHS3PPB4yNy9jT2bzWHlMZwdBzvR+WSZp6W960sAkyJVlUeDA==
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr22402623wrj.189.1557849182851; 
	Tue, 14 May 2019 08:53:02 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	e8sm38762850wrc.34.2019.05.14.08.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 08:53:02 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D48841FF87;
	Tue, 14 May 2019 16:53:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 16:52:50 +0100
Message-Id: <20190514155301.16123-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-devel] [RFC PATCH  00/11] semihosting cleanup and re-factor
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

This collects together some fixes from last weeks RFC clean-up patch
as well as a generalised version of the chardev console tweak I made
last week for testing/next. As it happens it only really made sense
for ARM and MIPs logging semihost calls but there is certainly scope
for handling all the semihost syscalls in a more common way. I didn't
make the changes to xtensa as that already has a bi-directional
console-via-chardev setup and that would be quite a bit of extra work
to support.

I've added myself to the MAINTAINERS section for the common code but
my focus at the moment is really just to improve the use of
semihosting in our expanding system tests. Hopefully this is enough to
ensure future enhancements (common open/read/write/close?) can be done
and easily enabled for all semihost targets.

Please review.


Alex Bennée (11):
  semihosting: move semihosting configuration into its own directory
  semihosting: introduce CONFIG_SEMIHOSTING
  semihosting: implement a semihosting console
  semihosting: enable chardev backed output for console
  target/arm: fixup some of the commentary for arm-semi
  target/arm: use the common interface for WRITE0/WRITEC in arm-semi
  target/arm: add LOG_UNIMP messages to arm-semi
  target/arm: correct return values for WRITE/READ in arm-semi
  target/mips: only build mips-semi for softmmu
  target/mips: convert UHI_plog to use common semihosting code
  MAINTAINERS: update for semihostings new home

 MAINTAINERS                                 |   7 +
 default-configs/arm-softmmu.mak             |   1 +
 default-configs/lm32-softmmu.mak            |   2 +
 default-configs/m68k-softmmu.mak            |   2 +
 default-configs/mips-softmmu-common.mak     |   1 +
 default-configs/nios2-softmmu.mak           |   2 +
 default-configs/xtensa-softmmu.mak          |   2 +
 gdbstub.c                                   |   7 +-
 hw/Kconfig                                  |   1 +
 hw/Makefile.objs                            |   1 +
 hw/mips/mips_malta.c                        |   2 +-
 hw/semihosting/Kconfig                      |   3 +
 hw/semihosting/Makefile.objs                |   2 +
 hw/semihosting/config.c                     | 186 ++++++++++++++++++++
 hw/semihosting/console.c                    |  77 ++++++++
 include/exec/gdbstub.h                      |  11 ++
 include/hw/semihosting/console.h            |  38 ++++
 include/{exec => hw/semihosting}/semihost.h |  17 +-
 include/sysemu/sysemu.h                     |   1 +
 linux-user/Makefile.objs                    |   2 +
 linux-user/arm/semihost.c                   |  24 +++
 qemu-options.hx                             |   6 +-
 stubs/Makefile.objs                         |   1 +
 stubs/semihost.c                            |  70 ++++++++
 target/arm/arm-semi.c                       |  98 ++++++-----
 target/arm/helper.c                         |   2 +-
 target/arm/translate-a64.c                  |   2 +-
 target/arm/translate.c                      |   2 +-
 target/lm32/helper.c                        |   2 +-
 target/m68k/op_helper.c                     |   2 +-
 target/mips/Makefile.objs                   |   3 +-
 target/mips/helper.h                        |   2 +
 target/mips/mips-semi.c                     |  14 +-
 target/mips/translate.c                     |  10 +-
 target/nios2/helper.c                       |   2 +-
 target/xtensa/translate.c                   |   2 +-
 target/xtensa/xtensa-semi.c                 |   2 +-
 vl.c                                        | 128 +-------------
 38 files changed, 545 insertions(+), 192 deletions(-)
 create mode 100644 hw/semihosting/Kconfig
 create mode 100644 hw/semihosting/Makefile.objs
 create mode 100644 hw/semihosting/config.c
 create mode 100644 hw/semihosting/console.c
 create mode 100644 include/hw/semihosting/console.h
 rename include/{exec => hw/semihosting}/semihost.h (78%)
 create mode 100644 linux-user/arm/semihost.c
 create mode 100644 stubs/semihost.c

-- 
2.20.1



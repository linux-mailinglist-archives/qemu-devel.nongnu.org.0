Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D895BEEB2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:43:50 +0200 (CEST)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oak5t-0005Zg-Sh
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oafV5-0007RF-S8
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:49:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oafV4-0003FK-1F
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:49:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id n12so4958386wrx.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fXeyrAP5y2x5Vu1erUVzC9sKDBemEdcHty7tXEogvkc=;
 b=ONFMDy0mzR5QPnB/sG2ab/XPU8QVkOalCloBxP3jcuSWaaDVoQMCJsqQO8uLXncoc/
 us4mF2/jLk4IvjHIDh2iespYh0FqkOThP1mufWBHFjJJg1oVtfCR8QOq3ILBjQda1gvO
 eU4vpNRYJ0gMhIhMJDFU6VOxPx+m0oWgQaU5nYM2axeOdhFbdchpcy0hppPUjNkVWrXj
 7fsNHn3kr0soFgkRTBNSYr3cCdIBFOWpVxBDiXTGAtSXHUDgtFYNSlyep8Gv3hZGSUP9
 n/v2d1Dyx3Fug20NjAALFiBGyO6S35uSO0hcoKIxNZH4xeMz6lhkzDd/oK35nnvNisbX
 yTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fXeyrAP5y2x5Vu1erUVzC9sKDBemEdcHty7tXEogvkc=;
 b=nlySPpcRNKRMBeAr/6A0rYDzIXnNwJX1i7l/WWUPfRbGZUo2J3ohArYs19nsd5pb1j
 Hwp+TcE5uaVS1CFer3gW4Fmg8Pe/U6yEBwOayS6xpC8OiJV+TiC0xUB2bgeyaMkVYgkL
 BQhEHzEJUfonCSCMNdYnhZW5uTP1K6joHC2YrIqsQQsp7RzWKf/ObZPkNBjQEVKr9j1h
 9xqVfPoP994EYlpajbQvjjsssUJBTYaRwLgqYuCpBrT+S9qaNCZ8jBr/Z+18x49C9QYp
 adj8p0cD+/ok3G7lOqSUxSwx/HCOqPiNayFJEmXo+f8ZxbDBOiti9EoSb7bmoRgDjIwd
 0/8A==
X-Gm-Message-State: ACrzQf0g71f1o3KBwGvu592bq5mt/f+1lselTOXxV2F8nCpRgLfvhkx1
 /j9C36pGDnveAfAL5La4OwM=
X-Google-Smtp-Source: AMsMyM6uHHziJgO4x1LAPWIEGZ5hXka+DhaX8uTtL8iHVd1ejyJtkCjaZ3PzlcuFpbH8yXzHiHpZsA==
X-Received: by 2002:a5d:453a:0:b0:228:7873:1101 with SMTP id
 j26-20020a5d453a000000b0022878731101mr14188847wra.241.1663688967825; 
 Tue, 20 Sep 2022 08:49:27 -0700 (PDT)
Received: from liavpc.localdomain ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a05600c17c300b003b3307fb98fsm102304wmo.24.2022.09.20.08.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 08:49:26 -0700 (PDT)
From: Liav Albani <liavalb@gmail.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org,
	Liav Albani <liavalb@gmail.com>
Subject: [PATCH 0/1] hw/display: expose linear framebuffer address in Bochs
 VBE registers
Date: Tue, 20 Sep 2022 18:49:21 +0300
Message-Id: <20220920154922.248790-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Recently I submitted patches to the SerenityOS project in regard to
enhancing the overall abstractions of x86-specific hardware support
code in the SerenityOS kernel in preparation for aarch64 support.
Then, I moved on to submit another patch to introduce support of the
isa-vga device, as we currently allow people to run an ISA-PC machine
with SerenityOS without any GUI (see this link for more details -
https://github.com/SerenityOS/serenity/pull/15259).

This all worked pretty well and with the patches being applied it is
possible to boot into a graphical environment. However, not all things
are perfect (yet). To ensure we only create a driver instance for an
isa-vga device, I try to ensure that PCI was disabled due to failed
hardware test and not because of a user decision, to ensure that we do
not try to drive a PCI stdvga device with an ISA device-targeted HW
parameters. This worked well too, but one problem is left now - I still
had to hardcode the framebuffer address to 0xE0000000 in the driver.

Honestly, it's not a big issue of its own - many devices are assumed to
exist at well-defined physical memory addresses, especially when it is
related to plain old ISA devices. However, I still want to fix this,
for these reasons:
1. Although it is reasonable to assume no more than one isa-vga device
  will exist in one machine, this could be changed easily later on.
  As it stands now, on an ISA-PC machine with no PCI bus, there are
  basically zero methods to detect hardware - you have to assume the
  hardware is there, or just to probe for it and hope for the best.

  Relying on the BIOS to do hardware detection is also a possibility
  as it knows the best upon the platform it being used on.
  In the SerenityOS project we decided for the time being to not use
  the BIOS as that will require doing hacky stuff to use 16-bit code
  segments. Also, the BIOS is not perfect and of course it does not
  give you every little detail you might want, as long as we consider
  the standard services of an x86 BIOS these days.

  For an ISA-PC machine, the assumption of one isa-vga device at
  most is OK and will be true in the future as well.

  However, for other machines, and the one I am especially interested
  in, the microvm machine, this claim could be easily revoked as the
  microvm machine exposes a device tree - we could easily place many
  ISA-VGA devices on the "System bus" of a virtual machine, essentially
  having multiple framebuffer devices on such machine setup, with no PCI
  bus being involved at all. Of course, we will need to figure out how
  to make some sort of an ISA-VGA device that resembles a bochs-display
  device - it should not have VGA capabilities because otherwise the
  devices' resources will be in conflict for VGA control of the VGA IO
  space. The Bochs VBE registers will also need to be located in
  different IO ports too for each device.

  This idea is quite neat in my opinion, because it could speed up the
  boot of such VM while still providing sufficient display capabilities
  for those we need them. It could help developers to test their OSes
  on such hardware setups to ensure multi-monitor configuration works
  reliably when there's no PCI bus at all but many framebuffer devices
  being used in one VM.

2. This is more related to the SerenityOS project - I prefer to not 
  hardcode physical addresses at all wherever I can do so. This makes
  the code cleaner and more understandable as far as I observe this from
  the angle of the person which is not me, that tries to make sense from
  the code flow.

3. The costs of adding this feature are pretty negligible compared to
  the possible value of this, especially if we apply the idea of running
  multiple ISA-VGA devices on one microvm machine. Still, the only major
  "issue" that one can point to is the fact that I bump up the Bochs VBE
  version number, which could be questionable with how the feature might
  be insignificant for many guest OSes out there.

Liav Albani (1):
  hw/display: expose linear framebuffer address in Bochs VBE registers

 hw/display/bochs-display.c     | 10 +++++++++-
 hw/display/vga.c               | 13 +++++++++++--
 include/hw/display/bochs-vbe.h |  7 ++++++-
 3 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.37.3



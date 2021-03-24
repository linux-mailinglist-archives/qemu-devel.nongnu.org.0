Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869073472BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:35:26 +0100 (CET)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy33-0006zt-I0
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy19-0005pK-5Y
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:27 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy17-0005jE-5U
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id ay2so7457146plb.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oXm6qUw6QpqC4i+KxPbUebxbIUSL7Ivcb0MJyKya+I=;
 b=Dq5YHyuvtfPVVxZSMBj9KfQnlRR1F//WnsUl0ZeYVwto3RaGYXKDiVgcN+4EClCe4r
 WNhu7DAS5PcAUNGCCV60vGib6KKpaZjvrt2gSTjId0VsLsyZlI3U+cOpWlj0+OE1yyA9
 xIuI881Xn8jU9FY7OWXV1/ZxeTUK7LDABcGkKlGEIvA6cZBJUk6fXu47JsQceyXjKOIl
 eZt7OtTpAnbGqbGXAWy8f+ZjZHJJfDhIFwLUp+he7MeaOy4pUQ7hwzOlG8ZvtxnXmxiY
 0SXD4rBJZFjHCf6nfMMyzpCNu1iJos1MeVr74ryQZ3P7aNTHB9xCcQaEYIHt+hiGtjUH
 UfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oXm6qUw6QpqC4i+KxPbUebxbIUSL7Ivcb0MJyKya+I=;
 b=Cm8U8AUH8Mn0/FyiyIDZsilB0heQ7I5n8rbmYMJLLDyLb+nKrpXHr1IY322YHA34DB
 ouq4OSpigFE2TiU4NhQHe1LiSTx+uT2vXquCa31bNsj3GenFHqvrJxQqCoQKcDS/85H2
 D832KY2M/B8LWUrrIhlWS7GTCzm0NqRyso7ACtqOPcnfVoHdrt3ejlRHCNSvM/Tmr3M7
 yIiUaAmumutI7I8/Zk6mcUrLISxqJRj4MYJl4q9zCSY3cImDnbmHGTN+EHlBAWM4x0vd
 2JCjxh1yh6X/sdrMh4ikA5+wUbgUQhKaIABswHTk4Cj0jazfWPu7lwx17CX9jEX24hvf
 TLZw==
X-Gm-Message-State: AOAM533gEQdW8TTecDQEwC7JI5tfwFSge2fgSlWlGEkIyd7cWonNDXut
 U5L7S63v6AqurCbVm5Yl0CU2kKfcXb4o9Q==
X-Google-Smtp-Source: ABdhPJwV2veriH5lE2/FppPRfc75XJLNcgNpOMRgo4DkBt/f0AdqnCPSiQ1uy5goWAO2JsWqicI47w==
X-Received: by 2002:a17:90a:f28d:: with SMTP id
 fs13mr2072460pjb.220.1616571203090; 
 Wed, 24 Mar 2021 00:33:23 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id d13sm1412207pgb.6.2021.03.24.00.33.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 00:33:22 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] virtio: Implement generic vhost-user-i2c backend
Date: Wed, 24 Mar 2021 13:03:09 +0530
Message-Id: <cover.1616570702.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is an initial implementation of a generic vhost-user backend for
the I2C bus. This is based of the virtio specifications (already merged)
for the I2C bus.

The kernel virtio I2C driver is still under review, here is the latest
version (v10):

  https://lore.kernel.org/lkml/226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com/

The backend is implemented as a vhost-user device because we want to
experiment in making portable backends that can be used with multiple
hypervisors.  We also want to support backends isolated in their own
separate service VMs with limited memory cross-sections with the
principle guest. This is part of a wider initiative by Linaro called
"project Stratos" for which you can find information here:

  https://collaborate.linaro.org/display/STR/Stratos+Home

I mentioned this to explain the decision to write the daemon as a fairly
pure glib application that just depends on libvhost-user.

We are not sure where the vhost-user backend should get queued, qemu or
a separate repository. Similar questions were raised by an earlier
thread by Alex Bennée for his RPMB work:

  https://lore.kernel.org/qemu-devel/20200925125147.26943-1-alex.bennee@linaro.org/


Testing:
-------

I didn't have access to a real hardware where I can play with a I2C
client device (like RTC, eeprom, etc) to verify the working of the
backend daemon, so I decided to test it on my x86 box itself with
hierarchy of two ARM64 guests.

The first ARM64 guest was passed "-device ds1338,address=0x20" option,
so it could emulate a ds1338 RTC device, which connects to an I2C bus.
Once the guest came up, ds1338 device instance was created within the
guest kernel by doing:

  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[
  Note that this may end up binding the ds1338 device to its driver,
  which won't let our i2c daemon talk to the device. For that we need to
  manually unbind the device from the driver:

  echo 0-0020 > /sys/bus/i2c/devices/0-0020/driver/unbind
]

After this is done, you will get /dev/rtc1. This is the device we wanted
to emulate, which will be accessed by the vhost-user-i2c backend daemon
via the /dev/i2c-0 file present in the guest VM.

At this point we need to start the backend daemon and give it a
socket-path to talk to from qemu (you can pass -v to it to get more
detailed messages):

  vhost-user-i2c --socket-path=vi2c.sock --device-list 0:20

[ Here, 0:20 is the bus/device mapping, 0 for /dev/i2c-0 and 20 is
client address of ds1338 that we used while creating the device. ]

Now we need to start the second level ARM64 guest (from within the first
guest) to get the i2c-virtio.c Linux driver up. The second level guest
is passed the following options to connect to the same socket:

  -chardev socket,path=vi2c.sock,id=vi2c \
  -device vhost-user-i2c-pci,chardev=vi2c,id=i2c

Once the second level guest boots up, we will see the i2c-virtio bus at
/sys/bus/i2c/devices/i2c-X/. From there we can now make it emulate the
ds1338 device again by doing:

  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[ This time we want ds1338's driver to be bound to the device, so it
should be enabled in the kernel as well. ]

And we will get /dev/rtc1 device again here in the second level guest.
Now we can play with the rtc device with help of hwclock utility and we
can see the following sequence of transfers happening if we try to
update rtc's time from system time.

hwclock -w -f /dev/rtc1 (in guest2) ->
  Reaches i2c-virtio.c (Linux bus driver in guest2) ->
    transfer over virtio ->
      Reaches the qemu's vhost-i2c device emulation (running over guest1) ->
        Reaches the backend daemon vhost-user-i2c started earlier (in guest1) ->
          ioctl(/dev/i2c-0, I2C_RDWR, ..); (in guest1) ->
	    reaches qemu's hw/rtc/ds1338.c (running over host)


I hope I was able to give a clear picture of my test setup here :)

Thanks.

Viresh Kumar (5):
  hw/virtio: add boilerplate for vhost-user-i2c device
  hw/virtio: add vhost-user-i2c-pci boilerplate
  tools/vhost-user-i2c: Add backend driver
  docs: add a man page for vhost-user-i2c
  MAINTAINERS: Add entry for virtio-i2c

 MAINTAINERS                                 |   9 +
 docs/tools/index.rst                        |   1 +
 docs/tools/vhost-user-i2c.rst               |  75 +++
 hw/virtio/Kconfig                           |   5 +
 hw/virtio/meson.build                       |   2 +
 hw/virtio/vhost-user-i2c-pci.c              |  79 +++
 hw/virtio/vhost-user-i2c.c                  | 286 +++++++++
 include/hw/virtio/vhost-user-i2c.h          |  37 ++
 include/standard-headers/linux/virtio_ids.h |   1 +
 tools/meson.build                           |   8 +
 tools/vhost-user-i2c/50-qemu-i2c.json.in    |   5 +
 tools/vhost-user-i2c/main.c                 | 652 ++++++++++++++++++++
 tools/vhost-user-i2c/meson.build            |  10 +
 13 files changed, 1170 insertions(+)
 create mode 100644 docs/tools/vhost-user-i2c.rst
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c
 create mode 100644 hw/virtio/vhost-user-i2c.c
 create mode 100644 include/hw/virtio/vhost-user-i2c.h
 create mode 100644 tools/vhost-user-i2c/50-qemu-i2c.json.in
 create mode 100644 tools/vhost-user-i2c/main.c
 create mode 100644 tools/vhost-user-i2c/meson.build

-- 
2.25.0.rc1.19.g042ed3e048af



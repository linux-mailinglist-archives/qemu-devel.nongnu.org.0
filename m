Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D419236D74E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:28:29 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjIp-0005r5-Dd
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lbjDT-0003E0-EJ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:22:55 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lbjDR-0001zx-1j
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:22:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 10so1072913pfl.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=fnY+SEeW4g37OK6SFGalUweKAF0mr9r5Uak1BgtfjGI=;
 b=xvyXZVsJ4wTidUVonTPM8QrqiLlw11kVmwox4/oS1+rWwRh5PxuPjNwFN2tyIavmYR
 /RXKf3CUl6k4/q7Vm7WNOIDoK69eFVr4PU4veE9+Tr6x0PL+Osc6v1OiMwofENhg6srv
 E4lTHBrMlxAFfiL2GIdcyz0iLWLDs+6H6NxxnqnpqHB5yNyQT3GYDkCLgC6lnz/ECz/9
 jDz0671xFrxADjaVKB9pB8Kz835hfoC0arGWJYdCS03Yz2jqHHYUogUUUk+DyP7nA4hx
 1jVlvhm6ujiWrzw9GFCqQncbhY5FQ7RirYDiSYfDaLZtCLC6xzStEkGo3nJgTfemT0xE
 eR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=fnY+SEeW4g37OK6SFGalUweKAF0mr9r5Uak1BgtfjGI=;
 b=WwPbnT9naxhyMVT8LeTLBumwjnWzmQRG6qecejwiHelnXGOWBdZ5EFn/5fxqhJhRej
 FO81AwQT3+TsVTSK2ClEAjeIaPyWmvETbaxcUgRYzxi93PSDU76XLfam2GYu3XZGWJyt
 V/TCcPDAPlT9tG+hxLU9IxZ5os1EyjYH3b6D9y/aVCjl6HiQEqCQlavsxnRJ2RjaHWaW
 +8IL3QGYUsXrJ3wyds3q3Hhe7jDmX3/SwZ+ahJWpIfdTj9tg/xRspxITzeaevW+93Y3O
 adEYXAeBVLxuoBAGsrzIFyD04m7LGEfdZ96kLSFr41DGPTLM8Ct8g0uzzaJJtkyxZVVX
 +fNw==
X-Gm-Message-State: AOAM533Tc0VFiYOapgI8AMzOBmVm18u+gnJSd3eowszd9xUDYZ5LQ3hc
 hs2HJ/uEV+RGBcoF0jrJoh9c9g==
X-Google-Smtp-Source: ABdhPJypjAElPoaq5Zz8XJVKVL7eJmFIBC995racPhT4f4E2WBlO6RgeXl3En/y5KWTVj9WM2Krvmg==
X-Received: by 2002:a05:6a00:8a:b029:260:e095:8581 with SMTP id
 c10-20020a056a00008ab0290260e0958581mr28618960pfj.43.1619612570129; 
 Wed, 28 Apr 2021 05:22:50 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id v130sm1734021pfc.25.2021.04.28.05.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:22:49 -0700 (PDT)
Date: Wed, 28 Apr 2021 17:52:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: stratos-dev@op-lists.linaro.org, rust-vmm@lists.opendev.org
Subject: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pf1-x42a.google.com
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
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Trilok Soni <tsoni@quicinc.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

In my earlier attempt [1], I implemented the vhost-user-i2c backend
deamon for QEMU (though the code was generic enough to be used with
any hypervisor).

And here is a Rust implementation of the vhost-user-i2c backend
daemon. Again this is generic enough to be used with any hypervisor
and can live in its own repository now:

  https://github.com/vireshk/vhost-user-i2c

I am not sure what's the process to get this merged to Rust-vmm.
Can someone help ? Is that the right thing to do ?

-------------------------8<-------------------------

Here are other details (which are same since the earlier Qemu
attempt):

This is an initial implementation of a generic vhost-user backend for
the I2C bus. This is based of the virtio specifications (already merged)
for the I2C bus.

The kernel virtio I2C driver is still under review, here [2] is the latest
version (v10):

The backend is implemented as a vhost-user device because we want to
experiment in making portable backends that can be used with multiple
hypervisors.  We also want to support backends isolated in their own
separate service VMs with limited memory cross-sections with the
principle guest. This is part of a wider initiative by Linaro called
"project Stratos" for which you can find information here:

  https://collaborate.linaro.org/display/STR/Stratos+Home

I2C Testing:
------------

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

  target/debug/vhost-user-i2c --socket-path=vi2c.sock -l 0:32

[ Here, 0:32 is the bus/device mapping, 0 for /dev/i2c-0 and 32 (i.e.
0x20) is client address of ds1338 that we used while creating the
device. ]

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



SMBUS Testing:
--------------

I wasn't required to have such a tedious setup for testing out with
SMBUS devices. I was able to emulate a SMBUS device on my x86 machine
using i2c-stub driver.

$ modprobe i2c-stub chip_addr=0x20
//Boot the arm64 guest now with i2c-virtio driver and then do:
$ echo al3320a 0x20 > /sys/class/i2c-adapter/i2c-0/new_device
$ cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw

That's it.

I hope I was able to give a clear picture of my test setup here :)

-- 
viresh

[1] https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@linaro.org/
[2] https://lore.kernel.org/lkml/226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com/


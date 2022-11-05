Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7061DF03
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 23:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orRCl-0003kw-Uh; Sat, 05 Nov 2022 17:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orRCk-0003il-Io
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orRCi-0003yR-6B
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667685590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFdjAmWv6sdJKaQNmIqrSFAbfKlzEv00fYaEmVaxCbg=;
 b=OU4GiQZnzt3JyiumykoXN6b7pS/h9UKmIJSwKg1YCF5S2MVvGEsgzIWjIPYF2qz8X33c2V
 R2EoHwQGdUrSbYp/EeBHF+LFTtCSeStafa6EF6n+kXvz8wMEc8yECk1Uff7HoLdqqSVnlt
 kUD5IG4A5iEi5mufhHW7b4Nqs8Xys7g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-q85y1r5zP5q5e-SwK4FuGQ-1; Sat, 05 Nov 2022 17:59:49 -0400
X-MC-Unique: q85y1r5zP5q5e-SwK4FuGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so4032176wmb.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 14:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFdjAmWv6sdJKaQNmIqrSFAbfKlzEv00fYaEmVaxCbg=;
 b=ALEa2SkUSle8hn/JanbKxy+tlyJFo3FeEhQQw3Ia9F/WqyyAV+KgVAubLJi10DZVK4
 QIYSfoX93xXK3gq6Gjj0ohpeK6hMPN0upHdwbwfKbURCb04knD+k7sB5rDAtDCS4e2Eb
 kHJPDcd2YmbjqvIDi3Z/yyNqQkGvrbU/pbedoId+KWSP+3fqqBcELIZ9MCEvH11ySMYa
 tvmB8+/EoQ4om92WWvFt9IGpKSFu7N5hvNrnD7bQCAmcuWnkL2jUD6w4+Iu6szGrtJ/w
 MVEKfh0ig8SCxlulJotHW9gvgarvj0Yr+wmTCbnk0ULhHcwFTnBqxZIWPZLS8EQHfrsQ
 fsEQ==
X-Gm-Message-State: ACrzQf1yta+KgdTN59FGsw1oHQYB5Sq1y5TJP5i4mLNBwaVy/zpTlPBb
 GswUr0oBP+JkcM2Ig2HG10A4ccd32vMJUxdeUCAgFMnFi1mewdZB3+9QoMlgBkJW7KFm++ekrYE
 KVTDnhlBXOHAad0qaOIBXyAiRxjhsF2FiZfaI1Lfl4+YzoezIJCqRUx1NsYb4
X-Received: by 2002:a05:600c:4451:b0:3c6:fb65:24cb with SMTP id
 v17-20020a05600c445100b003c6fb6524cbmr37637014wmn.144.1667685587995; 
 Sat, 05 Nov 2022 14:59:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uJ62KZyHwZPTPrWkgVvBk4UtY+007o22AwK1bI0MbJwYpZFSnQj4C1hHzk0U9e+iqk7dGQw==
X-Received: by 2002:a05:600c:4451:b0:3c6:fb65:24cb with SMTP id
 v17-20020a05600c445100b003c6fb6524cbmr37636994wmn.144.1667685587515; 
 Sat, 05 Nov 2022 14:59:47 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 w2-20020adfcd02000000b0022ac672654dsm3079113wrm.58.2022.11.05.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 14:59:46 -0700 (PDT)
Date: Sat, 5 Nov 2022 17:59:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: Re: [PATCH RFC 0/3] virtio fix up started checks
Message-ID: <20221105175822-mutt-send-email-mst@kernel.org>
References: <20221105172453.445049-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105172453.445049-1-mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 05, 2022 at 02:16:29PM -0400, Michael S. Tsirkin wrote:
> This is an attempt to fix up device started checks.
> Unfortunately this causes failures in CI
> and I could not figure it out.
> 
> The simplest way to test is to set QEMU_CI to 2
> on gitlab, then push there.
> 
> Alternatively, push to gitlab, then
> create pipeline while setting QEMU_CI to 1,
> then run amd64-fedora-container and then clang-system -
> that slows things down enough to make the failures
> trigger.
> 
> See: https://gitlab.com/mstredhat/qemu/-/jobs/3279537476

And here is a backtrace:

――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-PIIDV1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-PIIDV1/reconnect.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-U7IGV1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-U7IGV1/connect-fail.sock,server=on
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-U7IGV1/connect-fail.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-BUYEV1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-BUYEV1/flags-mismatch.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
qemu-system-arm: unable to start vhost net: 22: falling back on userspace virtio
vhost lacks feature mask 0x40000000 for backend
qemu-system-arm: failed to init vhost_net for queue 0
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (5)
UndefinedBehaviorSanitizer:DEADLYSIGNAL
==8747==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x0000000000fc (pc 0x55b8ada1276d bp 0x000000000007 sp 0x7ffd127cf5f0 T8747)
==8747==The signal is caused by a WRITE memory access.
==8747==Hint: address points to the zero page.
    #0 0x55b8ada1276d in virtio_bus_release_ioeventfd /builds/mstredhat/qemu/build/../hw/virtio/virtio-bus.c:216:30
    #1 0x55b8ade97b51 in vu_gpio_set_status /builds/mstredhat/qemu/build/../hw/virtio/vhost-user-gpio.c:172:9
    #2 0x55b8ade593f9 in virtio_set_status /builds/mstredhat/qemu/build/../hw/virtio/virtio.c:2442:9
    #3 0x55b8ada4d3d7 in vm_state_notify /builds/mstredhat/qemu/build/../softmmu/runstate.c:334:13
    #4 0x55b8ada4459a in do_vm_stop /builds/mstredhat/qemu/build/../softmmu/cpus.c:262:9
    #5 0x55b8ada4e2db in qemu_cleanup /builds/mstredhat/qemu/build/../softmmu/runstate.c:827:5
    #6 0x55b8ad6054fc in qemu_default_main /builds/mstredhat/qemu/build/../softmmu/main.c:38:5
    #7 0x7f3da8999eaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
    #8 0x7f3da8999f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3ff5f)
    #9 0x55b8ad5dc094 in _start (/builds/mstredhat/qemu/build/qemu-system-arm+0xc17094)
UndefinedBehaviorSanitizer can not provide additional info.
SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/mstredhat/qemu/build/../hw/virtio/virtio-bus.c:216:30 in virtio_bus_release_ioeventfd
==8747==ABORTING
../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [8737]) failed unexpectedly
(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――



https://gitlab.com/mstredhat/qemu/-/jobs/3279637541


gpio attempts to stop backend when notifiers are not enabled.

No clue how that triggers.



> 
> Alex, Viresh, need your help here. Thanks!
> 
> Alex, pls note that same failures are triggered by your RFC - if we know the
> root cause we can discuss solutions. So if you prefer pls go ahead and
> debug that. Thanks!
> 
> Michael S. Tsirkin (3):
>   virtio: distinguish between started and running
>   gpio: use virtio_device_running
>   virtio: revert changes to virtio_device_started
> 
>  include/hw/virtio/virtio.h   | 7 ++++++-
>  hw/virtio/vhost-user-fs.c    | 2 +-
>  hw/virtio/vhost-user-gpio.c  | 4 ++--
>  hw/virtio/vhost-user-i2c.c   | 4 ++--
>  hw/virtio/vhost-user-rng.c   | 4 ++--
>  hw/virtio/vhost-user-vsock.c | 2 +-
>  hw/virtio/vhost-vsock.c      | 2 +-
>  7 files changed, 15 insertions(+), 10 deletions(-)
> 
> -- 
> MST
> 



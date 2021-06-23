Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2C3B2092
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:47:55 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7uj-0005GJ-W4
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lw7t7-0004ZS-Sm
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lw7t4-0007P2-VM
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624473969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ufYakWePAf95zJneOBj3ZgLc5JLks22porPibFsdnq0=;
 b=AUzYWO1NzAj662L/4Z1YDKl9q1Wo8FduRrylOe1I8CjVczYpMRtTckToIGKggaseZyYmnX
 VvpFmB0AkQrJLNJEqi8N/Oi9irJMlYpxei3mULyzLkax3KdCTP+4/PHs1Nu5tPFRw205rB
 2Mf02+Z5GGp6f3Yj0CNHcjkD0PN/D0Y=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-QPfvkTm3NPqm6WL6OY-1IQ-1; Wed, 23 Jun 2021 14:46:07 -0400
X-MC-Unique: QPfvkTm3NPqm6WL6OY-1IQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 m5-20020ac5cfc50000b0290249866b3a41so1048911vkf.19
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 11:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ufYakWePAf95zJneOBj3ZgLc5JLks22porPibFsdnq0=;
 b=dtTXOc+3IjY3W+XcIWiqh7N+BOBKFfQD7vzVE/u9N10eKJZZeI0wa9gZxkDTf6g+hf
 Z1HVGAJux5qCt6wVAEf3wlKQ5oOYRNCDzFCuIPwxXqzdSMQcc8OySUSOv8CNyo+qenJi
 vHI38FCts0ycvIgI9hhGep/QDOfmGmsSv45DNQqeFeS5OKw4hNzNX0/5coHShrdb2Ve8
 AIkKQziHUH5NANMNmhTG0P7o4xYW8jnF6WdqSEXqbdb/t/t3E8cuak3d76ZiMfxGdJsg
 jUVdevxwm55wt9CpQ8naYcW8Y6p/XxdvOG4FvbST/mRtMYFqvvbtRBG+AqHuR6qOdJpy
 gT5w==
X-Gm-Message-State: AOAM533A0A9hsCIqCz6rw4cUqR7SgFSgt2aucU4cCWWQpXrpZibICTv4
 1SC6VJhyT/AlbUrB6oT8tzj4Y6XdO4UV/VNyK76GvSPsAFbXecX3n8405fIonj6s3iQEn0ha4qe
 PHiphOP5qvcBiBYe4V+6S8wOcrvTqKT0=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr1990499uam.110.1624473966518; 
 Wed, 23 Jun 2021 11:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEv4uNT5hSOpSoQ3IIh/I7VzXPyVHZ1RQOVZseaXOIEnF8HWMbpsysJwJgrDFdFz7gRxcDLL789Ht3eqitZ7c=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr1990471uam.110.1624473966280; 
 Wed, 23 Jun 2021 11:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332431624.194926.5437474699339441010.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332431624.194926.5437474699339441010.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 23 Jun 2021 15:45:40 -0300
Message-ID: <CAKJDGDbgnE88t7=urUpHOOP5+gqi96QtnFJbTaunFvSk8q3i5A@mail.gmail.com>
Subject: Re: [PATCH 6/6] tests/acceptance: Linux boot test for record/replay
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pavel,

On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
>
> This patch adds a test for record/replay, which boots Linux
> image from the disk and interacts with the network.
> The idea and code of this test is borrowed from boot_linux.py
> This test includes only x86_64 platform. Other platforms and
> machines will be added later after testing and improving
> record/replay to completely support them.
>
> Each test consists of the following phases:
>  - downloading the disk image
>  - recording the execution
>  - replaying the execution
>
> Replay does not validates the output, but waits until QEMU
> finishes the execution. This is reasonable, because
> QEMU usually hangs when replay goes wrong.
>

It took me some time to review this patch because I could not identify
what makes it an automated test. I mean, when I look at an automated
test I expect a pass/fail/skip output. I could not identify the
expected output of this test compared to the actual result. If I did
not miss anything, this test will always pass unless there is an
exception that, potentially, could not be related to the record/replay
mechanism.

Also, as far as I could check, you inherit from the LinuxTest class
but only use the cloudinit methods. Most of the other methods are not
used or overridden. In this case, I think it is worth splitting the
LinuxTest with a new mixin utility class to handle the cloudinit part.
If you need help with that, let me know.

> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> ---
>  MAINTAINERS                      |    1
>  tests/acceptance/replay_linux.py |  116 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 tests/acceptance/replay_linux.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd29042..9675a1095b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2863,6 +2863,7 @@ F: include/sysemu/replay.h
>  F: docs/replay.txt
>  F: stubs/replay.c
>  F: tests/acceptance/replay_kernel.py
> +F: tests/acceptance/replay_linux.py
>  F: tests/acceptance/reverse_debugging.py
>  F: qapi/replay.json
>
> diff --git a/tests/acceptance/replay_linux.py b/tests/acceptance/replay_linux.py
> new file mode 100644
> index 0000000000..15953f9e49
> --- /dev/null
> +++ b/tests/acceptance/replay_linux.py
> @@ -0,0 +1,116 @@
> +# Record/replay test that boots a complete Linux system via a cloud image
> +#
> +# Copyright (c) 2020 ISP RAS
> +#
> +# Author:
> +#  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +import logging
> +import time
> +
> +from avocado import skipUnless
> +from avocado.utils import cloudinit
> +from avocado.utils import network
> +from avocado.utils import vmimage
> +from avocado.utils import datadrainer
> +from avocado.utils.path import find_command
> +from avocado_qemu import LinuxTest
> +
> +class ReplayLinux(LinuxTest):
> +    """
> +    Boots a Linux system, checking for a successful initialization
> +    """
> +
> +    timeout = 1800
> +    chksum = None
> +    hdd = 'ide-hd'
> +    cd = 'ide-cd'
> +    bus = 'ide'
> +
> +    def setUp(self):
> +        super(ReplayLinux, self).setUp()
> +        self.boot_path = self.download_boot()
> +        self.cloudinit_path = self.prepare_cloudinit()
> +
> +    def vm_add_disk(self, vm, path, id, device):
> +        bus_string = ''
> +        if self.bus:
> +            bus_string = ',bus=%s.%d' % (self.bus, id,)
> +        vm.add_args('-drive', 'file=%s,snapshot,id=disk%s,if=none' % (path, id))
> +        vm.add_args('-drive',
> +            'driver=blkreplay,id=disk%s-rr,if=none,image=disk%s' % (id, id))
> +        vm.add_args('-device',
> +            '%s,drive=disk%s-rr%s' % (device, id, bus_string))
> +
> +    def launch_and_wait(self, record, args, shift):
> +        vm = self.get_vm()
> +        vm.add_args('-smp', '1')
> +        vm.add_args('-m', '1024')
> +        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
> +        if args:
> +            vm.add_args(*args)
> +        self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
> +        self.vm_add_disk(vm, self.cloudinit_path, 1, self.cd)
> +        logger = logging.getLogger('replay')
> +        if record:
> +            logger.info('recording the execution...')
> +            mode = 'record'
> +        else:
> +            logger.info('replaying the execution...')
> +            mode = 'replay'
> +        replay_path = os.path.join(self.workdir, 'replay.bin')
> +        vm.add_args('-icount', 'shift=%s,rr=%s,rrfile=%s' %
> +                    (shift, mode, replay_path))
> +
> +        start_time = time.time()
> +
> +        vm.set_console()
> +        vm.launch()
> +        console_drainer = datadrainer.LineLogger(vm.console_socket.fileno(),
> +                                    logger=self.log.getChild('console'),
> +                                    stop_check=(lambda : not vm.is_running()))
> +        console_drainer.start()
> +        if record:
> +            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
> +                                          self.name)
> +            vm.shutdown()
> +            logger.info('finished the recording with log size %s bytes'
> +                % os.path.getsize(replay_path))
> +        else:
> +            vm.event_wait('SHUTDOWN', self.timeout)
> +            vm.shutdown(True)
> +            logger.info('successfully fihished the replay')
> +        elapsed = time.time() - start_time
> +        logger.info('elapsed time %.2f sec' % elapsed)
> +        return elapsed
> +
> +    def run_rr(self, args=None, shift=7):
> +        t1 = self.launch_and_wait(True, args, shift)
> +        t2 = self.launch_and_wait(False, args, shift)
> +        logger = logging.getLogger('replay')
> +        logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
> +
> +@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> +class ReplayLinuxX8664(ReplayLinux):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=accel:tcg
> +    """
> +
> +    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
> +
> +    def test_pc_i440fx(self):
> +        """
> +        :avocado: tags=machine:pc
> +        """
> +        self.run_rr(shift=1)
> +
> +    def test_pc_q35(self):
> +        """
> +        :avocado: tags=machine:q35
> +        """
> +        self.run_rr(shift=3)
>



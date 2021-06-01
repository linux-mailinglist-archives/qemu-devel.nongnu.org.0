Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA6A397199
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:38:05 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1me-0001Rh-CA
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo1lE-0000cm-MZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:36:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo1lC-0002yM-OB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:36:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id k7so11368026ejv.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FQb0F1+aUA15ctCg5W5EVYutVmKFCml6aEUlWnWxEQA=;
 b=ThiU+j5gPthUnCABa/0IANZN4dZupXM62wz+vohK001F4FrzGv2uiuaD0U8ry7FqnL
 WYDKiPTlb4OqYf/7J93NVKPYJaO5pKprIqjlkMBk2XnXAnxKfs1CYAX+Z1huZAXrkXTn
 aWe9U3xv2gqiBdygPeyho3b5cQNA7OrnH52cI5C2u+HmiZPWbXJSthkU6sNcxxM9WgDo
 6BGwsM0rHoUnJOp0StvDo7IXELU8IeCZKCbpveBw8WAcspkny4DgJKQ4KPcLvcIFTh2w
 AwNa/ce+0su86+n1gLF/dYw4cHpbfUXw9ezTtEO8sac457xoP/Fj2rDVV7EeP1gyUAbc
 UA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQb0F1+aUA15ctCg5W5EVYutVmKFCml6aEUlWnWxEQA=;
 b=SV24LYajlnj4y3r+uWVKflC3ZSR+B1aXWJEf/A+GaUDZa/hibKCti7gcvpiT0L5E3G
 0jRi8rhwOhjexFeQRSQRl92h6Es5dAsHK9S/4CNgH+IsFfT38KfIj8A1vI4wS3CuyRMm
 quYGktAwY9E9e0TkLrCZKtsUg9ZXZbkxxcOgBkvN/qwGAsb/vPxD98JN3cdNxCil3CWQ
 jVfElRBxBNP5K+v/u1/mBAGtGFxIgefhvvoFC/dNTTwBtYBCCVc60yifmMg/G48+IPhY
 +vRWJKjKRDZ684HvqHQKIZO0HbSQ+no914pFb4fYvt4I+N9JnBbnMJX8PDTard3UIi0U
 SsRQ==
X-Gm-Message-State: AOAM531b8OSX3iLaz1GTErX+89hWysChn5voiqTXBdqT4/WBwydfWAbX
 2e520MiRijn73+WTQ4WoaYI6df2GLQhY1uutbw5PVw==
X-Google-Smtp-Source: ABdhPJzh9u5zKy8VTeRdjQTQgDUOvYYWjYse6D4INLJ2MCc3ErqjAGSYaM6LzB8Q4lK02sT+tFX0lXGGI6Zitda7HZs=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr9594633ejz.382.1622543792854; 
 Tue, 01 Jun 2021 03:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210528023220.417057-1-jsnow@redhat.com>
 <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
 <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
In-Reply-To: <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 11:36:02 +0100
Message-ID: <CAFEAcA_nv5W=4TL5XAuUCp1KNp8Mj8O+FRpo1OwXRs-YDtTuDQ@mail.gmail.com>
Subject: Re: [PULL 00/44] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 May 2021 at 20:22, John Snow <jsnow@redhat.com> wrote:
>
> On 5/30/21 3:09 PM, Peter Maydell wrote:
> > Fails to build on my machine that runs the BSD VMs, apparently
> > before it gets to the point of launching the VM:

> When I have seen this error message in the past, it has been because of
> using a new Python version and it gets confused reading stale cached
> information generated from an older interpreter.

This seems like a bug in Python...

> Can you do me a favor and delete any __pycache__ folders and/or any
> *.pyc files that might be hiding in your tree and/or build folders and
> try running it again?

I tried that, and it does seem to make more progress. It now
fails with:

### Booting installer ...
DEBUG:root:QEMU args: -nodefaults -m 4G -cpu max,sse4.2=off -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22 -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 18 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/freebsd.img.tmp,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -bios
pc-bios/bios-256k.bin -machine graphics=off -device VGA -cdrom
/home/peter.maydell/.cache/qemu-vm/images/freebsd.img.install.iso
DEBUG:qemu.machine.machine:VM launch command: 'qemu-system-x86_64
-display none -vga none -chardev
socket,id=mon,path=/var/tmp/qemu-13084-monitor.sock -mon
chardev=mon,mode=control -machine pc -chardev
socket,id=console,path=/var/tmp/qemu-13084-console.sock,server=on,wait=off
-serial chardev:console -nodefaults -m 4G -cpu max,sse4.2=off -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22 -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 18 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/freebsd.img.tmp,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -bios
pc-bios/bios-256k.bin -machine graphics=off -device VGA -cdrom
/home/peter.maydell/.cache/qemu-vm/images/freebsd.img.install.iso'
DEBUG:QMP.qemu-13084:>>> {'execute': 'qmp_capabilities'}
DEBUG:QMP.qemu-13084:<<< {'return': {}}
DEBUG:QMP.qemu-13084:>>> {'execute': 'human-monitor-command',
'arguments': {'command-line': 'info usernet'}}
DEBUG:QMP.qemu-13084:<<< {'return': 'Hub -1 (vnet):\r\n
Protocol[State]    FD  Source Address  Port   Dest. Address  Port
RecvQ SendQ\r\n  TCP[HOST_FORWARD]  15       127.0.0.1 38577
10.0.2.15    22     0     0\r\n'}
Failed to prepare guest environment
Traceback (most recent call last):
  File "/home/peter.maydell/qemu-freebsd/tests/vm/basevm.py", line 630, in main
    return vm.build_image(args.image)
  File "/home/peter.maydell/qemu-freebsd/tests/vm/freebsd", line 103,
in build_image
    "-cdrom", iso
  File "/home/peter.maydell/qemu-freebsd/tests/vm/basevm.py", line 309, in boot
    self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
  File "/home/peter.maydell/qemu-freebsd/tests/vm/../../python/qemu/utils/__init__.py",
line 40, in get_info_usernet_hostfwd_port
    for line in info_usernet_output.split('\r\n'):
AttributeError: 'dict' object has no attribute 'split'
DEBUG:QMP.qemu-13084:>>> {'execute': 'quit'}
DEBUG:QMP.qemu-13084:<<< {'return': {}}
/home/peter.maydell/qemu-freebsd/tests/vm/Makefile.include:79: recipe
for target '/home/peter.maydell/.cache/qemu-vm/images/freebsd.img'
failed
make: *** [/home/peter.maydell/.cache/qemu-vm/images/freebsd.img] Error 2
make: Leaving directory '/home/peter.maydell/qemu-freebsd/build'

thanks
-- PMM


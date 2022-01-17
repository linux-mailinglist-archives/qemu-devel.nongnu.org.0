Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C4849111E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:53:24 +0100 (CET)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Z0E-0004EZ-Kc
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Ywq-00026k-FV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:49:52 -0500
Received: from [2a00:1450:4864:20::333] (port=52080
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Ywo-0007eO-1i
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:49:52 -0500
Received: by mail-wm1-x333.google.com with SMTP id c2so17616322wml.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4JOcucEY4WeCw5ISsC9GnPvH6/n4F1yzmR20hKwkuI=;
 b=KYf+N8l6L0dnIB5nQSWUeW6xwNmAhWqReN9W4TozcmYNUbq3cO+AJcX0QeBNXiJzNb
 xcARRMGbnuSOZnJQYcXurBmjN9V0vIJVNd9znYP8SU9DhVK2JxjIwJacHn/mimX5BG+P
 q2hyPgfWu6qWsr1z2rLEsPzzJ6rzUkauhj57XOSc6S3qz6NrWWK3HyiEdLjTfznrWBF2
 /VN2qPllq7NZaja/xpvZljCPs+LKaLowxRkc5C43reyJ2e5V5HDFTo3xEXcpWoqx6wxj
 7tC8Nj5kb6aeZaXFi7l0q+ObmwfnRv6nQE+hACsLV328NBkFBxMrR2djZ0SSsB1zlNSU
 Zhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4JOcucEY4WeCw5ISsC9GnPvH6/n4F1yzmR20hKwkuI=;
 b=OlF3DVGXyh18ZCPODpeKTgzSWaVe7awTFR9ir/pg54OkAHch0K5Qc1kzhaN5tHmz4o
 FnSL+ePeDo/fY/xOKAKwASG1r8FfsgdhnyBgNlf6eEnRTaSiqhxDYHGRCBRW7GtOq1p7
 HaTLsPqVgzbsd/lHRv5aP3PzRTX8V3D/41ahWYS0CWnQaW5f8/o6eh9k3Hkhl/7wdj7x
 mhc15gqNiQ4twg+6v70llRV0kv5Xe6aI0SVXvW39ZyQCMV2hy99EVX0hHiwIs8RF1bsC
 DuEbdqx0/YEeR4JFibTKLGTHWZ+Bjz07eLYnKhPKq5AVs8+N4V8rC7kLTJfKVDSWRRUX
 LF4A==
X-Gm-Message-State: AOAM531Tgnv6Mv1XfQ+r6aHUCoOn1/uhjGuFchRqOaIvy50N9o55RCAS
 h4rGFiQm8Wy5QpI7CVY7zsviW0rhwmchzfU7dCuApw==
X-Google-Smtp-Source: ABdhPJyIHSRcnRyod/T1QN5FridoA/m9GCZayTUNIMs0w/9WayhOVRA6fWGnMQyZp2j5DTQA5D79X24ttYFHmmtGQa4=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr21361463wrn.172.1642452588477; 
 Mon, 17 Jan 2022 12:49:48 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
In-Reply-To: <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 20:49:37 +0000
Message-ID: <CAFEAcA_uBfCyJVq24p1jt5gaRmcMCZsjXae4y69QZ5dXpYX_Pg@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:

> Can you please try applying this temporary patch and running `./check
> -qcow2 040 041` until you see a breakage and show me the output from
> that?

With this temporary patch the VM doesn't launch at all:

peter.maydell@hackbox2.linaro.org:~/qemu-netbsd$ make -C build/
vm-build-netbsd J=8 V=1 2>&1 | tee netbsd.log
make: Entering directory '/home/peter.maydell/qemu-netbsd/build'
/usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/meson/meson.py
introspect --targets --tests --benchmarks | /usr/bin/python3 -B
scripts/mtest2m
ake.py > Makefile.mtest
{ \
  echo 'ninja-targets = \'; \
  /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
  echo 'build-files = \'; \
  /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
outputs:/q; s/$/ \\/p'; \
} > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
(GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp)
(GIT="git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp)
/usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
--debug  --jobs 8 --verbose    --image
"/home/peter.maydell/.cache/qemu-vm/images/netbsd.img"  --snapshot
--build-qemu /home/peter.maydell/qemu-netbsd --
DEBUG:root:Creating archive
/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar
for src_dir dir: /home/peter.maydell/qemu-netbsd
DEBUG:root:QEMU args: -nodefaults -m 4G -cpu max -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -drive
file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
-device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1
DEBUG:asyncio:Using selector: EpollSelector
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Registering
<qemu.aqmp.events.EventListener object at 0x7f3b76bfc9b0>.
DEBUG:qemu.machine.machine:VM launch command: 'qemu-system-x86_64
-display none -vga none -chardev
socket,id=mon,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
-mon chardev=mon,mode=control -machine pc -chardev
socket,id=console,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-console.sock,server=on,wait=off
-serial chardev:console -nodefaults -m 4G -cpu max -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -drive
file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
-device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1'
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
'Runstate.IDLE' to 'Runstate.CONNECTING'.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting connection
on /var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
...
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Connection accepted.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Awaiting greeting ...
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:<-- {
  "QMP": {
    "version": {
      "qemu": {
        "micro": 1,
        "minor": 11,
        "major": 2
      },
      "package": "(Debian 1:2.11+dfsg-1ubuntu7.38)"
    },
    "capabilities": []
  }
}
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Negotiating capabilities ...
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:--> {
  "execute": "qmp_capabilities",
  "arguments": {
    "enable": []
  }
}
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:<-- {
  "error": {
    "class": "GenericError",
    "desc": "Parameter 'enable' is unexpected"
  }
}
ERROR:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Negotiation failed:
AssertionError
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Negotiation failed:
  | Traceback (most recent call last):
  |   File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 306, in _negotiate
  |     assert 'return' in reply
  | AssertionError

ERROR:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Failed to establish
session: qemu.aqmp.qmp_client.NegotiationError: Negotiation failed:
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Failed to establish session:
  | Traceback (most recent call last):
  |   File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 306, in _negotiate
  |     assert 'return' in reply
  | AssertionError
  |
  | The above exception was the direct cause of the following exception:
  |
  | Traceback (most recent call last):
  |   File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/protocol.py",
line 371, in _new_session
  |     await self._establish_session()
  |   File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 253, in _establish_session
  |     await self._negotiate()
  |   File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 312, in _negotiate
  |     raise NegotiationError(emsg, err) from err
  | qemu.aqmp.qmp_client.NegotiationError: Negotiation failed:

DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:disconnect() called.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
'Runstate.CONNECTING' to 'Runstate.DISCONNECTING'.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Scheduling disconnect.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Closing StreamWriter.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Waiting for
StreamWriter to close ...
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:StreamWriter closed.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Disconnected.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:QMP Disconnected.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
'Runstate.DISCONNECTING' to 'Runstate.IDLE'.
ERROR:qemu.machine.machine:Error launching VM
ERROR:qemu.machine.machine:Process was forked, waiting on it
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:disconnect() called.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
'Runstate.IDLE' to 'Runstate.DISCONNECTING'.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Scheduling disconnect.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Disconnected.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:QMP Disconnected.
DEBUG:qemu.aqmp.qmp_client.qemu-2335-7f3b78d7f128:Transitioning from
'Runstate.DISCONNECTING' to 'Runstate.IDLE'.
WARNING:qemu.machine.machine:qemu received signal 9; command:
"qemu-system-x86_64 -display none -vga none -chardev
socket,id=mon,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock
-mon chardev=mon,mode=control -machine pc -chardev
socket,id=console,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-console.sock,server=on,wait=off
-serial chardev:console -nodefaults -m 4G -cpu max -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -drive
file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
-device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1"
ERROR:root:Failed to launch QEMU, command line:
ERROR:root:qemu-system-x86_64 -nodefaults -m 4G -cpu max -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no -device
virtio-net-pci,netdev=vnet -vnc 127.0.0.1:0,to=20 -smp 8 -enable-kvm
-drive file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback
-device virtio-blk,drive=drive0,bootindex=0 -drive
file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw
-device virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1
ERROR:root:Log:
ERROR:root:VNC server running on 127.0.0.1:5900

Failed to prepare guest environment
Traceback (most recent call last):
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 306, in _negotiate
    assert 'return' in reply
AssertionError

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/protocol.py",
line 371, in _new_session
    await self._establish_session()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 253, in _establish_session
    await self._negotiate()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/qmp_client.py",
line 312, in _negotiate
    raise NegotiationError(emsg, err) from err
qemu.aqmp.qmp_client.NegotiationError: Negotiation failed:

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 399, in launch
    self._launch()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 437, in _launch
    self._post_launch()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 340, in _post_launch
    self._qmp.accept(self._qmp_timer)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/legacy.py",
line 69, in accept
    timeout
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/legacy.py",
line 42, in _sync
    asyncio.wait_for(future, timeout=timeout)
  File "/usr/lib/python3.6/asyncio/base_events.py", line 484, in
run_until_complete
    return future.result()
  File "/usr/lib/python3.6/asyncio/tasks.py", line 339, in wait_for
    return (yield from fut)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/protocol.py",
line 274, in accept
    await self._new_session(address, ssl, accept=True)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/aqmp/protocol.py",
line 390, in _new_session
    raise ConnectError(emsg, err) from err
qemu.aqmp.protocol.ConnectError: Failed to establish session:
Negotiation failed:

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 529, in _do_shutdown
    self._soft_shutdown(timeout)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 514, in _soft_shutdown
    self._subp.wait(timeout=timeout)
  File "/usr/lib/python3.6/subprocess.py", line 1469, in wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command '('qemu-system-x86_64', '-display',
'none', '-vga', 'none', '-chardev',
'socket,id=mon,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-monitor.sock',
'-mon', 'chardev=mon,mode=control', '-machine', 'pc', '-chardev',
'socket,id=console,path=/var/tmp/qemu-machine-0m15ou19/qemu-2335-7f3b78d7f128-console.sock,server=on,wait=off',
'-serial', 'chardev:console', '-nodefaults', '-m', '4G', '-cpu',
'max', '-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22,ipv6=no',
'-device', 'virtio-net-pci,netdev=vnet', '-vnc', '127.0.0.1:0,to=20',
'-smp', '8', '-enable-kvm', '-drive',
'file=/home/peter.maydell/.cache/qemu-vm/images/netbsd.img,snapshot=on,if=none,id=drive0,cache=writeback',
'-device', 'virtio-blk,drive=drive0,bootindex=0', '-drive',
'file=/home/peter.maydell/qemu-netbsd/build/vm-test-72ra6_8s.tmp/data-f706c.tar,if=none,id=data-f706c,cache=writeback,format=raw',
'-device', 'virtio-blk,drive=data-f706c,serial=data-f706c,bootindex=1')'
timed out after 30 seconds

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/peter.maydell/qemu-netbsd/tests/vm/basevm.py", line 647, in main
    vm.boot(img)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/basevm.py", line 296, in boot
    guest.launch()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 409, in launch
    self.wait()
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 576, in wait
    self.shutdown(timeout=timeout)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 558, in shutdown
    self._do_shutdown(timeout)
  File "/home/peter.maydell/qemu-netbsd/tests/vm/../../python/qemu/machine/machine.py",
line 533, in _do_shutdown
    from exc
qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown
/home/peter.maydell/qemu-netbsd/tests/vm/Makefile.include:105: recipe
for target 'vm-build-netbsd' failed
make: *** [vm-build-netbsd] Error 2
make: Leaving directory '/home/peter.maydell/qemu-netbsd/build'

-- PMM


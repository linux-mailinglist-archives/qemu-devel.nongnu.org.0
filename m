Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260824A18
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 10:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSzzm-0002zm-FQ
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 04:19:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hSzyT-0002dM-GU
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hSzyQ-0007Yq-N3
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:18:17 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hSzyQ-0007WC-Ee
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:18:14 -0400
Received: by mail-oi1-x241.google.com with SMTP id y10so12104197oia.8
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ONOjmCnGtxCiV0ZspmSGVfzuMzjW0u5ND0p91B5A7HI=;
	b=WcP/hUnNtbGOdgXZifVRyjGEuVE37rYIIgL/cwVLGn2CGRpv4imVmPqvRJb3N3eA6h
	OiPtBHFCv+Qz533t0xPd0IQC8/GMr5jjXBEH3FPY6edE4JVdee4Gxw9IFo2SVtPMB+TG
	Rot9HArhhPjr4cop2NUvALP2GAOW1qRgLUzbVAkZ8vLbg/HcGl+J8mLIjA8XDQP8nu0R
	5V10Vx1yl+458oTWUGWM9Mxt/4PqL/Xl+jjN9+J5pGa5ig8++sXRBbx3iz9YeGZUU/aF
	TF8vwb4SfDmRYZ4xudNpF12wAllwZUSo74y11QJcLiWAufhb3qob9bahdyIz6c3mrYLW
	2Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ONOjmCnGtxCiV0ZspmSGVfzuMzjW0u5ND0p91B5A7HI=;
	b=E13HRwsO3DnISdJ9Q8/Nm5MekowlyZK0Z0B41Lq9reN4UQvHURcOJceUXv3z5rjM9W
	QAfqSniUTwBc7ezQ+HsWjtu3Z/I4PcqawhBcXYx3LYpwwyUD3kaUwhIGYfvOPvV7bi4H
	HK8BgCILHDJl6kUOC0Chlz2T+r5FND6RsOzp2sFU4DIiTLXNRymlj/PeqRB0Sjodg20z
	rrPtXex8x70mK/HO/4xZxJ0nNhSroymCr0hN0iKmH6nOmnE23DABDgVHZHf6amRaucy7
	1BjHm2J9fZOry8UDQMCiQk0Ja38u7ofOGY7wyXrDN4aFcsMjyB21gP0O8ZM6YtQ/7g3p
	FJ/w==
X-Gm-Message-State: APjAAAUPFjKgEXvMEHdwWz/vXXFwRAtvCyuYJePNGGx/UhkuV4Pw+6vF
	Es84ar8WQv2tVXtuBdN1ud3x2ubcDMwBl9WJ+mo=
X-Google-Smtp-Source: APXvYqzL0fP1xr5ZAFqKwZAGxDmbdS5bmqe2XQmPLmX4CDIBpcRsvu3D4Jzk3HlpAxj95Vl9ItfkY79h/dwoBA1+J0g=
X-Received: by 2002:aca:1916:: with SMTP id l22mr2583977oii.136.1558426691550; 
	Tue, 21 May 2019 01:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Tue, 21 May 2019 01:18:10
	-0700 (PDT)
Received: by 2002:a9d:410f:0:0:0:0:0 with HTTP; Tue, 21 May 2019 01:18:10
	-0700 (PDT)
In-Reply-To: <20190520231910.12184-5-f4bug@amsat.org>
References: <20190520231910.12184-1-f4bug@amsat.org>
	<20190520231910.12184-5-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 21 May 2019 10:18:10 +0200
Message-ID: <CAL1e-=jfYuh4jLAacFeZcOes5A3PERNLqsE4_hiEci+x0XBTrw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 4/4] BootLinuxSshTest: Test some userspace
 commands on Malta
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Caio Carrara <ccarrara@redhat.com>, qemu-devel@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On May 21, 2019 1:19 AM, "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org> wr=
ote:
>
> This tests boot a full VM and check the serial console until
> the SSH daemon is running, then start a SSH session and run
> some commands.
>
> This test can be run using:
>
>   $ avocado --show=3Dssh run -t arch:mips
tests/acceptance/linux_ssh_mips_malta.py
>   ssh: Entering interactive session.
>   ssh: # uname -a
>   ssh: Linux debian-mips 3.2.0-4-4kc-malta #1 Debian 3.2.51-1 mips
GNU/Linux
>   ssh: # lspci -d 11ab:4620
>   ssh: 00:00.0 Host bridge: Marvell Technology Group Ltd.
GT-64120/64120A/64121A System Controller (rev 10)
>   ssh: # cat /sys/bus/i2c/devices/i2c-0/name
>   ssh: SMBus PIIX4 adapter at 1100
>   ssh: # cat /proc/mtd
>   ssh: dev:    size   erasesize  name
>   ssh: mtd0: 00100000 00010000 "YAMON"
>   ssh: mtd1: 002e0000 00010000 "User FS"
>   ssh: mtd2: 00020000 00010000 "Board Config"
>   ssh: # md5sum /dev/mtd2ro
>   ssh: 0dfbe8aa4c20b52e1b8bf3cb6cbdf193  /dev/mtd2ro
>   ssh: # poweroff
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Excelent! Frankly, this was something that we in MIPS needed and missed
very much for a long time.

I liked the idea that this test does not run as a default, giving us
opportunity to extend and adjust it in future as we deem appropriate for
our MIPS needs, but without affecting people running default test
execution. In other words, this patch achieves =E2=80=9Cbest of both worlds=
=E2=80=9D.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

> TODO: do not run this tests by default, use the 'slow' tag
> ---
>  MAINTAINERS                              |   1 +
>  tests/acceptance/linux_ssh_mips_malta.py | 229 +++++++++++++++++++++++
>  tests/requirements.txt                   |   1 +
>  3 files changed, 231 insertions(+)
>  create mode 100644 tests/acceptance/linux_ssh_mips_malta.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9424a490d6..69fa4b3abc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -934,6 +934,7 @@ M: Aurelien Jarno <aurelien@aurel32.net>
>  R: Aleksandar Rikalo <arikalo@wavecomp.com>
>  S: Maintained
>  F: hw/mips/mips_malta.c
> +F: tests/acceptance/linux_ssh_mips_malta.py
>
>  Mipssim
>  M: Aleksandar Markovic <amarkovic@wavecomp.com>
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py
b/tests/acceptance/linux_ssh_mips_malta.py
> new file mode 100644
> index 0000000000..ceb530ff88
> --- /dev/null
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -0,0 +1,229 @@
> +# Functional test that boots a VM and run commands via a SSH session
> +#
> +# Copyright (c) Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +import re
> +import base64
> +import logging
> +import paramiko
> +import time
> +
> +from avocado_qemu import Test
> +from avocado.utils import process
> +from avocado.utils import archive
> +
> +
> +class LinuxSSH(Test):
> +
> +    timeout =3D 150 # Not for 'configure --enable-debug --enable-debug-t=
cg'
> +
> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> +    VM_IP =3D '127.0.0.1'
> +
> +    IMAGE_INFO =3D {
> +        'be': {
> +            'image_url': 'https://people.debian.org/~aurel32/qemu/mips/'
> +                         'debian_wheezy_mips_standard.qcow2',
> +            'image_hash': '8987a63270df67345b2135a6b7a4885a35e392d5',
> +            'rsa_hostkey':
b'AAAAB3NzaC1yc2EAAAADAQABAAABAQCca1VitiyLAdQOld'
> +
 b'zT43IOEVJZ0wHD78GJi8wDAjMiYWUzNSSn0rXGQsINHuH5'
> +
 b'IlF+kBZsHinb/FtKCAyS9a8uCHhQI4SuB4QhAb0+39MlUw'
> +
 b'Mm0CLkctgM2eUUZ6MQMQvDlqnue6CCkxN62EZYbaxmby7j'
> +
 b'CQa1125o1HRKBvdGm2zrJWxXAfA+f1v6jHLyE8Jnu83eQ+'
> +
 b'BFY25G+Vzx1PVc3zQBwJ8r0NGTRqy2//oWQP0h+bMsgeFe'
> +
 b'KH/J3RJM22vg6+I4JAdBFcxnK+l781h1FuRxOn4O/Xslbg'
> +
 b'go6WtB4V4TOsw2E/KfxI5IZ/icxF+swVcnvF46Hf3uQc/0'
> +                           b'BBqb',
> +        },
> +        'le': {
> +            'image_url': 'https://people.debian.org/~aurel32/qemu/mipsel=
/
'
> +                         'debian_wheezy_mipsel_standard.qcow2',
> +            'image_hash': '7866764d9de3ef536ffca24c9fb9f04ffdb45802',
> +            'rsa_hostkey':
b'AAAAB3NzaC1yc2EAAAADAQABAAABAQClXJlBT71HL5yKvv'
> +
 b'gfC7jmxSWx5zSBCzET6CLZczwAafSIs7YKfNOy/dQTxhuk'
> +
 b'yIGFUugZFoF3E9PzdhunuyvyTd56MPoNIqFbb5rGokwU5I'
> +
 b'TOx3dBHZR0mClypL6MVrwe0bsiIb8GhF1zioNwcsaAZnAi'
> +
 b'KfXStVDtXvn/kLLq+xLABYt48CC5KYWoFaCoICskLAY+qo'
> +
 b'L+LWyAnQisj4jAH8VSaSKIImFpfkHWEXPhHcC4ZBlDKtnH'
> +
 b'po9vhfCHgnfW3Pzrqmk8BI4HysqPFVmJWkJGlGUL+sGeg3'
> +
 b'ZZolAYuDXGuBrw8ooPJq2v2dOH+z6dyD2q/ypmAbyPqj5C'
> +                           b'rc8H',
> +        },
> +    }
> +
> +    def wait_for_console_pattern(self, success_message,
> +                                 failure_message=3D'Oops'):
> +        console =3D self.vm.console_socket.makefile()
> +        console_logger =3D logging.getLogger('console')
> +        while True:
> +            msg =3D console.readline()
> +            console_logger.debug(msg.strip())
> +            if success_message in msg:
> +                break
> +            if failure_message in msg:
> +                fail =3D 'Failure message found in console: %s' %
failure_message
> +                self.fail(fail)
> +
> +    def get_portfwd(self):
> +        res =3D self.vm.command('human-monitor-command',
> +                              command_line=3D'info usernet')
> +        line =3D res.split('\r\n')[2]
> +        port =3D re.split(r'.*TCP.HOST_FORWARD.*127\.0\.0\.1
(\d+)\s+10\..*',
> +                        line)[1]
> +        self.log.debug("sshd listening on port:" + port)
> +        return port
> +
> +    def ssh_connect(self, username, password, rsa_hostkey_b64=3DNone):
> +        self.ssh_logger =3D logging.getLogger('ssh')
> +        self.ssh_username =3D username
> +        self.ssh_ps1 =3D '# ' if username is 'root' else '$ '
> +        self.ssh_client =3D paramiko.SSHClient()
> +        port =3D self.get_portfwd()
> +        if rsa_hostkey_b64:
> +            rsa_hostkey_bin =3D base64.b64decode(rsa_hostkey_b64)
> +            rsa_hostkey =3D paramiko.RSAKey(data =3D rsa_hostkey_bin)
> +            ipport =3D '[%s]:%s' % (self.VM_IP, port)
> +            self.ssh_logger.debug('ipport ' + ipport)
> +            self.ssh_client.get_host_keys().add(ipport, 'ssh-rsa',
rsa_hostkey)
> +        for i in range(10):
> +            try:
> +                self.ssh_client.connect(self.VM_IP, int(port),
> +                                        username, password,
banner_timeout=3D90)
> +                self.ssh_logger.info("Entering interactive session.")
> +                return
> +            except:
> +                time.sleep(4)
> +                pass
> +        self.fail("sshd timeout")
> +
> +    def ssh_disconnect_vm(self):
> +        self.ssh_client.close()
> +
> +    def ssh_command(self, command, is_root=3DTrue):
> +        self.ssh_logger.info(self.ssh_ps1 + command)
> +        stdin, stdout, stderr =3D self.ssh_client.exec_command(command)
> +        stdout_lines =3D [line.strip('\n') for line in stdout]
> +        for line in stdout_lines:
> +            self.ssh_logger.info(line)
> +        stderr_lines =3D [line.strip('\n') for line in stderr]
> +        for line in stderr_lines:
> +            self.ssh_logger.warning(line)
> +        return stdout_lines, stderr_lines
> +
> +    def boot_debian_wheezy_image_and_ssh_login(self, endianess,
kernel_path):
> +        image_url =3D self.IMAGE_INFO[endianess]['image_url']
> +        image_hash =3D self.IMAGE_INFO[endianess]['image_hash']
> +        image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_ha=
sh)
> +        rsa_hostkey_b64 =3D self.IMAGE_INFO[endianess]['rsa_hostkey']
> +
> +        self.vm.set_machine('malta')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
> +                               + 'console=3DttyS0 root=3D/dev/sda1')
> +        self.vm.add_args('-no-reboot',
> +                         '-kernel', kernel_path,
> +                         '-append', kernel_command_line,
> +                         '-hda', image_path,
> +                         '-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.1=
:0
-:22',
> +                         '-device', 'pcnet,netdev=3Dvnet')
> +        self.vm.launch()
> +
> +        self.log.info('VM launched, waiting for sshd')
> +        console_pattern =3D 'Starting OpenBSD Secure Shell server: sshd'
> +        self.wait_for_console_pattern(console_pattern)
> +        self.log.info('sshd ready')
> +
> +        self.ssh_connect('root', 'root', rsa_hostkey_b64=3Drsa_hostkey_b=
64)
> +
> +    def shutdown_via_ssh(self):
> +        self.ssh_command('poweroff')
> +        self.ssh_disconnect_vm()
> +        self.wait_for_console_pattern('Power down')
> +
> +    def run_common_commands(self):
> +        stdout, stderr =3D self.ssh_command('lspci -d 11ab:4620')
> +        self.assertIn(True, ["GT-64120" in line for line in stdout])
> +
> +        stdout, stderr =3D self.ssh_command('cat
/sys/bus/i2c/devices/i2c-0/name')
> +        self.assertIn(True, ["SMBus PIIX4 adapter" in line
> +                             for line in stdout])
> +
> +        stdout, stderr =3D self.ssh_command('cat /proc/mtd')
> +        self.assertIn(True, ["YAMON" in line
> +                             for line in stdout])
> +
> +        # Empty 'Board Config'
> +        stdout, stderr =3D self.ssh_command('md5sum /dev/mtd2ro')
> +        self.assertIn(True, ["0dfbe8aa4c20b52e1b8bf3cb6cbdf193" in line
> +                             for line in stdout])
> +
> +    def do_test_mips_malta(self, endianess, kernel_path, uname_m):
> +        self.boot_debian_wheezy_image_and_ssh_login(endianess,
kernel_path)
> +
> +        stdout, stderr =3D self.ssh_command('uname -a')
> +        self.assertIn(True, [uname_m + " GNU/Linux" in line for line in
stdout])
> +
> +        self.run_common_commands()
> +        self.shutdown_via_ssh()
> +
> +    def test_mips_malta32eb_kernel3_2_0(self):
> +        """
> +        :avocado: tags=3Dslow
> +        :avocado: tags=3Darch:mips
> +        :avocado: tags=3Dmachine:malta
> +        :avocado: tags=3Dendian:big
> +        :avocado: tags=3Ddevice:pcnet32
> +        """
> +        kernel_url =3D ('https://people.debian.org/~aurel32/qemu/mips/'
> +                      'vmlinux-3.2.0-4-4kc-malta')
> +        kernel_hash =3D '592e384a4edc16dade52a6cd5c785c637bcbc9ad'
> +        kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> +
> +        self.do_test_mips_malta('be', kernel_path, 'mips')
> +
> +    def test_mips_malta32el_kernel3_2_0(self):
> +        """
> +        :avocado: tags=3Dslow
> +        :avocado: tags=3Darch:mipsel
> +        :avocado: tags=3Dmachine:malta
> +        :avocado: tags=3Dendian:little
> +        :avocado: tags=3Ddevice:pcnet32
> +        """
> +        kernel_url =3D ('https://people.debian.org/~aurel32/qemu/mipsel/=
'
> +                      'vmlinux-3.2.0-4-4kc-malta')
> +        kernel_hash =3D 'a66bea5a8adaa2cb3d36a1d4e0ccdb01be8f6c2a'
> +        kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> +
> +        self.do_test_mips_malta('le', kernel_path, 'mips')
> +
> +    def test_mips_malta64eb_kernel3_2_0(self):
> +        """
> +        :avocado: tags=3Dslow
> +        :avocado: tags=3Darch:mips64
> +        :avocado: tags=3Dmachine:malta
> +        :avocado: tags=3Dendian:big
> +        :avocado: tags=3Ddevice:pcnet32
> +        """
> +        kernel_url =3D ('https://people.debian.org/~aurel32/qemu/mips/'
> +                      'vmlinux-3.2.0-4-5kc-malta')
> +        kernel_hash =3D 'db6eea7de35d36c77d8c165b6bcb222e16eb91db'
> +        kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> +        self.do_test_mips_malta('be', kernel_path, 'mips64')
> +
> +    def test_mips_malta64el_kernel3_2_0(self):
> +        """
> +        :avocado: tags=3Dslow
> +        :avocado: tags=3Darch:mips64el
> +        :avocado: tags=3Dmachine:malta
> +        :avocado: tags=3Dendian:little
> +        :avocado: tags=3Ddevice:pcnet32
> +        """
> +        kernel_url =3D ('https://people.debian.org/~aurel32/qemu/mipsel/=
'
> +                      'vmlinux-3.2.0-4-5kc-malta')
> +        kernel_hash =3D '6a7f77245acf231415a0e8b725d91ed2f3487794'
> +        kernel_path =3D self.fetch_asset(kernel_url,
asset_hash=3Dkernel_hash)
> +        self.do_test_mips_malta('le', kernel_path, 'mips64')
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 002ded6a22..3ae0e29ad7 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,3 +2,4 @@
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>  avocado-framework=3D=3D68.0
> +paramiko
> --
> 2.19.1
>

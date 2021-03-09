Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309B331FC0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:27:34 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWmD-0004VE-Fd
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJWkb-0003f4-00
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:25:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJWkU-00068K-GN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:25:52 -0500
Received: from [192.168.100.1] ([82.252.131.214]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbSXf-1lunRC0J0z-00bofQ; Tue, 09 Mar 2021 08:25:23 +0100
Subject: Re: [PATCH v6 0/5] m68k: add Virtual M68k Machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210308212501.650740-1-laurent@vivier.eu>
 <c7e31656-b6c0-5f5b-27b7-ac047fc28e70@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <09398f07-4ae2-d8a7-fc1f-ececef9102ee@vivier.eu>
Date: Tue, 9 Mar 2021 08:25:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c7e31656-b6c0-5f5b-27b7-ac047fc28e70@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VVJJ8tBTCLJ1fgw14jf/i9fSuTVH5AJPyYrQvxbxmgUH0rDBtdB
 eie5U0DCIy6SdFjt8P8sWH9ksImpHV+ajA0itfv/qY4CHf32EVwx/lBJJBfA39bR1v8yRTY
 CgSvZA4m2TnGbcO2LtiZ8Ut+2JeVZBh4AvdVRwDfOJogQDyDTCfJ4p7fukF6PsAWj5485SQ
 zIGuVm963GnVskpyX3wDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aPKeG2EnY6o=:LWhnmiq/8NdmQVw7TrqzYR
 nt1j/ye/1Vy2xHFnr2wrsOgpllotO3JYtSj4EXKEUkA+rc05FoqJ7Z8lH7ShIDiBT4F9rEW4q
 1oVBuvFfUQXmXbt/Zz3nqhlArYwkcfLE0EI6QDmepewo7GZKFoXlBOMW/H3OWJbzNFFTLhPXN
 qFHFzy2DLsk6KZCwKR3wjQIYjaELBLuFWl8e2MMHjBYjF8pyMHL431yaB0lT6TrrsQ4N9Q1RO
 yug2WWqR0eYp10rH2J9JIhTKVLO6Ey4FFvW2kDdUx/k6udb+IV1TNHkuDK5hvY0cF6W4Mgw6C
 ODoabDCYhUgpyhRbHVvxK97kVzuBm0ot0/l2us3i5oRzaeKTYDb9lrEkI+U/47Sjh95wEqO6p
 iTRvrnh7DLv5LMenSrEljrUjza0FqAm2efN6mGSR99rcygnAAg1qWKb1a0Qra
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 23:47, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
>
> On 3/8/21 10:24 PM, Laurent Vivier wrote:
>> The Quadra 800 machine is very limited to run linux, it manages
>> only 1 GiB of memory and only some specific interfaces.
>>
>> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>
>> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFIS=
>> H-VIRTUAL-HARDWARE.TXT
>>
>> The machine is created with 128 virtio-mmio busses, and they can
>> be used to add serial console, GPU, disk, NIC, HID, ...
>>
>> This series re-use the goldfish-rtc implemented for RISCV, and
>> adds the two others based on the goldfish specs, the kernel driver
>> and android simulator ones.
>>
>> The machine can manage up to 3.2 GiB of memory, not because of an hardware
>> limitation but because the kernel crashes after this value.
>>
>> Simply configure qemu with:
>>
>>     .../configure --target-list=3Dm68k-softmmu
>>
>> To run the machine you need a modified kernel you can find here:
>>
>>     https://github.com/vivier/linux/tree/m68k-virt
>>
>> You need to compile the kernel with:
>>
>>     make virt_defconfig
>>     make vmlinux
>>
>> The disk must be installed using the q800 machine because the debian installer
>> doesn't want to be used with a kernel that is not the one on the ISO.
>>
>> And then you can run the machine with something like:
>>
>> qemu-system-m68k -M virt \
>>   -m 3399672K \
>>   -chardev stdio,signal=3Doff,mux=3Don,id=3Dchar0 \
>>   -mon chardev=3Dchar0,mode=3Dreadline \
>>   -kernel vmlinux \
>>   -append "console=3Dhvc0 root=3D/dev/vda2" \
>>   -blockdev node-name=3Dsystem,driver=3Dfile,filename=3Ddebian-10.0.qcow2 \
>>   -blockdev node-name=3Ddrive0,driver=3Dqcow2,file=3Dsystem \
>>   -device virtio-blk-device,drive=3Ddrive0 \
>>   -serial chardev:char0 \
>>   -device virtio-net-device,netdev=3Dhostnet0 \
>>   -netdev bridge,id=3Dhostnet0,br=3Dvirbr0 \
>>   -device virtio-rng-device \
>>   -device virtio-serial-device \
>>   -device virtio-gpu-device \
>>   -device virtconsole,chardev=3Dchar0 \
>>   -device virtio-keyboard-device \
>>   -device virtio-mouse-device
>>
>> if you want to use Goldfish-tty for the console rather than virtconsole, you
>> can add "console=3DttyGF".
>>
>> To start the debian-installer, you can try by adding:
>>
>>   -device virtio-scsi-device \
>>   -blockdev node-name=3Ddebian10,driver=3Dfile,filename=3Ddebian-10.0.0-m68k-=
>> NETINST-1.iso \
>>   -blockdev node-name=3Dcdrom0,driver=3Draw,file=3Ddebian10 \
>>   -device scsi-cd,drive=3Dcdrom0 \
>>   -initrd installer-m68k/20200315/images/cdrom/initrd.gz
>>
>> ISO:    https://cdimage.debian.org/cdimage/ports/snapshots/2020-10-12/debian-=
>> 10.0.0-m68k-NETINST-1.iso
>> initrd: https://cdimage.debian.org/cdimage/ports/debian-installer/2020-10-12/=
>> m68k/debian-installer-images_20200315_m68k.tar.gz
>>
>> v6:
>>   m68k-virt-ctrl:
>>       Renamed to virt-ctrl to be generic
>>       Add a simple specs document
>
> Thanks for this document! Series LGTM.
>
> I tested doing:
>
> qemu$ docker run -it --rm -v $PWD:$PWD -w $PWD -v /tmp:/tmp -u 0
> --network host registry.gitlab.com/qemu-project/qemu/qemu/debian-m68k-cross
> # apt-get update
> # apt-get install flex bison libssl-dev
> # git clone https://github.com/vivier/linux.git
> # cd linux
> # git checkout m68k-virt
> # make O=build ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- virt_defconfig
> # make O=build ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- vmlinux -j8
>
> [    0.000000] Linux version 5.11.0-rc5-00002-g8a00b8b1edb (root@x1w)
> (m68k-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
> Debian) 2.31.1) #1 Mon Mar 8 22:27:19 UTC 2021
>
> I also tested the Goldfish-tty:
>
> [    1.390000] printk: console [ttyGF0] enabled
> [    1.390000] printk: console [ttyGF0] enabled
> [    1.390000] printk: bootconsole [early_gf_tty0] disabled
> [    1.390000] printk: bootconsole [early_gf_tty0] disabled
>
> So:
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thank you Philippe.

> Don't you want to share a preinstalled qcow2 image like Aurelien?
>
> https://people.debian.org/~aurel32/qemu/

For the moment, my next move is to have the kernel changes merged.

But I have a qcow2 available here: http://vivier.eu/debian-10.0.qcow2

>
> Also, do you plan to add functional testing later?

Yes, except if someone else does it before me :)

Thanks,
Laurent








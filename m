Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01634B034
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:34:16 +0100 (CET)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt9r-0004en-Ar
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPsXt-0002rx-KO
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:55:01 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:30924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPsXq-0002tq-5t
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:55:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 684C3746358;
 Fri, 26 Mar 2021 20:54:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 21B23746357; Fri, 26 Mar 2021 20:54:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1F5AE7462E0;
 Fri, 26 Mar 2021 20:54:55 +0100 (CET)
Date: Fri, 26 Mar 2021 20:54:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
In-Reply-To: <CABLmASEp+uvibhH1bEqxLkGFdrKqhHOCXUso2tY-UNprT1+W4w@mail.gmail.com>
Message-ID: <d2d16d3e-9620-26aa-c5c-407a9940934d@eik.bme.hu>
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
 <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
 <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
 <CAEUhbmVp_b4K=0WsaUGsXtHPqZTmn-rZYdcNsGMnRcCHdJjnNA@mail.gmail.com>
 <CABLmASEp+uvibhH1bEqxLkGFdrKqhHOCXUso2tY-UNprT1+W4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-762272607-1616788495=:66704"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-762272607-1616788495=:66704
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 26 Mar 2021, Howard Spoelstra wrote:
> On Fri, Mar 26, 2021 at 10:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Fri, Mar 26, 2021 at 4:49 PM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>>
>>> 在 2021/3/26 下午4:21, BALATON Zoltan 写道:
>>>> On Fri, 26 Mar 2021, Howard Spoelstra wrote:
>>>>> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>
>>>>>> Hi Howard,
>>>>>>
>>>>>> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell
>>>>>> <peter.maydell@linaro.org> wrote:
>>>>>>>
>>>>>>> (adding the relevant people to the cc list)
>>>>>>>
>>>>>>> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> When running qemu-system-ppc with Mac OS guest, the guest crashes
>>>>>>>> when
>>>>>>>> using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
>>>>>>>> with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
>>>>>>>> with the default ethernet connection. It gets activated when I start
>>>>>>>> qemu.
>>>>>>>>
>>>>>>>> To reproduce, compile qemu-system-ppc from current source and run:
>>>>>>>>
>>>>>>>> qemu-system-ppc.exe ^
>>>>>>>> -L pc-bios ^
>>>>>>>> -M mac99 ^
>>>>>>>> -m 128 ^
>>>>>>>> -sdl -serial stdio ^
>>>>>>>> -boot c ^
>>>>>>>> -drive file=C:\Mac-disks\9.2.img,format=raw,media=disk ^
>>>>>>>> -device sungem,netdev=network01 -netdev
>>>>>>>> tap,ifname=TapQemu,id=network01
>>>>>>>>
>>>>>>>> I bisected to the commit below. Thanks for looking into this.
>>>>>>
>>>>>> Thanks for reporting.
>>>>>>
>>>>>> Can you please provide some further information:
>>>>>>
>>>>>> 1. Does "-net user" work on Windows?
>>>>>> 2. If running QEMU under Linux, does "-net tap" or "-net user" work?
>>>>>>
>>>>>> Regards,
>>>>>> Bin
>>>>>
>>>>> Hello Bin,
>>>>>
>>>>> Thanks for getting back to me. I forgot to mention that reverting the
>>>>> above patch restores functionality. And that other applications using
>>>>> the same tap device work correctly.
>>>>> In answer to your questions:
>>>>>
>>>>> 1. Yes, slirp works on Windows 10 with this setup.
>>>>> 2. Yes, in Linux both tap and slirp work.
>>>>>
>>>>> My Windows build is done with a fully up to date msys2 installation.
>>>>>
>>>>> I tried to debug in Windows:
>>>>> (gdb) run
>>>>> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
>>>>> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
>>>>> "file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=disk" -device
>>>>> "sungem,netdev=network01" -netdev "tap,ifname=TapQemu,id=network01" -S
>>>>> [New Thread 13304.0x1f00]
>>>>> [New Thread 13304.0x2f84]
>>>>> [New Thread 13304.0x3524]
>>>>> [New Thread 13304.0x2b8c]
>>>>> [New Thread 13304.0x368c]
>>>>> [New Thread 13304.0x3668]
>>>>> [New Thread 13304.0xf4c]
>>>>> [New Thread 13304.0x49c]
>>>>> [New Thread 13304.0x1d4c]
>>>>> [New Thread 13304.0x7fc]
>>>>> [Thread 13304.0x7fc exited with code 0]
>>>>> [New Thread 13304.0x357c]
>>>>> [New Thread 13304.0x7c0]
>>>>> [New Thread 13304.0x3564]
>>>>> [New Thread 13304.0x26f4]
>>>>> [New Thread 13304.0x2f68]
>>>>>
>>>>> Program received signal SIGSEGV, Segmentation fault.
>>>>> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
>>>>> (gdb) bt
>>>>> #0  0x00007ffb9edea991 in ?? () from
>>>>> c:\qemu-master-msys2\libglib-2.0-0.dll
>>>>> #1  0x000800000480bf50 in ?? ()
>>>>> Backtrace stopped: previous frame inner to this frame (corrupt stack?)
>>>>> (gdb)
>>>>>
>>>>> Even before I could attach to the process.
>>>>
>>>> If you run QEMU under gdb you don't have to attach to it but to get a
>>>> meaningful backtrace you should configure and compile QEMU with
>>>> --enable-debug (this will make it run slower so not recommended
>>>> normally but for debugging that would be needed). If the stack is
>>>> really corrupted then you may not get a useful backtrace or it may be
>>>> a problem with gdb on Windows. I've found that gdb on Windows works
>>>> for simple things but could give bad results for more complex stuff.
>>>> WinDbg may be better but it's harder to use (needs some registry
>>>> change I think to enable core dumps then you could open and analyze
>>>> core dumps with it or it should be able to run command directly but I
>>>> don't know how that works).
>>>>
>>>> Another idea: maybe you could check other threads in gdb. Not sure if
>>>> that would reveal anything but may worth a try. I think the commands
>>>> you need are "info threads" and "apply all bt" or something similar.
>>>>
>>>> Regards,
>>>> BALATON Zoltan
>>>>
>>>
>>> It looks to me the patch tires to recycle a temporary buffer to tap thread.
>>>
>>> Please try to attached fix to see it if works.
>>
>> Yep, good catch, thanks! This patch looks correct to me.
>>
>> Regards,
>> Bin
>
> Hi,
>
> While the patch applies, it will not compile:
>
> ../net/tap-win32.c: In function 'tap_win32_send':
> ../net/tap-win32.c:697:18: error: assignment to 'uint8_t' {aka
> 'unsigned char'} from 'uint8_t *' {aka 'unsigned char *'} makes
> integer from pointer without a cast [-Werror=int-conversion]
>  697 |         orig_buf = buf;
>      |                  ^
> ../net/tap-win32.c:707:42: error: passing argument 2 of
> 'tap_win32_free_buffer' makes pointer from integer without a cast
> [-Werror=int-conversion]
>  707 |         tap_win32_free_buffer(s->handle, orig_buf);
>      |                                          ^~~~~~~~
>      |                                          |
>      |                                          uint8_t {aka unsigned char}
> ../net/tap-win32.c:590:44: note: expected 'uint8_t *' {aka 'unsigned
> char *'} but argument is of type 'uint8_t' {aka 'unsigned char'}
>  590 |                                   uint8_t *pbuf)
>      |                                   ~~~~~~~~~^~~~

Patch missing a * from this line:

+    uint8_t *buf, orig_buf;

should be

+    uint8_t *buf, *orig_buf;

Regards,
BALATON Zoltan
--3866299591-762272607-1616788495=:66704--


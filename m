Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18472B69AE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 19:36:47 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAdsj-0006IC-Po
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iAdKA-00069a-6N
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 13:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iAdK6-0003UL-PY
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 13:01:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iAdJt-0003RF-Ef; Wed, 18 Sep 2019 13:00:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 268888A1C9B;
 Wed, 18 Sep 2019 17:00:44 +0000 (UTC)
Received: from [10.10.121.204] (ovpn-121-204.rdu2.redhat.com [10.10.121.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BF8160623;
 Wed, 18 Sep 2019 17:00:42 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190912001633.11372-1-jsnow@redhat.com>
 <20190912001633.11372-2-jsnow@redhat.com>
 <974b64b8-a191-c529-4e77-6a38b372c4b8@virtuozzo.com>
 <e5d871da-c5e1-1a5e-4714-387cbc93a055@redhat.com>
 <66bdafc2-cbdb-8e41-d4c6-5142729ef7a9@virtuozzo.com>
 <8b13be25-1536-7890-6ff4-0eef2fa104d8@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <518c1820-65b8-33c6-e0be-b6d07fb469ab@redhat.com>
Date: Wed, 18 Sep 2019 13:00:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8b13be25-1536-7890-6ff4-0eef2fa104d8@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Wed, 18 Sep 2019 17:00:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 1/4] iotests: add script_initialize
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/18/19 12:44 PM, Vladimir Sementsov-Ogievskiy wrote:
> 18.09.2019 13:30, Vladimir Sementsov-Ogievskiy wrote:
>> 18.09.2019 1:29, John Snow wrote:
>>>
>>>
>>> On 9/16/19 10:56 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 12.09.2019 3:16, John Snow wrote:
>>>>> Like script_main, but doesn't require a single point of entry.
>>>>> Replace all existing initialization sections with this drop-in replacement.
>>>>>
>>>>> This brings debug support to all existing script-style iotests.
>>>>>
>>>>> Note: supported_oses=['linux'] was omitted, as it is a default argument.
>>>>
>>>> But after this patch all test which didn't check os start to check linux
>>>> (as it's default).. So all tests which worked on other platforms will now
>>>> be skipped on these other platforms?
>>>>
>>>> Finally do we support something except linux for iotests?
>>>> for bash tests _supported_os also used only with "Linux" in 87 tests..
>>>>
>>>> May be we'd better drop both _supported_os and supported_oses alltogether,
>>>> and don't care?
>>>>
>>>> Anyway, if we support only linux, any reason to skip almost all tests,
>>>> if someone tries to run test on other platform? Let him run what he wants.
>>>>
>>>
>>> Currently, the following tests are python:
>>>
>>> 030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147
>>> 148 149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 209
>>> 210 211 212 213 216 218 219 222 224 228 234 235 236 237 238 242 245 246
>>> 248 254 255 256 257 258 262 266
>>>
>>> And as it stands, none of the script-style python tests we've selected
>>> to run in `make check` fail on the FreeBSD platform.
>>>
>>> So as an experiment, I lifted the restriction on python tests. I kept
>>> running ./check until I found some invocation that they didn't skip.
>>>
>>> Failures: 045 147 149 169 194 199 211
>>>
>>> Not too bad...
>>>
>>> 045: +qemu.machine.QEMUMachineError: socket_scm_helper does not exist
>>> 149: Wants to use 'sudo', but our freebsd image doesn't have that.
>>> 194: +OSError: AF_UNIX path too long
>>> 211:
>>> -[{ "start": 0, "length": 3072, "depth": 0, "zero": false, "data": true,
>>> "offset": 1024},
>>> -{ "start": 3072, "length": 33551360, "depth": 0, "zero": true, "data":
>>> true, "offset": 4096}]
>>> +[{ "start": 0, "length": 31744, "depth": 0, "zero": false, "data":
>>> true, "offset": 1024},
>>> +{ "start": 31744, "length": 33522688, "depth": 0, "zero": true, "data":
>>> true, "offset": 32768}]
>>>
>>>
>>> 149 can probably be fixed, and 194 and 211 I have fail in similar ways
>>> on my own Linux machine, so that's probably not BSD's fault.
>>>
>>> Interestingly, 169 and 199, bitmap migration related tests, cause a
>>> SIGSEGV in QEMU ...
>>>
>>>
>>> 169:
>>> +EEEE....EEEE........
>>> +WARNING:qemu.machine:qemu received signal 6:
>>> /usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/../../x86_64-softmmu/qemu-system-x86_64
>>> -chardev
>>> socket,id=mon,path=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/tmprpc0idbx/qemub-26617-monitor.sock
>>> -mon chardev=mon,mode=control -display none -vga none -qtest
>>> unix:path=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/qemub-26617-qtest.sock
>>> -machine accel=qtest -nodefaults -display none -machine accel=qtest
>>> -incoming defer -drive
>>> if=virtio,id=drive0,file=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/disk_b,format=qcow2,cache=writeback
>>>
>>> The common thread in 169 is the +migbitmap trait, which ... makes me a
>>> little nervous, of course!
>>>
>>>
>>> 199:
>>> +WARNING:qemu.machine:qemu received signal 6:
>>> /usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/../../x86_64-softmmu/qemu-system-x86_64
>>> -chardev
>>> socket,id=mon,path=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/tmpvzpyc9j6/qemub-30170-monitor.sock
>>> -mon chardev=mon,mode=control -display none -vga none -qtest
>>> unix:path=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/qemub-30170-qtest.sock
>>> -machine accel=qtest -nodefaults -display none -machine accel=qtest
>>> -drive
>>> if=virtio,id=drive0,file=/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/disk_b,format=qcow2,cache=none
>>> -incoming exec: cat
>>> '/usr/home/qemu/qemu-test.IfsR68/build/tests/qemu-iotests/scratch/mig_fifo'
>>> +E
>>>
>>>
>>> Vladimir, I was able to provoke this error by editing
>>> ./tests/vm/Makefile.include and removing the --snapshot invocation, then
>>> using `make vm-build-freebsd` and finally typing `make vm-ssh-freebsd`
>>> to open up a shell.
>>>
>>> Then the tricks are the usual ones; navigate to iotests directory,
>>> ./check -v -qcow2 169, etc. You'll need to create a build that allows
>>> Python tests to run; do it before you run the snapshot-less build.
>>>
>>>
>>
>> Interesting, I'll try to reproduce.
> 
> Could you provide more detailed steps?
> 
> # make vm-build-freebsd
>      VM-IMAGE freebsd
> ### Downloading install iso ...
> ### Preparing iso and disk image ...
> /root/.cache/qemu-vm/images/freebsd.img.install.iso.xz (1/1)
>    100 %       595,0 MiB / 851,1 MiB = 0,699   153 MiB/s       0:05
> Failed to prepare guest environment
> Traceback (most recent call last):
>    File "/work/src/qemu/master/tests/vm/basevm.py", line 353, in main
>      return vm.build_image(args.image)
>    File "/work/src/qemu/master/tests/vm/freebsd", line 86, in build_image
>      img_tmp, self.size])
>    File "/usr/lib64/python3.7/subprocess.py", line 342, in check_call
>      retcode = call(*popenargs, **kwargs)
>    File "/usr/lib64/python3.7/subprocess.py", line 323, in call
>      with Popen(*popenargs, **kwargs) as p:
>    File "/usr/lib64/python3.7/subprocess.py", line 775, in __init__
>      restore_signals, start_new_session)
>    File "/usr/lib64/python3.7/subprocess.py", line 1522, in _execute_child
>      raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory: 'qemu-img': 'qemu-img'
> make: *** [/work/src/qemu/master/tests/vm/Makefile.include:47: /root/.cache/qemu-vm/images/freebsd.img] Error 2
> # ls qemu-img
> qemu-img
> 
> What it wants? I've never done such cross-builds before..
> 

uhhh, hm...

No, I really just typed what you had done -- `make vm-build-freebsd` on
my Fedora 30 host. I do happen to have qemu-img installed system-wide,
maybe it's a requirement.

I removed the '--snapshot' argument from the Makefile in that folder so
that once the build finished I could SSH in to the image and poke around
by running iotests manually.

I wouldn't worry about it right now, exactly -- it might be a problem
with the migration specification for "exec cat" that is causing an
issue, if I had to guess. I can try to debug it later, but I won't be
able to get to it too soon.



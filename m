Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF4699322
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScTA-0004Md-49; Thu, 16 Feb 2023 06:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pScT7-0004M8-OV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:30:30 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pScT4-0003wL-Ry
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:30:29 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 20562607BA;
 Thu, 16 Feb 2023 14:30:17 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8813::1:16] (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 GUjLO70R3Os1-Zo8wxMqd; Thu, 16 Feb 2023 14:30:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676547016; bh=MYHj4pTli7/BnsKfp5g2wpJtwMLU29sZuHkjxAd1loE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ct61HKW5eyVqTovGLAJL4URahbNQ8au/q2FfARuiNpTqmzt0LJfeCxOB0vaucSH5m
 zLcraLMaYhs8g8jZvEaiiKZYqybWPtB/c+Etzw+uiwkDSm2r5lR0QUNbieIyCywB/G
 QyZMvOlFTdp9dNt5QRjkI77ENZscaRbDtpMYQePQ=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <56843688-7985-2e54-de54-817298f213eb@yandex-team.ru>
Date: Thu, 16 Feb 2023 14:30:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] qemu: make version available in coredump
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
 <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
 <Y+368RcZsG+t7SjW@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <Y+368RcZsG+t7SjW@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16.02.23 12:44, Daniel P. Berrangé wrote:
> On Wed, Feb 15, 2023 at 05:05:47PM -0500, Stefan Hajnoczi wrote:
>> On Tue, 7 Jun 2022 at 16:33, Vladimir Sementsov-Ogievskiy
>> <vsementsov@yandex-team.ru> wrote:
>>>
>>> Add a variable with QEMU_FULL_VERSION definition. Then the content of
>>> the variable is easily searchable:
>>>
>>>     strings /path/to/core | grep QEMU_FULL_VERSION
>>>
>>> 'volatile' keyword is used to avoid removing the variable by compiler as
>>> unused.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>
>>> Hi all!
>>>
>>> Probably, I just don't know the correct way to get version from core
>>> file. If so, please teach me :)
>>
>> I've never hit this issue because bug reports usually include the QEMU
>> distro package version. Keeping the version string in the core file
>> seems reasonable (unless there is already another way to do this).
>>
>> Something I'm curious about: is the coredump guaranteed to contain
>> static const variables? I wondered if they might be located in the
>> .rodata ELF section and excluded from the coredump because they are
>> referenced in the NT_FILE mmap note instead. Maybe volatile prevents
>> this?
> 
> In Fedora / RHEL based systems (and some other distros too IIUC) for
> many years, all binaries have included a "build-id" ELF note which
> uniquely identifies the package build.
> 
> Note section [ 3] '.note.gnu.build-id' of 36 bytes at offset 0x3c0:
>    Owner          Data size  Type
>    GNU                   20  GNU_BUILD_ID
>      Build ID: e3143405b7f653a0a65b3295df760fdf2c09ba79
> 
> This can be used to query what RPM it came from (assuming the RPM
> is still in your repos)
> 
>   dnf repoquery --whatprovides debuginfo(build-id) = ...hash...
> 
> this makes it into the coredump files and is what current distro
> tooling uses to find the binary (and libraries).
> 
> There are some downsides/limitations with this though, so in
> Fedora 36 a new impl was added alongside which provides full
> package info in json
> 
> Note section [ 5] '.note.package' of 136 bytes at offset 0x404:
>    Owner          Data size  Type
>    FDO                  120  FDO_PACKAGING_METADATA
>      Packaging Metadata: {"type":"rpm","name":"qemu","version":"7.0.0-13.fc37","architecture":"x86_64","osCpe":"cpe:/o:fedoraproject:fedora:37"}

Looks very good

> 
> This format is supported by systemd core dump tools
> 
>    https://systemd.io/ELF_PACKAGE_METADATA/
> 
> I believe it has been proposed (and possibly implemented?) for
> Debian too.
> 
> This is a long winded way of asking, do we really need a QEMU specific
> solution here ? Especially one that only tells us a QEMU verison, and
> nothing about the many libraries QEMU links to which affect its
> operational behaviour.


Generic solution is of course better.

Hmm. I'm on Ubuntu 22.04.

readelf -n /usr/bin/qemu-system-x86_64

Displaying notes found in: .note.gnu.property
   Owner                Data size        Description
   GNU                  0x00000020       NT_GNU_PROPERTY_TYPE_0
       Properties: x86 feature: IBT, SHSTK
         x86 ISA needed: x86-64-baseline

Displaying notes found in: .note.gnu.build-id
   Owner                Data size        Description
   GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID bitstring)
     Build ID: 4298cd7c2623c58e1cd71668d9d48508bb7f8d52

Displaying notes found in: .note.ABI-tag
   Owner                Data size        Description
   GNU                  0x00000010       NT_GNU_ABI_TAG (ABI version tag)
     OS: Linux, ABI: 3.2.0


OK. But I can't find this build-id in core file..

readelf -n /tmp/cores/core.qemu-system-x86.20351.vsementsov-win.1676544081 | grep -i 'build'  ----  gets nothing

strings /tmp/cores//core.qemu-system-x86.20351.vsementsov-win.1676544081 | grep 4298cd7c2623c58e   ---- nothing as well

So the case is to find the package not having the binary, only by core file.

Probably right solution is to fix our workflow so that if you have core file you always have corresponding binary as well.

Still, having the information exactly inside core file seems good anyway. Maybe there is a generic way to force the system put "Packaging Metadata" into core file on creation of it?

-- 
Best regards,
Vladimir



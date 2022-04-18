Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E8504E3E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 11:10:00 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngNOR-0005Qk-D7
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 05:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNMI-0003wf-Rm
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:07:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNMG-0003N7-Tx
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:07:46 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNLJ-000A8Q-E2; Mon, 18 Apr 2022 10:06:49 +0100
Message-ID: <433fdc93-b483-3dc6-43e7-28b54a95318c@ilande.co.uk>
Date: Mon, 18 Apr 2022 10:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <9940864.osJUfx695o@silver>
 <CH2PR11MB445407B4D35ECD8B77AD53F7EFEF9@CH2PR11MB4454.namprd11.prod.outlook.com>
 <4649965.RNUEIdHhq1@silver>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4649965.RNUEIdHhq1@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/04/2022 13:55, Christian Schoenebeck wrote:

> On Donnerstag, 14. April 2022 19:25:04 CEST Shi, Guohuai wrote:
>>> -----Original Message-----
>>> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> Sent: 2022年4月14日 19:24
>>> To: qemu-devel@nongnu.org; Shi, Guohuai <Guohuai.Shi@windriver.com>
>>> Cc: Bin Meng <bmeng.cn@gmail.com>; Greg Kurz <groug@kaod.org>
>>> Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
>>>
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Mittwoch, 13. April 2022 05:30:57 CEST Shi, Guohuai wrote:
>>>
>>>>> We have 3 fs drivers: local, synth, proxy. I don't mind about proxy,
>>>>> it is in  bad shape and we will probably deprecate it in near future
>>>>> anyway. But it would be good to have support for the synth driver,
>>>>> because we are using it for running test cases and fuzzing tests
>>>>> (QA).
> [...]
>> For 9p-synth:
>>
>> I had enabled 9p-synth.c and built it successfully on Windows platform.
>> However, test cases code are not built on Windows host.
>> So I think it is useless that enable synth on Windows host (no way to run
>> it).
> 
> Please, don't give up too soon. Looking at tests/qtest/meson.build it starts
> with:
> 
> # All QTests for now are POSIX-only, but the dependencies are
> # really in libqtest, not in the testcases themselves.
> if not config_host.has_key('CONFIG_POSIX')
>    subdir_done()
> endif
> 
> And looking at tests/qtest/libqtest.c I "think" this should be working on
> Windows as well. It uses socket APIs which are available on Windows. I don't
> see a real show stopper here for Windows.
> 
> Could you please try if you can compile the tests on Windows? What we would
> need is test/qtest/qos-test, we don't need all the other tests:
> 
> https://wiki.qemu.org/Documentation/9p#Test_Cases
> 
>>>> It is possible that to "map" extend attribute to NTFS stream data.
>>>> However, if Windows host media is not NTFS (e.g. FAT) which does not
>>>> support stream data, then the "map" can not work.
>>>
>>> ... yes exactly, it would make sense to use ADS [4] instead of xattr on
>>> Windows. ADS are available with NTFS and ReFS and maybe also with exFAT
>>> nowadays (?), not sure about the latter though. But I think it is fair
>>> enough to assume Windows users to either use NTFS or ReFS. And if they
>>> don't, you can still call error_report_once() to make user aware that
>>> seucrity_model=mapped(-xattr) requires a fileystem on Windows that
>>> supports ADS.
>>> [4] https://en.wikipedia.org/wiki/NTFS#Alternate_data_stream_(ADS)
>>>
>>
>> Windows does not support POSIX permission.
>> So I think that only allow user to use security_model=none is reasonable on
>> Windows host.
> 
> It depends on the use case. I assume your use case are Windows guests, in that
> case you don't have the concept of POSIX permissions neither on guest side,
> nor on host side (on the long-term I am pretty sure though that Windows guest
> users would want to have some kind of Windows ACL mapping implementation as
> well).
> 
>> There is a difficulty to support "mapped" or "mapped-file" on Windows host:
>> There are many functions in 9p-code using APIs like "openat", "mkdirat",
>> etc. MSYS does not support that (openat is not valid on Windows host). I
>> remember that 9p replaced "open" by "openat" for a long time.
>> To fully support "security_model=mapped", 9p for Windows need to replace
>> "openat" by "open". This may impact too many functions.
>>
>> I would have a try to enable "mapped" by using ADS, but it looks like a big
>> refactor for 9p-local.c
> 
> Regarding openat(): We had a similar challenge for macOS host implementation;
> macOS does not have mknodat(), so what we're currently doing is
> 
>    pthread_fchdir_np(...)
>    mknod(...)
> 
>    https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util-darwin.c#L84
> 
> So on Windows you could do:
> 
>    chdir(...)
>    open(...)
> 
> as workaround for providing openat() for msys.
> 
> For security_model=mapped(-xattr) to work on Windows you basically would need
> to provide a replacement implementation (based on Windows ADS) in
> 9p-util-windows.c for:
> 
>    ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char
>                                 *name, void *value, size_t size);
> 
>    ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
>                                  char *list, size_t size);
> 
>    ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>                                    const char *name);
> 
>    int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>                             void *value, size_t size, int flags);
> 
> So it does not look too bad I think to get security_model=mapped working, and
> it would make Windows 9p host support much more usable (for Linux guests,
> macOS guests, but also for Windows guests with mapped Windows ACL in future).

FWIW even just having security_model=none would be very useful here, since then 9pfs 
could be used to share host files across all of Windows, MacOS and POSIX OSs which is 
something that can't yet be done with virtiofsd.

Whilst using ADS would allow the xattrs to be attached to files, how would this work 
in the case of ACLs which are stored as a "system.posix_acl_access" attribute? My 
concern would be that files copied from the guest to the host wouldn't have sensible 
permissions when read directly on the host. Presumably there would be some existing 
precedent for how this is handled in WSL2?


ATB,

Mark.


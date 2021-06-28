Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F53B565A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 02:39:03 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxfIk-0001PO-4G
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 20:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxfHu-0000kq-Vl
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 20:38:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxfHr-0001xn-EG
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 20:38:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 34B967457E5;
 Mon, 28 Jun 2021 02:38:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E3A03745708; Mon, 28 Jun 2021 02:38:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E176F7456B4;
 Mon, 28 Jun 2021 02:38:03 +0200 (CEST)
Date: Mon, 28 Jun 2021 02:38:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Zak <richard.j.zak@gmail.com>
Subject: Re: Qemu on Haiku
In-Reply-To: <CAOakUfOUdn2QThCzX==KOC83hOAjMc4OEKmto9ySDh-bEk80LQ@mail.gmail.com>
Message-ID: <92ed67e4-777-1361-1217-2b5b708fc15@eik.bme.hu>
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
 <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
 <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
 <CANCZdfpvUqTb1BkYfRxA5GMk4NC+=iNAJYdEoc1kSc6ydpc8Tg@mail.gmail.com>
 <CAOakUfOUdn2QThCzX==KOC83hOAjMc4OEKmto9ySDh-bEk80LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1511492867-1624840683=:43390"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1511492867-1624840683=:43390
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Jun 2021, Richard Zak wrote:
> Hopefully last questions:
>
> 1) What's the format for the subject line for patches? I'm seeing things
> like "[PATCH 2/4]" or "[PATCH v2 00/10]" what do those numbers mean in this
> context? I didn't see anything about this mentioned in the SubmitAPatch
> wiki.

These are added by git format-patch so check out the docs for that (git 
format-patch --help). The numbers are number of patch/total number in 
series, related patches are submitted in one series. The v2 is second 
revision of a patch. The first submission doesn't have a version, then 
when review asks for changes you make those and do git format-patch -v 2 
and so on. For changing commits you might want to learn about git rebase 
-i and git commit --amend. When making commits you don't have to add these 
[PATCH ...] headers just the subject line, then git will add these when 
formatting/sending patches.

> 2) Is it acceptable to have a patch for the configure script, or is that
> generated? I found some Haiku-related issues there

The configure script is not generated, it's just a shell script so you can 
send patches for it I think.

> 3) Is there a way to specify that the patch is for a submodule, or is there
> a separate place for that?

Submodules are separate projects so you'd have to get in patches to them 
separately then QEMU would pick it up from upstream. Each of these may 
have different process to send patches.

Regards,
BALATON Zoltan

> Regarding prior email:
> Seems like the big tasks are:
> 1) Haiku VM for continuous integration. Is this hosted in Amazon or other
> cloud infrastructure?
> 2) Resolving issues with Haiku pertaining to testing, bringing it inline
> with other OSes (and I see how the disk space error)
> 3) Supporting aspects of the qemu code relevant to Haiku (found an issue in
> slirp & configure script)
>
> Thank you for your help & patience!
>
> În vin., 25 iun. 2021 la 23:03, Warner Losh <imp@bsdimp.com> a scris:
>
>>
>>
>> On Fri, Jun 25, 2021 at 8:45 PM Richard Zak <richard.j.zak@gmail.com>
>> wrote:
>>
>>> Hello and thanks for the detailed response! I wasn't aware that a Linux
>>> host could compile for Haiku as a target, that's interesting.
>>>
>>> Seems like the big tasks are:
>>> 1) Haiku VM for continuous integration. Is this hosted in Amazon or other
>>> cloud infrastructure?
>>>
>>
>> Take a look at, for example, the make vm-build-freebsd target (see
>> tests/vm/Makefile.include). It downloads
>> the latest FreeBSD images, boots it with a serial console, walks through
>> the install of the base OS, then
>> installs the packages needed for qemu to build and kicks off a build and
>> runs some acceptance tests
>> afterwards. OpenBSD, NetBSD and several Linux distributions have similar
>> setups. I think it would be
>> useful for there to be one for Haiku as well, so any developer could run
>> these tests either in response to
>> a bug report in their code, or to make sure things work on/with Haiku. All
>> of this is done locally.
>>
>> There's a separate issue for creating a Haiku runner for gitlab, but I
>> know little even about the FreeBSD
>> runner.
>>
>>
>>> 2) Supporting aspects of the qemu code relevant to Haiku.
>>>
>>> I'll take a look at that Wiki page to get a feel for things, and I've
>>> started with the compilation of the latest code from the repo on Haiku,
>>> addressing some issues as they come up.
>>>
>>> I am a huge fan of both projects, but also am doing this in my own time.
>>> I'm a developer professionally, but working on Haiku & qemu during off
>>> hours (though timely shouldn't be a problem). How are things communicated
>>> for this project (in regard to your request for someone who can help in a
>>> timely manner)? It seems that the vast majority of the mailing list is
>>> patch information. What's the primary way for code to be contributed, a
>>> merging code though Gitlab or via emailed
>>>
>> patches?
>>>
>>
>> Emailed patches. https://wiki.qemu.org/Contribute/SubmitAPatch has all
>> the details, though the volume of patches means that you really want to
>> make sure that you CC the maintainers of the code listed in the MAINTAINERS
>> file when submitting patches to help ensure they do not get list.
>>
>> Warner
>>
>>
>>>
>>> În vin., 25 iun. 2021 la 03:09, Thomas Huth <thuth@redhat.com> a scris:
>>>
>>>> On 25/06/2021 06.12, Richard Zak wrote:
>>>>> Hello there! I noticed the message which appears when building qemu on
>>>>> Haiku. I'd hate for Haiku to lose qemu, so I would like to help!
>>>>>
>>>>> What is needed in terms of a build system for continuous integration?
>>>> I'm
>>>>> not familiar with CI systems, other than simply knowing what they do.
>>>>
>>>>   Hi,
>>>>
>>>> since a couple of month, we already have a Haiku VM in our VM tests, so
>>>> the
>>>> basics are already there - it's possible to run a Haiku build test on a
>>>> Linux host by typing:
>>>>
>>>>   make vm-build-haiku.x86_64
>>>>
>>>> However, it's still in a quite bad shape, the disk image that is used in
>>>> that VM is not big enough for compiling the whole QEMU sources. So
>>>> somebody
>>>> needs to add some additional logic there to either increase the disk
>>>> image
>>>> on the fly or to add a second free disk image to the VM that could be
>>>> used
>>>> for compilation instead. If you want to have a try, have a look at:
>>>> tests/vm/haiku.x86_64
>>>>
>>>> Also, I'm not sure whether Peter is using this VM already in his gating
>>>> CI
>>>> tests? I guess not, due to those size limitations...
>>>>
>>>> Finally, we'd also need somebody who's proficient with the Haiku APIs
>>>> and
>>>> who could help with problems in a timely manner, i.e. we'd need an entry
>>>> in
>>>> the "Hosts" section in the maintainers file. It should be someone who's
>>>> basically familiar with the QEMU development process, so if you're
>>>> interested, I'd suggest that you try to contribute some patches to QEMU
>>>> first to get a basic understanding of the process (see e.g.
>>>> https://wiki.qemu.org/Contribute/BiteSizedTasks for some easier tasks),
>>>> and
>>>> once you feel confident, you could add a Haiku entry to the MAINTAINERS
>>>> file.
>>>>
>>>>   Thomas
>>>>
>>>>
>>>
>>> --
>>> Regards,
>>>
>>> Richard J. Zak
>>> Professional Genius
>>> PGP Key: https://keybase.io/rjzak/key.asc
>>>
>>
>
>
--3866299591-1511492867-1624840683=:43390--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF9A14BEB9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 18:39:02 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwUpJ-0002nW-I1
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 12:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iwUnn-0001pp-Sg
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iwUnm-0000k7-Ct
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:37:27 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34559)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iwUnm-0000h7-3Z
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:37:26 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MaIvV-1j29Yb3o3B-00WJEY; Tue, 28 Jan 2020 18:37:21 +0100
Subject: Re: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
 <20200127093004.GA18565@stefanha-x1.localdomain>
 <CAL1e-=h+g4FWVDVe6a4T_X_nEA-catKd+7LiKXx++qS+G7mqOQ@mail.gmail.com>
 <74b19db2-8ed2-c0c4-2870-b60dd49789cd@vivier.eu>
 <CAL1e-=iUzdg=bvdinM=qtVtOt+yzPw4+E-_m1CRKXW-EHdwkrw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <15dd57da-60bf-edc8-9108-844bd73151b9@vivier.eu>
Date: Tue, 28 Jan 2020 18:37:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=iUzdg=bvdinM=qtVtOt+yzPw4+E-_m1CRKXW-EHdwkrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6Hio/bO7dtJ7XI3t5E8hn+cWzP/ki0gH2GjPKxqOEbzqsisdzj6
 w/Jm3Sj6JExkzu19sg398EMJeDL7SBv9qJduU0hGanPE/qkzMkqteONa+osZpHdYNe8wd69
 +tY+JVb50Q4JuiHbZYSoWj7QcVOqqrKF5zCi4avRBOyL3YJHt07rsKAXeEu+944Kt1Hp+zA
 QUC6ss+fabJHfuxgZphyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q0I6n9ObpXQ=:hoCM1rm2Pqo3IL5Zp6hGKv
 2mJcvPdOIxKGjZU5Er9XWmVAV9oiDPYqwfeRWWUZRXWaamijGSOHe2qgKSd15MtPdFYgvzXHL
 A57FxQRCBVRvdNRQQYrn6A0N+XFY6lKI+E171OjCKq4sXFEqXHaFST0fFfpzMk/fg3hWeciId
 e1x1ktMalgrmXo/6gro9sl2+cwbHd7w5R5eW0fRRO1qNZEzFI5yf7TWnMitfkuQRPrfF8QnYA
 Dt8m0cxRdS4I6Veqfv5ra6xcybSNfnHlDNTDJGuxiiR9CGszDV3ybOmjMBml0RVlCdsSZw7I4
 2M/2kr7WGNYf17e3bUJeusJS6P5vGfvOVsiTpvULuVJDMH8Mf4RA3qjCzqJNyKJeO91gRfPdD
 vd9DxDYs3OuKEioLQzvFvzYwOsgCHAOTRhRkmU+yNUufGS213tAFvuM0Q40LRcS2QAJvAOm1h
 TxAQL8ArneJII3hbP9/GsHMiAjsoIRsUYpbkWki4egffi75dPpPrma9o7MsHSW/FJN5r7GFoe
 yi+Y7cjdaRi10NlBRULWGJdyxSiJskLiXEG1NRQFYDIY5jewrk8IQaE3CP9ps0ZBsjODh8sp6
 QSygKxmZx45DaNJ74NGG0EQvFGFBjP7mdwnyxzrNsDU5Mwx2LfvcqSmc+zjLA8W7fWmDTZw9u
 T091iZs05Z8W0VotpKEo5NKJ0aC7R0S8KOay772nD/0T7qKhnVJvHhejefMaKGL7lxmDOywwJ
 WSIBcN8Qhw5OFRxbUhI57pc8YsN3yPenkVhMSGbV6H+pYC/0fOeTjg84j6Ueip3IpftSZxi7b
 qfYTT+HPlCAm5gE9OuuyRpa1w45qG9Z9tOKFkRrgbHR8fDcqqUvV2nWx202H7bcgb9g9vre
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/01/2020 à 18:32, Aleksandar Markovic a écrit :
> 15:28 Uto, 28.01.2020. Laurent Vivier <laurent@vivier.eu
> <mailto:laurent@vivier.eu>> је написао/ла:
>>
>> Le 27/01/2020 à 17:30, Aleksandar Markovic a écrit :
>> >
>> >
>> > On Mon, Jan 27, 2020 at 10:30 AM Stefan Hajnoczi
> <stefanha@redhat.com <mailto:stefanha@redhat.com>
>> > <mailto:stefanha@redhat.com <mailto:stefanha@redhat.com>>> wrote:
>> >>
>> >> On Thu, Jan 23, 2020 at 02:34:01PM +0100, Aleksandar Markovic wrote:
>> >> > *Extend support for ioctls in QEMU linux-user mode*
>> >> >
>> >> >
>> >> >
>> >> > *PLANNED ACTIVITIES*
>> >> >
>> >> > BACKGROUND
>> >> >
>> >> > There is currently 2500+ ioctls defined in Linux kernel. QEMU
> linux-user
>> >> > currently supports only several hundred. There is a constant need for
>> >> > expanding ioctl support in QEMU. Users use Linux-user mode in
> variety of
>> >> > setups (for example, building and testing tools and applications
> under
>> >> > chroot environment), and, on a regular basis, efforts by multiple
> people
>> >> > are made to fill in missing support. However, these efforts have been
>> >> > usually done on a piece-by-piece basis, i a limited way covering a
>> >>
>> >> s/ i / in /
>> >>
>> >> > partucular need. This project will take more proactive stance, and
>> > try to
>> >>
>> >> s/partucular/particular/
>> >>
>> >> > improve QEMU before users start complaining.
>> >> >
>> >> > PART I:
>> >> >
>> >> >    a) Add strace support for outputing ioctl IDs (the second
> argument of
>> >> > ioctl()) as strings rather than numbers - for all platform
> independant
>> >> > ioctls.
>> >> >    b) Add strace support for printing the third argument of ioctl()
>> > (be it
>> >> > int, string, structure or array) - limited to selected ioctls
> that are
>> >> > frequently used.
>> >> >
>> >> > PART II:
>> >> >
>> >> >    a) Amend support for existing groups of ioctls that are not
> completed
>> >> > 100% (let's say, filesystem ioctls)
>> >> >    b) Add support for a selected group of ioctls that are not
> currently
>> >> > supported (for example, dm ioctls, Bluetooth ioctls, or Radeon DRM
>> > ioctls)
>> >> >
>> >> > PART III:
>> >> >
>> >> >   a) Develop unit tests for selected ioctls that are already
>> > supported in
>> >> > QEMU.
>> >> >
>> >> >
>> >> > *DELIVERABLES*
>> >> >
>> >> > The deliverables are in the form of source code for each part,
>> > intended to
>> >> > be upstreamed, and time needed for upstreaming (addressing reviews,
>> > etc.)
>> >> > process is included int this project.
>> >> >
>> >> > The delivery of results can and should be distributed over larger
>> > period of
>> >> > time 2-3 months.
>> >>
>> >> Good project idea.  Please choose concrete ioctls.  Applicants may not
>> >> have the necessary experience to choose a set of ioctls that are
> useful.
>> >>
>> >
>> > PART I should not be that difficult. PART II is, however, a minefield.
>> > An implementation of support of a ioctl range from 15 minutes to two
>> > months. The least we wont to happen is that the student is stuck with a
>> > problem for months. Therefore I suggest first some "low hanging fruit"
>> > for a student to get self-confidence and experience. One such group is
>> > DM ioctl group ( link
>> >
> <https://github.com/torvalds/linux/blob/master/include/uapi/linux/dm-ioctl.h#L251>
>> > ) (Laurent may confirm, or "unconfirm" that). The next shoudl be
>>
>> Well, ioctl are generally implemented on demand when we see there is one
>> missing. DM can be interresting, but do we have an easy way to test them?
>>
> 
> The main difficilty, as I see this now, would be establishing a test
> bed. This should be possible using one or two USB flash drives (if one
> doesn't want to mess with own hard drives and partitions). After that,
> having dm-enabled devices available, writing unit test should be
> straightforward.

The easiest way to test DM is to use a qemu-system-x86_64/kvm VM with
several storage files and to run qemu-user inside. And a VM is easier to
restore when we break it... and it will happen.

Thanks,
Laurent



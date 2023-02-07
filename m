Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4C68CAFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 01:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPBaa-0002o4-Ae; Mon, 06 Feb 2023 19:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPBaY-0002nq-I3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPBaW-0004Ob-SW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675728715;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMVBThpHtfw6qHM1F73LypxJ/lD2NiDMk7eR5PYr6bY=;
 b=Fd3cKZAoBHkE01ZC/a0KQPuUUWEV5CMUOvfCB5xM6IZ3FmIvxVGdwZJP+mXxHF6zYa8Qje
 WrEZhCHdWvEUo2raLFj7hMantEtN/kKwkrXUtQz7/QzFn1Hj+/9YUuNZ9wJ0/hwXS/48t4
 x3fYqJGy+UFSnLTVIzh0TRDXsdMjTtU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-n57Sh1K-MCy2iSRgv7YFjg-1; Mon, 06 Feb 2023 19:11:51 -0500
X-MC-Unique: n57Sh1K-MCy2iSRgv7YFjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so9723541wmj.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 16:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QMVBThpHtfw6qHM1F73LypxJ/lD2NiDMk7eR5PYr6bY=;
 b=T8ogEeehlDKpuD/8xAhO7xlKVvEEJia8LdABZAs/OyrACz5iWoFAfOBpt86kX0Z1ja
 7Co5h4uozuCWZXXsKObrmIWXZyq3xIKAufvmkfivfW9FrpmxMYiYBoG69Peuy3jZL51u
 6TcXfPE2QW6BwS6ruZ73lfn7SEgLSCkvIvALtzEAAVktSv0vrOf/i5fiYCxZF8lS2KhP
 C5anVwIOYvgX0IIGeA66I83q2F0lxDnHjIm+281iSLwwL4JZ0WhkSIEtLDepr4euIlyg
 HXdtq36bTiImiBZCYYy8MorMd6QnxhxagNRyYQvSR/T3SexKXhKy0YzpgXP+3TCj3qcd
 WjYw==
X-Gm-Message-State: AO0yUKUsETfPpwrmim0SnXLair5xkGCZNNFcCmaBi1riI5iaFvX+jwOV
 HRDjRW/fmvKo4VSqjPAYDT6Umwt4gYFX5VYdB6bQohMm3/c/KYDhN+sVhWj9ZH+wURoHgKFo8FT
 fmpnDd2T6ThxiMB4=
X-Received: by 2002:adf:de91:0:b0:2c1:2a15:9dd3 with SMTP id
 w17-20020adfde91000000b002c12a159dd3mr591116wrl.48.1675728710467; 
 Mon, 06 Feb 2023 16:11:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/WrYLtGupe1pWthla/noDgjuR1aoa8ptoiWNdIhfwfDYlE6IJH8RYidtUIUozrw4L3GAZCzQ==
X-Received: by 2002:adf:de91:0:b0:2c1:2a15:9dd3 with SMTP id
 w17-20020adfde91000000b002c12a159dd3mr591093wrl.48.1675728710210; 
 Mon, 06 Feb 2023 16:11:50 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003dfdeb57027sm15644525wmp.38.2023.02.06.16.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 16:11:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Michal =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
In-Reply-To: <Y+FxlKN2/DsCiCzC@x1n> (Peter Xu's message of "Mon, 6 Feb 2023
 16:31:00 -0500")
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-4-peterx@redhat.com>
 <87cz6stk4a.fsf@secure.mitica> <Y9wf5AI4xmHhNCTM@x1n>
 <87357mfoq7.fsf@secure.mitica> <Y+FxlKN2/DsCiCzC@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 01:11:48 +0100
Message-ID: <87edr2uyez.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Fri, Feb 03, 2023 at 10:01:04PM +0100, Juan Quintela wrote:
>> Peter Xu <peterx@redhat.com> wrote:
>> > On Thu, Feb 02, 2023 at 11:52:21AM +0100, Juan Quintela wrote:
>> >> Peter Xu <peterx@redhat.com> wrote:
>> >> > Teach QEMU to use /dev/userfaultfd when it existed and fallback to =
the
>> >> > system call if either it's not there or doesn't have enough permiss=
ion.
>> >> >
>> >> > Firstly, as long as the app has permission to access /dev/userfault=
fd, it
>> >> > always have the ability to trap kernel faults which QEMU mostly wan=
ts.
>> >> > Meanwhile, in some context (e.g. containers) the userfaultfd syscal=
l can be
>> >> > forbidden, so it can be the major way to use postcopy in a restrict=
ed
>> >> > environment with strict seccomp setup.
>> >> >
>> >> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> >> > Signed-off-by: Peter Xu <peterx@redhat.com>
>> >>=20
>> >>=20
>> >> Hi
>> >
>> > Hi, Juan,
>>=20
>>=20
>> >> static int open_userfaultd(void)
>> >> {
>> >>     /*
>> >>      * Make /dev/userfaultfd the default approach because it has bett=
er
>> >>      * permission controls, meanwhile allows kernel faults without any
>> >>      * privilege requirement (e.g. SYS_CAP_PTRACE).
>> >>      */
>> >>      int uffd =3D open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
>> >>      if (uffd >=3D 0) {
>> >>             return uffd;
>> >>      }
>> >>      return -1;
>> >> }
>> >>=20
>> >> int uffd_open(int flags)
>> >> {
>> >> #if defined(__linux__) && defined(__NR_userfaultfd)
>>=20
>> Just an incise, checkpatch don't liue that you use __linux__
>>=20
>> This file is compiled under CONFIG_LINUX, so you can drop it.
>
> Yes indeed.  I'll drop it.
>
>>=20
>> >>     static int uffd =3D -2;
>> >>     if (uffd =3D=3D -2) {
>> >>         uffd =3D open_userfaultd();
>> >>     }
>> >>     if (uffd >=3D 0) {
>> >>         return ioctl(uffd, USERFAULTFD_IOC_NEW, flags);
>> >>     }
>> >>     return syscall(__NR_userfaultfd, flags);
>> >> #else
>> >>      return -EINVAL;
>> >>=20
>> >> 27 lines vs 42
>> >>=20
>> >> No need for enum type
>> >> No need for global variable
>> >>=20
>> >> What do you think?
>> >
>> > Yes, as I used to reply to Phil I think it can be simplified.  I did t=
his
>> > major for (1) better readability, and (2) being crystal clear on which=
 way
>> > we used to open /dev/userfaultfd, then guarantee we're keeping using i=
t. so
>> > at least I prefer keeping things like trace_uffd_detect_open_mode().
>>=20
>> The trace is ok for me.  I just forgot to copy it on the rework, sorry.
>>=20
>> > I also plan to add another mode when fd-mode is there even if it'll re=
use
>> > the same USERFAULTFD_IOC_NEW; they can be useful information when a fa=
ilure
>> > happens.
>>=20
>> The other fd mode will change the uffd.
>>=20
>> What I *kind* of object is:
>> - Using a global variable when it is not needed
>>   i.e. for me using a global variable means that anything else is worse.
>>   Not the case IMHO.
>
> IMHO globals are evil when they're used in multiple places; that's bad to
> readability.  Here it's not the case because it's set once and for
> all.

That is part of the problem.

int foo;

I need to search all the code to see where it is used.

int bar(...)
{
    static int foo;
    ....
}

I am really sure that:
- foo value is preserved between calls
- it is not used anywhere else

without a single grep through the code.

> I
> wanted to have an easy and clear way to peek what's the mode chosen even
> without tracing enabled (e.g. from a dump or a live process).

I haven't thought about this.  But you want something different than this?

(fada)$ cat /tmp/kk.c

int bar(void)
{
	static int foo =3D 42;
	return foo++;
}

int main(void)
{
	int a =3D 7 + 1;
	return a + bar();
}
(fada)$ gcc -Wall /tmp/kk.c -o /tmp/kkk -g
(fada)$ gdb /tmp/kkk
(gdb) b main
Breakpoint 1 at 0x401123: file /tmp/kk.c, line 10.
(gdb) p bar::foo
$1 =3D 42
(gdb)=20

And yes, I have to search how this is done O:-)

>> - Call uffd_open_mode() for every call, when we know that it can change,
>>   it is going to return always the same value, so cache it.
>
> uffd_detect_open_mode() caches the result already?  Or maybe you meant
> something else?

What I did.  Only call the equilavent function once.  You are calling it
every time that uffd_open() is called.

>
>>=20
>> > Though if you insist, I can switch to the simple version too.
>>=20
>> I always told that the person who did the patch has the last word on
>> style.  I preffer my version, but it is up to you to take it or not.
>
> Thanks,

Later, Juan.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EC430FC2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 07:35:11 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcLIi-0006XG-SH
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 01:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcLAi-0005AM-Ip
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:26:52 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:12364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcLAg-0004H8-K3
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:26:52 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 549F6734B8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 05:26:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXljj1WrFz4TQ9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 05:26:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 1100AE174
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 05:26:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f182.google.com with SMTP id g20so2030651qka.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 22:26:49 -0700 (PDT)
X-Gm-Message-State: AOAM530cpWb1grpcQa8nLxIKDICOm74lz5w6X0SXKfVtyQx/EI8W41kk
 033HKiJClhdbbiScAiOWVzxZoAYNhSapBCPxNas=
X-Google-Smtp-Source: ABdhPJyTl+ZMr0iEftXKl5mFg/qnYi/wPCLDET/1zeu3JXkgF1eW7XYem6GJaRkVCPS0oWMyRbjYJOLD3+zgKDJJbUw=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr21112507qko.258.1634534808717; 
 Sun, 17 Oct 2021 22:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
 <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
 <CANCZdfqPp4aZzx_kzTW87mu9Q2iQWo=kD5FeJaBmFQuM5Sqbww@mail.gmail.com>
 <CANCZdfqBk0DBhujcMmM-rup90jeF3iM5Nu69SZq5wbKGjzK0+g@mail.gmail.com>
In-Reply-To: <CANCZdfqBk0DBhujcMmM-rup90jeF3iM5Nu69SZq5wbKGjzK0+g@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Mon, 18 Oct 2021 00:26:37 -0500
X-Gmail-Original-Message-ID: <CACNAnaES5e8Df32KxGW1Aip2iP8hSWn9DW1U87S3P6EM9VTTdA@mail.gmail.com>
Message-ID: <CACNAnaES5e8Df32KxGW1Aip2iP8hSWn9DW1U87S3P6EM9VTTdA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 12:02 AM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Sun, Oct 17, 2021 at 10:29 PM Warner Losh <imp@bsdimp.com> wrote:
>>
>>
>>
>> On Sun, Oct 17, 2021 at 9:43 PM Kyle Evans <kevans@freebsd.org> wrote:
>>>
>>> On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>>> >
>>> > To increase flexibility, only descend into *-user when that is
>>> > configured. This allows *-user to selectively include directories bas=
ed
>>> > on the host OS which may not exist on all hosts. Adopt Paolo's
>>> > suggestion of checking the configuration in the directories that know
>>> > about the configuration.
>>> >
>>> > Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
>>> > Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
>>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> > Signed-off-by: Warner Losh <wlosh@bsdimp.com>
>>> > Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
>>> >
>>> > Sponsored by:           Netflix
>>> > ---
>>> >  bsd-user/meson.build   | 4 ++++
>>> >  linux-user/meson.build | 4 ++++
>>> >  meson.build            | 3 +--
>>> >  3 files changed, 9 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
>>> > index 0369549340..243fb78930 100644
>>> > --- a/bsd-user/meson.build
>>> > +++ b/bsd-user/meson.build
>>> > @@ -1,3 +1,7 @@
>>> > +if not config_target.has_key('CONFIG_BSD_USER')
>>> > +   subdir_done()
>>> > +endif
>>> > +
>>> >  bsd_user_ss.add(files(
>>> >    'bsdload.c',
>>> >    'elfload.c',
>>> > diff --git a/linux-user/meson.build b/linux-user/meson.build
>>> > index 9549f81682..602255a3d6 100644
>>> > --- a/linux-user/meson.build
>>> > +++ b/linux-user/meson.build
>>> > @@ -1,3 +1,7 @@
>>> > +if not config_target.has_key('CONFIG_LINUX_USER')
>>> > +   subdir_done()
>>> > +endif
>>> > +
>>> >  linux_user_ss.add(files(
>>> >    'elfload.c',
>>> >    'exit.c',
>>> > diff --git a/meson.build b/meson.build
>>> > index 99a0a3e689..1f2da5f7d9 100644
>>> > --- a/meson.build
>>> > +++ b/meson.build
>>> > @@ -2303,10 +2303,9 @@ subdir('ebpf')
>>> >
>>> >  common_ss.add(libbpf)
>>> >
>>> > -bsd_user_ss.add(files('gdbstub.c'))
>>> >  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>>> >
>>> > -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
>>> > +linux_user_ss.add(files('thunk.c'))
>>> >  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_s=
s)
>>> >
>>> >  # needed for fuzzing binaries
>>> > --
>>> > 2.32.0
>>> >
>>>
>>> I don't understand the gdbstub.c removal  here; don't we still want to
>>> be compiling it in, just only if the appropriate
>>> CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn't appear to
>>> be added in individual *-user/meson.build, I assume it's uncommon to
>>> add in ../foo.c in meson-land...
>>
>>
>> It's added to specific_ss at line 2536
>> specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
>>
>> so we don't need to add it again here.
>
>
> I've also confirmed that it's built as both libqemu-i386-bsd-user.fa.p/gd=
bstub.c.o
> and libqemu-x86_64-bsd-user.fa.p/gdbstub.c.o, which is what I'd expect gi=
ven
> the current upstream supported architectures are only i386 and x86_64.
>
> Warner

Ah, ok, thanks! So that looks like a kind-of tangential cleanup, but
related enough that it makes sense.

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>


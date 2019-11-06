Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C825CF199C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 16:12:02 +0100 (CET)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSMyX-0002BD-Ke
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 10:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jandryuk@gmail.com>) id 1iSMxc-0001ku-Nv
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jandryuk@gmail.com>) id 1iSMxb-0004Rl-OV
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:11:04 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jandryuk@gmail.com>) id 1iSMxb-0004RK-HI
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:11:03 -0500
Received: by mail-lj1-x241.google.com with SMTP id m9so26487329ljh.8
 for <qemu-devel@nongnu.org>; Wed, 06 Nov 2019 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0bIbbQ4C2sb3ptLfIGkCO37EbzkdBtG7VUHRPJsrHck=;
 b=VS6iIwPPmviUrI4dhvLN5lGDVR5sN7PfMWrWlgxxCIPXWgb60564X4gD4i4yUUxOnJ
 Q1z1s6yPkQe6yJ+rJ/LT7GWlboYg5xdLdmfc5t/B0c8BmFN1seCgSbT45qrSVWfXQqIi
 TgQYdf2r5jRa4LlRqBhDFnvLnsMm+mXCubeq658+aSMgCGASow8F7slFa0U33S8Ytxgg
 f+1q+QLS9jm/NtCXwdCmRpZGEx/on8hxyfzHvauxCe1V0LuhdMmEkKNiyYbr1VDudOsm
 IRkOsEfkAaMyh0+fmFxmD9AwbbJYuthn/jDtSBkDfE6SRVwIYUoC6E75QMeTpWvXc0uy
 QNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0bIbbQ4C2sb3ptLfIGkCO37EbzkdBtG7VUHRPJsrHck=;
 b=d5F42zWHKSZXUQi+d/zNxBa0houN91Sb/WvNSS4WdJ1Kd8BeXtSolhg/Sc4rmT3hdj
 iOgrAzZ29O+5DwoyKXyg4QsDLVrvtnx67fcbpyUXnnN9ndqNEENIxROYHSaa8M3m/tmw
 jiuE2jTcQB4sjjRdcQfhu7sd2Q4+O0XzNKAAf2n5rbatEO9gISMnDa5VQETPJ4T5cwzH
 9rJuCj7HjZI8SVyGuE0p4xz+8FTOfloHWvnofSf5vstKmUp75HYVIN4WHx9CNSnt0PBS
 Hddl7wxB/bSLr4Ihaqvld0mSqqGUvqczy4kZfbLcKl3wGPygVhXKN9tE/tvG2j4mZFsk
 YFsQ==
X-Gm-Message-State: APjAAAV9IyeppVeZr7NDfomtfHfQrMx29C2+lHGtvOycIMVfeTcTsZpw
 zFQEHW86VcRMZprtH3kkz0dqrSYFBxOsov4slJo=
X-Google-Smtp-Source: APXvYqwzBWm3ywrp9FmsGwYiMZFXzOTeUoqbMfO7fj3HJ+9kl9Q0RNZlRcWpiI9Xhktksa6FqsdnB/8CEE4mJegnb+0=
X-Received: by 2002:a2e:b537:: with SMTP id z23mr2365918ljm.129.1573053062151; 
 Wed, 06 Nov 2019 07:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20191106130309.6737-1-jandryuk@gmail.com>
 <CAJ+F1CJLffYST5eVXBrOarYxRhkNvgGF0J3wGJ50xny7pLE2NA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJLffYST5eVXBrOarYxRhkNvgGF0J3wGJ50xny7pLE2NA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Nov 2019 10:10:51 -0500
Message-ID: <CAKf6xpt+0P8MgpBRPx2p-wtsd1YSW-m2WEjyGQ=QNu7J-CdkTQ@mail.gmail.com>
Subject: Re: [PATCH] qmp: Reset mon->commands on CHR_EVENT_CLOSED
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 6, 2019 at 9:53 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Nov 6, 2019 at 5:04 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > Currently, mon->commands is uninitialized until CHR_EVENT_OPENED where
> > it is set to &qmp_cap_negotiation_commands.  After capability
> > negotiation, it is set to &qmp_commands.  If the chardev is closed,
> > CHR_EVENT_CLOSED, mon->commands remains as &qmp_commands.  Only once th=
e
> > chardev is re-opened with CHR_EVENT_OPENED, is it reset to
> > &qmp_cap_negotiation_commands.
> >
> > monitor_qapi_event_emit compares mon->commands to
> > &qmp_cap_negotiation_commands, and skips sending events when they are
> > equal.  In the case of a closed chardev, QMP events are still sent down
> > to the closed chardev which needs to drop them.
>
> This is a minor improvement, not really a bug fix or do I read that incor=
rectly?

Yes, it is more of a minor improvement since disconnected chardevs
already drop the QMP events.  This will just stop generating them in
the first place.

> >
> > Set mon->commands to &qmp_cap_negotiation_commands for CHR_EVENT_CLOSED
> > to stop sending events.  Setting for the CHR_EVENT_OPENED case remains
> > since that is how mon->commands is set for a newly opened connections.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  monitor/qmp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 9d9e5d8b27..5e2073c5eb 100644
> > --- a/monitor/qmp.c
> > +++ b/monitor/qmp.c
> > @@ -333,6 +333,7 @@ static void monitor_qmp_event(void *opaque, int eve=
nt)
> >           * is closed.
> >           */
> >          monitor_qmp_cleanup_queues(mon);
> > +        mon->commands =3D &qmp_cap_negotiation_commands;
> >          json_message_parser_destroy(&mon->parser);
> >          json_message_parser_init(&mon->parser, handle_qmp_command,
> >                                   mon, NULL);
> > --
> > 2.21.0
> >
> >
>
> Looks good to me,
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thank you.

-Jason


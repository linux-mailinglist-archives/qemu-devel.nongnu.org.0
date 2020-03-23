Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618018FC49
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 19:06:37 +0100 (CET)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGRTA-0007eC-G0
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 14:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jGRPw-00052T-A7
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:03:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jGRPv-0000Do-2a
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:03:16 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jGRPu-0000Cj-Rj; Mon, 23 Mar 2020 14:03:15 -0400
Received: by mail-wm1-x342.google.com with SMTP id g62so551738wme.1;
 Mon, 23 Mar 2020 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7KYBKX6fN1ua+Kp1UXMHMIKyhwuANwXA4Atc7qp5klQ=;
 b=MtfdrciwCe9Xr49I2o87nJR2yh5Kd8Y298OVI29e5Te6DnSWdpfzpQPBAyHzEkuD9r
 7QbAqHMN4I92cUxFSkxEw3wmi7HjPcF6JfOYbWLejXp/dlMlJluwzjRG8hHRuSRhEsMC
 I5sNvHpGdpvu6rDXMUxS9+N+gc3b+3ZmXfLH6mFobZD1DHX1zb9GgWB1QwYU9sdC8bb+
 hvXamfsMD80Fgw0upIqrrvOmfbj0Dj95RXmGKob4rRvJ2lcgNydAXYgV3jqCGzI85Q9t
 hagWfsUyKr7zBwsIlYTuB8uBJq0epecHfmEv6a2/Hg31t5nfTrcpBauSxfWnJJtJUcpV
 Gdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7KYBKX6fN1ua+Kp1UXMHMIKyhwuANwXA4Atc7qp5klQ=;
 b=Vvt8Fiic7/MEWvFGxnpOTVhsiw4HWr2q/K7yl5xEmnxAvZbUmS1REUhFRyyTzwtMDq
 fXo9lwtlrXxL9jCTBvE9tP4F4auAFPQfBHT4B/p4J/wOsudeDPY0Jy/Ihhv0QqWttDpV
 65nlZ7+nWMh2PIeSxsITusf7+7oB2l8HiO3VBtqTIA9d6cU1gYMcWrEURHrLUb0B6+4a
 MOL28yEB7Zk7NBW4jRTUz7gj4b4nhntERpTTkPsIZGSTywEc3cpLbFyDXfmoKGpu3MZ7
 ybjQ2sR487B4WPR7mmCM0UWi+4lr4k6CTcJsQTxQlIUu6GwzSVcEvYQBa+uKzIzBkiL3
 NGrQ==
X-Gm-Message-State: ANhLgQ1ycE/153V2U3CHRA9VbiUNTo+8cyExBF5HnkhnEI3NROEUqyfO
 4G5qLJIqqLPa2uQp/ZBusZM+JzNep1nNplcj6rA=
X-Google-Smtp-Source: ADFU+vvsPfyK8ybcW6fkHbwNf+Xr9lFsOconwc6aIDeVOLQCPlR78+n+2AZPwcexlmy1hqUhWtrR15l+egLmhSL8q5w=
X-Received: by 2002:a1c:1fc9:: with SMTP id f192mr595041wmf.4.1584986593434;
 Mon, 23 Mar 2020 11:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200218154036.28562-1-kwolf@redhat.com>
 <20200218154036.28562-4-kwolf@redhat.com>
 <87d09965g3.fsf@dusky.pond.sub.org> <20200323174108.GD8049@linux.fritz.box>
In-Reply-To: <20200323174108.GD8049@linux.fritz.box>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 23 Mar 2020 19:03:01 +0100
Message-ID: <CAJ+F1CJEey8T6DP1bxCPBKY9kbZmWKxGpFnD6LOmVy2te+1g8g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] qmp: Move dispatcher to a coroutine
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Mar 23, 2020 at 6:41 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 18.03.2020 um 16:36 hat Markus Armbruster geschrieben:
> > Kevin Wolf <kwolf@redhat.com> writes:
> >
> > > This moves the QMP dispatcher to a coroutine and runs all QMP command
> > > handlers that declare 'coroutine': true in coroutine context so they
> > > can avoid blocking the main loop while doing I/O or waiting for other
> > > events.
> > >
> > > For commands that are not declared safe to run in a coroutine, the
> > > dispatcher drops out of coroutine context by calling the QMP command
> > > handler from a bottom half.
> > >
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >
> > Uh, what about @cur_mon?
> >
> > @cur_mon points to the current monitor while a command executes.
> > Initial value is null.  It is set in three places (not counting unit
> > tests), and all three save, set, do something that may use @cur_mon,
> > restore:
> >
> > * monitor_qmp_dispatch(), for use within qmp_dispatch()
> > * monitor_read(), for use within handle_hmp_command()
> > * qmp_human_monitor_command(), also for use within handle_hmp_command()
> >
> > Therefore, @cur_mon is null unless we're running within qmp_dispatch()
> > or handle_hmp_command().
>
> Can we make it NULL for coroutine-enabled handlers?

fwiw, I think /dev/fdset doesn't care about cur_mon. However, qmp
handlers that use monitor_get_fd() usually depend on cur_mon.

Note: I wonder if add-fd (fdsets) and getfd (monitor fds) deserve to co-exi=
st.

>
> > Example of use: error_report() & friends print "to current monitor if w=
e
> > have one, else to stderr."  Makes sharing code between HMP and CLI
> > easier.  Uses @cur_mon under the hood.
>
> error_report() eventually prints to stderr both for cur_mon =3D=3D NULL a=
nd
> for QMP monitors. Is there an important difference between both cases?
>
> There is error_vprintf_unless_qmp(), which behaves differently for both
> cases. However, it is only used in VNC code, so that code would have to
> keep coroutines disabled.
>
> Is cur_mon used much in other functions called by QMP handlers?
>
> > @cur_mon is thread-local.
> >
> > I'm afraid we have to save, clear and restore @cur_mon around a yield.
>
> That sounds painful enough that I'd rather avoid it.
>
> Kevin
>


--=20
Marc-Andr=C3=A9 Lureau


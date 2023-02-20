Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9869C7FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2qK-0006zL-DN; Mon, 20 Feb 2023 04:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pU2qG-0006yl-Pm
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:52:16 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pU2qE-0005LO-Nu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:52:16 -0500
Received: by mail-lf1-x12c.google.com with SMTP id s22so863753lfi.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gt9zNz75qraQ4Oxmc3ZcXIgmJWkIJK+mad56TIQh+v0=;
 b=dOckDNzFsA4EB0OkEnzp+rT1nO7MRdCCnlIXu7auFp1i4jhhAMK+7q8xyVomdGmDE3
 1YljhV4K8qwQyEIwNv2hXAaAQN9wxbCOZn3KJVR93bGjoedvr48olC7tgpmUzgbxkGZy
 fFg4Ek4wrbx0ZhNRQq/IkqAUQj53wkzp78ZdFWIxC4OStIQ1td1EUMRFsyZ3tz5LrsQR
 UDfpflz88jboSx6EhAEOG41l/UWfVHO8e4JPxR4/RwsgFaZeOsP0t86pnj7t0vdLnOsy
 O2LJWuVwTjA+++j/+o9jOnxBNh0rCk76A4URSiJou1K81ivhFPvDPQiuHX9PdNqa1xkX
 FL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gt9zNz75qraQ4Oxmc3ZcXIgmJWkIJK+mad56TIQh+v0=;
 b=SDx8nn4wQyRXxZyl9J2i4Cfrb5SCKI2htfZwMvrxJWW4tzPjjM57oCSDXekvd9Kwzg
 5rVJXeZqL85C1KwCHaA/PsZX7FJ4STF7COh7/RoS5vYmaqOwfP4m9uEue10r/ifIHb7m
 MMkjIRlyu8WFd8KXDZ2jzeQZp8Z2VihRYQ5HCl8vQ3KrUX7ZsN3oSpRC3ZlIPoZ5QvPe
 aNzVb5knlNe+YM4bbpBPRsr0MqNOxzOYtRogAItcxZgtPUR3WUipiEst94RBxFQxBQAd
 bkRufvG6f9mhEj1T1oFRX936LS8dexVFHQmvrAuahuuoowniDgVUXxOlAEBZcPr7jGVr
 Xh2Q==
X-Gm-Message-State: AO0yUKXIt1iJkP05zYxDpy1rLLGHQwudyWa6HyG7avjvmXXqxqp4J7Pw
 attu6P4X/fmyrFn5nXzVJFYO7aIEPeKeSEV1n24=
X-Google-Smtp-Source: AK7set/VhehmW50joUBsedJBwMXMAaXuUgjcd+K7JCOF12Nd/6bdaStDoRKalRr747aWATXQleEOngroTm9BQtKRKFY=
X-Received: by 2002:a19:f009:0:b0:4db:eeb:3dea with SMTP id
 p9-20020a19f009000000b004db0eeb3deamr431131lfc.11.1676886732454; Mon, 20 Feb
 2023 01:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
 <87zg9chbat.fsf@pond.sub.org>
 <CAJ+F1CJYYRzKPpDVuuX7Q0bB9M8cAO4OcD_BTeMRe7goueiUgg@mail.gmail.com>
 <87zg98zqrz.fsf@pond.sub.org>
In-Reply-To: <87zg98zqrz.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 20 Feb 2023 13:52:00 +0400
Message-ID: <CAJ+F1CKUmnQ36vCdE07R6rF3H=Kgd684uay=sJXbP9ttEraUxg@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Mon, Feb 20, 2023 at 12:26 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi Markus
> >
> > On Fri, Feb 17, 2023 at 1:49 PM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > A process with enough capabilities can duplicate a socket to QEMU.
> >> > Modify 'getfd' to import it and add it to the monitor fd list, so it=
 can
> >> > be later used by other commands.
> >> >
> >> > Note that we actually store the SOCKET in the FD list, appropriate c=
are
> >> > must now be taken to use the correct socket functions (similar appro=
ach
> >> > is taken by our io/ code and in glib, this is internal and shouldn't
> >> > affect the QEMU/QMP users)
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> > ---
> >> >  qapi/misc.json     | 16 ++++++++--
> >> >  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++-------=
---
> >> >  monitor/hmp-cmds.c |  6 +++-
> >> >  3 files changed, 81 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/qapi/misc.json b/qapi/misc.json
> >> > index 27ef5a2b20..cd36d8befb 100644
> >> > --- a/qapi/misc.json
> >> > +++ b/qapi/misc.json
> >> > @@ -249,10 +249,18 @@
> >> >  ##
> >> >  # @getfd:
> >> >  #
> >> > -# Receive a file descriptor via SCM rights and assign it a name
> >> > +# On UNIX, receive a file descriptor via SCM rights and assign it a=
 name.
> >> > +#
> >> > +# On Windows, (where ancillary socket fd-passing isn't an option ye=
t), add a
> >> > +# socket that was duplicated to QEMU process with WSADuplicateSocke=
tW() via
> >> > +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A=
 SOCKET is
> >> > +# considered as a kind of "file descriptor" in QMP context, for his=
torical
> >> > +# reasons and simplicity. QEMU takes care to use socket functions a=
ppropriately.
> >>
> >> The Windows part explains things in terms of the C socket API.  Less
> >> than ideal for the QEMU QMP Reference Manual, isn't it?  I don't know
> >> nearly enough about this stuff to suggest concrete improvements...
> >
> > We don't have to, after all we don't explain how to use sendmsg/cmsg
> > stuff to pass FDs.
> >
> > I will drop the part about "A SOCKET is considered as a kind of "file
> > descriptor" in QMP context", after we get "[PATCH 0/4] win32: do not
> > mix SOCKET and fd space"
> > (https://patchew.org/QEMU/20230212204942.1905959-1-marcandre.lureau@red=
hat.com/)
> > merged.
>
> Would it make sense to rebase this series on top of that one, so we
> can have simpler documentation from the start?

Sure, if only I had more reviews/acks...


>
> >> What does this command do under Windows before this patch?  Fail alway=
s?
> >
> > Without ancillary data support on Windows, you can't make it work.
>
> Yes, but how does it fail?  Hmm, you actually answer that below.
>
> >> Wrap your lines a bit earlier, please.
> >>
> >> >  #
> >> >  # @fdname: file descriptor name
> >> >  #
> >> > +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Sin=
ce 8.0.
> >> > +#
> >>
> >> No way around passing a binary blob?
> >
> > WSAPROTOCOL_INFOW is a fairly big structure, with private/reserved fiel=
ds,
> > it contains another structure (WSAPROTOCOLCHAIN), has fixed-length arra=
ys,
> > GUID, and utf16 string.
> >
> > QAPI'fying that structure back and forth would be tedious and
> > error-prone. Better to treat it as an opaque blob imho.
>
> I worry about potential consequences of baking Windows ABI into QMP.
>
> What if the memory representation of this struct changes?
>
> Such ABI changes are unpleasant, but they are not impossible.

This is unlikely, the API users are typically sharing that structure
between processes since it was introduced, back in 2000. (see also
Daniel reply)

>
> >> >  # Returns: Nothing on success
> >> >  #
> >> >  # Since: 0.14
> >> > @@ -270,7 +278,11 @@
> >> >  # <- { "return": {} }
> >> >  #
> >> >  ##
> >> > -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
> >> > +{ 'command': 'getfd', 'data': {
> >> > +    'fdname': 'str',
> >> > +    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
> >> > +  }
> >> > +}
> >>
> >> What happens when QEMU runs on a Windows host and the client doesn't
> >> pass @wsa-info?
> >
> > It attempts to get the fd from the last recv, but it will fail on
> > Windows, this is not available.
>
> So it fails exactly like it fails on a POSIX host when you execute getfd
> without passing along a file descriptor with SCM_RIGHTS.  Correct?

Correct, I get something like:
Error { class: GenericError, desc: "No file descriptor supplied via
SCM_RIGHTS", id: None }

--=20
Marc-Andr=C3=A9 Lureau


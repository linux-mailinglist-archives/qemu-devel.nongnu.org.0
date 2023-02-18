Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FE69B94D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 11:16:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTKFe-0006X8-97; Sat, 18 Feb 2023 05:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTKFc-0006X0-AG
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 05:15:28 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTKFZ-0006DV-GR
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 05:15:27 -0500
Received: by mail-lf1-x12f.google.com with SMTP id d11so568061lfg.6
 for <qemu-devel@nongnu.org>; Sat, 18 Feb 2023 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKWInRknDFV9Nq4kf5fC7M73CKL9T6tKWQLcnblIc5w=;
 b=YuuzJ3mvV+diBY58eTV7OZ3rc40YeBnaWwkVZIWiCPhVo1yJTIAQUBeYrgbpBn+hGj
 I5u1muxSNFEvF+1JF7O78khbTY+hwsVwaqapzMcbeX+Uxlej7uo62Jf+7bVQZZiDuhTe
 DkkdpLeReqkIgqdGXtg2aIfNBVI0Y0n+wR1EdISXWdEPPoXA186CxudhUbSz+dteQR6S
 NFv3uXfK5nLfIihXW74FneKkoYK3Ew/7NPcQDRWryL/81wdeR+MmGwjktK/NAj3j35QP
 XhIKZNWRf4AfU5y9ufEEsA8S9wC656A/HyGo1jInWEMDkML0RIwD80POqvCa1wxRDG7U
 SSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKWInRknDFV9Nq4kf5fC7M73CKL9T6tKWQLcnblIc5w=;
 b=LbqqaGVJMzp7pAJZbhpRFPfPrFsDnQL/ukuLMKoGCpKMk+V8FXFbVLHBzm7nF8eMcv
 HVfx5aRZ73WugEmIu5GqA/1aO8jhsLelhGFEKQZ4/CjyhLNiiKqBZ53uyrSEWAk3AfyC
 nf3ljW6opa0/DTQxqGpiMc/XsQJGi8Zr8LUyBW3TBEvIKBry1Vu15oS4zP5hPM8Mmkci
 pzhiHi5CRoKvar0KTAqVc9qBVeL+TvwmGzFNKAuOK6Nk0JoD1E37fL7ZJfMtStHsAprq
 IevfTDb5md2A/VX6tRmsyysWzEnaERgIVPSXSnA0h8TbXPp9Hsz+fUJZ2ajr6t77eefu
 s6ug==
X-Gm-Message-State: AO0yUKVL8SEp0VMYMbKNMalEw3TtIR3Z/eC2tAwuOh83QqS8efrg3Tw4
 DKs0LfA2jM3fHqXECAntee4KeWkhCOSqZ8nTlS4=
X-Google-Smtp-Source: AK7set/KATcTp2STocMWZ9yoe/TA4o/S070wTb5iavlKgMGid5KSH/KwIqZfOK8jOjCOtEgB6SHkI0X9AGbnujwbpE8=
X-Received: by 2002:a19:ae0d:0:b0:4d9:8773:7d6c with SMTP id
 f13-20020a19ae0d000000b004d987737d6cmr1228530lfc.5.1676715323038; Sat, 18 Feb
 2023 02:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
 <87zg9chbat.fsf@pond.sub.org>
In-Reply-To: <87zg9chbat.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 18 Feb 2023 14:15:11 +0400
Message-ID: <CAJ+F1CJYYRzKPpDVuuX7Q0bB9M8cAO4OcD_BTeMRe7goueiUgg@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

Hi Markus

On Fri, Feb 17, 2023 at 1:49 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > A process with enough capabilities can duplicate a socket to QEMU.
> > Modify 'getfd' to import it and add it to the monitor fd list, so it ca=
n
> > be later used by other commands.
> >
> > Note that we actually store the SOCKET in the FD list, appropriate care
> > must now be taken to use the correct socket functions (similar approach
> > is taken by our io/ code and in glib, this is internal and shouldn't
> > affect the QEMU/QMP users)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qapi/misc.json     | 16 ++++++++--
> >  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
> >  monitor/hmp-cmds.c |  6 +++-
> >  3 files changed, 81 insertions(+), 20 deletions(-)
> >
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 27ef5a2b20..cd36d8befb 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -249,10 +249,18 @@
> >  ##
> >  # @getfd:
> >  #
> > -# Receive a file descriptor via SCM rights and assign it a name
> > +# On UNIX, receive a file descriptor via SCM rights and assign it a na=
me.
> > +#
> > +# On Windows, (where ancillary socket fd-passing isn't an option yet),=
 add a
> > +# socket that was duplicated to QEMU process with WSADuplicateSocketW(=
) via
> > +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SO=
CKET is
> > +# considered as a kind of "file descriptor" in QMP context, for histor=
ical
> > +# reasons and simplicity. QEMU takes care to use socket functions appr=
opriately.
>
> The Windows part explains things in terms of the C socket API.  Less
> than ideal for the QEMU QMP Reference Manual, isn't it?  I don't know
> nearly enough about this stuff to suggest concrete improvements...

We don't have to, after all we don't explain how to use sendmsg/cmsg
stuff to pass FDs.

I will drop the part about "A SOCKET is considered as a kind of "file
descriptor" in QMP context", after we get "[PATCH 0/4] win32: do not
mix SOCKET and fd space"
(https://patchew.org/QEMU/20230212204942.1905959-1-marcandre.lureau@redhat.=
com/)
merged.


>
> What does this command do under Windows before this patch?  Fail always?

Without ancillary data support on Windows, you can't make it work.

>
> Wrap your lines a bit earlier, please.
>
> >  #
> >  # @fdname: file descriptor name
> >  #
> > +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since =
8.0.
> > +#
>
> No way around passing a binary blob?


WSAPROTOCOL_INFOW is a fairly big structure, with private/reserved fields,
it contains another structure (WSAPROTOCOLCHAIN), has fixed-length arrays,
GUID, and utf16 string.

QAPI'fying that structure back and forth would be tedious and
error-prone. Better to treat it as an opaque blob imho.



>
> >  # Returns: Nothing on success
> >  #
> >  # Since: 0.14
> > @@ -270,7 +278,11 @@
> >  # <- { "return": {} }
> >  #
> >  ##
> > -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
> > +{ 'command': 'getfd', 'data': {
> > +    'fdname': 'str',
> > +    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
> > +  }
> > +}
>
> What happens when QEMU runs on a Windows host and the client doesn't
> pass @wsa-info?

It attempts to get the fd from the last recv, but it will fail on
Windows, this is not available.



--=20
Marc-Andr=C3=A9 Lureau


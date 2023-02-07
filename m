Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A068D743
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:55:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNVQ-000205-Sq; Tue, 07 Feb 2023 07:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPNVO-0001zr-MY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:55:26 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPNVM-0006LD-DU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:55:26 -0500
Received: by mail-lj1-x231.google.com with SMTP id h17so15455202ljq.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 04:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EHL/JzwxOSmqtwAHfsg4hheuvpYaxxAyWoTNKtTJEU=;
 b=Y4Ss+kSWLrXrlrtCpe6BwmrPzd6JYI6i/rwUNc2pEOWwkk9+CY+O05fyQI8qJQG8mV
 anP514vhLZ9iQqHfUDkbQZmK9De/WQDjRFWHTR53SR7ghMbu1RbjBsqekx7BXGiYuATq
 DUIZo+ln8FN4rEFXK8aZYJrnhb5c/LlJy3VN3aq7TYa5TO87qt4QJ4uPvpuIViApIZ2d
 hieu9sTZKAPh0qdogGJJGKPXhlJbOw/iIUW9doqASsSZiagvQIiJygZxLTIiYm7pyS3V
 zkW56rymyphtbRhMAzTmCzMJCb3p7Xfj32i4x35IXpUkbW9PRvVep1FCD4F0Y7WXeuLp
 pP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EHL/JzwxOSmqtwAHfsg4hheuvpYaxxAyWoTNKtTJEU=;
 b=8CLtFc7UOJ6dEwXRwwXBcPJ7DxqlKyHIkcaU8co1gn3B1VnbKoITa7m6ohXdilwx8g
 FiAE1PzJnr11j/u4VzOm+f6rjtNBoyqo2+/cykk0lZ8bC/HO+A3DZo130tpVB6CsVARM
 iVXXtg3npknbUDQKqQ9BkLPSv9zMXE3U37CCwPu03M7dSC85xCb2hZFSv529lajhlQu/
 XR4YirEpqf/CPR0N5Tl3pHmwdgYqvEhjQHSmdN5/UXDuLnXSlJAoVdvflW9sp66S9wJD
 kiFIx23//TaqaxtQMpVS29ij0oW0EzhYkeQs6IuO0+9qgQgAMvj7SPUD9UY1ryADahcT
 jwDg==
X-Gm-Message-State: AO0yUKVHDGXg4/s4kwpQSerPdyFqnH2RrtLglzgujcuzIWKOzFlbLekv
 nqdL+PJjill+j55kd8rtnImskmyfhUvOmHDwxpc=
X-Google-Smtp-Source: AK7set87Jd5CuYcj6mmRk/gz18l+zMNzuk0WKZfI6hIwKOhAlPXbZ/Kf+8Ht3UEQ9azpVej665kp11FvC/rWXnY5MPo=
X-Received: by 2002:a2e:84c7:0:b0:290:4fce:f881 with SMTP id
 q7-20020a2e84c7000000b002904fcef881mr470993ljh.126.1675774521986; Tue, 07 Feb
 2023 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
 <20230129182414.583349-3-marcandre.lureau@redhat.com>
 <c39d58f3-872d-eedb-1f4e-6d26999390ac@redhat.com>
In-Reply-To: <c39d58f3-872d-eedb-1f4e-6d26999390ac@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Feb 2023 16:55:10 +0400
Message-ID: <CAJ+F1CJ+jAYzzBPRKxjKzJLfCgPzy4Sfm6s4NB8G2bc3qdEPpw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] tests: fix test-io-channel-command on win32
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

On Mon, Feb 6, 2023 at 12:09 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/01/2023 19.24, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > socat "PIPE:"" on Windows are named pipes, not fifo path names.
> >
> > Fixes: commit 68406d10859 ("tests/unit: cleanups for test-io-channel-co=
mmand")
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   tests/unit/test-io-channel-command.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-=
channel-command.c
> > index 096224962c..e76ef2daaa 100644
> > --- a/tests/unit/test-io-channel-command.c
> > +++ b/tests/unit/test-io-channel-command.c
> > @@ -31,8 +31,12 @@ static char *socat =3D NULL;
> >
> >   static void test_io_channel_command_fifo(bool async)
> >   {
> > +#ifdef WIN32
> > +    const gchar *fifo =3D TEST_FIFO;
>
> Question from a Windows ignorant: Won't this cause a race condition in ca=
se
> someone is trying to run tests in parallel (i.e. shouldn't there be a ran=
dom
> part in the name)? Or are these named pipes local to the current process?
>

You are right, they are global. Furthermore, socat PIPE: is actually
not using windows named-pipes, at least directly (despite debugging
log saying something like that). It's actually mkfifo() cygwin/newlib
implementation that does some magic (in msys2). It looks like it
creates some kind of "fake" file/links with metadata and actually
creates the named pipe later on demand. So it still maps to some kind
of file, and it looks like create/open races would still be possible,
even if "cygwin" mkfifo was called before socat. The alternative would
be to create pipe() beforehand and handing those fd to socat, perhaps.
I might give it a try.

thanks

>   Thomas
>
> > +#else
> >       g_autofree gchar *tmpdir =3D g_dir_make_tmp("qemu-test-io-channel=
.XXXXXX", NULL);
> >       g_autofree gchar *fifo =3D g_build_filename(tmpdir, TEST_FIFO, NU=
LL);
> > +#endif
> >       g_autofree gchar *srcargs =3D g_strdup_printf("%s - PIPE:%s,wronl=
y", socat, fifo);
> >       g_autofree gchar *dstargs =3D g_strdup_printf("%s PIPE:%s,rdonly =
-", socat, fifo);
> >       g_auto(GStrv) srcargv =3D g_strsplit(srcargs, " ", -1);
> > @@ -57,7 +61,9 @@ static void test_io_channel_command_fifo(bool async)
> >       object_unref(OBJECT(src));
> >       object_unref(OBJECT(dst));
> >
> > +#ifndef WIN32
> >       g_rmdir(tmpdir);
> > +#endif
> >   }
> >
> >
>
>


--=20
Marc-Andr=C3=A9 Lureau


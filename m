Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F186964CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvUI-0003RI-Va; Tue, 14 Feb 2023 08:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pRvUG-0003Qv-Pv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:36:48 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pRvUE-0006zq-T5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:36:48 -0500
Received: by mail-lf1-x131.google.com with SMTP id w11so23454891lfu.11
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jX/SdupbxWI4D4vkKcBgQHswk6Mj9mcQ9fvUjljwa0A=;
 b=Q3whJnaxGQoh2fi0J7aH623z66+HFB+HF0MAtt49L7isJgpYD4l7zgXyMgOODieK/C
 MsLj0OEijzL//86tOrTqOgdNKxa746dYbRdWpQlYBhYKuEiH3x9jX1diSDifPr857riW
 3LEPbGDjbKJsLrf20/WRinPEDA42Ub+OOREtbEmCgjb2nw+Yskb1EebaABtCky6nDcjB
 0n5X0yn3rTRQJzeWbkRsGELzaTNDU+ssRMHdg7x/tmSX8j4RIcEERJLj1d3Hf2yJ+Ib3
 OXSA/B7/OSXU6bEnIQhyNQvNKK6J7F1pB1/q+OlPUl6QZSl1sSGJlHrjTyG7GG06culp
 L5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jX/SdupbxWI4D4vkKcBgQHswk6Mj9mcQ9fvUjljwa0A=;
 b=pMFrRDBfoKSyb5dUwc3TFd7x5o+htUG4pZkP2iU0JqnKSwYTW/5wPnUN1ngDgIa294
 ZyP7D3Fu62LqfRVay//okbc0G/NmC5aEgGSTpEKw9ym9wmNk3ZLu7tHt6CHbyMkeiPNM
 /+ODnrrC/4I3S9x0mAWeyC090fhBbIcmUunQKVmuasuLOF948uIPBTibSnwSvtUxY4Kj
 R5M5FObs+K8vtCm1enYJh1dBQEu4Z3ZnwjESLlOGIsT8kM+bAu3uzg6W3dBtGUdP5lJa
 CoAIEmz19Qx2HBXRRHzVsDQBGB2BoqThuSKtpw8UWzVUMD6ZUJN30vMjoU/Vhf0ZTCmv
 XkwA==
X-Gm-Message-State: AO0yUKX1g1TK2BGODIp+g+5vyn9zctkRTRd27KNOBR4z+J0AYbnVGpSv
 M5LuGDaJNYMEjdjY73aSwkgJE56I3nNGz6j9PeA=
X-Google-Smtp-Source: AK7set97PmZrnOpTs0cUa7P1mzQhwQA5/m0ZyAU8qQFpldno6xAowd2VK/fxKxg+8QUokYu5RPj+GpAEC+O96y2J57I=
X-Received: by 2002:a05:6512:3e1d:b0:4d5:ca32:68a0 with SMTP id
 i29-20020a0565123e1d00b004d5ca3268a0mr318764lfv.5.1676381804309; Tue, 14 Feb
 2023 05:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
 <873578id74.fsf@pond.sub.org>
In-Reply-To: <873578id74.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 14 Feb 2023 17:36:32 +0400
Message-ID: <CAJ+F1CL45o4Ro=0TGZU2yOK2nz9OfMX1jCFRKfDxZfXzRbdoRg@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

On Tue, Feb 14, 2023 at 5:34 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > As per comment, presumably to avoid syscall in critical section.
> >
> > Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  monitor/fds.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/monitor/fds.c b/monitor/fds.c
> > index 26b39a0ce6..03c5e97c35 100644
> > --- a/monitor/fds.c
> > +++ b/monitor/fds.c
> > @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >          return;
> >      }
> >
> > -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> > +    qemu_mutex_lock(&cur_mon->mon_lock);
> >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> >          if (strcmp(monfd->name, fdname) !=3D 0) {
> >              continue;
> > @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >
> >          tmp_fd =3D monfd->fd;
> >          monfd->fd =3D fd;
> > +        qemu_mutex_unlock(&cur_mon->mon_lock);
> >          /* Make sure close() is outside critical section */
> >          close(tmp_fd);
> >          return;
> > @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >      monfd->fd =3D fd;
> >
> >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > +    qemu_mutex_unlock(&cur_mon->mon_lock);
> >  }
> >
> >  void qmp_closefd(const char *fdname, Error **errp)
>
> This confused me.  I think I understand now, but let's double-check.
>
> You're reverting commit 0210c3b39bef08 for qmp_getfd() because it
> extended the criticial section beyond the close(), invalidating the
> comment.  Correct?

Correct

>
> Did it actually break anything?

Not that I know of (David admitted over IRC that this was not intended)

--=20
Marc-Andr=C3=A9 Lureau


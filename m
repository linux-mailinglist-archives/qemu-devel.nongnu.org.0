Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDA6C4783
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevc1-00022e-Ag; Wed, 22 Mar 2023 06:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pevby-0001yq-I5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:22:30 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pevbx-0005mH-0t
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:22:30 -0400
Received: by mail-lf1-x12e.google.com with SMTP id j11so22647085lfg.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679480547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zddjsk0/zp+pqCiE9f06wfA901YcxLsfFCuq6lHMteM=;
 b=h4w8DSMFa1oPemangZ4cDxZzLbdIg7TF+LfKb3PwxFj4llwkugmjETE8zlakBu8+dl
 4xJ3nyu5Fa2YlEgg2HbFSGCuEf0rN3Rec0nYLfarsj6Q37pBMr+HOuwLhs7K0rdUIb1p
 S18308bfMqpmIShUQlMXTPKbY/KmQBa3Pc5cvWnENqRWNA+9HIQcvtwGlqdSbeuBLxJy
 GgrunLdg6mrEwEcwel4Gb6VPbjNuC0jBKH+6rEsd+Fdg/tP8crf+I/j/yY+ON0tqeDSf
 dulkVjRIprWvjhS6JjNellSpGjtOwpqd1Zj7om/MC/HpoMsm9DTeaZGGFKnLrxeWObD2
 p32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679480547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zddjsk0/zp+pqCiE9f06wfA901YcxLsfFCuq6lHMteM=;
 b=f9FuK7mmQ0s7FmTXMlhNnKLtug6dYYXAM0ukwmIK9np4pT9iFieV3cgJcL7OVowJk/
 Xy+uetMIruoOtYbljibVwdzXcqwURy7W0l8lzN561OGbxNmN9v98mMHBE5sO6QZPD1Bf
 hYOoWNvE0CadtFnHtI/fXMkAesCxBJemCIadPl3Uw0LYG4XjRe8HXANpRAjPPCvQ9EyH
 CkDT11sGTAjWC1ssQPFb4QTBEys4moqwdzhkgHeNCS5e0RKFE6zdZmebTBiC0nFTgS7t
 bFS/NH+Z9IRjj12jY2eNo+I/s+ZnKmd8xGQdEwa9Cp3fJsaawnD7RFgrz/PoiaoJ3jjP
 pCYg==
X-Gm-Message-State: AO0yUKWrwKMJNwIXAMryNJouJbcG7xZZweQ8FEn2FO1J3ttfoQinITWm
 xH9eSqVdyADuqxDJWQZXh6A0C7xGg2oU/R1T4I0=
X-Google-Smtp-Source: AK7set8vLST2pTrdYnnCFBMi8AucJE3g4jURXW8QQou9/qLw1ayc+3HR1R06dZNECE356dDesK6BMFMgOr5hBkVkJvE=
X-Received: by 2002:a19:7606:0:b0:4e8:c8f1:a010 with SMTP id
 c6-20020a197606000000b004e8c8f1a010mr1707307lff.11.1679480546846; Wed, 22 Mar
 2023 03:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
 <c2c4b00e-53b8-0205-e627-93860bb67720@linaro.org>
In-Reply-To: <c2c4b00e-53b8-0205-e627-93860bb67720@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Mar 2023 14:22:15 +0400
Message-ID: <CAJ+F1C+Ge1v+F_D5_NzMSu1ZAocRQdzyuUHApFwfz_VzBYRdGg@mail.gmail.com>
Subject: Re: [PATCH] ui/spice: fix compilation on win32
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, 
 Gerd Hoffmann <kraxel@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

On Wed, Mar 22, 2023 at 1:01=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 22/3/23 08:52, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > qemu_close_to_socket() renaming left-over.
> >
> > Fixes:
> > https://gitlab.com/qemu-project/qemu/-/issues/1553
> >
> > Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   ui/spice-core.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/ui/spice-core.c b/ui/spice-core.c
> > index 67cfd3ca9c..52a59386d7 100644
> > --- a/ui/spice-core.c
> > +++ b/ui/spice-core.c
> > @@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
> >       qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
> >   #ifdef WIN32
> >       /* SOCKET is owned by spice */
> > -    qemu_close_to_socket(watch->fd);
> > +    qemu_close_socket_osfhandle(watch->fd);
> >   #endif
> >       g_free(watch);
> >   }
>
> Wondering why this hasn't been caught by CI, apparently we miss
> the spice package:
>
> -- >8 --
> diff --git a/.cirrus.yml b/.cirrus.yml
> @@ -41,6 +41,7 @@ windows_msys2_task:
>         mingw-w64-x86_64-curl
>         mingw-w64-x86_64-gnutls
>         mingw-w64-x86_64-libnfs
> +      mingw-w64-x86_64-spice
>       "
>       CHERE_INVOKING: 1
>     msys2_cache:
> ---

Can you send a patch? I will trigger CI to check it.


--=20
Marc-Andr=C3=A9 Lureau


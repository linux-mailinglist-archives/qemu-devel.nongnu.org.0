Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE2454BBE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:13:23 +0100 (CET)
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOUs-00064P-WE
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOTU-00040I-AV
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:11:56 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOTC-0005Qv-R6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:11:55 -0500
Received: by mail-ot1-f47.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso5837685otj.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nIfxXp+JQ14qv1QWPAzi4+SggF1pk+wHghwsmrz9WqY=;
 b=a2GVX5BK+C14ubksHAm4ovakCxqMdI9xqsrscG1LVLEPjPraJmtiiZgf4GwGx3kCb4
 C4hRQwWhxFll3/Wwx0Bmh6zGrRdQkIFiiO4KVBsbcP6KxXWTqaeQynZqGf54VMGETzhL
 ljHQYHxGp9p0Z344dWuJW8/WcyfM9ebrk3enAI3w6E0COR26IXwi4Ar5BQ+tl3xYbfEI
 EIMsCdb3/4bcxdREXiBjmLMcFfhH3J5ORyhmY9ZEn8M4o+M9ZBFQ1vVyLpBoOC7CHHRZ
 Zq8WuNwLat1Xg69dV6cOiD/HtXJet8mLQVpiuhqY46PB9mq3/rsapjiTs4vHEFJFggbg
 ITxA==
X-Gm-Message-State: AOAM532H+IlwHMpa8V+nmuoUezDLTi7Rs8rfM68FwNuyI/7q+Hj/uODm
 VIVRfWorEplXkx6SbarjSgLceAuWvhLDu2MG1M0=
X-Google-Smtp-Source: ABdhPJwfmpqy00+0K7/LdhhnMVUe4Baq/2BUxNjmY7nX0sbTTrZXcSQT9ZfO1Zd9tWu9uV8Pud7lWWRRUF0m9X3Spng=
X-Received: by 2002:a9d:6752:: with SMTP id w18mr14283586otm.13.1637169084726; 
 Wed, 17 Nov 2021 09:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-17-richard.henderson@linaro.org>
 <375dc57d-419a-8098-bb65-049ca6b0a781@amsat.org>
 <c2ac30ca-06c0-ba30-19aa-10e8fcdde1cb@linaro.org>
In-Reply-To: <c2ac30ca-06c0-ba30-19aa-10e8fcdde1cb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 17 Nov 2021 18:11:11 +0100
Message-ID: <CAAdtpL5VmRCAhsD5_9GgF-jZtVd5nJPAKWo=-Yf8XWHnodNyaw@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] meson: Move linux_user_ss to linux-user/
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 6:04 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 11/17/21 5:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > +Thomas/Paolo
> >
> > On 11/17/21 17:04, Richard Henderson wrote:
> >> We have no need to reference linux_user_ss outside of linux-user.
> >> Go ahead and merge it directly into specific_ss.
> >
> > The patch is correct, so:
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > But ...
> >
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   meson.build            | 3 ---
> >>   linux-user/meson.build | 4 ++++
> >>   2 files changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 9f59c57909..ecc181ea13 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -2363,7 +2363,6 @@ common_user_ss =3D ss.source_set()
> >>   crypto_ss =3D ss.source_set()
> >>   hwcore_ss =3D ss.source_set()
> >>   io_ss =3D ss.source_set()
> >> -linux_user_ss =3D ss.source_set()
> >>   qmp_ss =3D ss.source_set()
> >>   qom_ss =3D ss.source_set()
> >>   softmmu_ss =3D ss.source_set()
> >> @@ -2614,8 +2613,6 @@
> >
> > ... shouldn't it be cheaper for the build system to
> > avoid parsing linux-user machinery when we linux-user
> > is disabled, ...
> >
> > + if have_linux_user
> >
> > subdir('linux-user')
> >
> > + endif
>
> We had this discussion before, and settled on
>
> if not have_linux_user
>     subdir_done()
> endif
>
> within linux-user/meson.build.

Indeed sorry. Too much context switching.

> >> +specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss=
)
> >
> > ... and add here unconditionally?
>
> Can't do it unconditionally.  We still need to distinguish specific_ss fi=
les that are
> CONFIG_USER_ONLY, when building both user-only and sysemu binaries.

Indeed.

> I thought about changing this to CONFIG_USER_ONLY, but thought that would=
 just be a step
> too far for this patch.
>
>
> r~


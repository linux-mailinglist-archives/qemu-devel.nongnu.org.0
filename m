Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B804D9D69
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:24:01 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU85g-00065p-I8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:24:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU82B-0001AG-OM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:20:23 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=46665
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU829-0006UO-Tp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:20:23 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id v130so37550356ybe.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YVr8I6Yaf2Ll04R67Hiej1534JqHavBw2eqlkNxSfEY=;
 b=daty5pFPeKVLwW66A8PTCvY4KwsCtztYM8vcFPHitTiJsJ9KFPZr+6OA0GCM5QiW+q
 Mrbm4D/u9WZvVaQBH9ImqjGPmnb8kWIqkdOo0wuTrY8sbjCDW95Tvhl3mPHg/xnhcyln
 kCknIsip8UZfH9RDt3ikCyx05ZLDGEcRVPdY19tyZ+2Ce+RLwHcQt90I47cckZE/d5rW
 0/yLVI7H9F4tDTpQp3XA/PG/OLGc+0Eb7xcLSYLyRujHcVmr0oCKqQ4AVmIquJnTLcNj
 bIFWOi3HOZSCy+Xu15OMrMtuW8uooQVKxnfHhiHTu/VUn9meXKpAvtaRIRReWuOBAG/o
 53hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YVr8I6Yaf2Ll04R67Hiej1534JqHavBw2eqlkNxSfEY=;
 b=2uY1akAJ91zT5y2WuZ6LRAUnX13ciYLUje+ElwvQfrZ1ZDjx0f5uBqplhm8HX3aQKK
 a9XL0Y90REX33i5PqS9o0NLvTHj4ESQHLyiiXlxbnZulLICjm5yZi3mXSvR0dGPOqhD/
 uakouf3DN2ZKr6OOuuusiAjAyUovTtaGdiCd5Jg0nI9Kx+Gc4mLA5Bg1Ak0fZg5Ro1dx
 RfZUZZHX5hu1pGljz6jprKzjF5il8OZ32xitLG8D3o08L6Wnj2OFwRkRgrSc12VKs0j6
 yasDJOTZQK0ubuV5P2OY63HBdrSxquR8mKFTMnoTvBhQM6/T22uPTdUGXBWUYjvakKOw
 r2AQ==
X-Gm-Message-State: AOAM531Tmhp2aPMsGes4qU4iQRpLNd8LX5yG69R61yCFb2USkCISn+36
 FuNhoOhcDE34F7ZFPYnc7Xz7M3c9unEcAhusGQxcOg==
X-Google-Smtp-Source: ABdhPJzvjXM2jvcOh5i44u6iVG5gYBklqIZZXOvZ+Y1YRlumZgR4PSK0EsoPh2/d73SVdDCoQ1L5AfoX2ozMRyqRDmA=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr22961499ybp.39.1647354020849; Tue, 15
 Mar 2022 07:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
 <87a6dr48n2.fsf@linaro.org> <YjCfjmxMnGZYGGv6@redhat.com>
In-Reply-To: <YjCfjmxMnGZYGGv6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 14:20:09 +0000
Message-ID: <CAFEAcA9RbUKCKXFwrXDLbsRFF7dzMG8v47XuNcNzzGqtdc2j3g@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 14:16, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Benn=C3=A9e wrote:
> >
> > Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:
> >
> > > On 15/3/22 13:12, Alex Benn=C3=A9e wrote:
> > >> Another cleanup patch tripped over the fact we weren't being careful
> > >> in our casting. Fix the casts, allow for a non-const and switch from
> > >> g_realloc to g_renew.
> > >> The whole semihosting argument handling could do with some tests
> > >> though.
> > >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> ---
> > >>   semihosting/config.c | 6 +++---
> > >>   1 file changed, 3 insertions(+), 3 deletions(-)
> > >> diff --git a/semihosting/config.c b/semihosting/config.c
> > >> index 137171b717..50d82108e6 100644
> > >> --- a/semihosting/config.c
> > >> +++ b/semihosting/config.c
> > >> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
> > >>       bool enabled;
> > >>       SemihostingTarget target;
> > >>       Chardev *chardev;
> > >> -    const char **argv;
> > >> +    char **argv;
> > >>       int argc;
> > >>       const char *cmdline; /* concatenated argv */
> > >>   } SemihostingConfig;
> > >> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
> > >>       if (strcmp(name, "arg") =3D=3D 0) {
> > >>           s->argc++;
> > >>           /* one extra element as g_strjoinv() expects NULL-terminat=
ed array */
> > >> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void =
*));
> > >> -        s->argv[s->argc - 1] =3D val;
> > >> +        s->argv =3D g_renew(char *, s->argv, s->argc + 1);
> > >> +        s->argv[s->argc - 1] =3D g_strdup(val);
> > >
> > > Why strdup()?
> >
> > The compiler was having issues with adding a const char * into the arra=
y
> > and it was the quickest way to stop it complaining. I'm not sure what
> > guarantees you can make about a const char * after you leave the scope
> > of the function.
>
> No guarantees at all. This method was implicitly relying on the caller
> never free'ing the const arg it passed in. That is indeed the case here,
> because the arg came from a QemuOpts list. It is bad practice to rely
> on such things though, so adding the strdup is sane IMHO.
>
> I would have split the strdup out from the realloc -> renew change
> though, since it is an independent cleanup.

If we ever move the glib minimum-version up to 2.68, we could use
the g_strv_builder_new()/g_strv_builder_add() APIs in glib which
do exactly this job of "build up a NULL-terminated array of strings,
one string at a time".

-- PMM


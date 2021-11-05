Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5975446411
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:24:03 +0100 (CET)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizCM-000611-QG
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mizBA-0004A9-Al
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:22:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mizB7-0000O7-Vs
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:22:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s13so13757319wrb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmBPGTpOUFD30loYiWrI4HK7Ky8Afl/LodxSkV0Y91A=;
 b=iOJPFQxAm5ZZubaA9A23ZBEHTduTa8FCZehVWnXoXw8LLbYi/aYIkiwyj9AvKFaXks
 kBf6qIreHp2236gWKMwl/kNnN5vm4CWjtuoDvUuqdbXGTymR3u4vPQa/f9uHOh+CgF9I
 a8InwAPvr70SfDTibPnOPOhxSjGNuR/ORrv+b2NecjGAhbTmtwWxwWtvEJolMSUTIE/9
 sRHEQ22dt95jvNQ6WeECek3lODd5ZX5EuJi6t/S1rDQTV4pdgBSltFRYGu9zGkDkh4y3
 Qvu9CQc9rN1E3BJDeTxeMCKzasvauaA6dV9yDt5m+ayyblTOyV/gjTF8KLJ7afvUKnnM
 iE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmBPGTpOUFD30loYiWrI4HK7Ky8Afl/LodxSkV0Y91A=;
 b=ltduQKEn916kFQEoC73N+19mJC4b69faxuOHqLNH838BzAqWLavN2JY8zRH31oHlH+
 TYlvTRvtl7M/gpyzJxD/hP3wVqblhVOxlKvAxdqDgXnH9KL5GKsTAWDxUzWNNQZ4jhHL
 KPgmcV1PryYktUS+cxioQOsTglrdUzqwpwGBUS0NG169FQ0pEhKDqjzE9fklkNZXt+8s
 krFm72GydiUCju/DXrMkDkMc0cdhBDBR6bH69OWwVmBRyefp80Y0TS5DKt3JrUq+d5TN
 75oLcV8sYxn1pym/gJxPjasLjLwPk5gqHRgJGvqd4Rfi/yqse+ENl9rP7SngdscHGKyb
 2peg==
X-Gm-Message-State: AOAM5300216s3H7PKcFCM5TDOt1Xh3Crk1Ol66nXmjkFCkrreOQsKwt7
 tAL16+p80RD1RWRqtR4CtYMK9X/3NC3TkQ9009c=
X-Google-Smtp-Source: ABdhPJwY2FgApzjZYtxv5plQY2zpfCuGAITCT/eMBCLZnp0QfwFBVH0zxtnsS6xP/brsGFRP9GDdYBmPxhurgtzNMh8=
X-Received: by 2002:a5d:6781:: with SMTP id v1mr63665644wru.239.1636118562925; 
 Fri, 05 Nov 2021 06:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211004215238.1523082-1-jsnow@redhat.com>
In-Reply-To: <20211004215238.1523082-1-jsnow@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 5 Nov 2021 17:22:31 +0400
Message-ID: <CAJ+F1CLazZxCbDPL-LO9V3Ee33JHbwhJkFfG9EVumuBp6QegZg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] docs/sphinx: change default `role` to "any"
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c0f13705d00a8954"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Eric Blake <eblake@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c0f13705d00a8954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Oct 5, 2021 at 1:53 AM John Snow <jsnow@redhat.com> wrote:

> V4: Fixed more occurrences that have occurred since V3.
>
> V3: Removed bad rebase confetti
>     fixed the OSS-Fuzz link to ... actually be a link.
>
> (Patch 2 can be squashed into patch 1 on merge, but this keeps the diff
> easy to see and review.)
>

queued with extra fixes in patch 2, thanks


> --js
>
> John Snow (3):
>   docs: remove non-reference uses of single backticks
>   docs: (further) remove non-reference uses of single backticks
>   docs/sphinx: change default role to "any"
>
>  docs/conf.py                           | 5 +++++
>  docs/devel/fuzzing.rst                 | 9 +++++----
>  docs/devel/tcg-plugins.rst             | 2 +-
>  docs/interop/live-block-operations.rst | 2 +-
>  docs/system/guest-loader.rst           | 2 +-
>  docs/system/i386/sgx.rst               | 6 +++---
>  qapi/block-core.json                   | 4 ++--
>  include/qemu/module.h                  | 6 +++---
>  qemu-options.hx                        | 4 ++--
>  9 files changed, 23 insertions(+), 17 deletions(-)
>
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c0f13705d00a8954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 1:53 AM John Snow &lt;=
<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">V4: F=
ixed more occurrences that have occurred since V3.<br>
<br>
V3: Removed bad rebase confetti<br>
=C2=A0 =C2=A0 fixed the OSS-Fuzz link to ... actually be a link.<br>
<br>
(Patch 2 can be squashed into patch 1 on merge, but this keeps the diff<br>
easy to see and review.)<br></blockquote><div><br></div><div>queued with ex=
tra fixes in patch 2, thanks<br></div><div> <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
--js<br>
<br>
John Snow (3):<br>
=C2=A0 docs: remove non-reference uses of single backticks<br>
=C2=A0 docs: (further) remove non-reference uses of single backticks<br>
=C2=A0 docs/sphinx: change default role to &quot;any&quot;<br>
<br>
=C2=A0docs/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0docs/devel/fuzzing.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 9 +++++----<br>
=C2=A0docs/devel/tcg-plugins.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
=C2=A0docs/interop/live-block-operations.rst | 2 +-<br>
=C2=A0docs/system/guest-loader.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0docs/system/i386/sgx.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 +++---<br>
=C2=A0qapi/block-core.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0include/qemu/module.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A09 files changed, 23 insertions(+), 17 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000c0f13705d00a8954--


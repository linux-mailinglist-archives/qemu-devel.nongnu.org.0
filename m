Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E737D42D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:21:06 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvLt-0003fx-BI
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgvGE-0004B9-25
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:15:14 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgvGB-0005jx-PU
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:15:13 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b25so36761699eju.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AE0wba4UX5pwDQdb18aeabh57OkTtOpDAlNLbiSw4f0=;
 b=fq+0gXOE1E6sobCDxeiSj3eCZ2FWKbkWv469GITtlIQWYCuhwjzl0WQuvgwexkXg9N
 1TiL+cVHDNfJHxW0prj2RMABcXWD/DJZdRbS8FkyNYkFYyNsaunG5kDuMzmEhEqzHpL5
 XywuNnEIgaPg/AGkNokEDA/QqtblnGyeGWWirDDYaJBWAGz6XuBtpuTB/phirttTATxC
 x6v0yaQAq7ZwYGgBXMEhzMUJ88szon60SoxpKktQgD14ONeQ6nJQW4seIN2QUHGfU+Yy
 jdCGcpmoS0U9NwNiU4hG0l3jjbZA7Xwm9qTuBroG0HUXUrKjF+mnbu26K3dvnVsRktPh
 1VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AE0wba4UX5pwDQdb18aeabh57OkTtOpDAlNLbiSw4f0=;
 b=nEUlIvNzQ1oIqbVTuXDGE4HNM55JX13iOuODcyq+fMSaQjc9szIbX43fjsUuoRPMIl
 YzIQxiHVlIcoziZesE0xYrYErDr43avarlXHx5OGfk8Z4hA3v9LemfhSWi0vPp8ITFmc
 FbX5CJgGXJ4RcLENuBON1AAjajsE2ZSiuF8RX5Pcu9abXXqWDXT8N8iNVfcDonf5bHXf
 +Yaoi3S6k8V/fXneDTTB+YlkYgdgEihnbLs6hdEronO71VdncRPmd9CGdq3KV6tcE2UN
 R1+LYLtYkXdSUjg1Q7tcdkHaouFK3gb3Ni6Dfji1fzdz0zncB/t+9PMaMmkA9pMK6v1C
 7VyQ==
X-Gm-Message-State: AOAM530T77htihjYUv5nA2jwH7w7TogGMXg7wZ5G4ZUNP+dLQxwcE8JP
 Stw87h1nISmuZ2hWb7NBrr0kV4beElUBk5E5k9Y=
X-Google-Smtp-Source: ABdhPJzVwpaKFym9IKWW6IOZfSYOInQxH+CZ8uHncdWLvUuOunY/tGW0nNpmJWNuJA4PedB6H9MJpMiSxYXgI7nYo3U=
X-Received: by 2002:a17:906:b03:: with SMTP id
 u3mr38843549ejg.381.1620850509816; 
 Wed, 12 May 2021 13:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
 <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
 <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
 <CADPb22S2cGbMhoX1kFNgSY5vK3_UwKXV9E3ttAKT71WpB_5CFg@mail.gmail.com>
 <CAJ+F1C+TzUNq7BOCn7RaKKOztMymY6=+BPxmAYYV8Md=5MQU0A@mail.gmail.com>
 <CADPb22SGrvWe5+Aonkwq1pcrBENMTMJetzR7WZN6zDkjxjGJNw@mail.gmail.com>
In-Reply-To: <CADPb22SGrvWe5+Aonkwq1pcrBENMTMJetzR7WZN6zDkjxjGJNw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 13 May 2021 00:14:58 +0400
Message-ID: <CAJ+F1C+VV9LzCuoiRevDiQ1zTmmsyfEbMGwuiD7gTN8fTYd8+A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000df284205c227aa18"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000df284205c227aa18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 11:51 PM Doug Evans <dje@google.com> wrote:

>
> Btw, can you elaborate on "should rather be a diff of the commits that ar=
e
> new"?
> Up until now I've been told to provide "git shortlog old..new" output.
> The patch itself is just a one-liner to update the subproject sha1.
>

git modules used by qemu are usually tracking the master branch, so a
shortlog works fine and shows the additional comments. But when it's
switching branches, the shortlog doesn't provide the diff between the
branches, that is the commits that were not already in the branch being
tracked. In my last update (
https://patchew.org/QEMU/20210125073427.3970606-1-marcandre.lureau@redhat.c=
om/20210125073427.3970606-2-marcandre.lureau@redhat.com/),
I used a tool called git-cherry-diff, but there might be git log arguments
to do that I ignore.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000df284205c227aa18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 11:51 PM Do=
ug Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><br><div class=3D"gmail_quote"><div><div style=3D"font-size:small">Btw, =
can you elaborate on &quot;should rather be a diff of the commits that are =
new&quot;?</div><div style=3D"font-size:small">Up until now I&#39;ve been t=
old to provide &quot;git shortlog old..new&quot; output.</div></div><div st=
yle=3D"font-size:small">The patch itself is just a one-liner to update the =
subproject sha1.</div></div></div></blockquote><div><br></div><div>git modu=
les used by qemu are usually tracking the master branch, so a shortlog work=
s fine and shows the additional comments. But when it&#39;s switching branc=
hes, the shortlog doesn&#39;t provide the diff between the branches, that i=
s the commits that were not already in the branch being tracked. In my last=
 update (<a href=3D"https://patchew.org/QEMU/20210125073427.3970606-1-marca=
ndre.lureau@redhat.com/20210125073427.3970606-2-marcandre.lureau@redhat.com=
/">https://patchew.org/QEMU/20210125073427.3970606-1-marcandre.lureau@redha=
t.com/20210125073427.3970606-2-marcandre.lureau@redhat.com/</a>), I used a =
tool called git-cherry-diff, but there might be git log arguments to do tha=
t I ignore.<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000df284205c227aa18--


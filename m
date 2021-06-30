Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC43B883D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:17:51 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyemU-0000sw-DR
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyel0-0000BE-KV
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:16:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyeky-00080v-5t
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:16:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id n25so4544106edw.9
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SM7iNver6CwLX/nePwihuit7z/Osyw086AyjJSXHpE=;
 b=EcBOSnez5p1xPdZMm8R1t54j4BYMmPHninQyu/wXr5hZ+zfEHlXAnTSz7eyFxywCAS
 LJIsaseXCdFbLnqLEo6OGgeLlD7bPAM0dm5HsG4vxr+0JI8Z/E/ZoqXDQ8f15hJuFjAa
 ayAnkjM1QA9kkqdnJW/7HpSYDoOccCyT9gCWzL5Y2VFjgI+LGmDOk5TYE8TZsmKir7F6
 ICx6RDB72DrSwwxLChHWIcMvYJdHi3AImnbPgEE3UfS39xLZEenhNRoE5WJhruLFMz7u
 JK1GuHcQn6GnYvkr6KD11OcdRvhYV2Lv0cIS/MgiSLWpxX5DmQq4jJfeZKXKnrQ1WeDF
 6NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SM7iNver6CwLX/nePwihuit7z/Osyw086AyjJSXHpE=;
 b=uR28VzoLpZzhSfFXKQ1vuohYg1ujJ1JNLbZsit3JRSUG7pDEaaXLOZCddjhfF0z5nK
 MLvZWEZmOdwTM74OoK1ks4M8zgbxBn8e1icnLHY6zk3SbRTw5dUg0soJ9a+HXtgcQ5W0
 pLPE1RRxZHcD6iA2jyo60tNszPv8n7SiExt4z6M4GRyTz1OzZxiqU0KMeEZZ2Z5zVoVl
 wuI2dciCfZcxICU4En3f+8PirEBZaaWNMJjRLYEl3vTjSSAygkNCpxLQ2q+yjj1UtxZd
 PJVX8RukiAHbC5mBeyoz7Af5LNu7N9xbaVA16ltTGTQV7HxkPUm0ijcOibXuafFHZYwd
 pScA==
X-Gm-Message-State: AOAM530TEH5T3sEEJpv6FMMPSfegkA/8C4lXzv1nB9x07Z+H0gCE2Zux
 AQZ3nyUZMOsHN+7ztlB4QSdXdaT/6dEQpFOLeyg=
X-Google-Smtp-Source: ABdhPJyFvoQ7QCCg1gIXpZLwQySIGy9DLBgTUtZgAfvtQCS4GsvVYc9r6KE3LJMHHmwHVRhyyRPHXqZ7ryxpEld255U=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr24211737edt.257.1625076973721; 
 Wed, 30 Jun 2021 11:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <CAFEAcA_g3o3The6RsSF2Lczd2PaDVzQnjgyzA8ePh7n_AzZvUA@mail.gmail.com>
In-Reply-To: <CAFEAcA_g3o3The6RsSF2Lczd2PaDVzQnjgyzA8ePh7n_AzZvUA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 30 Jun 2021 22:16:02 +0400
Message-ID: <CAJ+F1C+FEg0i0RbC9CAro1h-L2=nUQ12dHX-CesWt-pQhAxnKA@mail.gmail.com>
Subject: Re: [PULL 00/25] Vga 20210510 patches
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c05fcd05c5ffb71e"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c05fcd05c5ffb71e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 7:07 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 May 2021 at 14:22, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > The following changes since commit
> d90f154867ec0ec22fd719164b88716e8fd48672:
> >
> >   Merge remote-tracking branch
> 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05
> 20:29:14 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kraxel.org/qemu tags/vga-20210510-pull-request
> >
> > for you to fetch changes up to b36eb8860f8f4a9c6f131c3fd380116a3017e022=
:
> >
> >   virtio-gpu: add virtio-vga-gl (2021-05-10 13:55:28 +0200)
> >
> > ----------------------------------------------------------------
> > edid: display id support (for 5k+), bugfixes.
> > virtio-gpu: iommu fix, device split.
> >
>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> for any user-visible changes.
>
> -- PMM
>
>
After that series, the console is flooded with GTK warnings. When the
machine/device is reset, virgl crashes (also reported at
https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226)

Unfortunately, it's not easy to pinpoint the responsible patch since it's
not easily bisectable (and it breaks the CLI). I will continue to
investigate.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000c05fcd05c5ffb71e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 7:07 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 10 May 2021 at 14:22, Gerd Hoffmann &lt;<a href=3D"mailto:k=
raxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit d90f154867ec0ec22fd719164b88716e8fd=
48672:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/dg-gitlab/tags/p=
pc-for-6.1-20210504&#39; into staging (2021-05-05 20:29:14 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.kraxel.org/qemu" rel=3D"norefe=
rrer" target=3D"_blank">git.kraxel.org/qemu</a> tags/vga-20210510-pull-requ=
est<br>
&gt;<br>
&gt; for you to fetch changes up to b36eb8860f8f4a9c6f131c3fd380116a3017e02=
2:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0virtio-gpu: add virtio-vga-gl (2021-05-10 13:55:28 +0200)<=
br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; edid: display id support (for 5k+), bugfixes.<br>
&gt; virtio-gpu: iommu fix, device split.<br>
&gt;<br>
<br>
<br>
Applied, thanks.<br>
<br>
Please update the changelog at <a href=3D"https://wiki.qemu.org/ChangeLog/6=
.1" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/6.=
1</a><br>
for any user-visible changes.<br>
<br>
-- PMM<br>
<br>
</blockquote></div><div><br></div><div>After that series, the console is fl=
ooded with GTK warnings. When the machine/device is reset, virgl crashes (a=
lso reported at <a href=3D"https://gitlab.freedesktop.org/virgl/virglrender=
er/-/issues/226">https://gitlab.freedesktop.org/virgl/virglrenderer/-/issue=
s/226</a>)</div><div><br></div><div>Unfortunately, it&#39;s not easy to pin=
point the responsible patch since it&#39;s not easily bisectable (and it br=
eaks the CLI). I will continue to investigate.<br></div><div><br></div><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br=
></div></div>

--000000000000c05fcd05c5ffb71e--


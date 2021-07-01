Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221023B8DBF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 08:30:48 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqDn-0002bx-5F
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 02:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyqCf-0001vP-CZ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:29:37 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyqCc-0001aH-S7
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:29:37 -0400
Received: by mail-ej1-x62e.google.com with SMTP id yy20so8563066ejb.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 23:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8YKIHO/FVQv45lvLjIsNJHrQfhXYidPceUDg13XbKDU=;
 b=nkdgtEPf17v4s8u1nykLLrupODBrl1/ZFHSgkjZwGxH1kw3k3bw9wzlijhVn4BZoOg
 rTX7wTHi/Lwoe/1jw3GUpESYv2BS7hZ9VSod7iuK6ufFf0w6ml8c83MjGWWcXyT0xchN
 D6Z1cw/JRNoWGIkG/GTg5hVl1Lj93UFUoTLm7AprVDL3E7kuEN0dwAJbYJHNyjNSsnRu
 9dHom3crjE8F6gCPVcRfG0WXnrxse5N22XdrKOprPIRBkpcsigrae2D62PX8TOThkPnZ
 hrbDqdcLBzQFeJYCmaN/XHtx9gA8DiyII7RVDEp1i9CEtJasEbZcPB8VYC/ibAT8v9LE
 oKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YKIHO/FVQv45lvLjIsNJHrQfhXYidPceUDg13XbKDU=;
 b=t6N714PyX7wwsM1khKuM/fkTzT3VQraXw7uBXHoC85jfJEBzpJW5svYR+1YA93Hkng
 PbCdDJ868C8DPqX3fxRilYREqUW9EJ3uS6wKsoECLknvfourCGmBawPQyOC9ojrZKz23
 8ItsNmHecSA+4wZ9kqqrNK1M2LSBnuSJuVEyUVN8k9kpGYwD2iIjeWQQkw/dKFbgwgqj
 LA1SfwfZMApxc86msnAK0FN0Y+Laz1Nq54+HTsFRkOEV0+mfzUu4uP8lhinj3qQ8vJWY
 LMtUKKbMUIdzJGrPzeD0XTf/KPRs3DeNk5qDsgBv+M055c2lCCNoMhQG+jlB93NWeyoO
 F+uQ==
X-Gm-Message-State: AOAM5318SgScFFiDvxTP0M/k+oO///zd0MAIz6M/MwdT1AvQoajgjlxa
 su9kfgfiEVev/3EICzhYEKONMXfFsS5mIMc1n/o=
X-Google-Smtp-Source: ABdhPJzAEpPfI6CDIjofZ5xBIM8FdC9FZqZblrAm4KEnVKDi3o3RjZj11fHWsF4RQHv8oN/QAkCDZ6ByEQHD4IMO8Lg=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr9890022ejc.109.1625120973344; 
 Wed, 30 Jun 2021 23:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <CAFEAcA_g3o3The6RsSF2Lczd2PaDVzQnjgyzA8ePh7n_AzZvUA@mail.gmail.com>
 <CAJ+F1C+FEg0i0RbC9CAro1h-L2=nUQ12dHX-CesWt-pQhAxnKA@mail.gmail.com>
In-Reply-To: <CAJ+F1C+FEg0i0RbC9CAro1h-L2=nUQ12dHX-CesWt-pQhAxnKA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Jul 2021 10:29:21 +0400
Message-ID: <CAJ+F1CJtMQqZEyjjOFjw_hJij5G26fnS4336eEaLcORP_14mQA@mail.gmail.com>
Subject: Re: [PULL 00/25] Vga 20210510 patches
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000055534a05c609f694"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055534a05c609f694
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 30, 2021 at 10:16 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Wed, May 12, 2021 at 7:07 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Mon, 10 May 2021 at 14:22, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >
>> > The following changes since commit
>> d90f154867ec0ec22fd719164b88716e8fd48672:
>> >
>> >   Merge remote-tracking branch
>> 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05
>> 20:29:14 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://git.kraxel.org/qemu tags/vga-20210510-pull-request
>> >
>> > for you to fetch changes up to b36eb8860f8f4a9c6f131c3fd380116a3017e02=
2:
>> >
>> >   virtio-gpu: add virtio-vga-gl (2021-05-10 13:55:28 +0200)
>> >
>> > ----------------------------------------------------------------
>> > edid: display id support (for 5k+), bugfixes.
>> > virtio-gpu: iommu fix, device split.
>> >
>>
>>
>> Applied, thanks.
>>
>> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
>> for any user-visible changes.
>>
>> -- PMM
>>
>>
> After that series, the console is flooded with GTK warnings. When the
> machine/device is reset, virgl crashes (also reported at
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226)
>
> Unfortunately, it's not easy to pinpoint the responsible patch since it's
> not easily bisectable (and it breaks the CLI). I will continue to
> investigate.
>


It turns out that I was using -device to add the VGA device, and qemu
didn't treat virtio-vga-gl the same way virtio-vga was. See "[PATCH] vl:
add virtio-vga-gl to the default_list".

The reason for the warnings and virgl crash is that the secondary gfx
console GTK widgets aren't realized by the time virgl needs a context. This
is a pre-existing issue (-display gtk,gl=3Don -device virtio-vga,virgl=3Don
-device virtio-gpu,virgl=3Don qemu crashes)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000055534a05c609f694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 30, 2021 at 10:16 PM Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marc=
andre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 1=
2, 2021 at 7:07 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro=
.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 10 May 2021 at 14:2=
2, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt; wrote:<br>
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
er/-/issues/226" target=3D"_blank">https://gitlab.freedesktop.org/virgl/vir=
glrenderer/-/issues/226</a>)</div><div><br></div><div>Unfortunately, it&#39=
;s not easy to pinpoint the responsible patch since it&#39;s not easily bis=
ectable (and it breaks the CLI). I will continue to investigate.<br></div><=
/div></blockquote><div><br></div><div><br></div><div>It turns out that I wa=
s using -device to add the VGA device, and qemu didn&#39;t treat virtio-vga=
-gl the same way virtio-vga was. See &quot;[PATCH] vl: add virtio-vga-gl to=
 the default_list&quot;.</div><div><br></div><div>The reason for the warnin=
gs and virgl crash is that the secondary gfx console GTK widgets aren&#39;t=
 realized by the time virgl needs a context. This is a pre-existing issue (=
-display gtk,gl=3Don -device virtio-vga,virgl=3Don -device virtio-gpu,virgl=
=3Don qemu crashes)<br></div><div>=C2=A0</div></div><br>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000055534a05c609f694--


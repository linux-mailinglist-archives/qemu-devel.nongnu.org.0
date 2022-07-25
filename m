Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FA57F82E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 04:10:21 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFnY3-00046I-9b
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 22:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oFnW0-0001mc-SH
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 22:08:12 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oFnVz-0008Ja-9N
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 22:08:12 -0400
Received: by mail-vs1-xe31.google.com with SMTP id 125so9401762vsd.5
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 19:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=6Bk8X4RaNJRbzB8GU9SiJfR18f4OwuLSNr8PNkKiN8Q=;
 b=SshR843q2Qd7osk8WufmZBCtlATfJzLbRCZXtCoSTFnCjz+wTrmBGo/THw3bJ4d8Yj
 svxhPQ+BUO5eYj61HA5MQRq6o2upEqEowvFzq4rfxoVIorn7qwHk9z/ktlmaNGHEvRf5
 hrPEc2ML8QidyvuUXtipJIrmoYb07Qbt8P3t+KB+8ZO44k+sRoyKVw8svhKs72Vqf3dK
 AUE5iyLV+U1RwaUlUOU2dGxpDgAjdzAkYZQDxF15DcEkv+7M9+7dITMK4DxebMTlVrSA
 zuMUtJeHGhftSqv8DdoIeCJVUkcXypCNlgqoP/a9qk+GuYkRWBjKPhslImeiUqKVXPlM
 juFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=6Bk8X4RaNJRbzB8GU9SiJfR18f4OwuLSNr8PNkKiN8Q=;
 b=MbxHpUJXHiazxFGBXXipC4vicquhVZmDSrD+ktD3Jlyn4o8CJTWATNlsY3OJPZSC/q
 5qx9ZFSKfKprCDb0JylqIP8o2YQ80UXewYTb+9HfRrUMhyIoinka5OdjwDjA46qWFmVe
 ADNtWeRWACptKs5VHr41UTTr1I+cbyP0qgBq6sQVarWfyEZW7kQ5y7Um44fgdkXy2P42
 /fjF5u+WZxSRKf8ALCXOFJq2XMvW9p8zjcrkzFp13RdtY9BKnN3DKHH5p4b2CcVx+owf
 hpj4XKxP+FJK38apTELNrM7SxDiNsxPTKoRwCWs5jtni1MXc9xxvu1rpXnbD7lcHXvNr
 /MeA==
X-Gm-Message-State: AJIora/Ugpeli6NAYTCoOuKwwhzGGiYy136Z2ouOUZVDXoO08AdBm3br
 qR1Y8Rm27Wzz/MkwOAjwY4U8+Ov2iPxVOPSDVhI=
X-Google-Smtp-Source: AGRyM1t89PrlGnUnvZos1nabK2ff5I5feNAjQ5hDt3QUtPLIuleuym4GP/RjScFR1u0n8H3ifzBCTNSoBtQQ4ba/G28=
X-Received: by 2002:a05:6102:3177:b0:358:5ba9:683d with SMTP id
 l23-20020a056102317700b003585ba9683dmr826271vsm.17.1658714889667; Sun, 24 Jul
 2022 19:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220719161230.766063-1-bmeng.cn@gmail.com>
 <CAEUhbmV85bb-q8Q_Oda6EngJsRdpJq9fhSej-By6jHu390SEow@mail.gmail.com>
In-Reply-To: <CAEUhbmV85bb-q8Q_Oda6EngJsRdpJq9fhSej-By6jHu390SEow@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 25 Jul 2022 10:07:58 +0800
Message-ID: <CAE2XoE-saMOsaY0F5MzPOAQcP+jtht-yV7Ggyvjo2kTU7zYNuQ@mail.gmail.com>
Subject: Re: [PATCH] .cirrus.yml: Change winsymlinks to 'native'
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000c84b8a05e497a7a9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c84b8a05e497a7a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 9:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jul 20, 2022 at 12:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present winsymlinks is set to 'nativestrict', and its behavior is:
> >
> >   a) if native symlinks are enabled and <target> exists, creates
> >      <destination> as a native Windows symlink;
> >   b) else if native symlinks are not enabled or if <target> does
> >      not exist, 'ln -s' fails.
> >
> > This causes the following error message was seen during the configure:
> >
> >   "ln: failed to create symbolic link
> >   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
> >
> > Change winsymlinks to 'native' whose behavior is most similar to the
> > behavior of 'ln -s' on *nix, that is:
> >
> >   a) if native symlinks are enabled, and whether <target> exists
> >      or not, creates <destination> as a native Windows symlink;
> >   b) else if native symlinks are not enabled, and whether <target>
> >      exists or not, 'ln -s' creates as a Windows shortcut file.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  .cirrus.yml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Ping?


Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000c84b8a05e497a7a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Jul 25, 2022 at 9:24 AM Bin Meng &lt;<a hr=
ef=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br>&gt;<=
br>&gt; On Wed, Jul 20, 2022 at 12:12 AM Bin Meng &lt;<a href=3D"mailto:bme=
ng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt=
; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com">bin.meng@win=
driver.com</a>&gt;<br>&gt; &gt;<br>&gt; &gt; At present winsymlinks is set =
to &#39;nativestrict&#39;, and its behavior is:<br>&gt; &gt;<br>&gt; &gt; =
=C2=A0 a) if native symlinks are enabled and &lt;target&gt; exists, creates=
<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0&lt;destination&gt; as a native Windows s=
ymlink;<br>&gt; &gt; =C2=A0 b) else if native symlinks are not enabled or i=
f &lt;target&gt; does<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0not exist, &#39;ln -=
s&#39; fails.<br>&gt; &gt;<br>&gt; &gt; This causes the following error mes=
sage was seen during the configure:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 &quot;=
ln: failed to create symbolic link<br>&gt; &gt; =C2=A0 &#39;x86_64-softmmu/=
qemu-system-x86_64.exe&#39;: No such file or directory&quot;<br>&gt; &gt;<b=
r>&gt; &gt; Change winsymlinks to &#39;native&#39; whose behavior is most s=
imilar to the<br>&gt; &gt; behavior of &#39;ln -s&#39; on *nix, that is:<br=
>&gt; &gt;<br>&gt; &gt; =C2=A0 a) if native symlinks are enabled, and wheth=
er &lt;target&gt; exists<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0or not, creates &=
lt;destination&gt; as a native Windows symlink;<br>&gt; &gt; =C2=A0 b) else=
 if native symlinks are not enabled, and whether &lt;target&gt;<br>&gt; &gt=
; =C2=A0 =C2=A0 =C2=A0exists or not, &#39;ln -s&#39; creates as a Windows s=
hortcut file.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Bin Meng &lt;<a href=
=3D"mailto:bin.meng@windriver.com">bin.meng@windriver.com</a>&gt;<br>&gt; &=
gt; ---<br>&gt; &gt;<br>&gt; &gt; =C2=A0.cirrus.yml | 2 +-<br>&gt; &gt; =C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt; &gt;<br>&gt;<br>&g=
t; Ping?<br><br><br>Reviewed-by: Yonggang Luo &lt;<a href=3D"mailto:luoyong=
gang@gmail.com">luoyonggang@gmail.com</a>&gt;<br><br><br>--<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=
=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000c84b8a05e497a7a9--


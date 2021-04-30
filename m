Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACD36FDE3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:37:19 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVCg-0000ip-0O
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lcV8p-0007HW-73
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:33:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lcV8l-0002vy-9v
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:33:18 -0400
Received: by mail-ed1-x529.google.com with SMTP id q6so23843806edr.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46moMcahEwdKY/7RLW7K0BiIlv4+W6IHXL2AV7DYEvE=;
 b=MV58OS0E9xmNwOHROFV5V0PDWjwTExQXzQ3lfHS1FYOBUxldfB44gzyTRT+xwmPLUj
 EK59Eo93Zks3n9+Rgrg0GX0IyREWUgJGyaVfX36uUwMeMsu6JXi+W7mZLBeTLdXoreQw
 pG1zG937qHVaA8W47Ip5a8V0ei6MhUnZMSc3aBrzVIePRjJwe0FGcX+0zMTcidsMOxpJ
 Cqres/ocTSyG17kjlw0TvHQ39EXCbPJ9EZxhrGjZrLVrvFQ5WiRLNq4aFlyRimoSKC55
 1X3cO8GJRr2tu3Q7ud2IwECoJVqHnKTon3SJmvBRZIVQIGEQvuoEAneo4sgTATdEBvYo
 O6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46moMcahEwdKY/7RLW7K0BiIlv4+W6IHXL2AV7DYEvE=;
 b=nIuptObZNyjJkhYsaH4GDabuNp561hWS9id44hGiRIzy217jjcoQ4OwUvRwd4es80v
 N12V903ALfjS8tRXiuvNatY1SF1iIY1ej5g3EMyt+07y9B2K90fvBB3NkXjufU4t2fZs
 6KhmzaXAL3LolprAAhd9HCoondy2ZTQKZDWDILoHFeVY9ao8hhVyhBJqNHyifalmIbIi
 iKmVt3BX3mYSYd1UakKtT6X8vy6Zm+4d01ATpwOJJfsRjMPrqbZu9wHc9Gewn9Lk/5rl
 HQ+0PpHCfDxEtG2RM9kO/o3CnsSUsHhsTnE0Jp33+QlJ8B5Eann1JQE7Pu8wZhD3B9Vx
 32ZA==
X-Gm-Message-State: AOAM533tEoizCEHCtd8dW5Gr8wE60SXvW4GQ9Czs52rJ/828ZXYcxkfl
 OGSFqY7PgEc47X2tFX0GJFDBlZUcsZ9qLp/usnw=
X-Google-Smtp-Source: ABdhPJw4apNhBPDCxU7H8Yhiry45I5pi5lUyPhQIs9ikDoKuQwrITyiVQYhBt8Vj+ld11FBO/zSJO0s876UbAluygIQ=
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr6792465edv.237.1619796790335; 
 Fri, 30 Apr 2021 08:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210430113547.1816178-1-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Apr 2021 19:32:58 +0400
Message-ID: <CAJ+F1C+cj6fAARksZfGcG-7mAjR2fRW91ZXpqr2DC8kiwGTVig@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] virtio-gpu: split into two devices.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004bde8c05c13254ba"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, QEMU <qemu-devel@nongnu.org>,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004bde8c05c13254ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 30, 2021 at 4:23 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Currently we have one virtio-gpu device.  Problem with this approach is
> that if you compile a full-featured qemu you'll get a virtio-gpu device
> which depends on opengl and virgl, so these dependencies must be
> installed and the libraries will be loaded into memory even if you don't
> use virgl.  Also the code is cluttered with #ifdefs and a bit messy.
>
> This patch series splits the virtio-gpu device into two:
>
>  (1) virtio-gpu-device becomes the non-virgl device, same as
>      virtio-gpu-device,virgl=3Doff today.
>  (2) virtio-gpu-gl-device is the new virgl device, same as
>      virtio-gpu-device,virgl=3Don today.
>
> When compiling qemu without virglrenderer support virtio-gpu-device
> behavior doesn't change.
>
> v2:
>  - rebase to latest master.
>  - move pci and vga wrappers to separate modules.
>  - fix ci failures.
>

The patch series looks good.

But isn't that a breaking change? Any existing user of
virtio-gpu/vga,virgl=3Don will no longer get a working setup. Right? Imho, =
in
this case (virgl VM being not very common) the benefit is worth it.
However, I suggest to keep the 'virgl=3D' property, and print a deprecation=
 /
replaced-by warning, falling back to non-virgl/2d mode. Or perhaps we could
have more cleverness to have virgl=3Don aliasing to the new devices.


> Gerd Hoffmann (16):
>   virtio-gpu: rename virgl source file.
>   virtio-gpu: add virtio-gpu-gl-device
>   virtio-gpu: move virgl realize + properties
>   virtio-gpu: move virgl reset
>   virtio-gpu: use class function for ctrl queue handlers
>   virtio-gpu: move virgl handle_ctrl
>   virtio-gpu: move virgl gl_flushed
>   virtio-gpu: move virgl process_cmd
>   virtio-gpu: move update_cursor_data
>   virtio-gpu: drop VIRGL() macro
>   virtio-gpu: move virtio-gpu-gl-device to separate module
>   virtio-gpu: drop use_virgl_renderer
>   virtio-gpu: move fields to struct VirtIOGPUGL
>   virtio-gpu: add virtio-gpu-gl-pci
>   modules: add have_vga
>   virtio-gpu: add virtio-vga-gl
>
>  include/hw/display/vga.h                      |   6 +
>  include/hw/virtio/virtio-gpu.h                |  31 +++-
>  hw/display/vga.c                              |   2 +
>  hw/display/virtio-gpu-base.c                  |   6 +-
>  hw/display/virtio-gpu-gl.c                    | 163 ++++++++++++++++++
>  hw/display/virtio-gpu-pci-gl.c                |  55 ++++++
>  .../{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c}   |   0
>  hw/display/virtio-gpu.c                       | 142 +++------------
>  hw/display/virtio-vga-gl.c                    |  47 +++++
>  util/module.c                                 |   7 +
>  hw/display/meson.build                        |  19 +-
>  11 files changed, 344 insertions(+), 134 deletions(-)
>  create mode 100644 hw/display/virtio-gpu-gl.c
>  create mode 100644 hw/display/virtio-gpu-pci-gl.c
>  rename hw/display/{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c} (100%)
>  create mode 100644 hw/display/virtio-vga-gl.c
>
> --
> 2.30.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004bde8c05c13254ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 4:23 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Curren=
tly we have one virtio-gpu device.=C2=A0 Problem with this approach is<br>
that if you compile a full-featured qemu you&#39;ll get a virtio-gpu device=
<br>
which depends on opengl and virgl, so these dependencies must be<br>
installed and the libraries will be loaded into memory even if you don&#39;=
t<br>
use virgl.=C2=A0 Also the code is cluttered with #ifdefs and a bit messy.<b=
r>
<br>
This patch series splits the virtio-gpu device into two:<br>
<br>
=C2=A0(1) virtio-gpu-device becomes the non-virgl device, same as<br>
=C2=A0 =C2=A0 =C2=A0virtio-gpu-device,virgl=3Doff today.<br>
=C2=A0(2) virtio-gpu-gl-device is the new virgl device, same as<br>
=C2=A0 =C2=A0 =C2=A0virtio-gpu-device,virgl=3Don today.<br>
<br>
When compiling qemu without virglrenderer support virtio-gpu-device<br>
behavior doesn&#39;t change.<br>
<br>
v2:<br>
=C2=A0- rebase to latest master.<br>
=C2=A0- move pci and vga wrappers to separate modules.<br>
=C2=A0- fix ci failures.<br></blockquote><div><br></div><div>The patch seri=
es looks good.</div><div><br></div><div>But isn&#39;t that a breaking chang=
e? Any existing user of virtio-gpu/vga,virgl=3Don will no longer get a work=
ing setup. Right? Imho, in this case (virgl VM being not very common) the b=
enefit is worth it. However, I suggest to keep the &#39;virgl=3D&#39; prope=
rty, and print a deprecation / replaced-by warning, falling back to non-vir=
gl/2d mode. Or perhaps we could have more cleverness to have virgl=3Don ali=
asing to the new devices.<br></div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Gerd Hoffmann (16):<br>
=C2=A0 virtio-gpu: rename virgl source file.<br>
=C2=A0 virtio-gpu: add virtio-gpu-gl-device<br>
=C2=A0 virtio-gpu: move virgl realize + properties<br>
=C2=A0 virtio-gpu: move virgl reset<br>
=C2=A0 virtio-gpu: use class function for ctrl queue handlers<br>
=C2=A0 virtio-gpu: move virgl handle_ctrl<br>
=C2=A0 virtio-gpu: move virgl gl_flushed<br>
=C2=A0 virtio-gpu: move virgl process_cmd<br>
=C2=A0 virtio-gpu: move update_cursor_data<br>
=C2=A0 virtio-gpu: drop VIRGL() macro<br>
=C2=A0 virtio-gpu: move virtio-gpu-gl-device to separate module<br>
=C2=A0 virtio-gpu: drop use_virgl_renderer<br>
=C2=A0 virtio-gpu: move fields to struct VirtIOGPUGL<br>
=C2=A0 virtio-gpu: add virtio-gpu-gl-pci<br>
=C2=A0 modules: add have_vga<br>
=C2=A0 virtio-gpu: add virtio-vga-gl<br>
<br>
=C2=A0include/hw/display/vga.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0include/hw/virtio/virtio-gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 31 +++-<br>
=C2=A0hw/display/vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 163 ++++++++++++++++++<br>
=C2=A0hw/display/virtio-gpu-pci-gl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++++++<br>
=C2=A0.../{virtio-gpu-3d.c =3D&gt; virtio-gpu-virgl.c}=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 142 +++------------<br>
=C2=A0hw/display/virtio-vga-gl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 47 +++++<br>
=C2=A0util/module.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A07 +<br>
=C2=A0hw/display/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +-<br>
=C2=A011 files changed, 344 insertions(+), 134 deletions(-)<br>
=C2=A0create mode 100644 hw/display/virtio-gpu-gl.c<br>
=C2=A0create mode 100644 hw/display/virtio-gpu-pci-gl.c<br>
=C2=A0rename hw/display/{virtio-gpu-3d.c =3D&gt; virtio-gpu-virgl.c} (100%)=
<br>
=C2=A0create mode 100644 hw/display/virtio-vga-gl.c<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004bde8c05c13254ba--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC30509D2A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:10:34 +0200 (CEST)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTlf-0002jh-Hy
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhThB-00087s-H0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:06:15 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTh9-0006pb-47
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:05:52 -0400
Received: by mail-qk1-x72e.google.com with SMTP id d19so3192954qko.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RyR8TfKH5hgYLon+5RHs28jGHF3Ts9A/Mc8eCa8FLO0=;
 b=OHyCG13fkhQMsg4mD6wFuJsw1k6cLnQb9UmjzgFCdB/SEMGzZ4w+Ct0t3STC0ic+nX
 7FphFB+3+fzvFhM9/qt0glu8wKHD4Id1WdRif9EePOxylc5OjHoamFkq9DAepD+33Xsz
 iYDwNy0QBCl00aaH9t+EYitx0P5+LrDCqzDOo8gaIGSdIoBUCBbIkcoWpZqbgpRosg7C
 Ct1Ls1VrAt4H6qkbn0LBiI05g21ZlDUaNc2dP0tfHMh+c3N/JWMmyR63+W9jVXMgF1sT
 b/q9xsOjPLlX5D4DijGNrcXRyY20qfWovYnPZshvCmN601dHukLdiVvXT+dpf53Mqu0t
 XuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RyR8TfKH5hgYLon+5RHs28jGHF3Ts9A/Mc8eCa8FLO0=;
 b=2/bX3IxAeIogHuiv48o3LVqPsslyE6mIyH3Gc3TcZ0IHT/iwbMo+jTKSIezaWQF+IX
 FVkJZ6VOLvwjkLc2N/PAigmNmKTALp9KwwtjCI4h9Ami/UHI0ZUZ5QIojBHenspi5iZA
 PzO4cYq1mqayUuzA9JTiCyclLWU/i0PxDw4Z577vt7rIWKGhJ8wK4FW7NH8ySn8zUz42
 ZdwMm9rWfBwihe7eXTO08tZUQ+u2A+ujbv9OQRciVEJP5SDdqOaPs+C8T0le6KPdRnAk
 n9SlrlWy69y8R+pIwl7j952L91ptkGhrOmrWcaQzNMg+BzYVj8qW8N313D7mXgVol2S2
 UlNA==
X-Gm-Message-State: AOAM532lDcwOm4tklEtiVS1fPHPs7WxcEBUZIYJ3F3a1q4GHwZQ92Foh
 3CUJ0KmhR7buo7+ez9J4GHMgS2msSnQ+Y0oTAzJoMPhWqx1NUg==
X-Google-Smtp-Source: ABdhPJzICDeke9LdSxJERfmSpbs8ljSYShdrFj1j1INuhq3RGitev3kdbtC3t5Iot8t0VPdCk9feH/D0Nsvamb+uQ9Q=
X-Received: by 2002:a37:aa48:0:b0:69e:d351:9683 with SMTP id
 t69-20020a37aa48000000b0069ed3519683mr4645264qke.539.1650535547544; Thu, 21
 Apr 2022 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-28-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-28-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 14:05:35 +0400
Message-ID: <CAJ+F1CKLwJdGGfMW5Q=WsUaUGQuTgHtcrYgnmQc+t+WzFiEUXQ@mail.gmail.com>
Subject: Re: [PATCH 27/34] meson,
 virtio: place all virtio-pci devices under virtio_pci_ss
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000000286405dd2741a7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000286405dd2741a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:14 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Since a sourceset already exists for this, avoid unnecessary repeat
> of CONFIG_VIRTIO_PCI.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




> ---
>  hw/virtio/meson.build | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 67dc77e00f..f371404b04 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -16,9 +16,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true:
> files('vhost-user.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true:
> files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true:
> files('virtio-balloon.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('virtio-crypto.c'))
> -virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'],
> if_true: files('virtio-crypto-pci.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true:
> files('vhost-user-fs.c'))
> -virtio_ss.add(when: ['CONFIG_VHOST_USER_FS', 'CONFIG_VIRTIO_PCI'],
> if_true: files('vhost-user-fs-pci.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'=
))
>  virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c'=
,
> 'vhost-vsock-common.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true:
> files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
> @@ -26,17 +24,20 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true:
> files('virtio-rng.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true:
> files('virtio-iommu.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true:
> files('vhost-user-i2c.c'))
> -virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'],
> if_true: files('vhost-user-i2c-pci.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true:
> files('vhost-user-rng.c'))
> -virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'],
> if_true: files('vhost-user-rng-pci.c'))
>
>  virtio_pci_ss =3D ss.source_set()
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true:
> files('vhost-vsock-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true:
> files('vhost-user-vsock-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true:
> files('vhost-user-blk-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true:
> files('vhost-user-i2c-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true:
> files('vhost-user-input-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true:
> files('vhost-user-rng-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true:
> files('vhost-user-scsi-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true:
> files('vhost-scsi-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true:
> files('vhost-user-fs-pci.c'))
> +
> +virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('virtio-crypto-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true:
> files('virtio-input-host-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true:
> files('virtio-input-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true:
> files('virtio-rng-pci.c'))
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000000286405dd2741a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:14 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sinc=
e a sourceset already exists for this, avoid unnecessary repeat<br>
of CONFIG_VIRTIO_PCI.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><b=
r><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/virtio/meson.build | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build<br>
index 67dc77e00f..f371404b04 100644<br>
--- a/hw/virtio/meson.build<br>
+++ b/hw/virtio/meson.build<br>
@@ -16,9 +16,7 @@ virtio_ss.add(when: &#39;CONFIG_VHOST_USER&#39;, if_true:=
 files(&#39;vhost-user.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_VDPA&#39;, if_true: files(&#39;=
vhost-shadow-virtqueue.c&#39;, &#39;vhost-vdpa.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_BALLOON&#39;, if_true: files(&=
#39;virtio-balloon.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files(&#=
39;virtio-crypto.c&#39;))<br>
-virtio_ss.add(when: [&#39;CONFIG_VIRTIO_CRYPTO&#39;, &#39;CONFIG_VIRTIO_PC=
I&#39;], if_true: files(&#39;virtio-crypto-pci.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_USER_FS&#39;, if_true: files(&#=
39;vhost-user-fs.c&#39;))<br>
-virtio_ss.add(when: [&#39;CONFIG_VHOST_USER_FS&#39;, &#39;CONFIG_VIRTIO_PC=
I&#39;], if_true: files(&#39;vhost-user-fs-pci.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_PMEM&#39;, if_true: files(&#39=
;virtio-pmem.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_VSOCK&#39;, if_true: files(&#39=
;vhost-vsock.c&#39;, &#39;vhost-vsock-common.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_USER_VSOCK&#39;, if_true: files=
(&#39;vhost-user-vsock.c&#39;, &#39;vhost-vsock-common.c&#39;))<br>
@@ -26,17 +24,20 @@ virtio_ss.add(when: &#39;CONFIG_VIRTIO_RNG&#39;, if_tru=
e: files(&#39;virtio-rng.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_IOMMU&#39;, if_true: files(&#3=
9;virtio-iommu.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_MEM&#39;, if_true: files(&#39;=
virtio-mem.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_USER_I2C&#39;, if_true: files(&=
#39;vhost-user-i2c.c&#39;))<br>
-virtio_ss.add(when: [&#39;CONFIG_VIRTIO_PCI&#39;, &#39;CONFIG_VHOST_USER_I=
2C&#39;], if_true: files(&#39;vhost-user-i2c-pci.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_USER_RNG&#39;, if_true: files(&=
#39;vhost-user-rng.c&#39;))<br>
-virtio_ss.add(when: [&#39;CONFIG_VHOST_USER_RNG&#39;, &#39;CONFIG_VIRTIO_P=
CI&#39;], if_true: files(&#39;vhost-user-rng-pci.c&#39;))<br>
<br>
=C2=A0virtio_pci_ss =3D ss.source_set()<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_VSOCK&#39;, if_true: files(=
&#39;vhost-vsock-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_VSOCK&#39;, if_true: f=
iles(&#39;vhost-user-vsock-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_BLK&#39;, if_true: fil=
es(&#39;vhost-user-blk-pci.c&#39;))<br>
+virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_I2C&#39;, if_true: files(&#=
39;vhost-user-i2c-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_INPUT&#39;, if_true: f=
iles(&#39;vhost-user-input-pci.c&#39;))<br>
+virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_RNG&#39;, if_true: files(&#=
39;vhost-user-rng-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_SCSI&#39;, if_true: fi=
les(&#39;vhost-user-scsi-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VHOST_SCSI&#39;, if_true: files(&=
#39;vhost-scsi-pci.c&#39;))<br>
+virtio_pci_ss.add(when: &#39;CONFIG_VHOST_USER_FS&#39;, if_true: files(&#3=
9;vhost-user-fs-pci.c&#39;))<br>
+<br>
+virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files(&#3=
9;virtio-crypto-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_INPUT_HOST&#39;, if_true: =
files(&#39;virtio-input-host-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_INPUT&#39;, if_true: files=
(&#39;virtio-input-pci.c&#39;))<br>
=C2=A0virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_RNG&#39;, if_true: files(&=
#39;virtio-rng-pci.c&#39;))<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000000286405dd2741a7--


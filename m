Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A0509F7B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:18:24 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVlO-0007Un-9k
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVcL-0004N5-7t
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:09:01 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVcI-0003XD-Ea
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:09:00 -0400
Received: by mail-qk1-x732.google.com with SMTP id d198so3340057qkc.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HFEOte18Nue5zSGUtN9L8k8ib/SRSOwC1oU7fNMjjPM=;
 b=hme5IvHNarpml1arBcF5+bF52GcvtHd9T+lRTu/BTdGMNcJrC7RDXGtSyQmGD4LKVL
 HUiLx6XruSESI5hbovbzt37Xg7vMFruT+DoPtU7y3tYn+gDi0roVljl3Tn8IbO4e1vZO
 M1Vt73pARuQf6vRP14iurrvA7zGcSRgbhGxIP+ikqvwECPJIn3B9bx7Bx2f2/hQzg7tO
 i4sFAEJWw8xmLsiwf2sgBsVkznzcGTCz1v045Tfpl75gFeoVQaSABYo+Lnipva5kz95E
 GNAqo8V5za5lDDb5VNxiIUfAgtFyU+a4wPyAZKmeBS2WRov6+o8wQktHNwrBe9TbXLfH
 crMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HFEOte18Nue5zSGUtN9L8k8ib/SRSOwC1oU7fNMjjPM=;
 b=kTgz3BfU84QELvg0gIspkxWCZnT19tAYTEr++QpyJDR3Oyc6BUGV1zMYm5xYYOs7qj
 H9yuUExoFOT8606pcOZvSDGqobSaNGeTlQqd8BLuSpeKdXdApDO8wx18N1oTDobwQR82
 7K5mChO12E1afkJUgxTi34tsXHg5nnBne9+gdWEtGN7c8l92a6sgQP7fhu97Bn2qAWaf
 JLcGRwNs7O9RYDnN1MweH/vID5WaF6PEbvk1w/6+SUi0SmCRtIpWOQ3o0ggq6sU9w2ro
 bwry6Q9Sh60t1gdM1+qIlGSl4ZJ8fY+75AaT5hF2/TRBLCbN7oZmZoQwmZRt2SVM+6Vj
 8/9w==
X-Gm-Message-State: AOAM533tRJvG25bvPrVTsgS0xo8UxDeZmBC7FIhuqt7nty9v5lFKbl9h
 9WfP7iOZczWLODdtHEM7bGB2QxYFqaeKoL5xOR0=
X-Google-Smtp-Source: ABdhPJzbKmSyEwjsWt4jTGr6IVjzUS6IO4Ek02I31hLWoWgyyT9PbJfmCyt6xIkgwgY+rr1l3+FLFIvXIeoK3H40DhQ=
X-Received: by 2002:a37:aa48:0:b0:69e:d351:9683 with SMTP id
 t69-20020a37aa48000000b0069ed3519683mr4910847qke.539.1650542937472; Thu, 21
 Apr 2022 05:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-34-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-34-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 16:08:45 +0400
Message-ID: <CAJ+F1C+Dt8ujTKB7xOuui7qgx2YnU8PqFd7SaqOO73s6TjYSKQ@mail.gmail.com>
Subject: Re: [PATCH 33/34] meson: use have_vhost_* variables to pick sources
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000079829f05dd28f922"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x732.google.com
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

--00000000000079829f05dd28f922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  Kconfig.host            |  3 ---
>  backends/meson.build    |  8 ++++++--
>  hw/net/meson.build      |  8 ++++++--
>  hw/virtio/Kconfig       |  3 ---
>  hw/virtio/meson.build   | 25 ++++++++++++++++---------
>  meson.build             |  1 +
>  net/meson.build         | 12 +++++++-----
>  tests/qtest/meson.build |  4 +++-
>  8 files changed, 39 insertions(+), 25 deletions(-)
>
> diff --git a/Kconfig.host b/Kconfig.host
> index 60b9c07b5e..1165c4eacd 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -22,15 +22,12 @@ config TPM
>
>  config VHOST_USER
>      bool
> -    select VHOST
>
>  config VHOST_VDPA
>      bool
> -    select VHOST
>
>  config VHOST_KERNEL
>      bool
> -    select VHOST
>
>  config VIRTFS
>      bool
> diff --git a/backends/meson.build b/backends/meson.build
> index 535c3ca7dd..b1884a88ec 100644
> --- a/backends/meson.build
> +++ b/backends/meson.build
> @@ -12,9 +12,13 @@ softmmu_ss.add([files(
>  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
>  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('hostmem-file.c'))
>  softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
> -softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true:
> files('vhost-user.c'))
> +if have_vhost_user
> +  softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('vhost-user.c'))
> +endif
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('cryptodev-vhost.c'))
> -softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'],
> if_true: files('cryptodev-vhost-user.c'))
> +if have_vhost_user_crypto
> +  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('cryptodev-vhost-user.c'))
> +endif
>  softmmu_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
>  softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
>
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index 685b75badb..ebac261542 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -46,8 +46,12 @@ specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true=
:
> files('xilinx_ethlite.c'
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c')=
)
>  specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'=
))
>
> -softmmu_ss.add(when: ['CONFIG_VIRTIO_NET', 'CONFIG_VHOST_NET'], if_true:
> files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
> -softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
> +if have_vhost_net
> +  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
> +  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
> +else
> +  softmmu_ss.add(files('vhost_net-stub.c'))
> +endif
>
>  softmmu_ss.add(when: 'CONFIG_ETSEC', if_true: files(
>    'fsl_etsec/etsec.c',
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index f8e235f814..e9ecae1f50 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -1,6 +1,3 @@
> -config VHOST
> -    bool
> -
>  config VIRTIO
>      bool
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index f371404b04..7e8877fd64 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -2,18 +2,22 @@ softmmu_virtio_ss =3D ss.source_set()
>  softmmu_virtio_ss.add(files('virtio-bus.c'))
>  softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true:
> files('virtio-pci.c'))
>  softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true:
> files('virtio-mmio.c'))
> -softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false:
> files('vhost-stub.c'))
> -
> -softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
> -softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
> -
> -softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>
>  virtio_ss =3D ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c',
> 'vhost-backend.c', 'vhost-iova-tree.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true:
> files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
> +
> +if have_vhost
> +  virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c')=
)
> +  if have_vhost_user
> +    virtio_ss.add(files('vhost-user.c'))
> +  endif
> +  if have_vhost_vdpa
> +    virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
> +  endif
> +else
> +  softmmu_virtio_ss.add(files('vhost-stub.c'))
> +endif
> +
>  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true:
> files('virtio-balloon.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('virtio-crypto.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true:
> files('vhost-user-fs.c'))
> @@ -54,3 +58,6 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true:
> files('virtio-mem-pci.c'))
>  virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>
>  specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: virtio_ss)
> +softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
> +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
> diff --git a/meson.build b/meson.build
> index 5b5eb442c4..e8446cf148 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -319,6 +319,7 @@ have_vhost_kernel =3D 'CONFIG_VHOST_KERNEL' in
> config_host
>  have_vhost_net_user =3D 'CONFIG_VHOST_NET_USER' in config_host
>  have_vhost_net_vdpa =3D 'CONFIG_VHOST_NET_VDPA' in config_host
>  have_vhost_net =3D 'CONFIG_VHOST_NET' in config_host
> +have_vhost =3D have_vhost_user or have_vhost_vdpa or have_vhost_kernel
>  have_vhost_user_crypto =3D 'CONFIG_VHOST_CRYPTO' in config_host
>
>  # Target-specific libraries and flags
> diff --git a/net/meson.build b/net/meson.build
> index 847bc2ac85..c965e83b26 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -26,10 +26,10 @@ softmmu_ss.add(when: vde, if_true: files('vde.c'))
>  if have_netmap
>    softmmu_ss.add(files('netmap.c'))
>  endif
> -vhost_user_ss =3D ss.source_set()
> -vhost_user_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
> -softmmu_ss.add_all(when: 'CONFIG_VHOST_NET_USER', if_true: vhost_user_ss=
)
> -softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
> +if have_vhost_net_user
> +  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
> +  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c')=
)
> +endif
>
>  softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('tap-linux.c'))
>  softmmu_ss.add(when: 'CONFIG_BSD', if_true: files('tap-bsd.c'))
> @@ -40,6 +40,8 @@ if not config_host.has_key('CONFIG_LINUX') and not
> config_host.has_key('CONFIG_B
>  endif
>  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
>  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
> -softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true:
> files('vhost-vdpa.c'))
> +if have_vhost_net_vdpa
> +  softmmu_ss.add(files('vhost-vdpa.c'))
> +endif
>
>  subdir('can')
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 69f97b8992..2f2f08b442 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -272,7 +272,9 @@ qos_test_ss.add(
>  if have_virtfs
>    qos_test_ss.add(files('virtio-9p-test.c'))
>  endif
> -qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true:
> files('vhost-user-test.c'))
> +if have_vhost_user
> +  qos_test_ss.add(files('vhost-user-test.c'))
> +endif
>  if have_tools and have_vhost_user_blk_server
>    qos_test_ss.add(files('vhost-user-blk-test.c'))
>  endif
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000079829f05dd28f922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:28 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0Kconfig.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ---<b=
r>
=C2=A0backends/meson.build=C2=A0 =C2=A0 |=C2=A0 8 ++++++--<br>
=C2=A0hw/net/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++++--<br>
=C2=A0hw/virtio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0hw/virtio/meson.build=C2=A0 =C2=A0| 25 ++++++++++++++++---------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 =
+<br>
=C2=A0net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++++-----<br=
>
=C2=A0tests/qtest/meson.build |=C2=A0 4 +++-<br>
=C2=A08 files changed, 39 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/Kconfig.host b/Kconfig.host<br>
index 60b9c07b5e..1165c4eacd 100644<br>
--- a/Kconfig.host<br>
+++ b/Kconfig.host<br>
@@ -22,15 +22,12 @@ config TPM<br>
<br>
=C2=A0config VHOST_USER<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-=C2=A0 =C2=A0 select VHOST<br>
<br>
=C2=A0config VHOST_VDPA<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-=C2=A0 =C2=A0 select VHOST<br>
<br>
=C2=A0config VHOST_KERNEL<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-=C2=A0 =C2=A0 select VHOST<br>
<br>
=C2=A0config VIRTFS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/backends/meson.build b/backends/meson.build<br>
index 535c3ca7dd..b1884a88ec 100644<br>
--- a/backends/meson.build<br>
+++ b/backends/meson.build<br>
@@ -12,9 +12,13 @@ softmmu_ss.add([files(<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;rng-=
random.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;host=
mem-file.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;host=
mem-memfd.c&#39;))<br>
-softmmu_ss.add(when: [&#39;CONFIG_VHOST_USER&#39;, &#39;CONFIG_VIRTIO&#39;=
], if_true: files(&#39;vhost-user.c&#39;))<br>
+if have_vhost_user<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VIRTIO&#39;, if_true: files(&#39;v=
host-user.c&#39;))<br>
+endif<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files(&=
#39;cryptodev-vhost.c&#39;))<br>
-softmmu_ss.add(when: [&#39;CONFIG_VIRTIO_CRYPTO&#39;, &#39;CONFIG_VHOST_CR=
YPTO&#39;], if_true: files(&#39;cryptodev-vhost-user.c&#39;))<br>
+if have_vhost_user_crypto<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files=
(&#39;cryptodev-vhost-user.c&#39;))<br>
+endif<br>
=C2=A0softmmu_ss.add(when: gio, if_true: files(&#39;dbus-vmstate.c&#39;))<b=
r>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SGX&#39;, if_true: files(&#39;hostme=
m-epc.c&#39;))<br>
<br>
diff --git a/hw/net/meson.build b/hw/net/meson.build<br>
index 685b75badb..ebac261542 100644<br>
--- a/hw/net/meson.build<br>
+++ b/hw/net/meson.build<br>
@@ -46,8 +46,12 @@ specific_ss.add(when: &#39;CONFIG_XILINX_ETHLITE&#39;, i=
f_true: files(&#39;xilinx_ethlite.c&#39;<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#39=
;net_rx_pkt.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#3=
9;virtio-net.c&#39;))<br>
<br>
-softmmu_ss.add(when: [&#39;CONFIG_VIRTIO_NET&#39;, &#39;CONFIG_VHOST_NET&#=
39;], if_true: files(&#39;vhost_net.c&#39;), if_false: files(&#39;vhost_net=
-stub.c&#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhost_net-s=
tub.c&#39;))<br>
+if have_vhost_net<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#=
39;vhost_net.c&#39;), if_false: files(&#39;vhost_net-stub.c&#39;))<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhos=
t_net-stub.c&#39;))<br>
+else<br>
+=C2=A0 softmmu_ss.add(files(&#39;vhost_net-stub.c&#39;))<br>
+endif<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ETSEC&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;fsl_etsec/etsec.c&#39;,<br>
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig<br>
index f8e235f814..e9ecae1f50 100644<br>
--- a/hw/virtio/Kconfig<br>
+++ b/hw/virtio/Kconfig<br>
@@ -1,6 +1,3 @@<br>
-config VHOST<br>
-=C2=A0 =C2=A0 bool<br>
-<br>
=C2=A0config VIRTIO<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build<br>
index f371404b04..7e8877fd64 100644<br>
--- a/hw/virtio/meson.build<br>
+++ b/hw/virtio/meson.build<br>
@@ -2,18 +2,22 @@ softmmu_virtio_ss =3D ss.source_set()<br>
=C2=A0softmmu_virtio_ss.add(files(&#39;virtio-bus.c&#39;))<br>
=C2=A0softmmu_virtio_ss.add(when: &#39;CONFIG_VIRTIO_PCI&#39;, if_true: fil=
es(&#39;virtio-pci.c&#39;))<br>
=C2=A0softmmu_virtio_ss.add(when: &#39;CONFIG_VIRTIO_MMIO&#39;, if_true: fi=
les(&#39;virtio-mmio.c&#39;))<br>
-softmmu_virtio_ss.add(when: &#39;CONFIG_VHOST&#39;, if_false: files(&#39;v=
host-stub.c&#39;))<br>
-<br>
-softmmu_ss.add_all(when: &#39;CONFIG_VIRTIO&#39;, if_true: softmmu_virtio_=
ss)<br>
-softmmu_ss.add(when: &#39;CONFIG_VIRTIO&#39;, if_false: files(&#39;vhost-s=
tub.c&#39;))<br>
-<br>
-softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhost-stub.=
c&#39;))<br>
<br>
=C2=A0virtio_ss =3D ss.source_set()<br>
=C2=A0virtio_ss.add(files(&#39;virtio.c&#39;))<br>
-virtio_ss.add(when: &#39;CONFIG_VHOST&#39;, if_true: files(&#39;vhost.c&#3=
9;, &#39;vhost-backend.c&#39;, &#39;vhost-iova-tree.c&#39;))<br>
-virtio_ss.add(when: &#39;CONFIG_VHOST_USER&#39;, if_true: files(&#39;vhost=
-user.c&#39;))<br>
-virtio_ss.add(when: &#39;CONFIG_VHOST_VDPA&#39;, if_true: files(&#39;vhost=
-shadow-virtqueue.c&#39;, &#39;vhost-vdpa.c&#39;))<br>
+<br>
+if have_vhost<br>
+=C2=A0 virtio_ss.add(files(&#39;vhost.c&#39;, &#39;vhost-backend.c&#39;, &=
#39;vhost-iova-tree.c&#39;))<br>
+=C2=A0 if have_vhost_user<br>
+=C2=A0 =C2=A0 virtio_ss.add(files(&#39;vhost-user.c&#39;))<br>
+=C2=A0 endif<br>
+=C2=A0 if have_vhost_vdpa<br>
+=C2=A0 =C2=A0 virtio_ss.add(files(&#39;vhost-vdpa.c&#39;, &#39;vhost-shado=
w-virtqueue.c&#39;))<br>
+=C2=A0 endif<br>
+else<br>
+=C2=A0 softmmu_virtio_ss.add(files(&#39;vhost-stub.c&#39;))<br>
+endif<br>
+<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_BALLOON&#39;, if_true: files(&=
#39;virtio-balloon.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files(&#=
39;virtio-crypto.c&#39;))<br>
=C2=A0virtio_ss.add(when: &#39;CONFIG_VHOST_USER_FS&#39;, if_true: files(&#=
39;vhost-user-fs.c&#39;))<br>
@@ -54,3 +58,6 @@ virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_MEM&#39;, if_t=
rue: files(&#39;virtio-mem-pci.c&#39;))<br>
=C2=A0virtio_ss.add_all(when: &#39;CONFIG_VIRTIO_PCI&#39;, if_true: virtio_=
pci_ss)<br>
<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_VIRTIO&#39;, if_true: virtio_ss=
)<br>
+softmmu_ss.add_all(when: &#39;CONFIG_VIRTIO&#39;, if_true: softmmu_virtio_=
ss)<br>
+softmmu_ss.add(when: &#39;CONFIG_VIRTIO&#39;, if_false: files(&#39;vhost-s=
tub.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhost-stub.=
c&#39;))<br>
diff --git a/meson.build b/meson.build<br>
index 5b5eb442c4..e8446cf148 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -319,6 +319,7 @@ have_vhost_kernel =3D &#39;CONFIG_VHOST_KERNEL&#39; in =
config_host<br>
=C2=A0have_vhost_net_user =3D &#39;CONFIG_VHOST_NET_USER&#39; in config_hos=
t<br>
=C2=A0have_vhost_net_vdpa =3D &#39;CONFIG_VHOST_NET_VDPA&#39; in config_hos=
t<br>
=C2=A0have_vhost_net =3D &#39;CONFIG_VHOST_NET&#39; in config_host<br>
+have_vhost =3D have_vhost_user or have_vhost_vdpa or have_vhost_kernel<br>
=C2=A0have_vhost_user_crypto =3D &#39;CONFIG_VHOST_CRYPTO&#39; in config_ho=
st<br>
<br>
=C2=A0# Target-specific libraries and flags<br>
diff --git a/net/meson.build b/net/meson.build<br>
index 847bc2ac85..c965e83b26 100644<br>
--- a/net/meson.build<br>
+++ b/net/meson.build<br>
@@ -26,10 +26,10 @@ softmmu_ss.add(when: vde, if_true: files(&#39;vde.c&#39=
;))<br>
=C2=A0if have_netmap<br>
=C2=A0 =C2=A0softmmu_ss.add(files(&#39;netmap.c&#39;))<br>
=C2=A0endif<br>
-vhost_user_ss =3D ss.source_set()<br>
-vhost_user_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#39;v=
host-user.c&#39;), if_false: files(&#39;vhost-user-stub.c&#39;))<br>
-softmmu_ss.add_all(when: &#39;CONFIG_VHOST_NET_USER&#39;, if_true: vhost_u=
ser_ss)<br>
-softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhost-user-=
stub.c&#39;))<br>
+if have_vhost_net_user<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#=
39;vhost-user.c&#39;), if_false: files(&#39;vhost-user-stub.c&#39;))<br>
+=C2=A0 softmmu_ss.add(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;vhos=
t-user-stub.c&#39;))<br>
+endif<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;tap-=
linux.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_BSD&#39;, if_true: files(&#39;tap-bs=
d.c&#39;))<br>
@@ -40,6 +40,8 @@ if not config_host.has_key(&#39;CONFIG_LINUX&#39;) and no=
t config_host.has_key(&#39;CONFIG_B<br>
=C2=A0endif<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(tap_posix=
))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#39;tap-=
win32.c&#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_VHOST_NET_VDPA&#39;, if_true: files(&#39;=
vhost-vdpa.c&#39;))<br>
+if have_vhost_net_vdpa<br>
+=C2=A0 softmmu_ss.add(files(&#39;vhost-vdpa.c&#39;))<br>
+endif<br>
<br>
=C2=A0subdir(&#39;can&#39;)<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 69f97b8992..2f2f08b442 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -272,7 +272,9 @@ qos_test_ss.add(<br>
=C2=A0if have_virtfs<br>
=C2=A0 =C2=A0qos_test_ss.add(files(&#39;virtio-9p-test.c&#39;))<br>
=C2=A0endif<br>
-qos_test_ss.add(when: &#39;CONFIG_VHOST_USER&#39;, if_true: files(&#39;vho=
st-user-test.c&#39;))<br>
+if have_vhost_user<br>
+=C2=A0 qos_test_ss.add(files(&#39;vhost-user-test.c&#39;))<br>
+endif<br>
=C2=A0if have_tools and have_vhost_user_blk_server<br>
=C2=A0 =C2=A0qos_test_ss.add(files(&#39;vhost-user-blk-test.c&#39;))<br>
=C2=A0endif<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000079829f05dd28f922--


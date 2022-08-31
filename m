Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E55A7ECA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:31:23 +0200 (CEST)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNoQ-0003Gr-8E
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNj5-0003kY-I6
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:25:51 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNj2-00076o-MK
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:25:51 -0400
Received: by mail-lj1-x229.google.com with SMTP id k18so8217236lji.13
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mBiPQfbXZvNCueVdQD8tujxtLZfK2vqEEtr/KtaJnpE=;
 b=MeCVrjcnoM0D5j59Yxasc9Z3CXaDMVrqtara9mLNJFJLtNJvyr+2EI0zEISfa9gHjO
 6+p1wPcFGr7Zrrxe7yzS9+bGyCT0TAmx6shtt3PtoyacqxJ3RqZccamH17BpIAfdzpbE
 u7sPpxtq5cgjHCKhqjB4dJGY5OMX30P70AQyDVy+X0VA0/IBeigpVSP0GVSOdyS5+RXM
 cmFqYu0bpIEmXTo/BQnf0ZRVzgdpnbgTIEiJMl0x4Inxu4AMfdDPsI9S00+3pzX+ytz0
 MaxmPHYsPlvQ76hhRzA78VAyyTMbxCdBcnk6IYJTqfrekS75gWYTGMaKGivptKeGgQUC
 EMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mBiPQfbXZvNCueVdQD8tujxtLZfK2vqEEtr/KtaJnpE=;
 b=VXKug0gptKRgjz2Q6rzRYexfeFvxf+W0PX/Gp8PeTwOfD532wgXbF9SvN3QcSmjR3l
 aA/XtN+iCH4R+0moSb7k97Jdr+a2JpTOhxXb/ufZY8AtK8EtZ7bDZA4cOsMa3L3gIu+Q
 eVBmP5WHJwIlNThu3XKkZ5x9u7qb6780WLF8bng0R+y+YMr+mL/N6m/0IOCqo62tAha0
 HZ1LmnVXDbDIgsKlyYhddtx8tM5XLmshsKYt3aJVQLWLoFsTf/IguR0EfdH+JVJXhwzy
 KjIksXzjWtgPjdmHQ/l/64nt+rv7qGuTTVO89nIsBlq9WmzINRkwOOhdQApWcZICCdWl
 x/yw==
X-Gm-Message-State: ACgBeo2/oFROD9NcEwer87vnvz/fiXcoBpvfBw7AC2o5rbg2GeSiBeUE
 zo1j3zLb5Ut6Bxp9Jhqw18wHDJ/enaALwSuTZN4=
X-Google-Smtp-Source: AA6agR4mUQXiUMhJzl85S9dUTvbM6MS9eMYbCCeBiiFq40Vicm0sr7vcYUUi7+r65PSwDN5EYG+sehpqtyv+oFQ3+tQ=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr7979263ljh.267.1661952345922; Wed, 31
 Aug 2022 06:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-18-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-18-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:25:34 +0400
Message-ID: <CAJ+F1CKTv5uRc3QbxeHZjsh3-TseJaU39vgbUqTnSHVp9cHAxw@mail.gmail.com>
Subject: Re: [PATCH 17/51] tests/qtest: Build virtio-net-test for posix only
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003663a605e7896fd4"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003663a605e7896fd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> All of the virtio-net-test test cases require socketpair() to do the
> test setup.
>

It is possible to implement a pretty good alternative, like I did for glib =
(
https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/tests/socket.c#L2193)

I intend to add that in another series (based on yours), we can enable more
tests later.


>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/virtio-net-test.c | 6 ------
>  tests/qtest/meson.build       | 3 +--
>  2 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.=
c
> index 6ded252901..d44c3d9666 100644
> --- a/tests/qtest/virtio-net-test.c
> +++ b/tests/qtest/virtio-net-test.c
> @@ -26,8 +26,6 @@
>  #define QVIRTIO_NET_TIMEOUT_US (30 * 1000 * 1000)
>  #define VNET_HDR_SIZE sizeof(struct virtio_net_hdr_mrg_rxbuf)
>
> -#ifndef _WIN32
> -
>  static void rx_test(QVirtioDevice *dev,
>                      QGuestAllocator *alloc, QVirtQueue *vq,
>                      int socket)
> @@ -165,8 +163,6 @@ static void stop_cont_test(void *obj, void *data,
> QGuestAllocator *t_alloc)
>      rx_stop_cont_test(dev, t_alloc, rx, sv[0]);
>  }
>
> -#endif
> -
>  static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtioPCIDevice *dev =3D obj;
> @@ -324,10 +320,8 @@ static void register_virtio_net_test(void)
>      };
>
>      qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
> -#ifndef _WIN32
>      qos_add_test("basic", "virtio-net", send_recv_test, &opts);
>      qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
> -#endif
>      qos_add_test("announce-self", "virtio-net", announce_self, &opts);
>
>      /* These tests do not need a loopback backend.  */
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 9d0f82bf1c..72bb9e21f3 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -259,7 +259,6 @@ qos_test_ss.add(
>    'usb-hcd-ohci-test.c',
>    'virtio-test.c',
>    'virtio-blk-test.c',
> -  'virtio-net-test.c',
>    'virtio-rng-test.c',
>    'virtio-scsi-test.c',
>    'virtio-serial-test.c',
> @@ -267,7 +266,7 @@ qos_test_ss.add(
>    'vmxnet3-test.c',
>  )
>  if config_host.has_key('CONFIG_POSIX')
> -  qos_test_ss.add(files('e1000e-test.c'))
> +  qos_test_ss.add(files('e1000e-test.c', 'virtio-net-test.c'))
>  endif
>  if have_virtfs
>    qos_test_ss.add(files('virtio-9p-test.c'))
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003663a605e7896fd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:24 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
All of the virtio-net-test test cases require socketpair() to do the<br>
test setup.<br></blockquote><div><br></div><div>It is possible to implement=
 a pretty good alternative, like I did for glib (<a href=3D"https://gitlab.=
gnome.org/GNOME/glib/-/blob/main/gio/tests/socket.c#L2193">https://gitlab.g=
nome.org/GNOME/glib/-/blob/main/gio/tests/socket.c#L2193</a>)</div><div><br=
></div><div>I intend to add that in another series (based on yours), we can=
 enable more tests later.<br></div><div>=C2=A0 </div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/virtio-net-test.c | 6 ------<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A02 files changed, 1 insertion(+), 8 deletions(-)<br>
<br>
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c<=
br>
index 6ded252901..d44c3d9666 100644<br>
--- a/tests/qtest/virtio-net-test.c<br>
+++ b/tests/qtest/virtio-net-test.c<br>
@@ -26,8 +26,6 @@<br>
=C2=A0#define QVIRTIO_NET_TIMEOUT_US (30 * 1000 * 1000)<br>
=C2=A0#define VNET_HDR_SIZE sizeof(struct virtio_net_hdr_mrg_rxbuf)<br>
<br>
-#ifndef _WIN32<br>
-<br>
=C2=A0static void rx_test(QVirtioDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0QGuestAllocator *alloc, QVirtQueue *vq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int socket)<br>
@@ -165,8 +163,6 @@ static void stop_cont_test(void *obj, void *data, QGues=
tAllocator *t_alloc)<br>
=C2=A0 =C2=A0 =C2=A0rx_stop_cont_test(dev, t_alloc, rx, sv[0]);<br>
=C2=A0}<br>
<br>
-#endif<br>
-<br>
=C2=A0static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QVirtioPCIDevice *dev =3D obj;<br>
@@ -324,10 +320,8 @@ static void register_virtio_net_test(void)<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 =C2=A0qos_add_test(&quot;hotplug&quot;, &quot;virtio-net-pci&=
quot;, hotplug, &amp;opts);<br>
-#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0qos_add_test(&quot;basic&quot;, &quot;virtio-net&quot;,=
 send_recv_test, &amp;opts);<br>
=C2=A0 =C2=A0 =C2=A0qos_add_test(&quot;rx_stop_cont&quot;, &quot;virtio-net=
&quot;, stop_cont_test, &amp;opts);<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0qos_add_test(&quot;announce-self&quot;, &quot;virtio-ne=
t&quot;, announce_self, &amp;opts);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* These tests do not need a loopback backend.=C2=A0 */=
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 9d0f82bf1c..72bb9e21f3 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -259,7 +259,6 @@ qos_test_ss.add(<br>
=C2=A0 =C2=A0&#39;usb-hcd-ohci-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-blk-test.c&#39;,<br>
-=C2=A0 &#39;virtio-net-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-rng-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-scsi-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-serial-test.c&#39;,<br>
@@ -267,7 +266,7 @@ qos_test_ss.add(<br>
=C2=A0 =C2=A0&#39;vmxnet3-test.c&#39;,<br>
=C2=A0)<br>
=C2=A0if config_host.has_key(&#39;CONFIG_POSIX&#39;)<br>
-=C2=A0 qos_test_ss.add(files(&#39;e1000e-test.c&#39;))<br>
+=C2=A0 qos_test_ss.add(files(&#39;e1000e-test.c&#39;, &#39;virtio-net-test=
.c&#39;))<br>
=C2=A0endif<br>
=C2=A0if have_virtfs<br>
=C2=A0 =C2=A0qos_test_ss.add(files(&#39;virtio-9p-test.c&#39;))<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003663a605e7896fd4--


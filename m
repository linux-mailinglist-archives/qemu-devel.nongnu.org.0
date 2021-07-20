Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BE3CF6FF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:37:26 +0200 (CEST)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mBp-0000kG-7U
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5mAk-0008NC-Tv
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:36:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5mAj-0003Mv-2v
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:36:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id hd33so33343507ejc.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F41xCOLANRNMJ46lF4MtbnXimqm0zbtoq1H6UrAau5c=;
 b=bDrSL4stty19dM5Uvcf8I/Z862h/ubPDQXfc8yeY2y4qzrWxN3nEfSNeeGjShBwjqk
 DVRvVuh4PmihNdq547YEohq7ZoOoQ1DgdVwagRU+gebnjVZMnarrEASOpckzVQa91y0P
 Bvhqytk5gefGH7xKvTmbW9/TBV577g26T5N7WNfBwgIfMJ79C4zqXnmtVju7FjCb5Fx5
 HVyivRmmF/4YwKrkts8ks7chJ1ay39XkpVy8he1dOfIRWrjM6lirSkLC4ycmHqiRRZ7T
 TMl+opXAMqZbX6ni+Rjf8P/4SLQjeRDJpkUIM+fAXIjF5m+DX0ILD0/Qd4uDPZHOa/SK
 MqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F41xCOLANRNMJ46lF4MtbnXimqm0zbtoq1H6UrAau5c=;
 b=goir4P6uInfkfFxG5+fIPX3jg9ItHhOdQCL+neTpvo5VoiYGO6gGFzSYoSj3GA0L5E
 afDJVWktaWjOQVp++7Oj9ZmSKOrXfTEp68TS+Qq3TEBm0wKveaZV991M27VwcximZK/E
 /dWjlRpPMNMmwiWUXoIS6hag0fikSNNYWE/UvhqTzALVdZEDfK3dVtKc5SOaCvr80KE5
 X1Hl61obDJ26QWpqZEJZ+3FL56mMSJtjJaawtDreui3OJAge1a6gaIuQ844sKWZ5aXKS
 DPV8wIl/hnJTGU8pZBDWWDqzH3ASz2OsGmD1FHDk25ZsQh232hQgQ5lMzpAx1hdyXBAO
 1g8A==
X-Gm-Message-State: AOAM532Qr9zxBrBkAkv2KxnHMnVrfZPu9uDFw0qfbGWo2/T4hnYrcM0i
 n3XFWTSl7DhUcZ1/bqp7r0udicSesSOOawLQRhk=
X-Google-Smtp-Source: ABdhPJww2sRutW6tXT+3bUf6MticPbK07+wEap/ZOXSSOtZ0tkbG9vwcAWmySYpQyh0aV08minqEQULH6nG2majfGOg=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr32046114ejw.92.1626773774456; 
 Tue, 20 Jul 2021 02:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-6-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-6-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 20 Jul 2021 13:36:01 +0400
Message-ID: <CAJ+F1C+sMruEZe-3eWYz68s6gQ-n-sxAj7=QJvySFp=uLq7yeQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] tests/acceptance/virtio-gpu.py: use virtio-vga-gl
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f4db4005c78ac893"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4db4005c78ac893
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 9:47 PM Cleber Rosa <crosa@redhat.com> wrote:

> Since 49afbca3b, the use of an optional virgl renderer is not
> available anymore, and since b36eb8860f, the way to choose a GL based
> rendered is to use the "virtio-vga-gl" device.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/acceptance/virtio-gpu.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/virtio-gpu.py
> b/tests/acceptance/virtio-gpu.py
> index fbde278705..0f84affe82 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -56,7 +56,7 @@ def wait_for_console_pattern(self, success_message,
> vm=3DNone):
>
>      def test_virtio_vga_virgl(self):
>          """
> -        :avocado: tags=3Ddevice:virtio-vga
> +        :avocado: tags=3Ddevice:virtio-vga-gl
>          """
>          # FIXME: should check presence of virtio, virgl etc
>          self.require_accelerator('kvm')
> @@ -67,7 +67,7 @@ def test_virtio_vga_virgl(self):
>          self.vm.set_console()
>          self.vm.add_args("-m", "2G")
>          self.vm.add_args("-machine", "pc,accel=3Dkvm")
> -        self.vm.add_args("-device", "virtio-vga,virgl=3Don")
> +        self.vm.add_args("-device", "virtio-vga-gl")
>          self.vm.add_args("-display", "egl-headless")
>          self.vm.add_args(
>              "-kernel",
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f4db4005c78ac893
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 9:47 PM Clebe=
r Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since 49afbc=
a3b, the use of an optional virgl renderer is not<br>
available anymore, and since b36eb8860f, the way to choose a GL based<br>
rendered is to use the &quot;virtio-vga-gl&quot; device.<br>
<br>
Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=
=3D"_blank">crosa@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/acceptance/virtio-gpu.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.p=
y<br>
index fbde278705..0f84affe82 100644<br>
--- a/tests/acceptance/virtio-gpu.py<br>
+++ b/tests/acceptance/virtio-gpu.py<br>
@@ -56,7 +56,7 @@ def wait_for_console_pattern(self, success_message, vm=3D=
None):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_virtio_vga_virgl(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:virtio-vga<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:virtio-vga-gl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: should check presence of virtio,=
 virgl etc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.require_accelerator(&#39;kvm&#39;)<b=
r>
@@ -67,7 +67,7 @@ def test_virtio_vga_virgl(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.set_console()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&quot;-m&quot;, &quot;2G=
&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&quot;-machine&quot;, &q=
uot;pc,accel=3Dkvm&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-device&quot;, &quot;vi=
rtio-vga,virgl=3Don&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&quot;-device&quot;, &quot;vi=
rtio-vga-gl&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&quot;-display&quot;, &q=
uot;egl-headless&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-kernel&quot;,<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f4db4005c78ac893--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E697A31DA43
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:22:47 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMmy-0007fA-QM
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCMl4-00071i-7I
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCMl2-00019k-3Q
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613568042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rup3Geps8NgQ6UjBbR2P9g5gHOzhdhFDEes5oX0LmYk=;
 b=CiqwJ+JHYMg0ogLCVdcet5NdEpimPpqB3LPSzKNWe3Pu5L0uAb69DbB30u0S5u6EKIHjlI
 yTgYnNKeITKcn0LA0elIC1qWkfsOGVepH/Rau/VbOnn5BlWJrfmxGNkK8Sm4TGZedr4cUU
 X4248n6y/qL16n0Dw+lnnfEKC6Q7AYY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-VuignSd2Od2_OXx_CANDBw-1; Wed, 17 Feb 2021 08:20:40 -0500
X-MC-Unique: VuignSd2Od2_OXx_CANDBw-1
Received: by mail-io1-f71.google.com with SMTP id j2so11719657iow.18
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 05:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rup3Geps8NgQ6UjBbR2P9g5gHOzhdhFDEes5oX0LmYk=;
 b=GFhrxaLe9ZsUAO53kmHSN9T4W+cEsAJzY4D57O7Zo26NcxZVvyLb+FswER7/e1VR9E
 mwZbYHVV1blcAa0t5MZLGO2ukf/Y9I8QmRS4osLDxRBett5XZG8IZYOkmaAHDQz1g/Pu
 fgpN/8lh1juhLdvx+9ITDpQomEYq42UArNMWc2F0oj1AYx7TFzad9A818KzWwDsNkpPq
 Bajfx18/GEtNGyZVEDr2Vc/A8RTDUD/m317BoNlAcu0+ok2/L9fBcWrWrYEciUx1OuyN
 UKF1bjzJSvLpNSs+hCUKkKPCppyI3YyfEIdiAP0+JTBqWHAFhsKz1b6oHsbrjqvFb2bW
 vzyw==
X-Gm-Message-State: AOAM53270AKopULAwAw2IuDCmPV2dm2ynPwIOoYcIwWqO88GKeDrFiRd
 WXHjA+5pct/vunKUpNEGQ5pet4/X0o5ebW4ajrmbdQdlmLb1iZVfyFRhpzNHc4OGuR+X5NvYTvJ
 D9xeLMOe5hO11ul+tImcADCMC4M+DrrE=
X-Received: by 2002:a02:9425:: with SMTP id a34mr3704661jai.79.1613568039417; 
 Wed, 17 Feb 2021 05:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC12g6dDaFnrD3zGeky+6OYlL52VH8mjnroMvSswHoBHahCdjz4vY8Fw3hPsyvaCb+dQHx6MwS5PY/2yzh+20=
X-Received: by 2002:a02:9425:: with SMTP id a34mr3704639jai.79.1613568039261; 
 Wed, 17 Feb 2021 05:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20210217121932.19986-1-alex.bennee@linaro.org>
 <20210217121932.19986-7-alex.bennee@linaro.org>
In-Reply-To: <20210217121932.19986-7-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 17 Feb 2021 17:20:28 +0400
Message-ID: <CAMxuvaw09S68CmqoeXo2HcBEJE7=ni7iMXjVaMOAX9gWNQ+AKg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] tests/acceptance: allow a "graceful" failing for
 virtio-gpu test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cd29dd05bb88154e"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "P. Berrange, Daniel" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 "Bonzini, Paolo" <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd29dd05bb88154e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 4:19 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> This is a band-aid with a TODO for cases when QEMU doesn't start due
> to missing VirGL. Longer term we could do with some proper feature
> probing.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/acceptance/virtio-gpu.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/virtio-gpu.py
> b/tests/acceptance/virtio-gpu.py
> index ab1a4c1a71..ab18cddbb7 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):
>              "-append",
>              kernel_command_line,
>          )
> -        self.vm.launch()
> +        try:
> +            self.vm.launch()
> +        except:
> +            # TODO: probably fails because we are missing the VirGL
> features
> +            self.cancel("VirGL not enabled?")
> +
>          self.wait_for_console_pattern("as init process")
>          exec_command_and_wait_for_pattern(
>              self, "/usr/sbin/modprobe virtio_gpu", ""
> --
> 2.20.1
>
>

--000000000000cd29dd05bb88154e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 4:19 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This is a band-aid with a TODO for cases when QEMU doesn&#39;t start d=
ue<br>
to missing VirGL. Longer term we could do with some proper feature<br>
probing.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></blockquote><d=
iv><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/acceptance/virtio-gpu.py | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.p=
y<br>
index ab1a4c1a71..ab18cddbb7 100644<br>
--- a/tests/acceptance/virtio-gpu.py<br>
+++ b/tests/acceptance/virtio-gpu.py<br>
@@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-append&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_command_line,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: probably fails because w=
e are missing the VirGL features<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cancel(&quot;VirGL not enab=
led?&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_for_console_pattern(&quot;as in=
it process&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_command_and_wait_for_pattern(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self, &quot;/usr/sbin/modpr=
obe virtio_gpu&quot;, &quot;&quot;<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000cd29dd05bb88154e--



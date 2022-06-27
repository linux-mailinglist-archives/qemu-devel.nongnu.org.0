Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3555B943
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:49:26 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mJ3-00037V-D2
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o5mAQ-0001NM-Gq
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:40:30 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o5mAO-0008MA-I2
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:40:30 -0400
Received: by mail-lj1-x234.google.com with SMTP id o23so10443034ljg.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmufDitHoEjKclOwd2tGRfZ5RgE30llOobKYIimE6Uc=;
 b=PZ3ftAklMWQRvuvg2nbFKlwJZlmbyh0AbEmOdjTr5i4ke9hEjSBru2wJfyqDUxIm4K
 tPy1UP2A7srRlVXkryWu6eoNzyecNaOWFQkR/SNGkqF+6xgNaj9MDP/TMblA+/yMUnPq
 Gi+5EtSl54g7hKtH86i9wJycZDEuQHU6l5MYF8xnO9K3ORoLje7bGAt/oNiraxbu50H/
 24phDzzU7Pn4XJvYEvr2zaG0CJW1vWLJwaUjKDHAclw6tbeuy1fbbgeJhpUzRFgv6Rsy
 FfiPPMV3r3ZBxpQJg1y8TGklfRf0JER9S/BgLFuPx+eXFNMAHC+ux++m6rW0pcOes4uD
 L1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmufDitHoEjKclOwd2tGRfZ5RgE30llOobKYIimE6Uc=;
 b=LsL5U6PEAvvFbV0ij9kvRUBtcqIU0nNgG0IeVoc9Pa+MCgcdMasYu2+0rLrllZrk8q
 5vEBBeafaqEVOQrwd+DVk+4/OMh5TTLpUs+di02hqTHyIyOsxUi5tOy6cQX9TF6/K2YQ
 GXAb6DgWLQgc8BiL8vYOuQwcPKL6uj5bHUZb4lusd++XmDST+MKS5o4r+Jwa4bx+B7Oc
 GCKm16rh6JE54WxNclAKENZWnqZ8ErCarLN5w/dksHV5nbc0FDTz9307X/lFPNkTz9VR
 foaR9z5/jc6QtlWHhZz7f8g4QeDGNOg9+wr7l1FwaNo2KnGoDQct+8NCsaTxGg4+pDyq
 0N+A==
X-Gm-Message-State: AJIora/ghQGk6DHoepub2hNCdoaUykiE5SFTAsA4vQ56PxmNHkbKX3Cu
 EO4VZDm3Zu0VmUTSUFUScM5nRRB69dJRT11q8xE=
X-Google-Smtp-Source: AGRyM1vw5P4WY1sULVQvL7xhbR8W2xv7tU5TM6XZ6B2txmoQKB02KG0VIGRD0hw/aakS2V7T3HMEZSNg6L/ccvw9piU=
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr6386604lji.525.1656326425667; Mon, 27
 Jun 2022 03:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <7ad664fc-ca40-e446-028f-47ea1fd1c21d@linaro.org>
In-Reply-To: <7ad664fc-ca40-e446-028f-47ea1fd1c21d@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Jun 2022 14:40:14 +0400
Message-ID: <CAJ+F1CKJycsXw=o4=tr+GNFBWkK41WAM_0h428_joW+cF0-V2g@mail.gmail.com>
Subject: Re: virgl avocado hang
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003bef2a05e26b8ca1"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--0000000000003bef2a05e26b8ca1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 27, 2022 at 7:14 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Hi Mark,
>
> > +    def test_virtio_vga_virgl(self):
>
> > +        """
>
> > +        :avocado: tags=3Darch:x86_64
>
> > +        :avocado: tags=3Ddevice:virtio-vga
>
> > +        """
>
> > +        kernel_command_line =3D (
>
> > +            self.KERNEL_COMMON_COMMAND_LINE + "console=3DttyS0
> rdinit=3D/bin/bash"
>
> > +        )
>
> > +        # FIXME: should check presence of virtio, virgl etc
>
>
> This little nugget really must be fixed.
>
> The observed behaviour is an indefinite hang in avocado, waiting for qemu=
,
> which is in
> zombie state.  A manual kill -INT to the parent wakes it up like so:
>
>   (159/184)
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl: CANCEL:
> VirGL
> not enabled? (1264.25 s)
>
>
Could you describe how to reproduce? I naively --disable-virglrenderer and
I get:

$ tests/venv/bin/avocado run tests/avocado/virtio-gpu.py
Fetching asset from
tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
Fetching asset from
tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
Fetching asset from
tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
Fetching asset from
tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
JOB ID     : d9c5b65777777564d1d926fdfb58deaf0e967d15
JOB LOG    :
/home/elmarco/avocado/job-results/job-2022-06-27T12.56-d9c5b65/job.log
 (1/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl:
CANCEL: VirGL not enabled? (0.08 s)
 (2/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl:
CANCEL: Could not find vhost-user-gpu (0.02 s)
RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 2
JOB TIME   : 0.56 s


--=20
Marc-Andr=C3=A9 Lureau

--0000000000003bef2a05e26b8ca1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 27, 2022 at 7:14 AM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Mark,<br>
<br>
&gt; +=C2=A0 =C2=A0 def test_virtio_vga_virgl(self):<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:x86_64<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:virtio-vga<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.KERNEL_COMMON_COMMAND_=
LINE + &quot;console=3DttyS0 rdinit=3D/bin/bash&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: should check presence of virtio,=
 virgl etc<br>
<br>
<br>
This little nugget really must be fixed.<br>
<br>
The observed behaviour is an indefinite hang in avocado, waiting for qemu, =
which is in <br>
zombie state.=C2=A0 A manual kill -INT to the parent wakes it up like so:<b=
r>
<br>
=C2=A0 (159/184) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_v=
irgl: CANCEL: VirGL <br>
not enabled? (1264.25 s)<br clear=3D"all"><br></blockquote><div><br></div><=
div>Could you describe how to reproduce? I naively --disable-virglrenderer =
and I get:</div><div><br></div><div>$ tests/venv/bin/avocado run tests/avoc=
ado/virtio-gpu.py<br>Fetching asset from tests/avocado/virtio-gpu.py:Virtio=
GPUx86.test_virtio_vga_virgl<br>Fetching asset from tests/avocado/virtio-gp=
u.py:VirtioGPUx86.test_virtio_vga_virgl<br>Fetching asset from tests/avocad=
o/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl<br>Fetching asset fr=
om tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl<br>JO=
B ID =C2=A0 =C2=A0 : d9c5b65777777564d1d926fdfb58deaf0e967d15<br>JOB LOG =
=C2=A0 =C2=A0: /home/elmarco/avocado/job-results/job-2022-06-27T12.56-d9c5b=
65/job.log<br>=C2=A0(1/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vir=
tio_vga_virgl: CANCEL: VirGL not enabled? (0.08 s)<br>=C2=A0(2/2) tests/avo=
cado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl: CANCEL: Could no=
t find vhost-user-gpu (0.02 s)<br>RESULTS =C2=A0 =C2=A0: PASS 0 | ERROR 0 |=
 FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 2<br>JOB TIME =C2=A0 : 0.5=
6 s</div><div><br> </div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003bef2a05e26b8ca1--


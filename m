Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743056997BF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfTr-0004wT-JF; Thu, 16 Feb 2023 09:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSfTm-0004vl-Gr; Thu, 16 Feb 2023 09:43:22 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSfTk-0006dY-Sy; Thu, 16 Feb 2023 09:43:22 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id bj54so1276487vkb.12;
 Thu, 16 Feb 2023 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1676558599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oxQUDl1bMhJYFWoTAMFxlMRs0/1YSPCreE255ikECV8=;
 b=Lw61QXQfVwPrSyjS0BBrOHukQ7vzt3CIaFnMVlYr3K5eI31KspNMZ2R//Q4R3aKSPj
 Sisd6a1EtMl0zQZN7Iy7ImD3Ot+BzUXJ3XJVL5nT/Gzxcm5nVQtBTwR1+vjqACYbSrZU
 RQqZhgzN7BiJ8kyi3tpSk4jegOBvYxLw1vSBeysQVmwDek2TU+0gIa55PoaJbjW+1Qgz
 8p65C10Ksqajwmjse7fiCc5gkkVFJ0N+23Rr+rLitUjADuk8eVBrroTVLaq+NeFl+VSR
 UTURc+AyGgvpfuhLtGEUk8fLAyzNQbZgAU2PSv8e8psVV9rTqIttgjEKHSvT6N8Pi6/2
 Qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676558599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxQUDl1bMhJYFWoTAMFxlMRs0/1YSPCreE255ikECV8=;
 b=flWKXYKdCdvXSGGmwpLH/BB6ASNCpQ11uFFMr0Zj5QaD3p0FsXAgBzIwUl4jmxQPDv
 YJm9MLmCcWqvFv34f9KyTAqMzb6Xa/KEMrIouKE6yLWwfcVDR40d8GK/su2V08+XHeuT
 6R3j4UuayHBH/um+5K43IZnXFVguiQV1bzpO0w3PbzwAftHiRn8dH2Q3lq8e9TgPdp0j
 rLmN3mxwbiCGAV+3OxQvgJuE92MtXUOxo5xjigwLpDLt7KdBz0VSaP4NyRFfTVaTs+J3
 eZV8ASwFm4x5RaBfDXWUns+9qU/Jo/jMJ4y4xFDiVX5uzbfCURTH9M2AQZ4sLJn+cdW+
 UtfA==
X-Gm-Message-State: AO0yUKWYZZHdh53Oqv3U+BVIdeSWYyuTGysBlQtQdeNmrySpI2C5njWa
 49g49BJn36dSf/GgQGS+QDAomUdByBYAu7F+zf8IOx5vMwE=
X-Google-Smtp-Source: AK7set+ksnWY4WYOh7qtxrOCTec7gOdd8aFZlvSnfAl46dxSu2kruAA1a9rrzVXCAAKwYoomdBCclrdbMSskVrOhMnc=
X-Received: by 2002:a05:6122:c8c:b0:3d5:911f:daed with SMTP id
 ba12-20020a0561220c8c00b003d5911fdaedmr1004440vkb.39.1676558599278; Thu, 16
 Feb 2023 06:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
In-Reply-To: <20230215161641.32663-8-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 16 Feb 2023 15:43:05 +0100
Message-ID: <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-ppc@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c1572a05f4d237d5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000c1572a05f4d237d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> Ensure both IDE output IRQ lines are wired.
>
> We can remove the last use of isa_get_irq(NULL).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/ide/piix.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 9d876dd4a7..b75a4ddcca 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d,
> unsigned i, Error **errp)
>      static const struct {
>          int iobase;
>          int iobase2;
> -        int isairq;
>      } port_info[] =3D {
> -        {0x1f0, 0x3f6, 14},
> -        {0x170, 0x376, 15},
> +        {0x1f0, 0x3f6},
> +        {0x170, 0x376},
>      };
>      int ret;
>
> -    qemu_irq irq_out =3D d->irq[i] ? : isa_get_irq(NULL,
> port_info[i].isairq);
> +    if (!d->irq[i]) {
> +        error_setg(errp, "output IDE IRQ %u not connected", i);
> +        return false;
> +    }
> +
>      ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>      ret =3D ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>                            port_info[i].iobase2);
> @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigne=
d
> i, Error **errp)
>                           object_get_typename(OBJECT(d)), i);
>          return false;
>      }
> -    ide_bus_init_output_irq(&d->bus[i], irq_out);
> +    ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
>
>      bmdma_init(&d->bus[i], &d->bmdma[i], d);
>      d->bmdma[i].bus =3D &d->bus[i];
> --
> 2.38.1
>
>
> This now breaks user-created  piix3-ide:

  qemu-system-x86_64 -M q35 -device piix3-ide

Results in:

  qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not connected

Best regards,
Bernhard

--000000000000c1572a05f4d237d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 15, 2023 at 5:20 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Ensure both IDE output IRQ lines are wired.<br>
<br>
We can remove the last use of isa_get_irq(NULL).<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/ide/piix.c | 13 ++++++++-----<br>
=C2=A01 file changed, 8 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/ide/piix.c b/hw/ide/piix.c<br>
index 9d876dd4a7..b75a4ddcca 100644<br>
--- a/hw/ide/piix.c<br>
+++ b/hw/ide/piix.c<br>
@@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigne=
d i, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0static const struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int isairq;<br>
=C2=A0 =C2=A0 =C2=A0} port_info[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6, 14},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376, 15},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376},<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 qemu_irq irq_out =3D d-&gt;irq[i] ? : isa_get_irq(NULL, port=
_info[i].isairq);<br>
+=C2=A0 =C2=A0 if (!d-&gt;irq[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;output IDE IRQ %u not c=
onnected&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ide_bus_init(&amp;d-&gt;bus[i], sizeof(d-&gt;bus[i]), D=
EVICE(d), i, 2);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ide_init_ioport(&amp;d-&gt;bus[i], NULL, port_i=
nfo[i].iobase,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0port_info[i].iobase2);<br>
@@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned =
i, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 object_get_typename(OBJECT(d)), i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 ide_bus_init_output_irq(&amp;d-&gt;bus[i], irq_out);<br>
+=C2=A0 =C2=A0 ide_bus_init_output_irq(&amp;d-&gt;bus[i], d-&gt;irq[i]);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0bmdma_init(&amp;d-&gt;bus[i], &amp;d-&gt;bmdma[i], d);<=
br>
=C2=A0 =C2=A0 =C2=A0d-&gt;bmdma[i].bus =3D &amp;d-&gt;bus[i];<br>
-- <br>
2.38.1<br>
<br>
<br></blockquote>This now breaks user-created =C2=A0piix3-ide:<br><br>=C2=
=A0 qemu-system-x86_64 -M q35 -device piix3-ide<br><br>Results in:<br><br>=
=C2=A0 qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not connecte=
d</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Best=
 regards,</div><div class=3D"gmail_quote">Bernhard<br></div></div>

--000000000000c1572a05f4d237d5--


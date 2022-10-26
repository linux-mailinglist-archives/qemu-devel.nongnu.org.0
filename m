Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B288560EAE2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 23:34:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ono1K-0005SC-Le; Wed, 26 Oct 2022 17:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ono1G-00056a-PR
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 17:33:02 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ono1E-0003K2-Ec
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 17:33:02 -0400
Received: by mail-ua1-x931.google.com with SMTP id t26so8001703uaj.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LhSE0L9HmSGPM8KDDRx22fnkljsgSRPMQ0bIevO6fXU=;
 b=Gzw/eW6SGQ+PzFCv9BAVR7p5+davWux86MB/DOkBtDw/kjtKjy9ZPbBPz00U9bmVJc
 R6nKiFyWhZCLDlaVWPzKlkJurVeYK0wa4ckf8M230Fc/EmMD+JuasGA2cGBukLuuKTOY
 ZEQQbKckb3qP5RBhRuNuX0aXDrybmXOyUeTj+G2l7U4pON87OTs6fMyhuNB4qZPn8Irx
 pUAnfAYoo3ezyGhbrn9+oH5rGxGLKbfxBq1MmgQhhHjyVp8NtysVOOxECYnkDQtEC8s1
 FETUSlugyspyCfJS+EjzJp6GtAAi8OCo4PGrsrXevNXJDBfW9anE0DCGtlY4/D0UKffg
 UcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LhSE0L9HmSGPM8KDDRx22fnkljsgSRPMQ0bIevO6fXU=;
 b=phL8c9oamzLiJ8TPSm9oy1zQIggi+PsXH0e7wJmdcgzyu76kjW3VZ1rE0QZZCrVk/C
 9Pcd3599N1gyDMFg/J4BWSoyDZzFw+4SH52KMRv5KR/GV+BAhDRLYMX4pk97IAua+8If
 21ds6EuLkx9/HeNpkDIH3c0e2ZQ0xyCq/D9dXWSnG5KPm+gJOjvqYC7kPGjYRc1XCpXm
 GjosH9aUhJjbRGEX5TNwTpyBHIbzChJGdoh/nRT5Y4dFvb7+GQcBUPabiCmSgWzXBMVz
 A+3L8GdKCgGl1tZt2CAy8zumdX8Qkn62ljOVVRLIWeRu9oWiRsEREdSIVeBM9DdQvEnc
 07+A==
X-Gm-Message-State: ACrzQf0y6oKmx5fu1enfMUcx2i+JRd6qEbSdyI4kVpiqn+LO0bg6ceGe
 xvkpCiunTtmA+CkIaAzDNtfF+KTfDnhNOQeJUsA=
X-Google-Smtp-Source: AMsMyM7N+vF3AX0sIiRJqXb77kOCkGVtCMl8s3L1erCN3LqnRF7UK6xDJQe6+Fnsyu6E0IZGNrWc/ydD2Pf2N5+AnMA=
X-Received: by 2002:a05:6130:c0b:b0:3e8:c90e:2d7a with SMTP id
 cg11-20020a0561300c0b00b003e8c90e2d7amr26651871uab.105.1666819978382; Wed, 26
 Oct 2022 14:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221026194619.28880-1-philmd@linaro.org>
 <20221026194619.28880-4-philmd@linaro.org>
In-Reply-To: <20221026194619.28880-4-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 26 Oct 2022 23:32:45 +0200
Message-ID: <CAG4p6K5NKs59r8ODzOY6AneDuALDgjimsUUu6pO_dvwq5AuWjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="000000000000b750c405ebf6c4f6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=shentey@gmail.com; helo=mail-ua1-x931.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000b750c405ebf6c4f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 9:46 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> IRQRC[A:D] registers reset value is 0x80. We were forcing
> the MIPS Malta machine routing to be able to boot a Linux
> kernel without any bootloader.
> We now have these registers initialized in the Malta machine
> write_bootloader(), so we can use the correct reset values.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/isa/piix4.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 15f344dbb7..a2165c6a49 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
>      pci_conf[0x4c] =3D 0x4d;
>      pci_conf[0x4e] =3D 0x03;
>      pci_conf[0x4f] =3D 0x00;
> -    pci_conf[0x60] =3D 0x0a; // PCI A -> IRQ 10
> -    pci_conf[0x61] =3D 0x0a; // PCI B -> IRQ 10
> -    pci_conf[0x62] =3D 0x0b; // PCI C -> IRQ 11
> -    pci_conf[0x63] =3D 0x0b; // PCI D -> IRQ 11
> +    pci_conf[0x60] =3D 0x80;
> +    pci_conf[0x61] =3D 0x80;
> +    pci_conf[0x62] =3D 0x80;
> +    pci_conf[0x63] =3D 0x80;
>

Running `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta
-hda debian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1
console=3DttyS0"` with this patch Linux outputs:

[    7.944000] uhci_hcd: USB Universal Host Controller Interface driver
[    7.944000] uhci_hcd 0000:00:0a.2: Found HC with no IRQ. Check BIOS/PCI
0000:00:0a.2 setup!
[    7.944000] uhci_hcd 0000:00:0a.2: init 0000:00:0a.2 fail, -19

Omitting this patch from the series the USB host is found.

Best regards,
Bernhard


>      pci_conf[0x69] =3D 0x02;
>      pci_conf[0x70] =3D 0x80;
>      pci_conf[0x76] =3D 0x0c;
> --
> 2.37.3
>
>

--000000000000b750c405ebf6c4f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 26, 2022 at 9:46 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">IRQRC[A:D] registers reset value is 0x80. We w=
ere forcing<br>
the MIPS Malta machine routing to be able to boot a Linux<br>
kernel without any bootloader.<br>
We now have these registers initialized in the Malta machine<br>
write_bootloader(), so we can use the correct reset values.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 15f344dbb7..a2165c6a49 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x4c] =3D 0x4d;<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x4e] =3D 0x03;<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x4f] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x60] =3D 0x0a; // PCI A -&gt; IRQ 10<br>
-=C2=A0 =C2=A0 pci_conf[0x61] =3D 0x0a; // PCI B -&gt; IRQ 10<br>
-=C2=A0 =C2=A0 pci_conf[0x62] =3D 0x0b; // PCI C -&gt; IRQ 11<br>
-=C2=A0 =C2=A0 pci_conf[0x63] =3D 0x0b; // PCI D -&gt; IRQ 11<br>
+=C2=A0 =C2=A0 pci_conf[0x60] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x61] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x62] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x63] =3D 0x80;<br></blockquote><div><br></div><div=
>Running `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -=
hda debian_wheezy_mipsel_standard.qcow2 -append &quot;root=3D/dev/sda1 cons=
ole=3DttyS0&quot;` with this patch Linux outputs:</div><div><br></div><div>=
[ =C2=A0 =C2=A07.944000] uhci_hcd: USB Universal Host Controller Interface =
driver<br>[ =C2=A0 =C2=A07.944000] uhci_hcd 0000:00:0a.2: Found HC with no =
IRQ. Check BIOS/PCI 0000:00:0a.2 setup!<br>[ =C2=A0 =C2=A07.944000] uhci_hc=
d 0000:00:0a.2: init 0000:00:0a.2 fail, -19</div><div><br></div><div>Omitti=
ng this patch from the series  the USB host is found.</div><div><br></div><=
div>Best regards,</div><div>Bernhard<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0pci_conf[0x69] =3D 0x02;<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x70] =3D 0x80;<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x76] =3D 0x0c;<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--000000000000b750c405ebf6c4f6--


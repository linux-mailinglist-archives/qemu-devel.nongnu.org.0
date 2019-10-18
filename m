Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E319DDC100
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 11:32:25 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLOcS-000209-O1
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 05:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iLOZo-00007L-02
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iLOZm-00067r-Ty
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:29:39 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iLOZm-00067d-OA
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:29:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id o44so4391755ota.10
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=KYWKqtUkh9BqJGl2SbWKMzH82HouTEciguc/48h5hwI=;
 b=G5YJS806ov4UYJubdBlCdMd5BW9y9d3DiaqPyFbJNCv4XQiuh+dEyHFrYo3V36cHZi
 /eQC8NAa2olB2ArztYgrxip1P0msIUth3O1AIvtHdVier8D3H9zfGrweEErkUnXHiEk2
 iev83RjZYZ9sdLezfrnYBH+sPM/fiui02HLisv9l5WJMYKri/7znDaGlh13+20UnI/WP
 IjCPB1HCg5AB6OYwefpBYLoM11YxekCC5sD7pHkt0+9Ofxy3wyOmb/XdFPwwpMuUDIyx
 pMSwHqKPNgJU6IrexMsuvZqopUM6FiIDDHtauD8JlxJ24aOUooX2DlT+zThuN0kP/YoH
 2BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=KYWKqtUkh9BqJGl2SbWKMzH82HouTEciguc/48h5hwI=;
 b=qKAeHiLSVKXd5qAMBgw9KAxlG7oH8+f4PBmIjryvqTFkhWTfoaVZSYOwXQxiy9E101
 L5IXgow9rKYCM2BSv4xLQrhe0qsyD8R0ercbo8H+9xu5N9iGgndwJaF3MI6Zktpmgga/
 TnprLRhZ+t8lhFx7p1mRX+9S9FTYXGl68s6u02HVi/Bbypyx4Rn1xYlPOnxXvtyN5xGN
 3xgW0YRVJwWwx7TfSIooKx8lymZOOUZWnKncW5bYMZZS5ArC/35jeBhVuCCfO5QDWO29
 xrT48NvtFazBCWQ1AH1sjLBaQe6+TPovB0zUXiZlqG5QlJLSG/rkPwuoS7ICYVoNztNd
 jESA==
X-Gm-Message-State: APjAAAXXVfu/5/x5lERaS4TmJyzDtl2l2yXtZoyLle91yFdAgrHpFpMJ
 dULWYA2h0qtySrfEhpPFQO3KdmKvUE4xI0VBjgs=
X-Google-Smtp-Source: APXvYqyVYAp//gIwumC/0ACMQhOZINyCeSipNRrnNmghB2vtZ9XahmZwrYy6ZXBIzv90igP4gMHSQIjniOaYKf/lnL0=
X-Received: by 2002:a9d:684c:: with SMTP id c12mr7025115oto.341.1571390977890; 
 Fri, 18 Oct 2019 02:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:29:37
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-30-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-30-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:29:37 +0200
Message-ID: <CAL1e-=gfcT=3Hx+qJYcFKHSfnNP5w7dtbxivEHeX=nLDZP1zyA@mail.gmail.com>
Subject: Re: [PATCH 29/32] hw/pci-host/piix: Fix code style issues
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000a600d05952bf99e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000a600d05952bf99e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> We will move this code, fix its style first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/pci-host/piix.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 0b5da5bc94..61f91ff561 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -133,9 +133,10 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void
> *opaque, int pci_intx);
>  static void piix3_write_config_xen(PCIDevice *dev,
>                                 uint32_t address, uint32_t val, int len);
>
> -/* return the global irq number corresponding to a given device irq
> -   pin. We could also use the bus number to have a more precise
> -   mapping. */
> +/*
> + * Return the global irq number corresponding to a given device irq
> + * pin. We could also use the bus number to have a more precise mapping.
> + */
>  static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
>  {
>      int slot_addend;
> --
> 2.21.0
>
>
>

--0000000000000a600d05952bf99e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">We will move this code, fix its style first.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/pci-host/piix.c | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br></blockquote><div><br></div><div><span style=3D"color:rgb(34,34,34);fon=
t-size:14px;line-height:22.1200008392334px">Reviewed-by: Aleksandar Markovi=
c &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank" st=
yle=3D"font-size:14px;line-height:22.1200008392334px">amarkovic@wavecomp.co=
m</a><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.12000=
08392334px">&gt;</span><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 0b5da5bc94..61f91ff561 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -133,9 +133,10 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>v=
oid *opaque, int pci_intx);<br>
=C2=A0static void piix3_write_config_xen(<wbr>PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t address, uint32_t val, int =
len);<br>
<br>
-/* return the global irq number corresponding to a given device irq<br>
-=C2=A0 =C2=A0pin. We could also use the bus number to have a more precise<=
br>
-=C2=A0 =C2=A0mapping. */<br>
+/*<br>
+ * Return the global irq number corresponding to a given device irq<br>
+ * pin. We could also use the bus number to have a more precise mapping.<b=
r>
+ */<br>
=C2=A0static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int slot_addend;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000000a600d05952bf99e--


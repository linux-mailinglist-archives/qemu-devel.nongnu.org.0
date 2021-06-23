Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EA3B1814
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:28:47 +0200 (CEST)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw07i-00014K-58
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw05v-0000HW-K2
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:26:55 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw05t-0000ld-AS
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:26:55 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso978367oto.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I3F/LUmGafpB3UhYbk0+qE51vZlFsBhqg+7RmeQ4ff0=;
 b=lpNvPj91YD45n93iKhF5nJ6JqlD51yE5XDZs0K9rV+Wy9SeXOpvVdFfGuse4SWFwGF
 7PhclqccxLVE1pQXAG9G/o0N+LRrDdZxkgrhQG23eHnTplOyeL50vaLDg49A+85gRd+C
 4nA02+mPhgMCbMfSgFGyGUuFDnragEtQcMCdCp88/tzpI7d3eGsehwK/JQ0lDHZwKeyF
 hSFCVdZsuhDtyNTCikzAhR4iAuG1DqQD/eqPgdrlY3/1Q3Qpkk91KVh7L+4odzxoao6+
 BR867jUlj+Bg7JyfR3flutC0wA8UETjy46eylVfHnSbvoGIA6v/K9Lgj5QBeL+i9M3DI
 uctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3F/LUmGafpB3UhYbk0+qE51vZlFsBhqg+7RmeQ4ff0=;
 b=V8yjW0RIhqp/L0jjltTjhsn7OiVJHwFVswnsfnTPX9CoMqKLaH0an8orUveYSFRoNu
 j9ruSP9HKczsv7mELRJV8uBIEqXjS1FLWknB0TXJjGn/AMhKb32Jt+8z+iyEd/tEZnre
 /0ZJvn12Cdwag0wmE8CIaxPVXdNaGkbnRjGM/DO2vKRdIEejLg0DR8545JIMwinKx76j
 IL88IN7PVH3KUFOw2MxlCWt2OgOXGQyHCRDtE4zxek5Z0o9Zyftk7AckazK4ccQ/ZIN/
 IjhB/s5jzJnMtcGf6Ou2dG30vzkQSu0PdUURNY+IcpKcPTA0AqBuUTnBVVMNwlQAFCO5
 vhbg==
X-Gm-Message-State: AOAM5331xtdO0p5mKOqZ7uFR8/rOs0yVtBHpl8itSpw2q8vXeMuq3Eyu
 jGNWIdP3Ky6aIjZXnkdK59cBeeB/9x6+rAmfJ4g=
X-Google-Smtp-Source: ABdhPJz1BpcpHK2YuCh0QOVODo83vAnwPZWB04GGBMBSzQtRrfJ9qxhxXbO5Ys6fZLJCDV0+kZ4qYI5d+nLWpHEOff0=
X-Received: by 2002:a9d:2f61:: with SMTP id h88mr7043298otb.190.1624444011622; 
 Wed, 23 Jun 2021 03:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-2-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-2-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 13:26:40 +0300
Message-ID: <CAC_L=vXm3i6PU1Q6jf=kRwT5OWh_3KBRMZtGnHtdg2KCKfO-0g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000045335805c56c58fe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x32d.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045335805c56c58fe
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova <jusual@redhat.com> wrote:

> PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
> acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
> 'acpi-root-pci-hotplug' flag.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/pcihp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 4999277d57..09f531e941 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)
>  static void acpi_pcihp_disable_root_bus(void)
>  {
>      static bool root_hp_disabled;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;
>
>      if (root_hp_disabled) {
>          return;
>      }
>
> -    bus = find_i440fx();
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus
> non-hotpluggable */
>          qbus_set_hotplug_handler(BUS(bus), NULL);
> --
> 2.30.2
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--00000000000045335805c56c58fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 2021 at 10:08 PM Juli=
a Suvorova &lt;<a href=3D"mailto:jusual@redhat.com">jusual@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">PCI Ex=
press does not allow hot-plug on pcie.0. Check for Q35 in<br>
acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the<br>
&#39;acpi-root-pci-hotplug&#39; flag.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/acpi/pcihp.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
index 4999277d57..09f531e941 100644<br>
--- a/hw/acpi/pcihp.c<br>
+++ b/hw/acpi/pcihp.c<br>
@@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)<br>
=C2=A0static void acpi_pcihp_disable_root_bus(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static bool root_hp_disabled;<br>
+=C2=A0 =C2=A0 Object *host =3D acpi_get_i386_pci_host();<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *bus;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (root_hp_disabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 bus =3D find_i440fx();<br>
+=C2=A0 =C2=A0 bus =3D PCI_HOST_BRIDGE(host)-&gt;bus;<br>
=C2=A0 =C2=A0 =C2=A0if (bus) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* setting the hotplug handler to NULL ma=
kes the bus non-hotpluggable */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qbus_set_hotplug_handler(BUS(bus), NULL);=
<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marcel Apfelbaum &lt;<a h=
ref=3D"mailto:marcel.apfelbaum@gmail.com">marcel.apfelbaum@gmail.com</a>&gt=
;<br></div><div><br></div><div>Thanks,</div><div>Marcel</div><div>=C2=A0</d=
iv></div></div>

--00000000000045335805c56c58fe--


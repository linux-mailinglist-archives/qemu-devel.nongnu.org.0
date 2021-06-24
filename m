Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F703B2EF5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:31:32 +0200 (CEST)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOW2-0006CW-Qw
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lwOUM-0005ES-H9
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:29:46 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lwOUK-0004qT-SR
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:29:46 -0400
Received: by mail-oi1-x231.google.com with SMTP id b2so4729941oiy.6
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjOonRnWKWmh+G2v8nTcE09HEh1ot/gugSTNxqghVTM=;
 b=k72lZlsy+pljAplVXox8OBPHBZnOEigdcXGVPZN/eifsAlN+mxheyYnbQ0AUyRPzQv
 O2qGPAwjYn3/otmCdRf8vbrLqLHtgPZcdVvJwetoyNeHfkavxX62WzAqU9i7cRMQgajx
 dIW7CEgZYM1cAa6GlAzixPR2yeH9yunQUwW3yHTzBOFx9mCtEPwdk+0tnmwerZFSPgVd
 YuoIzfk64vpXjNJ+1mFnPNsOL2ozY6K9wioju/1EhL4U/tCuAntk2dfhrYVrO62qvllt
 zsgpABRT7+ap1mP5SGgygm4ZFrBw5m5TepZWW98PQVXKu6+YF5KU3n9ylsgZ/69VStKW
 z5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjOonRnWKWmh+G2v8nTcE09HEh1ot/gugSTNxqghVTM=;
 b=KYbS+eE7iAw0UIqjEFAn8dPoOo7bUiL+Y82ldsuL2szmdmzGCCPHbFbpGkSJZEnvCn
 chjPip+i0bympUwNnHRIyy5smx5hUe7dX96Jt14UENYKq5ldVVxwuBSWyf0H5nI5GmDv
 x+bLxYW/idE/Mk17G843XP9nTljP7cofW5i6Wqquz857/W6Wq2ajxgybRI+eYZ2GtFkH
 gvNoCeID5CKRSiz0x0sMMO34WCp8wUKoxbzMX7H6WdhS0A/pY4Tbo5UHiDM9M+TbxyH8
 2jxAEkDu2QT2k3klXeGI5ASuBLIRJUwA3hXyL9NZFOUSVIljEDBo6IKk6rItuN8D3QMc
 162Q==
X-Gm-Message-State: AOAM533MECBWr+2laFciAuWsa4fgsn2YpFIEQcOBAs2n7vHjdOrK79Gb
 7P/omSY0wzORE7D6nPvBl/llJp52ef3uMgwBACI=
X-Google-Smtp-Source: ABdhPJx0NDeS0MFlB1hXkZ4AFZYlX0jQ9dV/Wlol1jsL4Zjjb4OOSowMMP8SsMA7A6H4K9TAFYv/Bh65ydCH/9nfSOI=
X-Received: by 2002:a54:4690:: with SMTP id k16mr6993929oic.57.1624537783769; 
 Thu, 24 Jun 2021 05:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210623144747.285302-1-jusual@redhat.com>
In-Reply-To: <20210623144747.285302-1-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 24 Jun 2021 15:29:32 +0300
Message-ID: <CAC_L=vWKV3YHNf28Ebx8PG=rPXjFrp-g0H664qryivkxE3UHkA@mail.gmail.com>
Subject: Re: [PATCH] hw/pci/pcie_port: Rename "enable-native-hotplug" property
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000869e7605c5822d53"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x231.google.com
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

--000000000000869e7605c5822d53
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 5:47 PM Julia Suvorova <jusual@redhat.com> wrote:

> PCIE_SLOT property renamed to "native-hotplug" to be more concise
> and consistent with other properties.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/i386/pc_q35.c   | 4 ++--
>  hw/pci/pcie_port.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a0ec7964cc..04b4a4788d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -243,8 +243,8 @@ static void pc_q35_init(MachineState *machine)
>                                            NULL);
>
>      if (acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT,
> "enable-native-hotplug",
> -                                  "false", true);
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> +                                   "false", true);
>      }
>
>      /* irq lines */
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index a410111825..da850e8dde 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> -    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug,
> true),
> +    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> --
> 2.30.2
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--000000000000869e7605c5822d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 5:47 PM Julia=
 Suvorova &lt;<a href=3D"mailto:jusual@redhat.com">jusual@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">PCIE_SL=
OT property renamed to &quot;native-hotplug&quot; to be more concise<br>
and consistent with other properties.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc_q35.c=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0hw/pci/pcie_port.c | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c<br>
index a0ec7964cc..04b4a4788d 100644<br>
--- a/hw/i386/pc_q35.c<br>
+++ b/hw/i386/pc_q35.c<br>
@@ -243,8 +243,8 @@ static void pc_q35_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (acpi_pcihp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_register_sugar_prop(TYPE_PCIE_SLOT, &qu=
ot;enable-native-hotplug&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;false&quot;, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_register_sugar_prop(TYPE_PCIE_SLOT, &qu=
ot;native-hotplug&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;false&quot;, true=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* irq lines */<br>
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c<br>
index a410111825..da850e8dde 100644<br>
--- a/hw/pci/pcie_port.c<br>
+++ b/hw/pci/pcie_port.c<br>
@@ -148,7 +148,7 @@ static Property pcie_slot_props[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;chassis&quot;, PCIESlot, chassi=
s, 0),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT16(&quot;slot&quot;, PCIESlot, slot, 0)=
,<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;hotplug&quot;, PCIESlot, hotplug=
, true),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;enable-native-hotplug&quot;, PCIESlot=
, native_hotplug, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;native-hotplug&quot;, PCIESlot, nativ=
e_hotplug, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST()<br>
=C2=A0};<br>
<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marcel Apfelbaum &lt;<a h=
ref=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.apfelbau=
m@gmail.com</a>&gt;<br></div><div><br></div><div>Thanks,</div><div>Marcel=
=C2=A0</div></div></div>

--000000000000869e7605c5822d53--


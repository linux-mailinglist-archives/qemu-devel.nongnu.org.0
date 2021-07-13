Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151933C6E32
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:04:08 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FGo-0005Y0-4e
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3FFo-0004sK-Dq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:03:04 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3FFm-0006u2-Ru
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:03:04 -0400
Received: by mail-oi1-x22c.google.com with SMTP id l26so28012007oic.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgYQtUq+yJTTFSbMtdm8UPueTYhArxjJo5ewFm5GJoY=;
 b=aO2DatzbO9R3OOG87zuswEiW5dUU9EuTCLcA4GlXIXQxKrnAR1a9+CZKWvMxt3jJwQ
 af6q9Y55ZJMAFEClkHf+HRTpmwr5N3K6zguavC7K6hwjhLQCa4Tw0I3HtvR/8vjoXGOj
 E55daI4R08zRe85CH3K4V/nC56p2CrHqzB9orCWHDVL4Jfl0c9G+bhC+qc1sGSwzuH8M
 zkklBKDmOATvYj0NCLTNq4u/O2x2VyG55x0qGiLV7jvFd0R7k8zVfxt8lefjOJOZKZyS
 6RuKRGHweLLc5N4rvOxvPo8KKmSI2TmwKKazorw8l/XgcNuS7bA4Qi13dhv8Ov6I5ePp
 VAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgYQtUq+yJTTFSbMtdm8UPueTYhArxjJo5ewFm5GJoY=;
 b=otq/NGKXyace+Br3UicGl2EmUFubGnJlQdIERyyNrUbNvZbVUXbSFrm/8xmW/rDDRK
 N+cLaXr1c2uBToy8uTqkjgjPWIFqoF1ssMNdKRcPB6DdkQfneUzp6SFDhxW1qKMTe0YG
 9v1J2C/4f3DjsM8urLTzSjIhOFJOoc86KxvxURgoVSf/dD0EDK6RqlpxXTidOUlQ+uNP
 q+DxECULSW1LEy3jFpdjl0mxE6IV4YCUHO4PaQJGfiULTcY50jkbmRULOhTy5kSS+OjL
 B46jn3/UzOHkGeYT3Bugp/2XDQ1oepDd4VgHULZzOzJeOggGvG6hLL94RMBYtD3W4fFo
 E8xQ==
X-Gm-Message-State: AOAM533ra+Akqs4VjVOk8S6vIhQCRQ+BzvavWACbCE4mQYWrctX/RYDU
 gwpeiTSJyZ7hGoZrVZQtJXU7E4UpshzVt58iEJk=
X-Google-Smtp-Source: ABdhPJzuS6pqXmFA441jU5BHkvFjEgUWNXBzqjDVE5c2R9fu+YNwyAGUNoP9MNS43UBiNAAy06e+bOCQ/UzZ/Tbs+Bk=
X-Received: by 2002:a05:6808:2105:: with SMTP id
 r5mr13900922oiw.57.1626170581187; 
 Tue, 13 Jul 2021 03:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-3-jusual@redhat.com>
 <YO0SF+gPFYc6OYn6@yekko>
In-Reply-To: <YO0SF+gPFYc6OYn6@yekko>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 13 Jul 2021 13:02:50 +0300
Message-ID: <CAC_L=vUNxirgYJjgJFXKg+XKveCjRVz2nMAbXG721ihRGneg+g@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] hw/acpi/ich9: Enable ACPI PCI hot-plug
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="000000000000d6022d05c6fe5708"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x22c.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, David Gibson <dgibson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d6022d05c6fe5708
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, Jul 13, 2021 at 7:12 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Tue, Jul 13, 2021 at 02:42:01AM +0200, Julia Suvorova wrote:
> > Add acpi_pcihp to ich9_pm as part of
> > 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>
> Since it looks safe, however I think there are a couple of unnecessary
> changes here:
>
>
> [snip]
> > @@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
> >  static void acpi_set_pci_info(void)
> >  {
> >      static bool bsel_is_set;
> > +    Object *host = acpi_get_i386_pci_host();
> >      PCIBus *bus;
> >      unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
> >
> > @@ -111,7 +114,11 @@ static void acpi_set_pci_info(void)
> >      }
> >      bsel_is_set = true;
> >
> > -    bus = find_i440fx(); /* TODO: Q35 support */
> > +    if (!host) {
>
> AFAICT acpi_get_i386_pci_host() still can't return NULL, so I'm not
> sure this test is necessary.
>

It can, please see the new stub in hw/acpi/acpi-x86-stub.c

Object *acpi_get_i386_pci_host(void)
{
       return NULL;
}

Thanks,
Marcel

[...]

--000000000000d6022d05c6fe5708
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi David,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 7:12 AM =
David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibso=
n.dropbear.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Tue, Jul 13, 2021 at 02:42:01AM +0200, Julia Suvorova wr=
ote:<br>
&gt; Add acpi_pcihp to ich9_pm as part of<br>
&gt; &#39;acpi-pci-hotplug-with-bridge-support&#39; option. Set default to =
false.<br>
&gt; <br>
&gt; Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com"=
 target=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum=
@gmail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" =
target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
<br>
Reviewed-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au=
" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
<br>
Since it looks safe, however I think there are a couple of unnecessary<br>
changes here:<br>
<br>
<br>
[snip]<br>
&gt; @@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaq=
ue)<br>
&gt;=C2=A0 static void acpi_set_pci_info(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static bool bsel_is_set;<br>
&gt; +=C2=A0 =C2=A0 Object *host =3D acpi_get_i386_pci_host();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIBus *bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned bsel_alloc =3D ACPI_PCIHP_BSEL_DEFAULT;<b=
r>
&gt;=C2=A0 <br>
&gt; @@ -111,7 +114,11 @@ static void acpi_set_pci_info(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bsel_is_set =3D true;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 bus =3D find_i440fx(); /* TODO: Q35 support */<br>
&gt; +=C2=A0 =C2=A0 if (!host) {<br>
<br>
AFAICT acpi_get_i386_pci_host() still can&#39;t return NULL, so I&#39;m not=
<br>
sure this test is necessary.<br></blockquote><div><br></div><div>It can, pl=
ease see the new stub in hw/acpi/acpi-x86-stub.c</div><div>=C2=A0</div><div=
>Object *acpi_get_i386_pci_host(void)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn NULL;<br>}<br></div><div><br></div><div>Thanks,</div><div>Marcel</div>=
<div><br></div><div>[...]=C2=A0</div></div></div>

--000000000000d6022d05c6fe5708--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A53BD7D7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:32:27 +0200 (CEST)
Received: from localhost ([::1]:38930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lBa-0004sb-AE
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m0l9n-0003Pu-UB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:30:37 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m0l9k-0005ZL-K3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:30:35 -0400
Received: by mail-oi1-x22e.google.com with SMTP id l26so21918298oic.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hq98K53qJd88jdd2gUR8XHVXLAPCMF1bS5TpOfnDRP8=;
 b=onwVf03nas49BfYmDJXWc1WDUFWFLxjv7d//aHCZrytFoHKvkC9mwHgxt9R8SYo+Jk
 mgaazY+nxRkCWInk/w3Gvu9BlpBtIgrPZ1peWvyb7P+pBFry2HBpkoywydXEwPkDGGTS
 GWwGFMsFxKUM4yOliVTG0Ss+vbbhuXPdzMvBEMllm81/86hFSi8S/M2IGlhcm2ygI3gr
 zhheguOsHg5zBVL2bdHbmHCUqk+9heUezqwKTdyl1VwmeGr4pwCWmIKZb6AIG9cEHeg5
 HbQdrVfcIk9Kp5GHZwsq6iLkwmAzZyeukclzSUFBJIzyLRCXMZhjSYnEA3YX/RbPBPeZ
 8Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hq98K53qJd88jdd2gUR8XHVXLAPCMF1bS5TpOfnDRP8=;
 b=TGM72ZeIMIi33mFRfgIdHzs8HyGeD6gU8eeiWZJUKZq7R+GuuAqZna/NxLwalB5AUL
 vCJ7D8K0ShNMiwZaEqXdjkZT3om83N9GaQCkVOmCniJ61lylph3l4/+9CLcRFKmk4xeI
 OKqU5GsctITpkbd5epogomfoOjdhIywulBt0bnYq0JfPsahVxQcoBMiwIZduTnrI/o60
 HlYu8Q3I1ebKxut2u0KKofcDy7S0nnC7XF2mrYzF0CMH/bVWGSD8dfS7YG9o/kp2fPuI
 SNRXjQo7LCrdLjTZtlcEWDZkvZWNEEEsPvplKVbjftqnu8N8iN7x7vs1taLAB9AZwg73
 7cYw==
X-Gm-Message-State: AOAM531NmT3q9Z75SahlqY6/svOu0gxPx2yt+O58ACkKCPZ6p3wRMvSp
 A7WYgWGmSnBQm8tZ2cowa9FJIN44HwHLBGFnx54=
X-Google-Smtp-Source: ABdhPJxU3tXbRrk3v8bHGd2CAuPa0KHx5u9vCHKM/pUsW6K/IEg+mtC+UemI5tSTrM/ulbuX7nGfnlrclazA74Gt+pU=
X-Received: by 2002:aca:d9d7:: with SMTP id q206mr8331055oig.93.1625578230123; 
 Tue, 06 Jul 2021 06:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-1-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 6 Jul 2021 16:30:19 +0300
Message-ID: <CAC_L=vXCYSw4UXNXfyv_PfROBA0sNUWrht2me=KvzcwNEkoVJw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Use ACPI PCI hot-plug for Q35
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f610dc05c6746cd9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x22e.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f610dc05c6746cd9
Content-Type: text/plain; charset="UTF-8"

Hi Julia,

On Thu, Jun 17, 2021 at 10:07 PM Julia Suvorova <jusual@redhat.com> wrote:

> The patch set consists of two parts:
> patches 1-4: introduce new feature
>              'acpi-pci-hotplug-with-bridge-support' on Q35
> patches 5-7: make the feature default along with changes in ACPI tables
>
>
I have tested the patches and I noticed 2 issues:
1. The changes allow to hotplug a device into the pcie.0 bus (device_add
e1000)
    - The device can be seen using `info qtree` but is not visible in guest.
   pcie.0 bus should not support hotplug at all.
  Before the series we get:
       Error: Bus 'pcie.0' does not support hotplugging
2.  The devices hotplugged into a pcie-root-port are not allocated IO space:
    device_add e1000,id=e1,bus=rp1
    In dmesg I see:
         [   24.699178] pci 0000:01:00.0: BAR 1: no space for [io  size
0x0040]
         [  24.699753] pci 0000:01:00.0: BAR 1: failed to assign [io  size
0x0040]
   And in lspci I see:
        I/O ports at <unassigned> [disabled]
  Before the series:
      I/O ports at 1000 [size=64]


Could you please check?

Thanks,
Marcel

--000000000000f610dc05c6746cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Julia,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 2021 at 10:07 PM=
 Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com">jusual@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he patch set consists of two parts:<br>
patches 1-4: introduce new feature<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;acpi-pci-hotplug-with-=
bridge-support&#39; on Q35<br>
patches 5-7: make the feature default along with changes in ACPI tables<br>
<br></blockquote><div><br></div><div>I have tested the patches and I notice=
d 2 issues:</div><div>1. The changes allow to hotplug a device into the pci=
e.0 bus (device_add e1000)</div><div>=C2=A0 =C2=A0 - The device can be seen=
 using `info qtree` but is not visible in guest.</div><div>=C2=A0 =C2=A0pci=
e.0 bus should not support hotplug at all.</div><div>=C2=A0 Before the seri=
es we get:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Error: Bus &#39;pcie.0&#39;=
 does not support hotplugging</div><div>2.=C2=A0 The devices hotplugged int=
o a pcie-root-port are not allocated IO space:</div><div>=C2=A0 =C2=A0=C2=
=A0device_add e1000,id=3De1,bus=3Drp1</div><div>=C2=A0 =C2=A0 In dmesg I se=
e:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 24.699178] pci 0000=
:01:00.0: BAR 1: no space for [io =C2=A0size 0x0040]</div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[=C2=A0 24.699753] pci 0000:01:00.0: BAR 1: failed to assi=
gn [io =C2=A0size 0x0040]<br>=C2=A0 =C2=A0And in lspci I see:</div><div cla=
ss=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0 I/O ports at &lt;unassigned&=
gt; [disabled]</div><div class=3D"gmail_quote">=C2=A0 Before the series:</d=
iv><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0=C2=A0I/O ports at 1000 [=
size=3D64]</div><div class=3D"gmail_quote">=C2=A0 =C2=A0=C2=A0</div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Could you please c=
heck?=C2=A0=C2=A0</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Thanks,</div><div class=3D"gmail_quote">Marcel</div><div class=
=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div></div>

--000000000000f610dc05c6746cd9--


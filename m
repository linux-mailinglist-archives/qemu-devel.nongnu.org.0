Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0C6D4E8F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:01:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNX5-0007MA-Fd; Mon, 03 Apr 2023 12:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjNX3-0007Kp-GH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:59:49 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjNX0-0007Es-6e
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:59:49 -0400
Received: by mail-ed1-x530.google.com with SMTP id t10so119854273edd.12
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1680541184; x=1683133184;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNMxQ+zfHAOsBeuPp8Czzl7TnWpSrEoNJYnQhh1L5dE=;
 b=Yu9zu2WcU6dKheTK5C+jyvfzZKaZKNgXH3hm/aejTZvyN6w3fS5AGe/Kykfl1mpwuV
 DX8eu8cG/GtB/XsjJJTaYEF1n9oin/pAE+qmDnpLcKJ+aD6wbR1i6rlFqhkDIb2RAVmm
 C0OVAS1nRItxbYn3Tt3aIjXiP4IRDvxO68o+SUQIKcN2afoCeWJnFpPIv3fyO6qe9nHR
 lWw4LkxsWTRF8TJ0+J8l0NdqnMFcz4HoZDmdzEcovNX/h2M+Npa+GkkdGqq4tl0s8Xxd
 R1jM5ueELpMisQETp4THiPYMvRpLf6Xba1gaAVwK2YaRie3AooH4IxXfNgYdZrCjN1m1
 7m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680541184; x=1683133184;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wNMxQ+zfHAOsBeuPp8Czzl7TnWpSrEoNJYnQhh1L5dE=;
 b=dTlOtuPnSgbaL+M0gK5iOXos2fGuwscDE2I378qNnN75zzn70VJ9vg7lfcdi7ETiYq
 fpslIHuhjRm0CHkzW1Jqj/pR+YpIroU+LOdPFDihN3aSxE8Ym1nPoLcRZlH2MHoQYlK4
 L57PFhCtPcKi3LTW0c/LNpkgQbj2SQF3jnq2lUYowwuMr0u8Flzum7poNEVj+GrErurb
 rkYmKw+6jz3Ti5NkbzOEwrqr2TvP1t48ajdhgSo7BMf+denwSDn16Vskap5khUCQbs7D
 U2CLlIRMFtV0+tubH0G65BtbkrsA/LxsQLNfQw4O1sL4ym2fhLKYApqHturBtAHEA7d9
 7kFA==
X-Gm-Message-State: AAQBX9cNa+oIU+VORiPypsuT8YAU4+WcKP+dOHQPoG/26lmqjZkmolbh
 vZ1aiaQ6TPv6vUXJmMCxzHHa9LodhHIMknu5f1l0xw==
X-Google-Smtp-Source: AKy350bcsPLiqdZBrVoeJonS0wPLsSSw7wSWiymTt0KJexQkEh2iAjpYTeDkeA+7iSrJQMjIV20RhNkFomLqheH0wBE=
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr18460523edf.6.1680541184062; Mon, 03 Apr
 2023 09:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
In-Reply-To: <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
From: Yu Zhang <yu.zhang@ionos.com>
Date: Mon, 3 Apr 2023 18:59:33 +0200
Message-ID: <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
Subject: Re: an issue for device hot-unplug
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Elmar Gerdes <elmar.gerdes@ionos.com>, Jinpu Wang <jinpu.wang@ionos.com>
Content-Type: multipart/alternative; boundary="0000000000004ea27b05f8717cf0"
Received-SPF: permerror client-ip=2a00:1450:4864:20::530;
 envelope-from=yu.zhang@ionos.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000004ea27b05f8717cf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Laurent,

Thank you for your quick reply. We used qemu-7.1, but it is reproducible
with qemu from v6.2 to the recent v8.0 release candidates.
I found that it's introduced by the commit  9323f892b39 (between v6.2.0-rc2
and v6.2.0-rc3).

If it doesn't break anything else, it suffices to remove the line below
from acpi_pcihp_device_unplug_request_cb():

    pdev->qdev.pending_deleted_event =3D true;

but you may have a reason to keep it. First of all, I'll open a bug in the
bug tracker and let you know.

Best regards,
Yu Zhang

On Mon, Apr 3, 2023 at 6:32=E2=80=AFPM Laurent Vivier <lvivier@redhat.com> =
wrote:

> Hi Yu,
>
> please open a bug in the bug tracker:
>
> https://gitlab.com/qemu/qemu/-/issues
>
> It's easier to track the problem.
>
> What is the version of QEMU you are using?
> Could you provide QEMU command line?
>
> Thanks,
> Laurent
>
>
> On 4/3/23 15:24, Yu Zhang wrote:
> > Dear Laurent,
> >
> > recently we run into an issue with the following error:
> >
> > command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX"
> } }' for VM "id"
> > failed ({ "return": {"class": "GenericError", "desc": "Device
> virtio-diskX is already in
> > the process of unplug"} }).
> >
> > The issue is reproducible. With a few seconds delay before hot-unplug,
> hot-unplug just
> > works fine.
> >
> > After a few digging, we found that the commit 9323f892b39 may incur the
> issue.
> > ------------------
> >      failover: fix unplug pending detection
> >
> >      Failover needs to detect the end of the PCI unplug to start
> migration
> >      after the VFIO card has been unplugged.
> >
> >      To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and
> reset in
> >      pcie_unplug_device().
> >
> >      But since
> >          17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default
> on Q35")
> >      we have switched to ACPI unplug and these functions are not called
> anymore
> >      and the flag not set. So failover migration is not able to detect
> if card
> >      is really unplugged and acts as it's done as soon as it's started.
> So it
> >      doesn't wait the end of the unplug to start the migration. We don'=
t
> see any
> >      problem when we test that because ACPI unplug is faster than PCIe
> native
> >      hotplug and when the migration really starts the unplug operation =
is
> >      already done.
> >
> >      See c000a9bd06ea ("pci: mark device having guest unplug request
> pending")
> >          a99c4da9fc2a ("pci: mark devices partially unplugged")
> >
> >      Signed-off-by: Laurent Vivier <lvivier@redhat.com <mailto:
> lvivier@redhat.com>>
> >      Reviewed-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
> >      Message-Id: <20211118133225.324937-4-lvivier@redhat.com
> > <mailto:20211118133225.324937-4-lvivier@redhat.com>>
> >      Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:
> mst@redhat.com>>
> >      Signed-off-by: Michael S. Tsirkin <mst@redhat.com <mailto:
> mst@redhat.com>>
> > ------------------
> > The purpose is for detecting the end of the PCI device hot-unplug.
> However, we feel the
> > error confusing. How is it possible that a disk "is already in the
> process of unplug"
> > during the first hot-unplug attempt? So far as I know, the issue was
> also encountered by
> > libvirt, but they simply ignored it:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659>
> >
> > Hence, a question is: should we have the line below in
> acpi_pcihp_device_unplug_request_cb()?
> >
> >     pdev->qdev.pending_deleted_event =3D true;
> >
> > It would be great if you as the author could give us a few hints.
> >
> > Thank you very much for your reply!
> >
> > Sincerely,
> >
> > Yu Zhang @ Compute Platform IONOS
> > 03.04.2013
>
>

--0000000000004ea27b05f8717cf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Laurent,<div><br></div><div>Thank you for your quick =
reply. We used qemu-7.1, but it is reproducible with qemu from v6.2 to the =
recent v8.0 release candidates.</div><div>I found that it&#39;s introduced =
by the commit=C2=A0=C2=A09323f892b39 (between v6.2.0-rc2 and v6.2.0-rc3).=
=C2=A0</div><div><br></div><div>If it doesn&#39;t break anything else, it s=
uffices to remove the line below from acpi_pcihp_device_unplug_request_cb()=
:</div><div><br></div><div>=C2=A0 =C2=A0 pdev-&gt;qdev.pending_deleted_even=
t =3D true;<br></div><div><br></div><div>but you may have a reason to keep =
it. First of all, I&#39;ll open a bug in the bug tracker and let you know.<=
/div><div><br></div><div>Best regards,</div><div>Yu Zhang</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr =
3, 2023 at 6:32=E2=80=AFPM Laurent Vivier &lt;<a href=3D"mailto:lvivier@red=
hat.com">lvivier@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi Yu,<br>
<br>
please open a bug in the bug tracker:<br>
<br>
<a href=3D"https://gitlab.com/qemu/qemu/-/issues" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/qemu/qemu/-/issues</a><br>
<br>
It&#39;s easier to track the problem.<br>
<br>
What is the version of QEMU you are using?<br>
Could you provide QEMU command line?<br>
<br>
Thanks,<br>
Laurent<br>
<br>
<br>
On 4/3/23 15:24, Yu Zhang wrote:<br>
&gt; Dear Laurent,<br>
&gt; <br>
&gt; recently we run into an issue with the following error:<br>
&gt; <br>
&gt; command &#39;{ &quot;execute&quot;: &quot;device_del&quot;, &quot;argu=
ments&quot;: { &quot;id&quot;: &quot;virtio-diskX&quot; } }&#39; for VM &qu=
ot;id&quot; <br>
&gt; failed ({ &quot;return&quot;: {&quot;class&quot;: &quot;GenericError&q=
uot;, &quot;desc&quot;: &quot;Device virtio-diskX is already in <br>
&gt; the process of unplug&quot;} }).<br>
&gt; <br>
&gt; The issue is reproducible. With a few seconds delay before hot-unplug,=
 hot-unplug just <br>
&gt; works fine.<br>
&gt; <br>
&gt; After a few digging, we found that the commit 9323f892b39 may incur th=
e issue.<br>
&gt; ------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 failover: fix unplug pending detection<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Failover needs to detect the end of the PCI unplug=
 to start migration<br>
&gt;=C2=A0 =C2=A0 =C2=A0 after the VFIO card has been unplugged.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 To do that, a flag is set in pcie_cap_slot_unplug_=
request_cb() and reset in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pcie_unplug_device().<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 But since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17858a169508 (&quot;hw/acpi/ich9: Se=
t ACPI PCI hot-plug as default on Q35&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 we have switched to ACPI unplug and these function=
s are not called anymore<br>
&gt;=C2=A0 =C2=A0 =C2=A0 and the flag not set. So failover migration is not=
 able to detect if card<br>
&gt;=C2=A0 =C2=A0 =C2=A0 is really unplugged and acts as it&#39;s done as s=
oon as it&#39;s started. So it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 doesn&#39;t wait the end of the unplug to start th=
e migration. We don&#39;t see any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 problem when we test that because ACPI unplug is f=
aster than PCIe native<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hotplug and when the migration really starts the u=
nplug operation is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 already done.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 See c000a9bd06ea (&quot;pci: mark device having gu=
est unplug request pending&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a99c4da9fc2a (&quot;pci: mark device=
s partially unplugged&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Laurent Vivier &lt;<a href=3D"mailt=
o:lvivier@redhat.com" target=3D"_blank">lvivier@redhat.com</a> &lt;mailto:<=
a href=3D"mailto:lvivier@redhat.com" target=3D"_blank">lvivier@redhat.com</=
a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani@a=
nisinha.ca" target=3D"_blank">ani@anisinha.ca</a> &lt;mailto:<a href=3D"mai=
lto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Message-Id: &lt;<a href=3D"mailto:20211118133225.3=
24937-4-lvivier@redhat.com" target=3D"_blank">20211118133225.324937-4-lvivi=
er@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:20211118133225.324937-4-lvivier@redhat.co=
m" target=3D"_blank">20211118133225.324937-4-lvivier@redhat.com</a>&gt;&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mai=
lto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"m=
ailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a> &lt;mailto:<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;&gt;<b=
r>
&gt; ------------------<br>
&gt; The purpose is for detecting the end of the PCI device hot-unplug. How=
ever, we feel the <br>
&gt; error confusing. How is it possible that a disk &quot;is already in th=
e process of unplug&quot; <br>
&gt; during the first hot-unplug attempt? So far as I know, the issue was a=
lso encountered by <br>
&gt; libvirt, but they simply ignored it:<br>
&gt; <br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1878659</a> <br>
&gt; &lt;<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.c=
gi?id=3D1878659</a>&gt;<br>
&gt; <br>
&gt; Hence, a question is: should we have the line below in=C2=A0 acpi_pcih=
p_device_unplug_request_cb()?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0pdev-&gt;qdev.pending_deleted_event =3D true;<br>
&gt; <br>
&gt; It would be great if you as the author could give us a few hints.<br>
&gt; <br>
&gt; Thank you very much for your reply!<br>
&gt; <br>
&gt; Sincerely,<br>
&gt; <br>
&gt; Yu Zhang @ Compute Platform IONOS<br>
&gt; 03.04.2013<br>
<br>
</blockquote></div>

--0000000000004ea27b05f8717cf0--


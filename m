Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F5387A4F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:44:18 +0200 (CEST)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj01B-0003CM-RE
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lizT0-0001Ix-KD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:09:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1lizSu-0003oY-So
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:08:58 -0400
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <thomas.parrott@canonical.com>) id 1lizSr-0004ng-FV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:08:49 +0000
Received: by mail-lf1-f71.google.com with SMTP id
 o4-20020a0565120524b02901fc3210717eso2022626lfc.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pj3S4cKd9IOxRDJc3Ixq6IKWxGcPDR1iGsO69Dn8nQk=;
 b=tEDFhbcBIRusvfJ0qa+06IdsyEC7zqc5NeBPeBEci0Yx2yVe/rbO2xPZNnv2n+8rSw
 tLWTVhvAJ9IBiQJ13YBMKmE0bfR6MZqQ6NYIovCwdPzDZ7DlwaqrDXVlAOLqtvftsQ6a
 ArjrQybsUZmSQpR/KobCTo4XacAo68Kl2DPb/peS8WrXkHbVyIADvqnCbO9WeHIZvtVG
 5lTL1E+hOrjuKt+5ypFSm6ULGSqEoTI27beHq0ujPeGzM0qd+xQnYCyE6rK8uar64rN8
 3niD1aj5x8gNcbRXZ8Mr+R+bl1Li5JOum4p64WGqiqqo05XN+4sS7K5wVuu+hUBBJZe0
 7Olg==
X-Gm-Message-State: AOAM5317CAxJGKgO1EsGztC1cc1WhxFnGEkkhVt1eZVEJKhWHRateCmr
 5Fr7w3N8XTUeHq4Lvne4/vWYv5+/grrVoq4G2NMq6ZzxvjABWYOmUGkNMlbKCRNvp64Fn6M38oB
 RqW5q2yN4A5P/QNGO71y0mxPJiYV0qZlaDBNE4gAkvEeuFYUs
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr4031104lfs.482.1621343328966; 
 Tue, 18 May 2021 06:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypEV2DIeUtVj+ntj82x9M5CDpaY44qo110NhTwdxVCOfYHYSb+wI+6pzT948p5jk9YR+SPGL9+1eZi/AqXaME=
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr4031081lfs.482.1621343328698; 
 Tue, 18 May 2021 06:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADNu6esx69UdccUHsFfinqcN=dPj0mceKX7WT755qWcPfDrwGQ@mail.gmail.com>
 <CADNu6esNHqEPzpROiRu+PEFGZJhi3Sgs=duEqjAz53FJv-UMCQ@mail.gmail.com>
 <848d4c41-6c05-2877-fae1-83a9d3a5082d@redhat.com>
In-Reply-To: <848d4c41-6c05-2877-fae1-83a9d3a5082d@redhat.com>
From: Thomas Parrott <thomas.parrott@canonical.com>
Date: Tue, 18 May 2021 14:08:22 +0100
Message-ID: <CADNu6esiDF15mzbCWR0boHX1C+C2tzGC04MVwbra0W8DZR6QTg@mail.gmail.com>
Subject: Re: Fwd: Adding devices via QMP's device_add don't have their
 bootindex setting respected
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Content-Type: multipart/alternative; boundary="0000000000002a9f2705c29a69fc"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=thomas.parrott@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 May 2021 09:39:06 -0400
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
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a9f2705c29a69fc
Content-Type: text/plain; charset="UTF-8"

Thanks Paolo for confirming that `-readconfig` isn't planned for removal
and that its just `-writeconfig` that is being deprecated, and that
non-hotplug device add via QMP is planned for development in the future.

We've had some reports from the Arch community that LXD on QEMU 6.0 is
broken, and had understood that config file support was being removed,
which is why we were focussing on switching to QMP.

We'll get some more details on what isn't working with LXD and QEMU 6.0
shortly.

Thanks
Tom

On Tue, 18 May 2021 at 13:55, Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/05/21 14:22, Thomas Parrott wrote:
> > Due to QEMU moving towards a QMP configuration mechanism and away from
> > config file support, the LXD team are currently in the process of
> > migrating to using QMP to add devices to VMs (so that we can support the
> > use of QEMU 6.0).
>
> If the only issue you have is with -spice, that's just a bug that we
> need to fix.  -readconfig is still supposed to work, even though
> -writeconfig is deprecated and I'd like to remove it as soon as 6.1.
>
> In particular, the issue you reported below is not a bug.  Devices that
> are added after startup are considered hotplugged, and the boot index
> list is frozen until the next reset.  QMP-based configuration of
> coldplugged devices is in the works, but unfortunately it is not yet ready.
>
> Paolo
>
> > Currently we are using the `-S` flag to freeze CPU at startup, then
> > using QMP to add NIC devices via the `device_add` command, and then
> > using the `cont` command to start the VM guest.
> >
> > This is working mostly fine, but there is one issue; the provided
> > "bootindex" property is not respected.
> >
> > E.g.
> >
> > device_add
> >
> {"addr":"00.0","bootindex":"0","bus":"qemu_pcie4","driver":"virtio-net-pci","id":"dev-lxd_eth0","mac":"00:16:3e:0c:69:e7","mq":"on","multifunction":"off","netdev":"lxd_eth0","vectors":"6"}
> >
> > The device is seen within the VM guest and the VM BIOS, but its boot
> > order is last rather than first.
> >
> > We've also tried using a non-zero bootindex of 1 and that has the same
> > effect.
> >
> > After discussions on #qemu IRC channel, we found that running
> > `system_reset` after adding the devices allowed the `bootindex` property
> > to be respected.
> >
> > So this looks like bug. Perhaps we can discuss it in one of the
> > forthcoming community calls?
> >
> > Thanks
> > Tom Parrott
>
>

--0000000000002a9f2705c29a69fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Paolo for confirming that `-readconfig` isn&#3=
9;t planned for removal and that its just `-writeconfig` that is being depr=
ecated, and that non-hotplug device add via QMP is planned for development =
in the future.<br></div><div><br></div><div>We&#39;ve had some reports from=
 the Arch community that LXD on QEMU 6.0 is broken, and had understood that=
 config file support was being removed, which is why we were focussing on s=
witching to QMP.<br></div><div><br></div><div>We&#39;ll get some more detai=
ls on what isn&#39;t working with LXD and QEMU 6.0 shortly.</div><div><br><=
/div><div>Thanks</div><div>Tom<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 May 2021 at 13:55, Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1=
8/05/21 14:22, Thomas Parrott wrote:<br>
&gt; Due to QEMU moving towards a QMP configuration mechanism and away from=
 <br>
&gt; config file support, the LXD team are currently in the process of <br>
&gt; migrating to using QMP to add devices to VMs (so that we can support t=
he <br>
&gt; use of QEMU 6.0).<br>
<br>
If the only issue you have is with -spice, that&#39;s just a bug that we <b=
r>
need to fix.=C2=A0 -readconfig is still supposed to work, even though <br>
-writeconfig is deprecated and I&#39;d like to remove it as soon as 6.1.<br=
>
<br>
In particular, the issue you reported below is not a bug.=C2=A0 Devices tha=
t <br>
are added after startup are considered hotplugged, and the boot index <br>
list is frozen until the next reset.=C2=A0 QMP-based configuration of <br>
coldplugged devices is in the works, but unfortunately it is not yet ready.=
<br>
<br>
Paolo<br>
<br>
&gt; Currently we are using the `-S` flag to freeze CPU at startup, then <b=
r>
&gt; using QMP to add NIC devices via the `device_add` command, and then <b=
r>
&gt; using the `cont` command to start the VM guest.<br>
&gt; <br>
&gt; This is working mostly fine, but there is one issue; the provided <br>
&gt; &quot;bootindex&quot; property is not respected.<br>
&gt; <br>
&gt; E.g.<br>
&gt; <br>
&gt; device_add <br>
&gt; {&quot;addr&quot;:&quot;00.0&quot;,&quot;bootindex&quot;:&quot;0&quot;=
,&quot;bus&quot;:&quot;qemu_pcie4&quot;,&quot;driver&quot;:&quot;virtio-net=
-pci&quot;,&quot;id&quot;:&quot;dev-lxd_eth0&quot;,&quot;mac&quot;:&quot;00=
:16:3e:0c:69:e7&quot;,&quot;mq&quot;:&quot;on&quot;,&quot;multifunction&quo=
t;:&quot;off&quot;,&quot;netdev&quot;:&quot;lxd_eth0&quot;,&quot;vectors&qu=
ot;:&quot;6&quot;}<br>
&gt; <br>
&gt; The device is seen within the VM guest and the VM BIOS, but its boot <=
br>
&gt; order is last rather than first.<br>
&gt; <br>
&gt; We&#39;ve also tried using a non-zero bootindex of 1 and that has the =
same <br>
&gt; effect.<br>
&gt; <br>
&gt; After discussions on #qemu IRC channel, we found that running <br>
&gt; `system_reset` after adding the devices allowed the `bootindex` proper=
ty <br>
&gt; to be respected.<br>
&gt; <br>
&gt; So this looks like bug. Perhaps we can discuss it in one of the <br>
&gt; forthcoming community calls?<br>
&gt; <br>
&gt; Thanks<br>
&gt; Tom Parrott<br>
<br>
</blockquote></div>

--0000000000002a9f2705c29a69fc--


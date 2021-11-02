Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B6442A72
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:35:06 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqC8-00029O-Vw
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mhqAR-0001Nu-JX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mhqAP-00018u-Dx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635845595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w4izOFJ3uKVt9w80NVoa4QN1WCGM+lZl+LS7SdTn3o0=;
 b=Ufrq3sf5IgBaxC8DOY6a13p0ikDwmRswVvTyDOFDiMkMVxQGi1BmSoN0fDfPmJSAtrKSSA
 l2mz/9iLImcNRe0wvLtj/ScFV0gMk73Fhm6OGwFV+N9lz2QoLwheEZ8cc95sG5Rv61ppKY
 TDUMxFCzbqL3Fdvp9XG1HpLupdIfi+0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-oD3lqmLiNGOe3zUUEQb9IA-1; Tue, 02 Nov 2021 05:33:13 -0400
X-MC-Unique: oD3lqmLiNGOe3zUUEQb9IA-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so18182549edl.17
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=w4izOFJ3uKVt9w80NVoa4QN1WCGM+lZl+LS7SdTn3o0=;
 b=q0ji/01cGQL+tqjPO5a4awJX7Fh9AAySPvitpUoeeXTYMH8LP6AmSqg1QwKsZrb7Wz
 Okeb10BVni8fQOEnty3XuQl3d8K0MDfLksqw0d53qiPLnbM3WfozD5tVrSrpruxB0mdQ
 th2JnYutRtBj9A/e6P6QyDjAR1WdztcfhEq+E5J0gn2oFdp129ldBPE2HX6x8YZBeAX+
 droTu87AFohhRehVKONMz+WxKGcgl1L+UXiXXjPlNAeNRjkrx0Jn6UZgBK2TvnChhuOe
 OsIWFsGjknD+UCWXLFjlur15/K9wJMrA1FHfWgdpPs2D/Bqoz3wJdCqQZfITcjq7dsuc
 lutQ==
X-Gm-Message-State: AOAM530P4cko0UJcuCk53MDagZ+qIL1c+fFlV5GXKedjnrtGdeNNvlRB
 pVADYXDACjiwLHYhGvNo8O9dFIRqHyslX1SkY9ChyHMB8O7yCxKRWcPB18QxaX5rR0oH78xvjid
 A18n6lTGEdbEyzN1yzUeYCjQLsFDLB3w=
X-Received: by 2002:a17:906:3542:: with SMTP id
 s2mr44119856eja.379.1635845592404; 
 Tue, 02 Nov 2021 02:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhRnmdEs4TYFZMdZmXvO6yiy5v/V2NkK4uEO1wVzsHtglyoDTnvYifvDMp4AG2nbtg33k4Pvrw0SQb9q1tfqU=
X-Received: by 2002:a17:906:3542:: with SMTP id
 s2mr44119808eja.379.1635845592105; 
 Tue, 02 Nov 2021 02:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com> <20210927053932-mutt-send-email-mst@kernel.org>
 <YYEDqJGe8qdKHgfh@redhat.com>
In-Reply-To: <YYEDqJGe8qdKHgfh@redhat.com>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Tue, 2 Nov 2021 11:33:01 +0200
Message-ID: <CA+aaKfC2PrzVo590xpCXwKbV9y70fQ=6AXuPb658LenMjSRTrw@mail.gmail.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006d0f5805cfcafb0a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: marcel@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d0f5805cfcafb0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Nov 2, 2021 at 11:24 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > >
> > > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > > As opposed to native PCIe hotplug, guests like Fedora 34
> > > > will not assign IO range to pcie-root-ports not supporting
> > > > native hotplug, resulting into a regression.
> > > >
> > > > Reproduce by:
> > > >     qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> > > >     device_add e1000,bus=3Dp1
> > > > In the Guest OS the respective pcie-root-port will have the IO rang=
e
> > > > disabled.
> > > >
> > > > Fix it by setting the "reserve-io" hint capability of the
> > > > pcie-root-ports so the firmware will allocate the IO range instead.
> > > >
> > > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > >
> > > This change, when combined with the switch to ACPI based hotplug by
> > > default, is responsible for a significant regression in QEMU 6.1.0
> > >
> > > It is no longer possible to have more than 15 pcie-root-port devices
> > > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+
> devices
> > > present before I stopped trying to add more.
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/issues/641
> > >
> > > This regression is significant, because it has broken the out of the
> > > box default configuration that OpenStack uses for booting all VMs.
> > > They add 16 pcie-root-ports by defalt to allow empty slots for device
> > > hotplug under q35 [1].
> >
> >
> > Indeed, oops. Thanks for the report!
>
> We're at soft freeze now and this is still broken in git master.
> I don't recall seeing a fix for this problem on list and no one has
> commented on the bug report.
>
> Is anyone actively working on a fix for this release ?
>

I think Julia (cc-ed) is working on a fix.

Thanks,
Marcel



>
> If not, I'm going to post a patch to revert to PCI native
> hotplug, because this was a significant regression in 6.1 that
> breaks openstack out of the box and we can't leave it broken
> again for 6.2.
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000006d0f5805cfcafb0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 11:24 AM=
 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrang=
e@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin wr=
ote:<br>
&gt; On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrot=
e:<br>
&gt; &gt; On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrot=
e:<br>
&gt; &gt; &gt; From: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbau=
m@gmail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Q35 has now ACPI hotplug enabled by default for PCI(e) devic=
es.<br>
&gt; &gt; &gt; As opposed to native PCIe hotplug, guests like Fedora 34<br>
&gt; &gt; &gt; will not assign IO range to pcie-root-ports not supporting<b=
r>
&gt; &gt; &gt; native hotplug, resulting into a regression.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Reproduce by:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=
=3Dp1 -monitor stdio<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0device_add e1000,bus=3Dp1<br>
&gt; &gt; &gt; In the Guest OS the respective pcie-root-port will have the =
IO range<br>
&gt; &gt; &gt; disabled.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fix it by setting the &quot;reserve-io&quot; hint capability=
 of the<br>
&gt; &gt; &gt; pcie-root-ports so the firmware will allocate the IO range i=
nstead.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Acked-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redha=
t.com" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel=
@redhat.com" target=3D"_blank">marcel@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Message-Id: &lt;<a href=3D"mailto:20210802090057.1709775-1-m=
arcel@redhat.com" target=3D"_blank">20210802090057.1709775-1-marcel@redhat.=
com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@re=
dhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@=
redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; This change, when combined with the switch to ACPI based hotplug =
by<br>
&gt; &gt; default, is responsible for a significant regression in QEMU 6.1.=
0<br>
&gt; &gt; <br>
&gt; &gt; It is no longer possible to have more than 15 pcie-root-port devi=
ces<br>
&gt; &gt; added to a q35 VM in 6.1.0.=C2=A0 Before this I&#39;ve had as man=
y as 80+ devices<br>
&gt; &gt; present before I stopped trying to add more.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/iss=
ues/641" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-proje=
ct/qemu/-/issues/641</a><br>
&gt; &gt; <br>
&gt; &gt; This regression is significant, because it has broken the out of =
the<br>
&gt; &gt; box default configuration that OpenStack uses for booting all VMs=
.<br>
&gt; &gt; They add 16 pcie-root-ports by defalt to allow empty slots for de=
vice<br>
&gt; &gt; hotplug under q35 [1].<br>
&gt; <br>
&gt; <br>
&gt; Indeed, oops. Thanks for the report!<br>
<br>
We&#39;re at soft freeze now and this is still broken in git master.<br>
I don&#39;t recall seeing a fix for this problem on list and no one has<br>
commented on the bug report.<br>
<br>
Is anyone actively working on a fix for this release ?<br></blockquote><div=
><br></div><div>I think Julia (cc-ed) is working on a fix.</div><div><br></=
div><div>Thanks,</div><div>Marcel</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If not, I&#39;m going to post a patch to revert to PCI native<br>
hotplug, because this was a significant regression in 6.1 that<br>
breaks openstack out of the box and we can&#39;t leave it broken<br>
again for 6.2.<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000006d0f5805cfcafb0a--



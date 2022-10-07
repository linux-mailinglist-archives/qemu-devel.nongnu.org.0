Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF25F7AB2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:41:54 +0200 (CEST)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpU1-0003QC-E5
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogogH-0002ef-Pp
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:50:36 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogogF-0000iy-56
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:50:29 -0400
Received: by mail-pf1-x443.google.com with SMTP id v186so5073647pfv.11
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dVMd/YGB3k7Dv5aBYYTpa+v+k8imGYYEeM/Vy9U6poc=;
 b=W4pA4aikwe+RundEDlfAURKh8f59l/g0ojkymfJMGM7oWKd2x0Ut1N+W89UFaLZ7M4
 vIK3Q6UCXxSPMmQr2Tc5DALpr59r4JIp15olpE+00x82XAWvrlSrLkj/uySmFB8ePQML
 VqqWgszl6fazz5eyI301Q3H7NReGX+IA7PvYqRMTlpyrA5OoI7TeXozeZFqvmgeRTSkB
 3PHcDXO5y2SFIXTqPPhPubsEatBlnst/abRoHZwq2wqyll9BLcIZ7hku2eA39tTekg/6
 xVhuGtlFDApXrAh6aI5aW7EYl95Y3L+olQbe3cKBn969xJhu0o2PI0Z1rQsmUC94Af/S
 02Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dVMd/YGB3k7Dv5aBYYTpa+v+k8imGYYEeM/Vy9U6poc=;
 b=ER7GtPtI0RktMcLcV/APeMiu5ZzT3ULV+h+/xGfKyOu5gSLUQw2H14Erlhj9haETLh
 a0Vc08uIsHHM0l74KifLRGdlPj10gRpi3MzphdR2xeFYvXTfsu8dE0SwxxJGIp2j5Td1
 M4HX/Ta5Lu1HRg1drNNyIKwGkveodUj6nN+JOXVf3yFzW1RSpyaceE7O63/N4d/9j+nD
 O/PjJg8jMBtCdt9foFwcv8Edoou0VvEB1/ARh2GUfWO1ypiEbk2suw7AZJzVMNTLJNeu
 +CZM7gbxdCIau8cT23i/1AvI9qAJ6a3UObckV4bJQZW6v6mo6cwqWdmP99JXjbF5qFuX
 JUdw==
X-Gm-Message-State: ACrzQf32v64imGtcS9ihMeUhKucLu60ATMVsB0Dt965qsg6d7FXUzKo1
 aMGiPs/os+mHsNEPFejeGbFecKplO5MXUQhrlQ==
X-Google-Smtp-Source: AMsMyM4tOaW87wh6DkGwDnHXoXW0T38FuOOWNq9FJW0JpTsc42YjFyxrwOal8o6820Sv2Cai38jrbGI100+Xza2sW3c=
X-Received: by 2002:a05:6a00:14d3:b0:546:e93c:4768 with SMTP id
 w19-20020a056a0014d300b00546e93c4768mr5290431pfu.36.1665154224435; Fri, 07
 Oct 2022 07:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com> <20221006095007.00001271@huawei.com>
 <Yz75ppPOwYCvNamy@fedora> <20221006174214.000059c7@huawei.com>
 <Yz8QlQ9yLFrWxWsN@fedora>
In-Reply-To: <Yz8QlQ9yLFrWxWsN@fedora>
From: Gregory Price <gourry.memverge@gmail.com>
Date: Fri, 7 Oct 2022 10:50:12 -0400
Message-ID: <CAD3UvdT1ZHJDaqj05C+n7t4rM7yhjZyM6fooXAfG12rAYnBqmw@mail.gmail.com>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org, 
 Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, 
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000000b361a05ea72eec5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=gourry.memverge@gmail.com; helo=mail-pf1-x443.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b361a05ea72eec5
Content-Type: text/plain; charset="UTF-8"

Now that i've had some time to look at the spec, the DVSEC CXL Capability
register (8.1.3.1 in 3.0 spec)
only supports enabling two HDM ranges at the moment, which to me means we
should implement

memdev0=..., memdev1=...

Yesterday I pushed a patch proposal that separated the regions into
persistent and volatile, but
i had discovered that there isn't a good way (presently) to determine of a
MemoryBacking object
is both file File-type AND has pmem=true, meaning we'd have to either
expose that interface
(this seems dubious to me) or do the following:

memdev0=mem0,memdev0-pmem=true,memdev1=mem0,memdev0-pmem=false

and then simply store a bit for each hostmem region accordingly to report
pmem/volatile.
This would allow the flexibility for the backing device to be whatever the
user wants while
still being able to mark the behavior of the type-3 device as pmem or
volatile.  Alternatively
we could make `memdev0-type=` and allow for new types in the future I
suppose.

The one thing I'm a bit confused on - the Media_type and Memory_Class
fields in the DVSEC
CXL Range registers (8.1.3.8.2).  Right now they're set to "010b" = Memory
Characteristics
are communicated via CDAT".  Do the devices presently emulate this? I'm
finding it hard to pick
apart the code to identify it.

On Thu, Oct 6, 2022 at 1:30 PM Gregory Price <gourry.memverge@gmail.com>
wrote:

> On Thu, Oct 06, 2022 at 05:42:14PM +0100, Jonathan Cameron wrote:
> > >
> > > 1) The PCI device type is set prior to realize/attributes, and is
> > > currently still set to PCI_CLASS_STORAGE_EXPRESS.  Should this instead
> > > be PCI_CLASS_MEMORY_CXL when presenting as a simple memory expander?
> >
> > We override this later in realize but indeed a bit odd that we first set
> > it to the wrong thing. I guess that is really old code.  Nice thing to
> clean up.
> > I just tried it and setting it right in the first place + dropping where
> we
> > change it later works fine.
> >
>
> I'll add it as a pullout patch ahead of my next revision.
>
> /**** snip - skipping ahead for the sake of brevity ****/
>
>
> I was unaware that an SLD could be comprised of multiple regions
> of both persistent and volatile memory.  I was under the impression that
> it could only be one type of memory.  Of course that makes sense in the
> case of a memory expander that simply lets you plug DIMMs in *facepalm*
>
> I see the reason to have separate backends in this case.
>
> The reason to allow an array of backing devices is if we believe each
> individual DIMM plugged into a memexpander is likely to show up as
> (configurably?) individual NUMA nodes, or if it's likely to get
> classified as one numa node.
>
> Maybe we should consider 2 new options:
> --persistent-memdevs=pm1 pm2 pm3
> --volatile-memdevs=vm1 vm2 vm3
>
> etc, and deprecate --memdev, and go with your array of memdevs idea.
>
> I think I could probably whip that up in a day or two.  Thoughts?
>
>
>
> > >
> > > 2) EDK2 sets the memory area as a reserved, and the memory is not
> > > configured by the system as ram.  I'm fairly sure edk2 just doesn't
> > > support this yet, but there's a chicken/egg problem.  If the device
> > > isn't there, there's nothing to test against... if there's nothing to
> > > test against, no one will write the support.  So I figure we should
> kick
> > > start the process (probably by getting it wrong on the first go
> around!)
> >
> > Yup, if the bios left it alone, OS drivers need to treat it the same as
> > they would deal with hotplugged memory.  Note my strong suspicion is
> there
> > will be host vendors who won't ever handle volatile CXL memory in
> firmware.
> > They will just let the OS bring it up after boot. As long as you have DDR
> > as well on the system that will be fine.  Means there is one code path
> > to verify rather than two.  Not everyone will care about legacy OS
> support.
> >
>
> Presently i'm failing to bring up a region of memory even when this is
> set to persistent (even on upstream configuration).  The kernel is
> presently failing to set_size because the region is used.
>
> I can't tell if this is a driver error or because EDK2 is marking the
> region as reserved.
>
> relevant boot output:
> [    0.000000] BIOS-e820: [mem 0x0000000290000000-0x000000029fffffff]
> reserved
> [    1.229097] acpi ACPI0016:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI EDR HPX-Type3]
> [    1.244082] acpi ACPI0016:00: _OSC: OS supports [CXL20PortDevRegAccess
> CXLProtocolErrorReporting CXLNativeHotPlug]
> [    1.261245] acpi ACPI0016:00: _OSC: platform does not support [LTR DPC]
> [    1.272347] acpi ACPI0016:00: _OSC: OS now controls [PCIeHotplug
> SHPCHotplug PME AER PCIeCapability]
> [    1.286092] acpi ACPI0016:00: _OSC: OS now controls
> [CXLMemErrorReporting]
>
> The device is otherwise available for use
>
> cli output
> # cxl list
> [
>   {
>     "memdev":"mem0",
>     "pmem_size":268435456,
>     "ram_size":0,
>     "serial":0,
>     "host":"0000:35:00.0"
>   }
> ]
>
> but it fails to setup correctly
>
> cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0
> cxl region: create_region: region0: set_size failed: Numerical result out
> of range
> cxl region: cmd_create_region: created 0 regions
>
> I tracked this down to this part of the kernel:
>
> kernel/resource.c
>
> static struct resource *get_free_mem_region(...)
> {
>         ... snip ...
>         enumerate regions, fail to find a useable region
>         ... snip ...
>         return ERR_PTR(-ERANGE);
> }
>
> but i'm not sure of what to do with this info.  We have some proof
> that real hardware works with this no problem, and the only difference
> is that the EFI/bios/firmware is setting the memory regions as `usable`
> or `soft reserved`, which would imply the EDK2 is the blocker here
> regardless of the OS driver status.
>
> But I'd seen elsewhere you had gotten some of this working, and I'm
> failing to get anything working at the moment.  If you have any input i
> would greatly appreciate the help.
>
> QEMU config:
>
> /opt/qemu-cxl2/bin/qemu-system-x86_64 \
> -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=d\
> -m 2G,slots=4,maxmem=4G \
> -smp 4 \
> -machine type=q35,accel=kvm,cxl=on \
> -enable-kvm \
> -nographic \
> -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> -device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> -object memory-backend-file,id=cxl-mem0,mem-path=/tmp/cxl-mem0,size=256M \
> -object memory-backend-file,id=lsa0,mem-path=/tmp/cxl-lsa0,size=256M \
> -device cxl-type3,bus=rp0,pmem=true,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 \
> -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=256M
>
> I'd seen on the lists that you had seen issues with single-rp setups,
> but no combination of configuration I've tried (including all the ones
> in the docs and tests) lead to a successful region creation with
> `cxl create-region`
>
> > >
> > > 3) Upstream linux drivers haven't touched ram configurations yet.  I
> > > just configured this with Dan Williams yesterday on IRC.  My
> > > understanding is that it's been worked on but nothing has been
> > > upstreamed, in part because there are only a very small set of devices
> > > available to developers at the moment.
> >
> > There was an offer of similar volatile memory QEMU emulation in the
> > session on QEMU CXL at Linux Plumbers.  That will look something like
> you have
> > here and maybe reflects that someone has hardware as well...
> >
>
> I saw that, and I figured I'd start the conversation by pushing
> something :].
>

--0000000000000b361a05ea72eec5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now that i&#39;ve had some time to look at the spec, the D=
VSEC CXL Capability register (8.1.3.1 in 3.0 spec)<div>only supports enabli=
ng two HDM ranges at the moment, which to me means we should implement<div>=
<br></div><div>memdev0=3D..., memdev1=3D...<br><div><br></div><div>Yesterda=
y I pushed a patch proposal that separated the regions into persistent and =
volatile, but</div></div><div>i had discovered that there isn&#39;t a good =
way (presently) to determine of a MemoryBacking object</div><div>is both fi=
le File-type AND has pmem=3Dtrue, meaning we&#39;d have to either expose th=
at interface</div><div>(this seems dubious to me) or do the following:</div=
><div><br></div><div>memdev0=3Dmem0,memdev0-pmem=3Dtrue,memdev1=3Dmem0,memd=
ev0-pmem=3Dfalse</div><div><br></div><div>and then simply store a bit for e=
ach hostmem=C2=A0region accordingly to report pmem/volatile.</div><div>This=
 would allow the flexibility for the backing device to be whatever the user=
 wants while</div><div>still being able to mark the behavior of the type-3 =
device as pmem or volatile.=C2=A0 Alternatively</div><div>we could make `me=
mdev0-type=3D` and allow for new types in the future I suppose.</div><div><=
br></div><div>The one thing I&#39;m a bit confused on - the Media_type and =
Memory_Class fields in the DVSEC<br>CXL Range registers (8.1.3.8.2).=C2=A0 =
Right now they&#39;re set to &quot;010b&quot; =3D Memory Characteristics</d=
iv></div><div>are communicated via CDAT&quot;.=C2=A0 Do the devices present=
ly emulate this? I&#39;m finding it hard to pick</div><div>apart the code t=
o identify it.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Oct 6, 2022 at 1:30 PM Gregory Price &lt;<a hre=
f=3D"mailto:gourry.memverge@gmail.com">gourry.memverge@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oct=
 06, 2022 at 05:42:14PM +0100, Jonathan Cameron wrote:<br>
&gt; &gt; <br>
&gt; &gt; 1) The PCI device type is set prior to realize/attributes, and is=
<br>
&gt; &gt; currently still set to PCI_CLASS_STORAGE_EXPRESS.=C2=A0 Should th=
is instead<br>
&gt; &gt; be PCI_CLASS_MEMORY_CXL when presenting as a simple memory expand=
er?<br>
&gt; <br>
&gt; We override this later in realize but indeed a bit odd that we first s=
et<br>
&gt; it to the wrong thing. I guess that is really old code.=C2=A0 Nice thi=
ng to clean up.<br>
&gt; I just tried it and setting it right in the first place + dropping whe=
re we<br>
&gt; change it later works fine.<br>
&gt; <br>
<br>
I&#39;ll add it as a pullout patch ahead of my next revision.<br>
<br>
/**** snip - skipping ahead for the sake of brevity ****/<br>
<br>
<br>
I was unaware that an SLD could be comprised of multiple regions<br>
of both persistent and volatile memory.=C2=A0 I was under the impression th=
at<br>
it could only be one type of memory.=C2=A0 Of course that makes sense in th=
e<br>
case of a memory expander that simply lets you plug DIMMs in *facepalm*<br>
<br>
I see the reason to have separate backends in this case.<br>
<br>
The reason to allow an array of backing devices is if we believe each<br>
individual DIMM plugged into a memexpander is likely to show up as<br>
(configurably?) individual NUMA nodes, or if it&#39;s likely to get<br>
classified as one numa node.<br>
<br>
Maybe we should consider 2 new options:<br>
--persistent-memdevs=3Dpm1 pm2 pm3<br>
--volatile-memdevs=3Dvm1 vm2 vm3<br>
<br>
etc, and deprecate --memdev, and go with your array of memdevs idea.<br>
<br>
I think I could probably whip that up in a day or two.=C2=A0 Thoughts?<br>
<br>
<br>
<br>
&gt; &gt; <br>
&gt; &gt; 2) EDK2 sets the memory area as a reserved, and the memory is not=
<br>
&gt; &gt; configured by the system as ram.=C2=A0 I&#39;m fairly sure edk2 j=
ust doesn&#39;t<br>
&gt; &gt; support this yet, but there&#39;s a chicken/egg problem.=C2=A0 If=
 the device<br>
&gt; &gt; isn&#39;t there, there&#39;s nothing to test against... if there&=
#39;s nothing to<br>
&gt; &gt; test against, no one will write the support.=C2=A0 So I figure we=
 should kick<br>
&gt; &gt; start the process (probably by getting it wrong on the first go a=
round!)<br>
&gt; <br>
&gt; Yup, if the bios left it alone, OS drivers need to treat it the same a=
s<br>
&gt; they would deal with hotplugged memory.=C2=A0 Note my strong suspicion=
 is there<br>
&gt; will be host vendors who won&#39;t ever handle volatile CXL memory in =
firmware.<br>
&gt; They will just let the OS bring it up after boot. As long as you have =
DDR<br>
&gt; as well on the system that will be fine.=C2=A0 Means there is one code=
 path<br>
&gt; to verify rather than two.=C2=A0 Not everyone will care about legacy O=
S support.<br>
&gt; <br>
<br>
Presently i&#39;m failing to bring up a region of memory even when this is<=
br>
set to persistent (even on upstream configuration).=C2=A0 The kernel is<br>
presently failing to set_size because the region is used.<br>
<br>
I can&#39;t tell if this is a driver error or because EDK2 is marking the<b=
r>
region as reserved.<br>
<br>
relevant boot output:<br>
[=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000290000000-0x000000029ffff=
fff] reserved<br>
[=C2=A0 =C2=A0 1.229097] acpi ACPI0016:00: _OSC: OS supports [ExtendedConfi=
g ASPM ClockPM Segments MSI EDR HPX-Type3]<br>
[=C2=A0 =C2=A0 1.244082] acpi ACPI0016:00: _OSC: OS supports [CXL20PortDevR=
egAccess CXLProtocolErrorReporting CXLNativeHotPlug]<br>
[=C2=A0 =C2=A0 1.261245] acpi ACPI0016:00: _OSC: platform does not support =
[LTR DPC]<br>
[=C2=A0 =C2=A0 1.272347] acpi ACPI0016:00: _OSC: OS now controls [PCIeHotpl=
ug SHPCHotplug PME AER PCIeCapability]<br>
[=C2=A0 =C2=A0 1.286092] acpi ACPI0016:00: _OSC: OS now controls [CXLMemErr=
orReporting]<br>
<br>
The device is otherwise available for use<br>
<br>
cli output<br>
# cxl list<br>
[<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 &quot;memdev&quot;:&quot;mem0&quot;,<br>
=C2=A0 =C2=A0 &quot;pmem_size&quot;:268435456,<br>
=C2=A0 =C2=A0 &quot;ram_size&quot;:0,<br>
=C2=A0 =C2=A0 &quot;serial&quot;:0,<br>
=C2=A0 =C2=A0 &quot;host&quot;:&quot;0000:35:00.0&quot;<br>
=C2=A0 }<br>
]<br>
<br>
but it fails to setup correctly<br>
<br>
cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0<br>
cxl region: create_region: region0: set_size failed: Numerical result out o=
f range<br>
cxl region: cmd_create_region: created 0 regions<br>
<br>
I tracked this down to this part of the kernel:<br>
<br>
kernel/resource.c<br>
<br>
static struct resource *get_free_mem_region(...)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... snip ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enumerate regions, fail to find a useable regio=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... snip ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ERANGE);<br>
}<br>
<br>
but i&#39;m not sure of what to do with this info.=C2=A0 We have some proof=
<br>
that real hardware works with this no problem, and the only difference<br>
is that the EFI/bios/firmware is setting the memory regions as `usable`<br>
or `soft reserved`, which would imply the EDK2 is the blocker here<br>
regardless of the OS driver status.<br>
<br>
But I&#39;d seen elsewhere you had gotten some of this working, and I&#39;m=
<br>
failing to get anything working at the moment.=C2=A0 If you have any input =
i<br>
would greatly appreciate the help.<br>
<br>
QEMU config:<br>
<br>
/opt/qemu-cxl2/bin/qemu-system-x86_64 \<br>
-drive file=3D/var/lib/libvirt/images/cxl.qcow2,format=3Dqcow2,index=3D0,me=
dia=3Dd\<br>
-m 2G,slots=3D4,maxmem=3D4G \<br>
-smp 4 \<br>
-machine type=3Dq35,accel=3Dkvm,cxl=3Don \<br>
-enable-kvm \<br>
-nographic \<br>
-device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 \<br>
-device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,slot=3D0 \<br>
-object memory-backend-file,id=3Dcxl-mem0,mem-path=3D/tmp/cxl-mem0,size=3D2=
56M \<br>
-object memory-backend-file,id=3Dlsa0,mem-path=3D/tmp/cxl-lsa0,size=3D256M =
\<br>
-device cxl-type3,bus=3Drp0,pmem=3Dtrue,memdev=3Dcxl-mem0,lsa=3Dlsa0,id=3Dc=
xl-pmem0 \<br>
-M cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.size=3D256M<br>
<br>
I&#39;d seen on the lists that you had seen issues with single-rp setups,<b=
r>
but no combination of configuration I&#39;ve tried (including all the ones<=
br>
in the docs and tests) lead to a successful region creation with<br>
`cxl create-region`<br>
<br>
&gt; &gt; <br>
&gt; &gt; 3) Upstream linux drivers haven&#39;t touched ram configurations =
yet.=C2=A0 I<br>
&gt; &gt; just configured this with Dan Williams yesterday on IRC.=C2=A0 My=
<br>
&gt; &gt; understanding is that it&#39;s been worked on but nothing has bee=
n<br>
&gt; &gt; upstreamed, in part because there are only a very small set of de=
vices<br>
&gt; &gt; available to developers at the moment.<br>
&gt; <br>
&gt; There was an offer of similar volatile memory QEMU emulation in the<br=
>
&gt; session on QEMU CXL at Linux Plumbers.=C2=A0 That will look something =
like you have<br>
&gt; here and maybe reflects that someone has hardware as well...<br>
&gt; <br>
<br>
I saw that, and I figured I&#39;d start the conversation by pushing<br>
something :].<br>
</blockquote></div>

--0000000000000b361a05ea72eec5--


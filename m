Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2C2B672C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:14:51 +0100 (CET)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1kw-0007ns-60
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuohfjack@gmail.com>)
 id 1kes0F-0005UB-3L; Mon, 16 Nov 2020 22:49:59 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kuohfjack@gmail.com>)
 id 1kes0C-0004yQ-GY; Mon, 16 Nov 2020 22:49:58 -0500
Received: by mail-lf1-f54.google.com with SMTP id a9so27209296lfh.2;
 Mon, 16 Nov 2020 19:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44PhJeniDWEAb9dQPnK9Pv4ZdFtnypy+MuctGuOf1FM=;
 b=WAeL2SeQUeJNfbkUJFDhV+hVBE9blllI8PiWgfIx5u5MiwD7CAbsFx84fQhjgCxlhA
 OxtRpZ+LiUMUsbWCjxCGlNNfhhzMUxzZTwg+ilVCfg8tx8h1pQqdIihd94Qmbq8b/TxZ
 8trYYCrP6pNrijxjglJhBNHWGI85Lu618go12zaDIVt2Z8U3R56Eo3KdpjydF1/uQiFK
 T+s9i+ZCanMNjZTOXgCLBC3KpndmH33iGZkGuR8Ud9Kqhh6I6hU1o1L8xBVgqoEQD/9w
 84hv3c/0Y+TMOUVvpJi5uRXnhaKIa05YFPf6bsaNkyZefs5qwLfdCNkHP6xoBou7AYgr
 MksA==
X-Gm-Message-State: AOAM5324reLQIKN231ZJ5YHAG1REaIaRHucy4YmRNFhwksajvSiCaQHt
 v3xsVwDLHsKVvIMauO+8EQ+yGnSOXQxAMXpJ
X-Google-Smtp-Source: ABdhPJw92aP6Qd/HI5JVMTb1LzhZDpuy+ABgMo+/iqqDO/vgGgKIs2GcQMk2uxH5sIx3pJRs0tSBmQ==
X-Received: by 2002:a19:2489:: with SMTP id k131mr915919lfk.459.1605584990841; 
 Mon, 16 Nov 2020 19:49:50 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id m6sm341723ljp.70.2020.11.16.19.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 19:49:50 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id b17so22659122ljf.12;
 Mon, 16 Nov 2020 19:49:50 -0800 (PST)
X-Received: by 2002:a2e:61a:: with SMTP id 26mr1036082ljg.35.1605584990190;
 Mon, 16 Nov 2020 19:49:50 -0800 (PST)
MIME-Version: 1.0
References: <69ce94c221fc90c6963c3529ddc46e66@m108.nthu.edu.tw>
 <1547b1c8-36e2-179e-8406-4faf0324f4f2@redhat.com>
 <20201116190221.GA1235237@habkost.net>
In-Reply-To: <20201116190221.GA1235237@habkost.net>
From: =?UTF-8?B?6YOt5L+K55SrIChKYWNrIEt1byk=?= <jackkuo@jackkuo.org>
Date: Tue, 17 Nov 2020 11:49:38 +0800
X-Gmail-Original-Message-ID: <CALen4BRv-FUnD0P7bMS0bKhZ9uZoSVawa2xvO5Ncb70Z7npJbw@mail.gmail.com>
Message-ID: <CALen4BRv-FUnD0P7bMS0bKhZ9uZoSVawa2xvO5Ncb70Z7npJbw@mail.gmail.com>
Subject: Re: Property '.hmat' not found
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ff42b105b44562b4"
Received-SPF: pass client-ip=209.85.167.54; envelope-from=kuohfjack@gmail.com;
 helo=mail-lf1-f54.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 22:49:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Nov 2020 09:12:24 -0500
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-discuss@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jack <s108062518@m108.nthu.edu.tw>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff42b105b44562b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Do you have the output of `qemu-system-x86_64 -version`, and more
> information on how your binary was built?


I have 2 machines, both of them encounter the .hmat problem.

(1) *5.1.90 (v5.2.0-rc0*)
    - follow this wiki [1], and configure cmd: `./configure
--target-list=3Dx86_64-softmmu`
    - i5-8400, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic

(2) *4.2.1 (Debian 1:4.2-3ubuntu6.8)*
    - use apt install qemu
    - E5-2670 * 2, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic, Dell
PowerEdge-R720

I can't reproduce it here.  I've tested both qemu.git master


That=E2=80=99s strange, also I try the command you (Eduardo) provided, '.hm=
at' not
found, too.
Does the kernel module matter? or PC architecture?

Output of `-machine help` and `-machine pc,help` would be useful
> to debug it, too.


 (1) *5.1.90 (i5-8400)*
*```*
$ qemu-system-x86_64 -machine pc,help
pc-i440fx-5.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid valu=
es
are cpu, mem-ctrl)
pc-i440fx-5.2.hmat=3Dbool (Set on/off to enable/disable ACPI Heterogeneous
Memory Attribute Table (HMAT))
pc-i440fx-5.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM
instantiation)
pc-i440fx-5.2.pcspk-audiodev=3Dstr (ID of an audiodev to use as a backend)
pc-i440fx-5.2.pflash1=3Dstr (Node name or ID of a block device to use as a
backend)
pc-i440fx-5.2.pflash0=3Dstr (Node name or ID of a block device to use as a
backend)
pc-i440fx-5.2.hpet=3Dbool
pc-i440fx-5.2.vmport=3DOnOffAuto (Enable vmport (pc & q35))
pc-i440fx-5.2.sata=3Dbool
pc-i440fx-5.2.pit=3Dbool
pc-i440fx-5.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G boundary
(32bit boundary))
pc-i440fx-5.2.smbus=3Dbool
pc-i440fx-5.2.acpi=3DOnOffAuto (Enable ACPI)
pc-i440fx-5.2.smm=3DOnOffAuto (Enable SMM)
pc-i440fx-5.2.memory-backend=3Dstring (Set RAM backendValid value is ID of
hostmem based backend)
pc-i440fx-5.2.firmware=3Dstring (Firmware image)
pc-i440fx-5.2.initrd=3Dstring (Linux initial ramdisk file)
pc-i440fx-5.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)
pc-i440fx-5.2.kernel=3Dstring (Linux kernel image file)
pc-i440fx-5.2.dt-compatible=3Dstring (Overrides the "compatible" property o=
f
the dt root node)
pc-i440fx-5.2.mem-merge=3Dbool (Enable/disable memory merge support)
pc-i440fx-5.2.suppress-vmdesc=3Dbool (Set on to disable self-describing
migration)
pc-i440fx-5.2.append=3Dstring (Linux kernel command line)
pc-i440fx-5.2.dump-guest-core=3Dbool (Include guest memory in a core dump)
pc-i440fx-5.2.phandle-start=3Dint (The first phandle ID we may generate
dynamically)
pc-i440fx-5.2.usb=3Dbool (Set on/off to enable/disable usb)
pc-i440fx-5.2.dtb=3Dstring (Linux kernel device tree file)
pc-i440fx-5.2.memory-encryption=3Dstring (Set memory encryption object to u=
se)
pc-i440fx-5.2.graphics=3Dbool (Set on/off to enable/disable graphics
emulation)
```

(2) *4.2.1 (E5-2670 * 2)*
*```*
qemu-system-x86_64 -machine pc,help
pc-i440fx-4.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid valu=
es
are cpu, mem-ctrl)
pc-i440fx-4.2.pflash0=3Dstr (Node name or ID of a block device to use as a
backend)
pc-i440fx-4.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM
instantiation)
pc-i440fx-4.2.pflash1=3Dstr (Node name or ID of a block device to use as a
backend)
pc-i440fx-4.2.vmport=3DOnOffAuto (Enable vmport (pc & q35))
pc-i440fx-4.2.sata=3Dbool
pc-i440fx-4.2.pit=3Dbool
pc-i440fx-4.2.smm=3DOnOffAuto (Enable SMM (pc & q35))
pc-i440fx-4.2.smbus=3Dbool
pc-i440fx-4.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G boundary
(32bit boundary))
pc-i440fx-4.2.suppress-vmdesc=3Dbool (Set on to disable self-describing
migration)
pc-i440fx-4.2.append=3Dstring (Linux kernel command line)
pc-i440fx-4.2.accel=3Dstring (Accelerator list)
pc-i440fx-4.2.dtb=3Dstring (Linux kernel device tree file)
pc-i440fx-4.2.mem-merge=3Dbool (Enable/disable memory merge support)
pc-i440fx-4.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)
pc-i440fx-4.2.phandle-start=3Dint (The first phandle ID we may generate
dynamically)
pc-i440fx-4.2.igd-passthru=3Dbool (Set on/off to enable/disable igd passthr=
ou)
pc-i440fx-4.2.kvm-shadow-mem=3Dint (KVM shadow MMU size)
pc-i440fx-4.2.dump-guest-core=3Dbool (Include guest memory in a core dump)
pc-i440fx-4.2.memory-encryption=3Dstring (Set memory encryption object to u=
se)
pc-i440fx-4.2.firmware=3Dstring (Firmware image)
pc-i440fx-4.2.usb=3Dbool (Set on/off to enable/disable usb)
pc-i440fx-4.2.kernel-irqchip=3Don|off|split (Configure KVM in-kernel irqchi=
p)
pc-i440fx-4.2.graphics=3Dbool (Set on/off to enable/disable graphics
emulation)
pc-i440fx-4.2.initrd=3Dstring (Linux initial ramdisk file)
pc-i440fx-4.2.dt-compatible=3Dstring (Overrides the "compatible" property o=
f
the dt root node)
pc-i440fx-4.2.kernel=3Dstring (Linux kernel image file)
pc-i440fx-4.2.enforce-config-section=3Dbool (Set on to enforce configuratio=
n
section migration)
```

[1] https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux

Sincerely,
Jack

Eduardo Habkost <ehabkost@redhat.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Mon, Nov 16, 2020 at 01:51:37PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Cc'ing Igor & Eduardo.
>
> Thanks!
>
> >
> > On 11/13/20 10:17 AM, Jack wrote:
> > > Hi all,
> > >
> > > As I follow the document[1] to enable hmat, it fails and shows the
> message:
> > >   qemu-system-x86_64: Property '.hmat' not found
> > >
> > > My QEMU version is 5.1.90
>
> Do you have the output of `qemu-system-x86_64 -version`, and more
> information on how your binary was built?
>
> Output of `-machine help` and `-machine pc,help` would be useful
> to debug it, too.
>
> I can't reproduce it here.  I've tested both qemu.git master
> (commit cb5ed407a1dd) and v5.2.0-rc (commit 3d6e32347a3b).
>
>   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -version
>   QEMU emulator version 5.1.91 (v5.2.0-rc1-107-gcb5ed407a1)
>   Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
>   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -machine hmat=3Don -m 2G
> -object memory-backend-ram,size=3D1G,id=3Dm0 -object
> memory-backend-ram,size=3D1G,id=3Dm1 -smp 2 -numa node,nodeid=3D0,memdev=
=3Dm0 -numa
> node,nodeid=3D1,memdev=3Dm1,initiator=3D0 -numa cpu ,node-id=3D0,socket-i=
d=3D0 -numa
> cpu,node-id=3D0,socket-id=3D1 -numa
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D5
> -numa
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D200M
> -numa
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D10
> -numa
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D100M
> -numa
> hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> -numa
> hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> -cpu host -vga virtio -accel kvm
>   [VM boots]
>
>
> > >
> > > Does anyone know why?
> > >
> > > Here is my command:
> > >
> > > ```
> > > $ sudo qemu-system-x86_64 \
> > > -machine hmat=3Don \
> > > -m 2G \
> > > -object memory-backend-ram,size=3D1G,id=3Dm0 \
> > > -object memory-backend-ram,size=3D1G,id=3Dm1 \
> > > -smp 2 \
> > > -numa node,nodeid=3D0,memdev=3Dm0 \
> > > -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \
> > > -numa cpu,node-id=3D0,socket-id=3D0 \
> > > -numa cpu,node-id=3D0,socket-id=3D1 \
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D5
> > > \
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D200M
> > > \
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D10
> > > \
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D100M
> > > \
> > > -numa
> > >
> hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > \
> > > -numa
> > >
> hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > \
> > > -cpu host \
> > > -m 4g -vga virtio -hda ubuntu20.04.qcow2 \
> > > -nic user,model=3Dvirtio \
> > > -nic tap,model=3De1000 \
> > > -nic tap,model=3De1000 \
> > > -accel kvm
> > > ```
> > >
> > > Thanks.
> > >
> > > [1]
> > >
> https://www.qemu.org/docs/master/system/qemu-manpage.html?highlight=3Dnum=
a
> > >
> > >
> > > Sincerely,
> > > Jack
> > >
> >
>
> --
> Eduardo
>
>

--000000000000ff42b105b44562b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex">Do you have the output of `qemu-system-x86_64 -version`, and more<br>=
information on how your binary was built?</blockquote><div><br></div><div>I=
 have 2 machines, both of them encounter the .hmat problem.</div><div><br><=
/div><div>(1) <b>5.1.90 (v5.2.0-rc0</b>)<br></div><div>=C2=A0 =C2=A0 -=C2=
=A0follow this wiki [1], and configure cmd: `./configure --target-list=3Dx8=
6_64-softmmu`</div><div>=C2=A0 =C2=A0 - i5-8400, Ubuntu 20.04.1 LTS, kernel=
: 5.4.0-53-generic</div><div><br></div><div>(2) <b>4.2.1 (Debian 1:4.2-3ubu=
ntu6.8)</b></div><div>=C2=A0 =C2=A0 - use apt install qemu</div><div>=C2=A0=
 =C2=A0 -=C2=A0E5-2670 * 2,=C2=A0Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-gener=
ic, Dell PowerEdge-R720</div><div><br></div><div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">I can&#39=
;t reproduce it here.=C2=A0 I&#39;ve tested both qemu.git master</blockquot=
e></div><div><br></div><div>That=E2=80=99s strange, also I try the command =
you (Eduardo) provided, &#39;.hmat&#39; not found, too.</div><div>Does the =
kernel module=C2=A0matter? or PC architecture?</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex">Output of `-machine help` and `-machine pc,help` would be useful<b=
r>to debug it, too.</blockquote><div><br></div><div>=C2=A0(1) <b>5.1.90 (i5=
-8400)</b></div><div><b>```</b></div><div><div>$ qemu-system-x86_64 -machin=
e pc,help</div><div>pc-i440fx-5.2.nvdimm-persistence=3Dstring (Set NVDIMM p=
ersistenceValid values are cpu, mem-ctrl)</div><div>pc-i440fx-5.2.hmat=3Dbo=
ol (Set on/off to enable/disable ACPI Heterogeneous Memory Attribute Table =
(HMAT))</div><div>pc-i440fx-5.2.nvdimm=3Dbool (Set on/off to enable/disable=
 NVDIMM instantiation)</div><div>pc-i440fx-5.2.pcspk-audiodev=3Dstr (ID of =
an audiodev to use as a backend)</div><div>pc-i440fx-5.2.pflash1=3Dstr (Nod=
e name or ID of a block device to use as a backend)</div><div>pc-i440fx-5.2=
.pflash0=3Dstr (Node name or ID of a block device to use as a backend)</div=
><div>pc-i440fx-5.2.hpet=3Dbool</div><div>pc-i440fx-5.2.vmport=3DOnOffAuto =
(Enable vmport (pc &amp; q35))</div><div>pc-i440fx-5.2.sata=3Dbool</div><di=
v>pc-i440fx-5.2.pit=3Dbool</div><div>pc-i440fx-5.2.max-ram-below-4g=3Dsize =
(Maximum ram below the 4G boundary (32bit boundary))</div><div>pc-i440fx-5.=
2.smbus=3Dbool</div><div>pc-i440fx-5.2.acpi=3DOnOffAuto (Enable ACPI)</div>=
<div>pc-i440fx-5.2.smm=3DOnOffAuto (Enable SMM)</div><div>pc-i440fx-5.2.mem=
ory-backend=3Dstring (Set RAM backendValid value is ID of hostmem based bac=
kend)</div><div>pc-i440fx-5.2.firmware=3Dstring (Firmware image)</div><div>=
pc-i440fx-5.2.initrd=3Dstring (Linux initial ramdisk file)</div><div>pc-i44=
0fx-5.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)</div><div>pc=
-i440fx-5.2.kernel=3Dstring (Linux kernel image file)</div><div>pc-i440fx-5=
.2.dt-compatible=3Dstring (Overrides the &quot;compatible&quot; property of=
 the dt root node)</div><div>pc-i440fx-5.2.mem-merge=3Dbool (Enable/disable=
 memory merge support)</div><div>pc-i440fx-5.2.suppress-vmdesc=3Dbool (Set =
on to disable self-describing migration)</div><div>pc-i440fx-5.2.append=3Ds=
tring (Linux kernel command line)</div><div>pc-i440fx-5.2.dump-guest-core=
=3Dbool (Include guest memory in a core dump)</div><div>pc-i440fx-5.2.phand=
le-start=3Dint (The first phandle ID we may generate dynamically)</div><div=
>pc-i440fx-5.2.usb=3Dbool (Set on/off to enable/disable usb)</div><div>pc-i=
440fx-5.2.dtb=3Dstring (Linux kernel device tree file)</div><div>pc-i440fx-=
5.2.memory-encryption=3Dstring (Set memory encryption object to use)</div><=
div>pc-i440fx-5.2.graphics=3Dbool (Set on/off to enable/disable graphics em=
ulation)</div></div><div>```</div><div><br></div><div>(2)=C2=A0<b>4.2.1 (E5=
-2670 * 2)</b></div><div><b>```</b></div><div><div>qemu-system-x86_64 -mach=
ine pc,help</div><div>pc-i440fx-4.2.nvdimm-persistence=3Dstring (Set NVDIMM=
 persistenceValid values are cpu, mem-ctrl)</div><div>pc-i440fx-4.2.pflash0=
=3Dstr (Node name or ID of a block device to use as a backend)</div><div>pc=
-i440fx-4.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM instantiatio=
n)</div><div>pc-i440fx-4.2.pflash1=3Dstr (Node name or ID of a block device=
 to use as a backend)</div><div>pc-i440fx-4.2.vmport=3DOnOffAuto (Enable vm=
port (pc &amp; q35))</div><div>pc-i440fx-4.2.sata=3Dbool</div><div>pc-i440f=
x-4.2.pit=3Dbool</div><div>pc-i440fx-4.2.smm=3DOnOffAuto (Enable SMM (pc &a=
mp; q35))</div><div>pc-i440fx-4.2.smbus=3Dbool</div><div>pc-i440fx-4.2.max-=
ram-below-4g=3Dsize (Maximum ram below the 4G boundary (32bit boundary))</d=
iv><div>pc-i440fx-4.2.suppress-vmdesc=3Dbool (Set on to disable self-descri=
bing migration)</div><div>pc-i440fx-4.2.append=3Dstring (Linux kernel comma=
nd line)</div><div>pc-i440fx-4.2.accel=3Dstring (Accelerator list)</div><di=
v>pc-i440fx-4.2.dtb=3Dstring (Linux kernel device tree file)</div><div>pc-i=
440fx-4.2.mem-merge=3Dbool (Enable/disable memory merge support)</div><div>=
pc-i440fx-4.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)</div><=
div>pc-i440fx-4.2.phandle-start=3Dint (The first phandle ID we may generate=
 dynamically)</div><div>pc-i440fx-4.2.igd-passthru=3Dbool (Set on/off to en=
able/disable igd passthrou)</div><div>pc-i440fx-4.2.kvm-shadow-mem=3Dint (K=
VM shadow MMU size)</div><div>pc-i440fx-4.2.dump-guest-core=3Dbool (Include=
 guest memory in a core dump)</div><div>pc-i440fx-4.2.memory-encryption=3Ds=
tring (Set memory encryption object to use)</div><div>pc-i440fx-4.2.firmwar=
e=3Dstring (Firmware image)</div><div>pc-i440fx-4.2.usb=3Dbool (Set on/off =
to enable/disable usb)</div><div>pc-i440fx-4.2.kernel-irqchip=3Don|off|spli=
t (Configure KVM in-kernel irqchip)</div><div>pc-i440fx-4.2.graphics=3Dbool=
 (Set on/off to enable/disable graphics emulation)</div><div>pc-i440fx-4.2.=
initrd=3Dstring (Linux initial ramdisk file)</div><div>pc-i440fx-4.2.dt-com=
patible=3Dstring (Overrides the &quot;compatible&quot; property of the dt r=
oot node)</div><div>pc-i440fx-4.2.kernel=3Dstring (Linux kernel image file)=
</div><div>pc-i440fx-4.2.enforce-config-section=3Dbool (Set on to enforce c=
onfiguration section migration)</div></div><div>```</div><div><br></div><di=
v>[1]=C2=A0<a href=3D"https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_L=
inux">https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux</a></div><d=
iv><br></div><div>Sincerely,</div><div>Jack</div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; =E6=96=BC 2020=E5=B9=B411=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=
=B8=8A=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
On Mon, Nov 16, 2020 at 01:51:37PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:<br>
&gt; Cc&#39;ing Igor &amp; Eduardo.<br>
<br>
Thanks!<br>
<br>
&gt; <br>
&gt; On 11/13/20 10:17 AM, Jack wrote:<br>
&gt; &gt; Hi all,<br>
&gt; &gt; <br>
&gt; &gt; As I follow the document[1] to enable hmat, it fails and shows th=
e message:<br>
&gt; &gt; =C2=A0 qemu-system-x86_64: Property &#39;.hmat&#39; not found<br>
&gt; &gt; <br>
&gt; &gt; My QEMU version is 5.1.90<br>
<br>
Do you have the output of `qemu-system-x86_64 -version`, and more<br>
information on how your binary was built?<br>
<br>
Output of `-machine help` and `-machine pc,help` would be useful<br>
to debug it, too.<br>
<br>
I can&#39;t reproduce it here.=C2=A0 I&#39;ve tested both qemu.git master<b=
r>
(commit cb5ed407a1dd) and v5.2.0-rc (commit 3d6e32347a3b).<br>
<br>
=C2=A0 [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -version<br>
=C2=A0 QEMU emulator version 5.1.91 (v5.2.0-rc1-107-gcb5ed407a1)<br>
=C2=A0 Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project develop=
ers<br>
=C2=A0 [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -machine hmat=3Don -m =
2G -object memory-backend-ram,size=3D1G,id=3Dm0 -object memory-backend-ram,=
size=3D1G,id=3Dm1 -smp 2 -numa node,nodeid=3D0,memdev=3Dm0 -numa node,nodei=
d=3D1,memdev=3Dm1,initiator=3D0 -numa cpu ,node-id=3D0,socket-id=3D0 -numa =
cpu,node-id=3D0,socket-id=3D1 -numa hmat-lb,initiator=3D0,target=3D0,hierar=
chy=3Dmemory,data-type=3Daccess-latency,latency=3D5 -numa hmat-lb,initiator=
=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-bandwidth,bandwidth=
=3D200M -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D10 -numa hmat-lb,initiator=3D0,target=3D1,hiera=
rchy=3Dmemory,data-type=3Daccess-bandwidth,bandwidth=3D100M -numa hmat-cach=
e,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,policy=3Dwrite-ba=
ck,line=3D8 -numa hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=
=3Ddirect,policy=3Dwrite-back,line=3D8 -cpu host -vga virtio -accel kvm<br>
=C2=A0 [VM boots]<br>
<br>
<br>
&gt; &gt; <br>
&gt; &gt; Does anyone know why?<br>
&gt; &gt; <br>
&gt; &gt; Here is my command:<br>
&gt; &gt; <br>
&gt; &gt; ```<br>
&gt; &gt; $ sudo qemu-system-x86_64 \<br>
&gt; &gt; -machine hmat=3Don \<br>
&gt; &gt; -m 2G \<br>
&gt; &gt; -object memory-backend-ram,size=3D1G,id=3Dm0 \<br>
&gt; &gt; -object memory-backend-ram,size=3D1G,id=3Dm1 \<br>
&gt; &gt; -smp 2 \<br>
&gt; &gt; -numa node,nodeid=3D0,memdev=3Dm0 \<br>
&gt; &gt; -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \<br>
&gt; &gt; -numa cpu,node-id=3D0,socket-id=3D0 \<br>
&gt; &gt; -numa cpu,node-id=3D0,socket-id=3D1 \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D5<br>
&gt; &gt; \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D200M<br>
&gt; &gt; \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10<br>
&gt; &gt; \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D100M<br>
&gt; &gt; \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; \<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; \<br>
&gt; &gt; -cpu host \<br>
&gt; &gt; -m 4g -vga virtio -hda ubuntu20.04.qcow2 \<br>
&gt; &gt; -nic user,model=3Dvirtio \<br>
&gt; &gt; -nic tap,model=3De1000 \<br>
&gt; &gt; -nic tap,model=3De1000 \<br>
&gt; &gt; -accel kvm<br>
&gt; &gt; ```<br>
&gt; &gt; <br>
&gt; &gt; Thanks.<br>
&gt; &gt; <br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://www.qemu.org/docs/master/system/qemu-manpage.h=
tml?highlight=3Dnuma" rel=3D"noreferrer" target=3D"_blank">https://www.qemu=
.org/docs/master/system/qemu-manpage.html?highlight=3Dnuma</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Sincerely,<br>
&gt; &gt; Jack<br>
&gt; &gt; <br>
&gt; <br>
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div>

--000000000000ff42b105b44562b4--


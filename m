Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3D2B7B08
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:18:05 +0100 (CET)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKXM-000711-EH
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuohfjack@gmail.com>)
 id 1kfKWG-0006Bg-1Z; Wed, 18 Nov 2020 05:16:56 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:36914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kuohfjack@gmail.com>)
 id 1kfKWD-0003Mc-3X; Wed, 18 Nov 2020 05:16:55 -0500
Received: by mail-lj1-f176.google.com with SMTP id l10so1734343lji.4;
 Wed, 18 Nov 2020 02:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyIeNSY2fSRqTIImpdB9jsp7kis6IpLrUL/OZfYNTW0=;
 b=Ha88dxaPJPgWOYTSQNCAuxU6CUWnotRY1NcIPKKglge3L+sSFXZgl8aqzM52ntpnMY
 nc+ZEkZQ3EwDIcxvQLhSjjmnUVeah4LVuShAp9xz6JDNC8hi/OX6VCXX0oPNdmUXwUhW
 HMPwRCKVI5zrpa3K1f7LhOuihCOTUMHU0FuufXToYj/DmWMScbm1mStd8c5aWYl1o2mV
 tOyn28MHYSd8YcT/3KYX+IJGeTp9IrdT0YyLIj1jyJq6Ue54HeknFNOqHBzbNfuJVls6
 zZc06Kw31guAPkYYS+3DNkiiGCraSfr+hzc829iCtCbtHIFnY9Za+m0VwNnBguNY9D/x
 VjBQ==
X-Gm-Message-State: AOAM533Vk1XYiBMkFj0AkKdT8vIFb9dIKugeO84D1cBm6hZsK9j6DgwO
 XmS6iGHf9f9pWwUElu/qEc8xp61UhrxpUi2B
X-Google-Smtp-Source: ABdhPJzVaKH6063Z2WupVY+iDXsB0e8XnNfmo3zMpUtEcxQ2WPW1o/4c+McoTutuOfwAvSEClhpTfA==
X-Received: by 2002:a2e:87cd:: with SMTP id v13mr3477862ljj.399.1605694609478; 
 Wed, 18 Nov 2020 02:16:49 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id d12sm3206039lfa.22.2020.11.18.02.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:16:49 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id e139so2192808lfd.1;
 Wed, 18 Nov 2020 02:16:48 -0800 (PST)
X-Received: by 2002:ac2:5092:: with SMTP id f18mr3366753lfm.440.1605694608561; 
 Wed, 18 Nov 2020 02:16:48 -0800 (PST)
MIME-Version: 1.0
References: <69ce94c221fc90c6963c3529ddc46e66@m108.nthu.edu.tw>
 <1547b1c8-36e2-179e-8406-4faf0324f4f2@redhat.com>
 <20201116190221.GA1235237@habkost.net>
 <CALen4BRv-FUnD0P7bMS0bKhZ9uZoSVawa2xvO5Ncb70Z7npJbw@mail.gmail.com>
 <20201117150934.GF1235237@habkost.net>
In-Reply-To: <20201117150934.GF1235237@habkost.net>
From: =?UTF-8?B?6YOt5L+K55SrIChKYWNrIEt1byk=?= <jackkuo@jackkuo.org>
Date: Wed, 18 Nov 2020 18:16:36 +0800
X-Gmail-Original-Message-ID: <CALen4BRisWKbaV8pqSE5F48JR15zeuL5Dqh42J6UrzHxHLpv6w@mail.gmail.com>
Message-ID: <CALen4BRisWKbaV8pqSE5F48JR15zeuL5Dqh42J6UrzHxHLpv6w@mail.gmail.com>
Subject: Re: Property '.hmat' not found
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c2dad105b45ee886"
Received-SPF: pass client-ip=209.85.208.176; envelope-from=kuohfjack@gmail.com;
 helo=mail-lj1-f176.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 05:16:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-discuss@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jack <s108062518@m108.nthu.edu.tw>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2dad105b45ee886
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Could you check what happens if you use
> "-machine pc-i440fx-5.2,hmat=3Don" instead of "-machine hmat=3Don"?


It failed, but `-machine pc-i440fx-4.2` worked without `hmat` option.
So, the problem could be that I didn't fully compile QEMU, which specified
`--target-list=3Dx86_64-softmmu` in the configure command.

Thus, I re-compile QEMU without any additional arg, then the problem is
solved!
It's strange that `-machine pc,help` showed me `pc-i440fx-5.2` but actually
loaded the `pc-i440fx-4.2`.

BTW, originally, I thought that `-hmat-cache` is the arg for customizing
CPU cache, and now I find that I'm wrong... It's for memory side cache.

Thank you very much, really help me a lot.

Sincerely,
Jack

Eduardo Habkost <ehabkost@redhat.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:09=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Tue, Nov 17, 2020 at 11:49:38AM +0800, =E9=83=AD=E4=BF=8A=E7=94=AB (Ja=
ck Kuo) wrote:
> > >
> > > Do you have the output of `qemu-system-x86_64 -version`, and more
> > > information on how your binary was built?
> >
> >
> > I have 2 machines, both of them encounter the .hmat problem.
> >
> > (1) *5.1.90 (v5.2.0-rc0*)
> >     - follow this wiki [1], and configure cmd: `./configure
> > --target-list=3Dx86_64-softmmu`
> >     - i5-8400, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic
>
> This one is supposed to work, and I see the pc-i440fx-5.2.hmat
> property below.
>
>
> >
> > (2) *4.2.1 (Debian 1:4.2-3ubuntu6.8)*
>
> This one isn't expect to have "hmat", as the feature was
> introduced in v5.0.0.
>
> >     - use apt install qemu
> >     - E5-2670 * 2, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic, Dell
> > PowerEdge-R720
> >
> > I can't reproduce it here.  I've tested both qemu.git master
> >
> >
> > That=E2=80=99s strange, also I try the command you (Eduardo) provided, =
'.hmat'
> not
> > found, too.
> > Does the kernel module matter? or PC architecture?
>
> Kernel or host architecture shouldn't matter.  The choice of
> machine type matters, but the default is supposed to be "pc".
> The output of "-machine help" might be useful to debug it.
>
> Could you check what happens if you use
> "-machine pc-i440fx-5.2,hmat=3Don" instead of "-machine hmat=3Don"?
>
>
> >
> > Output of `-machine help` and `-machine pc,help` would be useful
> > > to debug it, too.
> >
> >
> >  (1) *5.1.90 (i5-8400)*
> > *```*
> > $ qemu-system-x86_64 -machine pc,help
> > pc-i440fx-5.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid
> values
> > are cpu, mem-ctrl)
> > pc-i440fx-5.2.hmat=3Dbool (Set on/off to enable/disable ACPI Heterogene=
ous
> > Memory Attribute Table (HMAT))
> > pc-i440fx-5.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM
> > instantiation)
> > pc-i440fx-5.2.pcspk-audiodev=3Dstr (ID of an audiodev to use as a backe=
nd)
> > pc-i440fx-5.2.pflash1=3Dstr (Node name or ID of a block device to use a=
s a
> > backend)
> > pc-i440fx-5.2.pflash0=3Dstr (Node name or ID of a block device to use a=
s a
> > backend)
> > pc-i440fx-5.2.hpet=3Dbool
> > pc-i440fx-5.2.vmport=3DOnOffAuto (Enable vmport (pc & q35))
> > pc-i440fx-5.2.sata=3Dbool
> > pc-i440fx-5.2.pit=3Dbool
> > pc-i440fx-5.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G boundar=
y
> > (32bit boundary))
> > pc-i440fx-5.2.smbus=3Dbool
> > pc-i440fx-5.2.acpi=3DOnOffAuto (Enable ACPI)
> > pc-i440fx-5.2.smm=3DOnOffAuto (Enable SMM)
> > pc-i440fx-5.2.memory-backend=3Dstring (Set RAM backendValid value is ID=
 of
> > hostmem based backend)
> > pc-i440fx-5.2.firmware=3Dstring (Firmware image)
> > pc-i440fx-5.2.initrd=3Dstring (Linux initial ramdisk file)
> > pc-i440fx-5.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)
> > pc-i440fx-5.2.kernel=3Dstring (Linux kernel image file)
> > pc-i440fx-5.2.dt-compatible=3Dstring (Overrides the "compatible" proper=
ty
> of
> > the dt root node)
> > pc-i440fx-5.2.mem-merge=3Dbool (Enable/disable memory merge support)
> > pc-i440fx-5.2.suppress-vmdesc=3Dbool (Set on to disable self-describing
> > migration)
> > pc-i440fx-5.2.append=3Dstring (Linux kernel command line)
> > pc-i440fx-5.2.dump-guest-core=3Dbool (Include guest memory in a core du=
mp)
> > pc-i440fx-5.2.phandle-start=3Dint (The first phandle ID we may generate
> > dynamically)
> > pc-i440fx-5.2.usb=3Dbool (Set on/off to enable/disable usb)
> > pc-i440fx-5.2.dtb=3Dstring (Linux kernel device tree file)
> > pc-i440fx-5.2.memory-encryption=3Dstring (Set memory encryption object =
to
> use)
> > pc-i440fx-5.2.graphics=3Dbool (Set on/off to enable/disable graphics
> > emulation)
> > ```
> >
> > (2) *4.2.1 (E5-2670 * 2)*
> > *```*
> > qemu-system-x86_64 -machine pc,help
> > pc-i440fx-4.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid
> values
> > are cpu, mem-ctrl)
> > pc-i440fx-4.2.pflash0=3Dstr (Node name or ID of a block device to use a=
s a
> > backend)
> > pc-i440fx-4.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM
> > instantiation)
> > pc-i440fx-4.2.pflash1=3Dstr (Node name or ID of a block device to use a=
s a
> > backend)
> > pc-i440fx-4.2.vmport=3DOnOffAuto (Enable vmport (pc & q35))
> > pc-i440fx-4.2.sata=3Dbool
> > pc-i440fx-4.2.pit=3Dbool
> > pc-i440fx-4.2.smm=3DOnOffAuto (Enable SMM (pc & q35))
> > pc-i440fx-4.2.smbus=3Dbool
> > pc-i440fx-4.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G boundar=
y
> > (32bit boundary))
> > pc-i440fx-4.2.suppress-vmdesc=3Dbool (Set on to disable self-describing
> > migration)
> > pc-i440fx-4.2.append=3Dstring (Linux kernel command line)
> > pc-i440fx-4.2.accel=3Dstring (Accelerator list)
> > pc-i440fx-4.2.dtb=3Dstring (Linux kernel device tree file)
> > pc-i440fx-4.2.mem-merge=3Dbool (Enable/disable memory merge support)
> > pc-i440fx-4.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)
> > pc-i440fx-4.2.phandle-start=3Dint (The first phandle ID we may generate
> > dynamically)
> > pc-i440fx-4.2.igd-passthru=3Dbool (Set on/off to enable/disable igd
> passthrou)
> > pc-i440fx-4.2.kvm-shadow-mem=3Dint (KVM shadow MMU size)
> > pc-i440fx-4.2.dump-guest-core=3Dbool (Include guest memory in a core du=
mp)
> > pc-i440fx-4.2.memory-encryption=3Dstring (Set memory encryption object =
to
> use)
> > pc-i440fx-4.2.firmware=3Dstring (Firmware image)
> > pc-i440fx-4.2.usb=3Dbool (Set on/off to enable/disable usb)
> > pc-i440fx-4.2.kernel-irqchip=3Don|off|split (Configure KVM in-kernel
> irqchip)
> > pc-i440fx-4.2.graphics=3Dbool (Set on/off to enable/disable graphics
> > emulation)
> > pc-i440fx-4.2.initrd=3Dstring (Linux initial ramdisk file)
> > pc-i440fx-4.2.dt-compatible=3Dstring (Overrides the "compatible" proper=
ty
> of
> > the dt root node)
> > pc-i440fx-4.2.kernel=3Dstring (Linux kernel image file)
> > pc-i440fx-4.2.enforce-config-section=3Dbool (Set on to enforce
> configuration
> > section migration)
> > ```
> >
> > [1] https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux
> >
> > Sincerely,
> > Jack
> >
> > Eduardo Habkost <ehabkost@redhat.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:02=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > > On Mon, Nov 16, 2020 at 01:51:37PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > Cc'ing Igor & Eduardo.
> > >
> > > Thanks!
> > >
> > > >
> > > > On 11/13/20 10:17 AM, Jack wrote:
> > > > > Hi all,
> > > > >
> > > > > As I follow the document[1] to enable hmat, it fails and shows th=
e
> > > message:
> > > > >   qemu-system-x86_64: Property '.hmat' not found
> > > > >
> > > > > My QEMU version is 5.1.90
> > >
> > > Do you have the output of `qemu-system-x86_64 -version`, and more
> > > information on how your binary was built?
> > >
> > > Output of `-machine help` and `-machine pc,help` would be useful
> > > to debug it, too.
> > >
> > > I can't reproduce it here.  I've tested both qemu.git master
> > > (commit cb5ed407a1dd) and v5.2.0-rc (commit 3d6e32347a3b).
> > >
> > >   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -version
> > >   QEMU emulator version 5.1.91 (v5.2.0-rc1-107-gcb5ed407a1)
> > >   Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project
> developers
> > >   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -machine hmat=3Don -m=
 2G
> > > -object memory-backend-ram,size=3D1G,id=3Dm0 -object
> > > memory-backend-ram,size=3D1G,id=3Dm1 -smp 2 -numa node,nodeid=3D0,mem=
dev=3Dm0
> -numa
> > > node,nodeid=3D1,memdev=3Dm1,initiator=3D0 -numa cpu ,node-id=3D0,sock=
et-id=3D0
> -numa
> > > cpu,node-id=3D0,socket-id=3D1 -numa
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D5
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D200M
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D10
> > > -numa
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D100M
> > > -numa
> > >
> hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > -numa
> > >
> hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > -cpu host -vga virtio -accel kvm
> > >   [VM boots]
> > >
> > >
> > > > >
> > > > > Does anyone know why?
> > > > >
> > > > > Here is my command:
> > > > >
> > > > > ```
> > > > > $ sudo qemu-system-x86_64 \
> > > > > -machine hmat=3Don \
> > > > > -m 2G \
> > > > > -object memory-backend-ram,size=3D1G,id=3Dm0 \
> > > > > -object memory-backend-ram,size=3D1G,id=3Dm1 \
> > > > > -smp 2 \
> > > > > -numa node,nodeid=3D0,memdev=3Dm0 \
> > > > > -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \
> > > > > -numa cpu,node-id=3D0,socket-id=3D0 \
> > > > > -numa cpu,node-id=3D0,socket-id=3D1 \
> > > > > -numa
> > > > >
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D5
> > > > > \
> > > > > -numa
> > > > >
> > >
> hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D200M
> > > > > \
> > > > > -numa
> > > > >
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-la=
tency,latency=3D10
> > > > > \
> > > > > -numa
> > > > >
> > >
> hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Daccess-ba=
ndwidth,bandwidth=3D100M
> > > > > \
> > > > > -numa
> > > > >
> > >
> hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > > > \
> > > > > -numa
> > > > >
> > >
> hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirect,policy=
=3Dwrite-back,line=3D8
> > > > > \
> > > > > -cpu host \
> > > > > -m 4g -vga virtio -hda ubuntu20.04.qcow2 \
> > > > > -nic user,model=3Dvirtio \
> > > > > -nic tap,model=3De1000 \
> > > > > -nic tap,model=3De1000 \
> > > > > -accel kvm
> > > > > ```
> > > > >
> > > > > Thanks.
> > > > >
> > > > > [1]
> > > > >
> > >
> https://www.qemu.org/docs/master/system/qemu-manpage.html?highlight=3Dnum=
a
> > > > >
> > > > >
> > > > > Sincerely,
> > > > > Jack
> > > > >
> > > >
> > >
> > > --
> > > Eduardo
> > >
> > >
>
> --
> Eduardo
>
>

--000000000000c2dad105b45ee886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">Could you check what h=
appens if you use<br>&quot;-machine pc-i440fx-5.2,hmat=3Don&quot; instead o=
f &quot;-machine hmat=3Don&quot;?</blockquote><div><br></div><div>It failed=
, but `-machine pc-i440fx-4.2` worked without `hmat` option.</div><div>So, =
the problem could be that I didn&#39;t fully compile QEMU, which specified =
`--target-list=3Dx86_64-softmmu` in the configure command.</div><div><br></=
div><div>Thus, I re-compile QEMU without any additional arg, then the probl=
em is solved!</div><div>It&#39;s strange that <span class=3D"gmail-im">`-ma=
chine pc,help` showed me `pc-i440fx-5.2` but actually loaded the `pc-i440fx=
-4.2`.<br></span></div><div><br></div><div>BTW, originally, I thought that =
`-hmat-cache` is the arg for customizing CPU cache, and now I find that I&#=
39;m wrong... It&#39;s for memory side cache.<br></div><div><br></div><div>=
Thank you very much, really help me a lot.<br></div><div><br></div><div>Sin=
cerely,</div><div>Jack<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Eduardo Habkost &lt;<a href=3D"mailto:ehabk=
ost@redhat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt; =E6=96=BC 202=
0=E5=B9=B411=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:09=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex">On Tue, Nov 17, 2020 =
at 11:49:38AM +0800, =E9=83=AD=E4=BF=8A=E7=94=AB (Jack Kuo) wrote:<br>
&gt; &gt;<br>
&gt; &gt; Do you have the output of `qemu-system-x86_64 -version`, and more=
<br>
&gt; &gt; information on how your binary was built?<br>
&gt; <br>
&gt; <br>
&gt; I have 2 machines, both of them encounter the .hmat problem.<br>
&gt; <br>
&gt; (1) *5.1.90 (v5.2.0-rc0*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- follow this wiki [1], and configure cmd: `./confi=
gure<br>
&gt; --target-list=3Dx86_64-softmmu`<br>
&gt;=C2=A0 =C2=A0 =C2=A0- i5-8400, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-gen=
eric<br>
<br>
This one is supposed to work, and I see the pc-i440fx-5.2.hmat<br>
property below.<br>
<br>
<br>
&gt; <br>
&gt; (2) *4.2.1 (Debian 1:4.2-3ubuntu6.8)*<br>
<br>
This one isn&#39;t expect to have &quot;hmat&quot;, as the feature was<br>
introduced in v5.0.0.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0- use apt install qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0- E5-2670 * 2, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53=
-generic, Dell<br>
&gt; PowerEdge-R720<br>
&gt; <br>
&gt; I can&#39;t reproduce it here.=C2=A0 I&#39;ve tested both qemu.git mas=
ter<br>
&gt; <br>
&gt; <br>
&gt; That=E2=80=99s strange, also I try the command you (Eduardo) provided,=
 &#39;.hmat&#39; not<br>
&gt; found, too.<br>
&gt; Does the kernel module matter? or PC architecture?<br>
<br>
Kernel or host architecture shouldn&#39;t matter.=C2=A0 The choice of<br>
machine type matters, but the default is supposed to be &quot;pc&quot;.<br>
The output of &quot;-machine help&quot; might be useful to debug it.<br>
<br>
Could you check what happens if you use<br>
&quot;-machine pc-i440fx-5.2,hmat=3Don&quot; instead of &quot;-machine hmat=
=3Don&quot;?<br>
<br>
<br>
&gt; <br>
&gt; Output of `-machine help` and `-machine pc,help` would be useful<br>
&gt; &gt; to debug it, too.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 (1) *5.1.90 (i5-8400)*<br>
&gt; *```*<br>
&gt; $ qemu-system-x86_64 -machine pc,help<br>
&gt; pc-i440fx-5.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid=
 values<br>
&gt; are cpu, mem-ctrl)<br>
&gt; pc-i440fx-5.2.hmat=3Dbool (Set on/off to enable/disable ACPI Heterogen=
eous<br>
&gt; Memory Attribute Table (HMAT))<br>
&gt; pc-i440fx-5.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM<br>
&gt; instantiation)<br>
&gt; pc-i440fx-5.2.pcspk-audiodev=3Dstr (ID of an audiodev to use as a back=
end)<br>
&gt; pc-i440fx-5.2.pflash1=3Dstr (Node name or ID of a block device to use =
as a<br>
&gt; backend)<br>
&gt; pc-i440fx-5.2.pflash0=3Dstr (Node name or ID of a block device to use =
as a<br>
&gt; backend)<br>
&gt; pc-i440fx-5.2.hpet=3Dbool<br>
&gt; pc-i440fx-5.2.vmport=3DOnOffAuto (Enable vmport (pc &amp; q35))<br>
&gt; pc-i440fx-5.2.sata=3Dbool<br>
&gt; pc-i440fx-5.2.pit=3Dbool<br>
&gt; pc-i440fx-5.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G bounda=
ry<br>
&gt; (32bit boundary))<br>
&gt; pc-i440fx-5.2.smbus=3Dbool<br>
&gt; pc-i440fx-5.2.acpi=3DOnOffAuto (Enable ACPI)<br>
&gt; pc-i440fx-5.2.smm=3DOnOffAuto (Enable SMM)<br>
&gt; pc-i440fx-5.2.memory-backend=3Dstring (Set RAM backendValid value is I=
D of<br>
&gt; hostmem based backend)<br>
&gt; pc-i440fx-5.2.firmware=3Dstring (Firmware image)<br>
&gt; pc-i440fx-5.2.initrd=3Dstring (Linux initial ramdisk file)<br>
&gt; pc-i440fx-5.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)<b=
r>
&gt; pc-i440fx-5.2.kernel=3Dstring (Linux kernel image file)<br>
&gt; pc-i440fx-5.2.dt-compatible=3Dstring (Overrides the &quot;compatible&q=
uot; property of<br>
&gt; the dt root node)<br>
&gt; pc-i440fx-5.2.mem-merge=3Dbool (Enable/disable memory merge support)<b=
r>
&gt; pc-i440fx-5.2.suppress-vmdesc=3Dbool (Set on to disable self-describin=
g<br>
&gt; migration)<br>
&gt; pc-i440fx-5.2.append=3Dstring (Linux kernel command line)<br>
&gt; pc-i440fx-5.2.dump-guest-core=3Dbool (Include guest memory in a core d=
ump)<br>
&gt; pc-i440fx-5.2.phandle-start=3Dint (The first phandle ID we may generat=
e<br>
&gt; dynamically)<br>
&gt; pc-i440fx-5.2.usb=3Dbool (Set on/off to enable/disable usb)<br>
&gt; pc-i440fx-5.2.dtb=3Dstring (Linux kernel device tree file)<br>
&gt; pc-i440fx-5.2.memory-encryption=3Dstring (Set memory encryption object=
 to use)<br>
&gt; pc-i440fx-5.2.graphics=3Dbool (Set on/off to enable/disable graphics<b=
r>
&gt; emulation)<br>
&gt; ```<br>
&gt; <br>
&gt; (2) *4.2.1 (E5-2670 * 2)*<br>
&gt; *```*<br>
&gt; qemu-system-x86_64 -machine pc,help<br>
&gt; pc-i440fx-4.2.nvdimm-persistence=3Dstring (Set NVDIMM persistenceValid=
 values<br>
&gt; are cpu, mem-ctrl)<br>
&gt; pc-i440fx-4.2.pflash0=3Dstr (Node name or ID of a block device to use =
as a<br>
&gt; backend)<br>
&gt; pc-i440fx-4.2.nvdimm=3Dbool (Set on/off to enable/disable NVDIMM<br>
&gt; instantiation)<br>
&gt; pc-i440fx-4.2.pflash1=3Dstr (Node name or ID of a block device to use =
as a<br>
&gt; backend)<br>
&gt; pc-i440fx-4.2.vmport=3DOnOffAuto (Enable vmport (pc &amp; q35))<br>
&gt; pc-i440fx-4.2.sata=3Dbool<br>
&gt; pc-i440fx-4.2.pit=3Dbool<br>
&gt; pc-i440fx-4.2.smm=3DOnOffAuto (Enable SMM (pc &amp; q35))<br>
&gt; pc-i440fx-4.2.smbus=3Dbool<br>
&gt; pc-i440fx-4.2.max-ram-below-4g=3Dsize (Maximum ram below the 4G bounda=
ry<br>
&gt; (32bit boundary))<br>
&gt; pc-i440fx-4.2.suppress-vmdesc=3Dbool (Set on to disable self-describin=
g<br>
&gt; migration)<br>
&gt; pc-i440fx-4.2.append=3Dstring (Linux kernel command line)<br>
&gt; pc-i440fx-4.2.accel=3Dstring (Accelerator list)<br>
&gt; pc-i440fx-4.2.dtb=3Dstring (Linux kernel device tree file)<br>
&gt; pc-i440fx-4.2.mem-merge=3Dbool (Enable/disable memory merge support)<b=
r>
&gt; pc-i440fx-4.2.dumpdtb=3Dstring (Dump current dtb to a file and quit)<b=
r>
&gt; pc-i440fx-4.2.phandle-start=3Dint (The first phandle ID we may generat=
e<br>
&gt; dynamically)<br>
&gt; pc-i440fx-4.2.igd-passthru=3Dbool (Set on/off to enable/disable igd pa=
ssthrou)<br>
&gt; pc-i440fx-4.2.kvm-shadow-mem=3Dint (KVM shadow MMU size)<br>
&gt; pc-i440fx-4.2.dump-guest-core=3Dbool (Include guest memory in a core d=
ump)<br>
&gt; pc-i440fx-4.2.memory-encryption=3Dstring (Set memory encryption object=
 to use)<br>
&gt; pc-i440fx-4.2.firmware=3Dstring (Firmware image)<br>
&gt; pc-i440fx-4.2.usb=3Dbool (Set on/off to enable/disable usb)<br>
&gt; pc-i440fx-4.2.kernel-irqchip=3Don|off|split (Configure KVM in-kernel i=
rqchip)<br>
&gt; pc-i440fx-4.2.graphics=3Dbool (Set on/off to enable/disable graphics<b=
r>
&gt; emulation)<br>
&gt; pc-i440fx-4.2.initrd=3Dstring (Linux initial ramdisk file)<br>
&gt; pc-i440fx-4.2.dt-compatible=3Dstring (Overrides the &quot;compatible&q=
uot; property of<br>
&gt; the dt root node)<br>
&gt; pc-i440fx-4.2.kernel=3Dstring (Linux kernel image file)<br>
&gt; pc-i440fx-4.2.enforce-config-section=3Dbool (Set on to enforce configu=
ration<br>
&gt; section migration)<br>
&gt; ```<br>
&gt; <br>
&gt; [1] <a href=3D"https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Lin=
ux" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Hosts/Linux#=
Building_QEMU_for_Linux</a><br>
&gt; <br>
&gt; Sincerely,<br>
&gt; Jack<br>
&gt; <br>
&gt; Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" target=3D"_=
blank">ehabkost@redhat.com</a>&gt; =E6=96=BC 2020=E5=B9=B411=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=BC=9A=
<br>
&gt; <br>
&gt; &gt; On Mon, Nov 16, 2020 at 01:51:37PM +0100, Philippe Mathieu-Daud=
=C3=A9 wrote:<br>
&gt; &gt; &gt; Cc&#39;ing Igor &amp; Eduardo.<br>
&gt; &gt;<br>
&gt; &gt; Thanks!<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 11/13/20 10:17 AM, Jack wrote:<br>
&gt; &gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; As I follow the document[1] to enable hmat, it fails an=
d shows the<br>
&gt; &gt; message:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0qemu-system-x86_64: Property &#39;.hmat&#39=
; not found<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; My QEMU version is 5.1.90<br>
&gt; &gt;<br>
&gt; &gt; Do you have the output of `qemu-system-x86_64 -version`, and more=
<br>
&gt; &gt; information on how your binary was built?<br>
&gt; &gt;<br>
&gt; &gt; Output of `-machine help` and `-machine pc,help` would be useful<=
br>
&gt; &gt; to debug it, too.<br>
&gt; &gt;<br>
&gt; &gt; I can&#39;t reproduce it here.=C2=A0 I&#39;ve tested both qemu.gi=
t master<br>
&gt; &gt; (commit cb5ed407a1dd) and v5.2.0-rc (commit 3d6e32347a3b).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0[build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -versio=
n<br>
&gt; &gt;=C2=A0 =C2=A0QEMU emulator version 5.1.91 (v5.2.0-rc1-107-gcb5ed40=
7a1)<br>
&gt; &gt;=C2=A0 =C2=A0Copyright (c) 2003-2020 Fabrice Bellard and the QEMU =
Project developers<br>
&gt; &gt;=C2=A0 =C2=A0[build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -machin=
e hmat=3Don -m 2G<br>
&gt; &gt; -object memory-backend-ram,size=3D1G,id=3Dm0 -object<br>
&gt; &gt; memory-backend-ram,size=3D1G,id=3Dm1 -smp 2 -numa node,nodeid=3D0=
,memdev=3Dm0 -numa<br>
&gt; &gt; node,nodeid=3D1,memdev=3Dm1,initiator=3D0 -numa cpu ,node-id=3D0,=
socket-id=3D0 -numa<br>
&gt; &gt; cpu,node-id=3D0,socket-id=3D1 -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D5<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D200M<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D100M<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; -numa<br>
&gt; &gt; hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; -cpu host -vga virtio -accel kvm<br>
&gt; &gt;=C2=A0 =C2=A0[VM boots]<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Does anyone know why?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Here is my command:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ```<br>
&gt; &gt; &gt; &gt; $ sudo qemu-system-x86_64 \<br>
&gt; &gt; &gt; &gt; -machine hmat=3Don \<br>
&gt; &gt; &gt; &gt; -m 2G \<br>
&gt; &gt; &gt; &gt; -object memory-backend-ram,size=3D1G,id=3Dm0 \<br>
&gt; &gt; &gt; &gt; -object memory-backend-ram,size=3D1G,id=3Dm1 \<br>
&gt; &gt; &gt; &gt; -smp 2 \<br>
&gt; &gt; &gt; &gt; -numa node,nodeid=3D0,memdev=3Dm0 \<br>
&gt; &gt; &gt; &gt; -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \<br>
&gt; &gt; &gt; &gt; -numa cpu,node-id=3D0,socket-id=3D0 \<br>
&gt; &gt; &gt; &gt; -numa cpu,node-id=3D0,socket-id=3D1 \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D5<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D200M<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D100M<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-cache,node-id=3D0,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -numa<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; hmat-cache,node-id=3D1,size=3D10K,level=3D1,associativity=3Ddirec=
t,policy=3Dwrite-back,line=3D8<br>
&gt; &gt; &gt; &gt; \<br>
&gt; &gt; &gt; &gt; -cpu host \<br>
&gt; &gt; &gt; &gt; -m 4g -vga virtio -hda ubuntu20.04.qcow2 \<br>
&gt; &gt; &gt; &gt; -nic user,model=3Dvirtio \<br>
&gt; &gt; &gt; &gt; -nic tap,model=3De1000 \<br>
&gt; &gt; &gt; &gt; -nic tap,model=3De1000 \<br>
&gt; &gt; &gt; &gt; -accel kvm<br>
&gt; &gt; &gt; &gt; ```<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1]<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://www.qemu.org/docs/master/system/qemu-manpage.h=
tml?highlight=3Dnuma" rel=3D"noreferrer" target=3D"_blank">https://www.qemu=
.org/docs/master/system/qemu-manpage.html?highlight=3Dnuma</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Sincerely,<br>
&gt; &gt; &gt; &gt; Jack<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Eduardo<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div></div>

--000000000000c2dad105b45ee886--


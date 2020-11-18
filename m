Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5E2B7DA9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:33:59 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMer-000221-QX
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfMd6-0000Yz-P3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfMd2-0003qp-AF
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605702722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtOEWReYbx/RU0z8MLIRcpnkxElESMFHKmKRrD1wtCA=;
 b=AEeiKwg3y+oumSp9BEBW2TuTvkzywL0AYTeSyn+fQ0hjBE1bln1JRZuyF/ah+bJ9ofJ9F9
 f2wSaRx1ArVruxFy1hxo13H5EQHauIuPeHxUqQJNihQedYvzklNUXxjKvnSVLcxaT0rfKC
 IDh0zTLtykxJuX++BDy1dPi2QGvxhiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-H0g45s20P62xj9s6mtzkfQ-1; Wed, 18 Nov 2020 07:31:59 -0500
X-MC-Unique: H0g45s20P62xj9s6mtzkfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2C32AB;
 Wed, 18 Nov 2020 12:31:58 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070261000239;
 Wed, 18 Nov 2020 12:31:56 +0000 (UTC)
Date: Wed, 18 Nov 2020 07:31:56 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?B?6YOt5L+K55SrIChKYWNrIEt1byk=?= <jackkuo@jackkuo.org>
Subject: Re: Property '.hmat' not found
Message-ID: <20201118123156.GB1509407@habkost.net>
References: <69ce94c221fc90c6963c3529ddc46e66@m108.nthu.edu.tw>
 <1547b1c8-36e2-179e-8406-4faf0324f4f2@redhat.com>
 <20201116190221.GA1235237@habkost.net>
 <CALen4BRv-FUnD0P7bMS0bKhZ9uZoSVawa2xvO5Ncb70Z7npJbw@mail.gmail.com>
 <20201117150934.GF1235237@habkost.net>
 <CALen4BRisWKbaV8pqSE5F48JR15zeuL5Dqh42J6UrzHxHLpv6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALen4BRisWKbaV8pqSE5F48JR15zeuL5Dqh42J6UrzHxHLpv6w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jack <s108062518@m108.nthu.edu.tw>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 06:16:36PM +0800, 郭俊甫 (Jack Kuo) wrote:
> >
> > Could you check what happens if you use
> > "-machine pc-i440fx-5.2,hmat=on" instead of "-machine hmat=on"?
> 
> 
> It failed, but `-machine pc-i440fx-4.2` worked without `hmat` option.
> So, the problem could be that I didn't fully compile QEMU, which specified
> `--target-list=x86_64-softmmu` in the configure command.
> 
> Thus, I re-compile QEMU without any additional arg, then the problem is
> solved!
> It's strange that `-machine pc,help` showed me `pc-i440fx-5.2` but actually
> loaded the `pc-i440fx-4.2`.

Yeah, it is strange.  Were the "-version" and "-machine pc,help"
commands executed on a different shell process?  If you have
installed a new qemu-system-x86_64 binary in a separate location
in $PATH (e.g. /usr/local/bin), existing shell processes might
still run the old binary if the old path was already in their
hash table.

> 
> BTW, originally, I thought that `-hmat-cache` is the arg for customizing
> CPU cache, and now I find that I'm wrong... It's for memory side cache.

Correct.  Unfortunately, there are not many CPU cache
configuration options in qemu-system-x86_64 today, except for
"l3-cache" and "host-cache-info" -cpu options.

> 
> Thank you very much, really help me a lot.

No problem!

> 
> Sincerely,
> Jack
> 
> Eduardo Habkost <ehabkost@redhat.com> 於 2020年11月17日 週二 下午11:09寫道：
> 
> > On Tue, Nov 17, 2020 at 11:49:38AM +0800, 郭俊甫 (Jack Kuo) wrote:
> > > >
> > > > Do you have the output of `qemu-system-x86_64 -version`, and more
> > > > information on how your binary was built?
> > >
> > >
> > > I have 2 machines, both of them encounter the .hmat problem.
> > >
> > > (1) *5.1.90 (v5.2.0-rc0*)
> > >     - follow this wiki [1], and configure cmd: `./configure
> > > --target-list=x86_64-softmmu`
> > >     - i5-8400, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic
> >
> > This one is supposed to work, and I see the pc-i440fx-5.2.hmat
> > property below.
> >
> >
> > >
> > > (2) *4.2.1 (Debian 1:4.2-3ubuntu6.8)*
> >
> > This one isn't expect to have "hmat", as the feature was
> > introduced in v5.0.0.
> >
> > >     - use apt install qemu
> > >     - E5-2670 * 2, Ubuntu 20.04.1 LTS, kernel: 5.4.0-53-generic, Dell
> > > PowerEdge-R720
> > >
> > > I can't reproduce it here.  I've tested both qemu.git master
> > >
> > >
> > > That’s strange, also I try the command you (Eduardo) provided, '.hmat'
> > not
> > > found, too.
> > > Does the kernel module matter? or PC architecture?
> >
> > Kernel or host architecture shouldn't matter.  The choice of
> > machine type matters, but the default is supposed to be "pc".
> > The output of "-machine help" might be useful to debug it.
> >
> > Could you check what happens if you use
> > "-machine pc-i440fx-5.2,hmat=on" instead of "-machine hmat=on"?
> >
> >
> > >
> > > Output of `-machine help` and `-machine pc,help` would be useful
> > > > to debug it, too.
> > >
> > >
> > >  (1) *5.1.90 (i5-8400)*
> > > *```*
> > > $ qemu-system-x86_64 -machine pc,help
> > > pc-i440fx-5.2.nvdimm-persistence=string (Set NVDIMM persistenceValid
> > values
> > > are cpu, mem-ctrl)
> > > pc-i440fx-5.2.hmat=bool (Set on/off to enable/disable ACPI Heterogeneous
> > > Memory Attribute Table (HMAT))
> > > pc-i440fx-5.2.nvdimm=bool (Set on/off to enable/disable NVDIMM
> > > instantiation)
> > > pc-i440fx-5.2.pcspk-audiodev=str (ID of an audiodev to use as a backend)
> > > pc-i440fx-5.2.pflash1=str (Node name or ID of a block device to use as a
> > > backend)
> > > pc-i440fx-5.2.pflash0=str (Node name or ID of a block device to use as a
> > > backend)
> > > pc-i440fx-5.2.hpet=bool
> > > pc-i440fx-5.2.vmport=OnOffAuto (Enable vmport (pc & q35))
> > > pc-i440fx-5.2.sata=bool
> > > pc-i440fx-5.2.pit=bool
> > > pc-i440fx-5.2.max-ram-below-4g=size (Maximum ram below the 4G boundary
> > > (32bit boundary))
> > > pc-i440fx-5.2.smbus=bool
> > > pc-i440fx-5.2.acpi=OnOffAuto (Enable ACPI)
> > > pc-i440fx-5.2.smm=OnOffAuto (Enable SMM)
> > > pc-i440fx-5.2.memory-backend=string (Set RAM backendValid value is ID of
> > > hostmem based backend)
> > > pc-i440fx-5.2.firmware=string (Firmware image)
> > > pc-i440fx-5.2.initrd=string (Linux initial ramdisk file)
> > > pc-i440fx-5.2.dumpdtb=string (Dump current dtb to a file and quit)
> > > pc-i440fx-5.2.kernel=string (Linux kernel image file)
> > > pc-i440fx-5.2.dt-compatible=string (Overrides the "compatible" property
> > of
> > > the dt root node)
> > > pc-i440fx-5.2.mem-merge=bool (Enable/disable memory merge support)
> > > pc-i440fx-5.2.suppress-vmdesc=bool (Set on to disable self-describing
> > > migration)
> > > pc-i440fx-5.2.append=string (Linux kernel command line)
> > > pc-i440fx-5.2.dump-guest-core=bool (Include guest memory in a core dump)
> > > pc-i440fx-5.2.phandle-start=int (The first phandle ID we may generate
> > > dynamically)
> > > pc-i440fx-5.2.usb=bool (Set on/off to enable/disable usb)
> > > pc-i440fx-5.2.dtb=string (Linux kernel device tree file)
> > > pc-i440fx-5.2.memory-encryption=string (Set memory encryption object to
> > use)
> > > pc-i440fx-5.2.graphics=bool (Set on/off to enable/disable graphics
> > > emulation)
> > > ```
> > >
> > > (2) *4.2.1 (E5-2670 * 2)*
> > > *```*
> > > qemu-system-x86_64 -machine pc,help
> > > pc-i440fx-4.2.nvdimm-persistence=string (Set NVDIMM persistenceValid
> > values
> > > are cpu, mem-ctrl)
> > > pc-i440fx-4.2.pflash0=str (Node name or ID of a block device to use as a
> > > backend)
> > > pc-i440fx-4.2.nvdimm=bool (Set on/off to enable/disable NVDIMM
> > > instantiation)
> > > pc-i440fx-4.2.pflash1=str (Node name or ID of a block device to use as a
> > > backend)
> > > pc-i440fx-4.2.vmport=OnOffAuto (Enable vmport (pc & q35))
> > > pc-i440fx-4.2.sata=bool
> > > pc-i440fx-4.2.pit=bool
> > > pc-i440fx-4.2.smm=OnOffAuto (Enable SMM (pc & q35))
> > > pc-i440fx-4.2.smbus=bool
> > > pc-i440fx-4.2.max-ram-below-4g=size (Maximum ram below the 4G boundary
> > > (32bit boundary))
> > > pc-i440fx-4.2.suppress-vmdesc=bool (Set on to disable self-describing
> > > migration)
> > > pc-i440fx-4.2.append=string (Linux kernel command line)
> > > pc-i440fx-4.2.accel=string (Accelerator list)
> > > pc-i440fx-4.2.dtb=string (Linux kernel device tree file)
> > > pc-i440fx-4.2.mem-merge=bool (Enable/disable memory merge support)
> > > pc-i440fx-4.2.dumpdtb=string (Dump current dtb to a file and quit)
> > > pc-i440fx-4.2.phandle-start=int (The first phandle ID we may generate
> > > dynamically)
> > > pc-i440fx-4.2.igd-passthru=bool (Set on/off to enable/disable igd
> > passthrou)
> > > pc-i440fx-4.2.kvm-shadow-mem=int (KVM shadow MMU size)
> > > pc-i440fx-4.2.dump-guest-core=bool (Include guest memory in a core dump)
> > > pc-i440fx-4.2.memory-encryption=string (Set memory encryption object to
> > use)
> > > pc-i440fx-4.2.firmware=string (Firmware image)
> > > pc-i440fx-4.2.usb=bool (Set on/off to enable/disable usb)
> > > pc-i440fx-4.2.kernel-irqchip=on|off|split (Configure KVM in-kernel
> > irqchip)
> > > pc-i440fx-4.2.graphics=bool (Set on/off to enable/disable graphics
> > > emulation)
> > > pc-i440fx-4.2.initrd=string (Linux initial ramdisk file)
> > > pc-i440fx-4.2.dt-compatible=string (Overrides the "compatible" property
> > of
> > > the dt root node)
> > > pc-i440fx-4.2.kernel=string (Linux kernel image file)
> > > pc-i440fx-4.2.enforce-config-section=bool (Set on to enforce
> > configuration
> > > section migration)
> > > ```
> > >
> > > [1] https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux
> > >
> > > Sincerely,
> > > Jack
> > >
> > > Eduardo Habkost <ehabkost@redhat.com> 於 2020年11月17日 週二 上午3:02寫道：
> > >
> > > > On Mon, Nov 16, 2020 at 01:51:37PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > Cc'ing Igor & Eduardo.
> > > >
> > > > Thanks!
> > > >
> > > > >
> > > > > On 11/13/20 10:17 AM, Jack wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > As I follow the document[1] to enable hmat, it fails and shows the
> > > > message:
> > > > > >   qemu-system-x86_64: Property '.hmat' not found
> > > > > >
> > > > > > My QEMU version is 5.1.90
> > > >
> > > > Do you have the output of `qemu-system-x86_64 -version`, and more
> > > > information on how your binary was built?
> > > >
> > > > Output of `-machine help` and `-machine pc,help` would be useful
> > > > to debug it, too.
> > > >
> > > > I can't reproduce it here.  I've tested both qemu.git master
> > > > (commit cb5ed407a1dd) and v5.2.0-rc (commit 3d6e32347a3b).
> > > >
> > > >   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -version
> > > >   QEMU emulator version 5.1.91 (v5.2.0-rc1-107-gcb5ed407a1)
> > > >   Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project
> > developers
> > > >   [build/(cb5ed407a1...)]$ ./qemu-system-x86_64 -machine hmat=on -m 2G
> > > > -object memory-backend-ram,size=1G,id=m0 -object
> > > > memory-backend-ram,size=1G,id=m1 -smp 2 -numa node,nodeid=0,memdev=m0
> > -numa
> > > > node,nodeid=1,memdev=m1,initiator=0 -numa cpu ,node-id=0,socket-id=0
> > -numa
> > > > cpu,node-id=0,socket-id=1 -numa
> > > >
> > hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5
> > > > -numa
> > > >
> > hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M
> > > > -numa
> > > >
> > hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10
> > > > -numa
> > > >
> > hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
> > > > -numa
> > > >
> > hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8
> > > > -numa
> > > >
> > hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
> > > > -cpu host -vga virtio -accel kvm
> > > >   [VM boots]
> > > >
> > > >
> > > > > >
> > > > > > Does anyone know why?
> > > > > >
> > > > > > Here is my command:
> > > > > >
> > > > > > ```
> > > > > > $ sudo qemu-system-x86_64 \
> > > > > > -machine hmat=on \
> > > > > > -m 2G \
> > > > > > -object memory-backend-ram,size=1G,id=m0 \
> > > > > > -object memory-backend-ram,size=1G,id=m1 \
> > > > > > -smp 2 \
> > > > > > -numa node,nodeid=0,memdev=m0 \
> > > > > > -numa node,nodeid=1,memdev=m1,initiator=0 \
> > > > > > -numa cpu,node-id=0,socket-id=0 \
> > > > > > -numa cpu,node-id=0,socket-id=1 \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5
> > > > > > \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M
> > > > > > \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10
> > > > > > \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
> > > > > > \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8
> > > > > > \
> > > > > > -numa
> > > > > >
> > > >
> > hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
> > > > > > \
> > > > > > -cpu host \
> > > > > > -m 4g -vga virtio -hda ubuntu20.04.qcow2 \
> > > > > > -nic user,model=virtio \
> > > > > > -nic tap,model=e1000 \
> > > > > > -nic tap,model=e1000 \
> > > > > > -accel kvm
> > > > > > ```
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > [1]
> > > > > >
> > > >
> > https://www.qemu.org/docs/master/system/qemu-manpage.html?highlight=numa
> > > > > >
> > > > > >
> > > > > > Sincerely,
> > > > > > Jack
> > > > > >
> > > > >
> > > >
> > > > --
> > > > Eduardo
> > > >
> > > >
> >
> > --
> > Eduardo
> >
> >

-- 
Eduardo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22EF321DC8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:13:50 +0100 (CET)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEmL-0000EU-OX
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEEkg-0006ul-Vg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:12:06 -0500
Received: from 5.mo51.mail-out.ovh.net ([188.165.49.213]:56695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEEke-0003oJ-UN
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:12:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 7201B269130;
 Mon, 22 Feb 2021 18:12:01 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 18:12:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001629b4686-cd84-43f6-baca-af62d71ac644,
 7322555201F4CCBA135B576978D07BE5564972B5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 22 Feb 2021 18:11:59 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Message-ID: <20210222181159.6b274945@bahia.lan>
In-Reply-To: <2848338.ij5OB8EVuP@silver>
References: <20200918213436.GA3520@redhat.com> <2337260.PURPEL5hZR@silver>
 <20210222131814.28e06428@bahia.lan> <2848338.ij5OB8EVuP@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ddeacccc-584c-4aec-b233-701cd0671c0a
X-Ovh-Tracer-Id: 16564520904821938479
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhgohihrghlsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=groug@kaod.org;
 helo=5.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Shinde, Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 16:08:04 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

[...]

> I did not ever have a kernel crash when I boot a Linux guest with a 9pfs root 
> fs and 100 MiB msize.

Interesting.

> Should we ask virtio or 9p Linux client maintainers if 
> they can add some info what this is about?
> 

Probably worth to try that first, even if I'm not sure anyone has a
answer for that since all the people who worked on virtio-9p at
the time have somehow deserted the project.

> > > As the kernel code sais trans_mod->maxsize, maybe its something in virtio
> > > on qemu side that does an automatic step back for some reason. I don't
> > > see something in the 9pfs virtio transport driver
> > > (hw/9pfs/virtio-9p-device.c on QEMU side) that would do this, so I would
> > > also need to dig deeper.
> > > 
> > > Do you have some RAM limitation in your setup somewhere?
> > > 
> > > For comparison, this is how I started the VM:
> > > 
> > > ~/git/qemu/build/qemu-system-x86_64 \
> > > -machine pc,accel=kvm,usb=off,dump-guest-core=off -m 2048 \
> > > -smp 4,sockets=4,cores=1,threads=1 -rtc base=utc \
> > > -boot strict=on -kernel /home/bee/vm/stretch/boot/vmlinuz-4.9.0-13-amd64 \
> > > -initrd /home/bee/vm/stretch/boot/initrd.img-4.9.0-13-amd64 \
> > > -append 'root=svnRoot rw rootfstype=9p
> > > rootflags=trans=virtio,version=9p2000.L,msize=104857600,cache=mmap
> > > console=ttyS0' \
> > First obvious difference I see between your setup and mine is that
> > you're mounting the 9pfs as root from the kernel command line. For
> > some reason, maybe this has an impact on the check in p9_client_create() ?
> > 
> > Can you reproduce with a scenario like Vivek's one ?
> 
> Yep, confirmed. If I boot a guest from an image file first and then try to 
> manually mount a 9pfs share after guest booted, then I get indeed that msize 
> capping of just 512 kiB as well. That's far too small. :/
> 

Maybe worth digging : 
- why no capping happens in your scenario ?
- is capping really needed ?

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 



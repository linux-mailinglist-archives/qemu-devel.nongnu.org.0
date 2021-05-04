Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7637296E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:09:30 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsvh-0002Rg-Lr
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldsuX-0001dz-MY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldsuP-0006rR-Nm
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620126489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rS5E0o77uJaG/wi/c0RqsWuuakJu4Ay/JY3mQ952IBk=;
 b=Ojnsm9dbja4XX+fDRk7I4qoJpXGPCzZnUIb7sMDZD0EUUKcwuemDOTrpIpIC4bSC1A/A3z
 PsPtrkCcYEw0D4Q1Dw2ffM25ZEthDoU0XduKpNTWREA0hL7MydAYI8f2gJQdCc8L9uFi5t
 CSbp6lEjkdRYLT1BqSc0YHhs5zqkuEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-ft33gplZMqGpqiwQWCE44A-1; Tue, 04 May 2021 07:08:05 -0400
X-MC-Unique: ft33gplZMqGpqiwQWCE44A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D596280EF83;
 Tue,  4 May 2021 11:08:03 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 084A960D43;
 Tue,  4 May 2021 11:07:58 +0000 (UTC)
Date: Tue, 4 May 2021 12:07:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: X on old (non-x86) Linux guests
Message-ID: <YJErDAYBCtiywUkZ@work-vm>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* BALATON Zoltan (balaton@eik.bme.hu) wrote:
> Hello,
> 
> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
> >  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> > under QEMU which was pretty neat.  But I failed to find a succesful
> > combination to get X working; has anyone any suggestions?
> 
> Adding Andrew who has experimented with old X framebuffer so he may remember
> something more but that was on x86.
> 
> >  That distro was from around 2000; the challenge is since we don't have
> > VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> > doesn't want to play with any of the devices.
> > 
> >  I also tried the ati device, but the accelerated mach64 driver
> > didn't recognise that ID.
> 
> The ati-vga partially emulates an ATI Rage128 Pro so it won't work with
> mach64 driver that is older and while functionally similar has different
> registers. You probably need to load aty128fb and then set a mode with fbset
> then may need to edit X conf but I forgot which option was neded, something
> about UseFb or similar so it won't try to change mode itself but use the
> already set Linux FB because otherwise it did not detect the card properly
> but I don'r remember the details so may be wrong. Also some 2D accel is
> emulated so may work without disabling it but I think has some bugs so it
> may have glitches.
> 
> >  Has anyone found any combo that works?
> > I suspect using one of the existing devices, lying about PCI ID, and
> > then turning off all accelerations might have a chance but I've not got
> > that far.
> 
> Changing the PCI ID may not help as these ATI chips have different registers
> so only compatible with the right drivers. I've tried to use current ati-vga
> with a Mac ROM that expects mach64 but it did not work.
> 
> It may help to add -trace enable="ati*" and maybe also enable some debug
> defines in ati_int.h to see if it accesses the card at all but with the
> right driver that works with Rage128Pro it should produce some picture at
> least in fb console and we could run X with it on x86 before.

Thanks.

> More info on ati-vga is here:
> https://osdn.net/projects/qmiga/wiki/SubprojectAti
> 
> By the way, last time I've experimented with it I've found that mouse
> pointer getting out of sync and jumping around is probably a result of mouse
> acceleration on the host is not taken into account when tracking guest
> pointer position. Is that possible and is there a way to fix it?

That's actually really tricky; on modern guests we recommend using a
usb-tablet emulation rather than a mouse; there's no logical
relationship between the deltas sent by a mouse and the amount which a
guest moves a pointer by.  Many OSs have mouse acceleration and other 
behaviours that are non-linear - also if you lose a mous event somewhere
then you get a slip.

Some notes on this weekends playing; I still haven't actually got X
going though.

My initial boot was:

./alpha-softmmu/qemu-system-alpha -m 512M -kernel ~/alpha/generic.kernel   -vga none -cpu ev67-alpha-cpu -smp 1  -append 'console=ttyS0 root=/dev/hda'  -serial stdio -drive if=ide,file=/home/dg/alpha/redhat-6.2-alpha.iso
That should be the kernel from
http://archive.download.redhat.com/pub/redhat/linux/6.2/en/os/alpha/kernels/
and the iso from http://archive.download.redhat.com/pub/redhat/linux/6.2/en/iso/alpha/

Then moving up to being able to do an install with:
./alpha-softmmu/qemu-system-alpha -m 512M -kernel ~/alpha/generic.kernel    -cpu ev67-alpha-cpu -smp 1  -append 'root=/dev/hdb' -drive if=ide,file=./alpha-main.qcow2 -drive if=ide,file=/home/dg/alpha/redhat-6.2-alpha.iso

Note that kernel doesn't match the one installed, so you can't load
modules.
Later I installed the SMP kernel rpm, copied that out (via tar to
a blank image disk) and booted using:

./alpha-softmmu/qemu-system-alpha -m 512M -kernel ~/alpha/extract/boot/vmlinux-2.2.14-6.0smp    -cpu ev67-alpha-cpu -smp 4  -append 'root=/dev/hda2' -drive if=ide,file=./alpha-main.qcow2 -drive if=ide,file=/home/dg/alpha/redhat-6.2-alpha.iso -device ati-vga -nic user,model=tulip

and that's actually pretty neat, 4 cores of alpha and 512MB RAM; it's
pretty fast; only takes about an hour to rebuild X!

Other SCSI adapters are all disliked:
DC390: 1 adapters found
scsi0 : Tekram DC390/AM53C974 V2.0d 1998/12/25
scsi : 1 host.
Unable to handle kernel paging request at virtual address 0000000000000004
swapper(1): Oops -1
--
ncr53c810 - cache test failed
-
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: 53c895a detected
sym53c895a-0: rev=0x00, base=0x9020000, io_port=0xb000, irq=28
sym53c895a-0: NCR clock is 0KHz, 0KHz
sym53c895a-0: ID 7, Fast-40, Parity Checking
sym53c895a-0: on-chip RAM at 0x9022000
sym53c895a-0: restart (scsi reset).
sym53c895a-0: handling phase mismatch from SCRIPTS.
sym53c895a-0: Downloading SCSI SCRIPTS.
sym53c895a-0: unexpected disconnect
sym53c895a-0: unexpected disconnect

---
The only fb built into that kernel was TGA; the ATY fb it has in that
kernel source doesn't have overlapping PCI IDs with the ones we
currently emualted (and it oops'd on load).

The 'ati' and 'cirrus' drivers in vga256 X server both
had chunks of X86 asm (not just in blits) so wouldn't build.
The 'r128' driver did build with some hackery; and with:

Section "Device"
  Identifier "svgahack"
  ...
  Chipset "r128"
  ChipID 0x5245
  Option "NoAccel"
  Option "SWCursor"
  VideoRam 4096
EndSection

actually changes resolution - but then falls over with a stream of
machine checks;  I'm wondering if something isn't happy with the Alpha's
IOMMU/mapping - maybe that also explains all the SCSI controllers being
unhappy as well.
(Or maybe it's the build hacks I had to do to r128 to get it to
build...)

So I think the only other thing there is to move to a newer kernel
with a fb driver that has a better chance.

(My real alpha has a 3dfx 3000 in as I remember, and that was from the
end of '97)

Dave


> Regards,
> BALATON Zoltan
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C2140E77
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 17:00:35 +0100 (CET)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isU2z-00088x-PB
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 11:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1isU1n-0007hZ-Jp
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1isU1l-0003jo-MZ
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:59:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37309
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1isU1l-0003il-DJ
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579276755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiG+6W2i2XWk4IGeiIdMmNWBNZdV25/RkljISHgEdQg=;
 b=fTvdgoqxYgDHLBZ08h2tLBPDuTkZch92Q4itH+2Bwm25at7w8kNHoq0esf7OeaKH9bETMV
 a2FJCHhSdBSiaOa28+dgwbSGtMiSJfjAI+ObfHJpKS8xfu81phESZwiZENEnzQwjAou2Pz
 DyCP6AQsZ5dHeoV3oVLAaTq8GQRar7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-gnBXuU1VONW3Tz8IxyL4Eg-1; Fri, 17 Jan 2020 10:59:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859F91060DF7;
 Fri, 17 Jan 2020 15:59:12 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B986683861;
 Fri, 17 Jan 2020 15:59:11 +0000 (UTC)
Date: Fri, 17 Jan 2020 15:59:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: qemu-4.0.1: vhost_region_add_section:Section rounded to 0 prior
 to previous a0000
Message-ID: <20200117155909.GM3209@work-vm>
References: <985fea06-ede6-dcb7-8829-a48a9416bc09@kamp.de>
 <20200108150458.GC3184@work-vm>
 <ca222a5f-1ec6-477c-ed83-6ef52ea9e97f@kamp.de>
 <20200109184440.GR6795@work-vm>
 <b89e8ba2-49e9-8c0d-1129-116afa76366a@kamp.de>
 <cd316fb8-b56b-2913-8b57-f085ca4426d7@kamp.de>
 <11bd7f7a-9022-6c35-3b92-27d6e66f3295@kamp.de>
 <20200116202605.GN3108@work-vm>
 <a1bf5cc0-f32d-48eb-35e4-b895458f8ffe@kamp.de>
MIME-Version: 1.0
In-Reply-To: <a1bf5cc0-f32d-48eb-35e4-b895458f8ffe@kamp.de>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: gnBXuU1VONW3Tz8IxyL4Eg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Lieven (pl@kamp.de) wrote:
> Am 16.01.20 um 21:26 schrieb Dr. David Alan Gilbert:
> > * Peter Lieven (pl@kamp.de) wrote:
> >> Am 16.01.20 um 13:47 schrieb Peter Lieven:
> >>> Am 13.01.20 um 17:25 schrieb Peter Lieven:
> >>>> Am 09.01.20 um 19:44 schrieb Dr. David Alan Gilbert:
> >>>>> * Peter Lieven (pl@kamp.de) wrote:
> >>>>>> Am 08.01.20 um 16:04 schrieb Dr. David Alan Gilbert:
> >>>>>>> * Peter Lieven (pl@kamp.de) wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> I have a Qemu 4.0.1 machine with vhost-net network adapter, that=
s polluting the log with the above message.
> >>>>>>>>
> >>>>>>>> Is this something known? Googling revealed the following patch i=
n Nemu (with seems to be a Qemu fork from Intel):
> >>>>>>>>
> >>>>>>>> https://github.com/intel/nemu/commit/03940ded7f5370ce7492c619dcc=
ced114ef7f56e
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> The network stopped functioning. After a live-migration the vSer=
ver is reachable again.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Any ideas?
> >>>>>>> What guest are you running and what does your qemu commandline lo=
ok
> >>>>>>> like?
> >>>>>> Its running debian9. We have hundreds of other VMs with identical =
setup. Do not know why this one makes trouble.
> >>>>> Could you extract an 'info mtree' from it - particularly the
> >>>>> 'address-space: memory' near the top.
> >>>>
> >>>> Here we go:
> >>>>
> >>>>
> >>>> address-space: memory
> >>>> =A0 0000000000000000-ffffffffffffffff (prio 0, i/o): system
> >>>> =A0=A0=A0 0000000000000000-000000003fffffff (prio 0, i/o): alias ram=
-below-4g @pc.ram 0000000000000000-000000003fffffff
> >>>> =A0=A0=A0 0000000000000000-ffffffffffffffff (prio -1, i/o): pci
> >>>> =A0=A0=A0=A0=A0 00000000000a0000-00000000000affff (prio 2, i/o): ali=
as vga.chain4 @vga.vram 0000000000000000-000000000000ffff
> >>>> =A0=A0=A0=A0=A0 00000000000a0000-00000000000bffff (prio 1, i/o): vga=
-lowmem
> >>>
> >>> What seems special is that the RAM area is prio2. Any idea if this ma=
kes trouble?
> >>
> >> Update from my side. This happens when I have Debian 10 with XFCE when=
 the Graphical User Interface is initialized.
> >>
> >> I see the log message when I specify -M pc-i440fx-2.9. If I obmit the =
machine type the error does not appear.
> > I can't persuade this to reproduce here on the images I currently have;
> > but if you can rebuild, can you try the v3 of 'Fix hyperv synic on
> > vhost' I've just posted?  It turns off the alignment code that's
> > spitting that error in vhost-kernel cases, so should go away.
>=20
> Your patch also seems to fix also my issue. No more errors and the networ=
k keeps responding.

Great, can you reply to that post with a Tested-by ?

Dave

>=20
> Thanks
>=20
> Peter
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



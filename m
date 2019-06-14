Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCC453B2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 06:49:42 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbe9l-0001vw-16
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 00:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35963)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hbe8l-0001Wx-Mv
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 00:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hbe8k-0006Cp-Nr
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 00:48:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hbe3q-00021B-H9; Fri, 14 Jun 2019 00:43:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E8E1B8762F;
 Fri, 14 Jun 2019 04:43:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 557D219C67;
 Fri, 14 Jun 2019 04:43:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A7C311AA3; Fri, 14 Jun 2019 06:43:10 +0200 (CEST)
Date: Fri, 14 Jun 2019 06:43:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-ID: <20190614044310.wxnkwxagr23d5cbt@sirius.home.kraxel.org>
References: <20190612115939.23825-1-shmuel.eiderman@oracle.com>
 <20190612130650.xftda65kgnsefyvs@sirius.home.kraxel.org>
 <A3F8BD49-3C35-4A07-8DE2-85F7CC293DC9@oracle.com>
 <20190612191817.5bilt2abif2xvcbv@sirius.home.kraxel.org>
 <02844D7D-ED79-4744-A203-8E713DE7A717@oracle.com>
 <20190613093850.5k7prawn6x4qt3fi@sirius.home.kraxel.org>
 <730C65DE-A9B4-4553-B6A0-7A3B81A1FA12@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730C65DE-A9B4-4553-B6A0-7A3B81A1FA12@oracle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 14 Jun 2019 04:43:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [QEMU] [PATCH v2 0/8] Add Qemu to SeaBIOS LCHS
 interface
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, arbel.moshe@oracle.com,
 seabios@seabios.org, QEMU <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kevin O'Connor <kevin@koconnor.net>,
 liran.alon@oracle.com, Karl Heubaum <karl.heubaum@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Can there be a guest that will fail the MBR in such a way? Yes.
> Look at the following MBR partition table of a Windows XP guest in our production
> environment:
> 
> Disk size in sectors: 16777216
> 
> Binary (only one partition 16 bytes): 80 01 01 00 07 fe ff ff 3f 00 00 00 d5 ea ff 00
> Start: (0, 1, 1, 63)
> End: (1023, 254, 63, 16771859)
> 
> As can be easily seen, any MBR guessing algorithm should guess:
> 
> 	255 heads (since a value of 254 appears), 63 spt (since a value of 63 appears)
> 
> Turns out that this image does not work with 255, 63 but actually requires
> 
> 	16 heads, 63 spt
> 
> to boot.
> 
> So relying on MBR partitions alone is not always enough and sometimes manual intervention
> is required.

Ok, given that seabios has no setup any manual configuration needs to be done via qemu.

But why do we need a new interface for that?  IDE can pass the geometry
to the guest.  virtio-blk has support too (VIRTIO_BLK_F_GEOMETRY).
Likewise scsi (MODE_PAGE_HD_GEOMETRY).  So this should be doable without
any qemu changes.

cheers,
  Gerd



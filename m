Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3682B9A03
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:53:18 +0100 (CET)
Received: from localhost ([::1]:36092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfo7R-0001mb-Ct
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfo6Z-0001LU-Uh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfo6U-0008MH-Uh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605808338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7ukrd+iIv0292eKfrvFoYJmrxqkOybo+4dDldg37Pw=;
 b=L5TEfKpcVCm+Wy5FN2B4n7OAmNT4X2r6sj4N3lesjXh68T8+n67d46aGvdzI6BDVWm83vn
 AvTrIzrpthKW7SUjGOteA5MkNq4Uh0hvHFa6xMZkpFDJGulfXKej2b0c3d0pQiiaw9OXNi
 pqsF4Xb/rqO3KlHrj3q2ExGCUQzFVwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-OvzBbnzBNNWH1TcOwUhizg-1; Thu, 19 Nov 2020 12:52:14 -0500
X-MC-Unique: OvzBbnzBNNWH1TcOwUhizg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32FD8144ED;
 Thu, 19 Nov 2020 17:52:12 +0000 (UTC)
Received: from gondolin (ovpn-113-214.ams2.redhat.com [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23E05D6A8;
 Thu, 19 Nov 2020 17:52:10 +0000 (UTC)
Date: Thu, 19 Nov 2020 18:52:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 0/2] pc-bios/s390 fixes for reboot-to-vfio-ccw
Message-ID: <20201119185208.562680ff.cohuck@redhat.com>
In-Reply-To: <20201119165729.63351-1-farman@linux.ibm.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 17:57:27 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Hi Conny, Thomas,
> 
> I've come across a couple problems when installing a guest onto a
> vfio-ccw disk. They were noticed when booting off an ISO via virtio,
> and writing the new guest OS to a vfio-ccw connected disk. The
> installation works correctly, in that the disk can be booted and
> used perfectly fine. But the end of the install process reboots to
> the new disk, and we end up with an error that looks like this:
> 
> Rebooting.
> LOADPARM=[        ]
> cio device error
>   ssid  : 0x0000000000000000
>   cssid : 0x0000000000000000
>   sch_no: 0x0000000000000002
>   ctrl-unit type: 0x0000000000003990
> 
> Interrupt Response Block Data:
> : 0x0000000000003990
>     Function Ctrl : [Start]
>     Activity Ctrl : [Start-Pending]
>     Status Ctrl : [Alert] [Primary] [Secondary] [Status-Pending]
>     Device Status :
>     Channel Status : [Program-Check]
>     cpa=: 0x0000000000000008
>     prev_ccw=: 0x0008000080002018
>     this_ccw=: 0x0600001860000080
> Eckd Dasd Sense Data (fmt 32-bytes):
>     Channel Status : [Program-Check]
>     Sense Condition Flags :
>     Residual Count     =: 0x0000000000000000
>     Phys Drive ID      =: 0x0000000000000000
>     low cyl address    =: 0x0000000000000000
>     head addr & hi cyl =: 0x0000000000000000
>     format/message     =: 0x0000000000000000
>     fmt-dependent[0-7] =: 0x0000000000000000
>     fmt-dependent[8-15]=: 0x000000004a200f00
>     prog action code   =: 0x0000000000000000
>     Configuration info =: 0x00000000000040e0
>     mcode / hi-cyl     =: 0x0000000000000000
>     cyl & head addr [0]=: 0x0000000000000000
>     cyl & head addr [1]=: 0x0000000000000000
>     cyl & head addr [2]=: 0x0000000000000000
> dasd-ipl: Failed to run Read IPL channel program
> 
> The problem can be easily (and quickly) reproduced by defining
> XML with two different guest disks, such as:
> 
>     <disk type='block' device='disk'>
>       <driver name='qemu' type='raw'/>
>       <source dev='/dev/disk/by-path/ccw-0.0.1234'/>
>       <target dev='vda' bus='virtio'/>
>       <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x0000'/>
>     </disk>
>     <hostdev mode='subsystem' type='mdev' managed='no' model='vfio-ccw'>
>       <source>
>         <address uuid='12345678-1234-1234-1234-123456789abc'/>
>       </source>
>       <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x1235'/>
>     </hostdev>
> 
> Boot the guest off disk 1234, issue `chreipl 0.0.1235`, and reboot.
> Interestingly, going the other direction (1235->1234) works fine.
> 
> Two things occur here. First, the DASD IPL code builds a Read IPL
> Format-0 CCW at address zero, but assumes that the memory is already
> zero. If data is already present (which on reboot it does, and is
> probably a PSW), it might be included in that CCW. Patch 1 is a
> pretty straightforward fix for this. (Might this one be appropriate
> for 5.2?)

That one is straightforward enough for 5.2, I guess.

> 
> Secondly, the jump code looks at a couple memory locations to determine
> what jump to perform. But in this virtio-to-vfio jump, we should give
> precedence to the data at address zero, rather than the not-yet-cleared
> memory. Patch 2 swaps the order of these checks to enable this, and
> doesn't appear to affect normal disk boots. But there are a hundred
> other boot combinations that I haven't tried here, so could use some
> feedback on this one. I do recognize that this leaves no difference
> between the "if (!memcmp())" case and not, but left it this way to
> help better visualize the change I'm making.

This is in code that usually gives me a headache :(

> 
> Coda:
> I didn't include rebuilt bios patch(es) here, but certainly can.

I think it should not be too hard to have the person picking the
patches generate them :) Especially if we end up going with patch 1
only for now.

> Also, I'm on holiday all next week; so apologies in advance for
> sending a couple patches and then hiding shortly thereafter. :)

That's a time-proven strategy :)

> 
> Eric Farman (2):
>   pc-bios: s390x: Ensure Read IPL memory is clean
>   pc-bios: s390x: Give precedence to reset PSW
> 
>  pc-bios/s390-ccw/dasd-ipl.c |  3 +++
>  pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 



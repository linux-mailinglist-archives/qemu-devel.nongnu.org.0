Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FAE35EE00
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 09:07:14 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWZcG-0004Ua-M2
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 03:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWZbV-00044E-11
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWZbQ-0001p8-5D
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618383977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=55vS67pRoMdTh1v/UfPQQeQjk+Nf2t6qn3DnxmFlGbs=;
 b=ROJFOc2pOa9BDL8vp5u4OFgMgRbVq5ToEshMg8iFzArcGZSxWy10d1omNTo+Sf9oqamiGQ
 /ezzHTdlHGiGWVuUrapZQ66YXh0sYMxOrxfHhUJ39OkjeofElE3BDq7Bi4vGcmxbHHwojO
 Gg4BiiIzMT1IxG/c1TywslfJbL2EhKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-QzvML_dfOLWQpT8sx3bKdA-1; Wed, 14 Apr 2021 03:06:15 -0400
X-MC-Unique: QzvML_dfOLWQpT8sx3bKdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EC410053E7;
 Wed, 14 Apr 2021 07:06:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ED885D6AC;
 Wed, 14 Apr 2021 07:06:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A2A1113525D; Wed, 14 Apr 2021 09:06:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Adam Williamson <1923663@bugs.launchpad.net>
Subject: Re: [Bug 1923663] [NEW] Can't(?) disable default floppy drive any
 more in qemu 6.0
References: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
Date: Wed, 14 Apr 2021 09:06:09 +0200
In-Reply-To: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
 (Adam Williamson's message of "Tue, 13 Apr 2021 20:10:07 -0000")
Message-ID: <87fsztny5a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adam Williamson <1923663@bugs.launchpad.net> writes:

> Public bug reported:
>
> There's a documented change in qemu 6.0:
>
> https://qemu-project.gitlab.io/qemu/system/removed-features.html#floppy-
> controllers-drive-properties-removed-in-6-0
>
> where you can't configure floppy controller device properties with
> -global any more. However, there's a thing you could do with the old
> parameter which I can't figure out a way to do with the documented
> replacement. openQA passed exactly this argument:
>
> -global isa-fdc.driveA=
>
> and that has the effect of removing/disabling the default floppy
> drive/controller. If you just run `qemu-system-i686` (no other args)
> you'll see the VM briefly try to boot from a floppy drive; if you run
> `qemu-system-i686 -global isa-fdc.driveA=` (with an earlier version of
> qemu, obviously) you'll see it does not do so.
>
> I can't see a way to do this with `-device floppy`. Going by the docs,
> the equivalent should be:
>
> -device floppy,unit=0,drive=
>
> but that does not seem to have the same effect. If you run `qemu-
> system-i686 -device floppy,unit=0,drive=`, it still tries to boot from a
> floppy drive.
>
> I see there's a -nodefaults option that disables *all* default devices,
> but I don't think that's what we want here either. We might want the
> other default devices, we just don't want the floppy drive.

= Short answer =

In my opinion, management applications are better off with -nodefaults.
It's easier to understand than the complicated mess I'm going to
describe under "Long answer" below.

If you'd prefer not to, try -global isa-fdc.fdtypeA=none.


= Long answer =

-global isa-fdc.driveA= worked.  Whether it was supported usage or
accidental dirt effect is unclear.  Doesn't matter now.

-nodefaults suppresses a number of backends:

* Character device backend for a serial device

  Also suppressed when -serial ... or -device isa-serial,... or -global
  isa-serial.PROP=VAL is given, or the machine type opts out of this
  backend.

  Backend configuration depends on other options; too complicated to
  explain here.

* Character device backend for a parallel device

  Also suppressed when -parallel ... or -device isa-parallel,... or
  -global isa-parallel.PROP=VAL is given,  or the machine type opts out
  of this backend.

  Backend configuration depends on other options; too complicated to
  explain here.

* Block device backend a floppy device

  Also suppressed when -device isa-fdc,... or -global isa-fdc.PROP=VAL
  or -device floppy or -global floppy.PROP=VAL is given, or the machine
  type opts out of this backend.

* Block device backend a CD-ROM device

  Also suppressed when -device {ide,scsi}-{cd,hd},... or -global
  {ide,scsi}-{cd,hd}.PROP=VAL is given, or the machine type opts out of
  this backend.

* SD card

  Also suppressed when the machine type opts out of this backend.

When a backend exists, the machine type may

* Create a frontend (a.k.a. device model) connected to the backend

* Ignore the backend silently

* Complain about the useless backend

-nodefaults additionally suppresses:

* Default HMP monitor

  Also suppressed when -monitor or -qmp or -qmp-pretty or -mon or
  -serial mon:... or -parallel mon:... is given.

  Monitor configuration depends on other options; too complicated to
  explain here.

* Default network frontend (-net nic) and backend (-net user)

  Also suppressed when -netdev or -nic or -net is given.

  Default backend is only done when we have SLIRP.

* Default VGA type, if any

  Actual type depends on the machine machine type.  Set to "none" when
  -vga or -device DRV,... or -global DRV.PROP=VAL is given, where DRV is
  a VGA device model.

  When the type is not "none", the machine type may:

  * Create a device of that type

  * Ignore the type silently

  * Complain about the type

* Additional stuff depending on the machine type


Questions?



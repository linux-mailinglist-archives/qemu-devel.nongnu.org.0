Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F532D563
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:36:29 +0100 (CET)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHp5Y-0002xa-43
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHp3s-0002Kz-SL
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:34:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHp3r-0001Uh-5V
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614868482;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRgtbHo3GfRla24RXWzD24A7pBLfOwwH0vL1JOgna8g=;
 b=cKCIEjmdnxabov2LhddA5W8N2gKzcLB/I2UjROOCJPMh8U/9/HfQE5OrknNt2aubhNFFQ6
 KoW7aqsdxmy7jJp386K0nWt/MXHv/iVlMYvtBUFBXQSLVCkSYD3TrDzGWALkoVestaalW7
 9Rle5kQeOAnq5uj8E9cf5dbhh3BYbjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-YFWsFfX_NuCXEJVgN3m3tQ-1; Thu, 04 Mar 2021 09:34:38 -0500
X-MC-Unique: YFWsFfX_NuCXEJVgN3m3tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2095193248C;
 Thu,  4 Mar 2021 14:34:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EF91383F;
 Thu,  4 Mar 2021 14:34:16 +0000 (UTC)
Date: Thu, 4 Mar 2021 14:34:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
Message-ID: <YEDv5l/tGdnDtiHh@redhat.com>
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v9a7dmfk.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 03:26:55PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
> >> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> >> configuring floppies with -global isa-fdc" (v5.1.0).
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  docs/system/deprecated.rst       |  26 --
> >>  docs/system/removed-features.rst |  26 ++
> >>  hw/block/fdc.c                   |  54 +--
> >>  tests/qemu-iotests/172           |  31 +-
> >>  tests/qemu-iotests/172.out       | 562 +------------------------------
> >>  5 files changed, 30 insertions(+), 669 deletions(-)
> >> 
> >> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> >> index 2fcac7861e..6a22bc07e2 100644
> >> --- a/docs/system/deprecated.rst
> >> +++ b/docs/system/deprecated.rst
> >> @@ -94,32 +94,6 @@ QEMU 5.1 has three options:
> >>        to the user to load all the images they need.
> >>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
> >>  
> >> -``Configuring floppies with ``-global``
> >> -'''''''''''''''''''''''''''''''''''''''
> >> -
> >> -Use ``-device floppy,...`` instead:
> >> -::
> >> -
> >> -    -global isa-fdc.driveA=...
> >> -    -global sysbus-fdc.driveA=...
> >> -    -global SUNW,fdtwo.drive=...
> >> -
> >> -become
> >> -::
> >> -
> >> -    -device floppy,unit=0,drive=...
> >> -
> >> -and
> >> -::
> >> -
> >> -    -global isa-fdc.driveB=...
> >> -    -global sysbus-fdc.driveB=...
> >> -
> >> -become
> >> -::
> >> -
> >> -    -device floppy,unit=1,drive=...
> >> -
> >>  ``-drive`` with bogus interface type
> >>  ''''''''''''''''''''''''''''''''''''
> >>  
> >> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> >> index c8481cafbd..b0e7350408 100644
> >> --- a/docs/system/removed-features.rst
> >> +++ b/docs/system/removed-features.rst
> >> @@ -38,6 +38,32 @@ or ``-display default,show-cursor=on`` instead.
> >>  QEMU 5.0 introduced an alternative syntax to specify the size of the translation
> >>  block cache, ``-accel tcg,tb-size=``.
> >>  
> >> +``Configuring floppies with ``-global`` (removed in 6.0)
> >> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> >> +
> >> +Use ``-device floppy,...`` instead:
> >> +::
> >> +
> >> +    -global isa-fdc.driveA=...
> >> +    -global sysbus-fdc.driveA=...
> >> +    -global SUNW,fdtwo.drive=...
> >
> > It looks like we're not actually removing the use of -global, rather
> > we're removing the driveA= and driveB= properties entirely, which
> > simply means there's nothing to be set via -global. The distinction
> > is important, because IIUC, it means that libvirt's use of these
> > properties via -device is also impacted eg
> >
> >   -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1,driveB=drive-fdc0-0-1
> >
> > will no longer work too ?
> 
> Correct.
> 
> This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
> floppies with -global isa-fdc" (v5.1.0).  Since then, its use triggers a
> warning:
> 
>     $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=none,id=drive-fdc0-0-0 -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1
>     qemu-system-x86_64: -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1: warning: warning: property isa-fdc.driveA is deprecated
>     Use -device floppy,unit=0,drive=... instead.
> 
> Note the -M q35.  Needed because the default machine type has an onboard
> isa-fdc, which cannot be configured this way.
> 
> Sadly, the commit's update of docs/system/deprecated.rst neglects to
> cover this use.  Looks the series overtaxed my capacity to juggle
> details; my apologies.
> 
> Is libvirt still using these properties?

Unfortunately yes, but it seems like it ought to be fairly easy to
change the syntax. Just need to figure out what the right way to
detect the availability of the new syntax is. Presumably just look
for existance of the 'floppy' device type ?

Can you confirm that switching from -global to the new -device floppy
does /not/ have any live migration impact ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



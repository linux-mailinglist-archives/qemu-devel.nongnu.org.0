Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B332D131
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:53:34 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlbp-0007fB-8E
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlaq-00079u-Ee
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:52:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlan-00019O-He
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855148;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jyecFwxClo92HaHw1n3uyMSDTmEDHjMuCDj+aXDtrs0=;
 b=b0pQHJ6ZJOY5PF0b3Z7vezxpW5WoX0Mxgw1LR+rOzvbLo1BSeWTNh5yxX/S6/rFBZfZJmI
 f6sidgZ/TgcM/Uli3r1m6rIsCaXT3oX9oada2OxcSIhaNE+d81iNgaP18rdwAGsfWLmbVq
 p+LpnJ7Sk8BjRtUKYNbT3aYJUi/XDK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-T2Nf1AkyPOquxu5-NHKKYQ-1; Thu, 04 Mar 2021 05:52:25 -0500
X-MC-Unique: T2Nf1AkyPOquxu5-NHKKYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7394780006E;
 Thu,  4 Mar 2021 10:52:24 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2DAB5C1C2;
 Thu,  4 Mar 2021 10:52:19 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:52:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
Message-ID: <YEC74LYdmj2p8IyY@redhat.com>
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210304100059.157158-2-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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


On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> configuring floppies with -global isa-fdc" (v5.1.0).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst       |  26 --
>  docs/system/removed-features.rst |  26 ++
>  hw/block/fdc.c                   |  54 +--
>  tests/qemu-iotests/172           |  31 +-
>  tests/qemu-iotests/172.out       | 562 +------------------------------
>  5 files changed, 30 insertions(+), 669 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 2fcac7861e..6a22bc07e2 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -94,32 +94,6 @@ QEMU 5.1 has three options:
>        to the user to load all the images they need.
>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>  
> -``Configuring floppies with ``-global``
> -'''''''''''''''''''''''''''''''''''''''
> -
> -Use ``-device floppy,...`` instead:
> -::
> -
> -    -global isa-fdc.driveA=...
> -    -global sysbus-fdc.driveA=...
> -    -global SUNW,fdtwo.drive=...
> -
> -become
> -::
> -
> -    -device floppy,unit=0,drive=...
> -
> -and
> -::
> -
> -    -global isa-fdc.driveB=...
> -    -global sysbus-fdc.driveB=...
> -
> -become
> -::
> -
> -    -device floppy,unit=1,drive=...
> -
>  ``-drive`` with bogus interface type
>  ''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index c8481cafbd..b0e7350408 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -38,6 +38,32 @@ or ``-display default,show-cursor=on`` instead.
>  QEMU 5.0 introduced an alternative syntax to specify the size of the translation
>  block cache, ``-accel tcg,tb-size=``.
>  
> +``Configuring floppies with ``-global`` (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use ``-device floppy,...`` instead:
> +::
> +
> +    -global isa-fdc.driveA=...
> +    -global sysbus-fdc.driveA=...
> +    -global SUNW,fdtwo.drive=...

It looks like we're not actually removing the use of -global, rather
we're removing the driveA= and driveB= properties entirely, which
simply means there's nothing to be set via -global. The distinction
is important, because IIUC, it means that libvirt's use of these
properties via -device is also impacted eg

  -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1,driveB=drive-fdc0-0-1

will no longer work too ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C236E8E4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:35:29 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc412-0000je-HI
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc3yV-0008Q7-1d
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc3yR-0005cK-CE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619692366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5Z3cpzUfPPiftIoM0abEhYBgl7amL5bgaMORW1DNFIE=;
 b=Q74KZR8Xfrj1zZOi/TSXbnHILAniRnnrHBt69WaJ0qJKSVALFPzuwskt9FmQX+N/ZMExEL
 15uCv98jNRPsuJQfvCUAGe0D0JOXemBG/+UgFOfOMNrEhEp2B10kUgOLTI+NdyaBq33uBr
 cTbzeWV3gy01nwaehUiuI1tzWxORtEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-C4VX-1FQNGefgSVXCyr7eQ-1; Thu, 29 Apr 2021 06:32:41 -0400
X-MC-Unique: C4VX-1FQNGefgSVXCyr7eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C594C501EC;
 Thu, 29 Apr 2021 10:32:40 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5F86A90B;
 Thu, 29 Apr 2021 10:32:31 +0000 (UTC)
Date: Thu, 29 Apr 2021 11:32:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YIqLPNScbDYCS89t@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 11:59:41AM +0200, Markus Armbruster wrote:
> Myself, but I only documented it; it's actually Kevin Wolf:
> 
>     ``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use argument ``id`` instead.
> 
>     ``eject`` argument ``device`` (since 2.8.0)
>     '''''''''''''''''''''''''''''''''''''''''''
> 
>     Use argument ``id`` instead.
> 
>     ``blockdev-change-medium`` argument ``device`` (since 2.8.0)
>     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use argument ``id`` instead.
> 
>     ``block_set_io_throttle`` argument ``device`` (since 2.8.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use argument ``id`` instead.

FYI, I did prepare patches for these already, but they broke the iotests.

I found it difficult to figure out the right fix for the iotests, becuase
IIUC "device" and "id" values are different, and I didn't see what "id"
to use when args are still using -drive, not -blockdev.


> Myself:
> 
>     ``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use argument value ``null`` instead.
> 
> Myself, but I only documented it; it's actually Kevin Wolf:
> 
>     ``block-commit`` arguments ``base`` and ``top`` (since 3.1.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     Use arguments ``base-node`` and ``top-node`` instead.

I've also got patches that remove these two, but didn't submit them
as they were behind the patches for the "device" removal.



>     Block device options
>     ''''''''''''''''''''
> 
> Myself:
> 
>     ``"backing": ""`` (since 2.12.0)
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>     In order to prevent QEMU from automatically opening an image's backing
>     chain, use ``"backing": null`` instead.

Unless I'm mistaken,  this appeared to end up being a dupe of the
blockdev-add with empty string deprecation above.

> Myself:
> 
>     ``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1.0)
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>     Options for ``rbd`` should be specified according to its runtime options,
>     like other block drivers.  Legacy parsing of keyvalue pair encoded
>     filenames is useful to open images with the old format for backing files;
>     These image files should be updated to use the current format.
> 
>     Example of legacy encoding::
> 
>       json:{"file.driver":"rbd", "file.filename":"rbd:rbd/name"}
> 
>     The above, converted to the current supported format::
> 
>       json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}

Got patch for this too

All my unsubmitted patches related to block are here:

  https://gitlab.com/berrange/qemu/-/commits/dep-block

NB I've not compile tested them recently since rebasing to git master.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F43B16D8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:30:37 +0200 (CEST)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzDQ-0006da-Cx
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvzC6-0005G6-VT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvzC3-00051S-Hv
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624440550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mQ/yRJpzblFYdIaQ4Kdd80JaxZPJVBVhrxhclWrofbk=;
 b=GACifZO4wlFxnUk57dCbLR3eE3tIgpNHJeEeGL4EiXeTu5Q6SxeMX46M2wl6+agvQro9HR
 Ne3Bm5xd+5I1xy5OyZkhvXc825gZVD/+BQk88MfoL9HTJifaRe42hI+EjgYURJ2Pvx/FMV
 QgZJRT8o1C/W4oDaHJKTn/BMrrwBNCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-LwbzrbrcN3yYriWP_xoobw-1; Wed, 23 Jun 2021 05:29:01 -0400
X-MC-Unique: LwbzrbrcN3yYriWP_xoobw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E2E100CF6F;
 Wed, 23 Jun 2021 09:29:00 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF79810016F8;
 Wed, 23 Jun 2021 09:28:58 +0000 (UTC)
Date: Wed, 23 Jun 2021 10:28:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tom Yan <tom.ty89@gmail.com>
Subject: Re: Regarding commit a9bcedd (SD card size has to be power of 2)
Message-ID: <YNL+19TnvDzK5NNh@redhat.com>
References: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 04:29:54PM +0800, Tom Yan wrote:
> Hi philmd (and others),
> 
> So I just noticed your commit of requiring the size of an emulated SD
> card to be a power of 2, when I was trying to emulate one for an
> actual one (well, it's a microSD, but still), as it errored out.
> 
> You claim that the kernel will consider it to be a firmware bug and
> "correct" the capacity by rounding it up. Could you provide a concrete
> reference to the code that does such a thing? I'm not ruling out that
> some crazy code could have gone upstream because some reviewers might
> not be doing their job right, but if that really happened, it's a
> kernel bug/regression and qemu should not do an equally-crazy thing to
> "fix" it.

I looked back at the original threads for details, but didn't
find any aside from this short message saying it broke Linux:

  https://www.mail-archive.com/qemu-devel@nongnu.org/msg720737.html

Philippe, do you have more details on the problem hit, or pointer
to where the power-of-2 restriction is in Linux ?

> No offense but what you claimed really sounds absurd and ridiculous.
> Although I don't have hundreds of SD cards in hand, I owned quite a
> few at least, like most people do, with capacities ranging from ~2G to
> ~128G, and I don't even recall seeing a single one that has the
> capacity being a power of 2. (Just like vendors of HDDs and SSDs, they
> literally never do that AFAICT, for whatever reasons.)

Yes, this does feel pretty odd to me too, based on the real physical
SD cards I've used with Linux non-power-2 sizes.

Also in general QEMU shouldn't be enforcing restrictions based on
guest behaviour, it should follow the hardware specs. If the
hardware spec doesn't mandate power-of-2 sizes, then QEMU shoud
not require that, even if some guest OS has added an artificial
restriction of its own.

> Besides, even if there's a proper reason for the kernel to "fix" the
> capacity, there's no reason for it to round it up either, because
> obviously there will never be actual storage for the "virtual blocks".
> I've never seen such a behavior so far either with the "mmcblk" hosts
> I've used so far.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



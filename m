Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A432D67F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:25:59 +0100 (CET)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHprS-00030t-Ny
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHpq5-0001vH-5u
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHpq2-0006yO-A9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614871468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NZCcYgxtsnTZ3qQa/d/yIIPlPJvPoXkPiDQ91sWV09k=;
 b=IacB3N7pmK1B3vXyJgtnMG1XNUy/lIsyEBNGicaeoMOCvNtpAcr5fneaWlBHiu66kr7gTS
 IZG8Muzk8XsnIJdgwksoPfVo2RnQ9Do8s+X2sZFyh7god8MdCSrV39wSSr45fMVWS9viir
 DHOerdzGgvyNjyEH6pqcvEked24cXNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-J8_thn97PA-ylq1VBOJo8w-1; Thu, 04 Mar 2021 10:24:23 -0500
X-MC-Unique: J8_thn97PA-ylq1VBOJo8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91BBF87504F;
 Thu,  4 Mar 2021 15:24:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A898B6A8E4;
 Thu,  4 Mar 2021 15:24:17 +0000 (UTC)
Date: Thu, 4 Mar 2021 15:24:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Qemu-devel Digest, Vol 216, Issue 57
Message-ID: <YED7nkvAHVj3PZMW@redhat.com>
References: <mailman.5018.1614765575.30242.qemu-devel@nongnu.org>
 <BE1A7AC3-5C89-4D23-A83A-1FA8ABED1562@gmail.com>
MIME-Version: 1.0
In-Reply-To: <BE1A7AC3-5C89-4D23-A83A-1FA8ABED1562@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 10:07:16AM -0500, Programmingkid wrote:
> 
> 
> > On Mar 3, 2021, at 4:59 AM, qemu-devel-request@nongnu.org wrote:
> > 
> > Message: 1
> > Date: Wed, 3 Mar 2021 10:22:50 +0100
> > From: Gerd Hoffmann <kraxel@redhat.com>
> > To: Akihiko Odaki <akihiko.odaki@gmail.com>
> > Cc: qemu-devel@nongnu.org
> > Subject: Re: [PATCH 1/2] coreaudio: Drop support for macOS older than
> > 	10.6
> > Message-ID: <20210303092250.x7j6kcyrv3qjghrl@sirius.home.kraxel.org>
> > Content-Type: text/plain; charset=us-ascii
> > 
> > On Mon, Mar 01, 2021 at 08:45:53PM +0900, Akihiko Odaki wrote:
> >> Mac OS X 10.6 was released in 2009.
> > 
> > Also minimum version required my qemu is 10.13 (I think),
> > so any code for older macos versions is dead anyway.
> > 
> > take care,
> >  Gerd
> 
> This stinks. Older versions of Mac OS X were perfectly fine for
> running QEMU on. All my intel Macs run  Mac OS X versions before
> 10.13. I'm thinking we should at least support Mac OS 10.10 and higher.

QEMU has to draw a line about how far back we attempt to support OS
platforms. There is a tradeoff between the maintainer burden of old
platforms, and how many users actually benefit from it. The older
the OS platform, the fewer users care about new QEMU, and thus the
benefit ceases to outweigh the costs to maintainers. IOW, we want
to spend maintainer resources in areas where we maximise the user
benefit.

QEMU aims to support the currently shipping major version at all
times, and the previous shippin major version for an additional
two years:

  https://qemu-project.gitlab.io/qemu/system/build-platforms.html

So from a macOS pov our support platform only guarantees that
we'll target macOS 11, and macOS 10.15 until Nov 2022 (2 years
after macOS 11 release date).  Earlier macOS versions may happen
to work too, but we're not going to guarantee that or go out of
our way to ensure it continues to be the cast.

This will certainly make some people unhappy if they're using old
OS platforms, but we believe this is ultimately better for the
QEMU userbase as a whole to focus on platforms where we benefit
the largest set of people.

Since this is open source, users of old platforms always have the
choice of using many existing releases of QEMU, even once latest
QEMU release drops a platform.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



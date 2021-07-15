Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B383CA3DB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 19:20:39 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m452M-0008D9-9n
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 13:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m451J-0007PN-5L
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 13:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m451G-0003eO-0W
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 13:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626369568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mYzDlwoVaLOn6INOVbdHW1P3RK3Fi1KEFlbx3TGNVgY=;
 b=LjgQiZe6wJvsgBEjEVVTziVsKtHxN/6mlJHe/Q5eCxkWh6WoVUCvCWa9mgf8AgmxGoOU0t
 VpRYkXNxs6fa3ca5Sac+60TqvB9gXqYxyQmg5XHgkEBda5qLKtAWOX408VRDxwQLyaDsXm
 OdVFMRR6pPTnRK/JVwFwz+aFVhyaVvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-yKv-9XYENmWIBMqPOwe1jA-1; Thu, 15 Jul 2021 13:19:18 -0400
X-MC-Unique: yKv-9XYENmWIBMqPOwe1jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D7971084F4B;
 Thu, 15 Jul 2021 17:19:17 +0000 (UTC)
Received: from redhat.com (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5316360C05;
 Thu, 15 Jul 2021 17:19:08 +0000 (UTC)
Date: Thu, 15 Jul 2021 18:19:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
Message-ID: <YPBuCaSzQBQjIeD3@redhat.com>
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
 <a18fd577-7f23-2e4f-0833-1ac13310313d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a18fd577-7f23-2e4f-0833-1ac13310313d@virtuozzo.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>, den@openvz.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 08:13:40PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 03.07.2021 17:50, Nir Soffer wrote:
> > On Sat, Jul 3, 2021 at 4:51 PM Vladimir Sementsov-Ogievskiy
> > <vsementsov@virtuozzo.com> wrote:
> 
> [..]
> 
> > > +
> > > +Important notice: Qemu may fallback to POSIX file locks only if OFD locks
> > > +unavailable. Other programs should behave similarly: use POSIX file locks
> > > +only if OFD locks unavailable and if you are OK with drawbacks of POSIX
> > > +file locks (for example, they are lost on close() of any file descriptor
> > > +for that file).
> > 
> > Worth an example.
> 
> Hmm.. Copying here the whole #ifdef and probing logic around these locks from Qemu is too much..
> 
> I can't imagine what small and short could be added here.
> 
> Actually I think, OFD is old enough so we shouldn't care
> too much about older kernels without it. Let's just rewrite
> paragraph to something like this:

Yes, that's a good point. From a Linux POV, I think our platform
support matrix means we can assume existance of OFD locking
unconditionally. The kernel impl transparently applies to all
filesystems too.

So we could likely change the code such that Linux always uses
OFD and non-Linux uses traditional POSIX locks.

> Related question, are POSIX locks somehow compatible with OFD
> locks? If one program use OFD and the other use POSIX locks on
> the same file.. Will it work or not?

Yes, the kernel level implementation uses the same locking primitives
internally. The only difference between the two is how they're invoked
from userspace, and the semantics around lock release when closing
files. So it is fully compatible with applications mixing the two
APIs for fcntl POSIX and OFD locking

The flock() syscall is however completely independant locking
from the fcntl based locking.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



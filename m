Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7983D3DBB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:40:21 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yDk-0001Un-BL
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6yBo-0007rv-Cy
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6yBl-0000Si-MZ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/KTerWmCXJKKubeE5f+vl/NONMoP0D8flc39sMTie3c=;
 b=Farozw6H1KM0FKR72AD/cnoSHuj0F8hQ0ovDQ4ICME5EK5qV8ZFpz+BBtY2iZ5TJfD7ZFQ
 TR0+rF4dVWvuKEbopa7OQxbyNadJg5br7fZOsV2Zb/xlwJJnrFkoCxBaoK8d964Y/fxhGI
 kClB0bVOFplEoLXpDse3rN+yti/DODA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-fo-c-W-XP1G9zQ0xA25HfQ-1; Fri, 23 Jul 2021 12:38:12 -0400
X-MC-Unique: fo-c-W-XP1G9zQ0xA25HfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC83E1084F54;
 Fri, 23 Jul 2021 16:38:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5280A10016FB;
 Fri, 23 Jul 2021 16:38:09 +0000 (UTC)
Date: Fri, 23 Jul 2021 17:38:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
Message-ID: <YPrwbgY9Q4e1ORP1@redhat.com>
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com>
 <YPrr72N494WKnJA5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPrr72N494WKnJA5@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: vsementsov@virtuozzo.com, eblake@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 06:18:55PM +0200, Kevin Wolf wrote:
> Am 23.07.2021 um 12:33 hat Richard W.M. Jones geschrieben:
> > Under SELinux, Unix domain sockets have two labels.  One is on the
> > disk and can be set with commands such as chcon(1).  There is a
> > different label stored in memory (called the process label).  This can
> > only be set by the process creating the socket.  When using SELinux +
> > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > you must set both labels correctly first.
> > 
> > For qemu-nbd the options to set the second label are awkward.  You can
> > create the socket in a wrapper program and then exec into qemu-nbd.
> > Or you could try something with LD_PRELOAD.
> > 
> > This commit adds the ability to set the label straightforwardly on the
> > command line, via the new --selinux-label flag.  (The name of the flag
> > is the same as the equivalent nbdkit option.)
> > 
> > A worked example showing how to use the new option can be found in
> > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> 
> I suppose this would also be relevant for the built-in NBD server,
> especially in the context of qemu-storage-daemon?

It depends on the usage scenario really. nbdkit / qemu-nbd are
not commonly run under any SELinux policy, so then end up being
unconfined_t. A QEMU NBD client can't connect to an unconfined_t
socket, so we need to override it with this arg.

In the case of qemu system emulator, under libvirt, it will
already have a svirt_t type, so in that case there is no need
to override the type for the socket.

For qsd there's not really any strong practice established
but i expect most current usage is unconfined_t too and
would benefit from setting label.

> If so, is this something specific to NBD sockets, or would it actually
> make sense to have it as a generic option in UnixSocketAddress?

It is applicable to inet sockets too in fact.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



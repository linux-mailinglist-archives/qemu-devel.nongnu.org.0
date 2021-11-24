Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1C45CBB1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:59:49 +0100 (CET)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpwYd-000356-U4
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:59:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpwWN-0008Fm-E6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpwWJ-0002Dc-TI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637776642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xgrwY3EFaJ8SCSjz/NQ5Wh/uHsMp5G3K1CXWMKPk5S4=;
 b=Ace/kUkd9uHbfsgvdeBhK4SE8rMWqSagc+nCHY74GlQasBNpYXvbYS8M6sEamT+aldhgmf
 p/EkHH4uyrPICp1SZdxvbiWs62U+6f4/i7aCluKt8qYtlOBWLebVXYe1LrqQ8PsPi9RhNe
 f4puCudeYx/KlDz2YYmyzQy16fToWLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-72Krb9BzMwyNLzB0cwrhww-1; Wed, 24 Nov 2021 12:57:17 -0500
X-MC-Unique: 72Krb9BzMwyNLzB0cwrhww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD25383DCC9
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 17:57:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5B81B4B8;
 Wed, 24 Nov 2021 17:57:15 +0000 (UTC)
Date: Wed, 24 Nov 2021 17:57:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ58+T04uVXaO2Ab@redhat.com>
References: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: John Ferlan <jferlan@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> Hi,
> 
> We recently discussed a way for remote SEV guest attestation through QEMU.
> My initial approach was to get data needed for attestation through different
> QMP commands (all of which are already available, so no changes required
> there), deriving hashes and certificate data; and collecting all of this
> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> provided, QEMU would then need to have support for attestation before a VM
> is started. Upon speaking to Dave about this proposal, he mentioned that
> this may not be the best approach, as some situations would render the
> attestation unavailable, such as the instance where a VM is running in a
> cloud, and a guest owner would like to perform attestation via QMP (a likely
> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> commands, as this could be an issue.

As a general point, QMP is a low level QEMU implementation detail,
which is generally expected to be consumed exclusively on the host
by a privileged mgmt layer, which will in turn expose its own higher
level APIs to users or other apps. I would not expect to see QMP
exposed to anything outside of the privileged host layer.

We also use the QAPI protocol for QEMU guest agent commmunication,
however, that is a distinct service from QMP on the host. It shares
most infra with QMP but has a completely diffent command set. On the
host it is not consumed inside QEMU, but instead consumed by a
mgmt app like libvirt. 

> So I ask, does anyone involved in QEMU's SEV implementation have any input
> on a quality way to perform guest attestation? If so, I'd be interested.

I think what's missing is some clearer illustrations of how this
feature is expected to be consumed in some real world application
and the use cases we're trying to solve.

I'd like to understand how it should fit in with common libvirt
applications across the different virtualization management
scenarios - eg virsh (command line),  virt-manger (local desktop
GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
And of course any non-traditional virt use cases that might be
relevant such as Kata.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



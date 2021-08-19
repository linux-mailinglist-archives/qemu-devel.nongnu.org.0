Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E213F15A0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 10:54:29 +0200 (CEST)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGdoi-0003Fw-ET
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 04:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGdnt-0002br-K8
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGdnp-0006Sn-RX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629363211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n0cxvB9EVCCs2/N2tEZ3IHFvFTuWmpBVkAroKWJq3es=;
 b=EEx8OTlr+ToXRILOgr3WpLh7iGdM5qtB4RrId5PG5Kh8GCdRkwcNE0ZHeCvSorfiN5JBWs
 y+PnuLF1qq/yEp0IYJRfom2fjNeBpPoDk9RYK4ozM7lS7VzCn5wPb8fBVnKGITDkd4g8KJ
 ivKgP100CsoUsaUgllSrvpGK3jh6eOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-enxuPc6JOJuPUFzMdILygg-1; Thu, 19 Aug 2021 04:53:24 -0400
X-MC-Unique: enxuPc6JOJuPUFzMdILygg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4651008063;
 Thu, 19 Aug 2021 08:53:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F34BE19D9D;
 Thu, 19 Aug 2021 08:53:16 +0000 (UTC)
Date: Thu, 19 Aug 2021 09:53:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Is QEMU's vmxnet3 still being used?
Message-ID: <YR4b9J7jlfrd84BK@redhat.com>
References: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jason Wang <jasowang@redhat.com>, Leonid Bloch <leonid@daynix.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 03:42:23PM +0200, Thomas Huth wrote:
> 
>  Hi all,
> 
> I recently noticed that we have quite a bunch of tickets against the vmxnet3
> device in our bug trackers, which indicate that this device could be used to
> crash QEMU in various ways:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues?state=opened&search=vmxnet3
> 
>  https://bugs.launchpad.net/qemu?field.searchtext=vmxnet3

IIUC, all except 3 of those bugs, are issues from the device fuzzer.

It is nice that we find those, but if we don't consider this a device
targetted at virtualization use cases, I don't think they're a reason
to remove the device.

> Having hardly any knowledge about this device and its usage at all, I wonder
> how much it is still used out there in the wild? If there are still many
> users of this device, is there anybody interested here in helping to get
> these crashes fixed in the near future? Otherwise, should we maybe rather
> mark this device as deprecated and remove it in a couple of releases? What
> do you think?

We've got countless NIC models in QEMU most of which have minimal users,
are possibly buggy, not actively maintained, but exist to support
non-virtualization use cases. We've especially not had "how many users
are there" as a criteria for acceptance or removal of a device.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



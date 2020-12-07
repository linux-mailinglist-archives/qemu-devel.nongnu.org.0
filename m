Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B22D0E0B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:33:43 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDpu-0006BJ-Ll
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDmz-0004Tz-IX
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDmx-0005RZ-Ob
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607337039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vXZ2o6b8sQrKj5YTMyKVJAv4kGUSbpttOotxa8ip+Ys=;
 b=dfOC9y5596YN1dQoCUd0e6NmhgSyxyM0d/Tp61ytBQsjeW7uoDLdJnJ8Q8Krsh8Wi15qMb
 Ccx8DtSWwQ3msHVWruedac8B1mOQ8r0YPbvjZxQtxc/WdHZSXenzyWtrq+n3yM40k/rkuL
 b44QMJJ4UwQaukWp/W+OvXxneVemcCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-tlted-6-PkSeZRk9lPxQxw-1; Mon, 07 Dec 2020 05:30:37 -0500
X-MC-Unique: tlted-6-PkSeZRk9lPxQxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99129107ACE4;
 Mon,  7 Dec 2020 10:30:35 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3916D5D6AB;
 Mon,  7 Dec 2020 10:30:33 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:30:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/4] User creatable object property setting fixes
Message-ID: <20201207103027.GH3102898@redhat.com>
References: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201130105615.21799-1-kwolf@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: jasowang@redhat.com, fnu.vikram@xilinx.com, qemu-devel@nongnu.org,
 pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 11:56:11AM +0100, Kevin Wolf wrote:
> While writing a QAPI schema for all user creatable QOM objects, I found
> a few problems in the existing property setting code of objects.
> 
> This series fixes some crashes and memory leaks related to property
> setting in user creatable objects.
> 
> There are many more problems of the sort that updating a property at
> runtime is allowed by most objects, but they aren't actually prepared to
> handle the update, so it doesn't result in the expected behaviour. I'm
> not trying to fix bugs of this class in this series.
> 
> Kevin Wolf (4):
>   crypto: Move USER_CREATABLE to secret_common base class
>   crypto: Forbid broken unloading of secrets
>   crypto: Fix memory leaks in set_loaded for tls-*

I've queued these three patches

>   can-host: Fix crash when 'canbus' property is not set
> 
>  crypto/secret.c         | 14 --------------
>  crypto/secret_common.c  | 21 ++++++++++++++++++---
>  crypto/secret_keyring.c | 14 --------------
>  crypto/tlscredsanon.c   |  3 +--
>  crypto/tlscredspsk.c    |  3 +--
>  crypto/tlscredsx509.c   |  3 +--
>  net/can/can_host.c      |  5 +++++
>  7 files changed, 26 insertions(+), 37 deletions(-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F141C391
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:39:08 +0200 (CEST)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVXvX-0007Bj-Ae
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVXsS-0005Va-6w
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVXsL-00080p-LB
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632915347;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=slnn17+p6DbA1Y7VKEvWLQ2FLx4m+nfEWywltLk/IoQ=;
 b=FteS3tmdzoXsMttJFJfPFVzUFW6JYA/xJaWa9nzMReKUpx7WZBihfrL9WBQq3RZ6fvEP51
 Ec0VgEo764yWNnjLdUATKf884b6Kd0gqIrUgCQqX2GqeVwqFGW8d8NVI+WxKQl50T9N3iR
 uii03lYQhy/9DTyrbt03tUSnv6OsS9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-5GyEROTSOSCJirDMRF8omA-1; Wed, 29 Sep 2021 07:35:27 -0400
X-MC-Unique: 5GyEROTSOSCJirDMRF8omA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9CE100C661;
 Wed, 29 Sep 2021 11:35:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40B5D60BE5;
 Wed, 29 Sep 2021 11:35:25 +0000 (UTC)
Date: Wed, 29 Sep 2021 12:35:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: blockdev driver=file,filename=/dev/block forbidden?
Message-ID: <YVRPeq/1RI0/LPOG@redhat.com>
References: <ed1f265b-6db8-846e-cb52-09c3999d07bf@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <ed1f265b-6db8-846e-cb52-09c3999d07bf@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 02:21:58PM +0300, Michael Tokarev wrote:
> Commit 8d17adf34f501ded65a106572740760f0a75577c
> "block: remove support for using "file" driver with block/char devices"
> explicitly forbids usage of file driver for block devices.
> 
> But _why_?
> 
> Hasn't we always used file for everything on *nix? And what's the _actual_
> difference between file and host_device?

There are various things QEMU does differently for plain files vs
block devices. The check for read-only volume, determining data
transfer size, media geometry, supporting discard. This is seen
in the BlockDriver structs that have different callbacks for each.

> Please note this change has been added to qemu long before libvirt has
> been adapted (I guess there's no released libvirt can be used with
> qemu 6.0+).

Can you show your libvirt guest XML config that is causing trouble, as
it has done the right thing here for  a long while AFAIK, so I suspect
a mis-configuration.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



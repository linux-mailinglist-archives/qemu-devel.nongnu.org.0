Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32A41C452
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 14:09:36 +0200 (CEST)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYP0-0006Mo-B1
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 08:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVYMP-00043X-DH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVYMM-0004tB-0r
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632917208;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHuK4lQc2B6wt2os4yCvLnaVndGLbTwIoK2nKf930uw=;
 b=aJ7lAdku2vdOhxB+WlA6znD5arOyHa/XODPNmDa/P8VTKCgkGZfmPt7l5rhWOW3MWOG1F5
 m6WlECtXAflAJ1EbnekOvKer2zEK+qlicFt3dKrJGbY+yjuBl8FLf97WA6INzJsxa9Fli5
 vMjUkoHn8YkTrBS1k9B0+gMhEfieN0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-wDPsLHJsOoKnOrAuBoFVaA-1; Wed, 29 Sep 2021 08:06:43 -0400
X-MC-Unique: wDPsLHJsOoKnOrAuBoFVaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C2E1052BB3;
 Wed, 29 Sep 2021 12:06:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E37C60854;
 Wed, 29 Sep 2021 12:06:18 +0000 (UTC)
Date: Wed, 29 Sep 2021 13:06:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: blockdev driver=file,filename=/dev/block forbidden?
Message-ID: <YVRWt/riIaMO4F8Y@redhat.com>
References: <ed1f265b-6db8-846e-cb52-09c3999d07bf@msgid.tls.msk.ru>
 <YVRPeq/1RI0/LPOG@redhat.com>
 <1232448f-c7e4-9d97-c667-4400bf279109@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <1232448f-c7e4-9d97-c667-4400bf279109@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 02:46:56PM +0300, Michael Tokarev wrote:
> 29.09.2021 14:35, Daniel P. Berrangé wrote:
> > On Wed, Sep 29, 2021 at 02:21:58PM +0300, Michael Tokarev wrote:
> > > Commit 8d17adf34f501ded65a106572740760f0a75577c
> > > "block: remove support for using "file" driver with block/char devices"
> > > explicitly forbids usage of file driver for block devices.
> > > 
> > > But _why_?
> > > 
> > > Hasn't we always used file for everything on *nix? And what's the _actual_
> > > difference between file and host_device?
> > 
> > There are various things QEMU does differently for plain files vs
> > block devices. The check for read-only volume, determining data
> > transfer size, media geometry, supporting discard. This is seen
> > in the BlockDriver structs that have different callbacks for each.
> 
> Well, I took a look at file-posix.c meanwhile.
> And I see no actual reason to require the user to change driver.
> It definitely is not user-friendly :)
> 
> It can open the file (with 'file' driver) and check if it is a
> regular file or a block (or char) device, and use corresponding
> callbacks in each case. Or just remember the "blockiness" of the
> underlying file and do a simple if() around it.
> 
> Having the user to *require* to change driver like this is.. strange.
> 
> I often use symlinks in our VM scripts which points to file or a block
> device - eg, a vm with a name grabs all /guest/name-foo.img - be these
> regular files or symlinks to /dev/mapper/foo..  And while it is
> not that big issue to change a script to add detection of blkdev/file,
> it is definitely not as easy for a user. And the thing is again - why
> qemu can't do that automatically, this is exactly the place where computers
> are good for..
> 
> Yes, some "sub-parameters" are different.  There, we can either error-out
> for a given parameter when it can't be used for a given file "type", or
> can have some relaxed warning instead.  But when there's no such specific
> parameters are given, I for one see no reason to require the user to
> change configuration when qemu itself can trivially figure it out..
> 
> I can (try to) produce a patch of this theme.
> 
> > > Please note this change has been added to qemu long before libvirt has
> > > been adapted (I guess there's no released libvirt can be used with
> > > qemu 6.0+).
> > 
> > Can you show your libvirt guest XML config that is causing trouble, as
> > it has done the right thing here for  a long while AFAIK, so I suspect
> > a mis-configuration.
> 
> This started as https://bugs.debian.org/993688 which leads to
> https://gitlab.com/libvirt/libvirt/-/issues/212 which created only
> 3 weeks ago. While the commit in question has been committed
> in February.

The libvirt gitlab issue there is closed as not-a-bug, as the
user had told libvirt <disk type="file" > instead of
<disk type="block">.

The same mistake is present in the XML shown in the debian bug.

Even before the QEMU change, this mistake would cause trouble with
certain areas of libvirt functionality too, especially around
migration and snapshotting.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



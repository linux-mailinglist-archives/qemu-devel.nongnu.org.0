Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E531B862
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:52:49 +0100 (CET)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcQq-00079o-1b
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcPZ-0005qh-HW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcPW-0003YS-3X
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613389884;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aq6kwMcnHljxeQrqjbjqHhLdIbIoDKL4sDh4lHX1Fik=;
 b=B/Z4Z7LBx7suOQDgj81kHaYMGMBG5X3hjSov5dQnoQts0lOdKNHTM71T8UnOBlk9NkkGgY
 PIFLK6wa9wsFqfIP7vgqXiYh1h7IM68hjwqmpdgo/28P0mEm14g8PHvB7QdoEl8HVxxWPw
 mKijDkdcE+esXMnAg91rCwx+JpBDtsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Hsk41lsZNKmHNEGZXpbZeg-1; Mon, 15 Feb 2021 06:51:23 -0500
X-MC-Unique: Hsk41lsZNKmHNEGZXpbZeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08AD21E565;
 Mon, 15 Feb 2021 11:51:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8D45B698;
 Mon, 15 Feb 2021 11:51:17 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:51:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
Message-ID: <20210215115114.GE1542881@redhat.com>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
 <20210215102401.GB1542881@redhat.com>
 <4b010479-bd8b-85e9-ef29-88524fef6495@kamp.de>
 <20210215114101.GD1542881@redhat.com>
 <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
MIME-Version: 1.0
In-Reply-To: <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, ct@flyingcircus.io,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 12:45:01PM +0100, Peter Lieven wrote:
> Am 15.02.21 um 12:41 schrieb Daniel P. Berrangé:
> > On Mon, Feb 15, 2021 at 12:32:24PM +0100, Peter Lieven wrote:
> > > Am 15.02.21 um 11:24 schrieb Daniel P. Berrangé:
> > > > On Tue, Jan 26, 2021 at 12:25:34PM +0100, Peter Lieven wrote:
> > > > > even luminous (version 12.2) is unmaintained for over 3 years now.
> > > > > Bump the requirement to get rid of the ifdef'ry in the code.
> > > > We have clear rules on when we bump minimum versions, determined by
> > > > the OS platforms we target:
> > > > 
> > > >     https://qemu.readthedocs.io/en/latest/system/build-platforms.html
> > > > 
> > > > At this time RHEL-7 is usually the oldest platform, and it
> > > > builds with RBD 10.2.5, so we can't bump the version to 12.2.
> > > > 
> > > > I'm afraid this patch has to be dropped.
> > > 
> > > I have asked exactly this question before I started work on this series and got reply
> > > 
> > > from Jason that he sees no problem in bumping to a release which is already unmaintained
> > > 
> > > for 3 years.
> > I'm afraid Jason is wrong here.  It doesn't matter what the upstream
> > consider the support status to be. QEMU targets what the OS vendors
> > ship, and they still consider this to be a supported version.
> 
> 
> Okay, but the whole coroutine stuff would get a total mess with all the ifdef'ry.

Doesn't seem like the write zeros code is adding much more comapred to
the ifdefs that already exist... 


> Would it be an option to make a big ifdef in the rbd driver? One with old code for < 12.0.0 and one
> 
> with new code for >= 12.0.0?

..but I don't have a strong opinion on that, since I'm not maintaining this
driver.


BTW, we will be free to drop RHEL-7 in the next development cycle of
QEMU, starting after the forthcoming 6.0.0 release is out, as it will
fall out of our OS support matrix.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



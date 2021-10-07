Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C8424F6D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:48:13 +0200 (CEST)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYP4W-0008VY-8q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYP2X-0006xc-2k
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYP2U-0001Y6-Ts
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633596366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6EL7uuPeYGFdFKFzOuX/YbWGLEY7/c2ZSAAd7jjAni4=;
 b=T44je2J9E4nHxeMv+v4PkMHk4HSzbH+CCl+zoC94F6eEgtA8SKjpgFF3nS7R2Db63rCt2F
 he8RvOVVbyPVkRUIrjA1guJQKPsKsrZlsge+ufFGL7+8kSXf774s/UNS5Y6GcLAXyShkxo
 kCd5Y89IjqPHoLmCQRhyEbBNiJigKoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-WDSK8LjzPRqLtwp2zh_PAw-1; Thu, 07 Oct 2021 04:45:58 -0400
X-MC-Unique: WDSK8LjzPRqLtwp2zh_PAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 582111926DD1;
 Thu,  7 Oct 2021 08:45:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6577A5D9C6;
 Thu,  7 Oct 2021 08:45:56 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:45:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test
 297
Message-ID: <YV6zwkzPDxgOeIoW@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-2-eesposit@redhat.com>
 <YV3S9N8SnU4W+aYL@redhat.com>
 <3a143653-582e-5b28-f536-bf24c4e45ac8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3a143653-582e-5b28-f536-bf24c4e45ac8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2021 um 09:51 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> On 06/10/2021 18:46, Kevin Wolf wrote:
> > Am 06.10.2021 um 15:00 hat Emanuele Giuseppe Esposito geschrieben:
> > > Test 297 in qemu-iotests folder currently fails: pylint has
> > > learned new things to check, or we simply missed them.
> > > 
> > > All fixes in this patch are related to additional spaces used
> > > or wrong indentation.
> > > 
> > > No functional change intended.
> > > 
> > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > 
> > > @@ -87,13 +87,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
> > >           iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
> > >                            '1G')
> > > -        result = self.vm.qmp('blockdev-add', **{
> > > +        result = self.vm.qmp('blockdev-add',
> > > +                             **{
> > >                                    'node-name': 'overlay',
> > >                                    'driver': iotests.imgfmt,
> > >                                    'file': {
> > >                                        'driver': 'file',
> > >                                        'filename': self.overlay_img
> > > -                                 }
> > > +                                     }
> > >                                })
> > >           self.assert_qmp(result, 'return', {})
> > 
> > Am I the only one to think that the new indentation for the closing
> > brace there is horrible? PEP-8 explictly allows things like:
> > 
> >      my_list = [
> >          1, 2, 3,
> >          4, 5, 6,
> >      ]
> > 
> > Some of the other changes in this patch should be made, but at least if
> > these are behind different switches, I would consider just disabling the
> > one that complains about nicely formatted dicts.
> 
> The error is "C0330: Wrong hanging indentation"
> so it is not about dicts. I guess we can disable the error, but the problem
> is that we will disable it for the whole file, which doesn't seem right.

Actually, I would disable it globally in pylintrc because building
dictionaries for JSON is something that we do a lot.

But then I'm surprised that this is the only instance that actually
fails. I wonder what the difference is.

For example, 129 doesn't seem to be skipped and has this code:

    result = self.vm.qmp('blockdev-add', **{
                             'node-name': 'overlay',
                             'driver': iotests.imgfmt,
                             'file': {
                                 'driver': 'file',
                                 'filename': self.overlay_img
                             }
                         })

Yet you don't report a pylint error for this file.

Oooh... I think I do see a difference: The final line is indented by one
space more in the case that fails for you. It should be vertically
aligned with the "'" in the first line, but it is actually aligned with
the "b" of "blockdev-add".

Does removing one space of indentation in the last line fix the report?

Kevin



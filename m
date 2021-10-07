Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F54258E5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:06:59 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWrD-0001Ft-14
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYWpY-0000OE-KX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYWpW-00012o-U1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633626314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QaQVslBRwEWgg+idMhtsAtnx2KhxqJyAx1p3uJs6yy8=;
 b=hWfgIU6xHMAsTxkSA0JHs75ftu2fle70zq6FkE+S7xMxAKORLLr0jzN4d7bIaBVbAnyOoO
 kLP2OFcWygfcDxBmILRIcCzst4KxQ01SpU0WoBqkS85YCSau93PGfEd32rragD9Kr3/Zfu
 t+zOLbQhmRNsx1GnKss2ntyEttgkd5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-VfIlT6JVNgyRVoKXkAmQQw-1; Thu, 07 Oct 2021 13:05:08 -0400
X-MC-Unique: VfIlT6JVNgyRVoKXkAmQQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E5C925C71;
 Thu,  7 Oct 2021 16:28:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5F3216C2;
 Thu,  7 Oct 2021 16:25:37 +0000 (UTC)
Date: Thu, 7 Oct 2021 18:25:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test
 297
Message-ID: <YV8fgDlCuBFwlze3@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-2-eesposit@redhat.com>
 <YV3S9N8SnU4W+aYL@redhat.com>
 <3a143653-582e-5b28-f536-bf24c4e45ac8@redhat.com>
 <YV6zwkzPDxgOeIoW@redhat.com>
 <6b234a38-1604-ba25-2542-a353e2150c94@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6b234a38-1604-ba25-2542-a353e2150c94@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 07.10.2021 um 12:34 hat Emanuele Giuseppe Esposito geschrieben:
> 
> > > The error is "C0330: Wrong hanging indentation"
> > > so it is not about dicts. I guess we can disable the error, but the problem
> > > is that we will disable it for the whole file, which doesn't seem right.
> > 
> > Actually, I would disable it globally in pylintrc because building
> > dictionaries for JSON is something that we do a lot.
> > 
> > But then I'm surprised that this is the only instance that actually
> > fails. I wonder what the difference is.
> > 
> > For example, 129 doesn't seem to be skipped and has this code:
> 
> 
> > 
> >      result = self.vm.qmp('blockdev-add', **{
> >                               'node-name': 'overlay',
> >                               'driver': iotests.imgfmt,
> >                               'file': {
> >                                   'driver': 'file',
> >                                   'filename': self.overlay_img
> >                               }
> >                           })
> > 
> > Yet you don't report a pylint error for this file.
> 
> Well, unless I am misunderstanding something... 129 *is* the file I am
> reporting. And that is exactly the function where pylint complains.

Indeed, my bad. I got confused there.

And the other files that do something similar are all in SKIP_FILES in
297. So it looks like we don't have another case to copy.

> > 
> > Oooh... I think I do see a difference: The final line is indented by one
> > space more in the case that fails for you. It should be vertically
> > aligned with the "'" in the first line, but it is actually aligned with
> > the "b" of "blockdev-add"
> > 
> > Does removing one space of indentation in the last line fix the report?
> 
> It's not only the final line, it's from "**{" till the ending ")".
> 'node-name' is under "ock" of 'blockdev-add'. It is clearly bad indented,
> regardless of the new style and pylint new rules.
> 
> Pylint itself suggests to move it 4 spaces more than "result =", ie 21
> spaces before.
> 
> Still, applying your suggestion to all the lines and removing 1 space from
> all lines still does not make pylint happy, as it asks to remove 20 spaces.
> 
> To simplify things, this is the error I get:
> 
>  === pylint ===
> +************* Module 129
> +129:91:0: C0330: Wrong hanging indentation (remove 21 spaces).
> +                                 'node-name': 'overlay',
> +            |                    ^ (bad-continuation)
> +129:92:0: C0330: Wrong hanging indentation (remove 21 spaces).
> +                                 'driver': iotests.imgfmt,
> +            |                    ^ (bad-continuation)
> +129:93:0: C0330: Wrong hanging indentation (remove 21 spaces).
> +                                 'file': {
> +            |                    ^ (bad-continuation)
> +129:97:0: C0330: Wrong hanging indentation.
> +                             })
> +        |   |                ^ (bad-continuation)
> 
> So unless you want to disable it overall, one way of fixing 129 is to follow
> what pylint suggests, and do like I wrote in the previous email:
> 
> Either:
>         result = self.vm.qmp('blockdev-add', **{
>             'node-name': 'overlay', 		<-- 21 spaces less
>             'driver': iotests.imgfmt,		<-- 21 spaces less
>             'file': {				<-- 21 spaces less
>                 'driver': 'file',		<-- 21 spaces less
>                 'filename': self.overlay_img	<-- 21 spaces less
>             }					<-- 21 spaces less
>         })					<-- 21 spaces less

Yes, this looks reasonble enough.

Kevin



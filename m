Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A13BF9DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:09:43 +0200 (CEST)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sqc-0000Go-NX
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SnM-0006Jc-CF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SnJ-00050i-U0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625745976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qeaSu+xCDuGzqExFW0XlABHFAbyLHKphDWfheUa9A60=;
 b=eqd9wBGeX50F7dGcTTZ7S05zKIyTOTD8dlL3+MbqBAwe5/I0124ElBvru4fQ9TrVjsAPes
 hN/NkasXbKkbQ0n1IeZHhrxpEgOz4UToTeHlKd9RC+/U1yQQd4GpMGNb6jJLzps8ux7kqz
 YimO0rZOA2nWIN1OdhjVnkE1jFCaSP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-pTsWPE_sNAGkpnVgnUFQgA-1; Thu, 08 Jul 2021 08:06:15 -0400
X-MC-Unique: pTsWPE_sNAGkpnVgnUFQgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017AF19057AA;
 Thu,  8 Jul 2021 12:06:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 290125D705;
 Thu,  8 Jul 2021 12:06:08 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:06:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update block/rbd.c maintainer
Message-ID: <YObqLjDTYqwJZrtx@redhat.com>
References: <20210707180449.32665-1-pl@kamp.de>
 <20210707180449.32665-2-pl@kamp.de>
 <CAOi1vP8bgSO+HhDiUZN-POYYd--3PEzn6TBW-YBSFh6X0Xt3Gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8bgSO+HhDiUZN-POYYd--3PEzn6TBW-YBSFh6X0Xt3Gw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ilya Dryomov <idryomov@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Peter Lieven <pl@kamp.de>, ct@flyingcircus.io,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2021 um 12:44 hat Ilya Dryomov geschrieben:
> On Wed, Jul 7, 2021 at 8:05 PM Peter Lieven <pl@kamp.de> wrote:
> >
> > adding myself as a designated reviewer.
> >
> > Signed-off-by: Peter Lieven <pl@kamp.de>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 516db737d1..cfda57e825 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3058,6 +3058,7 @@ F: block/vmdk.c
> >
> >  RBD
> >  M: Ilya Dryomov <idryomov@gmail.com>
> > +R: Peter Lieven <pl@kamp.de>
> >  L: qemu-block@nongnu.org
> >  S: Supported
> >  F: block/rbd.c
> 
> Nit: I would change the title to "MAINTAINERS: add block/rbd.c reviewer"
> or something like that.

Yes, this is better. I've changed it in my queue.

Kevin



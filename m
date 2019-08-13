Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5A8AE7D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 07:05:38 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxP06-0006Sl-6l
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 01:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hxOzX-0005xe-LM
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxOzW-00010T-IK
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:05:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxOzW-0000zv-DG
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:05:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F1BD30A699C
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 05:05:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B72F1B466;
 Tue, 13 Aug 2019 05:04:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3030316E08; Tue, 13 Aug 2019 07:04:55 +0200 (CEST)
Date: Tue, 13 Aug 2019 07:04:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190813050455.jt7um37eo7a46mrz@sirius.home.kraxel.org>
References: <20190812071212.24551-1-kraxel@redhat.com>
 <20a99cc9-de01-8182-1c75-07dd07b5b35c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20a99cc9-de01-8182-1c75-07dd07b5b35c@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 13 Aug 2019 05:05:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] Add git-publish profile for security bugs
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +# https://wiki.qemu.org/SecurityProcess
> > +[gitpublishprofile "security"]
> > +base = master
> > +to = mst@redhat.com
> > +to = pmatouse@redhat.com
> > +to = sstabellini@kernel.org
> > +to = secalert@redhat.com
> > +to = mdroth@linux.vnet.ibm.com
> > +to = pjp@redhat.com
> > +suppresscc = all
> > 
> 
> Should we force inspect-emails = true here due to the nature of the
> security list? That way if we accidentally add extra CCs/etc there's a
> chance to review 'em.

That makes sense indeed.

> Also, should we update MAINTAINERS to match this script?
> 
> Responsible Disclosure, Reporting Security Issues
> -------------------------------------------------
> W: https://wiki.qemu.org/SecurityProcess
> M: Michael S. Tsirkin <mst@redhat.com>
> L: secalert@redhat.com

Hmm, good question.  I took the list of addresses from the
SecurityProcess page.  Not sure why MAINTAINERS is not in sync even
though it links the page.  Is that intentional or just an oversight?

[ Cc'ing mst ]

cheers,
  Gerd



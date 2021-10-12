Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37142A2E4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:12:26 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFhp-0005lK-K5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFPD-0008LS-35
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFPB-0000tS-8G
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634035987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7X95XO2ex8D3Uum7qUeOUAwnZblq59TSgCIoDNzMvkE=;
 b=bGNsqXnh3IyAqBo6QHXAPCGGdLdpe+FpvZjeb7yfb0f919G5w2Bp4icxNVkqY4gL59iitG
 WcELgtD4iZb/h8Ww34LQpFQOMAYKFgMc47H/aKyueA2nlg2AjTD7Fa1Y0tDV4BlaW7sYju
 gCRPESYAEAFLAxsFgno/6EDE+fhqkIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-QUu8453vMuKJ1-Pqpat6Yg-1; Tue, 12 Oct 2021 06:53:03 -0400
X-MC-Unique: QUu8453vMuKJ1-Pqpat6Yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F3559F92D;
 Tue, 12 Oct 2021 10:53:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 960481B472;
 Tue, 12 Oct 2021 10:53:00 +0000 (UTC)
Date: Tue, 12 Oct 2021 12:52:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH RFC v2 5/5] block: Deprecate transaction type drive-backup
Message-ID: <YWVpCp1VcsnfYVkF@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-6-armbru@redhat.com>
 <20211011185817.czv4tmlsxiyhuqrp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011185817.czv4tmlsxiyhuqrp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, Markus Armbruster <armbru@redhat.com>,
 libvir-list@redhat.com, pkrempa@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2021 um 20:58 hat Eric Blake geschrieben:
> On Sat, Oct 09, 2021 at 02:09:44PM +0200, Markus Armbruster wrote:
> > Several moons ago, Vladimir posted
> > 
> >     Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
> >     Date: Wed,  5 May 2021 16:58:03 +0300
> >     Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
> >     https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
> > 
> > with this
> > 
> >     TODO: We also need to deprecate drive-backup transaction action..
> >     But union members in QAPI doesn't support 'deprecated' feature. I tried
> >     to dig a bit, but failed :/ Markus, could you please help with it? At
> >     least by advice?
> > 
> > This is one way to resolve it.  Sorry it took so long.
> > 
> > John explored another way, namely adding feature flags to union
> > branches.  Could also be useful, say to add different features to
> > branches in multiple unions sharing the same tag enum.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  qapi/transaction.json | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/qapi/transaction.json b/qapi/transaction.json
> > index d175b5f863..0564a893b3 100644
> > --- a/qapi/transaction.json
> > +++ b/qapi/transaction.json
> > @@ -54,6 +54,9 @@
> >  # @blockdev-snapshot-sync: since 1.1
> >  # @drive-backup: Since 1.6
> >  #
> > +# Features:
> > +# @deprecated: Member @drive-backup is deprecated.  Use FIXME instead.
> 
> Obviously, we'd need to flesh this out ("'blockdev-backup' with proper
> node names"? something else?) before dropping RFC on this patch.

What does 'blockdev-backup' with improper node names look like?

I think it's sufficient to say "Use @blockdev-backup instead", which is
already documented to take a node/device name instead of a file name.

> And we'd want to edit docs/about/deprecated.rst to match.

Yes.

Kevin



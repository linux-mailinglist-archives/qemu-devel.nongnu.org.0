Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2741DA5F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 14:58:09 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVvdY-00037r-4A
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 08:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mVvc0-0001Vk-T9
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mVvbw-000836-HX
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633006586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZQWhoBvriO42hVMIIhATTDs95rXqGp+WXB+040jZUA=;
 b=VubIWhxVJgWwRBGGApAbr/nowU1/mO4cuihgECiumaah9XcGkk8i8ePQiQ8uzAvoZfW+To
 dIxDG8CmVKlDt313pnin6bAD0idG1FbiQaO+LberBa8dPc6U+mk0RV9R4BF6bcMSSGxjYC
 ru086ySkTZwD48PI5/wDUOEsIsUrwV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-XkrM41KEMma_WT0tnOTGnA-1; Thu, 30 Sep 2021 08:56:24 -0400
X-MC-Unique: XkrM41KEMma_WT0tnOTGnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576A1C7472;
 Thu, 30 Sep 2021 12:55:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E55C85C25A;
 Thu, 30 Sep 2021 12:55:17 +0000 (UTC)
Date: Thu, 30 Sep 2021 14:55:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH qemu v2] QEMU coding style mandates spaces for
 indentation. This change replaces TABs in block files.
Message-ID: <YVWztO5kIHLlCCZW@redhat.com>
References: <163295635969.12353.14555479457179645848-0@git.sr.ht>
 <YVWHaCOdHUaRbpmc@redhat.com>
 <be93f4d4-6521-a691-fe7a-68b998d5c4df@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <be93f4d4-6521-a691-fe7a-68b998d5c4df@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: thuth@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, ~farzon <farzon@farzon.org>,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.09.2021 um 14:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 9/30/21 12:46, Kevin Wolf wrote:
> > Am 29.09.2021 um 07:30 hat ~farzon geschrieben:
> > > From: Farzon Lotfi <hi@farzon.org>
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371
> > > 
> > > Signed-off-by: Farzon Lotfi <hi@farzon.org>
> > 
> > Just picking one example, but it applies to most hunks of the patch:
> > 
> > > diff --git a/block/parallels.c b/block/parallels.c
> > > index 6ebad2a2bb..629d8aae2b 100644
> > > --- a/block/parallels.c
> > > +++ b/block/parallels.c
> > > @@ -916,11 +916,11 @@ static void parallels_close(BlockDriverState *bs)
> > >   }
> > >   static BlockDriver bdrv_parallels = {
> > > -    .format_name	= "parallels",
> > > -    .instance_size	= sizeof(BDRVParallelsState),
> > > -    .bdrv_probe		= parallels_probe,
> > > -    .bdrv_open		= parallels_open,
> > > -    .bdrv_close		= parallels_close,
> > > +    .format_name    = "parallels",
> > > +    .instance_size  = sizeof(BDRVParallelsState),
> > > +    .bdrv_probe     = parallels_probe,
> > > +    .bdrv_open      = parallels_open,
> > > +    .bdrv_close     = parallels_close,
> > >       .bdrv_child_perm          = bdrv_default_perms,
> > >       .bdrv_co_block_status     = parallels_co_block_status,
> > >       .bdrv_has_zero_init       = bdrv_has_zero_init_1,
> > 
> > When we're changing these lines anyway, let's make sure to have
> > consistent alignment with the surrounding code. So I would prefer
> > something like:
> > 
> > +    .bdrv_close               = parallels_close,
> >       .bdrv_child_perm          = bdrv_default_perms,
> > 
> > Rather than:
> > 
> > +    .bdrv_close     = parallels_close,
> >       .bdrv_child_perm          = bdrv_default_perms,
> > 
> > In most cases, there are already inconsistencies in the BlockDriver
> > definitions, but let's use the chance to make it a little better.
> 
> 
> Or may be drop alignment around '=' at all, to have
> 
>    .bdrv_child_perm = bdrv_default_perms,
>    .bdrv_co_block_status = parallels_co_block_status,
>    .bdrv_has_zero_init = bdrv_has_zero_init_1,
> 
> ?

You're right that this would make it easy to keep things consistent, but
I think it hurts readability a lot, even compared to the current, often
inconsistent state.

Kevin



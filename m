Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DA3C70E1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:03:56 +0200 (CEST)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3I4o-0007PV-Tc
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3I2z-0006Tr-Ql
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:02:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3I2w-0001Zp-VK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626181317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywrwi5unSNAlTBRP9AvE3Cqq3sK/uZ73N2XY41MTeSo=;
 b=RyOnfIQ/nesHJEZHFwuFiOhOOfwrAQvcXTyd4Ej7NN5pQQyoxtJ1Gse12UULEoZ+PhljZy
 DhpHT65CLTPMFW2pObptAFLtITdItmZMkjdUN30kYfCZO5GCDWT11bIjTM4SIDUnYbFMyD
 ny+PDOXpListVU9zCrVCGsO/s54wPhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-3XwDkgYvOmmW_BRxlWeTQg-1; Tue, 13 Jul 2021 09:01:51 -0400
X-MC-Unique: 3XwDkgYvOmmW_BRxlWeTQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46208B94EA;
 Tue, 13 Jul 2021 13:01:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D79010016FD;
 Tue, 13 Jul 2021 13:01:36 +0000 (UTC)
Date: Tue, 13 Jul 2021 08:01:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 01/11] nbd/server: Remove unused variable
Message-ID: <20210713130134.zfti7sgxcw4i3dbd@redhat.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-2-richard.henderson@linaro.org>
 <bdb476db-6e95-b90e-f218-85612009a7aa@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <bdb476db-6e95-b90e-f218-85612009a7aa@virtuozzo.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 12:27:48PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 13.07.2021 00:55, Richard Henderson wrote:
> >  From clang-13:
> > nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
> >      [-Werror,-Wunused-but-set-variable]
> > 

> > +++ b/nbd/server.c
> > @@ -973,7 +973,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
> >   {
> >       int ret;
> >       g_autofree char *export_name = NULL;
> > -    g_autofree bool *bitmaps = NULL;
> >       NBDExportMetaContexts local_meta = {0};
> >       uint32_t nb_queries;
> >       size_t i;
> > @@ -1007,9 +1006,6 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
> >                               "export '%s' not present", sane_name);
> >       }
> >       meta->bitmaps = g_new0(bool, meta->exp->nr_export_bitmaps);
> > -    if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
> > -        bitmaps = meta->bitmaps;
> > -    }
> >       ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), false, errp);
> >       if (ret <= 0) {
> > 
> 
> 
> Hm. I'm afraid, this way meta->bitmaps will be leaked in NBD_OPT_LIST_META_CONTEXT case.
> 
> Actually, "bitmaps" _is_ used, in cleanup handler, setup by g_autofree. So it's a false positive.
>

Correct; this patch is wrong, and would cause a memory leak. This is a
false positive in clang, and a known issue that clang is in general
unable to see that g_autofree variables are used, sometimes for their
intentional side effects such as easier memory cleanup as done here.

I suspect that the definition of g_autofree already uses
__attribute__((unused)) to work around clang's oddities, which means
I'm not sure how to silence clang on this one.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



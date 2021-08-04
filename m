Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C83E08EB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 21:41:08 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBMlG-0007m0-Ng
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 15:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBMkG-00072n-Tx
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBMkD-0001vX-EO
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628105999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XENIFnSuE5NoXyEFiBdFTEp4jcSahsdaJEbBBb/+bO0=;
 b=e4OX2pj4JiptKzsDn+bojzppTUmvcGK5jQv0qPuko6KIFyjYRNbzPk+DGT50K3aVBwMIq2
 x/GtQmu9+bbui5S9cu/CeB8iSI0eCXOoEAUwruFGbPc6EsM+vu0DYlolSqS3qh8rahYrcU
 MlQQRlGIL6yR1xAqiYfxYtewIKA8uVc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-WOMDFRRzO9qBWJef3CkehA-1; Wed, 04 Aug 2021 15:39:58 -0400
X-MC-Unique: WOMDFRRzO9qBWJef3CkehA-1
Received: by mail-qv1-f69.google.com with SMTP id
 v15-20020a0ccd8f0000b0290335f005a486so2184208qvm.22
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 12:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XENIFnSuE5NoXyEFiBdFTEp4jcSahsdaJEbBBb/+bO0=;
 b=N+XmHbmIkho4r4/dldvgRP4RmymE4K1xH3Hh0GVkS+cq7y/3V2kp+8/K4w2xg/1gSh
 7N+MebJo34nEeV40/35W5Zln75scqhxzRUgyZ9Mng1KvJHcYnG4gnFXVZpRlSPf2IA5B
 U3ZQVV1RKQpl6PZwT6Pz1MjpT3OQK42PC+WJLW4qso/zonHJ2QK6tHPqRqS69OFJ3bUo
 qfgiSwCsNSUHWGB/iwdHZ/qMYx1GnkwpI/QTQGpeJ2YAxEmFpqJa4Pw1tJc9M+Y9ZonJ
 rDDbo8TZylGYmaeZit4ivGIB3Tb8ngNq//3ovJh461jgI25UUbfR7DSO7BGvz4igubjm
 /Efw==
X-Gm-Message-State: AOAM532u3Xrbwo1Wg6GJbOof/fgK5fwMUpC2F6m6N36/EM5uEISD3hNt
 zlrhb1wIDnR6mM1GXkHJSl+37IYxpPZXtVMtgloWqgVveMHF/zSE1p1sSzbm2L6ysUD7Q7R9Xza
 FrkUGZp+3Rj3+D9w=
X-Received: by 2002:a05:620a:21d8:: with SMTP id
 h24mr1032661qka.499.1628105997776; 
 Wed, 04 Aug 2021 12:39:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypurMxifRaj7mLXLA874QtkYy8WswBIW7UFpgArZfGFntCI0jpF8yL7AoZrH8FTHLa8X5kjg==
X-Received: by 2002:a05:620a:21d8:: with SMTP id
 h24mr1032648qka.499.1628105997571; 
 Wed, 04 Aug 2021 12:39:57 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id d4sm1215303qty.15.2021.08.04.12.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 12:39:56 -0700 (PDT)
Date: Wed, 4 Aug 2021 15:39:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH for 6.1] multifd: Unconditionally unregister yank function
Message-ID: <YQrtC8vG9jPJQZ6o@t490s>
References: <20210804212632.77221bcf@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210804212632.77221bcf@gecko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 09:26:32PM +0200, Lukas Straub wrote:
> Unconditionally unregister yank function in multifd_load_cleanup().
> If it is not unregistered here, it will leak and cause a crash
> in yank_unregister_instance().

Curious whether there was a crash somewhere that you hit?

> Now if the ioc is still in use
> afterwards, it will only lead to qemu not being able to recover
> from a hang related to that ioc.
> 
> After checking the code, i am pretty sure that ref is always 1
> when arriving here. So all this currently does is remove the
> unneeded check.

Thanks for checking and removing the 2nd ref==1.  I wanted to do that but I
didn't dare before I look more closely or test more.

The patch looks good to me, it's just that I am not sure whether it suites 6.1
material as we've just released rc2 today.  Maybe 6.2 is more suitable?

> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
> 
> This is similar to Peter Xu's 
> 39675ffffb3394d44b880d083a214c5e44786170
> "migration: Move the yank unregister of channel_close out"
> in that it removes the "OBJECT(p->c)->ref == 1" hack. So it
> makes sense for 6.1 so these patches are together.
> 
>  migration/multifd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..a37805e17e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,10 +987,7 @@ int multifd_load_cleanup(Error **errp)
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
> -        if (OBJECT(p->c)->ref == 1) {
> -            migration_ioc_unregister_yank(p->c);
> -        }
> -
> +        migration_ioc_unregister_yank(p->c);
>          object_unref(OBJECT(p->c));
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);
> -- 
> 2.32.0



-- 
Peter Xu



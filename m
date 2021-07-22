Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7403D2615
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:46:51 +0200 (CEST)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZyL-0004WH-VV
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Zw6-00035D-TK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Zw3-0002OW-NK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626965066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3crVBgXJcYlEWoasCOnvp2DVQ/x9x5rjFI5e04pL4/I=;
 b=LRSb66NEP7JmFn26TnsyowgmbDsDmaZ0xM2SCNFFNEIO3Q4/KkvUgCGMKor96B40OKjfpQ
 oxE34GPHmHv9c1DnwEkML5ISR8jsTmW3cmjKSMzir34lG/82FYkjDVh2AD3uFyk0yyVueS
 WJj9Ug7fPKpdXkc9EkgTiU5JPfJcbw4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-fZUaFhX-MrOEYDarZMB-gg-1; Thu, 22 Jul 2021 10:44:25 -0400
X-MC-Unique: fZUaFhX-MrOEYDarZMB-gg-1
Received: by mail-qv1-f72.google.com with SMTP id
 l4-20020a0ce0840000b02902cec39ab618so3837269qvk.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3crVBgXJcYlEWoasCOnvp2DVQ/x9x5rjFI5e04pL4/I=;
 b=B7VXUYFxoH/VgvwUwomzYDjXW4iUEqv/7nKasPx1YeLMRPEfcKvStYM99BIDyrpd9f
 BAdADLuvL0znaSmUxqJuyzqYIzhlxrjQxJSb4ubyv8Z3UzuKRJZbazO+atlyipPHFosI
 lT68WI7VQrVsoLWPQhPak1BqocfJy0abxQ4Axe73BIff863/nLo4A4Z4YOA9E12Hy9Mo
 oAjucU3y6CTaaXZmflJl/1fqJSf6Ti7q1GIKpwZEnXb4gfNxx69q8BxvU7KagIGO6Lnj
 xOc7kVkz8m9yIsB0G0Rp4YwTzJJ5WYKwEFBkIHLIoBj5cDElteSxMYNDzoPg3FocSNzs
 Ukrg==
X-Gm-Message-State: AOAM531X2h2oZZSnB30YjHhSfDpR3GutETUkvLZegCOKqeUh+VVI+dL0
 R0fxSM/JV/q6qjc5EAh1KOWrwR1KCAd689ihIdieXhVv+4/fnq4k6nbDpE8CEdAuULcY5Wq9Jlm
 dEWh21CLdz5u2w9g=
X-Received: by 2002:a05:6214:29c7:: with SMTP id
 gh7mr349113qvb.36.1626965065002; 
 Thu, 22 Jul 2021 07:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq7pkjBj7zpJ5B/xqK0yx1z5Ws8/jAUZgI77MySin0ZSGq5aB06YmtlkRP03xCshjIk06ZCw==
X-Received: by 2002:a05:6214:29c7:: with SMTP id
 gh7mr349096qvb.36.1626965064817; 
 Thu, 22 Jul 2021 07:44:24 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d19sm2381775qkn.94.2021.07.22.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:44:24 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:44:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/5] migration: Make from_dst_file accesses thread-safe
Message-ID: <YPmERz/Mmc1s728k@t490s>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-3-peterx@redhat.com>
 <20210721211527.w3cy2zej3s57hote@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721211527.w3cy2zej3s57hote@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 04:15:27PM -0500, Eric Blake wrote:
> On Wed, Jul 21, 2021 at 03:34:06PM -0400, Peter Xu wrote:
> > Accessing from_dst_file is potentially racy in current code base like below:
> > 
> >   if (s->from_dst_file)
> >     do_something(s->from_dst_file);
> > 
> > Because from_dst_file can be reset right after the check in another
> > thread (rp_thread).  One example is migrate_fd_cancel().
> > 
> > Use the same qemu_file_lock to protect it too, just like to_dst_file.
> > 
> > When it's safe to access without lock, comment it.
> > 
> > There's one special reference in migration_thread() that can be replaced by
> > the newly introduced rp_thread_created flag.
> > 
> > Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.c | 32 +++++++++++++++++++++++++-------
> >  migration/migration.h |  8 +++++---
> >  migration/ram.c       |  1 +
> >  3 files changed, 31 insertions(+), 10 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 21b94f75a3..fa70400f98 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -1879,10 +1879,12 @@ static void migrate_fd_cancel(MigrationState *s)
> >      QEMUFile *f = migrate_get_current()->to_dst_file;
> >      trace_migrate_fd_cancel();
> >  
> > +    qemu_mutex_lock(&s->qemu_file_lock);
> >      if (s->rp_state.from_dst_file) {
> >          /* shutdown the rp socket, so causing the rp thread to shutdown */
> >          qemu_file_shutdown(s->rp_state.from_dst_file);
> >      }
> > +    qemu_mutex_unlock(&s->qemu_file_lock);
> 
> Worth using WITH_QEMU_LOCK_GUARD?

Sure.

> 
> > @@ -2827,11 +2845,13 @@ out:
> >               * Maybe there is something we can do: it looks like a
> >               * network down issue, and we pause for a recovery.
> >               */
> > -            qemu_fclose(rp);
> > -            ms->rp_state.from_dst_file = NULL;
> > +            migration_release_from_dst_file(ms);
> >              rp = NULL;
> >              if (postcopy_pause_return_path_thread(ms)) {
> > -                /* Reload rp, reset the rest */
> > +                /*
> > +                 * Reload rp, reset the rest.  Referencing it is save since
> 
> s/save/safe/

Will fix.

I'll wait for some more comments before I repost.

Thanks,

-- 
Peter Xu



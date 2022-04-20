Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C6509162
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:24:57 +0200 (CEST)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGsi-0006dA-6G
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGN2-0000D6-Sn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGMz-0000kZ-GL
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650484327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dJshY4yFhjMNXmo8UF6ycJ4SI5fXvICGdTNFZK+DJY=;
 b=B8w8VdGdPZMxxuxBXTUQZ0+i3R6jeXV5OHTHzApPUIzSBrhcI316kE0TvofdtAm/H2VRAX
 DySO8Sc2Sm1DeWYcaSVf2Mjc1X/OzklT6DEFgdheBy6dbBEGLWIDWoQr69BzuIv5X+jlhk
 Jy6z5Oa+jY6R1M48K9nR4ckbUD2c4kk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-RH-fSKMRN5SS5WNv7OXwYA-1; Wed, 20 Apr 2022 15:52:03 -0400
X-MC-Unique: RH-fSKMRN5SS5WNv7OXwYA-1
Received: by mail-il1-f198.google.com with SMTP id
 v11-20020a056e0213cb00b002cbcd972206so1496141ilj.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2dJshY4yFhjMNXmo8UF6ycJ4SI5fXvICGdTNFZK+DJY=;
 b=nQt3OLDJtfp9nkCXzt2/Xj+JTA5GTF0IFUpWBp+DpWiJkDIHIxoJqBNdQ7j+JbwS8Y
 bGo5kaPJlePIWiQmZai92nBOjK0XcHktwQ6EvuxY81y87qi9I+5lE4zJ3XHaCAbbfv+v
 pylPtBH79umCdUNyXrtU47tJy7qyVP0e5r/oNqyOvrwYwmZfG/b+IefD8ambHBv3zqXP
 tKp5wvCzuL+iJbP1KnD9wK3Bq/6fr5C4Uat7OkIi/gEU716KjsEheGiYpR1xr4KXirn1
 /ClJ+ZKHicSHyHR1N1ydlYyUlAHoQxBif21eI5JfoVizY5xuJ7XFWtRrBtu8tklShOC3
 kdvg==
X-Gm-Message-State: AOAM532xjZo9fUsx8hIbiqUJz4jEpr9EgbnSYrq6kpbOwP0CFKVDbRui
 DqaUJfPyyF5YqijVUsBQQUOC4chobP35LQEsFS0pO0o4lhWqK4mNW4l9gOU5nansUPKb6qbjvii
 jqUMWmC7cGd0AkgE=
X-Received: by 2002:a05:6638:2505:b0:328:9c95:d90 with SMTP id
 v5-20020a056638250500b003289c950d90mr6750930jat.129.1650484322727; 
 Wed, 20 Apr 2022 12:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPcUkwtXASB2uDJ3KpWusXhcntMe1pawJf5qWTLqHdRA8d8BCykpIXYJR40SI85rbRpkUUrA==
X-Received: by 2002:a05:6638:2505:b0:328:9c95:d90 with SMTP id
 v5-20020a056638250500b003289c950d90mr6750922jat.129.1650484322478; 
 Wed, 20 Apr 2022 12:52:02 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a5d8553000000b00649f02b1b0csm11934500ios.39.2022.04.20.12.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:52:02 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:52:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 14/19] migration: Add helpers to detect TLS capability
Message-ID: <YmBkYIN2fnZUu2yw@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-15-peterx@redhat.com>
 <Yl/qFmt09kIBmBM8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/qFmt09kIBmBM8@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:10:14PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:52AM -0400, Peter Xu wrote:
> > Add migrate_tls_enabled() to detect whether TLS is configured.
> > 
> > Add migrate_channel_requires_tls() to detect whether the specific channel
> > requires TLS.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/channel.c   | 10 ++--------
> >  migration/migration.c | 17 +++++++++++++++++
> >  migration/migration.h |  4 ++++
> >  migration/multifd.c   |  7 +------
> >  4 files changed, 24 insertions(+), 14 deletions(-)
> > 
> > diff --git a/migration/channel.c b/migration/channel.c
> > index c6a8dcf1d7..36e59eaeec 100644
> > --- a/migration/channel.c
> > +++ b/migration/channel.c
> > @@ -38,10 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
> >      trace_migration_set_incoming_channel(
> >          ioc, object_get_typename(OBJECT(ioc)));
> >  
> > -    if (s->parameters.tls_creds &&
> > -        *s->parameters.tls_creds &&
> > -        !object_dynamic_cast(OBJECT(ioc),
> > -                             TYPE_QIO_CHANNEL_TLS)) {
> > +    if (migrate_channel_requires_tls(ioc)) {
> >          migration_tls_channel_process_incoming(s, ioc, &local_err);
> >      } else {
> >          migration_ioc_register_yank(ioc);
> > @@ -71,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
> >          ioc, object_get_typename(OBJECT(ioc)), hostname, error);
> >  
> >      if (!error) {
> > -        if (s->parameters.tls_creds &&
> > -            *s->parameters.tls_creds &&
> > -            !object_dynamic_cast(OBJECT(ioc),
> > -                                 TYPE_QIO_CHANNEL_TLS)) {
> > +        if (migrate_channel_requires_tls(ioc)) {
> >              migration_tls_channel_connect(s, ioc, hostname, &error);
> >  
> >              if (!error) {
> > diff --git a/migration/migration.c b/migration/migration.c
> > index ee3df9e229..899084f993 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -49,6 +49,7 @@
> >  #include "trace.h"
> >  #include "exec/target_page.h"
> >  #include "io/channel-buffer.h"
> > +#include "io/channel-tls.h"
> >  #include "migration/colo.h"
> >  #include "hw/boards.h"
> >  #include "hw/qdev-properties.h"
> > @@ -4251,6 +4252,22 @@ void migration_global_dump(Monitor *mon)
> >                     ms->clear_bitmap_shift);
> >  }
> >  
> > +bool migrate_tls_enabled(void)
> > +{
> > +    MigrationState *s = migrate_get_current();
> > +
> > +    return s->parameters.tls_creds && *s->parameters.tls_creds;
> > +}
> > +
> > +bool migrate_channel_requires_tls(QIOChannel *ioc)
> > +{
> > +    if (!migrate_tls_enabled()) {
> 
> This is the only place migrate_tls_enabled is called. Does it
> really need to exist as an exported method, as opposed to
> inlining it here ?

IMHO the helper could help code readers to easier understand when TLS is
enabled, and it's not super obvious as TLS doesn't have a capability bit
bound to it.  No strong opinions, though.

> 
> > +        return false;
> > +    }
> > +
> > +    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
> > +}
> > +
> >  #define DEFINE_PROP_MIG_CAP(name, x)             \
> >      DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
> >  
> > diff --git a/migration/migration.h b/migration/migration.h
> > index 6ee520642f..8b9ad7fe31 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -436,6 +436,10 @@ bool migrate_use_events(void);
> >  bool migrate_postcopy_blocktime(void);
> >  bool migrate_background_snapshot(void);
> >  bool migrate_postcopy_preempt(void);
> > +/* Whether TLS is enabled for migration? */
> > +bool migrate_tls_enabled(void);
> > +/* Whether the QIO channel requires further TLS handshake? */
> > +bool migrate_channel_requires_tls(QIOChannel *ioc);
> 
> How about having it in tls.{c,h} as  'migration_tls_channel_enabled()' ?

I can do the movement, but the new name can be confusing when we read it in
the codes, it'll look like:

  if (migration_tls_channel_enabled(ioc)) {
    /* create the tls channel */
    ...
  }

The thing is migration_tls_channel_enabled() on a TLS channel will return
false.. which seems to be against the gut feelings.

migrate_channel_requires_tls() feels better but maybe not so much..
Would migrate_channel_requires_tls_wrapper() be better (but longer..)?

Thanks,

-- 
Peter Xu



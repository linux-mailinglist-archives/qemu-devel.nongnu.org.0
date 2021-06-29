Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D323B7605
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:56:22 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyG61-0004vQ-4y
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lyG3K-0002Y6-UG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lyG3H-0005Gs-Lv
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624982010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8oNRkYe4MAbyx1yOdxk2Jyu/d+WOA8EBQ0toKZVW3M=;
 b=OuTQvxO7IR8N81FqKASD0YzK3QbUoPAs7Dt3Yg7+/H7OstCEIoo+B53qPPQEL2Jef6Ls/B
 GpuC2pZXCnYM4V2ofKVg17W0vlEySE6B1Puy6Q9hXcn6w4WXg9rcsRh+RQwR/chwIHF4WF
 foP02UffkkUkuM9FGehJezVOMMJjK0k=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-thAcmPBsMxGs5hXNhlCdSg-1; Tue, 29 Jun 2021 11:53:29 -0400
X-MC-Unique: thAcmPBsMxGs5hXNhlCdSg-1
Received: by mail-oo1-f69.google.com with SMTP id
 r26-20020a4acb1a0000b029024c388a4835so10220276ooq.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8oNRkYe4MAbyx1yOdxk2Jyu/d+WOA8EBQ0toKZVW3M=;
 b=PfEC/ntOurXH+MAdK7FdwVc3cKE3EFJzQKfTJltvpKBUAdufre2wzKmctp1xRjKjsI
 a4gUt+qDZ7HMe2R5z1/pda5y4rTjq4TVxPlKGatiKY9qyM95w8+6RX5TIAyN9OIPydb1
 FR5/jQwjW4ewEOrtxFZa8snypzKxn9tUVoJhuq9Q2sF4Txm9I00cTV7ioIGnL4bQHBoI
 nyH4QHTiWSCRS2qgjqQXOGJKJfkAdoqwsvhzLH7NwaA3VdAe/Nzz5NbYkxKOPKh7Myzk
 TJznRGVgKNjlTKzVSBgmElwxCD7B/2zOj7Co1WogMaXS7yrBluUJaZx7NE6wO14CiRL8
 21Mg==
X-Gm-Message-State: AOAM533QIRlHH6yxmp/hZMDibadyFAjWN8pLEtI9KL3swqUcyhxYXzn9
 1DbOFgzoLw79BAiO3OqwLpt4j02XmK9Rs+HRg4lDsPz0XeE7Vyc2jXqarXdavCeIPFodXS8KIAF
 gd28P2dsBKPesY6X6ozRge1vqtvmYZO4=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr22632756oib.118.1624982008904; 
 Tue, 29 Jun 2021 08:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ7N/tKQwknZ3igbyfikVi0CKufZPzrH/qpvPZvyhkdGMqXGEfPITOCN35wcowkwoBitjDRO34kKmFHEG1Z+g=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr22632742oib.118.1624982008659; 
 Tue, 29 Jun 2021 08:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
 <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
 <YNNbg6jU2dD8VNiU@redhat.com> <20210628174216.25ybfzmtbiymgd6s@redhat.com>
 <a22c25e6-e44a-7be6-f173-ddff8da7551b@virtuozzo.com>
 <YNsw3wRF2Zo+w9k1@redhat.com>
In-Reply-To: <YNsw3wRF2Zo+w9k1@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 29 Jun 2021 18:53:12 +0300
Message-ID: <CAMRbyytfdEePZ2OW6kRVHs7Ha3zJAYvRch1tt+XT_gJ64+=XPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 5:40 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 29.06.2021 um 09:23 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > 28.06.2021 20:42, Eric Blake wrote:
> > > On Wed, Jun 23, 2021 at 06:04:19PM +0200, Kevin Wolf wrote:
> > > > > This is fine, but it means that this flag will present in all ranges,
> > > > > instead of only in unallocated ranges (what this patch is doing).
> > > >
> > > > An argument for always having the flag would be that it's probably
> > > > useful for a tool to know whether a given block is actually absent or
> > > > whether it's just running an old qemu-img.
> > > >
> > > > If we didn't care about this, I would still define the actual value, but
> > > > also document a default.
> > >
> > > So to summarize, it looks like my v3 will have the best chance of
> > > approval if I go with always outputting the new field (instead of only
> > > on one of its two boolean values), and put it at the end of the JSON
> > > output.

Since the "present" key is always present, it does not need to be at the end.

> > > It also looks like we have consensus on spelling the new
> > > field "present":true for data found in the backing chain, and
> > > "present":false for places where we would defer to another file if a
> > > backing file is later added.
> > >
> >
> > I didn't follow the discussion carefully, but that sounds good to me.
>
> To me, too.
>
> > What's the decision about patch 1?
>
> I think we won't need patch 1 (and the potential backwards compatibility
> problems it would introduce) when we have this one.

Yes, looks good and patch 1 is not needed.

Nir



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BB587D1B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:28:47 +0200 (CEST)
Received: from localhost ([::1]:33140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrx1-0004BS-2S
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIruX-0000Yv-VK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIruU-0003Xy-Rn
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659446769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NiAvC0Yr5RPWC5ZVK5b6uffeXKBtIkuZwcS5HVHmiho=;
 b=OeNtwTehcIfXAK6QnSI0KIFOeVZH3xd6aTXJdfNkPK52fTso3j2bHVYopPAaumoYfhflqs
 yWdCYyhkYEKqOdkynI5KCzMZseYfBN5x58RaBodsdNYkGujyE1Rv6F50HqpGpLlJZqOMEX
 HmbI4iTSAzRR3zCqdpekW0JZndCzhmA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-eFODG_QwNb-Mz2meFlSdOw-1; Tue, 02 Aug 2022 09:26:08 -0400
X-MC-Unique: eFODG_QwNb-Mz2meFlSdOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 x17-20020a05600c21d100b003a32dda6577so2007041wmj.7
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NiAvC0Yr5RPWC5ZVK5b6uffeXKBtIkuZwcS5HVHmiho=;
 b=YivGPI8o9qaNU86I1tjNQ3+RVQfYZFPBlXIfmMJ/i+tj5rEJBpfSyTNHMqc8QoPt46
 3JxWzeG1ohbEqgw8teeJZVQklQa7JloqbadqmnVqe8cRk7qM0UU8hk+wziStuh59oZdd
 lzrJTFuVodn3vMc0xZz0+G2xJ6dvD/cGp4/poOvKCAhWt3KOf8LOn9dLR+7mRVR7Fc+f
 tru7MJMIiF4QKluEjxuuBYipdXIiY0R25Hjrz1K+vWOg3USzB9+6wNSd7EeLEYyME8IC
 D09rkv1vdw68XoOXdC6/ri1WXV/Wyl4FUfPq6hZJFTJInQ7H0QBPmCvF3tslW6I1QqKR
 UtSw==
X-Gm-Message-State: AJIora+mtX8Of6IW4GqWM8rIG6wl8bljWxU1nterc7jUpK9jdUWLqXI3
 ntEOtwMvT/xQozi792crN3T4gHjPrfntw+tEPE37J6UH8H/eaufWR7zKUX9PBFc/nHxPJHZ8h7c
 05Xr8W1uBhInEDTY=
X-Received: by 2002:a05:600c:1ca8:b0:3a3:19c9:5448 with SMTP id
 k40-20020a05600c1ca800b003a319c95448mr14403770wms.40.1659446766858; 
 Tue, 02 Aug 2022 06:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpZqWUXTpsbpbAm/rvw5P8QNDTzg/F9/6wjionDd4+dn6VPaA7DDjzPEVz/oouPfLvjnlSOg==
X-Received: by 2002:a05:600c:1ca8:b0:3a3:19c9:5448 with SMTP id
 k40-20020a05600c1ca800b003a319c95448mr14403753wms.40.1659446766601; 
 Tue, 02 Aug 2022 06:26:06 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e10-20020adffd0a000000b0021d4aca9d1esm17730051wrr.99.2022.08.02.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:26:06 -0700 (PDT)
Date: Tue, 2 Aug 2022 14:26:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>, berrange@redhat.com
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 1/1] migration: add remaining params->has_* = true in
 migration_instance_init()
Message-ID: <Yukl68Eq4KscyOeq@work-vm>
References: <20220726010235.342927-1-leobras@redhat.com>
 <CAJ6HWG6PBV4mBFxbEw7190CATcj-VNr4RO6hKJuKtOO4oOPh8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ6HWG6PBV4mBFxbEw7190CATcj-VNr4RO6hKJuKtOO4oOPh8g@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> Please include:
> 
> Fixes: 69ef1f36b0 ("migration: define 'tls-creds' and 'tls-hostname'
> migration parameters")
> Fixes: 1d58872a91 ("migration: do not wait for free thread")
> Fixes: d2f1d29b95 ("migration: add support for a "tls-authz" migration
> parameter")

Queued

> On Mon, Jul 25, 2022 at 10:02 PM Leonardo Bras <leobras@redhat.com> wrote:
> >
> > Some of params->has_* = true are missing in migration_instance_init, this
> > causes migrate_params_check() to skip some tests, allowing some
> > unsupported scenarios.
> >
> > Fix this by adding all missing params->has_* = true in
> > migration_instance_init().
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/migration.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index e03f698a3c..82fbe0cf55 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -4451,6 +4451,7 @@ static void migration_instance_init(Object *obj)
> >      /* Set has_* up only for parameter checks */
> >      params->has_compress_level = true;
> >      params->has_compress_threads = true;
> > +    params->has_compress_wait_thread = true;
> >      params->has_decompress_threads = true;
> >      params->has_throttle_trigger_threshold = true;
> >      params->has_cpu_throttle_initial = true;
> > @@ -4471,6 +4472,9 @@ static void migration_instance_init(Object *obj)
> >      params->has_announce_max = true;
> >      params->has_announce_rounds = true;
> >      params->has_announce_step = true;
> > +    params->has_tls_creds = true;
> > +    params->has_tls_hostname = true;
> > +    params->has_tls_authz = true;
> >
> >      qemu_sem_init(&ms->postcopy_pause_sem, 0);
> >      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> > --
> > 2.37.1
> >
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



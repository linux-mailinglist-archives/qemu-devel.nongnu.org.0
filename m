Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD74A6DD5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 10:32:36 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFC0B-0006qJ-UH
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 04:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFBoH-0003qP-4X
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFBoB-00053l-Cc
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643793608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yfaXx3YAfK+FeqBVeAt/Vmrv8zRwPn6wK1/6BlbzBtM=;
 b=Upv16XIDhrcYa93HKJlRlTduhE3nT5H5BVCU9OEO+T6GI8BVkm876Caqly9VfRaVLfG5FE
 dXulUqEIC681KOOp6kYJ6kzxXEAz8834p3p7M8jYC9ieEvRqiWEUpII6u5aXIxXJhih/GB
 YSuQGrTwVU3zsq9Xps1hbZpVldYc5A8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-cjX07VbtNvK0_Z8xIuQreA-1; Wed, 02 Feb 2022 04:20:07 -0500
X-MC-Unique: cjX07VbtNvK0_Z8xIuQreA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so6585302wrh.23
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 01:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yfaXx3YAfK+FeqBVeAt/Vmrv8zRwPn6wK1/6BlbzBtM=;
 b=GTwtL0E+1oNqLX1tIME2JMP8h3+B4RUBBZK86eDcPZm2vy2MmCehBUDdFnvdfkmkX1
 vqzql8m8mcsFKw2R7phytu4fnHPZ4Fzr9rwLE6AjU3LFD+AGKPZjwWnkvHAFHF1D8zGC
 5C6b5MKWzTVHnhVTCsMgzzyrKj4IK7OnrfrQE06OopOl1D+Anh4feXQ3ThM2ZLTmHvf7
 dvYsJRB0aVLCbQji1O8rPk/V1epZUkWZgzs7f5cEGX02wHJcxOKNLNxaonfmC9s6Mr0E
 K0cASKIalCGuMjPTD2sUXGljLzCwYVJQ9TGvqwyb2GUEFCfOCh89Oukllv11rcoqVfCO
 Iqsw==
X-Gm-Message-State: AOAM531ZpX0Gh4EqJZ0xF+zyseHdBjaCitSUHTNYKXqYT7LAu+vgk1Lf
 GBY9JNLUQUukfTPLERzGG+J+SMKVGKzBy4vV9Hn4JTRA1Uk4FW5OAybjjw2Ba8xC6WuPzGnxkDB
 by+m8/8wNZ9E7ziI=
X-Received: by 2002:a05:6000:186b:: with SMTP id
 d11mr24848967wri.21.1643793605843; 
 Wed, 02 Feb 2022 01:20:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjPcpWhYLKGfvAtR5hf7ByU0UmkFwWyH5XLoVPKE7LBABNFtVAuwvvmdQCkvELz65aNq0uuQ==
X-Received: by 2002:a05:6000:186b:: with SMTP id
 d11mr24848954wri.21.1643793605673; 
 Wed, 02 Feb 2022 01:20:05 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w8sm17018241wre.83.2022.02.02.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 01:20:05 -0800 (PST)
Date: Wed, 2 Feb 2022 09:20:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Pankaj Gupta <pankaj.gupta@ionos.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
Message-ID: <YfpMw1yvYUHkIMqV@work-vm>
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
 <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
 <CALzYo33PQZxQRpattNsobAqsJ89qSyV1GyJKAqTeQR09gkaE6g@mail.gmail.com>
 <CALzYo31esyL6pZ+LCy4qAGw9AZPj4ZdRpxLAxO9uYWzrQ63N2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALzYo31esyL6pZ+LCy4qAGw9AZPj4ZdRpxLAxO9uYWzrQ63N2A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Jinpu Wang <jinpu.wang@ionos.com>, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Pankaj Gupta (pankaj.gupta@ionos.com) wrote:
> > > > >  migration/rdma.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > > > index c7c7a384875b..2e223170d06d 100644
> > > > > --- a/migration/rdma.c
> > > > > +++ b/migration/rdma.c
> > > > > @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
> > > > >
> > > > >      trace_rdma_start_incoming_migration_after_dest_init();
> > > > >
> > > > > -    ret = rdma_listen(rdma->listen_id, 5);
> > > > > +    ret = rdma_listen(rdma->listen_id, 128);
> > > >
> > > > 128 backlog seems too much to me. Any reason for choosing this number.
> > > > Any rationale to choose this number?
> > > >
> > > 128 is the default value of SOMAXCONN, I can use that if it is preferred.
> >
> > AFAICS backlog is only applicable with RDMA iWARP CM mode. Maybe we
> > can increase it to 128.these many
> 
> Or maybe we first increase it to 20 or 32? or so to avoid memory
> overhead if we are not
> using these many connections at the same time.

Can you explain why you're requiring more than 1?  Is this with multifd
patches?

Dave

> > Maybe you can also share any testing data for multiple concurrent live
> > migrations using RDMA, please.
> >
> > Thanks,
> > Pankaj
> >
> > Thanks,
> > Pankaj
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



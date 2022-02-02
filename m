Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595024A6E51
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:02:46 +0100 (CET)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCTM-0002uf-UU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nFCN6-0001L2-4y
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:56:17 -0500
Received: from [2a00:1450:4864:20::629] (port=33314
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nFCN2-0006ur-Ea
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:56:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id jx6so64148956ejb.0
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0nGtCnkjKM5ne69UFF6oCNinvlfENcCT/80h3HBGiQ=;
 b=YuAfgrW5p0einiY4DQK0amL62Gwg+EiuXh7ceUaB+8mLFoMObPPxUN8Q3U1ikxtdHW
 JUOx+CTArcJ1N6FHH5muaKLY3WVReMFMmY4Hu0wJNyKgDXo4ZLkfNZTJMzkocboXa2MP
 5/UdNU+scAKKn15gGOtoN5AYD63JD97VvOvYgqZmhavwUlhtApzYXFBCLUiDhnHa2d/H
 luaINu9J/hNk22cytnDVpaugEbQwkmBQzr5g0JAagllADaPq5UDylyXFWRV9wc7STfnF
 KsS++g02ZkkoBEmwYPGn5tVdnXjss9mOLtCSsaWN7TjuiXQSgKeZr8NppvZygLisHAtt
 PMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0nGtCnkjKM5ne69UFF6oCNinvlfENcCT/80h3HBGiQ=;
 b=12lCpRng2ipIo5ULbAP3sSORij0J6267/n3Ufrdtu9JxgpZjPDERcGDFU7DLDhtfac
 0m29AqvjMxeOQDCK7Kl6OuQLtZ5d2UBZIxtZoM0B4G5KaL9ZqdP90bom/w16/7sJ7gdG
 i0EmUkIkW55m+fW88WwTQPTLGXfnlxmFzTisBH5zLddkO5SCWQ2JFeBl/3VN4qBK1WtR
 VDsnPwXJszUKIlFh+q1mUlHJCUMysnDrUl/d/WZOfKfHQLgz8qTulf5qDkC8m3Jh7glY
 K2fuoVUxrw8Ue0P5v7qrLi4DVMe/dyUJ18USbNL8R1Rm5vhWIvnXijgkO0rOr8cqkuh3
 8E9w==
X-Gm-Message-State: AOAM531uZsOOBmeFabLpU1iA7Ld7fPFwnVcIKe0h9dMS+4oDJzGN7oZG
 DNQphRBiCo+LqLljiUEjH0XaWSyymVZ+ysfeLb8h9Q==
X-Google-Smtp-Source: ABdhPJzuLj6rSyaWWZqJY9o/TYEExQKFXwdo7hTb9IZozLBKTzF+nNVk/hHurIe0q6w8P/To/1wiTrm9ub2Zev3qSSI=
X-Received: by 2002:a17:906:1611:: with SMTP id
 m17mr24881600ejd.443.1643795770022; 
 Wed, 02 Feb 2022 01:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
 <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
 <CALzYo33PQZxQRpattNsobAqsJ89qSyV1GyJKAqTeQR09gkaE6g@mail.gmail.com>
 <CALzYo31esyL6pZ+LCy4qAGw9AZPj4ZdRpxLAxO9uYWzrQ63N2A@mail.gmail.com>
 <YfpMw1yvYUHkIMqV@work-vm>
In-Reply-To: <YfpMw1yvYUHkIMqV@work-vm>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 2 Feb 2022 10:55:59 +0100
Message-ID: <CAMGffEk9WZLrCkZBir0_Ti3JBgTL44ke4pyUY-=70wDsZgmx+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::629;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Pankaj Gupta <pankaj.gupta@ionos.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 2, 2022 at 10:20 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Pankaj Gupta (pankaj.gupta@ionos.com) wrote:
> > > > > >  migration/rdma.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > > > > index c7c7a384875b..2e223170d06d 100644
> > > > > > --- a/migration/rdma.c
> > > > > > +++ b/migration/rdma.c
> > > > > > @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
> > > > > >
> > > > > >      trace_rdma_start_incoming_migration_after_dest_init();
> > > > > >
> > > > > > -    ret = rdma_listen(rdma->listen_id, 5);
> > > > > > +    ret = rdma_listen(rdma->listen_id, 128);
> > > > >
> > > > > 128 backlog seems too much to me. Any reason for choosing this number.
> > > > > Any rationale to choose this number?
> > > > >
> > > > 128 is the default value of SOMAXCONN, I can use that if it is preferred.
> > >
> > > AFAICS backlog is only applicable with RDMA iWARP CM mode. Maybe we
> > > can increase it to 128.these many
> >
> > Or maybe we first increase it to 20 or 32? or so to avoid memory
> > overhead if we are not
> > using these many connections at the same time.
>
> Can you explain why you're requiring more than 1?  Is this with multifd
> patches?

no, I'm not using multifs patches, just code reading, I feel 5 is too
small for the backlog setting.

As Pankaj rightly mentioned, in RDMA, only iWARP CM will take some
effect, it does nothing for InfiniBand
and RoCE.

Please ignore this patch, we can revisit this when we introduce
multifid with RDMA.

Thanks!
Jinpu Wang
>
> Dave
>
> > > Maybe you can also share any testing data for multiple concurrent live
> > > migrations using RDMA, please.
> > >
> > > Thanks,
> > > Pankaj
> > >
> > > Thanks,
> > > Pankaj
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC24A6C14
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 08:08:12 +0100 (CET)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF9kQ-0005Kb-Vf
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 02:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF9Gp-0002hr-7S
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:37:35 -0500
Received: from [2a00:1450:4864:20::129] (port=46874
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF9Gn-0007yG-HR
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:37:34 -0500
Received: by mail-lf1-x129.google.com with SMTP id z19so38479494lfq.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 22:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EAUJn5TAbaJIdH37bMy2tSWgRxaBH2DhqtpPqZxunIw=;
 b=CYh9zjtA7EDPesN82d1QxaOZLDZttehlnCzhfzrFA+OcRdZdRHAIK+1CmhMnjqtiZ2
 v95PrIkZQ9S50tmJmDon4qyggzrWGs4WPNRzUSPZdmbDoC0/R0drhCaMkmZz/8GSeuxu
 CrALbGso8wcwwYeXFdEIh3gAfeqM8E8piZtk2YtaNWal/2HhrLyrgt9xx6wfKUeOuxaf
 lhSHe/7OEfYCeXj9g3hVd5sgTN8o5envW7dFEZj+fAE5nf+sfgd0q6njQ4FgzL8oAnQD
 ZGPIVq5YZxc3zaU8gvwqM9rQ9OJUky/GwUl+AhmgwfAePBaavZZqe/Cnq/tjY/3LYiJz
 yTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EAUJn5TAbaJIdH37bMy2tSWgRxaBH2DhqtpPqZxunIw=;
 b=UOZX83SYzj67/0gULnBA6FdmfUzWpLnYgqp6/j1fgFOOHslhMq0Ovulh7wNEmFgYzS
 jDqeFDNbjGKEm+AFGnyZmwwHxmAGTfZc1c1cnM5Tn/msbaNVMhxUN/Ef0j3XmhE1aYZx
 J/iIVWVCHu2DuPHdDfu7Qkzn9ZxF8XtnDIjpG29YRQbLVPH8Rb9dQqf6pnfI3D/e9iGI
 GVIeaZOLB++znn2+BplEnlIXE5C+rcoZJaYASHcWgJW7vhof8yYW5dvEPjLKxlTi5hwI
 8OFNuq+p7Zks6LuKenN2ZGjXWjWETiaZsHpmsn5fDCNoIFwVXxe1a1OvB5UGtSxYv8Fq
 TZJw==
X-Gm-Message-State: AOAM530DGNwiIavC2ewNH4YMqp8lbVeOdgRRuTnwMdBPnFdZDnyr/TTa
 NnpavgnCnO78c6sSNAV63r0rz9AMZhh77IByNCelUQ==
X-Google-Smtp-Source: ABdhPJzbyqJzYTinkHIlyrvIJpapM4EXEYub5UwFUKGcxfmvfSU/dfKrwFSnysrv46UNwEQMe73cuOELfyO0pinPL5o=
X-Received: by 2002:a05:6512:3487:: with SMTP id
 v7mr21634934lfr.310.1643783850994; 
 Tue, 01 Feb 2022 22:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
 <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
 <CALzYo33PQZxQRpattNsobAqsJ89qSyV1GyJKAqTeQR09gkaE6g@mail.gmail.com>
In-Reply-To: <CALzYo33PQZxQRpattNsobAqsJ89qSyV1GyJKAqTeQR09gkaE6g@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 2 Feb 2022 07:37:20 +0100
Message-ID: <CALzYo31esyL6pZ+LCy4qAGw9AZPj4ZdRpxLAxO9uYWzrQ63N2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
To: Jinpu Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::129;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x129.google.com
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > >  migration/rdma.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > > index c7c7a384875b..2e223170d06d 100644
> > > > --- a/migration/rdma.c
> > > > +++ b/migration/rdma.c
> > > > @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
> > > >
> > > >      trace_rdma_start_incoming_migration_after_dest_init();
> > > >
> > > > -    ret = rdma_listen(rdma->listen_id, 5);
> > > > +    ret = rdma_listen(rdma->listen_id, 128);
> > >
> > > 128 backlog seems too much to me. Any reason for choosing this number.
> > > Any rationale to choose this number?
> > >
> > 128 is the default value of SOMAXCONN, I can use that if it is preferred.
>
> AFAICS backlog is only applicable with RDMA iWARP CM mode. Maybe we
> can increase it to 128.these many

Or maybe we first increase it to 20 or 32? or so to avoid memory
overhead if we are not
using these many connections at the same time.

> Maybe you can also share any testing data for multiple concurrent live
> migrations using RDMA, please.
>
> Thanks,
> Pankaj
>
> Thanks,
> Pankaj


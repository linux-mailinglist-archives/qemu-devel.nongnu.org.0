Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144F4A69EC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:28:32 +0100 (CET)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5Nn-0001C2-0v
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nF006-0003RK-Kz
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:43:43 -0500
Received: from [2a00:1450:4864:20::535] (port=34499
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nF004-0004kU-RB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:43:42 -0500
Received: by mail-ed1-x535.google.com with SMTP id r10so37248623edt.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wviIzEOfyAJo0w9xZ6Wc0Lf5VgBz9MgL+VKAzP5XuVo=;
 b=iDsk9Kpx61Nmbx5T2l/38fTsP0AZYsnN+4BeDW4V3lG1GDcE59uCoPk9bjbkoo0LHA
 UxF0dKCT96VnOWRp73A0dTNFY+GfpI0Tu1qMJBMMwLup9bbULYw+BMwOjBpeBcQw8B3U
 vQN1TvN8Q87GI2H27lulDaBvvydY8n/mYnZkrIP8sD2pK7DuiIjWuSuh0bUrDK3CtR19
 9XwY5QmWzIi4rMNWlWiKCxccmLjWPIw00O1UpF/ByAZsHDWLwrYMuovXzv0Z4qmWQZN9
 i1mkYI2I2Jd7eAtbSx2zeLFAr9Pq8QHOAbQwsItZNh4t0UfPkJeLGmUb6xMZfikRiuJT
 4Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wviIzEOfyAJo0w9xZ6Wc0Lf5VgBz9MgL+VKAzP5XuVo=;
 b=2A4iawkbCY/xEPMThuWlToQCq66N6U6XhMKT4eqa3orbgJ9QDmofOBzFMn9nWkDybm
 ebTBvnkyIqfKkN4BXAWGjv+TGmKzL/o1YicGpd6N2Pju1UdXt4txPA392YtzUKGUd/Qw
 i79MMnN6qxTRZb8CY6PggmCAwoptQU+J8qOQYUwCQTHpV90FDyAGSbhijEL2kVMxShMM
 NJBOziXob2ljAkZ8kCklIUjGHXHAQE5LiQxpJe0Gfy0kQXQBAUs9mCJRQfaIdgMjFWoZ
 q8SpqlLhZoJ3kFBK25Qkmag2hUsQ3Xwv68iCeyYH6MgMHY3hds5PRSc40V4D2vBkvrir
 I/Lw==
X-Gm-Message-State: AOAM530JMjnQOj4zBxBDhLr6H5qD9sYQP4h6bnfFHxXL3Q2K1lU6ESs2
 6/TIsgNR3dFP3g58wtZBRVw52/B6UlbxAr4IgU747A==
X-Google-Smtp-Source: ABdhPJyLSbHE1sLiAaE6W05BZtv2LLw9+niyRqKo2FIqKSnb6zJtp9dci1TQxL8A1L0EOWUmayiJdX2/DMkWe5rMc3w=
X-Received: by 2002:a05:6402:1290:: with SMTP id
 w16mr27133809edv.331.1643748218732; 
 Tue, 01 Feb 2022 12:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <20220201151136.52157-2-jinpu.wang@ionos.com>
 <CALzYo305jDix2huY4jSX+-gtwumRTtqQyCtYbfHpNs3TdAmwrg@mail.gmail.com>
In-Reply-To: <CALzYo305jDix2huY4jSX+-gtwumRTtqQyCtYbfHpNs3TdAmwrg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 1 Feb 2022 21:43:28 +0100
Message-ID: <CAMGffEmC6cORyNmQfq6x8i8PRi_Z1eB=GYWc6yz3S6xo_PyBmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration/rdma: set the REUSEADDR option for
 destination
To: Pankaj Gupta <pankaj.gupta@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::535;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x535.google.com
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

On Tue, Feb 1, 2022 at 7:39 PM Pankaj Gupta <pankaj.gupta@ionos.com> wrote:
>
> > This allow address could be reused to avoid rdma_bind_addr error
> > out.
>
> Seems we are proposing to allow multiple connections on same source ip
> port pair?
according to the man page, it's more about the destination side which
is the incoming side.[1]
We hit the error on the migration target when there are many migration
tests in parallel:
"RDMA ERROR: Error: could not rdma_bind_addr!"

[1]https://manpages.debian.org/testing/librdmacm-dev/rdma_set_option.3.en.html
> >
> > Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> > ---
> >  migration/rdma.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index 2e223170d06d..b498ef013c77 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
> >      char ip[40] = "unknown";
> >      struct rdma_addrinfo *res, *e;
> >      char port_str[16];
> > +    int reuse = 1;
> >
> >      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
> >          rdma->wr_data[idx].control_len = 0;
> > @@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
> >          goto err_dest_init_bind_addr;
> >      }
> >
> > +    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
> > +                         &reuse, sizeof reuse);
>
> maybe we can just write '1' directly on the argument list of 'rdma_set_option'.
> Assuming reuseaddr does not effect core rdma transport? change seems ok to me.
I feel it's cleaner to do it with a variable than force conversion of
1 to void *.

It's bound to the cm_id which is newly created a few lines above, so
does not affect core rdma transport.

>
> Thanks,
> Pankaj
Thanks for the review!

Jinpu Wang
>
> > +    if (ret) {
> > +        ERROR(errp, "Error: could not set REUSEADDR option");
> > +        goto err_dest_init_bind_addr;
> > +    }
> >      for (e = res; e != NULL; e = e->ai_next) {
> >          inet_ntop(e->ai_family,
> >              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> > --
> > 2.25.1
> >


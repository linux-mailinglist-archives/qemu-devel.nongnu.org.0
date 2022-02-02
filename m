Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2134A6BA8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 07:33:12 +0100 (CET)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF9CZ-0008Ez-4E
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 01:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF97g-0007MB-MV
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:28:08 -0500
Received: from [2a00:1450:4864:20::134] (port=38560
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF97e-0006cs-RU
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:28:08 -0500
Received: by mail-lf1-x134.google.com with SMTP id bu18so38549053lfb.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 22:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSWW0tGt26MOK9vyMsv/MbLupqLfmqlqy7PuR9GpH8g=;
 b=FFtAHlmHGYSQYOFxp2Lc+IW1BQZzewIUYfK3mWE+krDOKzLtLqc5n0ZAbAHZTlHmla
 hnH/mcznh1Ank7JKWh5w604ubspMIxwEUmh4QX/VlkiIjCU/hNw7SQBfCP1PeYFuqm06
 I4du+VgvHQl27YHq+HUxW/7KOJ9VnMaj1zZF3jVcWG7PzlsK7hj2a9XkCXM9L9AaxYe3
 gdhCrqtTbb+sZ/ZGnmW35pRdQCfPkDiJgAb5SutLQgVGl4wNfpwuzDKXsm+R0HWgiZGy
 RyHKDycWqKdJ20Yj4KdLCfGKqhdblSauD3zWc6dXfi30Z7HbFd/KnFBxB+leB6lbY5+Q
 /D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSWW0tGt26MOK9vyMsv/MbLupqLfmqlqy7PuR9GpH8g=;
 b=pK46NLH1umfFB0e/0UYXxkkgLCLYRN8vR148LvwzNZ2S4mP6pSh45rEJCcK8aMUdJd
 ilVQStQluta9heP07xDadiE7ht7FWkoc+x/1Cu3dwiKi0u3+eUTAiNeNlISULoE27+5E
 KjcKCTuX1a3qQ8Klu+I8rstvxUxIS3sV2u6pfyJvt4gs0xApz2PYu7qAf9in6D62OHbo
 GFiMfBnnsaio1jaDB3XkGMqKvdLCUd/ks/k7vu61nn5kxZdCa0WKqrOgmKT5X8Ot1teM
 p15bEq03FbO9WGuOffIt96buTLyBE5DHe/nl6kLS6kR4bcyFnd6IiSyLvq8akw40O+Yx
 6IAQ==
X-Gm-Message-State: AOAM532GVLULmNMzqsw1ZDo0nartpKJ/0QC/4k54jjLB8X8o/MPaOpDU
 u9IzJa6BTK9YXqFns+o/sDSrRJtGgLriNTJHlj796A==
X-Google-Smtp-Source: ABdhPJxq+xUv2dRQun6jQysTGcXTTexo+HvhrNJWycL4E6xIt8DwJNcGqHdmhjevrUqrryhBzAKQA5jpqw2pR3W2ArE=
X-Received: by 2002:a05:6512:3487:: with SMTP id
 v7mr21615830lfr.310.1643783284527; 
 Tue, 01 Feb 2022 22:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
 <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
In-Reply-To: <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 2 Feb 2022 07:27:53 +0100
Message-ID: <CALzYo33PQZxQRpattNsobAqsJ89qSyV1GyJKAqTeQR09gkaE6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
To: Jinpu Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::134;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x134.google.com
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

> > > So it can handle more incoming requests.
> > >
> > > Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> > > ---
> > >  migration/rdma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > index c7c7a384875b..2e223170d06d 100644
> > > --- a/migration/rdma.c
> > > +++ b/migration/rdma.c
> > > @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
> > >
> > >      trace_rdma_start_incoming_migration_after_dest_init();
> > >
> > > -    ret = rdma_listen(rdma->listen_id, 5);
> > > +    ret = rdma_listen(rdma->listen_id, 128);
> >
> > 128 backlog seems too much to me. Any reason for choosing this number.
> > Any rationale to choose this number?
> >
> 128 is the default value of SOMAXCONN, I can use that if it is preferred.

AFAICS backlog is only applicable with RDMA iWARP CM mode. Maybe we
can increase it to 128.
Maybe you can also share any testing data for multiple concurrent live
migrations using RDMA, please.

Thanks,
Pankaj

Thanks,
Pankaj


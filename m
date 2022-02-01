Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C104A69DA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:09:52 +0100 (CET)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF55j-0004Xd-BA
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEzp1-00079D-Oo
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:32:15 -0500
Received: from [2a00:1450:4864:20::629] (port=35769
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEzoz-0002rH-V7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:32:15 -0500
Received: by mail-ej1-x629.google.com with SMTP id s5so57627407ejx.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKBHqokuPukeLd09MdTse771gQhd7L/olQsRpjc/iU4=;
 b=X0V0mVohS0CiVKPMlfJbs5eUJk7k4EnNMwCT2Mm7if85oKjOVSmbiHACv0FEUt1KWs
 cp4CvSgm+mGVKX9v5ni/q6bG5hRhrZUeGutb5ie+I97YKpDSiHcpcXt135u2kWrctN6D
 qL/Acf3VAuReExFU/i0odCBLc0SSrfCsobo0GR5uKDyez1RfKi5sURFUhF6tHlTPIxTP
 toVRDbJT4DALiXsVaj1M9dT9QMvB9+hRCjI1WYkZFqhFraNi7MmXJMLFcpzav2T4MTnI
 Y8N6mBu2WmF+5I2bkKmg+F6FR1BM3vY8hKyK2kIj+AVnXGCc8kRRwy5XfRso0pwOtrLB
 LA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKBHqokuPukeLd09MdTse771gQhd7L/olQsRpjc/iU4=;
 b=6hCz5RrirZ/fZX5+1trCVdXsZB5qBofnoauXxbMmJfrDs+M5nl2Y78w8pK31v7tvb9
 MBuGR512YlRvVhECDyzaa/bWREO3kyObm4nzG5hWG02c6DFFCWRF+PKZgUC6Gmg55+hW
 +t0SUHf0AnMcnlcySHbImCSmu4D5QpIWYPlCcjYh1yOxgy2AIbOBvZJGmMkEKxOLcHkj
 jw6us390/9jruphjevNJGaiou3t3kK5DRnuzOo+1c5xpznLb3suzKHhx6XxcT+f3yFmp
 FyWaY0i9eCu1Ug7HFKekf0D2xPCs5aVaQvk2gvGNa5fSv4KNpd+PQ9WSh8PijYTP3sZD
 5j/Q==
X-Gm-Message-State: AOAM532tVwSsTrAmoTvqJhU9Sv5A673TGHHwFtp48tsHc1oNBs8Crzfc
 FnYTHXn3Rk47BHJVDuS/oIpLUEqxfXQt5hDENyL5Qg==
X-Google-Smtp-Source: ABdhPJyeTovG6SsehUy51H5VVqaxBostCz3/VpS0EC5N++VtUPlkG0kzvxwPyKtEvsVepZU9sVjAJzSm/b/vgCT/C3M=
X-Received: by 2002:a17:907:7215:: with SMTP id
 dr21mr22098107ejc.205.1643747532098; 
 Tue, 01 Feb 2022 12:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
In-Reply-To: <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 1 Feb 2022 21:32:01 +0100
Message-ID: <CAMGffE=4uVDmkL0Qi66xaoEyQSBDStU2Nmb0YzDyxcXQwU2m9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
To: Pankaj Gupta <pankaj.gupta@ionos.com>
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 7:19 PM Pankaj Gupta <pankaj.gupta@ionos.com> wrote:
>
> > So it can handle more incoming requests.
> >
> > Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> > ---
> >  migration/rdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index c7c7a384875b..2e223170d06d 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
> >
> >      trace_rdma_start_incoming_migration_after_dest_init();
> >
> > -    ret = rdma_listen(rdma->listen_id, 5);
> > +    ret = rdma_listen(rdma->listen_id, 128);
>
> 128 backlog seems too much to me. Any reason for choosing this number.
> Any rationale to choose this number?
>
128 is the default value of SOMAXCONN, I can use that if it is preferred.

> Thanks,
> Pankaj

Thanks!
>
> >
> >      if (ret) {
> >          ERROR(errp, "listening on socket!");
> > --
> > 2.25.1
> >


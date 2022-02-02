Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7E4A6B3F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 06:08:27 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF7sY-0000Pt-GU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 00:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF7ij-0006wN-Aa
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 23:58:17 -0500
Received: from [2a00:1450:4864:20::129] (port=45721
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nF7ih-0007ne-5U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 23:58:16 -0500
Received: by mail-lf1-x129.google.com with SMTP id o12so38174485lfg.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1LfV0hg2PXsf1SmX8sjlJoeiYbDwRvaeaGV4vX0Mk0=;
 b=COIaoXz1Sftpdd5SmpBw3foOQpPwLW/tFfvz2V1nmL9LxDmeDRZIA4aWQbyBrViuWS
 1iYPmyme2t/kN+J69FK2LZnOsy0acupkT+nsL26v02qMEM8/IV7TsZsDkyMXMnF69p2M
 0qui7adRRP3yjOLPUH757Dj9NBmDhU1BadroPuzm2EZBP6NkQbcaDEEKickSMzBjGhYN
 gVb/tKqVp8Qy7KSrmY/JP8c2h4CsBoX6uRm4lhwGTgP5WRSbDCUp4T7i3DpGBF2IlmU4
 /t7rywc3En9BMULWIx1XZ317WChQ0e50cR5apjgrcyaW615/Slhzcw+2MbMEds2T1Pjq
 0PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1LfV0hg2PXsf1SmX8sjlJoeiYbDwRvaeaGV4vX0Mk0=;
 b=InaZ5iU8KPHMqz5X2nW7zWepZRiqfs8lFv3e5uNxbk1+6dosGB7wYA/6kzWD+3833r
 AjS08scckpvzyLdDuTnI/B0D5u4yc68JXJrwjfiYRt53K8xn4A3wqXoE3TecGxdnbB6v
 miOL3wP5/C1qzFDAZEnpj1GaPQI2Ou5mQ2MgUl4EQ8n2Cpsx038eJznTFwzWSBD877W7
 RZ92WhpeF41L7MgkK1J/BOvQmWDe5brcLKZBZYMZd4CaDBwUeZGIaKNF/EJKON5boUb4
 Tpzb22VOD0GV4MOGIfnffkRLY8eC5nYx/gDQal6jjWk88hmoX9NDp3Em9FUow7BZE0ud
 D4Qg==
X-Gm-Message-State: AOAM530vVaxfRvf/Y+EpWPjI0dD1T9NS80TNsi48Hiva0JSqZ/ueKQg4
 t2PLh4dKSz5t9LKeIX+43pUYVoRGp4pywvsNh1H7Fg==
X-Google-Smtp-Source: ABdhPJxmdecy6tYn7h0J7TKrBA20PCO5ph7b3onQZQucm2tX9GmaQ46BDTiP3VJAeUxPWF/6/bjPtwurfKNmCDwAEFU=
X-Received: by 2002:a05:6512:3487:: with SMTP id
 v7mr21429385lfr.310.1643777883413; 
 Tue, 01 Feb 2022 20:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <20220201151136.52157-2-jinpu.wang@ionos.com>
 <CALzYo305jDix2huY4jSX+-gtwumRTtqQyCtYbfHpNs3TdAmwrg@mail.gmail.com>
 <CAMGffEmC6cORyNmQfq6x8i8PRi_Z1eB=GYWc6yz3S6xo_PyBmg@mail.gmail.com>
In-Reply-To: <CAMGffEmC6cORyNmQfq6x8i8PRi_Z1eB=GYWc6yz3S6xo_PyBmg@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 2 Feb 2022 05:57:52 +0100
Message-ID: <CALzYo32fLcjz=bBckDwDw69-Ond6UbP00TE8aTA2L0hNwA_1Aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration/rdma: set the REUSEADDR option for
 destination
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

> > > This allow address could be reused to avoid rdma_bind_addr error
> > > out.
> >
> > Seems we are proposing to allow multiple connections on same source ip
> > port pair?
> according to the man page, it's more about the destination side which
> is the incoming side.[1]

By source here I meant generic ip port address pair binding. For this case it is
at destination live migration host.

> We hit the error on the migration target when there are many migration
> tests in parallel:
> "RDMA ERROR: Error: could not rdma_bind_addr!"
o.k. Worth to add this in commit message.

>
> [1]https://manpages.debian.org/testing/librdmacm-dev/rdma_set_option.3.en.html
> > >
> > > Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> > > ---
> > >  migration/rdma.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > index 2e223170d06d..b498ef013c77 100644
> > > --- a/migration/rdma.c
> > > +++ b/migration/rdma.c
> > > @@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
> > >      char ip[40] = "unknown";
> > >      struct rdma_addrinfo *res, *e;
> > >      char port_str[16];
> > > +    int reuse = 1;
> > >
> > >      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
> > >          rdma->wr_data[idx].control_len = 0;
> > > @@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
> > >          goto err_dest_init_bind_addr;
> > >      }
> > >
> > > +    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
> > > +                         &reuse, sizeof reuse);
> >
> > maybe we can just write '1' directly on the argument list of 'rdma_set_option'.
> > Assuming reuseaddr does not effect core rdma transport? change seems ok to me.
> I feel it's cleaner to do it with a variable than force conversion of
> 1 to void *.

Adding typecasted 1 seems more cleaner than adding another auto variable.
Will leave this to maintainers to decide.
>
> It's bound to the cm_id which is newly created a few lines above, so
> does not affect core rdma transport.

o.k.
>
> >
> > Thanks,
> > Pankaj
> Thanks for the review!
>
> Jinpu Wang
> >
> > > +    if (ret) {
> > > +        ERROR(errp, "Error: could not set REUSEADDR option");
> > > +        goto err_dest_init_bind_addr;
> > > +    }
> > >      for (e = res; e != NULL; e = e->ai_next) {
> > >          inet_ntop(e->ai_family,
> > >              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> > > --
> > > 2.25.1
> > >


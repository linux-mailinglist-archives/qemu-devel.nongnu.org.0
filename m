Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F284A6F2F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:54:27 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFDHO-0005Xh-1g
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nFDFQ-0004nY-2E
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:52:24 -0500
Received: from [2a00:1450:4864:20::62b] (port=41707
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nFDFD-0008RP-FJ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:52:13 -0500
Received: by mail-ej1-x62b.google.com with SMTP id a8so63967260ejc.8
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 02:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKzaLcmxo/LYxnNeTiqslH9m6nmTIR2FbaJYTdNWfu4=;
 b=gtZ5ywYocPyPB/nKwR3rwx6Hccb9EfA5aju8serBi5hNgipXlgtLufp0mLNNJ+FEES
 uhU1HMMlXKh3EP0U5WQPSFEtuL70NAHeas7BnKxDBZP75dTcIrbn0cVjDsvgdIcIQChV
 KuNpY6GgZLqOFtlNkhxdxdnm1hJO+sqPYM/Y6J4zlmw8rNwG9PhnA7tPVmSWotvRbR1f
 xRtrSLf/p4TDs5S3x5yzpK+ZGI94fd/kdxIIqw6AavWZ0NUS6MvMOqL5yVz7uX62ej6G
 r9hfGUQQ/ObNcPMoLUWMbAgnAxsYyVYXuAgMTR9H9zEh1Nxk9T3pJcCwNg62fqWonjj5
 D3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKzaLcmxo/LYxnNeTiqslH9m6nmTIR2FbaJYTdNWfu4=;
 b=wN1WjAHapFHKR7psu/sUPvB7eUIHG8zYpGjrgYbU5fk7wc0e4PbhTMT8vHxvofWOwl
 AmmXfT/Pi2GOs00rS6UGyFtXSvKc4KRSbBr5j3IiKww0JNcTMt+gTgn40+lD1XAOIXWH
 upeZgVNZsQlRNN9yhpunO4IphB0vSO+PDWoDVlsEa1/QLdy3DOXDpV3gM1FEYQbAHEnf
 QcxJ7v8aFTBXmtUSjxA35oWCOeCRHpYWZHXB3kwDjCMi4A+FNg8577AD9p7sndCd/BJR
 cxLLXQRSsJ4q7do/N7uw3Bf58KS78z7x3CtydElVwyKPKAtnZv7HscgVrss42uIPv7op
 9QAw==
X-Gm-Message-State: AOAM531BfVSMBq48BJeuNpzF0+LVfshv2in8oiYbRcd5mvwAaCfEyXMg
 c2X4JHGfAt6oydqBeBJn2omrE1wlUkeOwv6H1Z7CQQ==
X-Google-Smtp-Source: ABdhPJw0QljW1XzT12PXAz1XwHfGzgH6nvJ4NskpF9PJoiWQ4vGf/QeVdhP22VMED/qlzWQlZVlI9pvm6F62Xv9EsGs=
X-Received: by 2002:a17:907:3e9c:: with SMTP id
 hs28mr24147896ejc.735.1643799110130; 
 Wed, 02 Feb 2022 02:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <20220201151136.52157-2-jinpu.wang@ionos.com>
 <YfpZ1Wp5DsQLejOj@work-vm>
In-Reply-To: <YfpZ1Wp5DsQLejOj@work-vm>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 2 Feb 2022 11:51:39 +0100
Message-ID: <CAMGffEn-tyeq2zzOprp-nQeQjifDwVpQTaHV+CM5gzTnxur3xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration/rdma: set the REUSEADDR option for
 destination
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::62b;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x62b.google.com
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
Cc: qemu-devel@nongnu.org, pankaj.gupta@ionos.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 2, 2022 at 11:15 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Jack Wang (jinpu.wang@ionos.com) wrote:
> > This allow address could be reused to avoid rdma_bind_addr error
> > out.
>
> In what case do you get the error - after a failed migrate and then a
> retry?

Yes, what I saw is in case of error, mgmt daemon pick one migration port,
incoming rdma:[::]:8089: RDMA ERROR: Error: could not rdma_bind_addr

Then try another -incoming rdma:[::]:8103, sometime it worked,
sometimes need another try with other ports number.

with this patch, I don't see the error anymore.
>
> Dave
Thanks!
>
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
> > +                       &reuse, sizeof reuse);
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
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


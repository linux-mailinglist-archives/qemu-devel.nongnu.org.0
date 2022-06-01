Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA853A5B8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:15:32 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOCB-0001Qr-8v
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nwO76-0005qw-7A
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:10:17 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nwO70-0005RS-1A
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:10:12 -0400
Received: by mail-ej1-x62d.google.com with SMTP id f21so3628893ejh.11
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcJ+TjQKS7OPPkWupqK4+jCeZycStF4uCdtDJm7Cq9k=;
 b=U0sf9+6amVFtgcYUR6fH794cmyxeNUP7JqQ/RifE2t60vvxAwDZcyBt7jx7dh3yN7U
 lT9vOPFgTuk9urhmMWdGbLkuZH0fwOlOVFH4CO6QkP2CVowDdt82GsFe2dwF04SeV+C5
 RdjAc0h+KJphglWLcfuF4TfFeldKoXBN/E/B/GbSGxkaUEnlN+ZNzEW7AYmlISJMkCKx
 FUHM2YwpWGxJ8c07On6249uFjIbIeOiSE1Xz4lDIYAhmxTkVDUeRA6JfukoqJJjPo/pE
 jpxDdEnwoxLrt2zaZob3QQOzGf9SAP9CVyfpCzNZJVhTMeK/4DKVrenvHYjH49rf96j4
 DBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcJ+TjQKS7OPPkWupqK4+jCeZycStF4uCdtDJm7Cq9k=;
 b=OUJHxCMkVYyBLpmQaFW24lqoPzZ34mm7PisMcLIABioO4H5sHR2xqbshO2QqnPkymX
 1CN2iO2kyRqgqaqTfGMlFs7A7M3XbV3w1LjB2vbR0Xkcvjdw8B207x9V/tdDZdXQkRuo
 kTB8Q3cDiBVWXIcWTe7B5jOatMJWPmWD2Oheca6H3WaCmkz1HjS2rLwcQgy4q5f3JjgU
 KnwKxJK48HLgucVw2BEjHZjP+jpe53kfTC63c1LVah3uMD78VF14mzQG91lUUajPRc1j
 ccvrZIwmYpZrzfcrZ75kseuN6OVXnKjPLVhgXKeFYsdgha2aa/dMPnoeHv8Cs4pFjEnT
 fUbg==
X-Gm-Message-State: AOAM533XXMq2y92UMCTKpkRUs0D32hNOXdBIcP4Yu95zW5GWh1TDQ7Xp
 9VXTHa5uLorfNkWLcN80s+aY2bbh1JMvuRPDLk5z
X-Google-Smtp-Source: ABdhPJzSfgn3RgqosVWTLgjHyI9Yp0D6qsazkxEAlsKtELVLGWRRIad2AV8N1C6gGukMV0GRhD/DhqaDTSnQiy6Vb6A=
X-Received: by 2002:a17:907:97c7:b0:6fe:f7eb:be67 with SMTP id
 js7-20020a17090797c700b006fef7ebbe67mr41178882ejc.559.1654089007629; Wed, 01
 Jun 2022 06:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531095221.114-1-xieyongji@bytedance.com>
 <Ypdjr4UO+XrBbM09@stefanha-x1.localdomain>
In-Reply-To: <Ypdjr4UO+XrBbM09@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 1 Jun 2022 21:10:58 +0800
Message-ID: <CACycT3vR4rb+R5Z-SYMW1q1S1hhFZPPDJAVb82_5vnxgVr7WiA@mail.gmail.com>
Subject: Re: [PATCH v2] vduse-blk: Add name option
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 1, 2022 at 9:03 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, May 31, 2022 at 05:52:21PM +0800, Xie Yongji wrote:
> > Currently we use 'id' option as the name of VDUSE device.
> > It's a bit confusing since we use one value for two different
> > purposes: the ID to identfy the export within QEMU (must be
> > distinct from any other exports in the same QEMU process, but
> > can overlap with names used by other processes), and the VDUSE
> > name to uniquely identify it on the host (must be distinct from
> > other VDUSE devices on the same host, but can overlap with other
> > export types like NBD in the same process). To make it clear,
> > this patch adds a separate 'name ' option to specify the VDUSE
> > name for the vduse-blk export instead.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/export/vduse-blk.c             | 9 ++++++---
> >  docs/tools/qemu-storage-daemon.rst   | 5 +++--
> >  qapi/block-export.json               | 7 ++++---
> >  storage-daemon/qemu-storage-daemon.c | 8 ++++----
> >  4 files changed, 17 insertions(+), 12 deletions(-)
> >
> > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > index 3b10349173..d96993bdf5 100644
> > --- a/block/export/vduse-blk.c
> > +++ b/block/export/vduse-blk.c
> > @@ -245,7 +245,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >      }
> >      vblk_exp->num_queues = num_queues;
> >      vblk_exp->handler.blk = exp->blk;
> > -    vblk_exp->handler.serial = exp->id;
> > +    vblk_exp->handler.serial = g_strdup(vblk_opts->name);
>
> Do we want to expose the VDUSE device name to the guest? Maybe the
> serial string should be a separate parameter.
>

OK, it makes sense to me. But we might need a default value. Any suggestions?

> >      vblk_exp->handler.logical_block_size = logical_block_size;
> >      vblk_exp->handler.writable = opts->writable;
> >
> > @@ -279,22 +279,24 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >          features |= 1ULL << VIRTIO_BLK_F_RO;
> >      }
> >
> > -    vblk_exp->dev = vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
> > +    vblk_exp->dev = vduse_dev_create(vblk_opts->name, VIRTIO_ID_BLOCK, 0,
> >                                       features, num_queues,
> >                                       sizeof(struct virtio_blk_config),
> >                                       (char *)&config, &vduse_blk_ops,
> >                                       vblk_exp);
> >      if (!vblk_exp->dev) {
> >          error_setg(errp, "failed to create vduse device");
> > +        g_free((void *)vblk_exp->handler.serial);
>
> serial isn't const char * anymore, it's char *. Please update the struct
> field and then these casts won't be necessary anymore.

OK.

Thanks,
Yongji


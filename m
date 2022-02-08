Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678924AD387
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:33:53 +0100 (CET)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLwe-0002h6-DW
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKfv-0006vB-Qi
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:33 -0500
Received: from [2a00:1450:4864:20::62c] (port=39455
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHKfr-0000QE-1L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:29 -0500
Received: by mail-ej1-x62c.google.com with SMTP id j14so26061262ejy.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ccKMbrcFfRhepG0ul925MycYb0KWrbc7li2KuHGvMvE=;
 b=rqkph5POI1ADToZMx8fpQsEYBPT0aseOenD/D0uoSyBVmd4lPlh9JV8bQIx4n47wnM
 xc2mEh6whsWd7sx857VXlkDxRKuXnqmDh5XbjaPrl58LYya7QcFQVwCLwzpdeP6j4exT
 gKlP65cSsL+Ezq+EZyUZJpiHI+i+QqBc5/F/fg0Hv/lHBCtov/DXq1EkB5mBm/jndyat
 Ce3ND5gaDZmx8RFjIW8RU4nZcJ+W3IfHR3lcbId9QyXvHOXIhpdagMfPtdBqYuoJm0M9
 pDaF3cIegeXwZ581crTbyzZkWI5PkDwqGYHUh7+QFzOCC3Df85V8Ze4DuEEnLqjMI1Dn
 jBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ccKMbrcFfRhepG0ul925MycYb0KWrbc7li2KuHGvMvE=;
 b=L7wrXSTV4VHCpi8q5pjX9whc9IdKi3wHzbspxD4UBJDNFQskBrCVu1tdk5/jhK0GYt
 sQAvyW8vfYwkHL/Wg2MJLDVUm3thdW0y/n05LWTYFQtFlJRbXTy1OXW7oxjSj1xmGL5M
 SL6+JkLjwnoUOlYEZ/KBn8/L8yJZYDZfDzP7NPw65UtQs7El9NmcXzGqCclyoPD3H1Uk
 L3Pt2nWDIlyF7NfgVevxQdw5ut45xRJo9kU2GbsWInnAQsdFV0C0T1p6KFcF+9ji70cL
 gKnthJ32O/L+oqvODg3YCk9IfOxAXyHxIMUXoyOK5W6Nd4xlBkRbE/Y6PEeY3PpWBbgV
 pDvg==
X-Gm-Message-State: AOAM533nsyYT2x+6GR3CouWyVBHIS0HhO2woVim/Arze1+1n+0bQsaoo
 wTQpTArviI66tljc4O/IIyKhddYYwHvTZropivKr
X-Google-Smtp-Source: ABdhPJwjCFTil23A8zsuetRFVEF2Qe8x0E5BzKsaR9/QXoS75hY0d86f4pqjv3F4DQkhDE4Cw+zuJimLfxn7axs7smA=
X-Received: by 2002:a17:907:7f88:: with SMTP id
 qk8mr2572072ejc.622.1644304344803; 
 Mon, 07 Feb 2022 23:12:24 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-5-xieyongji@bytedance.com>
 <YgEqQA9s3/surkoI@stefanha-x1.localdomain>
In-Reply-To: <YgEqQA9s3/surkoI@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 15:12:14 +0800
Message-ID: <CACycT3usuaRV4K_zRBRBFJXCh=bAFJemZADJGAULZQK4PShrwQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] vduse-blk: Add vduse-blk resize support
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 10:18 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 09:17:59PM +0800, Xie Yongji wrote:
> > To support block resize, this uses vduse_dev_update_config()
> > to update the capacity field in configuration space and inject
> > config interrupt on the block resize callback.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/export/vduse-blk.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > index 5a8d289685..83845e9a9a 100644
> > --- a/block/export/vduse-blk.c
> > +++ b/block/export/vduse-blk.c
> > @@ -297,6 +297,23 @@ static void blk_aio_detach(void *opaque)
> >      vblk_exp->export.ctx = NULL;
> >  }
> >
> > +static void vduse_blk_resize(void *opaque)
> > +{
> > +    BlockExport *exp = opaque;
> > +    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
> > +    struct virtio_blk_config config;
> > +
> > +    config.capacity =
> > +            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
> > +    vduse_dev_update_config(vblk_exp->dev, sizeof(config.capacity),
> > +                            offsetof(struct virtio_blk_config, capacity),
> > +                            (char *)&config.capacity);
> > +}
> > +
> > +static const BlockDevOps vduse_block_ops = {
> > +    .resize_cb = vduse_blk_resize,
> > +};
> > +
> >  static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >                                  Error **errp)
> >  {
> > @@ -387,6 +404,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >      blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
> >                                   vblk_exp);
> >
> > +    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
>
> Detach is missing, so BlockBackend->dev_ops will become stale after the
> export is deleted. Please add code to detach when the export is deleted.

OK.

Thanks,
Yongji


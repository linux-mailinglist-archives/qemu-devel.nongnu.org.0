Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341552CDEF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:09:27 +0200 (CEST)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbDq-0005xD-G3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrb7S-0003zX-Cv
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:02:50 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrb7J-0003aJ-SJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:02:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id z2so8341222ejj.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tj8xxigeAsnFNxfBsnluLg5QYdHTlPrHAGVp2ukVnrg=;
 b=7/38ktm3hxdwaX5SxqZ9tyjCt55lp+aOOKboGT5ANc5kmr+B4ane/+qTLVkwUZPqk0
 B4tMj6U18rk6yzKLwYbdxQh0vmWh2HvONxloUDw79nf/JFgVzuJ0X4cWaE7XncIaFYI3
 +fMhXP+rS9ziJpMpxhbaVg2FmNyqwQsI4WNDSlytMriXVaa0z1URou8c7SkIHgG+VlLt
 oiLJZ9p/aPws4Qb0tMJ23Tqz0SjXTvru3tFNouCzjOuUthTK2q8KhmWjvtbDzxyvoqIg
 HHM6vO5GlWgHZcLYg7pGlr+AIngDLeqIsf2JgOv8kX34e1hOZewQGnMq9nBHbQnAFN2W
 Ui4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tj8xxigeAsnFNxfBsnluLg5QYdHTlPrHAGVp2ukVnrg=;
 b=vUh0V075zOQlCIUd5iJ4Eh5/Qbh9+nZ+9dBpUmESos4b9VQWzPnEdId6+LXNwgu4cT
 VOMPOIZOSSn7V7/hXRJJOYiHA36oYDfHk6qOEEZqykwYh2HuQ/S2t+Ur1KMQq/kkHvWp
 2Rv2N68jHfja3IWlBie6jZNqxSGw9ZizVoLHK35I/72v/a2P4J1piLoqOmcYm6yxBhag
 4wEbJR6COycI3IkYPCv4isZJ/PMlNogxO1lO6CU5fcKQ2xwlPbf/ZGAe3V5l64anfEfs
 WXJfIEzQ59og+n1c7lRqdNZNjwDmn4g7yfSnOcMxZ61d6NYQA82IIIr+ijeNc5HRe+Nj
 5Fag==
X-Gm-Message-State: AOAM530Z4URlDIjVTO2+6lfnpkgt1ZYxOaEsYiSLk1YpKpPOm260b71E
 AfEe10LbF1PDr8jcyHX1IsjWxJAJXcn+jMnd9IfU
X-Google-Smtp-Source: ABdhPJyaVf0Wcgigisn5msOJMV8V6BwAYH+ioSEafp71fZvKit4ECB6Rnu0WfCK6DxeLBd/PX2dZ8xMpjlP0ZsSVcAc=
X-Received: by 2002:a17:907:1623:b0:6f6:e9ce:9926 with SMTP id
 hb35-20020a170907162300b006f6e9ce9926mr3018354ejc.360.1652947359440; Thu, 19
 May 2022 01:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-3-xieyongji@bytedance.com>
 <YoTxwwS97POt79PQ@stefanha-x1.localdomain>
In-Reply-To: <YoTxwwS97POt79PQ@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 19 May 2022 16:03:22 +0800
Message-ID: <CACycT3skLBKJnWhCQVKyHrqX8-RkTSG_jsFP9Mrgpc4ZTRde1A@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] block-backend: Introduce blk_get_guest_block_size()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x630.google.com
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

On Wed, May 18, 2022 at 9:17 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 03:40:45PM +0800, Xie Yongji wrote:
> > Support getting the guest block size for the block backend.
> > It's needed for the following commit.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/block-backend.c             | 6 ++++++
> >  include/sysemu/block-backend-io.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 35457a6a1d..1582ff81c9 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -2106,6 +2106,12 @@ void blk_set_guest_block_size(BlockBackend *blk, int align)
> >      blk->guest_block_size = align;
> >  }
> >
> > +int blk_get_guest_block_size(BlockBackend *blk)
> > +{
> > +    IO_CODE();
> > +    return blk->guest_block_size;
>
> I have sent a patch to remove blk->guest_block_size because this field
> is currently unused.
>

OK.

> I think there is a cleaner way for this patch series to store the guest
> logical_block_size (see next patch). Stashing it in BlockBackend was
> attractive because virtio-blk-handler.c lacks a struct to store its
> parameters (writable, serial, logical_block_size), but if such a struct
> is introduced then there's no need to stash it in BlockBackend.
>

Looks good to me.

Thanks,
Yongji


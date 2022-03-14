Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F124D8C16
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:11:14 +0100 (CET)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTq65-0005T0-5g
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:11:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nTq4n-0004Zm-Ou
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nTq4k-0005g4-KM
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647284989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h9NkOxCfGQufgyGkpGbD5KBKwEvloUe+uvi58aIO9Fc=;
 b=JikVfI9iqKsg+qmPEgHWvSNJRD0MfCoaq12OUFlZ7Y9DVB5N2s0oxd0XiuydR2IxYqw3le
 ssr/RjXNNmIxcmPIpzfZa4jSbYz3xoc9w9Pdfa8CSBAtdJngooM+zRnM5ZQPx9TXd9yT39
 wpUrn4EGGL/+4YoBn+mkotlAyKtkOpg=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-r9VEi30XNSO_c9oGOS3EsQ-1; Mon, 14 Mar 2022 15:09:47 -0400
X-MC-Unique: r9VEi30XNSO_c9oGOS3EsQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 a4-20020a1fe304000000b0032daa0778c2so2443788vkh.21
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9NkOxCfGQufgyGkpGbD5KBKwEvloUe+uvi58aIO9Fc=;
 b=T/c6SoMD9U6kAHvPwE6yAAvcLtyFGXDg1MuvlSGk1Tf3uOXG0LM402jkjihIqpUtXm
 3XWJ0B65hY0G2ZILzlZX6pi0rz2NFvoFM0rUWdRBAkXqc0ohVF07o+SZ+dxjKjWjo9E0
 /fxIffWzePnJzGKFncTpHXR8Mf9jty3wM4BuVn+TIczd50s9ivY3jtdm9jhdbTdBgfJN
 z5Oh3CX9A6jbxJ9YJ1CALy3xqnnNyQTQib4H1Hx66jXIWpP7NFPpa4GGAe4X0sor/4hV
 W0OL2VPpLs/SxDtffOZNuwsrwC2f78ac6HBjzvg71PPBLTiH/F+OGcJT5H4rbxJbMAjZ
 5Y1w==
X-Gm-Message-State: AOAM530mn2UbmBlkwH/K/Y4SQnhNc99oHVSwzLm/Yg/B3GQg/LVrWXlY
 pkTYxuo0d7qNGvHHWEH+XzryeZfzmKlO0Jk2SsR0X/XLV9WUx8VD2Rh5NVJLvknMJy6ks4M0CWs
 zW650cQahnVQ8SiA8RvHPz0B+FC2yxms=
X-Received: by 2002:a05:6122:218b:b0:337:7e8d:9df7 with SMTP id
 j11-20020a056122218b00b003377e8d9df7mr10066733vkd.26.1647284986678; 
 Mon, 14 Mar 2022 12:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpmizRjQoXRQX0lQfCo8zfiZq/4go8/XLOsHIn6EVng9KFDDPCHVGXNxBCUX/tsnPnme5ect9Z56bOWLS1rjk=
X-Received: by 2002:a05:6122:218b:b0:337:7e8d:9df7 with SMTP id
 j11-20020a056122218b00b003377e8d9df7mr10066719vkd.26.1647284986430; Mon, 14
 Mar 2022 12:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-2-xieyongji@bytedance.com>
 <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
In-Reply-To: <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Mon, 14 Mar 2022 15:09:35 -0400
Message-ID: <CAFn=p-bcvfOa+vNGXqaiJbg2CUEALJoMGVHN9NCQv2GRrf_D_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] block: Support passing NULL ops to
 blk_set_dev_ops()
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <mreitz@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 1:23 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 06:59:38PM +0800, Xie Yongji wrote:
> > This supports passing NULL ops to blk_set_dev_ops()
> > so that we can remove stale ops in some cases.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  block/block-backend.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 4ff6b4d785..08dd0a3093 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
> >      blk->dev_opaque = opaque;
> >
> >      /* Are we currently quiesced? Should we enforce this right now? */
> > -    if (blk->quiesce_counter && ops->drained_begin) {
> > +    if (blk->quiesce_counter && ops && ops->drained_begin) {
> >          ops->drained_begin(opaque);
> >      }
> >  }
>
> John: You added this code in f4d9cc88ee6. Does blk_set_dev_ops() need to
> call ->drained_end() when ops is set to NULL?
>
> Stefan

I'm not sure I trust my memory from five years ago.

From what I recall, the problem was that block jobs weren't getting
drained/paused when the backend was getting quiesced -- we wanted to
be sure that a blockjob wasn't continuing to run and submit requests
against a backend we wanted to have on ice during a sensitive
operation. This conditional stanza here is meant to check if the node
we're already attached to is *already quiesced* and we missed the
signal (so-to-speak), so we replay the drained_begin() request right
there.

i.e. there was some case where blockjobs were getting added to an
already quiesced node, and this code here post-hoc relays that drain
request to the blockjob. This gets used in
600ac6a0ef5c06418446ef2f37407bddcc51b21c to pause/unpause jobs.
Original thread is here:
https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg03416.html

Now, I'm not sure why you want to set ops to NULL here. If we're in a
drained section, that sounds like it might be potentially bad because
we lose track of the operation to end the drained section. If your
intent is to destroy the thing that we'd need to call drained_end on,
I guess it doesn't matter -- provided you've cleaned up the target
object correctly. Just calling drained_end() pre-emptively seems like
it might be bad, what if it unpauses something you're in the middle of
trying to delete?

I might need slightly more context to know what you're hoping to
accomplish, but I hope this info helps contextualize this code
somewhat.
--js



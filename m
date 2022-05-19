Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE152CDFF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:12:41 +0200 (CEST)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbGy-0000iR-H0
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbDe-00076L-7X
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:09:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbDZ-0004Km-Mt
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:09:11 -0400
Received: by mail-ed1-x532.google.com with SMTP id n23so6086248edy.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TkFhXknSmwrcyvZjKNL6IXW20Io3ai0UDGSHFpgZj5w=;
 b=sT3c1x20r/oJoKHUBIECS4PgpkIla4qBsiljB6laCOaXgXauUvtN+Qn2q9tW856Fdz
 IphApYs9ex27LXlAeYMgYp+8zY46jy+Ms+NibybSQ44+EzVQ/ziSL77tIG34a0WoYupn
 pMls2MHLOtM/wiCaMs7NTpkpn1S4SBZwi6e+8PJqSekx6XKvXLxG3G/M9S14WOyxSLUA
 uufD+wWlaywgdso5TMuJjlEPEV6Q0ZUNM7YnwuUUeC2vD6owiOsNwSYaGkAyPBYR/ZQu
 3u5X7f8czuWnTJPlMoOz+MLqnfokiuMYAfvx/7drmpzUGDqAIQDFPr10WBIJSra15F+2
 zgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TkFhXknSmwrcyvZjKNL6IXW20Io3ai0UDGSHFpgZj5w=;
 b=3o0B0kdkEHkeCJ8xVk3g1lfgGVGVAtiT/Vjhx5I1sncgOjuLcPQKYmvVlo4FLs6JLE
 5kpOlOyDl+WGljHdln0LcxZh1lnx9NfJvisv8Ma1zVGM664jqdjJU/lWUmbTSH/+EuIR
 IYHhPt85Ek1cO6p3HKkmti3M9MkYmUX4Z8i+epXMYdEQhHpanI9jZuxvwp/5/ugwr1vQ
 mq38CVvLJOiEjGhG/jaQQkvMnLb0xtKj2TPmyIBwQYi3GQcw1wUr4FfCAAbzNYeWa4Q/
 MyfrhYV6OoHEkS+Wf9sQWatGrO3bzpmH2xuGZx9pjVWjhijl+BfB/boBFT5mMKRjiyCo
 43Wg==
X-Gm-Message-State: AOAM533RoR/zMoGJHznY/ZpCdy5Jy6M/QDj81z0iKvzHFMfO8K090eNM
 iuXrB66GfhChGFMY+Ej9qbHPybgp1U074hFmD13N
X-Google-Smtp-Source: ABdhPJyqXMiRfBD17PwCp4BlOJhayYiWywRxkaO49t/uWLheEqLrKaialcoxyTOQQcboiAExSBT1zi5d9RdyUHmBCsA=
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr3977136edb.415.1652947747619; Thu, 19
 May 2022 01:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-4-xieyongji@bytedance.com>
 <YoTxEbiG3i0SZx7e@stefanha-x1.localdomain>
In-Reply-To: <YoTxEbiG3i0SZx7e@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 19 May 2022 16:09:50 +0800
Message-ID: <CACycT3supsS-KpX6VjiX4SyhV3wrOwPyK-0UX3vPLkbu_PdvWg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] block/export: Abstract out the logic of virtio-blk
 I/O process
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 18, 2022 at 9:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 03:40:46PM +0800, Xie Yongji wrote:
> > -static void vu_blk_req_complete(VuBlkReq *req)
> > +static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
> >  {
> >      VuDev *vu_dev = &req->server->vu_dev;
> >
> > -    /* IO size with 1 extra status byte */
> > -    vu_queue_push(vu_dev, req->vq, &req->elem, req->size + 1);
> > +    vu_queue_push(vu_dev, req->vq, &req->elem, in_len);
>
> I think this silently fixes a bug: now the correct len value is
> calculated. Before the I/O buffer wasn't counted in read requests.

Yes.

> Please mention this in the commit description.
>

OK.

> > +static bool virtio_blk_sect_range_ok(BlockBackend *blk,
> > +                                     uint64_t sector, size_t size)
> > +{
> > +    uint64_t nb_sectors;
> > +    uint64_t total_sectors;
> > +
> > +    if (size % VIRTIO_BLK_SECTOR_SIZE) {
> > +        return false;
> > +    }
> > +
> > +    nb_sectors = size >> VIRTIO_BLK_SECTOR_BITS;
> > +
> > +    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != VIRTIO_BLK_SECTOR_SIZE);
> > +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
> > +        return false;
> > +    }
> > +    if ((sector << VIRTIO_BLK_SECTOR_BITS) % blk_get_guest_block_size(blk)) {
>
> Please use VirtioBlkHandler->logical_block_size instead (see below).
>
> > +int coroutine_fn virtio_blk_process_req(BlockBackend *blk, bool writable,
> > +                                        const char *serial,
>
> I suggest defining a struct instead of passing individual arguments:
>
>   typedef struct {
>       BlockBackend *blk;
>       const char *serial;
>       uint32_t logical_block_size;
>       bool writable;
>   } VirtioBlkHandler;

OK, will do it in v6.

Thanks,
Yongji


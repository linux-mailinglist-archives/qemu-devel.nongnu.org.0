Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE93F46F6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:54:03 +0200 (CEST)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5iU-0007d5-Be
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI5hD-0006x4-Tk
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:52:43 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI5hB-0001vj-DQ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:52:43 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso13759564otu.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFHwNA6UWARSxHxfUOeweobioEDl3QS6Vs2+KbI3DFk=;
 b=GVICJqIQqzEpsAU3FUZXJWNXrSEFdcJAnrCdZQBnn9DBCgrkSXvC4fDtqcqr1kIpr6
 OE9wgYYcxJHF59YBGBdDVratk7e3XDzQCAsBY43XfpXDKATTkNbBAP2xlpYzwaCvBXDi
 vBM8Sdd0kmHfeJ0FDdY0BJ6Ke0gP3Bbar/FDsg/yxUDaarltDxtTUOWwHw7detQqFIF4
 PA4phBzeBE1V5f3AmnwtMLIjlp4RwWXm/El5u/MT+sXgxctw1HfakheJjsMN81uR88vc
 TnhGM3YTFNyZzWAE1gE9JKfym60YFf9We/nVok9MDrcrI5y6ViUQMExzgZPtQpX3nj0l
 KxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFHwNA6UWARSxHxfUOeweobioEDl3QS6Vs2+KbI3DFk=;
 b=bESljTahmFjnrbvBf8TRF6tv45zcMH6d5d8faOddPsj2beG+eAI7LaT9CTxbMaU0Uz
 R3Wh+JHgsx33BJON1aYiQ8VOTs9G4lgogdXWwHToJjYHFswhNl0t7yePgsvhhqTqQMgM
 y45mJUAtD33Go1Yle0tE3JPWC+K7XoEVD1k52aEYWfS3+cyZgWqKYbE2YLGltcov0NH6
 lvDi2b0xc5EAEQ3uk1x4uW+rDqH88oUWMXvfUjlUEq9pRANxGq6e+rrwlqzUZ0jXavs5
 vwBFGEbpNzD6Ra+6BsWyvcBP3HwsYd/X3Re/RxxAWo/4UC//XVfO320UUT2tOAkcg2uH
 PGow==
X-Gm-Message-State: AOAM533PEL2dTA2ZuWAJqQoBCeHG3gLYUni0NLwF9AF8PdkjHo47Zf+r
 +QxAwqVxoiVyZVN6tFqsvk5B2A2Utym5nrcPoq0=
X-Google-Smtp-Source: ABdhPJzqS7qawFAOgeRLSVkpSTjb6v80DS4DaMdnw29x3SdErSLOmoNWUamskYztrptyTlxwq264x8aSA84kvzFZekk=
X-Received: by 2002:a9d:7e83:: with SMTP id m3mr21175896otp.44.1629708759333; 
 Mon, 23 Aug 2021 01:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
 <20210823033358.3002-2-lizhijian@cn.fujitsu.com>
 <18b3929e-8651-11b9-73ee-7fffbff40686@fujitsu.com>
In-Reply-To: <18b3929e-8651-11b9-73ee-7fffbff40686@fujitsu.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 23 Aug 2021 11:52:27 +0300
Message-ID: <CAC_L=vVA0nUpinKs-WXcx2b8Emy+MVeKhBcq=JS7gBUjFfWzZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zhijian,

On Mon, Aug 23, 2021 at 11:42 AM lizhijian@fujitsu.com
<lizhijian@fujitsu.com> wrote:
>
> CCing  Marcel
>
>
> On 23/08/2021 11:33, Li Zhijian wrote:
> > Previously, for the fsdax mem-backend-file, it will register failed with
> > Operation not supported. In this case, we can try to register it with
> > On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].
> >
> > [1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
> > [2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3
> >
> > CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> >
> > ---
> > V2: add ODP sanity check and remove goto
> > ---
> >   migration/rdma.c       | 73 ++++++++++++++++++++++++++++++------------
> >   migration/trace-events |  1 +
> >   2 files changed, 54 insertions(+), 20 deletions(-)
> >
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index 5c2d113aa94..eb80431aae2 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -1117,19 +1117,47 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
> >       return 0;
> >   }
> >
> > +/* Check whether On-Demand Paging is supported by RDAM device */
> > +static bool rdma_support_odp(struct ibv_context *dev)
> > +{
> > +    struct ibv_device_attr_ex attr = {0};
> > +    int ret = ibv_query_device_ex(dev, NULL, &attr);
> > +    if (ret) {
> > +        return false;
> > +    }
> > +
> > +    if (attr.odp_caps.general_caps & IBV_ODP_SUPPORT) {
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >   static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
> >   {
> >       int i;
> >       RDMALocalBlocks *local = &rdma->local_ram_blocks;
> >
> >       for (i = 0; i < local->nb_blocks; i++) {
> > +        int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE;
> > +
> >           local->block[i].mr =
> >               ibv_reg_mr(rdma->pd,
> >                       local->block[i].local_host_addr,
> > -                    local->block[i].length,
> > -                    IBV_ACCESS_LOCAL_WRITE |
> > -                    IBV_ACCESS_REMOTE_WRITE
> > +                    local->block[i].length, access
> >                       );
> > +
> > +        if (!local->block[i].mr &&
> > +            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
> > +                access |= IBV_ACCESS_ON_DEMAND;
> > +                /* register ODP mr */
> > +                local->block[i].mr =
> > +                    ibv_reg_mr(rdma->pd,
> > +                               local->block[i].local_host_addr,
> > +                               local->block[i].length, access);
> > +                trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
> > +        }
> > +
> >           if (!local->block[i].mr) {
> >               perror("Failed to register local dest ram block!");
> >               break;
> > @@ -1215,28 +1243,33 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
> >        */
> >       if (!block->pmr[chunk]) {
> >           uint64_t len = chunk_end - chunk_start;
> > +        int access = rkey ? IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE :
> > +                     0;
> >
> >           trace_qemu_rdma_register_and_get_keys(len, chunk_start);
> >
> > -        block->pmr[chunk] = ibv_reg_mr(rdma->pd,
> > -                chunk_start, len,
> > -                (rkey ? (IBV_ACCESS_LOCAL_WRITE |
> > -                        IBV_ACCESS_REMOTE_WRITE) : 0));
> > -
> > -        if (!block->pmr[chunk]) {
> > -            perror("Failed to register chunk!");
> > -            fprintf(stderr, "Chunk details: block: %d chunk index %d"
> > -                            " start %" PRIuPTR " end %" PRIuPTR
> > -                            " host %" PRIuPTR
> > -                            " local %" PRIuPTR " registrations: %d\n",
> > -                            block->index, chunk, (uintptr_t)chunk_start,
> > -                            (uintptr_t)chunk_end, host_addr,
> > -                            (uintptr_t)block->local_host_addr,
> > -                            rdma->total_registrations);
> > -            return -1;
> > +        block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
> > +        if (!block->pmr[chunk] &&
> > +            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
> > +            access |= IBV_ACCESS_ON_DEMAND;
> > +            /* register ODP mr */
> > +            block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
> > +            trace_qemu_rdma_register_odp_mr(block->block_name);
> >           }
> > -        rdma->total_registrations++;
> >       }
> > +    if (!block->pmr[chunk]) {
> > +        perror("Failed to register chunk!");
> > +        fprintf(stderr, "Chunk details: block: %d chunk index %d"
> > +                        " start %" PRIuPTR " end %" PRIuPTR
> > +                        " host %" PRIuPTR
> > +                        " local %" PRIuPTR " registrations: %d\n",
> > +                        block->index, chunk, (uintptr_t)chunk_start,
> > +                        (uintptr_t)chunk_end, host_addr,
> > +                        (uintptr_t)block->local_host_addr,
> > +                        rdma->total_registrations);
> > +        return -1;
> > +    }
> > +    rdma->total_registrations++;
> >
> >       if (lkey) {
> >           *lkey = block->pmr[chunk]->lkey;
> > diff --git a/migration/trace-events b/migration/trace-events
> > index a1c0f034ab8..5f6aa580def 100644
> > --- a/migration/trace-events
> > +++ b/migration/trace-events
> > @@ -212,6 +212,7 @@ qemu_rdma_poll_write(const char *compstr, int64_t comp, int left, uint64_t block
> >   qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other completion %s (%" PRId64 ") received left %d"
> >   qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
> >   qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
> > +qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
> >   qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
> >   qemu_rdma_registration_handle_finished(void) ""
> >   qemu_rdma_registration_handle_ram_blocks(void) ""

Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel


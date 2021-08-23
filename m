Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331E3F458C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 09:04:46 +0200 (CEST)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI40g-0005mF-33
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 03:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI3zm-00058P-9y
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 03:03:46 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI3zk-0003A3-ER
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 03:03:46 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so33783577otf.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ICh+tWdwdSdf/8GMx6cWnt1+J5bgeMdEYex5pRDUIFM=;
 b=OA0Z/WQWeswGZRpgAImnqBRiVfcK/8eiNDsDMb7J7vehOcnW6mjgqYR7MYYMcQ1i1D
 ecmp0x6EkP7SMO94GsYxZmhTxODS32psFNqtWLOCjv/j0F4vREdpUVH7qVNC7DmTMd3n
 mlW7jy85iW5cyEdoofLlQEIYinXkA1YQbVPaoxq7Kka0VFbtX1C7++aoX/7pQdbj2sHV
 ypZVxSrbshfVF39zpA2bo7uLAH6r+MyTdgUbq4Cd57sG+mcwYQX9QEmO4Nb4rDIoqVkG
 Jk9yXLazx46kfh2+6UoSiAOSvzpFSIWdcDRcmv2Ir9KHWewJfao2zb4NsGYx7PuTJeVz
 BMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICh+tWdwdSdf/8GMx6cWnt1+J5bgeMdEYex5pRDUIFM=;
 b=ce4gVHS37T3GBJge4mKS7qAt6UcAY9uyNUIK/80B27Mvw7daP5IusRgF2eMNA6Fus7
 Qd5yXM5YU9XZOWgV2Wf5ZHMPoMw8G99NY48y1/3ai4p/5jeQw3Rc8xtNAuGnWoYL/AuL
 woaYXSiBEQNcq1MaAvuj8TM1vluc995B62GxcBbAyOqS8ycC3tttrnHp7Sum/N7ZBDRy
 fyBhl2rNG2FV+4kWfkQ/9kgrVhIxV5ZestwU7Ktn9y/4JX55Hsuc7XlaJ7LR1CsqcBsQ
 LFrvFpg0UMmxVymQYEzhNBpUcLsZ1EF9xYwxVBotIH/oCWSQtWoATSUCBpZdRoDKs2y/
 wr9A==
X-Gm-Message-State: AOAM531pnpSg43OkKC2zGpezGTlKkMZgTJrowxyoMSXETwL8LxHWyWQp
 r2eD4cNtI/uimWMpiy2TUOKL8xNNKUQWJ7GtmQg=
X-Google-Smtp-Source: ABdhPJyj1m8X2vQNye7fFf43YeN0Foswl0XmiHPFUsVXvLL4tJX4Jo2/hitr0vGSaQmSipOqMzh9lJ73kKYG58LNZQM=
X-Received: by 2002:a9d:7e83:: with SMTP id m3mr20946855otp.44.1629702223076; 
 Mon, 23 Aug 2021 00:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
 <20210731140332.8701-2-lizhijian@cn.fujitsu.com>
 <CAC_L=vUJnyT+Z_NpgocM3HNOuU0G6HvVB5LXFXN0=yajUrVXYg@mail.gmail.com>
 <7ee884ab-3927-79c2-dd5b-4f805442d118@fujitsu.com>
In-Reply-To: <7ee884ab-3927-79c2-dd5b-4f805442d118@fujitsu.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 23 Aug 2021 10:03:31 +0300
Message-ID: <CAC_L=vXqtWQoDD-gb36gzcQAWe=9-sAEpUgEJgSN=DTPghtyLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zhijian,

On Mon, Aug 23, 2021 at 4:41 AM lizhijian@fujitsu.com
<lizhijian@fujitsu.com> wrote:
>
>
>
> On 22/08/2021 16:53, Marcel Apfelbaum wrote:
> > Hi
> >
> > On Sat, Jul 31, 2021 at 5:00 PM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> >> Previously, for the fsdax mem-backend-file, it will register failed with
> >> Operation not supported. In this case, we can try to register it with
> >> On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].
> >>
> >> [1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
> >> [2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3
> >> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> >> ---
> >>   migration/rdma.c       | 27 ++++++++++++++++++---------
> >>   migration/trace-events |  1 +
> >>   2 files changed, 19 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/migration/rdma.c b/migration/rdma.c
> >> index 5c2d113aa94..8784b5f22a6 100644
> >> --- a/migration/rdma.c
> >> +++ b/migration/rdma.c
> >> @@ -1123,15 +1123,21 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
> >>       RDMALocalBlocks *local = &rdma->local_ram_blocks;
> >>
> >>       for (i = 0; i < local->nb_blocks; i++) {
> >> +        int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE;
> >> +
> >> +on_demand:
> >>           local->block[i].mr =
> >>               ibv_reg_mr(rdma->pd,
> >>                       local->block[i].local_host_addr,
> >> -                    local->block[i].length,
> >> -                    IBV_ACCESS_LOCAL_WRITE |
> >> -                    IBV_ACCESS_REMOTE_WRITE
> >> +                    local->block[i].length, access
> >>                       );
> >>           if (!local->block[i].mr) {
> >> -            perror("Failed to register local dest ram block!");
> >> +            if (!(access & IBV_ACCESS_ON_DEMAND) && errno == ENOTSUP) {
> >> +                access |= IBV_ACCESS_ON_DEMAND;
> >> +                trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
> >> +                goto on_demand;
> > Wouldn't it be better to check first if the device supports ODP ?
> > Something like:
> >      ret = ibv_exp_query_device(context, &dattr);
> >      if (dattr.exp_device_cap_flags & IBV_EXP_DEVICE_ODP)...
>
> Good idea !
>
>
>
> >
> > Also, I  am not (personally) too fond of the "on_demand" label usage here,
> > however I will let the maintainer/others decide.
> Indeed, how just repeating the ibv_reg_mr() instead of a 'go to'
>

Any "boring"/standard approach would do.

Thanks,
Marcel

> Thanks
> Zhijian
>
>
>
> >
> > Thanks,
> > Marcel
> >
> >> +            }
> >> +            perror("Failed to register local dest ram block!\n");
> >>               break;
> >>           }
> >>           rdma->total_registrations++;
> >> @@ -1215,15 +1221,18 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
> >>        */
> >>       if (!block->pmr[chunk]) {
> >>           uint64_t len = chunk_end - chunk_start;
> >> +        int access = rkey ? IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE : 0;
> >>
> >>           trace_qemu_rdma_register_and_get_keys(len, chunk_start);
> >>
> >> -        block->pmr[chunk] = ibv_reg_mr(rdma->pd,
> >> -                chunk_start, len,
> >> -                (rkey ? (IBV_ACCESS_LOCAL_WRITE |
> >> -                        IBV_ACCESS_REMOTE_WRITE) : 0));
> >> -
> >> +on_demand:
> >> +        block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
> >>           if (!block->pmr[chunk]) {
> >> +            if (!(access & IBV_ACCESS_ON_DEMAND) && errno == ENOTSUP) {
> >> +                access |= IBV_ACCESS_ON_DEMAND;
> >> +                trace_qemu_rdma_register_odp_mr(block->block_name);
> >> +                goto on_demand;
> >> +            }
> >>               perror("Failed to register chunk!");
> >>               fprintf(stderr, "Chunk details: block: %d chunk index %d"
> >>                               " start %" PRIuPTR " end %" PRIuPTR
> >> diff --git a/migration/trace-events b/migration/trace-events
> >> index a1c0f034ab8..5f6aa580def 100644
> >> --- a/migration/trace-events
> >> +++ b/migration/trace-events
> >> @@ -212,6 +212,7 @@ qemu_rdma_poll_write(const char *compstr, int64_t comp, int left, uint64_t block
> >>   qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other completion %s (%" PRId64 ") received left %d"
> >>   qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
> >>   qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
> >> +qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
> >>   qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
> >>   qemu_rdma_registration_handle_finished(void) ""
> >>   qemu_rdma_registration_handle_ram_blocks(void) ""
> >> --
> >> 2.31.1
> >>
> >>
> >>
> >>
> >


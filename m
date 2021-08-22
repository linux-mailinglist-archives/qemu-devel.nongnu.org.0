Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3683F3EBA
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 10:54:14 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHjEw-0006w8-LS
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 04:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mHjEB-0006Gu-3n
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:53:15 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mHjE9-0005Tn-C4
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:53:14 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 a20-20020a0568300b9400b0051b8ca82dfcso6258991otv.3
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOGxu57z/EGJ2Jq2EF4yjLAO6pwkmNigbTvCVBZCyKI=;
 b=JGEbTm40EOsf/jL7cr0pLoGI+2Q/ozMPRdRwM1Dx1FNftdGwWhYI6aEjJgBnyIcyh2
 PFIUDMm/hN+Ub8Jgo2D6iISEAdjlMfKoC1kyG1wCMh4ZjuF6a3iq5lamGkfin7dBEn0q
 akSuQh10vBuj+KeCp79QsOD7QQM6HzJsK33K9pHbJbTNxqvfmPaMR1fYJEmgrXu0Yo0h
 uWOgjYzOMsfj+bSFmJATP5n8RxXkF6vJnzfiwkza4SCcuF3n+AENoCxBqPGiNEk0w0JV
 yBXJQfQGa/eYZyXgqSaphp5osDz+tf9W008n8ytkCCA9g4pIhZfYpMvGiYSU72tUK4ty
 M7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOGxu57z/EGJ2Jq2EF4yjLAO6pwkmNigbTvCVBZCyKI=;
 b=sDJ8+VRcCRr/XNFXXli+eNvDEjDcQ4lq/9i7rREwPmzjeUuDlX4LtoXkQb7I5fynsy
 lx3pTbznBwvZWxnDDLGeLHgIK28SPFfLQmLFD8HyMJG//p6WpBgfChdcQtY5rOVnVZX5
 jFplbdQ1noFF4iNZgurqNrcskwt4plCmbMfP/aL4NPvB+W4Ff95TXD0hkYuFTxl+0Qqz
 sc59+Z9/0ZWxj43UFs7hIrssZUkkmVTL6rYrUgpGvvkOoPa9rQ/ElBdR4CRIKjMpGDAz
 +1QHPVVuM31Afc17cGKZK72C7Os0pGaHEzIKP8qHLfGWuEsRPjG+lsZZeKhoUgERLC+r
 K9MA==
X-Gm-Message-State: AOAM5322ze9tSEfKaj+Q2I8DrUqToWwHUjN8Qd9gRxs1gVgzlBZFl16v
 MC9Z2/HIh+tZmh2bnNnEoT5HI64gizTW9/a8hDc=
X-Google-Smtp-Source: ABdhPJxgsQQrU569UJL2eLTTJuHJ8n1Tz2b2KOIUbFDpEmDtGcxKR2NMmmHt3d1n48FYhW+exfE71Yswe3HOAgyLlBo=
X-Received: by 2002:a9d:7e83:: with SMTP id m3mr18124822otp.44.1629622391846; 
 Sun, 22 Aug 2021 01:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
 <20210731140332.8701-2-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210731140332.8701-2-lizhijian@cn.fujitsu.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 22 Aug 2021 11:53:00 +0300
Message-ID: <CAC_L=vUJnyT+Z_NpgocM3HNOuU0G6HvVB5LXFXN0=yajUrVXYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x32d.google.com
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

Hi

On Sat, Jul 31, 2021 at 5:00 PM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
> Previously, for the fsdax mem-backend-file, it will register failed with
> Operation not supported. In this case, we can try to register it with
> On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].
>
> [1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
> [2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  migration/rdma.c       | 27 ++++++++++++++++++---------
>  migration/trace-events |  1 +
>  2 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 5c2d113aa94..8784b5f22a6 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1123,15 +1123,21 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>      RDMALocalBlocks *local = &rdma->local_ram_blocks;
>
>      for (i = 0; i < local->nb_blocks; i++) {
> +        int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE;
> +
> +on_demand:
>          local->block[i].mr =
>              ibv_reg_mr(rdma->pd,
>                      local->block[i].local_host_addr,
> -                    local->block[i].length,
> -                    IBV_ACCESS_LOCAL_WRITE |
> -                    IBV_ACCESS_REMOTE_WRITE
> +                    local->block[i].length, access
>                      );
>          if (!local->block[i].mr) {
> -            perror("Failed to register local dest ram block!");
> +            if (!(access & IBV_ACCESS_ON_DEMAND) && errno == ENOTSUP) {
> +                access |= IBV_ACCESS_ON_DEMAND;
> +                trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
> +                goto on_demand;

Wouldn't it be better to check first if the device supports ODP ?
Something like:
    ret = ibv_exp_query_device(context, &dattr);
    if (dattr.exp_device_cap_flags & IBV_EXP_DEVICE_ODP)...

Also, I  am not (personally) too fond of the "on_demand" label usage here,
however I will let the maintainer/others decide.

Thanks,
Marcel

> +            }
> +            perror("Failed to register local dest ram block!\n");
>              break;
>          }
>          rdma->total_registrations++;
> @@ -1215,15 +1221,18 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
>       */
>      if (!block->pmr[chunk]) {
>          uint64_t len = chunk_end - chunk_start;
> +        int access = rkey ? IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE : 0;
>
>          trace_qemu_rdma_register_and_get_keys(len, chunk_start);
>
> -        block->pmr[chunk] = ibv_reg_mr(rdma->pd,
> -                chunk_start, len,
> -                (rkey ? (IBV_ACCESS_LOCAL_WRITE |
> -                        IBV_ACCESS_REMOTE_WRITE) : 0));
> -
> +on_demand:
> +        block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
>          if (!block->pmr[chunk]) {
> +            if (!(access & IBV_ACCESS_ON_DEMAND) && errno == ENOTSUP) {
> +                access |= IBV_ACCESS_ON_DEMAND;
> +                trace_qemu_rdma_register_odp_mr(block->block_name);
> +                goto on_demand;
> +            }
>              perror("Failed to register chunk!");
>              fprintf(stderr, "Chunk details: block: %d chunk index %d"
>                              " start %" PRIuPTR " end %" PRIuPTR
> diff --git a/migration/trace-events b/migration/trace-events
> index a1c0f034ab8..5f6aa580def 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -212,6 +212,7 @@ qemu_rdma_poll_write(const char *compstr, int64_t comp, int left, uint64_t block
>  qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other completion %s (%" PRId64 ") received left %d"
>  qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
>  qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
> +qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
>  qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
>  qemu_rdma_registration_handle_finished(void) ""
>  qemu_rdma_registration_handle_ram_blocks(void) ""
> --
> 2.31.1
>
>
>
>


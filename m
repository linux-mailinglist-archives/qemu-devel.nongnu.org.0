Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6F3F3EA8
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 10:41:40 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHj2u-0000Oz-72
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 04:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mHj1C-0006Cc-N2
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:39:50 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mHj1A-0002fa-Oc
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:39:50 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 h7-20020a4ab4470000b0290263c143bcb2so4400300ooo.7
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=judNUDpkN9AZMgjR5AK2bDrUr3BnjUKZjAnsJP612Uo=;
 b=b9Aknk6yvtz4cnuaVJOqXOrON3TEKJ9kQr9LI9nzVGejrs7kkmn+at2Puk5LM574c3
 d4JscJ2bQ/6eG+c5thHxN+SU28qUvfuVp51PU3ZSo3BMs0E1sjI40jcwrroiZ4O7C2bN
 bFpxkUGOH1vnJ+BJktXZ6FjcJ24tL24QXgD/DmoSI4SnvkebGrO3BMZMK9AAxe3L/jU5
 d7kO8kxBJ6E+ae7k7eD5uGY2sseWc+ugiw9npLpzXMNsEhSsxnGGEJt4o8D5GgdHLjAp
 q0/InF50liwz3qzJxXaTvm8E/xeSQ9hTBHB85CjRNoZ/EKRVqB0m6ljJMhBycjk5U3XC
 8JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=judNUDpkN9AZMgjR5AK2bDrUr3BnjUKZjAnsJP612Uo=;
 b=pIuygIxGcTYLI/V0fglTkqhxJukjQVxIt7fTwJ4ZbFaM7+Fv7ypSORXWRenHfQJXpL
 5IgsLhi2yFs9mCsGGcpFFtXDlDXn84/2UBeueJu1kPfYOl01GuySHlFYtcvnjVAuPmjH
 9uI+vlDU/YQRH/o3yHa4K6fY9xRLSyCcqGh3WjSTQCauzZgP9f3vF7LW/bf4Ahwp17mX
 XhcQfX8saBlpzpYCKt5hEds9dzN9yp/9gdkgbRFiBDVZ3zHqt7iizE22OS09csD8fDqe
 HvmO0I6uZ4eksEpqxs8WMOAQaEqXjbAyJjof9VyjI/fKvGZy7G1F5GKq3ukIQfdRFWXB
 qRNw==
X-Gm-Message-State: AOAM532v60esa25POYvI8cYXM7QWJffCxZ/BglSL9CHaSEuCXEeJo21x
 c4gDxSSOustB+3dGBUyKdutoz8zlsAlqI15Pw/8=
X-Google-Smtp-Source: ABdhPJzzDH7tB5ShiS4PJ5xteiWuut5QB3B685sDCMfQcMjIN+avakf4jOiyRmGO2pVDCcVBMSnCjv7Tj86lkedaMfc=
X-Received: by 2002:a4a:d40a:: with SMTP id n10mr21969052oos.32.1629621587338; 
 Sun, 22 Aug 2021 01:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
 <20210731140332.8701-3-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210731140332.8701-3-lizhijian@cn.fujitsu.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 22 Aug 2021 11:39:36 +0300
Message-ID: <CAC_L=vUXYjyZ6qwg6LoStSVg0sBbZtS_wO9FRLa0Dp4b_rYobA@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration/rdma: advise prefetch write for ODP region
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oo1-xc2e.google.com
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

Hi,

On Sat, Jul 31, 2021 at 5:03 PM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
> The responder mr registering with ODP will sent RNR NAK back to
> the requester in the face of the page fault.
> ---------
> ibv_poll_cq wc.status=13 RNR retry counter exceeded!
> ibv_poll_cq wrid=WRITE RDMA!
> ---------
> ibv_advise_mr(3) helps to make pages present before the actual IO is
> conducted so that the responder does page fault as little as possible.
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  migration/rdma.c       | 40 ++++++++++++++++++++++++++++++++++++++++
>  migration/trace-events |  1 +
>  2 files changed, 41 insertions(+)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 8784b5f22a6..a2ad00d665f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1117,6 +1117,30 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
>      return 0;
>  }
>
> +/*
> + * ibv_advise_mr to avoid RNR NAK error as far as possible.
> + * The responder mr registering with ODP will sent RNR NAK back to
> + * the requester in the face of the page fault.
> + */
> +static void qemu_rdma_advise_prefetch_write_mr(struct ibv_pd *pd, uint64_t addr,
> +                                               uint32_t len,  uint32_t lkey,
> +                                               const char *name, bool wr)
> +{
> +    int ret;
> +    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
> +                 IBV_ADVISE_MR_ADVICE_PREFETCH;
> +    struct ibv_sge sg_list = {.lkey = lkey, .addr = addr, .length = len};
> +
> +    ret = ibv_advise_mr(pd, advice,
> +                        IB_UVERBS_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
> +    /* ignore the error */
> +    if (ret) {
> +        trace_qemu_rdma_advise_mr(name, len, addr, strerror(errno));
> +    } else {
> +        trace_qemu_rdma_advise_mr(name, len, addr, "successed");
> +    }
> +}
> +
>  static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>  {
>      int i;
> @@ -1140,6 +1164,17 @@ on_demand:
>              perror("Failed to register local dest ram block!\n");
>              break;
>          }
> +
> +        if (access & IBV_ACCESS_ON_DEMAND) {
> +            qemu_rdma_advise_prefetch_write_mr(rdma->pd,
> +                                               (uintptr_t)
> +                                               local->block[i].local_host_addr,
> +                                               local->block[i].length,
> +                                               local->block[i].mr->lkey,
> +                                               local->block[i].block_name,
> +                                               true);
> +        }
> +
>          rdma->total_registrations++;
>      }
>
> @@ -1244,6 +1279,11 @@ on_demand:
>                              rdma->total_registrations);
>              return -1;
>          }
> +        if (access & IBV_ACCESS_ON_DEMAND) {
> +            qemu_rdma_advise_prefetch_write_mr(rdma->pd, (uintptr_t)chunk_start,
> +                                               len, block->pmr[chunk]->lkey,
> +                                               block->block_name, rkey);
> +        }
>          rdma->total_registrations++;
>      }
>
> diff --git a/migration/trace-events b/migration/trace-events
> index 5f6aa580def..901c1d54c12 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -213,6 +213,7 @@ qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other complet
>  qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
>  qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
>  qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
> +qemu_rdma_advise_mr(const char *name, uint32_t len, uint64_t addr, const char *res) "Try to advise block %s prefetch write at %" PRIu32 "@0x%" PRIx64 ": %s"
>  qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
>  qemu_rdma_registration_handle_finished(void) ""
>  qemu_rdma_registration_handle_ram_blocks(void) ""
> --
> 2.31.1
>

Following https://github.com/linux-rdma/rdma-core/blob/master/libibverbs/man/ibv_advise_mr.3.md
it looks like it is a best-effort optimization,
I don't see any down-sides to it.
However it seems like it is recommended to use
IBV_ADVISE_MR_FLAG_FLUSH in order to
increase the optimization chances.

Anyway

Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel


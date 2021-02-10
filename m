Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140303161A4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:59:32 +0100 (CET)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9lLO-0002z2-Kj
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1l9lIi-0000xj-NN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:56:46 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1l9lIY-0005D7-BP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:56:44 -0500
Received: by mail-lf1-x12b.google.com with SMTP id f23so1647177lfk.9
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 00:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0fpCbnRPEUtF++gy0X2pxm62cpd/qd1rpgmnQvaxZZQ=;
 b=Rml7Roq4OyzuPJxmFHITYEhSuUazvpSp5ZH9G02Ql1nCbFCWM2MK863tNXpiSVUdiu
 PalgXplpQY8Gq+7wRFaF0Pax7WD4/+2iW1Cu/BpUAnf/yXfO3PcB9Nz97kJNTrHN83ny
 R+9via2VGRwPMvqKNNT6YFM4FWuavm2S4oG1esNt/LoJJSfDe9KSL/6njv05tc8UG7Lo
 pSicTcGN4Mn8Rkt6pvgtlt2uYSODWpb/f+IRcnDS57g7sP3iRrOfD6pwgPmmRHsGvBuu
 O15gyDe9SbEKQtb+uThSiPizZSLQMxYwprjz0BVlstTLWffbetrKelYqVpi997XPfnd1
 uECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fpCbnRPEUtF++gy0X2pxm62cpd/qd1rpgmnQvaxZZQ=;
 b=kLWePd2TWExqW843GCXBYbplA1Y4kW176qxgpKTU8kygpX43JmEyTjaWVFqQ03xyhL
 adfhvebJs9OaS8qHxYOWyZy+5+EM7zjebxHp3yw5RmKoz/FiqFzFwEIICllvFU9rKTX+
 0rc640efzoI6UAQG5c5kJBeI6IyxdrXseAnVX3pgeCLMFXPD4DTEbmkBDVz1s5Amh8j2
 WNOO90WqjHa+6ZjAR4cvR/FydUfvsqIvrKaeijTOfnZoY1GCedJgaqG7K+yF4udiGwue
 O9xiFeM51uc18kRmOA5G0EMsE6aOrHavoGpFk418JHVySQbEki5rXbkexM18hUF1E2xq
 aWkQ==
X-Gm-Message-State: AOAM5315b27cBSCNHiC8TJsDvCFZFdCcXV9Ok8DOXW5mmQVMZjnBRHQ/
 /F2RbffPM+EtKdHf3ZUek8M0UVCaeBs3Ic0hK3k=
X-Google-Smtp-Source: ABdhPJzaAu9bEN3/GjC32ugqdEuwtDh5gnxFB1my/pvJiQj6c3Dce5b+aixS00QmYdSzvRrDWJCdMlWSFpjkHkJ/CH4=
X-Received: by 2002:a19:7d1:: with SMTP id 200mr1215671lfh.110.1612947389473; 
 Wed, 10 Feb 2021 00:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20210122180029.575284-1-cohuck@redhat.com>
In-Reply-To: <20210122180029.575284-1-cohuck@redhat.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Wed, 10 Feb 2021 10:56:18 +0200
Message-ID: <CAMPkWoOOgsWKm=5_jevL9OSaJtjttQ0rr_3RGmiHMiFE0ht6hQ@mail.gmail.com>
Subject: Re: [PATCH RFC] pvrdma: wean code off pvrdma_ring.h kernel header
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000030e71405baf7944f"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030e71405baf7944f
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Jan 2021 at 20:00, Cornelia Huck <cohuck@redhat.com> wrote:

> The pvrdma code relies on the pvrdma_ring.h kernel header for some
> basic ring buffer handling. The content of that header isn't very
> exciting, but contains some (q)atomic_*() invocations that (a)
> cause manual massaging when doing a headers update, and (b) are
> an indication that we probably should not be importing that header
> at all.
>
> Let's reimplement the ring buffer handling directly in the pvrdma
> code instead. This arguably also improves readability of the code.
>
> Importing the header can now be dropped.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>
> Compile-tested only, needs both testing and more eyeballs :)
>
> ---
>  hw/rdma/vmw/pvrdma.h                          |   5 +-
>  hw/rdma/vmw/pvrdma_cmd.c                      |   6 +-
>  hw/rdma/vmw/pvrdma_dev_ring.c                 |  41 ++++---
>  hw/rdma/vmw/pvrdma_dev_ring.h                 |   9 +-
>  hw/rdma/vmw/pvrdma_main.c                     |   4 +-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    | 114 ------------------
>  scripts/update-linux-headers.sh               |   3 +-
>  7 files changed, 38 insertions(+), 144 deletions(-)
>  delete mode 100644
> include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>
> diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
> index 1d36a76f1e3b..d08965d3e2d5 100644
> --- a/hw/rdma/vmw/pvrdma.h
> +++ b/hw/rdma/vmw/pvrdma.h
> @@ -26,7 +26,6 @@
>  #include "../rdma_backend_defs.h"
>  #include "../rdma_rm_defs.h"
>
> -#include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h"
>  #include
> "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h"
>  #include "pvrdma_dev_ring.h"
>  #include "qom/object.h"
> @@ -64,10 +63,10 @@ typedef struct DSRInfo {
>      union pvrdma_cmd_req *req;
>      union pvrdma_cmd_resp *rsp;
>
> -    struct pvrdma_ring *async_ring_state;
> +    PvrdmaRingState *async_ring_state;
>      PvrdmaRing async;
>
> -    struct pvrdma_ring *cq_ring_state;
> +    PvrdmaRingState *cq_ring_state;
>      PvrdmaRing cq;
>  } DSRInfo;
>
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index 692125ac2681..f59879e2574e 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -262,7 +262,7 @@ static int create_cq_ring(PCIDevice *pci_dev ,
> PvrdmaRing **ring,
>      r = g_malloc(sizeof(*r));
>      *ring = r;
>
> -    r->ring_state = (struct pvrdma_ring *)
> +    r->ring_state = (PvrdmaRingState *)
>          rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>
>      if (!r->ring_state) {
> @@ -398,7 +398,7 @@ static int create_qp_rings(PCIDevice *pci_dev,
> uint64_t pdir_dma,
>      *rings = sr;
>
>      /* Create send ring */
> -    sr->ring_state = (struct pvrdma_ring *)
> +    sr->ring_state = (PvrdmaRingState *)
>          rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>      if (!sr->ring_state) {
>          rdma_error_report("Failed to map to QP ring state");
> @@ -639,7 +639,7 @@ static int create_srq_ring(PCIDevice *pci_dev,
> PvrdmaRing **ring,
>      r = g_malloc(sizeof(*r));
>      *ring = r;
>
> -    r->ring_state = (struct pvrdma_ring *)
> +    r->ring_state = (PvrdmaRingState *)
>              rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>      if (!r->ring_state) {
>          rdma_error_report("Failed to map tp SRQ ring state");
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index f0bcde74b06a..074ac59b84db 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -22,11 +22,10 @@
>  #include "trace.h"
>
>  #include "../rdma_utils.h"
> -#include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h"
>  #include "pvrdma_dev_ring.h"
>
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
> -                     struct pvrdma_ring *ring_state, uint32_t max_elems,
> +                     PvrdmaRingState *ring_state, uint32_t max_elems,
>                       size_t elem_sz, dma_addr_t *tbl, uint32_t npages)
>  {
>      int i;
> @@ -73,48 +72,54 @@ out:
>
>  void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
>  {
> -    int e;
> -    unsigned int idx = 0, offset;
> +    unsigned int idx, offset;
> +    const uint32_t tail = qatomic_read(&ring->ring_state->prod_tail);
> +    const uint32_t head = qatomic_read(&ring->ring_state->cons_head);
>
> -    e = pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx);
> -    if (e <= 0) {
> +    if (tail & ~((ring->max_elems << 1) - 1) ||
> +        head & ~((ring->max_elems << 1) - 1) ||
> +        tail == head) {
>          trace_pvrdma_ring_next_elem_read_no_data(ring->name);
>          return NULL;
>      }
>
> +    idx = head & (ring->max_elems - 1);
>      offset = idx * ring->elem_sz;
>      return ring->pages[offset / TARGET_PAGE_SIZE] + (offset %
> TARGET_PAGE_SIZE);
>  }
>
>  void pvrdma_ring_read_inc(PvrdmaRing *ring)
>  {
> -    pvrdma_idx_ring_inc(&ring->ring_state->cons_head, ring->max_elems);
> +    uint32_t idx = qatomic_read(&ring->ring_state->cons_head);
> +
> +    idx = (idx + 1) & ((ring->max_elems << 1) - 1);
> +    qatomic_set(&ring->ring_state->cons_head, idx);
>  }
>
>  void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)
>  {
> -    int idx;
> -    unsigned int offset, tail;
> +    unsigned int idx, offset;
> +    const uint32_t tail = qatomic_read(&ring->ring_state->prod_tail);
> +    const uint32_t head = qatomic_read(&ring->ring_state->cons_head);
>
> -    idx = pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems,
> &tail);
> -    if (idx <= 0) {
> +    if (tail & ~((ring->max_elems << 1) - 1) ||
> +        head & ~((ring->max_elems << 1) - 1) ||
> +        tail == (head ^ ring->max_elems)) {
>          rdma_error_report("CQ is full");
>          return NULL;
>      }
>
> -    idx = pvrdma_idx(&ring->ring_state->prod_tail, ring->max_elems);
> -    if (idx < 0 || tail != idx) {
> -        rdma_error_report("Invalid idx %d", idx);
> -        return NULL;
> -    }
> -
> +    idx = tail & (ring->max_elems - 1);
>      offset = idx * ring->elem_sz;
>      return ring->pages[offset / TARGET_PAGE_SIZE] + (offset %
> TARGET_PAGE_SIZE);
>  }
>
>  void pvrdma_ring_write_inc(PvrdmaRing *ring)
>  {
> -    pvrdma_idx_ring_inc(&ring->ring_state->prod_tail, ring->max_elems);
> +    uint32_t idx = qatomic_read(&ring->ring_state->prod_tail);
> +
> +    idx = (idx + 1) & ((ring->max_elems << 1) - 1);
> +    qatomic_set(&ring->ring_state->prod_tail, idx);
>  }
>
>  void pvrdma_ring_free(PvrdmaRing *ring)
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h
> index 5f2a0cf9b9fa..d231588ce004 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.h
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.h
> @@ -19,18 +19,23 @@
>
>  #define MAX_RING_NAME_SZ 32
>
> +typedef struct PvrdmaRingState {
> +    int prod_tail; /* producer tail */
> +    int cons_head; /* consumer head */
> +} PvrdmaRingState;
> +
>  typedef struct PvrdmaRing {
>      char name[MAX_RING_NAME_SZ];
>      PCIDevice *dev;
>      uint32_t max_elems;
>      size_t elem_sz;
> -    struct pvrdma_ring *ring_state; /* used only for unmap */
> +    PvrdmaRingState *ring_state; /* used only for unmap */
>      int npages;
>      void **pages;
>  } PvrdmaRing;
>
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
> -                     struct pvrdma_ring *ring_state, uint32_t max_elems,
> +                     PvrdmaRingState *ring_state, uint32_t max_elems,
>                       size_t elem_sz, dma_addr_t *tbl, uint32_t npages);
>  void *pvrdma_ring_next_elem_read(PvrdmaRing *ring);
>  void pvrdma_ring_read_inc(PvrdmaRing *ring);
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 85935703322f..84ae8024fcfd 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -85,7 +85,7 @@ static void free_dev_ring(PCIDevice *pci_dev, PvrdmaRing
> *ring,
>      rdma_pci_dma_unmap(pci_dev, ring_state, TARGET_PAGE_SIZE);
>  }
>
> -static int init_dev_ring(PvrdmaRing *ring, struct pvrdma_ring
> **ring_state,
> +static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
>                           const char *name, PCIDevice *pci_dev,
>                           dma_addr_t dir_addr, uint32_t num_pages)
>  {
> @@ -114,7 +114,7 @@ static int init_dev_ring(PvrdmaRing *ring, struct
> pvrdma_ring **ring_state,
>      /* RX ring is the second */
>      (*ring_state)++;
>      rc = pvrdma_ring_init(ring, name, pci_dev,
> -                          (struct pvrdma_ring *)*ring_state,
> +                          (PvrdmaRingState *)*ring_state,
>                            (num_pages - 1) * TARGET_PAGE_SIZE /
>                            sizeof(struct pvrdma_cqne),
>                            sizeof(struct pvrdma_cqne),
> diff --git
> a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> deleted file mode 100644
> index 7b4062a1a107..000000000000
> ---
> a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -/*
> - * Copyright (c) 2012-2016 VMware, Inc.  All rights reserved.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of EITHER the GNU General Public License
> - * version 2 as published by the Free Software Foundation or the BSD
> - * 2-Clause License. This program is distributed in the hope that it
> - * will be useful, but WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED
> - * WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
> - * See the GNU General Public License version 2 for more details at
> - * http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program available in the file COPYING in the main
> - * directory of this source tree.
> - *
> - * The BSD 2-Clause License
> - *
> - *     Redistribution and use in source and binary forms, with or
> - *     without modification, are permitted provided that the following
> - *     conditions are met:
> - *
> - *      - Redistributions of source code must retain the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer.
> - *
> - *      - Redistributions in binary form must reproduce the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer in the documentation and/or other materials
> - *        provided with the distribution.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> - * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> - * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
> - * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> - * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> - * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
> - * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
> - * OF THE POSSIBILITY OF SUCH DAMAGE.
> - */
> -
> -#ifndef __PVRDMA_RING_H__
> -#define __PVRDMA_RING_H__
> -
> -#include "standard-headers/linux/types.h"
> -
> -#define PVRDMA_INVALID_IDX     -1      /* Invalid index. */
> -
> -struct pvrdma_ring {
> -       int prod_tail;  /* Producer tail. */
> -       int cons_head;  /* Consumer head. */
> -};
> -
> -struct pvrdma_ring_state {
> -       struct pvrdma_ring tx;  /* Tx ring. */
> -       struct pvrdma_ring rx;  /* Rx ring. */
> -};
> -
> -static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> -{
> -       /* Generates fewer instructions than a less-than. */
> -       return (idx & ~((max_elems << 1) - 1)) == 0;
> -}
> -
> -static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> -{
> -       const unsigned int idx = qatomic_read(var);
> -
> -       if (pvrdma_idx_valid(idx, max_elems))
> -               return idx & (max_elems - 1);
> -       return PVRDMA_INVALID_IDX;
> -}
> -
> -static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
> -{
> -       uint32_t idx = qatomic_read(var) + 1;   /* Increment. */
> -
> -       idx &= (max_elems << 1) - 1;            /* Modulo size, flip gen.
> */
> -       qatomic_set(var, idx);
> -}
> -
> -static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring
> *r,
> -                                             uint32_t max_elems, uint32_t
> *out_tail)
> -{
> -       const uint32_t tail = qatomic_read(&r->prod_tail);
> -       const uint32_t head = qatomic_read(&r->cons_head);
> -
> -       if (pvrdma_idx_valid(tail, max_elems) &&
> -           pvrdma_idx_valid(head, max_elems)) {
> -               *out_tail = tail & (max_elems - 1);
> -               return tail != (head ^ max_elems);
> -       }
> -       return PVRDMA_INVALID_IDX;
> -}
> -
> -static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring
> *r,
> -                                            uint32_t max_elems, uint32_t
> *out_head)
> -{
> -       const uint32_t tail = qatomic_read(&r->prod_tail);
> -       const uint32_t head = qatomic_read(&r->cons_head);
> -
> -       if (pvrdma_idx_valid(tail, max_elems) &&
> -           pvrdma_idx_valid(head, max_elems)) {
> -               *out_head = head & (max_elems - 1);
> -               return tail != head;
> -       }
> -       return PVRDMA_INVALID_IDX;
> -}
> -
> -#endif /* __PVRDMA_RING_H__ */
> diff --git a/scripts/update-linux-headers.sh
> b/scripts/update-linux-headers.sh
> index fa6f2b6272b7..1050e361694f 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -215,8 +215,7 @@ sed  -e '1h;2,$H;$!d;g'  -e 's/[^};]*pvrdma[^(|
> ]*([^)]*);//g' \
>      "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h" > \
>      "$tmp_pvrdma_verbs";
>
> -for i in "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h" \
> -         "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h" \
> +for i in "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h" \
>           "$tmp_pvrdma_verbs"; do \
>      cp_portable "$i" \
>
> "$output/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/"
> --
> 2.26.2
>
>
Thanks!
I guess somewhere in the kernel there is such a clean and generic
implementation of a ring and VM folks could utilize that instead of writing
their own.

Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>

--00000000000030e71405baf7944f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 22 Jan 2021 at 20:00, Corneli=
a Huck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The pvrdma=
 code relies on the pvrdma_ring.h kernel header for some<br>
basic ring buffer handling. The content of that header isn&#39;t very<br>
exciting, but contains some (q)atomic_*() invocations that (a)<br>
cause manual massaging when doing a headers update, and (b) are<br>
an indication that we probably should not be importing that header<br>
at all.<br>
<br>
Let&#39;s reimplement the ring buffer handling directly in the pvrdma<br>
code instead. This arguably also improves readability of the code.<br>
<br>
Importing the header can now be dropped.<br>
<br>
Signed-off-by: Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com" targe=
t=3D"_blank">cohuck@redhat.com</a>&gt;<br>
---<br>
<br>
Compile-tested only, needs both testing and more eyeballs :)<br>
<br>
---<br>
=C2=A0hw/rdma/vmw/pvrdma.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0hw/rdma/vmw/pvrdma_cmd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0hw/rdma/vmw/pvrdma_dev_ring.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 ++++---<br>
=C2=A0hw/rdma/vmw/pvrdma_dev_ring.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0hw/rdma/vmw/pvrdma_main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../infiniband/hw/vmw_pvrdma/pvrdma_ring.h=C2=A0 =C2=A0 | 114 -------=
-----------<br>
=C2=A0scripts/update-linux-headers.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A07 files changed, 38 insertions(+), 144 deletions(-)<br>
=C2=A0delete mode 100644 include/standard-headers/drivers/infiniband/hw/vmw=
_pvrdma/pvrdma_ring.h<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h<br>
index 1d36a76f1e3b..d08965d3e2d5 100644<br>
--- a/hw/rdma/vmw/pvrdma.h<br>
+++ b/hw/rdma/vmw/pvrdma.h<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;../rdma_backend_defs.h&quot;<br>
=C2=A0#include &quot;../rdma_rm_defs.h&quot;<br>
<br>
-#include &quot;standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ri=
ng.h&quot;<br>
=C2=A0#include &quot;standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrd=
ma_dev_api.h&quot;<br>
=C2=A0#include &quot;pvrdma_dev_ring.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -64,10 +63,10 @@ typedef struct DSRInfo {<br>
=C2=A0 =C2=A0 =C2=A0union pvrdma_cmd_req *req;<br>
=C2=A0 =C2=A0 =C2=A0union pvrdma_cmd_resp *rsp;<br>
<br>
-=C2=A0 =C2=A0 struct pvrdma_ring *async_ring_state;<br>
+=C2=A0 =C2=A0 PvrdmaRingState *async_ring_state;<br>
=C2=A0 =C2=A0 =C2=A0PvrdmaRing async;<br>
<br>
-=C2=A0 =C2=A0 struct pvrdma_ring *cq_ring_state;<br>
+=C2=A0 =C2=A0 PvrdmaRingState *cq_ring_state;<br>
=C2=A0 =C2=A0 =C2=A0PvrdmaRing cq;<br>
=C2=A0} DSRInfo;<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c<br>
index 692125ac2681..f59879e2574e 100644<br>
--- a/hw/rdma/vmw/pvrdma_cmd.c<br>
+++ b/hw/rdma/vmw/pvrdma_cmd.c<br>
@@ -262,7 +262,7 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRi=
ng **ring,<br>
=C2=A0 =C2=A0 =C2=A0r =3D g_malloc(sizeof(*r));<br>
=C2=A0 =C2=A0 =C2=A0*ring =3D r;<br>
<br>
-=C2=A0 =C2=A0 r-&gt;ring_state =3D (struct pvrdma_ring *)<br>
+=C2=A0 =C2=A0 r-&gt;ring_state =3D (PvrdmaRingState *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_pci_dma_map(pci_dev, tbl[0], TARGET_=
PAGE_SIZE);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!r-&gt;ring_state) {<br>
@@ -398,7 +398,7 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t=
 pdir_dma,<br>
=C2=A0 =C2=A0 =C2=A0*rings =3D sr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create send ring */<br>
-=C2=A0 =C2=A0 sr-&gt;ring_state =3D (struct pvrdma_ring *)<br>
+=C2=A0 =C2=A0 sr-&gt;ring_state =3D (PvrdmaRingState *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_pci_dma_map(pci_dev, tbl[0], TARGET_=
PAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0if (!sr-&gt;ring_state) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;Failed to map to =
QP ring state&quot;);<br>
@@ -639,7 +639,7 @@ static int create_srq_ring(PCIDevice *pci_dev, PvrdmaRi=
ng **ring,<br>
=C2=A0 =C2=A0 =C2=A0r =3D g_malloc(sizeof(*r));<br>
=C2=A0 =C2=A0 =C2=A0*ring =3D r;<br>
<br>
-=C2=A0 =C2=A0 r-&gt;ring_state =3D (struct pvrdma_ring *)<br>
+=C2=A0 =C2=A0 r-&gt;ring_state =3D (PvrdmaRingState *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_pci_dma_map(pci_dev, t=
bl[0], TARGET_PAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0if (!r-&gt;ring_state) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;Failed to map tp =
SRQ ring state&quot;);<br>
diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c<=
br>
index f0bcde74b06a..074ac59b84db 100644<br>
--- a/hw/rdma/vmw/pvrdma_dev_ring.c<br>
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c<br>
@@ -22,11 +22,10 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
=C2=A0#include &quot;../rdma_utils.h&quot;<br>
-#include &quot;standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ri=
ng.h&quot;<br>
=C2=A0#include &quot;pvrdma_dev_ring.h&quot;<br>
<br>
=C2=A0int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *d=
ev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct pvrdma_ring *ring_state, uint32_t max_elems,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PvrdmaRingState *ring_state, uint32_t max_elems,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t elem_sz, dma_addr_t *tbl, uint32_t npages)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -73,48 +72,54 @@ out:<br>
<br>
=C2=A0void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int e;<br>
-=C2=A0 =C2=A0 unsigned int idx =3D 0, offset;<br>
+=C2=A0 =C2=A0 unsigned int idx, offset;<br>
+=C2=A0 =C2=A0 const uint32_t tail =3D qatomic_read(&amp;ring-&gt;ring_stat=
e-&gt;prod_tail);<br>
+=C2=A0 =C2=A0 const uint32_t head =3D qatomic_read(&amp;ring-&gt;ring_stat=
e-&gt;cons_head);<br>
<br>
-=C2=A0 =C2=A0 e =3D pvrdma_idx_ring_has_data(ring-&gt;ring_state, ring-&gt=
;max_elems, &amp;idx);<br>
-=C2=A0 =C2=A0 if (e &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 if (tail &amp; ~((ring-&gt;max_elems &lt;&lt; 1) - 1) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 head &amp; ~((ring-&gt;max_elems &lt;&lt; 1) -=
 1) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tail =3D=3D head) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_pvrdma_ring_next_elem_read_no_data(=
ring-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 idx =3D head &amp; (ring-&gt;max_elems - 1);<br>
=C2=A0 =C2=A0 =C2=A0offset =3D idx * ring-&gt;elem_sz;<br>
=C2=A0 =C2=A0 =C2=A0return ring-&gt;pages[offset / TARGET_PAGE_SIZE] + (off=
set % TARGET_PAGE_SIZE);<br>
=C2=A0}<br>
<br>
=C2=A0void pvrdma_ring_read_inc(PvrdmaRing *ring)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 pvrdma_idx_ring_inc(&amp;ring-&gt;ring_state-&gt;cons_head, =
ring-&gt;max_elems);<br>
+=C2=A0 =C2=A0 uint32_t idx =3D qatomic_read(&amp;ring-&gt;ring_state-&gt;c=
ons_head);<br>
+<br>
+=C2=A0 =C2=A0 idx =3D (idx + 1) &amp; ((ring-&gt;max_elems &lt;&lt; 1) - 1=
);<br>
+=C2=A0 =C2=A0 qatomic_set(&amp;ring-&gt;ring_state-&gt;cons_head, idx);<br=
>
=C2=A0}<br>
<br>
=C2=A0void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int idx;<br>
-=C2=A0 =C2=A0 unsigned int offset, tail;<br>
+=C2=A0 =C2=A0 unsigned int idx, offset;<br>
+=C2=A0 =C2=A0 const uint32_t tail =3D qatomic_read(&amp;ring-&gt;ring_stat=
e-&gt;prod_tail);<br>
+=C2=A0 =C2=A0 const uint32_t head =3D qatomic_read(&amp;ring-&gt;ring_stat=
e-&gt;cons_head);<br>
<br>
-=C2=A0 =C2=A0 idx =3D pvrdma_idx_ring_has_space(ring-&gt;ring_state, ring-=
&gt;max_elems, &amp;tail);<br>
-=C2=A0 =C2=A0 if (idx &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 if (tail &amp; ~((ring-&gt;max_elems &lt;&lt; 1) - 1) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 head &amp; ~((ring-&gt;max_elems &lt;&lt; 1) -=
 1) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tail =3D=3D (head ^ ring-&gt;max_elems)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;CQ is full&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 idx =3D pvrdma_idx(&amp;ring-&gt;ring_state-&gt;prod_tail, r=
ing-&gt;max_elems);<br>
-=C2=A0 =C2=A0 if (idx &lt; 0 || tail !=3D idx) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report(&quot;Invalid idx %d&quot;, =
idx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
+=C2=A0 =C2=A0 idx =3D tail &amp; (ring-&gt;max_elems - 1);<br>
=C2=A0 =C2=A0 =C2=A0offset =3D idx * ring-&gt;elem_sz;<br>
=C2=A0 =C2=A0 =C2=A0return ring-&gt;pages[offset / TARGET_PAGE_SIZE] + (off=
set % TARGET_PAGE_SIZE);<br>
=C2=A0}<br>
<br>
=C2=A0void pvrdma_ring_write_inc(PvrdmaRing *ring)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 pvrdma_idx_ring_inc(&amp;ring-&gt;ring_state-&gt;prod_tail, =
ring-&gt;max_elems);<br>
+=C2=A0 =C2=A0 uint32_t idx =3D qatomic_read(&amp;ring-&gt;ring_state-&gt;p=
rod_tail);<br>
+<br>
+=C2=A0 =C2=A0 idx =3D (idx + 1) &amp; ((ring-&gt;max_elems &lt;&lt; 1) - 1=
);<br>
+=C2=A0 =C2=A0 qatomic_set(&amp;ring-&gt;ring_state-&gt;prod_tail, idx);<br=
>
=C2=A0}<br>
<br>
=C2=A0void pvrdma_ring_free(PvrdmaRing *ring)<br>
diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h<=
br>
index 5f2a0cf9b9fa..d231588ce004 100644<br>
--- a/hw/rdma/vmw/pvrdma_dev_ring.h<br>
+++ b/hw/rdma/vmw/pvrdma_dev_ring.h<br>
@@ -19,18 +19,23 @@<br>
<br>
=C2=A0#define MAX_RING_NAME_SZ 32<br>
<br>
+typedef struct PvrdmaRingState {<br>
+=C2=A0 =C2=A0 int prod_tail; /* producer tail */<br>
+=C2=A0 =C2=A0 int cons_head; /* consumer head */<br>
+} PvrdmaRingState;<br>
+<br>
=C2=A0typedef struct PvrdmaRing {<br>
=C2=A0 =C2=A0 =C2=A0char name[MAX_RING_NAME_SZ];<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice *dev;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_elems;<br>
=C2=A0 =C2=A0 =C2=A0size_t elem_sz;<br>
-=C2=A0 =C2=A0 struct pvrdma_ring *ring_state; /* used only for unmap */<br=
>
+=C2=A0 =C2=A0 PvrdmaRingState *ring_state; /* used only for unmap */<br>
=C2=A0 =C2=A0 =C2=A0int npages;<br>
=C2=A0 =C2=A0 =C2=A0void **pages;<br>
=C2=A0} PvrdmaRing;<br>
<br>
=C2=A0int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *d=
ev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct pvrdma_ring *ring_state, uint32_t max_elems,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PvrdmaRingState *ring_state, uint32_t max_elems,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t elem_sz, dma_addr_t *tbl, uint32_t npages);<br>
=C2=A0void *pvrdma_ring_next_elem_read(PvrdmaRing *ring);<br>
=C2=A0void pvrdma_ring_read_inc(PvrdmaRing *ring);<br>
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c<br>
index 85935703322f..84ae8024fcfd 100644<br>
--- a/hw/rdma/vmw/pvrdma_main.c<br>
+++ b/hw/rdma/vmw/pvrdma_main.c<br>
@@ -85,7 +85,7 @@ static void free_dev_ring(PCIDevice *pci_dev, PvrdmaRing =
*ring,<br>
=C2=A0 =C2=A0 =C2=A0rdma_pci_dma_unmap(pci_dev, ring_state, TARGET_PAGE_SIZ=
E);<br>
=C2=A0}<br>
<br>
-static int init_dev_ring(PvrdmaRing *ring, struct pvrdma_ring **ring_state=
,<br>
+static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *name, PCIDevice *pci_dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dma_addr_t dir_addr, uint32_t num_pages)<br>
=C2=A0{<br>
@@ -114,7 +114,7 @@ static int init_dev_ring(PvrdmaRing *ring, struct pvrdm=
a_ring **ring_state,<br>
=C2=A0 =C2=A0 =C2=A0/* RX ring is the second */<br>
=C2=A0 =C2=A0 =C2=A0(*ring_state)++;<br>
=C2=A0 =C2=A0 =C2=A0rc =3D pvrdma_ring_init(ring, name, pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (struct pvrdma_ring *)*ring_state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (PvrdmaRingState *)*ring_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(num_pages - 1) * TARGET_PAGE_SIZE /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct pvrdma_cqne),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct pvrdma_cqne),<br>
diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrd=
ma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdm=
a_ring.h<br>
deleted file mode 100644<br>
index 7b4062a1a107..000000000000<br>
--- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring=
.h<br>
+++ /dev/null<br>
@@ -1,114 +0,0 @@<br>
-/*<br>
- * Copyright (c) 2012-2016 VMware, Inc.=C2=A0 All rights reserved.<br>
- *<br>
- * This program is free software; you can redistribute it and/or<br>
- * modify it under the terms of EITHER the GNU General Public License<br>
- * version 2 as published by the Free Software Foundation or the BSD<br>
- * 2-Clause License. This program is distributed in the hope that it<br>
- * will be useful, but WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED<br>
- * WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.<br>
- * See the GNU General Public License version 2 for more details at<br>
- * <a href=3D"http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html" re=
l=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/old-licenses=
/gpl-2.0.en.html</a>.<br>
- *<br>
- * You should have received a copy of the GNU General Public License<br>
- * along with this program available in the file COPYING in the main<br>
- * directory of this source tree.<br>
- *<br>
- * The BSD 2-Clause License<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0Redistribution and use in source and binary forms, w=
ith or<br>
- *=C2=A0 =C2=A0 =C2=A0without modification, are permitted provided that th=
e following<br>
- *=C2=A0 =C2=A0 =C2=A0conditions are met:<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 - Redistributions of source code must retain the ab=
ove<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 copyright notice, this list of conditions an=
d the following<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 disclaimer.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 - Redistributions in binary form must reproduce the=
 above<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 copyright notice, this list of conditions an=
d the following<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 disclaimer in the documentation and/or other=
 materials<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 provided with the distribution.<br>
- *<br>
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS<br>
- * &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT=
 NOT<br>
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS<br>
- * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE<br>
- * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,<br>
- * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES<br>
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR<br>
- * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)<br>
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,<br>
- * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)<br>
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED<br>
- * OF THE POSSIBILITY OF SUCH DAMAGE.<br>
- */<br>
-<br>
-#ifndef __PVRDMA_RING_H__<br>
-#define __PVRDMA_RING_H__<br>
-<br>
-#include &quot;standard-headers/linux/types.h&quot;<br>
-<br>
-#define PVRDMA_INVALID_IDX=C2=A0 =C2=A0 =C2=A0-1=C2=A0 =C2=A0 =C2=A0 /* In=
valid index. */<br>
-<br>
-struct pvrdma_ring {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int prod_tail;=C2=A0 /* Producer tail. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int cons_head;=C2=A0 /* Consumer head. */<br>
-};<br>
-<br>
-struct pvrdma_ring_state {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pvrdma_ring tx;=C2=A0 /* Tx ring. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pvrdma_ring rx;=C2=A0 /* Rx ring. */<br>
-};<br>
-<br>
-static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Generates fewer instructions than a less-tha=
n. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (idx &amp; ~((max_elems &lt;&lt; 1) - 1)=
) =3D=3D 0;<br>
-}<br>
-<br>
-static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned int idx =3D qatomic_read(var);<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pvrdma_idx_valid(idx, max_elems))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return idx &amp; (m=
ax_elems - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return PVRDMA_INVALID_IDX;<br>
-}<br>
-<br>
-static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t idx =3D qatomic_read(var) + 1;=C2=A0 =
=C2=A0/* Increment. */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0idx &amp;=3D (max_elems &lt;&lt; 1) - 1;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Modulo size, flip gen. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_set(var, idx);<br>
-}<br>
-<br>
-static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *=
r,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint32_t max_elems, uint32_t *out_tail)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t tail =3D qatomic_read(&amp;r-&gt=
;prod_tail);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t head =3D qatomic_read(&amp;r-&gt=
;cons_head);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pvrdma_idx_valid(tail, max_elems) &amp;&amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pvrdma_idx_valid(head, max_elems)=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_tail =3D tail =
&amp; (max_elems - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tail !=3D (h=
ead ^ max_elems);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return PVRDMA_INVALID_IDX;<br>
-}<br>
-<br>
-static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t max_elems, uint32_t *out_head)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t tail =3D qatomic_read(&amp;r-&gt=
;prod_tail);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t head =3D qatomic_read(&amp;r-&gt=
;cons_head);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pvrdma_idx_valid(tail, max_elems) &amp;&amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pvrdma_idx_valid(head, max_elems)=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_head =3D head =
&amp; (max_elems - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tail !=3D he=
ad;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return PVRDMA_INVALID_IDX;<br>
-}<br>
-<br>
-#endif /* __PVRDMA_RING_H__ */<br>
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers=
.sh<br>
index fa6f2b6272b7..1050e361694f 100755<br>
--- a/scripts/update-linux-headers.sh<br>
+++ b/scripts/update-linux-headers.sh<br>
@@ -215,8 +215,7 @@ sed=C2=A0 -e &#39;1h;2,$H;$!d;g&#39;=C2=A0 -e &#39;s/[^=
};]*pvrdma[^(| ]*([^)]*);//g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&quot;$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ve=
rbs.h&quot; &gt; \<br>
=C2=A0 =C2=A0 =C2=A0&quot;$tmp_pvrdma_verbs&quot;;<br>
<br>
-for i in &quot;$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h&quot;=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$linux/drivers/infiniband/hw/vmw_p=
vrdma/pvrdma_dev_api.h&quot; \<br>
+for i in &quot;$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h&qu=
ot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$tmp_pvrdma_verbs&quot;; do \<br>
=C2=A0 =C2=A0 =C2=A0cp_portable &quot;$i&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$output/include/standard-headers/d=
rivers/infiniband/hw/vmw_pvrdma/&quot;<br>
-- <br>
2.26.2<br>
<br></blockquote><div><br></div><div>Thanks!</div><div>I guess somewhere in=
 the kernel there is such a clean and generic implementation of a ring and =
VM folks could utilize that instead of writing their own.</div><div><br></d=
iv><div>Tested-by:=C2=A0Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia.ml@gm=
ail.com">yuval.shaia.ml@gmail.com</a>&gt;<br>Reviewed-by: Yuval Shaia &lt;<=
a href=3D"mailto:yuval.shaia.ml@gmail.com">yuval.shaia.ml@gmail.com</a>&gt;=
<br></div><div></div></div></div>

--00000000000030e71405baf7944f--


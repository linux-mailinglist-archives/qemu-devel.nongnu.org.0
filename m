Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E94E3F25
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:08:02 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeEy-00015U-0F
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nWdgk-0002lc-PZ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:32:38 -0400
Received: from [2001:4860:4864:20::31] (port=32931
 helo=mail-oa1-x31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nWdgj-0003eS-5c
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:32:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso1520914fac.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XnJkIyO8ObZphild5QCjLK29dsSDwK+k/eupFa8K1e0=;
 b=gyvjjYZIpMhL3rsdtjtRsfN+QyH5WLv8hZvLPaLqDe4UNrnEi8fmfkcfXjh24rbfUm
 nJSOU+BzEytM/idCZGXVWeVAPzo68aTbG751zXNJCYoRRPMNCLpS0FwOcy5Tbt7nIYpX
 T5Kw+RNPFBAkRmiG68bu/N+4bCz4KwvgQrpHlZAgMgEVdUEvOBMlyByiThJZ/RTUNYKx
 owbVO1VI1/nG5Ka4e7tnOwKtGOvVaTuLUmiy7206bPwR7EQqlOKPXsFOKuwa3bpAP3j0
 85y6VnhffK62MQgGXRXYj4Uay57ccFqwE1Ij8IZBukbhi+SIv/W9XcRn5ENqHD4F/OH7
 Y6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XnJkIyO8ObZphild5QCjLK29dsSDwK+k/eupFa8K1e0=;
 b=K7zP1IhwB2gOhrQQm7Lvy9J6kTAz6zOHfqdi7mnlYd2TbY/bb4qU1MA1XpgzkKNDSh
 6Nq+7RM+QqFjs+noiJVaEVLTM67Pk9AVDECl2pEIdF2DPlbqPQerRt231QWvidrwe/v6
 C6Az7yO69lgc2As5eaH6bsZUCTwoLjEDNVJSYPsRagPYZcDAvczU30TyWcRLyuM6aZ9q
 VOnxBTfzj5rUXwl0TRJbhSKfBZWQ3EUWlsFuztcROzcpaEtD0h9VklJGNnJDHqEHs1Nf
 1iQCMNtss0F0PiAHHnugAwxgnRcTKtnaeGwtQdA0LXDNd4YapJaoggTq0fk8QAw2lRWv
 bmCA==
X-Gm-Message-State: AOAM5334U4V1qO6BQFN/KWjL6J+tAWiYORaOofigyGkAQYS/elc5ypMw
 6OweMt+iH3tZCPLKlt5qOagC4A9WZCJs7U4UjIxhY3olYjUQ6w==
X-Google-Smtp-Source: ABdhPJwgQhjM8Jl2szymkzHbKso9gzUn7x+cS0TBBuAqgWg6DAUx70uXeZ5RfGak5oK0a8Rd74xwfpUlNHKntrJcIz0=
X-Received: by 2002:a05:6870:e316:b0:dd:cfdf:5d51 with SMTP id
 z22-20020a056870e31600b000ddcfdf5d51mr1463291oad.202.1647952033614; Tue, 22
 Mar 2022 05:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220321131143.31210-1-yuval.shaia.ml@gmail.com>
In-Reply-To: <20220321131143.31210-1-yuval.shaia.ml@gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 22 Mar 2022 13:27:02 +0100
Message-ID: <CAC_L=vXa2O_YVACvwPPkNyy7agQ5aJnBHV70MSN3XZfD+zremw@mail.gmail.com>
Subject: Re: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
To: Yuval Shaia <yuval.shaia.ml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::31
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wxhusst@gmail.com, Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yuval

On Mon, Mar 21, 2022 at 2:11 PM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>
> Guest driver might execute HW commands when shared buffers are not yet
> allocated.
> This might happen on purpose (malicious guest) or because some other
> guest/host address mapping.
> We need to protect againts such case.
>
> Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
>  hw/rdma/vmw/pvrdma_cmd.c  | 6 ++++++
>  hw/rdma/vmw/pvrdma_main.c | 9 +++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index da7ddfa548..89db963c46 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>
>      dsr_info = &dev->dsr_info;
>
> +    if (!dsr_info->dsr) {
> +            /* Buggy or malicious guest driver */
> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
> +            goto out;
> +    }
> +
>      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>                        sizeof(struct cmd_handler)) {
>          rdma_error_report("Unsupported command");
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 91206dbb8e..aae382af59 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -159,13 +159,13 @@ static void free_dsr(PVRDMADev *dev)
>      free_dev_ring(pci_dev, &dev->dsr_info.cq, dev->dsr_info.cq_ring_state);
>
>      rdma_pci_dma_unmap(pci_dev, dev->dsr_info.req,
> -                         sizeof(union pvrdma_cmd_req));
> +                       sizeof(union pvrdma_cmd_req));
>
>      rdma_pci_dma_unmap(pci_dev, dev->dsr_info.rsp,
> -                         sizeof(union pvrdma_cmd_resp));
> +                       sizeof(union pvrdma_cmd_resp));
>
>      rdma_pci_dma_unmap(pci_dev, dev->dsr_info.dsr,
> -                         sizeof(struct pvrdma_device_shared_region));
> +                       sizeof(struct pvrdma_device_shared_region));
>

Nit: the above changes are not related to the patch, maybe drop them?

Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

>      dev->dsr_info.dsr = NULL;
>  }
> @@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
>  {
>      struct pvrdma_device_shared_region *dsr;
>
> -    if (dev->dsr_info.dsr == NULL) {
> +    if (!dev->dsr_info.dsr) {
> +        /* Buggy or malicious guest driver */
>          rdma_error_report("Can't initialized DSR");
>          return;
>      }
> --
> 2.20.1
>


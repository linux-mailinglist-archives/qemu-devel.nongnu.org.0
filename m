Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425A4F29C1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:34:31 +0200 (CEST)
Received: from localhost ([::1]:46694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgW5-0007rs-Hd
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nbgO5-0005KD-Jv; Tue, 05 Apr 2022 06:26:16 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nbgO3-0006OR-6Y; Tue, 05 Apr 2022 06:26:12 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-d39f741ba0so13846229fac.13; 
 Tue, 05 Apr 2022 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BiuiDkKUVn9H9mfKCO/O1Z0Rp44UWtITYhttFqxuDs=;
 b=TQXq8lrF8mFXNKp4sLIfF++3W3NGti6jzBxZUaeZz/LJZmuOWQftiIF9Nro5gAmy7r
 cCKuPMQdg+83iA6xHXkay6t2QyhHBwyntnVzFipekZB1rxODKVuhb870/GaUDX5xKuDH
 leVTh1GBNmaEHKN6+CMZ+1fr4Qfrcg9B4+zD6j9xVj6ygsKLDE9I8QkMCUpva7giuioo
 Bb0GDb5+1mW5oPF7wnDF29ErFk2KG0LmBZdBIzbu9UdVbrXeOliThV5IJya36au7Xgcw
 w9mrx4rFl0MRgdA8gMHpKjCP+7/0DMB/o9tP1945X2kdRRHXlit7swlhZ6xZMB8Z9piD
 KoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BiuiDkKUVn9H9mfKCO/O1Z0Rp44UWtITYhttFqxuDs=;
 b=mCizBkgVSBx+YopJYqtw1tgf/lxmt833kCewh9KWxT7l79gX5xVZ0UBkyMam0PShLU
 WBSajdhf8qUsypNCf6I5zEtqBYejyB2gh8YNJKKmZy6VKL3d4HAP/2AqTx/2Z3qvImLI
 QJHYotwzNEEvvTDI/zeAAe/wVh15h/S7leH2jVnnekdRwSdL3fKd5mzVS0K5MvakgQfO
 51BFNb0S89LY3gGgPDoanvUdMwpO94DoCmDqOyN1Mh13UEfgAuDPswAdNdn5ogFavbpv
 QmQ7EbQJ/BHcwLEWeQQyWk8O4W58+0uDtIIPZxDb9QkwQpBeCklMq690yh2oJBEeZ8vg
 rQXQ==
X-Gm-Message-State: AOAM5300In3CNguqD8/NrfeYic7NfejHY2G2WXeEBSH4D1bHpP+aNOeh
 RXymCZVUaCJxBaDauCZlXqmALTWcszPTo5Z9IaQ=
X-Google-Smtp-Source: ABdhPJwpu522NAGfeFccylGhB1/9MezXZMEkvqj8fz9fmWxh/Nc5skEgwQsT2QZefuvEjLKsmqiXMwy0PMbQ0PcyzoI=
X-Received: by 2002:a05:6871:8a3:b0:e1:e54d:5f55 with SMTP id
 r35-20020a05687108a300b000e1e54d5f55mr1143498oaq.202.1649154361308; Tue, 05
 Apr 2022 03:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220403095837.2378-1-yuval.shaia.ml@gmail.com>
In-Reply-To: <20220403095837.2378-1-yuval.shaia.ml@gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 5 Apr 2022 12:25:50 +0200
Message-ID: <CAC_L=vVn3zDbPfwzfKR3t=UCavSyC-p4dtU9Ka3xT9evOt1d+g@mail.gmail.com>
Subject: Re: [PATCH] hw/pvrdma: Some cosmetic fixes
To: Yuval Shaia <yuval.shaia.ml@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 3, 2022 at 12:00 PM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
>  hw/rdma/vmw/pvrdma_main.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
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

cc: QEMU Trivial <qemu-trivial@nongnu.org>

Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel


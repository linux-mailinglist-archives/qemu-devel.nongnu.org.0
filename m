Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A9321654
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:21:29 +0100 (CET)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEADP-0005RK-GP
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lE9w1-0003Wa-GE; Mon, 22 Feb 2021 07:03:29 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lE9vz-00039H-AH; Mon, 22 Feb 2021 07:03:29 -0500
Received: by mail-pf1-x434.google.com with SMTP id 201so3343045pfw.5;
 Mon, 22 Feb 2021 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oeNUzJjuBQnFyBBesk9uO1ChdWhdDwKv0xwEbjQUDB0=;
 b=sXX0YqZzSNcvQJQUYZxuK6tnJQFP2XbFXOQOa1VkikyfQO9eQuPhdBjCv8ZQ2z8AI2
 noVjKW6Dw1Lz2qum0VG5t18+GeUxNQkSalhGO2IITqsXTn2UyV77pKlM/nRuE9N4wQ3F
 2gwyX5bO81pKK2cZpTCVh+gJHOrcLf+jOJcpuWuMEPFvGNx0hg4bXMiemWhadnQ8+98x
 uf9tfyy+tJOYLfHJpIt3nA88lncUQ2gbOtgSfps0mJGtqhcq8saXQPhV02BuqiG30nn2
 Bgfk1mpQH3ZgzQO7WoLS2oOy/5dYtLngciD5zGb1nvR5PaVrZGXnydt76cktEpNLPBk/
 SgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oeNUzJjuBQnFyBBesk9uO1ChdWhdDwKv0xwEbjQUDB0=;
 b=n11py7+mxN2yePwX5HfRDxsYyX5fzbtdwuTBTPCGCd1GdRL0nJDPbsAsBtRP0YlvUE
 unmaSDYKmjQrmufV0fAgX7Z8U4v1gf0r0szb27mja+FVq9BF0vWNNy6BTv9fp9ytuy/I
 M0oBGjraz/UJhRwuSF3M7X591wCbK5vbg4/HSN6Z2UFJVnyiJYWMOk/vLS25UyZT9tlD
 Yd/9F5EGXpRfPYMLTdNuB/UhZ9FMQdySwab8ScoVlGg0vPTYPJKnT8H+faQge6IMpe8P
 sqDFf26PckI5FijekRmVCDbDOkMsgoZprd/1jcrYWcOWbokBXk936xWnZqS9aDnVhQKZ
 5pnA==
X-Gm-Message-State: AOAM531t7b5J9oqCPChDcX66XccreUf/Ntvw3rSO0LZchmcDPrkHr8zz
 2ZwOP7eA3NaxXby81vuxTnA=
X-Google-Smtp-Source: ABdhPJzLTq1Tf1VF877hlD6dad0LxVrrEkQiw63mI2srWRzQRJRFPEJFneQdJDHr3+XYgZN7Jny36Q==
X-Received: by 2002:a63:5525:: with SMTP id j37mr19781441pgb.191.1613995405320; 
 Mon, 22 Feb 2021 04:03:25 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id q20sm17889997pgh.79.2021.02.22.04.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:03:24 -0800 (PST)
Date: Mon, 22 Feb 2021 21:03:22 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/3] hw/block/nvme: fix potential compilation error
Message-ID: <20210222120322.GC2856@localhost.localdomain>
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222070615.9177-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-22 08:06:14, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> assert may be compiled to a noop and we could end up returning an
> uninitialized status.
> 
> Fix this by always returning Internal Device Error as a fallback.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index ddc83f7f7a19..897b9ff0db91 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1232,7 +1232,7 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
>  
>  static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
>  {
> -    uint16_t status;
> +    uint64_t zslba = zone->d.zslba;
>  
>      switch (nvme_get_zone_state(zone)) {
>      case NVME_ZONE_STATE_EMPTY:
> @@ -1241,16 +1241,15 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
>      case NVME_ZONE_STATE_FULL:
>      case NVME_ZONE_STATE_CLOSED:
>      case NVME_ZONE_STATE_READ_ONLY:
> -        status = NVME_SUCCESS;
> -        break;
> +        return NVME_SUCCESS;
>      case NVME_ZONE_STATE_OFFLINE:
> -        status = NVME_ZONE_OFFLINE;
> -        break;
> +        trace_pci_nvme_err_zone_is_offline(zslba);

This also is a tiny addition to the potential error fix.  Anyway, it can
be shorten to: (if zslba is used in a place only)

	trace_pci_nvme_err_zone_is_offline(zone->d.zslba);

> +        return NVME_ZONE_OFFLINE;
>      default:
>          assert(false);
>      }
>  
> -    return status;
> +    return NVME_INTERNAL_DEV_ERROR;
>  }
>  
>  static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
> -- 
> 2.30.1
> 
> 


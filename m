Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC03646C8D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3DwA-0005PC-Ja; Thu, 08 Dec 2022 05:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dvm-0005KS-4K
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:15:11 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dvf-0000uj-Ng
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:15:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 125-20020a1c0283000000b003d1e906ca23so520277wmc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eVc4oitANzuJshTuFsoNBB7umKuiWorBB4aXCWmI9UU=;
 b=gIDeg4knTydtc27KRte6IFC/Z6mQ+DG9zc/qEzWWfbZXvaK6hwmOJySnuDQM+EXLBr
 SU9h0SgMndrQb41ZHqDEXKA0CmACW6zQ/x4/5XIaa1WV/Vuj8m8wRcrEoDnVBObTSPNS
 YjAjcHsHaDlemMkrvBoUnhzrJINzMv+jU9YecPAYnjAMZtcvfhBhZz3pf4m4uJE3B1oZ
 BfGr2yBT6jdiQbiarDPu9t3+lCUuQ4SNr8XXcamBi3VXJdGiUPufuTiRQFZSUjRnBeud
 ab9/PjRYSM7HMFljHIKX7P79LASpe4zpQMfcdxgGcNddfHgOIQBrAzITbwybC2xUX56A
 p5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVc4oitANzuJshTuFsoNBB7umKuiWorBB4aXCWmI9UU=;
 b=rj/+OAdPtVzPkrh17WJZNAmMb7v3kunArMVfxvsL4ay5LEn1EMJf+oohJgq5jexzu+
 tuXh+p5+BJZQxIuva6giKvlS9XqHTUif5kNX5WlJngsFvWzGvQ2QyEqG+ofm+pNZ2tT/
 fBN/XVNByTjSutEYpagBYoqW+Uzat64pAZ9S4ze8c4qwn46RBKYtJYt8C2X9+JfpzsXi
 IkU6dXKwTaeWLqRsjsC5G3TE3EAq/Y35CyDGqwiTfq7HEbGyLYBHo+WnrchUeOChL9R9
 N58Rh3CgEaL3VFrNqCgKJPYnVbYmKuOosOwJNjNYcO2kv0L8MZIykiQBeqK6Vvfxx2kX
 vgZA==
X-Gm-Message-State: ANoB5pkBVraDuw8IcAERM0sPXZIftn3IastDOIu7tAY0MBhiKkRysswk
 i3+GTJ/IchjHXrZvNhitLOsx1A==
X-Google-Smtp-Source: AA0mqf58ifvxNGiyb0ez3a9vloI9fq3IwY1L67nSf09G/+OxW0g3vlS60fcZc9oiGxPmJXEEFyWbPg==
X-Received: by 2002:a05:600c:5012:b0:3cf:486f:2700 with SMTP id
 n18-20020a05600c501200b003cf486f2700mr60303415wmr.83.1670494497653; 
 Thu, 08 Dec 2022 02:14:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m28-20020a056000025c00b00242257f2672sm22131038wrz.77.2022.12.08.02.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:14:57 -0800 (PST)
Message-ID: <10df1dba-f955-f3a7-7f53-135db63238b0@linaro.org>
Date: Thu, 8 Dec 2022 11:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/1] hw/nvme: fix missing cq eventidx update
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>
References: <20221208082955.51732-1-its@irrelevant.dk>
 <20221208082955.51732-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208082955.51732-2-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/12/22 09:29, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to reading the shadow doorbell cq head, we have to update the
> eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
> write. This happens on riscv64, as reported by Guenter.
> 
> Adding the missing update to the cq eventidx fixes the issue.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index e54276dc1dc7..1192919b4869 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1331,6 +1331,13 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
>       }
>   }
>   
> +static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
> +{
> +    pci_dma_write(&cq->ctrl->parent_obj, cq->ei_addr, &cq->head,

'parent_obj' is a private field. Better to use the QOM accessor:

        pci_dma_write(PCI_DEVICE(&cq->ctrl), cq->ei_addr, &cq->head,

> +                  sizeof(cq->head));
> +    trace_pci_nvme_eventidx_cq(cq->cqid, cq->head);

Surprisingly the trace event format was already present in Jinhao respin...
https://lore.kernel.org/all/YqsIh+OUcWnHU3zp@apples/T/

Could we move the event before the call?

> +}
> +
>   static void nvme_update_cq_head(NvmeCQueue *cq)
>   {
>       pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
> @@ -1351,6 +1358,7 @@ static void nvme_post_cqes(void *opaque)
>           hwaddr addr;
>   
>           if (n->dbbuf_enabled) {
> +            nvme_update_cq_eventidx(cq);
>               nvme_update_cq_head(cq);
>           }
>   



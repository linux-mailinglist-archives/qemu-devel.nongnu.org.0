Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526B623F16
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Fv-0003nh-MY; Thu, 10 Nov 2022 04:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4Ft-0003nK-2F
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:53:53 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4Fq-0004pW-GV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:53:51 -0500
Received: by mail-wr1-x429.google.com with SMTP id g12so1434592wrs.10
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRbqk1kXDPO//q/XNHuQaq4+pZmCl31ECIpw7PO202A=;
 b=tbRoEvlBNKhUAdS2WqhycLB4vVVifiDcU7fBdJ4eVR/qu4FZ6U0XW90WzLjkiFFakT
 efOD/V7+l1BKEJyZBEvUpO3TVQq0w/uC5Cwkyo0IIzAKOOlHs05vlJZwd2iztVgWZxWu
 n+rx3TTCpJZbU27nGrvrNwCTJn4TJ0yc3wWprKXtND2J3QXrGHDocGwdOFLOEdf3JFHJ
 mN4zfTellLZSrucjDuGcKawm8IrlEMNbULANdLHy701WfW7i/Q4G3+hlW10C6fb+XZds
 LAz/rfFRs3GYOw6jZYYmFQhubX24Ac6frMw6KJm3fgAWKpimJJlwQqKdBNKahILKE/PU
 LAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRbqk1kXDPO//q/XNHuQaq4+pZmCl31ECIpw7PO202A=;
 b=PfK7u7XeZbFb+CfbR1dwKh2g2F9hE1prfmyPU8PD8CqUBVmhTPGiwppim5mMrpJpu6
 TpRg6x1SaFTYmyKMR0rKiuHv7x3rHxI8yPZeImBvbNgx581bYB1MU51/BPHV6OoskdV9
 1sDtElEZMCvYckAv/RuzpilH0OJ4x8hIj1opqNcDmr9l2Z2PFx7uV/629hCdKzlfRi/F
 g7Ml8qaVQZTj1PuO3H+RBzF/abPptLA+tJsfuWRND0pX70Msi2tUMhJF9JD91Hhu90Jd
 CHZB3oe4dgGAcYmM/DftTN4a6cyBk+9nC9hCHzFKhpw8RIP5c6x5TMiF4Nh3OZLRjJGM
 zFyQ==
X-Gm-Message-State: ACrzQf1/+5aJkTGNiIY9EuJBBshPB+wRlK3Xl35yuDOp3kp/plvbmRkC
 kK9Ru82FJQr0sgbLv5n9YRoBRw==
X-Google-Smtp-Source: AMsMyM55HadIN2timXdooQqMqK6Y1w3k6krdJ/qI0eUpUGbGrZXXcnETsrAjnHdanUcO0JAuzmxtlQ==
X-Received: by 2002:adf:a2dc:0:b0:238:3e97:7901 with SMTP id
 t28-20020adfa2dc000000b002383e977901mr24740226wra.323.1668074028873; 
 Thu, 10 Nov 2022 01:53:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfedc2000000b00228daaa84aesm15408377wro.25.2022.11.10.01.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:53:48 -0800 (PST)
Message-ID: <b408f286-2262-480e-01d7-230240bc743c@linaro.org>
Date: Thu, 10 Nov 2022 10:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-7.2 v2 2/6] hw/nvme: fix cancellation of format
 operations
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
References: <20221110070523.36290-1-its@irrelevant.dk>
 <20221110070523.36290-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110070523.36290-3-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/22 08:05, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Cancelling a format operation neglects to set iocb->ret as well as
> clearing the iocb->aiocb after cancelling the underlying aiocb.
> 
> Fix this.
> 
> Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow cancellation")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 918af03d32be..819c02067191 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5762,8 +5762,11 @@ static void nvme_format_cancel(BlockAIOCB *aiocb)
>   {
>       NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
>   
> +    iocb->ret = -ECANCELED;
> +
>       if (iocb->aiocb) {
>           blk_aio_cancel_async(iocb->aiocb);
> +        iocb->aiocb = NULL;
>       }
>   }
>   

What about nvme_flush_cancel()?


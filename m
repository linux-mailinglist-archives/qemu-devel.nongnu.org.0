Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016AA697EEB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJD7-0004ze-Vz; Wed, 15 Feb 2023 09:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJD1-0004wR-0d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:56:36 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJCz-0006x8-7B
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:56:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id he5so5715910wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7SdQd2wl8hE8/uymi2Du6hdmHSLiGNsr7c3Scusp39g=;
 b=ZUuYJVOzPX2NOqMtg1tptN70M4D2fO9TgBU3bwTUNyTGFECfZvyEnI2fGfzp+zXwIV
 OGSXqQ2Q5MYyF8jhnEmLK9K4D6iULy22Y7wMRjoI6M5zMIQaLE5AzYVX1wT66jewrRLo
 eqb8AVD2PGsfdYDmblJ7xxM+CcYPG09NgyWytneV6mbRIunu9ciEcVCZfpmnLUzMzfok
 YOs5Vt8PCNiGFP6OMZG4NrZiWH5pm4oSa2SoD2Ju4ePKRi/7cCC3u2mt5e/fV1MMnFN1
 bdiCHlCU6cMySjmaMi91BIWZIcRdiROdHbJwP6rKI2kPVbCNqjJhPWvorlVx9iwHK+lV
 uzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7SdQd2wl8hE8/uymi2Du6hdmHSLiGNsr7c3Scusp39g=;
 b=LNg/WbGAxv6649UPj7dgyCglkfXeZ6dT5otFtbRM5R9JlGBLqMsnqcg7IwtbgYlF/1
 bImEVVUt35tFDgJw/CYxJtgUphJb13QHoOPKWzEnkLiKLfjIuui0ntly2YDgG1smMgZY
 4N586Fbslnbr2v0CaGiex8qbVG26bEp5xzhoSRTM7W46+jjL6Th3Vp4XuQa3JwfemPY4
 DXnF127lbpxYA+E4QtW4jHOZE6d8Ppn2/VcZT70WWgBGf24Q6NOAU6dHtw+ax86e91AR
 QwXKTgTdjBX2qioeLxyHEW7dRFxrCOy6QT4ARQs7ccw2X7Rq99sYNIWZ79Z8qAq4ixZH
 2t/w==
X-Gm-Message-State: AO0yUKUg/mABuJKVQ+ov4MxIet9qmPjo9ZSnAv3fGBM04jK7lCsPBStb
 +V6zw5f4kBzwnGiUFYwvSoXPnQ==
X-Google-Smtp-Source: AK7set8lQ24Oankj9/cpC5qWEyCMmqDSWrT6U2xGL5aM5sDwWzkld7zBKJLwDcLPJTDF062Suu9VNQ==
X-Received: by 2002:a05:600c:a293:b0:3df:d817:df98 with SMTP id
 hu19-20020a05600ca29300b003dfd817df98mr2100878wmb.10.1676472991572; 
 Wed, 15 Feb 2023 06:56:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm2740079wmq.2.2023.02.15.06.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 06:56:31 -0800 (PST)
Message-ID: <572fcb76-b2f7-20ca-0701-e22dd4e4cb59@linaro.org>
Date: Wed, 15 Feb 2023 15:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PULL 08/10] hw/net/can/xlnx-zynqmp-can: fix assertion failures
 in transfer_fifo()
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Cc: Qiang Liu <cyruscyliu@gmail.com>
References: <20230214061140.36696-1-jasowang@redhat.com>
 <20230214061140.36696-9-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214061140.36696-9-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Adding CAN bus maintainers.

On 14/2/23 07:11, Jason Wang wrote:
> From: Qiang Liu <cyruscyliu@gmail.com>
> 
> Check fifos before poping data from and pushing data into it.
> 
> Fixes: 98e5d7a2b726 ("hw/net/can: Introduce Xilinx ZynqMP CAN controller")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1425
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1427
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/net/can/xlnx-zynqmp-can.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index e93e6c5..55d3221 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -451,6 +451,12 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
>       }
>   
>       while (!fifo32_is_empty(fifo)) {
> +        if (fifo32_num_used(fifo) < (4 * CAN_FRAME_SIZE)) {
> +            g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
> +                          " enough for transfer.\n", path);
> +            break;

This change looks dubious... Shouldn't this rejected earlier?
Shouldn't we assert(fifo32_num_used(fifo)) >= CAN_FRAME_SIZE here?
Is this really how this works on the hardware?

>           for (i = 0; i < CAN_FRAME_SIZE; i++) {
>               data[i] = fifo32_pop(fifo);
>           }


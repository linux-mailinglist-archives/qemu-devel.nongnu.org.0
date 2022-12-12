Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60517649F2A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iJi-00052B-B7; Mon, 12 Dec 2022 07:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4iJe-0004x6-S0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:53:54 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4iJc-0006nn-Vn
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:53:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5022959wme.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJy5oc3eSNwzHEMRNMfYpjCYOXM/ippUCMnUyb5Qagk=;
 b=Et7K7VDLCn50wy353fFQaeZwK7LubDf2BodTf/5/CScqIxzhyViF3OEgzClOkpIty6
 hAzf8Py6vS0akkYZueSssKuTMYtIbNIBnXVeLcTsWptlSgbrRRflMUUCwgXmQFQ6agzu
 yl2lvVHZbiEGSNOcwvGtmS37Iou0UaRD1uhdJH6MtG4pIhEKFQCf0CDt4pgesMGan9/q
 MwfQKngU0ngKmZ9MbKAUInh1dWa40DZL9tHl4r4YNPrQ8N7XXTpqu6/18fjBlaH/oaL8
 BzE3mUmriFSUqzC1Ul9HnyuGhIpaV9Yhqg9BEUxb9lI4jk5r0mhLFvK/RqAQ6xsVjwo0
 aPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJy5oc3eSNwzHEMRNMfYpjCYOXM/ippUCMnUyb5Qagk=;
 b=zS4rrXjJS8HM912q1EtGBrr6qilrMo2/ibp13tns7jYKsP8TjYv/5DhOA7sIXG37Wk
 lfLdFs+pr36Z4n9yNavR/XdUDS+rKZVUuzp/jhRwFCIjZ4NvTYfPcAxiVmLugbRT2P5c
 bOswVeEy8JbfjuH0Rugu0+F/fNJliR3Bd00RbHiJOuKREOdMa+uo2T0KgybWBFm4TgSH
 BA16ywm8wNUeYVQ0nihEpps82FCeB132Ot8dgIRGLdkdlfRUdMeZ36BFCzhrtKotxOJB
 0zfMQ9asnIFUgPkpX3Qfe8QqxRXUcl6j2Nn7TSKYt736hcbrlb8oJ/B7axOdPdq5xGY8
 3leg==
X-Gm-Message-State: ANoB5pmDcouzpoNoGxgMyPDGvf+UgLTNT6GQHuvdTfDVxIWpGfXNedQ+
 BvMpeMdt0lRWPtAAzvuhIEGFGQ==
X-Google-Smtp-Source: AA0mqf4Qxbdn1TQY28tjGEtx4RwoBHRHr+eleHtW+D21OKJTUHmLRDJsW2qBR9Nd53np75qrYOdDpQ==
X-Received: by 2002:a1c:5404:0:b0:3d0:a531:5413 with SMTP id
 i4-20020a1c5404000000b003d0a5315413mr11954013wmb.34.1670849631226; 
 Mon, 12 Dec 2022 04:53:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003cfaae07f68sm9936386wms.17.2022.12.12.04.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 04:53:50 -0800 (PST)
Message-ID: <c4a89c2d-377f-e45b-d6ca-242a1850ee15@linaro.org>
Date: Mon, 12 Dec 2022 13:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 3/4] hw/nvme: fix missing endian conversions for
 doorbell buffers
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org
References: <20221212114409.34972-1-its@irrelevant.dk>
 <20221212114409.34972-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212114409.34972-4-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/12/22 12:44, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The eventidx and doorbell value are not handling endianness correctly.
> Fix this.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



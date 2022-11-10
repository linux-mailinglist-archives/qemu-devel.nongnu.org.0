Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1158623F37
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4L8-0007EH-Mw; Thu, 10 Nov 2022 04:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4Kz-0007DO-7M
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:59:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4Kw-0000CI-7x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:59:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v7so808720wmn.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ahOKAzxQXBs9nqzV6BvBlbiCPyW4pQFj3tuvrRWVRMw=;
 b=MibnmqJ33SjIBywKN+F1u7EtBGQYhM4OsdCxwna8LHcYYShJoRGWjLwYVX9f36SJ7K
 5rt82Z1zJFKQ7JuwZZ8MwaCTttFvjjZPR2jJsgdb3C9JT/QTb1RStVxO4NAT4p3K9JtE
 UDW+7LWtaYn0xwI0bW9BySvznidMcX3oA8Gwyj5St0DgCV5HRGzxxWSGq9r6fHTN1FBn
 t8+h4KFULSF43mJw1iohFjJI5+JqA1ikJD0MSYePzqQb+/I5210cs+uvlqeSe5Y+xDqY
 FBDFqvAFJqWnrzFiVpY9/9GhGqAv6HVvYYez6cwRHYGSmdnlQPY2U6Ax3UWiNybiy5zN
 HOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ahOKAzxQXBs9nqzV6BvBlbiCPyW4pQFj3tuvrRWVRMw=;
 b=c3lSbKNxGf1n4WSvcKEn/GwylWELn8h1PAIu/rTUNUgTiDfytLiZ8Xxe/eYL+Xo1lP
 o4awX3BhkZ2Onpl//lYweMoVIU5Wr1x8s4xRzm3QaWy8ikER6AeoRggWtVJrnOO/Hhwa
 KeR42x7ahN/VrrNHmVyt22jTwFVADMu100CZf1NmbQuphajJkVEyNWtIH6j87R2J7tpu
 30boRsyyTu7t95DPTPGRp1Oo3PNiIoQjwA7tq9Qh9YfQAT7vikrGEMUusMr3iCdFNDXb
 9l9u4l7RbPxhefKFvD8YI7n70H5mtNzrFEOS1oJozpQjL/RgwCQItjTlxV4lSjDB7u9T
 wFVw==
X-Gm-Message-State: ANoB5pnL4oonChMG1OrPQLoZ8wGUG5mjCfOnfsP7KbqTLSf0sPcUxK1d
 XZXQc623PIKd4hQgoEpLKrwKP2ZevrT/Xg==
X-Google-Smtp-Source: AA0mqf7hkJHqj4mzaSDOjaUMI6FEMSsfH5XgG+b5OW1q/uE5ULgCL3/9lphGOsl6tnzYWpWM7C7Rhg==
X-Received: by 2002:a05:600c:3650:b0:3cf:b545:596 with SMTP id
 y16-20020a05600c365000b003cfb5450596mr415368wmq.49.1668074344452; 
 Thu, 10 Nov 2022 01:59:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c021600b003b3307fb98fsm4364904wmi.24.2022.11.10.01.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:59:04 -0800 (PST)
Message-ID: <61b53454-25eb-862e-dc10-d8528b26332e@linaro.org>
Date: Thu, 10 Nov 2022 10:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] hw/nvme: fix incorrect use of errp/local_err
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
References: <20221110062335.18401-1-its@irrelevant.dk>
 <20221110062335.18401-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110062335.18401-2-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 10/11/22 07:23, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Make nvme_check_constraints() return a bool and fix an invalid error
> propagation where the actual error is thrown away in favor of an unused
> local Error value.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
>   1 file changed, 23 insertions(+), 25 deletions(-)

> @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>                 &pci_dev->qdev, n->parent_obj.qdev.id);
>   
>       if (nvme_init_subsys(n, errp)) {

Similarly nvme_init_subsys() could return a boolean.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> -        error_propagate(errp, local_err);
>           return;
>       }
>       nvme_init_state(n);



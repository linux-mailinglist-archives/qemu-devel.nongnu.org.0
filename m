Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC56A723F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQVn-0001ZV-R5; Wed, 01 Mar 2023 12:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQVl-0001ZD-UR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:45:05 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQVj-0007cH-7T
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:45:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id az36so9145751wmb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677692700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bzBn+hBJ3rtUcWEeK3vX5NNyXIZ1owxoMMx2e5CQIBA=;
 b=ojvRsWsPuQDFimAx+ThmNB+4RMI/+TLEyG+jjMWCDtro8WjRZvnn25LTKRcHULLxvo
 d/wtaoQ+LgA58hWWw76rfcifN/QbQro5EsVsHu2kDzkxHxFvNW9kK6F7iFHii+nVba4v
 gfN9l9O4dzc9SVWMjFKgChstQb7mB9bpzZkAZhf6oDTw1HYh/i/gE120FOKU977nK1K2
 a/zj2kFn18aupuoZtR6Iyp4XJVTR7RlLS76XJoFxLFk1S9n5dVA+UbLxHZr61++rLqGt
 B3O5TtQ9g+g6TzdzioNvFnO1Z/iBBs/ITwihCWkRTC1v8vfjFXsxBYhUjDzD22mvgAdA
 nDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677692700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bzBn+hBJ3rtUcWEeK3vX5NNyXIZ1owxoMMx2e5CQIBA=;
 b=nZo677iYXHNIJQNpqWpROMYSdf9jt8KLE10cDL3NuoZJbDM1Fm8as6lav4oVwoiYQH
 RIAJrOih/CvqLS7uMhEje3vRRZEsjlvUAlyble0fbgAGKbIp1E2LR1lDPxp4XJtyQvqM
 NQEfHNsF4QZRYB/ZJz+YcE20uP+Wa/52r+Wdv3gcVNV0mI8bv+UoCyqU9mXFNMlQC/ZK
 DZMCQvxtIQDRYloe1l6uPxD/PjV8ADuwZn7e9AjLhQ16wX7GIn5KtqB09GGv4c0eBm+a
 fTlarJSn3z3+PWt4F+rAeQQNVtiaHZuhWVOWzNsOQLSqBhvW+JcwkisjLz6UIxaZyhB3
 ocZQ==
X-Gm-Message-State: AO0yUKWTxKFxScvRi8/q3Wk7rmKIPOKo7YJdSlqhW3Q11QYSzsFPug5T
 ntlE1VIlMqJ1/jlG5AblhsVc3A==
X-Google-Smtp-Source: AK7set/tL1uaEb6VFfmu98tNz7tEvmhMfFeiTsGwvA2Wc/OKyU0WuQMggYVEm3kpdWcYOlTDGWKBkQ==
X-Received: by 2002:a05:600c:3acb:b0:3eb:38e6:f64f with SMTP id
 d11-20020a05600c3acb00b003eb38e6f64fmr5469288wms.8.1677692700459; 
 Wed, 01 Mar 2023 09:45:00 -0800 (PST)
Received: from [192.168.45.175] (41.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.41]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcde8000000b003dc521f336esm258930wmj.14.2023.03.01.09.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:44:59 -0800 (PST)
Message-ID: <36f0544a-7fe5-1154-d339-f0162b715a13@linaro.org>
Date: Wed, 1 Mar 2023 18:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/11] tests/avocado/machine_aspeed.py: Add an I2C
 slave test
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>
References: <20230301165619.2171090-1-clg@kaod.org>
 <20230301165619.2171090-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301165619.2171090-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/3/23 17:56, Cédric Le Goater wrote:
> The Aspeed 2600 I2C controller supports a slave mode which can be
> tested with the I2C echo device. Test extracted from :
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html
> 
> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



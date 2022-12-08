Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA61646FD8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3G9Q-0005IF-Eq; Thu, 08 Dec 2022 07:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3G9O-0005Au-CY
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:37:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3G9L-0007bn-R8
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:37:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id o5so1479151wrm.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aoM60tOe8cDTRYUl3L3CmsXghRwIEihOYxg8AyEFcI4=;
 b=eJJusWVp5xj0Na1iVOeI3P+WJyw2pr38ioBKfIiHJufRA3XOGJBT3eH3pTdf7Js3+7
 LpmpC/PlF9QotCxpCHPPa9yCACetIv5+xZFRrKtIsmmsuteceGJUdctKfxWpOy5g8xNo
 hwKbTPVZE8H5M7o9VbVaAGvBNnycQj7dnKDEjXf3Rz5PldDp5faZkoonMGsYKCjR4yDN
 GyLVwv6ephv8a2LvU7W8P6mhHPqwAqYRitGqx+sOUE8wASR1aqPiehsJ//lmH9+gH5S7
 ns1n/nu4gmiiLS31pBiF+2IZCfYYeHTjGI1D50f7xRQUQ/L/hsKgsi4KnkWaB9YIiHpv
 TCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoM60tOe8cDTRYUl3L3CmsXghRwIEihOYxg8AyEFcI4=;
 b=mBVNzCn7sUa/gZRDkaUbR3BA1ECI3gsBN+PwbsKGd3qieBEK71XaXgoKiE8ProoXV4
 irC6hgdXFy6rIopVs94u78jzF1NG2d+/aX5h4LW7j6QXvfC3lW0II+aYh0uDa/Vn8wIJ
 sV/NCPiNvBUj/7RHHCI11aLv1C8xvh8C15mifeItge2K/PbXgMdWsCdQWnDGiGSbJ3Va
 7nge0g81DhgGhCHM1wKJEh95jIfR2IwBdeME/XXc5mGkPyYTWFGxhsKnpYDlh6KMGUaW
 xuKkyEpfAk7IJHzcT4dVug6YlsfXDsGu1kb5TBOVNwa13Rby1XDPuN0xssAJt0KjuaJb
 rIAQ==
X-Gm-Message-State: ANoB5pkiTxtafqLLcK7GdJvIm6SQ+qC+LtjONj1B+saS4udhyQBtdghy
 hmZDXVSMuALv+y9hqZGVDvuyZw==
X-Google-Smtp-Source: AA0mqf4CW4ViwAWai48vrt9oAqCMWS+TZRmYQPRRSLtlU6PPQi8mdD10gQZoeQysWkO3DdxXNXS7lw==
X-Received: by 2002:adf:fd45:0:b0:242:48df:b4e4 with SMTP id
 h5-20020adffd45000000b0024248dfb4e4mr13966488wrs.660.1670503034448; 
 Thu, 08 Dec 2022 04:37:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003c6b874a0dfsm5577219wmi.14.2022.12.08.04.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 04:37:14 -0800 (PST)
Message-ID: <20c607db-cf10-1be6-116a-6105a0bdac9d@linaro.org>
Date: Thu, 8 Dec 2022 13:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/3] hw/nvme: rename shadow doorbell related trace
 events
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
References: <20221208122642.80574-1-its@irrelevant.dk>
 <20221208122642.80574-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208122642.80574-3-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 8/12/22 13:26, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Rename the trace events related to writing the event index and reading
> the doorbell value to make it more clear that the event is associated
> with an actual update (write or read respectively).
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c       | 11 +++++++----
>   hw/nvme/trace-events |  8 ++++----
>   2 files changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



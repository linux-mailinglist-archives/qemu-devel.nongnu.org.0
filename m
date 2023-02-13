Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33758693FBF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUJw-0003hZ-F2; Mon, 13 Feb 2023 03:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRUJn-0003fK-3F
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:36:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRUJi-00043V-4Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:36:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so7938085wmp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q19zx4Xz7JNBpJfB3mQzxSXvc+WuAV2f0ayqgT0l7LM=;
 b=cOqnSG23a++Au4aTnE6yuL30Aur60UyIAFOoqh9pOymMfIXP7ljLU3Zu0RuaCurOwB
 16ZXxxOgcNu2IDWXh/3cz3IL8HFccR68xXSjlTalI8HPys+RF+9BbJevSsvYkQQlAl4P
 N3xMg5D0APDVJPTeEEnms8WOexSCwNFqLYb34qbDdfO2/oRSHAFowZ6iExgf6ZaiSmng
 4ZuFvjC3MQ4dNzi8G/6Xu1GKGGEZwWmskiUitdQSELRcq+Lly8YtYLJQAWVHsf8zZKfC
 SZ+puvaeZZMYzO2OKDdrDVhYZ6FGCO5wiEKY7XbGWBtZlfiKgV3EZMSsSUZavRNyTxYm
 1gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q19zx4Xz7JNBpJfB3mQzxSXvc+WuAV2f0ayqgT0l7LM=;
 b=0rDC9RB8f49JBV6XMu/0YmpTFhzhHujOGi75cOoH7AJjLTbtqKlGSOz4sWq8yEScm5
 WIdcAklamjbx5EunfGASpjy8KchJ92LfkmKt104a+vVw0PfOcoFdSPPc9W5XEX8p1dwZ
 2V7wxQRPnlFGTsIckE6yRURF0M3W57TLOJ/JdvkremqvgdMY1yhOsAmW6A//FcuUsyf0
 CsjgNk7oWEQJmhDJD1O6WR0Vcu6v9ObOtXtx6BUMBnjn2mC0FNCmOBtJmfT1W/8ExCGR
 2bbgkYw3je4SCm20WiIw1Bx1uDDpDPj0HQdrEJi7s+u3Su2jZXJ8EVLVeNMIFQjjiCD/
 VPVw==
X-Gm-Message-State: AO0yUKXgHJJHnvXNaG0A4lYGhTlWN+nBJKwuD/wPN3eJI1Q+HraBcaHa
 bmqYztmoKjJ7SKHf1t1ceeloBdw3QbqoAZ53
X-Google-Smtp-Source: AK7set810ZXuvQ8rHUTuzgiGxpy7mRLZTLYsRzSPLmKiVdrMqquCNf2gvq/TqfaIs7K53VNoo4DDtg==
X-Received: by 2002:a05:600c:160a:b0:3df:ffab:a391 with SMTP id
 m10-20020a05600c160a00b003dfffaba391mr17854234wmn.24.1676277364305; 
 Mon, 13 Feb 2023 00:36:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b39-20020a05600c4aa700b003dc433bb5e1sm13121388wmp.9.2023.02.13.00.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:36:03 -0800 (PST)
Message-ID: <a39dff9f-d205-a381-0d75-54d191f93320@linaro.org>
Date: Mon, 13 Feb 2023 09:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 08/19] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM
 abstract parent
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-9-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213070820.76881-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 13/2/23 08:08, Philippe Mathieu-Daudé wrote:
> Have all the EEPRO100-based devices share a common (abstract)
> QOM parent.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/eepro100.c | 40 ++++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index dc07984ae9..dac42ba17b 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -235,8 +235,14 @@ typedef enum {
>       ru_ready = 4
>   } ru_state_t;
>   
> -typedef struct {
> +#define TYPE_EEPRO100 "eepro100"
> +OBJECT_DECLARE_SIMPLE_TYPE(EEPRO100State, EEPRO100)

Self-NACK, I'll respin also introducing EEPRO100Class for completeness.


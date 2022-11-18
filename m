Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467662EE32
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:19:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovve6-0007C8-1L; Fri, 18 Nov 2022 02:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvdu-000795-Ff
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:18:31 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvdr-0004Fb-R7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:18:29 -0500
Received: by mail-wr1-x431.google.com with SMTP id k8so7954312wrh.1
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JfmGvxpkgdXUyU8IBujfPpSjqhqj4YJOYz/gDzZ9iqM=;
 b=PYdv1mUd4gwahsMyGRwMgL8DxGcnVkuYQhJSLrk2e/CuZzDKqtWYFCr3Odge0YairA
 w40EAWQwpYdTuHlpRDwIwEnQdtiuA5pnTMmOW7A2O90BHJ4nsEEDH69cLL+4qN6pdUbd
 jMGaiG8D3JBebA0hlaSGzPSgQFP9HXfe1FI3XyWJxbX7S4vt1r6FHpODiv0/quV1aVDD
 O6oJbY1xMjDUxllCjdqkpHqPe6AlsoMpnCLcg7W75H2ZbC032MIydJJ4tnnGdkLUsz9q
 MmabXrsumPvt9wM5domGq4YnDlZBABCNWVz/yyZZcUOBeGL3zhbh93TMqXGJwioAW5u1
 z61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfmGvxpkgdXUyU8IBujfPpSjqhqj4YJOYz/gDzZ9iqM=;
 b=P9dHDM1x/JJSyrYwIjhHca3pfX3/KTd9N/5ZB+BtyYCdNAuNXqkIw69dGDGfbAg786
 5LFYXpw6qOpRT97cP+giXe4NG09Jp6xcpWsD9lLFmS2u+fILymHFfG4VKEZi88mOHyDE
 ZuwsvBk2lcEpW6doXXljVP8gN+I10RQI1uR8WIBbZTFmypcElbqUam1VNtovyFdtSY15
 joC460RPq8OfeolxOPiW5J7IxwG76dBJhFkAkEnaI/qbn0j7NwUG2vey2TMF4f7V2Z7N
 jDKJoY4GXA6ow9AcQKvYEgDSjNmM8aLdhqQLefbRfZmMZG/5dTbtwu9tRY16NE4Q0VMF
 t1lw==
X-Gm-Message-State: ANoB5pkMG8it/gYAE0uVZaU1ZmofbfrPLn5G5KheKnsMW3Gpxve0O1GJ
 E8oTnBTKiaIdQFxvZsoVxi1Z8Q==
X-Google-Smtp-Source: AA0mqf5q+3he7AA1MkEHbL/bHJqwQpfsYFk7GYGB9U/uK7q0pupsv5s8spsEfURCy20YcQrJBQOCsw==
X-Received: by 2002:adf:eb81:0:b0:236:4ba1:fb2d with SMTP id
 t1-20020adfeb81000000b002364ba1fb2dmr3531762wrn.570.1668755906111; 
 Thu, 17 Nov 2022 23:18:26 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056000024600b00236705daefesm2793241wrz.39.2022.11.17.23.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:18:25 -0800 (PST)
Message-ID: <a8f4c209-f697-5eb5-2853-5529c359b013@linaro.org>
Date: Fri, 18 Nov 2022 08:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2 v3 1/3] rtl8139: avoid clobbering tx descriptor
 bits
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117165554.1773409-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 17/11/22 17:55, Stefan Hajnoczi wrote:
> The device turns the Tx Descriptor into a Tx Status descriptor after
> fully reading the descriptor. This involves clearing Tx Own (bit 31) to
> indicate that the driver has ownership of the descriptor again as well
> as several other bits.
> 
> The code keeps the first dword of the Tx Descriptor in the txdw0 local
> variable. txdw0 is reused to build the first word of the Tx Status
> descriptor. Later on the code uses txdw0 again, incorrectly assuming
> that it still contains the first dword of the Tx Descriptor. The tx
> offloading code misbehaves because it sees bogus bits in txdw0.
> 
> Use a separate local variable for Tx Status and preserve Tx Descriptor
> in txdw0.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/net/rtl8139.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



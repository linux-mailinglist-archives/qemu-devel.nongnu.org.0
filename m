Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A802662343
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpVQ-0007Ld-Tr; Mon, 09 Jan 2023 05:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpV9-0007JH-R1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:35:40 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpV8-0005Z9-87
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:35:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id j7so2664112wrn.9
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nfFZK8xouw4KxaG/WOrStGecxIWo+M3T8lLkmuXhPAI=;
 b=EA1zzMo06P6Pzpujwe1F72f+wwn+vRLVh/ixjtP6Tgf/JgKDsiYwf5ABpFrZW8/28V
 167Ht/GDZ6xtS+2hOmLVYezX0bD+0JFL95y6X7F647JSdNrPnud+kxHqAcYQtWOQl///
 9fUmmIccUBHoC+81apCiEBS8/IsCF0ofFtjMxTfx338FsbxZWySkOJLphmKNEHIlN6Sh
 LyvwkhX0j1oi+OTpRS3YFefg/G+11SRE8jg90POg3h2ubD39dLQ/6Vz432MjSg9zrEdP
 U+bl6J2Bp1ENTqWrT9IbwCqrSno3lauOFjIPJ118DGuE+uyogZcRbT1dQ/wJBe/qNALl
 MfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nfFZK8xouw4KxaG/WOrStGecxIWo+M3T8lLkmuXhPAI=;
 b=QaUA1SP9CYpgxPZKeZIBnGoK/DURYZO/bCwELpmZKbUvXGidUh0b4wqZU4+zcjZYfw
 UmNuju+HKREmJwsqiZBGOzgINKz5054fsz1QxHbGrvl9MAyJiYeDBtVVKxzbAq8Ty8el
 4Avkwv4aB8seQ5b2hzZIW9dNearv9+P4BstNLS1R66PXF8GHnnO5BuudDABBEsHtrq8P
 1fbMiqIDruvRMrUmzyTzCToq1z95UzUnxsYJ7RwaoueoFu3tp04ZIH0AZyKlU4XePSo8
 k8gIn5tMTjXSDKLkA4cZg5Tm+hDdcNn6/TlJZMjNczWXeQvqDLCMT9cvauhkAQ5PEIez
 4FbQ==
X-Gm-Message-State: AFqh2kotfE/FITHmsspXtRTgXMk19TxNzxyvKdwLgiOpylxuzhDcH6nW
 WsAy1FLTXTyzFzUKUMnHzb0/TQ==
X-Google-Smtp-Source: AMrXdXtihm4gI4UxgWxqyzP0yEC4FSaL35pT/N/MB3qvmDQ43ttInXdByUuunHD7yixBH4RxhzJn/Q==
X-Received: by 2002:a5d:5a19:0:b0:24e:fdee:3eb6 with SMTP id
 bq25-20020a5d5a19000000b0024efdee3eb6mr47834930wrb.69.1673260532701; 
 Mon, 09 Jan 2023 02:35:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b002bbed1388a5sm2835743wrp.15.2023.01.09.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:35:32 -0800 (PST)
Message-ID: <ac950dbe-9ede-19eb-06d7-aa4a730ff9a3@linaro.org>
Date: Mon, 9 Jan 2023 11:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qtest/test-hmp: Improve the check for verbose mode
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230109101306.271444-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109101306.271444-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 9/1/23 11:13, Thomas Huth wrote:
> Running the test-hmp with V=2 up to V=9 runs the test in verbose mode,
> but running for example with V=10 falls back to non-verbose mode ...
> Improve this oddity by properly treating the argument as a number.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/test-hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



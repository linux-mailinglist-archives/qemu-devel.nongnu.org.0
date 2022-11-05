Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED061DC25
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:53:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMOi-00026s-6l; Sat, 05 Nov 2022 12:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMOe-00025e-6u
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:51:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMOc-00044L-Bb
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:51:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a14so10841995wru.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l3DP+h3V1IDQbnM0hfx1DXAHPn1xld/Lw9N0C1Y9Qxw=;
 b=QGmX0D0O94HvrKKu6ums7RAi/EvO0baN/VeADO+6wKPFD5gahSpnLK21X+dTMZodhJ
 +heAhbalBUX7ZRqVjm5fcIpstcV/WBsb8CyjZXuq2ou8nvd6cEkcQsSsYwOXEyIwZBDa
 eMXfFrglHxClKPDxCoOIvU3IS+0PfpPsvcX9IHyExES5FNnbPJilUPiOr9QI5uKf56Tf
 g2zm1WEKTNSULKOdy0G8K6Lpv72IdfFpOO+YP/Ik5wzX1Dxy9Vjdi7qpF7j+i8WqaYBW
 VbxDUo7qlGxEuTiJO3/+w6xjraSdXYL0J5oQHqFucLMBwKrb3TnnxKpKbNGdvu3lx5Zz
 xYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l3DP+h3V1IDQbnM0hfx1DXAHPn1xld/Lw9N0C1Y9Qxw=;
 b=ffveVuDDgXVY+bFo6L5mycVno+/tG6K/xXInWdvQAvGGotlpupMCOB0Y1/OtTIOP/4
 Hzmm5aTDh4Gek2ne6TaX31SnKU3ET35nvZYXOksaFZ/uKis9npAf1BJ8zGueyk5JpUVV
 mPMLqXZab76tA+Q9xHYXZO9mn4zZvO5CJsswZXmK1ccLsFjcO7HvTXIBGV6PCR0P8fRB
 da+dsf8uSmbdjlQxetAxvK32Fyj1rneutm9KehxYEwyUBczFjqqeCN+4ZvGgwJe6D3B9
 jKFDYZv9NRPYV+9lfLk/YYrjDlYghGhZZNDZMuoZl7FA5SO3GTgkKwqGjm1oHAeyixMs
 DQUg==
X-Gm-Message-State: ACrzQf3WqUg6eOCbIZ3rDY7XxY2jQxCKVJbbr8kVb9XePfq/NhuWhlvR
 jrJtYdaS9GVuE1e/Gj5TWCQuWQ==
X-Google-Smtp-Source: AMsMyM6zdqhie7+os0oEAQf5XLwpx9fQ0IBMB1pNHuI8Aa0TVfLodFS1xH4u+NpDm+qJBZdXqDiM7A==
X-Received: by 2002:adf:f10e:0:b0:239:6cea:a4ff with SMTP id
 r14-20020adff10e000000b002396ceaa4ffmr8244469wro.36.1667667108266; 
 Sat, 05 Nov 2022 09:51:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b003c6edc05159sm6372253wmm.1.2022.11.05.09.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 09:51:47 -0700 (PDT)
Message-ID: <586fea0b-c702-7684-1d95-f0b17c0dbad9@linaro.org>
Date: Sat, 5 Nov 2022 17:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-7.2] tests/qtest: Fix two format strings
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 David Alan Gilbert <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221105115525.623059-1-sw@weilnetz.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221105115525.623059-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/22 12:55, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   tests/qtest/migration-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



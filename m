Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE469DB0E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMuu-0008K3-HH; Tue, 21 Feb 2023 02:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMun-0008G0-UN
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:18:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMuk-0003eN-RP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:18:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so3306457wrw.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7ocSpCCYYr+2cmtPW/fgYY1RBOpAEKsM9LZutLRzEM=;
 b=ZWNBQYLWawYBR8TgAGhFZZ+vR3mp9JfP2QsQP5P/ZvpIurAPZ00WhkSHic/nqV1EPa
 IbLxfpbk/ilWDP68URkBuDqYCYsg7GcRHbz/XT7DIAgH+6kb8M77sZ6IoVDNCXNykNuS
 +wTNynM0c51lXXb44CR+RJdx5lgQyuMXv1dhAK8VqwKU7c6Ml7rUxyij1wJmdbxGfSrV
 d2Twg1C/CK3FedGMQ6ImA7myDmqg7pGBd9wQZN9KgggC7+9BOLHgYzyMB3+IXQO7C49y
 gaV8QVb+XEAWIc7wcd5jty2rF1/MKsxLtDgncJfPTQkENWtgf7PkSAcl3/++v9Qo+uQo
 A3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7ocSpCCYYr+2cmtPW/fgYY1RBOpAEKsM9LZutLRzEM=;
 b=FWFXA0ko78vX+tb/eECHB8vpuPFkVLh+yDwXpSUglrHGdj/AXfI8ZMBGa7ZDKM4h4c
 onYvsKtarioW71CC93kscg307ZuFjGJ8/5uqnO8w6BIZ6WDgnUUAKzP9zc/M5/lLuIQL
 nn5hEuB6xMWkORLid3A6BhVjX8vSlDSdQxAjrI4lxJkPGLfd60v+Kuar/VSjZfZOTQGU
 L6YQA22OjxEE52ZU62VhG4IfMvA/VPIvyk/6Xwx/97tvEu1RNY3rEpczOj1zJLtkOgw6
 cRACgS0mYsr1VC9QBPQntpEYEk5i6yUpA3a8mApccV27CUobKJs//aGRbXbaXGxV/a1p
 7pJw==
X-Gm-Message-State: AO0yUKWVeeBs63IPtPGgUSqwR2Zx7KG2jZCamPrgblU+G7zzi7vO1ck/
 4mdqCb0EeL9in+H8hjwZ8wC23g==
X-Google-Smtp-Source: AK7set99rzS7Cso3PJZCGogbWxajQOErltlFPKg1HSV3WpNvH1Ns6DDgvRUrwLj8WW7PkpgonrWlIQ==
X-Received: by 2002:a5d:6992:0:b0:2c5:5878:e5a6 with SMTP id
 g18-20020a5d6992000000b002c55878e5a6mr4148981wru.61.1676963888880; 
 Mon, 20 Feb 2023 23:18:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm7745611wrs.49.2023.02.20.23.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:18:08 -0800 (PST)
Message-ID: <28e8ccd7-c104-5491-aaf4-a104f0aa31a3@linaro.org>
Date: Tue, 21 Feb 2023 08:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 08/14] target/arm: Add name argument to
 output_vector_union_type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 03:19, Richard Henderson wrote:
> This will make the function usable between SVE and SME.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/gdbstub64.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



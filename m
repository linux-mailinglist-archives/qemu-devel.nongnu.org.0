Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4110669DB21
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:25:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUN0p-0002P9-7b; Tue, 21 Feb 2023 02:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN0n-0002Ol-Op
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:24:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN0m-0004Xm-6l
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:24:29 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so3420301wrz.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vhzq7b3u6FivoNZ05LRxEpNTz7af4gTcX2/7rcv6GEs=;
 b=HTDag4Olq+rhEPwue5z01gQqjvcQe2s8aSYvbUGGPmh1bX3PUlThZ4urUVwC/O7Yg+
 QPH9eOGRpJIN/R41Mc8KtawTOhR4U9xgN/dWwRNEkYd3RByUVF/knjUNndRdlwBpZL+M
 kfd5UGVK9BSSqeWI7uqSf46+35ilHb8t+Fk6nk8Mg+SUup4QnCvDRw/oEHZgaodXWmkG
 cUcsHtzpGr29xQJound7AQIK+yemB07p5pKCmG84X0F3O0wZRaUIkC6Yy/dOdiTvBaZA
 jM6lyqTt0mKNYsipCPJFtYu5IDUJj0MPP7Sxel2Xqv69p1fA+I1HAiffJHXy4D91QRLR
 NDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vhzq7b3u6FivoNZ05LRxEpNTz7af4gTcX2/7rcv6GEs=;
 b=yuf09bwwwBID+4rF6rKXB2OrO82vH9v/LlAS4adCYR+UepfGgKhM7ONGzYYq+L8KZZ
 lyfaLjwEfFvJkxxlCkQtHmQeuD7oQJYnCJIN+V84+nO3NhtWJmueI0Z6hlF8i3s0oeI+
 05m51Vv3C6TgDIZiem2C2o4fgrq1eOyObRh5VbOdjIsaU4EIyLbLQoX4ikOozn0pcZi6
 p4xNNJVNKLPIjVUGlneWyp81gjy8m/692JpVLPF79HUlixM7+aWlW5TdytuP/XobGKKN
 Oe1FRlU5kQykBoWjeC3546qYbtzKRpKnSJktw54AnaxCj/tBewgtb7+Tw6+T+6I0kNcL
 pqcw==
X-Gm-Message-State: AO0yUKV82ST5EIZlzbJYTXse9bNx4dmLthcmp0VNDpYKQ00qGpOMZ3qH
 t8dVvr/NNwI7LWf2fdrQjPmPEQ==
X-Google-Smtp-Source: AK7set+AXtrKCyiSCNfD1PPApuFP2CPyIovaYFWvf8P8j1JIyA6YRrPanZNINrnTMUf9C8qyh3j6UQ==
X-Received: by 2002:a5d:65c1:0:b0:2c5:a15d:8c34 with SMTP id
 e1-20020a5d65c1000000b002c5a15d8c34mr2439417wrw.25.1676964266697; 
 Mon, 20 Feb 2023 23:24:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b003dc1d668866sm4088869wmb.10.2023.02.20.23.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:24:25 -0800 (PST)
Message-ID: <ae6d1223-fd72-66e1-74a9-e4e8205e2783@linaro.org>
Date: Tue, 21 Feb 2023 08:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/14] target/arm: Export arm_v7m_get_sp_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
> From: David Reiss <dreiss@meta.com>
> 
> Allow the function to be used outside of m_helper.c.
> Move to be outside of ifndef CONFIG_USER_ONLY block.
> Rename from get_v7m_sp_ptr.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 10 +++++
>   target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
>   2 files changed, 51 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



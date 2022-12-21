Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274CF652AAB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 01:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nO6-0005xe-Bu; Tue, 20 Dec 2022 19:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nNw-0005vf-59
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:55:05 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nNu-0002DV-II
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:55:03 -0500
Received: by mail-pg1-x534.google.com with SMTP id w37so9433284pga.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fXgSW+FCBnikGvcoBBPrfnKpnoAufMV/I4f5RF0KWVY=;
 b=GCT6Sv+MttngC2SjLLXofh8zTfbCYe5OfqcFZG5QKon6+sxKcFEsAPStFYoFFzCkV7
 YUm3oZHf6Z07teoRrc+qGUGetqP/3dOvxnkhdYOhZNT9MYhMfYPdyVDbXWIVmwztsJ5R
 ys40EhD96OZPUIBJYCFIqKXY5zGrtn1Q+p9cUIJCbjUx697mxcsSiUevTjb7I6xPeKU6
 nSZzEE8uRSvcCoE7fTTCP38B5j0W3sK3WvwwulGOUb8UeM619zucLWBske9g/znDWTDE
 TxUrsZfN/TPaHzOuBrOWilD43F/liXwGeLG8X/ZckJw+lPx7QSa5lgqg15IQUhUXZ2yt
 1TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXgSW+FCBnikGvcoBBPrfnKpnoAufMV/I4f5RF0KWVY=;
 b=0HqlEKM+dk7GZGbDjnzUmVNG7V2Osyk7WjIPo9HuIFygS7mGCQJ0m2A2UV5fVGjz3b
 0AVYPupXUadweTcY4xJNQ4fc4Lxt3WPx6QIy18E/yLUMubpbd7uJpDOjnibfFF9kWUUx
 w5EVLTJegZN2lOBadLF7AR2ncHzXST7TFCPHZtnFwVcMbyBrXdontR5DEeKdR3S04c7F
 /S6dAVYD45SGuRyEBaDssSpgtq5zBRE5ZityHPLAOkyS7KdYVxb8Xets5XE8gFXbWTzf
 rI/u4Ob8+H8fDcpWmOgyLE5qTia/+KbqaAjGlmL7GOtiypm59qLY0EQYP9eh/ThGoVKo
 Vb5Q==
X-Gm-Message-State: AFqh2kpbsyJadLr0BJV4KAz2ROHea7/IGBckiaHIGQsSNItW3O9S7a0I
 efrZjpI67w7a4L/FP8xxpgiJDA==
X-Google-Smtp-Source: AMrXdXsVHIOfgX30xxepCQiWwPMMRDcAIoE42dr0TsWUSr8dctHy7SZiQED4EMthyyrMPGDrcTHW7Q==
X-Received: by 2002:a62:184c:0:b0:576:1078:5abf with SMTP id
 73-20020a62184c000000b0057610785abfmr354130pfy.6.1671584100740; 
 Tue, 20 Dec 2022 16:55:00 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 d68-20020a623647000000b005765a5ff1fasm9190227pfa.213.2022.12.20.16.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 16:55:00 -0800 (PST)
Message-ID: <766727aa-53d4-5c99-7bde-5f4ba9b26132@linaro.org>
Date: Tue, 20 Dec 2022 16:54:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/7] hw/mips/gt64xxx_pci: Manage endian bits with the
 RegisterFields API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221220113436.14299-1-philmd@linaro.org>
 <20221220113436.14299-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220113436.14299-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 12/20/22 03:34, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Message-Id:<20221209151533.69516-4-philmd@linaro.org>
> ---
>   hw/mips/gt64xxx_pci.c | 38 +++++++++++++++++++++++---------------
>   1 file changed, 23 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DE60BE01
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 00:57:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6Eq-00084U-UP; Mon, 24 Oct 2022 18:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6En-0007zQ-M1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:48:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6El-0002HH-S8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:48:05 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f140so10235141pfa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7kbdIJaBExrUJnF7JDN76RQZvMNaopiuyDtlnkobAio=;
 b=CJ4uwObPy9E+UGwj7JLHsXhi+o0eucI6ykUlJi2GrSOrqKfHEAgt2O2x9oJ8Q3QGF1
 ZeF7YP3D3+AQ/CKMpBySi4vZ5+2T1CCgilERyiK5XIoavdESUHDnao1gLRoNPRmNz/jz
 sS7twIBGQ4OMAc+aRxIoMh3M0c0S2sKmvISklp6s7AZXSQwK3xTD+fEWBsGcH8hKUJen
 +n6BuHZsj3IMpqsZF8s/ZRMy7HXRIj5Z6cTrT5UXu+gNeSCW83+jNtptEc2772Do6grf
 GVMQP7b1Z7CHM3PRrEqYvIP5VqQHkpN+mzoUjNWgr87b/uAqgT30DKYsP5TNrjEGoEED
 XrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7kbdIJaBExrUJnF7JDN76RQZvMNaopiuyDtlnkobAio=;
 b=71iWtCgvw49GidDtcaycSsRF12LG4Sh4AnzzRbO6kHQHSjeXmq22m9Nsw3huKEqHf3
 GJ9SrB7M7sa0KWimME73XeuaA1nBiqccTAmRJ17Y7Apo1pGt872/YQURh82EUkKhhf8W
 1biGYUBPcjgqof/4fk1McMmN2B5Q7Nf/Kb+SHABGoXGJjrti2TxBXB6o9NHV24XhjT72
 S/B3MvQOj7xecogE99Y0TyuNRdteVomU8eJmGpRYLod43CFnkRGbOZQgD6zHlj/ee8mL
 2lb82w+OkghZ6BqFAr1l+yc/FZ8UMg5B0XkVBZk3ZHGlSdzpnsi9C03ORKfB1rmSUAhm
 hqOg==
X-Gm-Message-State: ACrzQf29H+LzUpxOY2hV0w549UDxsTwLvbpyI3qdRfGz2aVBF3SiEjX4
 E2szcVwJPuMc+s27sEtebIHXMA==
X-Google-Smtp-Source: AMsMyM7IRs/oFookjJuyuaas2NUZW7cOw24Szc8TPLg6d7ECRpXTigJYd86exfbECJCiFPEFD0dYrA==
X-Received: by 2002:a65:6d8a:0:b0:43c:9fcc:cb24 with SMTP id
 bc10-20020a656d8a000000b0043c9fcccb24mr30367511pgb.477.1666651681866; 
 Mon, 24 Oct 2022 15:48:01 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a170903018b00b001869f2120a5sm219546plg.34.2022.10.24.15.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 15:48:01 -0700 (PDT)
Message-ID: <1a9239b9-8ed9-2be5-dcbe-e8e3ce30284d@linaro.org>
Date: Tue, 25 Oct 2022 08:47:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/6] target/mips: Introduce register access helper
 functions
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
 <20221024152349.215135-2-jiaxun.yang@flygoat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221024152349.215135-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 10/25/22 01:23, Jiaxun Yang wrote:
> Introduce register access functions with value extend capability
> to prepare for decodetree based translation implmentation.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tcg/translate.c | 143 +++++++++++++++++++++++++++++++++++-
>   target/mips/tcg/translate.h |  54 ++++++++++++++
>   2 files changed, 196 insertions(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index de1511baaf..b5d595ef34 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -1196,6 +1196,17 @@ enum {
>       MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
>   };
>   
> +/*
> + * If an operation is being performed on less than TARGET_LONG_BITS,
> + * it may require the inputs to be sign- or zero-extended; which will
> + * depend on the exact operation being performed.
> + */
> +typedef enum {
> +    EXT_NONE,
> +    EXT_SIGN,
> +    EXT_ZERO
> +} DisasExtend;

Remove as duplicate -- this is also in translate.h.  I'm surprised no compile error.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



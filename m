Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E8B318CDA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:03:45 +0100 (CET)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACZM-0000F6-5L
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lACGb-0004mM-US; Thu, 11 Feb 2021 08:44:21 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lACGZ-0001DC-OG; Thu, 11 Feb 2021 08:44:21 -0500
Received: by mail-ej1-x636.google.com with SMTP id w2so10069436ejk.13;
 Thu, 11 Feb 2021 05:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TgDpavdW0yx6A5pt721TnlZvcU+K06XmgrINdtsU1vU=;
 b=QI/xvXSgshGiuziNIX3gHewy9wuPREyUEm/c/8p6MGtcTUY8JOmpaAxTloebpSXPw8
 xaqCXtDBNj4+UrbC8VMaxSWDTK9Yw1X3R4Nj+Y+N1E/cvygNp6qDF9vKnqJTYMOqXk/M
 OWZJafiVoxqYU6fWWaoG0T1a3DYOB37QCwxRqOBj+76mXbwXLj0IcLxdcGblrusaTNFs
 Xy37mez+iqVshOinIQNPfpWf3B01U92P/8Uo9f8wWFSMh39zPzDf8ibXVWZF3CK6h7a7
 hHqEt4ObsomG3MQtqsVRVa6gJeSbGldaHqh8//jnXVh1YQH4E3YaKNTK7KfjjJr7KBVB
 Ilfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TgDpavdW0yx6A5pt721TnlZvcU+K06XmgrINdtsU1vU=;
 b=VT5MUNkZtQ41B28sLTVY3zcfdrcHK9ixqH9ycbA2SVMgG9ROZTc10NwpWlTtyLbWxs
 CtBHZOkbKUqTsYAe4TALszEayqZfHbH0+zmKGTVtsrzyltitEn57+7hww6elAzCu1KRa
 botmUR9oeO72eBDBq0Z7LEAE5jRvSL0tAgLI1Aq4yobQi+ml6dLha9wmOEQ64eAQ1r4H
 AQmz/BtHQkc3rvnnCE6D+chkNXRC7f5EM9uATWXzpgvccJawXncW3rg1PpPWyx6imzll
 BgudE4RV9fv/kjoHe2uMhNFZFexF//YjPxwfnqvEhdNQq1aEY7YBQFHKyGmQcRYwypkn
 7bKQ==
X-Gm-Message-State: AOAM533nmfhYEKQ5f2LIqa6Odi271HiY8i1QJ51rTkPG7g8cYx99K72/
 CN9aOngvjMTvvw2zyeBS2gwWtVllaKE=
X-Google-Smtp-Source: ABdhPJx4K8B4saYLOz52HpvdYKTESP2XeqqWCxEWRKWMAaVyivN4gn3E+hKhkDR/9TJsIPihXCE/cA==
X-Received: by 2002:a17:906:4cd3:: with SMTP id
 q19mr8312407ejt.78.1613051057112; 
 Thu, 11 Feb 2021 05:44:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ov9sm4444985ejb.53.2021.02.11.05.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 05:44:16 -0800 (PST)
Subject: Re: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported
 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14ed98db-398f-4ddf-cc8a-6b7aa50cd1e6@amsat.org>
Date: Thu, 11 Feb 2021 14:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marcin,

This is v2.

Please don't post new patch series as subthread in another one.

On 2/11/21 1:36 PM, Marcin Juszkiewicz wrote:
> Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
> above this limit.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B46ACD10
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFwE-0002Jf-2J; Mon, 06 Mar 2023 13:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZFwA-0002IQ-U4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:51:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZFw8-0000qV-FE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:51:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so9879678wrm.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678128711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/tlE3De+NcClRJ4yakXKKrLShgZOUc/RvC69ZgGgzM=;
 b=dN2k6xNN5LcVHcnDM62Ywap99n3cwd6NlCL5FbO4igb6t99yqBS5mtOI2XBAc5nJV8
 Nw3/NMfHq0PTWtovBqlpx2pNg0TTW6zSuivNrbvF9jC9eD0jEWC4Z7dhV5vpzBo/572H
 EWdf/quvoeoAZqeJyFWlpkNP3hDBn22WTSUAw+djwHfZXu3pktg2+QxccaMj4TdwOiM2
 0TCterLDHLJ38Cr43mgtVj5V7hJCVZtM3PpcmQubJUeB18EP8PDL691EQzkcNgoCoDft
 pRNE6HT9b1jBD2ZZdpq0xmpcTJM0qDdkRtoLPrhGy3HQ8yZccNeVnlNgtkjIIptWXed+
 lPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678128711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/tlE3De+NcClRJ4yakXKKrLShgZOUc/RvC69ZgGgzM=;
 b=HAoE2Lhf/PWORigKYiNulE6HovFHcUbsZ8U5Nf7oXo14KrOpclaU5K9mhsCHI5WbyI
 aHGt/Bpr+96x5M20Ywk7lXIoaycRHT52WOkew1tikzu4CzFescRJrEmuoZi2J/eCQpeQ
 RBttaXRAokUNSocErJDxd3b+y7Dt97HC4BrZULEPUkT30kC7H6213wDCVQjVccDMsUd5
 OZEFENXhErWUt3NQR17pVC6A7itUPS3IWvCSPqAaydNzz3kDPRHkARUiIRKm6PZh3GzC
 eVTElnmcDvpoFdBJE06DvpaqRa0bbv2NWjQKWnxYOdQcY0u6iqbWW9YD2HSw5ZtrzPzg
 X6iQ==
X-Gm-Message-State: AO0yUKVbpxmY83DXKxaAR991YL66fDBIboFlS9Ul1DHGP+uoKzK2ll0r
 R1/JUF4orrPLYhIIWCY2E6kVqg==
X-Google-Smtp-Source: AK7set8A2Reso0iyhHI8SqX+vTHVAqlFnydBqsMPjSfE0lnPwxQu1hp0wJd1AMQoaCEQBuZiiL/5kw==
X-Received: by 2002:a5d:5312:0:b0:2ca:c865:51b3 with SMTP id
 e18-20020a5d5312000000b002cac86551b3mr6251068wrv.12.1678128710763; 
 Mon, 06 Mar 2023 10:51:50 -0800 (PST)
Received: from [192.168.165.175] (98.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.98]) by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002c56179d39esm10703491wrn.44.2023.03.06.10.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:51:50 -0800 (PST)
Message-ID: <836e5815-022b-4daf-c5aa-3d12501190ad@linaro.org>
Date: Mon, 6 Mar 2023 19:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 03/23] target/arm: Remove `NB_MMU_MODES` define
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
 <20230306175230.7110-4-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306175230.7110-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 6/3/23 18:52, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/arm/cpu-param.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index b7bde18986..b3b35f7aa1 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -45,6 +45,4 @@
>       bool guarded;
>   #endif
>   
> -#define NB_MMU_MODES 12
> -

We need to update the comment previous to ARMMMUIdx typedef.



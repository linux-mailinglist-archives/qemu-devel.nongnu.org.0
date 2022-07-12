Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17D571736
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:23:41 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD3M-0008C6-RV
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCyC-0000xQ-ME
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:18:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCyB-0001AZ-8N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:18:20 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r22so7161646pgr.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hn8hfoeLr1irY7kh1KEIR6qyh5futGTyzG1Co0kFl5w=;
 b=tsquKhsfqtxQYs9dRYr6z7EPIXazEbVCn7wX6ILUo0d92SENBr3gt+JVhXAYTMlbXd
 1AwLcKABEdNqJWHAhkr1CHvxQu3DfJKyNwcaJUNFQ5HODr0FWwQ4BfSSfFTWv6UqKVc6
 QQBUlXPz8/fbe32x2hcSMKvbZUZsUpN9kgi9qU2qfAUxeF26lNbXxcWFAFNVlo1L2kqE
 zp3p/8mQlZyKA8DFIymaANpLRe5wMoJjJKranN91cx+0D7V0TKSLIuhmXkA8i8UNdEha
 ujF6Lib1iyNQb076M68R1u69h/s0IGRd4oBHTelZC6l6tE6j5gi3KBYcSX0IscIvYeqV
 bqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hn8hfoeLr1irY7kh1KEIR6qyh5futGTyzG1Co0kFl5w=;
 b=dG5R3/H+RQ/vuAOgUMn1nwR9tdboqx9+KF51kX9P5C9Ce+mCnd1gRkxtoiGpKxAWbl
 Prl1DD+1wHxdy08CdKnLs+bKk4rRwbe8HKA3CB409WtUwCCSLjwEpMKjH/hKz1Qr4BKG
 tK00rL4EfZJt5Fgn1JeQfLslP3gS10ThmKk6WIXagPk8W7Thfu0Kx4NL4F1OZc/KnYdd
 kv9vHpROl/m+uTk/Ay5vD61abpScL5IDE4Ym8kdEpj5khQqvm4yeY+Ysm2va4Cdz2wV2
 Inpb3b5SapcMl9CVG3vcNgFAUdxOd/wM07pyuW5SEfs+BKMXpWYogoqtHLyIHlMrdLom
 5FvA==
X-Gm-Message-State: AJIora+A0zkiG4nrVlIZkZVQUIpvB1pamjKRx5M68taFQuUjtr7OAsvr
 lkzr1V1+AMZv8j8Ikv7prNgJEw==
X-Google-Smtp-Source: AGRyM1s39yK5JJAkekU4wNqk+ZpOHedE3O/SZnAHpuluDsdrw4m/HaK35Bv/RYgxUxOKAZjOdwEljg==
X-Received: by 2002:a65:6bcc:0:b0:3f6:1815:f541 with SMTP id
 e12-20020a656bcc000000b003f61815f541mr19170095pgw.183.1657621097724; 
 Tue, 12 Jul 2022 03:18:17 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902f54700b0016be4d310b2sm6472901plf.80.2022.07.12.03.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:18:17 -0700 (PDT)
Message-ID: <94b80b84-205f-616c-2706-ae67595bebf1@linaro.org>
Date: Tue, 12 Jul 2022 15:48:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/loongarch/op_helper: Fix coverity cond_at_most
 error
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
 <20220712080133.4176971-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712080133.4176971-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 13:31, Xiaojuan Yang wrote:
> The boundary size of cpucfg array should be 0 to 20. So,
> using index bigger than 20 to access cpucfg[] must be forbidden.
> 
> Fix coverity CID: 1489760
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index 4b429b6699..b05a0b7648 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -81,7 +81,7 @@ target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
>   
>   target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
>   {
> -    return rj > 21 ? 0 : env->cpucfg[rj];
> +    return rj > 20 ? 0 : env->cpucfg[rj];

Better using ARRAY_SIZE(env->cpucfg).


r~


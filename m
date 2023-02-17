Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF169B1B7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4SV-00045h-Et; Fri, 17 Feb 2023 12:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT4ST-00045L-9B
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:23:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT4SR-0008C7-MR
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:23:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 t6-20020a7bc3c6000000b003dc57ea0dfeso1455879wmj.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2wOF4H5RIHvnZj2IIar7QoxyOdikrouaRC/WMGfxlwY=;
 b=Ke5Pxec6YslZ2IFmepAT/hW2fS5IrdYE7H1ZDQWF9+cI+qEc1ue7AHUNPzJE+q5oAj
 PoN9V27VDjbUM0Jewn8SYH3XWqcJZJ+NkjbQDoUxbqvhaR5Fteg6z2iOKvbLK3mETQim
 Rn/RtClceFDqW8rPkBbiK5DauZEkaK++sI0MNE42H0m+5Um1etrshqVefkbVTKkRDxyz
 g043qflFs6bnaN9czCEZ7BnYzg25VmmTJP9uDODhk8tTWHBAhTdponWMdBbMKgIVcsol
 NLSPDRG0A+REUO7bdFcZCbJdwF00e9/0IACHj7yl9huETaCf5bZMLQEX2BfzyLNqeZQa
 jOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2wOF4H5RIHvnZj2IIar7QoxyOdikrouaRC/WMGfxlwY=;
 b=ZpcI5TmWAnpo+0d2gdd6nIBGKpFoClZna1QqZkDpvJxTd98vUx3OlNHljpfs0MwgsN
 V+YD05R7+Iu2ytovclHrnShDXXlTq2DmBdAgEw57nCZ+zVcbkDNIf/zk46qMpBSPzA26
 1WeCFVa2PYxq9SQtBUiJn2bxFbyD6vFHr+TRazzVWZ9a2Df9nv/NymIvnt6j+lnpduSC
 ogNjA5V/NBYWOdquMraHyguBl4NpaNUqiOukiPDQPP1lQzz5bKlHG4hkKXFk2ofl83Dk
 1wCAKRrYBbSH5UOIBAyMXtrKWyy/y35Pj/Wk8IED5X3SwInFZTf/PYoaahfxkoGHrpAp
 Uwsw==
X-Gm-Message-State: AO0yUKVAniphkwtclCQYQcUKiJk/m2S4c08mOEBd/VgH+sxYk5g9e7Sq
 /ZZEGInybW+Ki0KmLeqSJMd7YQ==
X-Google-Smtp-Source: AK7set99qrwq/Oss1mdOT1HYzKrvBvNVASzT2QEIWSCHZPYHcZADSmH9sPh1Ul18DvQbFuuoN5QhEA==
X-Received: by 2002:a05:600c:2e87:b0:3e2:201a:5bcc with SMTP id
 p7-20020a05600c2e8700b003e2201a5bccmr2212765wmn.33.1676654617357; 
 Fri, 17 Feb 2023 09:23:37 -0800 (PST)
Received: from [192.168.129.175] (217.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.217]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b003e214803343sm5489801wmk.46.2023.02.17.09.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:23:36 -0800 (PST)
Message-ID: <fa58c710-d362-c472-2858-b6bbe75fbcec@linaro.org>
Date: Fri, 17 Feb 2023 18:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/4] target/ppc: fix warning with clang-15
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216134911.6803-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 16/2/23 14:49, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert(0) definition.
> 
> Change code to g_assert_not_reached() fix the warning.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index cc024316d5..0a40bcfee3 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>           case 3: /* use FPSCR rounding mode */
>               return;
>           default:
> -            assert(0); /* cannot get here */
> +            g_assert_not_reached(); /* cannot get here */

If you respin to update the comments to match QEMU style (also
the // in configure), please remove this pointless comment here.


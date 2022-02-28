Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631004C7860
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:56:49 +0100 (CET)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlCS-0007MS-7T
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAr-0004YO-BL
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:55:09 -0500
Received: from [2607:f8b0:4864:20::435] (port=44880
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAp-0004KG-RU
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:55:08 -0500
Received: by mail-pf1-x435.google.com with SMTP id g21so5511654pfj.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Or2xiGpiNifEKCSrXGFoxQ+YLaNl0sjN2ZWHBffEPMk=;
 b=w80k9fn2YdTDRl/3+9evnr/T1HhX8DFaImKeig0CMr2JbqGk9zoWPAsVgHV0KnWmLJ
 U8kIHLQRJqCP20QLRoEK7zqMLjFw6Y+2ZtqJoo0vFO5AZHHuxz5lVigHWA4CCPuRQwR7
 BxWafHvDjax17j7WO2QliSSEj8uotCAd5z++E4EKYFFgpBJ2Nr2IiN7kIlosjPNJiVmV
 7/SrTM+TGGzcQgCy5hw5H3XUQMTb4BKtRc6uZQjHhRAsS47ag+kqXjQxYMlx1Qpt13t0
 OumCjxoC8u6sRzmUWsscOINPNB6Ztx9eWokYimgk/i1wzRDaEMTrkBtSwpcwX8motIGP
 mmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Or2xiGpiNifEKCSrXGFoxQ+YLaNl0sjN2ZWHBffEPMk=;
 b=7NygFhn8BS1ctgmt34Hy889c6OGcD3McYKsg818dCDWmlb8jJo3CwSHH1sC2ooumWv
 et2wINJzFDpqjdpaRVnL3e8EA3lKG3MqpQGA4senWMf7M+p2F1Pl4Mm+jygjEZEzpi+U
 ucu8y+TyLOzTkZiKp0+buSqKDbuZ21x3wHuzyeFdJmhz7mEX7jJRAwEV5rHywtpt4nAA
 Ok7x7U4EW0NPRsUnWyQyD/W4529dvGcxpnB39HDgFKixMhqH0GM/Q39mGL6isvTUVI4Z
 YnqtzjeZbDCzKahn/xDSJpGM0T+wvTYGHHFm7InES7nFBE4jqxx1DcrmJnmOU34ZsZSP
 yV3g==
X-Gm-Message-State: AOAM530v8X8Qzud0CFlfTFhvb7zt4Fp3JmcNPgPnk5RIk3+pA9DDLjZ2
 SNaNddcmPUpvpx5a3ooCt/AmWg==
X-Google-Smtp-Source: ABdhPJz8DBj4PHmV6j8rlFDmozAkDmH5/QLex4yrJ0eo5oLIoRE/r5IndJme0km/FfNOmuP67qKUXA==
X-Received: by 2002:a65:5548:0:b0:375:9f78:62ae with SMTP id
 t8-20020a655548000000b003759f7862aemr16738292pgr.390.1646074506524; 
 Mon, 28 Feb 2022 10:55:06 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056a00158500b004f0f12b320asm15240547pfk.6.2022.02.28.10.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:55:06 -0800 (PST)
Message-ID: <2e7ad1d1-e941-4399-5aba-aafc96e5e206@linaro.org>
Date: Mon, 28 Feb 2022 08:55:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 03/14] target/riscv: rvk: add support for zbkc extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 04:47, Weiwei Li wrote:
>   - reuse partial instructions of zbc extension, update extension check for them
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/insn32.decode              | 3 ++-
>   target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


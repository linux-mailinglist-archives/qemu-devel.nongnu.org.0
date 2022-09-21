Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2225C1896
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:53:26 +0200 (CEST)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3uX-0001il-5D
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3iH-0006iB-Bv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:40:45 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3i6-0007LU-9c
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:40:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id v4so6612185pgi.10
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=SJ4Cw71nXySarDHDXY0bEhwEYbNtL0f4apJSft06uWM=;
 b=VyxC9B5TVYLCjQT2lwx9BIOyCULoibM3Ce3zNaXfJiiaFw15W9oSNTFOOkXEm0IuzO
 j42rTkHF4QkBU52wzAa5pe5+Kbve51fj1kFfU4aax9o72OBRa5RGuHvrhNNXiIIZsvON
 urouj3JyGggVqY/5YF1DZyiOXpUzhIA+VJOhOc7HytQvK9N/ECX2tLGfZuH5JMeSjrcb
 Nx7CZsCLTGKUjEQ5GndDXliC8KNhVT0KOCHxle/S1Ywdc94eey4zyG0CsyEtTxVlj9AB
 f0ie4ammLnWp+92xJ/IPl0mj8sWIVNXXE8MQo9y6gnGJhvNfJMXSZPggr4VAI1zgf4mc
 47/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=SJ4Cw71nXySarDHDXY0bEhwEYbNtL0f4apJSft06uWM=;
 b=U/eI3OXEFpyG90/OMnYdWCEUaMYXpNqornaNQP+MJ51TCQocYg69WYYjzyMquMCBRt
 bbHcFoznEg6FAA66/Vi8m73R+gdKtmQzjn3L++iiZ8HohsqDk6e2uBH9o2u76eZXYsd/
 TbUjOIUHYrWxFYyMisUhba4GHOXzTBNMKGdMGBhowu0YHCm8Rqvw1MfiSzC+abwn7VyJ
 eG6Ce119TPI7TZKX/0m5ka9iVGeoe3BZc4BpVNOSVXOBBY4IALfBupEUOfj1YyVfAjT5
 mALdwL+40wkbkmIuvI2yUcquI4B99Do5S7vHqb+wx/XVdSFrQZQDoJpCuGqC/DcvnLBc
 mMqg==
X-Gm-Message-State: ACrzQf1ANAr/ip9dKUFPap35NS13jD/8ubsb/kLTn8Q7KVkarcbJz+l2
 evgbE9necF5yATVLSCqbrjg=
X-Google-Smtp-Source: AMsMyM40zlNqKjclBsUWz0MIpoEBovyFMx6koyOVZ2gOEzajj6FzS2a/Gn91TF4BsJA3C/LtP4MFRA==
X-Received: by 2002:a62:1e83:0:b0:545:6896:188 with SMTP id
 e125-20020a621e83000000b0054568960188mr30246854pfe.51.1663782031635; 
 Wed, 21 Sep 2022 10:40:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a17090aa50600b00200558540a3sm2124365pjq.53.2022.09.21.10.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:40:31 -0700 (PDT)
Message-ID: <568d71d7-a027-ab6d-2c10-5faf80ebd78e@amsat.org>
Date: Wed, 21 Sep 2022 19:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 06/10] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-7-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/9/22 18:07, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Coverity reports out-of-bound accesses here.  This should be a
> false positive due to how the index is decoded from MemOpIdx.
> 
> Fixes: Coverity CID 1487201
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> Message-Id: <20220401190233.329360-1-richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   plugins/api.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE0617B36
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:01:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXxj-0005tR-IF; Thu, 03 Nov 2022 07:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqXxP-0005sN-UU
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:00:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqXxN-0008OK-KH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:00:22 -0400
Received: by mail-wr1-x431.google.com with SMTP id g12so2153411wrs.10
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzJhXGmqHH3Z7zAemsOio8LZVch3558p6EGLPaYZKTE=;
 b=PPI68G8jPDszUmcuWf6NaNI8YvQXadWyyy0pON/NKpH3U0SW8VCMWwkUoh0oWJgYfy
 70i8ILtTlQxoPn7lSh1cpoczNOCfeo8NgQCXX3n1S7NOGDrViOOt99LjzIERbQ2WEAz4
 8YqpLhabWseAq62h2IBnlAZxeHMN2Pu8/saA1OPlknnOl4jMrkhx3tKt0wIahSfh734J
 3DPB59U1B6+HkGxCyJYqhqNLLEdrypCcwpMlPgHgfoZ+NoDZbSLUH9syITsaMIQE+AUe
 xhyPBWU9atk5rRbkeGnqbeOpmqdq9kUW3QIHbJhRg/OM33Em+4/K30qDnlh1sggSMt9k
 CZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzJhXGmqHH3Z7zAemsOio8LZVch3558p6EGLPaYZKTE=;
 b=Jb+6JwJTQjENYiFROxsurTy3XOs+SICuar6VfMxpi+hkRIW2Z+W4unR89Pp1iWDjCt
 LaCjnSbsVr7qGknUzMF1iwDpQgMzhjvLXpj2+kp6zag6N+ZwUcm8gdiBPzO+MynKQt1m
 BT8P2vhTD6T8gCePqkrQqpbeiW9cbozwx5foCbp/XtRMpLMjN0d76jqQCXC1N8/qcYwh
 CoxDLCq2PCJBUbB5pgb1OjodRius6RzgQlZegbivJgvxWyG1qH3sBb4aKHqrK9CoKzGK
 K38qgqwLmE6Eo8nfpTPvbKNIWRoGYj4lpUZr2XWZ5j38OHYS0Is0TEI2OTZ/fa/YpvM3
 uCTQ==
X-Gm-Message-State: ACrzQf2htMwvfdVF9t7bHFF+5g5C2jMiAxpzwIO2k7J1b24E/fP/LJch
 Brq8J+0LWaT1WVPubHpgWE52JQ==
X-Google-Smtp-Source: AMsMyM4VyCbMch0EgxsEbO82EBPyndsg3vMKvyQs/OvsYeneTFmJthdXLXvEbcnuDcf1Y4jXeiu71A==
X-Received: by 2002:a05:6000:1549:b0:22e:519e:f39d with SMTP id
 9-20020a056000154900b0022e519ef39dmr18263941wry.703.1667473219320; 
 Thu, 03 Nov 2022 04:00:19 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf894c05e4sm3557345wmq.22.2022.11.03.04.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:00:17 -0700 (PDT)
Message-ID: <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
Date: Thu, 3 Nov 2022 12:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
Content-Language: en-US
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-devel@nongnu.org
Cc: shan.gavin@gmail.com, liuyd.fnst@fujitsu.com, eric.auger@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20221103104716.179635-1-zhenyzha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103104716.179635-1-zhenyzha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 3/11/22 11:47, Zhenyu Zhang wrote:
> Since the amount of prealloc-threads to smp-cpus is
> defaulted in hostmem, so sync this information.
> 
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>   qapi/qom.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 87fcad2423..ac4cd213a7 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -576,7 +576,7 @@
>   #
>   # @prealloc: if true, preallocate memory (default: false)
>   #
> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> +# @prealloc-threads: number of CPU threads to use for prealloc (default: smp-cpus) (since 7.1)

The property is present since 5.0. Shouldn't this be "(default: 
smp-cpus) (since 5.0)"?

>   #
>   # @prealloc-context: thread context to use for creation of preallocation threads
>   #                    (default: none) (since 7.2)



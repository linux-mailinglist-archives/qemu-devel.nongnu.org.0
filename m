Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E53C1AAB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:43:05 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1arQ-0006EF-RA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1apn-0004tS-Qc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:41:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1apl-0007in-QO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:41:23 -0400
Received: by mail-pg1-x531.google.com with SMTP id y17so7547017pgf.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z9Iv/g3xTxdBUJXQlHEJasSJYthcKWFPz0yjeI6RdCA=;
 b=QiX/v6gTXvMGZeEhLqsKXT+Tw24CZB0jTGC+r0zkt7BU76kOe9tyo7RGJBpKwxyWA1
 6ZmpeXpgPEBpv9t+LJINWFaPzXaZL5N0+eLNbnVV0vFIiUSRXaJt3En+skfVz1wwBFfK
 /B7XlCetQgM55//lx1/ecT4W63fIAI6olSrXh3LB4LX7CaiE7u8egRXk6zHOHpwhI3pC
 v2CaTy/p4YsFoN+umih0fpNzF5ZATgcPF4ag6mU9G9MIxrn4G5MNJOfEi+DQs0UoP6am
 n/wYvkDAJsye6GF4zH2hG5Gy9vgFPJVXczmi7LgNBCNtqNtjo5ePCq/p7JdLNkBkisrz
 wAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9Iv/g3xTxdBUJXQlHEJasSJYthcKWFPz0yjeI6RdCA=;
 b=mD5HehDNj74FF7Hksh9hUvedh/ZGnDg0PXtWL+mFPDTSwHxyx5jFbc5c7JCxcNVm4z
 ek3taX+zz5HAXlGyeOYjq51zfpRxYASMwSeHQgqQjr8NXWngYrz7ZWLjJv7lNlznbUgN
 1GIKa4s8kMAo38Irnm6JmAsFnFRCdXxeaGEbZSim7yKgTxuPU1hNwCo5gH4shU8QQdpG
 G3atUQtnhfiwM49UnpTglyGPUeFBzysMvcxAzQ8wjExXvIl+NRAn5LZJuSgW0hA3sfMI
 q5UHn1w/DPu8mfihyT1zrKZiJchhYRM31FIcVdbdHwwgQYYACKTm2f918CBjvB0O6n9i
 F/Sw==
X-Gm-Message-State: AOAM531xcvs4Twn+vNc+CHAvcZwtD8qWIg2SaMo0wEsWxRX6M83QkEBI
 f9lZ2zC2hgd3paugXRqr+CAujw==
X-Google-Smtp-Source: ABdhPJz/66jx3DE04ZXsi4ssXACD7xPurCilvWaOPOeSWbNanrN/SZaA0buvFmoAXLgqd5Qao63IiQ==
X-Received: by 2002:a63:2446:: with SMTP id k67mr33614076pgk.360.1625776879893; 
 Thu, 08 Jul 2021 13:41:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s193sm3764210pfc.183.2021.07.08.13.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:41:19 -0700 (PDT)
Subject: Re: [PATCH v2 31/39] tcg/plugins: enable by default for TCG builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-32-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d9b227c-c7b0-2629-9adb-62824f0458c2@linaro.org>
Date: Thu, 8 Jul 2021 13:41:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-32-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> -The QEMU binary needs to be compiled for plugin support::
> +Any QEMU binary with TCG support has plugins enabled by default.

Not true for windows.


> +##########################################
> +# plugin linker support probe
> +
> +if test "$plugins" != "no"; then
> +
> +    #########################################
> +    # See if --dynamic-list is supported by the linker
> +
> +    ld_dynamic_list="no"
> +    if test "$static" = "no" ; then
...
> +    if test "$ld_dynamic_list" = "no" &&
> +       test "$ld_exported_symbols_list" = "no" ; then
> +        if test "$plugins" = "yes"; then
> +            error_exit \
> +                "Plugin support requires dynamic linking and specifying a set of symbols " \
> +                "that are exported to plugins. Unfortunately your linker doesn't " \
> +                "support the flag (--dynamic-list or -exported_symbols_list) used " \
> +                "for this purpose. You can't build with --static."
> +        else
> +            plugins="no"
> +        fi

I think it would be clearer for the code and the error message to detect static && plugins 
early, so that you don't confuse the --static message with the --dynamic-list message.


r~


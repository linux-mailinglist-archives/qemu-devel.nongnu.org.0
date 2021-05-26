Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BA39222A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:37:14 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1DE-0003so-Py
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm15F-00016d-7p
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:28:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm159-0004yG-TL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:28:56 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q67so1975124pfb.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ryMnYA4LImkd3dwzMaR8HpncL+9oZq5ZOo3NudBZLVA=;
 b=Jwr80nnRQodEc4akZrqbSMvBchH7SuFc3waiPFJM1QlVKBifmHlMxwT6YwliX4+vSa
 ItMIhSFd0V3i6hWHhV1xCA2SQo/9qZ4wEeZR+vLp8hqFIJ0BIOxcPppoWzIDQOV0iiEv
 g/fW7KMCd3bF23qyMh+ms0AY4iew20nnA+HLtZtqCp+2Hg3ZbgL0iZxR+IFItVkyA3XT
 rZGkBkoeRP0TBlig2OEhsK5hE3KlmXSnW0dAj2nrte4xoQKZI++EVYvOONOsTdGKop9N
 Mb+p0QVu6mgQ8BQTDZtJFdPF6r7wnjnYbpmbVghFE42UGCFUZMEYQ3+5HNEW0dzIFbUU
 RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ryMnYA4LImkd3dwzMaR8HpncL+9oZq5ZOo3NudBZLVA=;
 b=MC2kWERGVgdpCaVgHYLxq+mY4YQVYZHqwMKzdJySgLxAKfK5wr8evDijRSUSAYzqU9
 rrbtXdWvXfVngKfVMoO53pElYPhH/fuDUgsulL01tf4a7Fkpsc9sPefmDAH1P/sJ2wie
 UCaDu4hNmYyd8Bqgu1PdOvuQGR42CsULPVzN5htoT3BuyCX3/nZCz05fmfNJzKMwlTnX
 Y1WuXAUjwI+lt57PN6fip7of9UeYgVWJIleJ91rBX1r6MPUwElc+icvuufqQrgQT15ha
 PEDFXCyuBvpISyX/k3bVBY7yX+LJE7nH2i/Vcl8xuQIcfiimYlyEsnlTlUICzClUVmad
 0LSg==
X-Gm-Message-State: AOAM5331epPBrFrVEFTnQr8Cas1l4fLxfjIjd1k3W+2pQ9/LrVK41Lbp
 mFMpp09lq29geQTvY4WaPFbGKw==
X-Google-Smtp-Source: ABdhPJzEqt9lar1/+yQH5q2cPRAITslpj0SP5qM/S+Bqqwsoqx03MY0JTMAPA/nFUG+GN+ivzIByxQ==
X-Received: by 2002:aa7:8a1a:0:b029:2d4:a24:8967 with SMTP id
 m26-20020aa78a1a0000b02902d40a248967mr445812pfa.11.1622064530565; 
 Wed, 26 May 2021 14:28:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k1sm142087pfa.30.2021.05.26.14.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:28:50 -0700 (PDT)
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c9edbbc-8b28-ff43-2d91-2b57fba79fe5@linaro.org>
Date: Wed, 26 May 2021 14:28:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: farosas@linux.ibm.com, Markus Armbruster <armbru@redhat.com>,
 luis.pires@eldorado.org.br, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 1:21 PM, Bruno Larsen (billionai) wrote:
> Since ppc was the last architecture to collect these statistics and
> it is currently phasing this collection out, the command that would query
> this information is being removed.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>   hmp-commands-info.hx | 13 -------------
>   monitor/misc.c       | 11 -----------
>   2 files changed, 24 deletions(-)

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5ee..b2347a6aea 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -500,19 +500,6 @@ SRST
>       Show the current VM UUID.
>   ERST
>   
> -    {
> -        .name       = "cpustats",
> -        .args_type  = "",
> -        .params     = "",
> -        .help       = "show CPU statistics",
> -        .cmd        = hmp_info_cpustats,
> -    },
> -
> -SRST
> -  ``info cpustats``
> -    Show CPU statistics.
> -ERST
> -
>   #if defined(CONFIG_SLIRP)
>       {
>           .name       = "usernet",
> diff --git a/monitor/misc.c b/monitor/misc.c
> index f3a393ea59..1539e18557 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
>       }
>   }
>   
> -static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
> -{
> -    CPUState *cs = mon_get_cpu(mon);
> -
> -    if (!cs) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -    cpu_dump_statistics(cs, 0);
> -}
> -
>   static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>   {
>       const char *name = qdict_get_try_str(qdict, "name");
> 



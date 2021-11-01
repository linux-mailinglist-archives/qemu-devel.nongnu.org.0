Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6514419FB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:34:36 +0100 (CET)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUeC-0000Tr-3p
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUSK-00005E-Kl; Mon, 01 Nov 2021 06:22:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUSI-0000Gt-Ii; Mon, 01 Nov 2021 06:22:20 -0400
Received: by mail-wr1-x431.google.com with SMTP id o14so27319336wra.12;
 Mon, 01 Nov 2021 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Aqdk8VTyGjb6Wg2A3/1ygS74e9OuceuUnGMfmfjCvRM=;
 b=PFHMh1uzkYImy5FkBTQDxwq6E0/dsLSm/33wCEC370vO0h8+Xt7ULKZiE2CUr7mbfg
 vukX9kl/Nowdxrp/V5s04G2AJ6K2BbegSABSik+nJfpxw2KVQ3xh6V25lsz2+slKH5Tm
 MzsXcxF5wQxQfzPJLrvZSkOBgQWEKXdwGJUeR329bf07awrKNAzdWLSsK7D7HKo+S+7L
 kPL2H5Yxpd17fWnt45UspfZsBT/JHnswq4AnkNRhUVU+Y0h/PV/KjmKQRph55WlF18bJ
 3FuSDBv3nlM3WK7+YpG7cmj0raMKco3kKlcLoIuuuycp1fp3jRZvrlytwRvufUNRR2n9
 8gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Aqdk8VTyGjb6Wg2A3/1ygS74e9OuceuUnGMfmfjCvRM=;
 b=pZNfTtcwr9gDhVw527x9orvJAhnUNH7DF6Mex1efDjndFf9SWk90yFv3MlhWbznSTl
 HaYnvi7eh8fRkLRQ6djLScMS4gaXPN22IdBWxWX4xYAoJaQi12EmU/0vJ2beyVQ5+ijw
 VxEuq3RC02STDnmTaGNadcn3iEqAjRS3/LcbIcJ3BProKYx0fq3/R7yTLdWI4ew/qsHm
 y+QadUPM8rTPN2o9JMJ3oomSToqA2AdipCkUkRYPUmaFED37+aEIzUDllZm5nVu0gdq9
 ENnpuVYPb5kLWQ8SB4UBH5ZRLSElOp+TvHOsvkRHpN4j7WUFdON+AkkMv0FnBsjoL5vQ
 oqgA==
X-Gm-Message-State: AOAM531PpXU9FSdLG+xzYgMMNJxQ0a4YhR9qCi8yN1PDG5NwwV+UPfMj
 etA2vMNqOvdsWyCuqjmHUQSdtxU4UZU=
X-Google-Smtp-Source: ABdhPJyYPwWp15IV0KFbXceyi9v2N0H9HkfTiClqYBITq1H2ebFqJ8WK8btn6i3rVXC7Q6hktmq/ew==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr36064662wrs.251.1635762136555; 
 Mon, 01 Nov 2021 03:22:16 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f20sm14673854wmq.38.2021.11.01.03.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:22:16 -0700 (PDT)
Message-ID: <530b7d0e-9290-c78a-df50-7ef297dbf0b6@amsat.org>
Date: Mon, 1 Nov 2021 11:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] .mailmap: Fix more contributor entries
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211027043254.1248097-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027043254.1248097-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.592,
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
Cc: qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 Hyman Huang <huangy81@chinatelecom.cn>, Haibin Zhang <haibinzhang@tencent.com>,
 Alex Chen <alex.chen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can this patch go via the Trivial tree?

On 10/27/21 06:32, Philippe Mathieu-Daudé wrote:
> These authors have some incorrect author email field.
> 
> Acked-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Alex Chen <alex.chen@huawei.com>
> Reviewed-by: Hyman Huang <huangy81@chinatelecom.cn>
> Reviewed-by: Haibin Zhang <haibinzhang@tencent.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Patch fully reviewed/acked.
> ---
>  .mailmap | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.mailmap b/.mailmap
> index f029d1c21fe..8beb2f95ae2 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>  # git author config, or had utf8/latin1 encoding issues.
>  Aaron Lindsay <aaron@os.amperecomputing.com>
>  Alexey Gerasimenko <x1917x@gmail.com>
> +Alex Chen <alex.chen@huawei.com>
>  Alex Ivanov <void@aleksoft.net>
>  Andreas Färber <afaerber@suse.de>
>  Bandan Das <bsd@redhat.com>
> @@ -99,9 +100,11 @@ Gautham R. Shenoy <ego@in.ibm.com>
>  Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>  Gonglei (Arei) <arei.gonglei@huawei.com>
>  Guang Wang <wang.guang55@zte.com.cn>
> +Haibin Zhang <haibinzhang@tencent.com>
>  Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>  Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>  Hervé Poussineau <hpoussin@reactos.org>
> +Hyman Huang <huangy81@chinatelecom.cn>
>  Jakub Jermář <jakub@jermar.eu>
>  Jakub Jermář <jakub.jermar@kernkonzept.com>
>  Jean-Christophe Dubois <jcd@tribudubois.net>
> @@ -135,6 +138,7 @@ Nicholas Thomas <nick@bytemark.co.uk>
>  Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>  Orit Wasserman <owasserm@redhat.com>
>  Paolo Bonzini <pbonzini@redhat.com>
> +Pan Nengyuan <pannengyuan@huawei.com>
>  Pavel Dovgaluk <dovgaluk@ispras.ru>
>  Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
>  Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
> 


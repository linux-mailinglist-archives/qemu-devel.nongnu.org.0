Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579D4FAA1B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:15:00 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFbv-00073b-3m
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFaB-0006DU-R8
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:13:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFa9-00085k-01
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:13:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id be5so4655745plb.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rRPxEgwcJ3oWKHXb9mESMq/3LvO0S26tuvaC6anwg9U=;
 b=bQtjQedDAMYO1xEgNlHlG1oJfRVTV2i+Kvs6+m9qy39YU45Z6vIWwWds+e7xshbT9c
 GQdJAdJ6RwSuWcvRBOpDsWqRfqBBUMWbFjo2RwWHAEBrcdx7HNnqMObw4biuwoHhAZsF
 zAaf57I4F6mPXSmUGipS72n/C0fl2tyixhy6P2AWgrTswuo+8c+eSbXE04GwGVQoNn3J
 qY7y4zF7QTnLRRSWcbUKr7nX8sKy5CsT9Mdx5fRCdYfBN2gOSu8DQC41gBFB6zL0TDnd
 dDVT4L4tu19BtjnVmIRALmXnD9dig/3aUO4laIIAP52t7Wrf4N8WyjwQAcFT4UFbnype
 VzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rRPxEgwcJ3oWKHXb9mESMq/3LvO0S26tuvaC6anwg9U=;
 b=n1t1ocxFXiHCMH1EvkD6yfjMnzmTVATh3vhvIOa1YHSQacphgmlSv8Fzhy7kaLybSv
 MhcizMvmJyrjAsRN6a4p+Bc0Y1rhUfdXQS+opE9caeZnwXb0v/qtU7NqhBFyNYunn91y
 PfO5yzCThe7lj/D8gw6EZNIDpMZl09yBqnQpM6OirPQQurq0Se8qR3YVQZaCi0OfG5eb
 n6cSJDDcQnj/OupHsemonDe0984yeaH1cvWCn8j2ZkYxtCDkz32eIjEZTGQMNtSH78BG
 YMtGMmihRzJjwL1GiRDs27zT4zprlscUju9kbL5hPrHS9ksCEmpRhZdT0NNQ24/7HE5+
 RWbg==
X-Gm-Message-State: AOAM532glhPd03ZemSPQtY0AUAH2Gbou6H4Mj31nEFwwrVONcxgQeSSr
 5P3qUn7ddhNk6tCFDNNaYSPW6Q==
X-Google-Smtp-Source: ABdhPJwiDnwCFhx5tXAe/jcCwcD83Mp8kxSoViBwq2ZIh5bhuHofVEykzL9QxfrCIEuMkAmXMliVzA==
X-Received: by 2002:a17:902:ec89:b0:156:c5db:356d with SMTP id
 x9-20020a170902ec8900b00156c5db356dmr24734182plg.74.1649527987477; 
 Sat, 09 Apr 2022 11:13:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6300cd000000b0039940fd184dsm16523171pga.9.2022.04.09.11.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:13:07 -0700 (PDT)
Message-ID: <9016c2e2-b665-686d-43db-b80f0a6344b1@linaro.org>
Date: Sat, 9 Apr 2022 11:13:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 16/41] hw/intc/arm_gicv3_its: Implement VMOVP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMOVP command, which updates an entry in the vPE
> table to change its rdbase field. This command is unique in the ITS
> command set because its effects must be propagated to all the other
> ITSes connected to the same GIC as the ITS which executes the VMOVP
> command.
> 
> The GICv4 spec allows two implementation choices for handling the
> propagation to other ITSes:
>   * If GITS_TYPER.VMOVP is 1, the guest only needs to issue the command
>     on one ITS, and the implementation handles the propagation to
>     all ITSes
>   * If GITS_TYPER.VMOVP is 0, the guest must issue the command on
>     every ITS, and arrange for the ITSes to synchronize the updates
>     with each other by setting ITSList and Sequence Number fields
>     in the command packets
> 
> We choose the GITS_TYPER.VMOVP = 1 approach, and synchronously
> execute the update on every ITS.
> 
> For GICv4.1 this command has extra fields in the command packet and
> additional behaviour.  We define the 4.1-only fields with the FIELD
> macro, but only implement the GICv4.0 version of the command.
> 
> Note that we don't update the reported GITS_TYPER value here;
> we'll do that later in a commit which updates all the reported
> feature bit and ID register values for GICv4.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 18 ++++++++++
>   hw/intc/arm_gicv3_its.c  | 75 ++++++++++++++++++++++++++++++++++++++++
>   hw/intc/trace-events     |  1 +
>   3 files changed, 94 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


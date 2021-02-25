Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBF32519C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:39:31 +0100 (CET)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHne-00031v-KJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFHm0-0001Xl-Uu; Thu, 25 Feb 2021 09:37:50 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFHlr-0007Nq-NX; Thu, 25 Feb 2021 09:37:47 -0500
Received: by mail-qk1-x72c.google.com with SMTP id z190so5764106qka.9;
 Thu, 25 Feb 2021 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0gHWZYftpu/mTcDDol08+FG2sXIT/gOPnrl8ZzguuZ0=;
 b=FP7oAAF981F3d5QuriNB4813Osin8u5pgvQbnXayR9LuYwSzBSxiNu9PHoXgBYVzkV
 mrbW1ShiZ+h91YfdxMi12AR+3FNNbH5l6g0dTZwhtwKHd48eqsJOyIgfyJmA5UbG7jD+
 M9/2QAR4YymkR9GNIG/oFd8ER3cYhZA8/mqKHJ4/Y/JKpmSV5GAYmRU8bcmK1bey8Gk9
 I0g3cPIcWyc1jbDxkb25dr2ViVmSg/9wgrM8XST0i8QG2W6moRBKQ4+cnKxtG6hsWHKc
 L9r8Nw19ZNPMegX1bWeP04CWHYnSqGDf/lO61esbTLTUSCt/CrYoGi2vx5/GXq/Oi7f0
 tnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gHWZYftpu/mTcDDol08+FG2sXIT/gOPnrl8ZzguuZ0=;
 b=oEIeiUolP9b/T80RhMshN3Kqyz/czrqjKa0fAYgLscHxBr4ZKqxhP57kHqg4CyaCla
 pLmEAgzqE9gT+tSmKYvZmV2Stn3xdjx7J5iLYBYZmiRxzKC7BVdmKVQQP4ZsTLfnESB3
 9Bf7Fg3ZHvhdfusfsESPxh++/1ibyVok0+s1xI6fLb7U+qt37JyHNqZKTaqCw3mTPQWx
 rrBM0n9EM4sv74Uky0wXmaqt8CEY3SUAbfAOMjUfxz41hJnqxuhwC9sN8ssRyrEqPgUK
 FPGlD6IXMqd3g69PbnoUcFx0WdHbUHiwYW9jl4Y7enUVGMQuD6yKSJ/xxhfiHBjAsOZF
 01kA==
X-Gm-Message-State: AOAM530QpXp7bw5IFrjae8NJZwuGL4IQ18oErkkGmKpSyhPKZtOfQE27
 /GL5RqZxzuTUaZrg5gUze6VNmRdUGq70+w==
X-Google-Smtp-Source: ABdhPJxoZ97xHEP3s4caaj5RXzOhqTyqjIMLqEl+Kh6sSEiZLQVYqOkpVSSRmTNW56547RSpi8Jihw==
X-Received: by 2002:a37:dc41:: with SMTP id v62mr2733453qki.457.1614263854918; 
 Thu, 25 Feb 2021 06:37:34 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1?
 ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id d128sm3983145qkb.44.2021.02.25.06.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:37:34 -0800 (PST)
Subject: Re: [PATCH qemu] spapr: Fix typo in the patb_entry comment
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20210225032335.64245-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <1868bae2-2c31-7052-11e6-660e25e5cbbe@gmail.com>
Date: Thu, 25 Feb 2021 11:37:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225032335.64245-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.435,
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/21 12:23 AM, Alexey Kardashevskiy wrote:
> There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handler
> for which is still called h_register_process_table() though.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ccbeeca1de84..8dceace4b442 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -168,7 +168,7 @@ struct SpaprMachineState {
>       SpaprResizeHpt resize_hpt;
>       void *htab;
>       uint32_t htab_shift;
> -    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROCESS_TABLE */
> +    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROC_TBL */
>       SpaprPendingHpt *pending_hpt; /* in-progress resize */
>   
>       hwaddr rma_size;
> 


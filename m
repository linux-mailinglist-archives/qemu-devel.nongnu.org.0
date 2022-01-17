Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727E490902
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:49:37 +0100 (CET)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RRz-0005Pc-I5
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R8W-0006kO-K7; Mon, 17 Jan 2022 07:29:27 -0500
Received: from [2a00:1450:4864:20::334] (port=43540
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R8V-00081h-7h; Mon, 17 Jan 2022 07:29:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so20163830wmj.2; 
 Mon, 17 Jan 2022 04:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EbFpMn4ZN9+tA5q1tjlgrdMpTZqE9EWZ2ycdfSkGbcY=;
 b=d+Kv7mQ4gnyOIh98oZCUO5msojK1Uhx9hL2pKbP0OFDU2y3Kadkv1SFmQKaltnuvJF
 TPnrCRlHt+xkLPxrfzadk8h8Rcrt6oSHNER1f3SBBkSY/4EHmzGetW4HWc9HSA/P0MCh
 df7I+XYDC0J3ICW6pC40H6FnsGiTxO7I5r0SgTw4jCY0qY5lzl7iLoQWcMlchcq5L43E
 a1xecCgugdrTUJbJV+JNJw0i35OJ5joJeEDTBtzSydheeBfYCkofUCzkDwSPPpmDiHTe
 7/0eaq1rxc0XsRbhQ0Ai+ISXLnsAZ+GCLsXFraAibwU5JMousS6Nvw0tqoRWfbERJQuR
 Gp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EbFpMn4ZN9+tA5q1tjlgrdMpTZqE9EWZ2ycdfSkGbcY=;
 b=mlojglq9SURP5UlIyK2oW3Vgsz0ZtDE6iGxRSUJVIlCnSl9QJIWVchSSdsMDfQ9YCI
 7N7dCvXBLLOlprv3F63NlaNrm5Dk0pif1p/6SbuKVTY1xBDfOik5GyfaK56h5JtXYAN3
 8f5jEalzNM44Nf0vYH/EsXvCw0DMone3flCyKdElUqxOHdYei+6pcTQDYhbIE2MrrJFN
 9KGOJc+3/jGe8tkE0tFmBR1pt7x5nmLqt7R1H54kl4zR8yDyNky9mTAZGJLh8UD2mSyS
 zJZm+GnbRUrb0pi/WSjjpNLJAShTn51Ozke0yEo1PZ6kX/zwSsRZaSlY40V25cJ7ZYnu
 EOpg==
X-Gm-Message-State: AOAM533moCLIDAXfNJwG2UVj1bZyNlXmTX9iM1hddHzXXwUFiG2MHv7d
 aqGN45gxzVGbVz42Vw/Dc6Y=
X-Google-Smtp-Source: ABdhPJwEGprV4SAf4wkm1JoSmA7T518wmb0VvXL/Mw7v2y5JZmDzlQxMlAGEcoqE8K3HB+G7kBTXaQ==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr20245753wma.79.1642422561234; 
 Mon, 17 Jan 2022 04:29:21 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v3sm13810540wri.4.2022.01.17.04.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:29:20 -0800 (PST)
Message-ID: <9f9d83eb-02d7-bd5a-e72e-62427b785253@amsat.org>
Date: Mon, 17 Jan 2022 13:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 6/6] docs/devel: add some clarifying text for aliases
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-7-alex.bennee@linaro.org>
In-Reply-To: <20220110175104.2908956-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/22 18:51, Alex Bennée wrote:
> We do mention the limitation of single parenthood for
> memory_region_add_subregion but lets also make it clear how aliases
> help solve that conundrum.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/memory.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 5dc8a12682..69c5e3f914 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -67,11 +67,15 @@ MemoryRegion):
>  
>    You initialize a pure container with memory_region_init().
>  
> -- alias: a subsection of another region.  Aliases allow a region to be
> -  split apart into discontiguous regions.  Examples of uses are memory banks
> -  used when the guest address space is smaller than the amount of RAM
> -  addressed, or a memory controller that splits main memory to expose a "PCI
> -  hole".  Aliases may point to any type of region, including other aliases,
> +- alias: a subsection of another region. Aliases allow a region to be
> +  split apart into discontiguous regions. Examples of uses are memory
> +  banks used when the guest address space is smaller than the amount
> +  of RAM addressed, or a memory controller that splits main memory to
> +  expose a "PCI hole". You can also create aliases to avoid trying to
> +  add the original region to multiple parents via
> +  `memory_region_add_subregion`.
> +
> +  Aliases may point to any type of region, including other aliases,
>    but an alias may not point back to itself, directly or indirectly.
>    You initialize these with memory_region_init_alias().
>  

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


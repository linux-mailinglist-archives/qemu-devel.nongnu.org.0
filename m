Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C774922D8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:37:38 +0100 (CET)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kvp-000184-Ih
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:37:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ktj-0006lr-Jl
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:35:28 -0500
Received: from [2a00:1450:4864:20::333] (port=34715
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9kth-0007jr-Q6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:35:27 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1746736wmb.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5qTS0PewedjZdP5LdBjPH864s4haQUOY1NDXbQDw81c=;
 b=RotvAX/2Agm4PXcRgQsx7fjjv/y5Dygo21wp7kFXyEGRta12qb+jMB823pEDylmSSs
 J7H0VJbuZP9owD8Dnkh53V0IpDb0W17XMDc3E6NAjPFQWQH30Z31Jw1kpV96pqf/zn2r
 7O4Adeg2HWYd2JL7qqgyq94D0tXXXAVZCK4BmW9TcmvJL9munvnGfT1pDepBWqnp/1wF
 LvrEdevoYc/naEz/7ObrSLmmubNfLUkQxmdJsPyPRAOnq66pBeEPRGfp8ZMzGin+IubG
 ayqZfISWNYfpgOB9oko/WH1fYvQF6s06PtrF65xi40gFltvQly97ZwFD8X8U3bkxDdnG
 NTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5qTS0PewedjZdP5LdBjPH864s4haQUOY1NDXbQDw81c=;
 b=DAG9mOExqUJBAgOrkIgi8DBNoh6FF39+oZVg9Edkm6W8mzWv9LelsxsHvmO+J1LtEt
 +MvonHW0INBdOmqHHhRKzFDy9ufrUCnOF8QakrBSREPvlco/NHiTyt1bZUG+9HZfSiEk
 ADT4TV+eHEbPnr1VFdTUSrk/FJEypaTchXx0r7cAigs51Qv81jmx64sxBuw8EDEHldXC
 FeNxMkn/tj50ycLqUiSNwkz6EiwHqQr+AKglSX1RyzzDDyV9IcxCV4oS6QjrQ7VV63gr
 nJaelw24TF8Q+nOixFCZgjRyUJIjBWG7y3dbO590IytwdbmBfr/IqRlFOhc04vp/aRIu
 Tlcg==
X-Gm-Message-State: AOAM5333ssXnc2/WqhX6pFtehqNdIiQkXoN9TQ3mnQXmacR/WNDK70Dq
 20Tm0MUIObo1GuaD3EdQzFacbzUhVOE=
X-Google-Smtp-Source: ABdhPJxOEzVNxxxpBvxVaumhFPlGzyCzC3uSkEBfjFNjdITLWG5F1zqnX+OP/eSd5NS+YdLD+RcRWQ==
X-Received: by 2002:a5d:644a:: with SMTP id d10mr24178758wrw.355.1642498523625; 
 Tue, 18 Jan 2022 01:35:23 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l13sm1942627wmq.22.2022.01.18.01.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:35:23 -0800 (PST)
Message-ID: <648704c3-5859-81d9-3e31-2d642b16001d@amsat.org>
Date: Tue, 18 Jan 2022 10:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4] memory: Directly dispatch alias accesses on origin
 memory region
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210418055708.820980-1-f4bug@amsat.org>
In-Reply-To: <20210418055708.820980-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 4/18/21 07:57, Philippe Mathieu-Daudé wrote:
> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> regions"), all newly created regions are assigned with
> unassigned_mem_ops (which might be then overwritten).
> 
> When using aliased container regions, and there is no region mapped
> at address 0 in the container, the memory_region_dispatch_read()
> and memory_region_dispatch_write() calls incorrectly return the
> container unassigned_mem_ops, because the alias offset is not used.
> 
> Consider the following setup:
> 
>     +--------------------+ < - - - - - - - - - - - +
>     |     Container      |  mr
>     |  (unassigned_mem)  |                         |
>     |                    |
>     |                    |                         |
>     |                    |  alias_offset
>     +                    + <- - - - - - +----------+---------+
>     | +----------------+ |              |                    |
>     | |  MemoryRegion0 | |              |                    |
>     | +----------------+ |              |       Alias        |  addr1
>     | |  MemoryRegion1 | | <~ ~  ~  ~ ~ |                    | <~~~~~~
>     | +----------------+ |              |                    |
>     |                    |              +--------------------+
>     |                    |
>     |                    |
>     |                    |
>     |                    |
>     | +----------------+ |
>     | |  MemoryRegionX | |
>     | +----------------+ |
>     | |  MemoryRegionY | |
>     | +----------------+ |
>     | |  MemoryRegionZ | |
>     | +----------------+ |
>     +--------------------+
> 
> The memory_region_init_alias() flow is:
> 
>   memory_region_init_alias()
>   -> memory_region_init()
>      -> object_initialize(TYPE_MEMORY_REGION)
>         -> memory_region_initfn()
>            -> mr->ops = &unassigned_mem_ops;
> 
> Later when accessing offset=addr1 via the alias, we expect to hit
> MemoryRegion1. The memory_region_dispatch_read() flow is:
> 
>   memory_region_dispatch_read(addr1)
>   -> memory_region_access_valid(mr)   <- addr1 offset is ignored
>      -> mr->ops->valid.accepts()
>         -> unassigned_mem_accepts()
>         <- false
>      <- false
>    <- MEMTX_DECODE_ERROR
> 
> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
> 
> Fix by dispatching aliases recursively, accessing its origin region
> after adding the alias offset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  softmmu/memory.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Queued via memory-api.


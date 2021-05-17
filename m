Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACFD383BFB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:12:26 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihj6-0002tO-Jd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihZI-0002u5-5s
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:02:16 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihZC-0007iG-7Q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:02:15 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so6310238oth.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KCmaOQqQBkoxzhdjiJ1S1e9w7H8tcqvOCao6PsvgJOA=;
 b=xnKLx7j7hQpqRyuoMt33ek2T8iZRH/ly/MN78ubdXbVDM3EAnaEjdjnd/Enuwx9GUv
 5NEGqLReI9zcFUPujlYs6ebza//Npflhp1HWjHA0JvnG0ZmOISvSqccTn5y1DB6QFXS0
 n3TCRQ2knMjB1lBxVvThHFxK/oTa+wvhsZltjVMD2i02HIc/EJyYQsINvqN3HxH3eHf6
 nwsIdzYKxT5oMLC8Bsz2u9jTigU8LL+RVi30LxoK/3X3ojfDQ7F8mmU/U3FLH7snD+J4
 86uh7XA3oEMcMsP8s7sj/jyL1PHPW2hvAJNYhW1TPEYPJ73Lyb2vPW8jSwI5ZDSdGmTC
 VWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KCmaOQqQBkoxzhdjiJ1S1e9w7H8tcqvOCao6PsvgJOA=;
 b=kHXBbPY+4ka4R3ccnZKewaEDN4NT6vxh4RKdxPc1h2sX1qXpt+uRMfEhwkumiqd4pe
 fst31vLBq5MbEYtgM6+MxceuPIFCRuVmbuPQ7cNd8CV4Re4ohJBHYV+BFv8RyJ04Cgsm
 SxIrODWDGdA8HL1/D91DyvxobQjzaW5FJNg5H0lbleTQ7BnkPaWjC0jmBrqS5kYh8bhF
 R2T3iWplb3KDdn/UxpHRBs4vsOT4AUpnEgvx5BUMhDfXHnMj66GOebGDjoytti2fopX7
 ovQJoyDNDsLT07ef1fFb4XqqkDnTyZutg2GgK3800dqBQ8lMGMMNCJUf5vYFPIW3eUc/
 zdmg==
X-Gm-Message-State: AOAM530Ldf8S83qeANmzlBVL1k3skiwuseJoml0X43Q2hwzo/XuzneF1
 dmMppHGNOFcBl7W+F+gJ3qhSeg==
X-Google-Smtp-Source: ABdhPJw353snyfzlArMGZSEIQyejSqFCn4dBQ/1VvSRpYjMzV6ccXcUSrSEm0m3+/YwQ9HH/+OODgg==
X-Received: by 2002:a05:6830:1196:: with SMTP id
 u22mr644436otq.247.1621274528012; 
 Mon, 17 May 2021 11:02:08 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id f9sm1793642oig.31.2021.05.17.11.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 11:02:07 -0700 (PDT)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org> <YKHpy53AwM8tTy3E@yekko>
 <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88f58334-8bae-a9bd-aac0-aa20d432595f@linaro.org>
Date: Mon, 17 May 2021 13:02:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <06d4250b-4d4a-42a6-47fa-f5b75ea6c499@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 11:59 AM, Lucas Mateus Martins Araujo e Castro wrote:
> I'm not completely sure how this should be handled, there's a 
> get_physical_address in mmu_helper.c but it's a static function and divided by 
> processor families instead of MMU types, so get_physical_address_* should be a 
> new function?
> 
> The new get_physical_address_* function would be a mmu-hash(32|64) that do 
> something like ppc_radix64_xlate and add a function to mmu-book3s-v3 that call 
> either the radix64 or the hash64 function and also handle real mode access.

The entry points that we are concerned about are:
   ppc_cpu_get_phys_page_debug
   ppc_cpu_tlb_fill

Currently there is a hook, pcc->handle_mmu_fault, which is used by 
ppc_cpu_tlb_fill, but is insufficiently general.  We're going to remove that hook.

We're going to add a new hook with the same interface as ppc_radix64_xlate that 
will be used by both ppc_cpu_get_phys_page_debug and ppc_cpu_tlb_fill.

> Also should the tlb_set_page calls in *_handle_mmu_fault be changed to 
> ppc_cpu_tlb_fill or the function should themselves fill it?

Only ppc_cpu_tlb_fill should call tlb_set_page.


r~


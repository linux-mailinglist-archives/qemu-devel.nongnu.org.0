Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284A3800FC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 01:45:28 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhL1C-0000W3-Mh
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 19:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhKzw-000863-KU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 19:44:08 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhKzv-0006oh-2o
 for qemu-devel@nongnu.org; Thu, 13 May 2021 19:44:08 -0400
Received: by mail-qt1-x82a.google.com with SMTP id j19so21089121qtp.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 16:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PC6YG1b7gIc4z55bg0WA4ulLykSWFTmmGJ3fe36f+wQ=;
 b=nZMu3bsLYy/dTFpccSneoBVc602m5af8moZsub1GPYrqsCx1uGKGPnn+qra33gO90g
 eT9+Boft0R/XmXwCuF+PmN/Dfv9/ptI5WhtJ2+6q0Stwr3N3tnNxxol6bv7ab26INA2r
 eP5uJ87Lj+LWwRZx+F117P+0QfTmzG4TFHtROrtY6Z8vTqsICZ9N/X9DCwvJh52sIUuY
 zGkWlGnnTgOvai6Jl3ubc+bFHTrRmfCwLAJr32PAbq/3APHr7w5pmA9JcZKvyjQJC8QG
 dF+CYl2gCYzNzPbXuJ1IP6uLPidmlydrpAVoJrMZR4/Z9i9IhyD2WKCq0qPb5bUnrG62
 TkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PC6YG1b7gIc4z55bg0WA4ulLykSWFTmmGJ3fe36f+wQ=;
 b=RzOOk6aZcMIDx9WbGH+5fpcAJOdjm2mUbU/jZ1IJnVSMBEGpwo7LjGDRiEijpf1KEG
 k8bZxAt3DzFceMcnigZRFZv7SldhFhJRRCTQ0w5JgXk+Ax7bmH/NBpRCfku8X5DgOuED
 qtaGxC8SkBrR/MW5aGTjBL5fQUkxLBnInT+HXlxzOMatH/dOTEarpkeL/BzEynHy2cxv
 vQ7Bx2kjdZp5ZLk0ENgt5jBSiFOdB2zULdl+Wj6SewGgiYIvBldhZZNm0N68iT5EW7QX
 3xFcxKZcRf/tnpdfRvGVjs+ZUj+KQzFD0k/1ZiYQsKFXkl/Mq6cSLlg+ToCrot35T7Hb
 u/VA==
X-Gm-Message-State: AOAM5320xex0SfzMME3Askseh+HTtJV46crQ+n1Q6GKAwc/IXohvy0c8
 Axsb9XGDfK/tIKae6J+2wqWXBg==
X-Google-Smtp-Source: ABdhPJyBk1OGEVBA0Tdatm4vBDOvp286pMrnIfTq5J2j7lmiPgLQDXihwWMjH6B8IYKBYvmAbFcGvA==
X-Received: by 2002:ac8:a49:: with SMTP id f9mr21882857qti.157.1620949445204; 
 Thu, 13 May 2021 16:44:05 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id v66sm3426764qkd.113.2021.05.13.16.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 16:44:04 -0700 (PDT)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aad60a0c-1f07-24ab-821a-193047e4ad2e@linaro.org>
Date: Thu, 13 May 2021 18:44:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 9:03 AM, Lucas Mateus Martins Araujo e Castro wrote:
> tlb_set_page is called by many ppc_hash64_handle_mmu_fault, 
> ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of which from 
> what I've seen are only used inside #if defined(CONFIG_SOFTMMU).

tlb_set_page should only be called from one place: ppc_cpu_tlb_fill.  The other 
functions should fill in data, much like get_physical_address.


> So what is the 
> best way to deal with these tlb_set_page calls? Should these part of the 
> _handle_mmu_fault functions never be reached or should these functions never be 
> called?

There is some duplication between get_physical_address* and *handle_mmu_fault 
that should be fixed.

What should be happening is that you have one function (per mmu type) that 
takes a virtual address and resolves a physical address. This bit of code 
should be written so that it is usable by both 
CPUClass.get_phys_page_attrs_debug and TCGCPUOps.tlb_fill.  It appears as if 
ppc_radix64_xlate is the right interface for this.

It appears that real mode handling is duplicated between hash64 and radix64, 
which could be unified.

You should only call tlb_set_page from TCGCPUOps.tlb_fill, aka 
ppc_cpu_tlb_fill.  TCGCPUOps.tlb_fill is obviously TCG only.

The version you are looking at here is system emulation specific (sysemu, 
!defined(CONFIG_USER_ONLY)).  There is a second version of this function, with 
the same signature, that is used for user emulation in the helpfully named 
user_only_helper.c.


r~


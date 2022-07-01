Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5993563B4A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 22:55:41 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Nfw-0002gc-CZ
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 16:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7NeM-0001KN-AK; Fri, 01 Jul 2022 16:54:02 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o7NeH-0005ib-Ts; Fri, 01 Jul 2022 16:54:01 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so4998823fac.13; 
 Fri, 01 Jul 2022 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LRPHeTgNPiALlc1TEvb++aw+UKCMOuybRcY9XKg4FrE=;
 b=VvogDpxvfGexScaG5np/uEes45ebx6M3xviL2zdwR3WImDh6NFaVN9lnPCYOr2R51Z
 Oh04vrbfCY30v04VFkO2MErTiF8NN/lJJORJ22XtMjl5Niv/JBvwI3gQs8BDNYtzupeB
 JIwH4LKns/4dV3jNJNiTAtNrKs/D+EslWOXt1UBxSL1EzDAENFCSi9kNEjvhiSSsJWVL
 BI3gEssV1Gz3dznp8o0X0XZKFOc6kX+TJ758SNaBXrWPMHAzvgmaO4F7IjpCyHIG8HfN
 mSrqOF9IDXdnC6QRYr8xLmRRwpW9Ljkd7EaOFsfBUa+/itWJCRsJ73XdnIdlB7PG++T/
 SWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LRPHeTgNPiALlc1TEvb++aw+UKCMOuybRcY9XKg4FrE=;
 b=ZOErvPXhPsP3SNhMFbKRhuHefP7+4OavLVwASyfFm8pQE6OGcK+mlqe74HjzH4RFdW
 6jekXAQEaj3dD4DIsqQhe3218z4sASnbut3DUU4g4PNks5bBonR9/wQpkDoU+oVi9Fsd
 5acmYRri++N6tT7ESG4FF9AefbIgsyX2meF9CR6uRuSTWVw1vnO9jeuJEnTLw13uei6M
 D8ih3dhQ0AtrQgQZzJvxWqmgmhi7WgHUnnUd4lb0Tp9tXiazSTzaOvhujRuP/42sXx7u
 +em8cnpqgzkKG5m9nNz+CSmfz/tDWytvgEKw1QfOi/RHYghBgXdYK+CA8epckA67MDE5
 gdjw==
X-Gm-Message-State: AJIora+D7wX202wq5wDyuWnrf5YhW5eeEisM6mtzpr57rsWQlLFPj2VN
 zy0svSKphYM3xrlij1zxDuI=
X-Google-Smtp-Source: AGRyM1u3aKjK38grE+Iavn6vL7gtqlrYPGcUQCOZcQlwR2lhU2EJBhVKJLXVmYHnvVtHxqF+JUAbaw==
X-Received: by 2002:a05:6870:8890:b0:101:db34:3ed6 with SMTP id
 m16-20020a056870889000b00101db343ed6mr11434236oam.151.1656708835719; 
 Fri, 01 Jul 2022 13:53:55 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a4ad54e000000b0035eb4e5a6c8sm12643973oos.30.2022.07.01.13.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 13:53:55 -0700 (PDT)
Message-ID: <6c6de2e3-f81c-1176-7e34-244ce4440540@gmail.com>
Date: Fri, 1 Jul 2022 17:53:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND 00/11] target/ppc: Implement slbiag move slb* to
 decodetree
Content-Language: en-US
To: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/1/22 10:34, Lucas Coutinho wrote:
> Resent after rebasing and fixing conflicts with master.
> Add Leandro Lupori as reviewer.
> 
> Based-on: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
> 
> Implement the following PowerISA v3.0 instuction:
> slbiag: SLB Invalidate All Global X-form

Yeah, and we're missing reviews in those. As soon as they get reviewed I can
pick this series.


Thanks,


Daniel

> 
> Move the following PowerISA v3.0 instuction to decodetree:
> slbie: SLB Invalidate Entry X-form
> slbieg: SLB Invalidate Entry Global X-form
> slbia: SLB Invalidate All X-form
> slbmte: SLB Move To Entry X-form
> slbmfev: SLB Move From Entry VSID X-form
> slbmfee: SLB Move From Entry ESID X-form
> slbfee: SLB Find Entry ESID
> slbsync: SLB Synchronize
> 
> Lucas Coutinho (9):
>    target/ppc: Move slbie to decodetree
>    target/ppc: Move slbieg to decodetree
>    target/ppc: Move slbia to decodetree
>    target/ppc: Move slbmte to decodetree
>    target/ppc: Move slbmfev to decodetree
>    target/ppc: Move slbmfee to decodetree
>    target/ppc: Move slbfee to decodetree
>    target/ppc: Move slbsync to decodetree
>    target/ppc: Implement slbiag
> 
> Matheus Ferst (2):
>    target/ppc: receive DisasContext explicitly in GEN_PRIV
>    target/ppc: add macros to check privilege level
> 
>   target/ppc/helper.h                          |  15 +-
>   target/ppc/insn32.decode                     |  26 ++
>   target/ppc/mmu-hash64.c                      |  41 +-
>   target/ppc/translate.c                       | 417 +++++++------------
>   target/ppc/translate/fixedpoint-impl.c.inc   |   7 +-
>   target/ppc/translate/fp-impl.c.inc           |   4 +-
>   target/ppc/translate/storage-ctrl-impl.c.inc | 146 +++++++
>   7 files changed, 377 insertions(+), 279 deletions(-)
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A255BC37
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:45:31 +0200 (CEST)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5wXy-0003JZ-Hi
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wU4-00088x-OQ; Mon, 27 Jun 2022 17:41:29 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wU3-0007kV-7p; Mon, 27 Jun 2022 17:41:28 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso14679263fac.1; 
 Mon, 27 Jun 2022 14:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fr0rJBCOAprnqQuFqfE+SesqsLZLvYVfKh6c3Slbn/Q=;
 b=JYRsUV2NFoqiy+Yhcf70k2meYC0MFNqVBB4VUmW2OA1PQJSNRP2lpuwQdikcm7i+BQ
 im9Vd9j0bgmT0ibympiC8GsF9IAVjMcGDSDFGuUxyAAezYvcfaZZSidP7Ye1uqbrSwZ3
 ZP9+q8H/EUw+JFRC4LsWf9Q62a8dckNEH4ytqPK64ADw13YrkwEX7+ymbKqnry2RmhSL
 O/29AzWEu19HEs9u4jD3ozQC5/JEOeriYZDbu8rARK0RMZVcP+rrqCqMGkUN9HqXYaqL
 +0xbyw/IJBxxhx165e5EsnUk8+b9vlpuYn9NL/409HDlmct00L193CozPccXLSoaGbeR
 e/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fr0rJBCOAprnqQuFqfE+SesqsLZLvYVfKh6c3Slbn/Q=;
 b=1+dsIOJI/RsviBavPisH+tmHOO5npTh4+EplIjramI5QuhmAe2QssF+AJ1L4vTUBv0
 tfW9FeCpENQDDOhjEnYlO79MrzOTjpD1XckdXmyVIl29M2Nk5Ymki5CTFo4/SHBMpnH/
 qAt+so7Ln8sGFEHXCzVed8TY+5CxC2125MxzMLK341cdmI8/bSLOYgWrvrw135Qgx5GB
 w6zWgGuS5oaoagCXoT+3myGH5o28QTisgyaDMoqkyLE0IUJaLUDEJCB4CYJWEj6PiB26
 9mLtSZLqXcQDLTZNohIKk5xCuMH3Kh5My7URrcrHC7xHlg+0qtj2Hrl4FpDJGP6ekhYA
 kErQ==
X-Gm-Message-State: AJIora9hlWU1HNllpIBbMA42o6aj10tvraKTa9lFQBqT48yVi8cSyAXq
 vgMtlXtKfTeHG9QaHcyn9746w9kbFe8=
X-Google-Smtp-Source: AGRyM1uTW9jFLMPXrkjAJD4PsBYaiWtBmn4cOdFcVo7v9TkKtgh5yptGACrKZ37W2iuBLqUttTSC1A==
X-Received: by 2002:a05:6870:972a:b0:101:bc3a:38bd with SMTP id
 n42-20020a056870972a00b00101bc3a38bdmr11414278oaq.13.1656366085919; 
 Mon, 27 Jun 2022 14:41:25 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a544812000000b00333295a8919sm5992081oij.28.2022.06.27.14.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:41:25 -0700 (PDT)
Message-ID: <ed151ae9-5870-3cd7-347a-dd82a9e8c9bd@gmail.com>
Date: Mon, 27 Jun 2022 18:41:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/7] Remove CONFIG_INT128 conditional code from
 target/ppc/*
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/6/22 12:00, Matheus Ferst wrote:
> PPC-specific methods to handle 128-bits integers operations, like
> avr_qw_not and avr_qw_add, are currently only tested indirectly (through
> the behavior of the insns that use them) in !CONFIG_INT128 builds. They
> can be replaced by the methods provided by int128.h, which are shared
> with other archs and have unit tests.
> 
> We also take the opportunity to move some instructions to decodetree and
> drop unnecessary uses of VECTOR_FOR_INORDER_I.
> 
> Based-on: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
> because int128_ult, implemented in 'host-utils: Implemented unsigned
> 256-by-128 division'
> 
> Matheus Ferst (7):
>    target/ppc: use int128.h methods in vpmsumd
>    target/ppc: use int128.h methods in vadduqm
>    target/ppc: use int128.h methods in vaddecuq and vaddeuqm
>    target/ppc: use int128.h methods in vaddcuq
>    target/ppc: use int128.h methods in vsubuqm
>    target/ppc: use int128.h methods in vsubecuq and vsubeuqm
>    target/ppc: use int128.h methods in vsubcuq
> 
>   target/ppc/helper.h                 |  18 +-
>   target/ppc/insn32.decode            |  16 ++
>   target/ppc/int_helper.c             | 255 ++++++----------------------
>   target/ppc/translate/vmx-impl.c.inc |  32 ++--
>   target/ppc/translate/vmx-ops.c.inc  |   9 +-
>   5 files changed, 93 insertions(+), 237 deletions(-)
> 


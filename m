Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9042531F08
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 01:03:58 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntH5h-00035U-DX
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 19:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntH4T-0001r3-2P; Mon, 23 May 2022 19:02:42 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntH4Q-0000uc-Oz; Mon, 23 May 2022 19:02:40 -0400
Received: by mail-oi1-x236.google.com with SMTP id q8so19519281oif.13;
 Mon, 23 May 2022 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6qXdrndWHT0tUQK1/ssiLZJMOaS2HROWh4QUNtqS7Lw=;
 b=UMx4+aW0LHd/N/ZY2IQm+nn6dx71egqF/3mVMzY2ONTNra5Kn6Zg5tO9I5tN0lATzr
 Lz7oLpz5ucAX+EUURrys/XEk8DE4FCkuXq0Np+5b+BVHylTqEez2KA0/bJA+Vbp5tYo2
 hs/+UP8rI1ruFpUew2AT3kFC9O+PbmuR/I0cB3d8Hx85WTdP0FHFaPMmyeI7PfSJ+IwR
 tjYwDcXC8o8e+lEGWugZQS4UztQT5GhmPrhUJJ1NeJyzMMvioV8W1Ly7I9CWhiXBOLSg
 aADBhQCpztM7vaR+YEJ2sbSkF1zJ25nf2b+BYi3re+sYVYKl0a6wYtinOc3mHWk62k1O
 XMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6qXdrndWHT0tUQK1/ssiLZJMOaS2HROWh4QUNtqS7Lw=;
 b=UGtJkdW0zxW+9xE5KLc3roIQetzsmb7cZ0AzdD9wsHvyzeFY/r48Zi1eS7syCkqw4U
 rDfBuSkcr6eqCqFOIG0xVHs/jP/foARrvF/ePfn2FFtU1ou9RfMHnplg8nO8lLuYnwDb
 CwVNjiHbJX5JvphaH3jr6RwGkZDN8Gd7JZvSB4RUx9TPmGVHnaDELM63kzz2NCoEWv29
 0wpGNw0iGFbJu5NqELGClt726AFIbztkaw3sv6zTsB+5pR5gubg5xTg6koU7L4IIuxnn
 g1uk3MBUE50vG9viRvclWqcCj6Uo/kzFMfCiyDOFKCco5To3L+1ZkowBNV2yV+jrldOd
 SNxQ==
X-Gm-Message-State: AOAM5309q0emxRGpstLJdEOKmvkOdvWwL2Iu3Himv5G2Vh5nOdf4zjb7
 2WvKPJa4pDGB7kmB7+mFz64=
X-Google-Smtp-Source: ABdhPJx+AiOGeURw+kWg+hWcv+4uAgrGPUCcq+Vv0Ldb1plKbac5O+xVUogM5FJXLHcfFSUuHYjzrg==
X-Received: by 2002:a05:6808:11c9:b0:2f9:b01b:17f0 with SMTP id
 p9-20020a05680811c900b002f9b01b17f0mr749241oiv.233.1653346955790; 
 Mon, 23 May 2022 16:02:35 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05687087c700b000f2911d1987sm507681oam.39.2022.05.23.16.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 16:02:35 -0700 (PDT)
Message-ID: <46ff6eb7-b1a4-49c3-abdf-4883e4a7978e@gmail.com>
Date: Mon, 23 May 2022 20:02:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/12] target/ppc: implement xscvspdpn with
 helper_todouble
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
 <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
 <137135f0-c764-bce3-6c18-da7478de6788@gmail.com>
 <8197ab7c-0a6c-294a-c8e1-2c5ca787fc54@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8197ab7c-0a6c-294a-c8e1-2c5ca787fc54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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



On 5/23/22 12:54, Richard Henderson wrote:
> On 5/23/22 06:48, Daniel Henrique Barboza wrote:
>> Checking 0006-target-ppc-declare-xscvspdpn-helper-with-call-flags.patch...
>> ERROR: spaces required around that '*' (ctx:WxV)
>> #69: FILE: target/ppc/translate/vsx-impl.c.inc:1049:
>> +bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
>>                                                   ^
>>
>> My guess is that since the var 'arg_XX2' ends with a numeral the script
>> thinks that the following '*' is an arithmetic operation. Problem is that
>> we have other examples of this kind of declaration in the same file, e.g.:
>>
>>
>> static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
>>
>>
>>
>> Is there a way to convince checkpatch.pl that this is an okay format?
> 
> Not that I know of.  I just ignore these parsing errors.
> 


Works for me. We should be aware that gitlab will complain about it when pushing
this to master though. E.g. https://gitlab.com/danielhb/qemu/-/jobs/2496047821 .

Thanks,


Daniel


> 
> r~


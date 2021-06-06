Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A2E39D092
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 21:05:53 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpy5o-0001SR-4a
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 15:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpy4O-0000PU-N9; Sun, 06 Jun 2021 15:04:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpy4M-0007Pb-VT; Sun, 06 Jun 2021 15:04:24 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so11148773wmd.5; 
 Sun, 06 Jun 2021 12:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1PIpA4M1Lh5qS5vQUFCI7gBUiZeASEvNuMx4pCb4Sxw=;
 b=JFmd/tWrGm3FOdFYh5gSC9R3X+TNes/RUdkasrxXzBt7Dww8NSA5330qBE7HLiLwTY
 KFMJz1HeHyryltacMXTDx5VTR6NaV6+Dhiuy1FfkI9UOlrBc6EikhL+1tmGXFSJQAbko
 q264qwItxcZ5o48WqDHaCHVWFAdGXyMXdEXbicm7VQxEZsdYh0JCk6WvwA/3If+dyfGB
 VdbvWJeqjYEIZbh3JdiiJ43zt0/QWAAo0m5na2YRPJ96ZIS0XqyQo6fCT2yIMgfuwX27
 /TMe8ft2r4TWo7Dh+EKX9wiDembCcSYp+TQJ0CLtleq420L1pFn0z4VHgeF4JI7VYpmU
 3iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1PIpA4M1Lh5qS5vQUFCI7gBUiZeASEvNuMx4pCb4Sxw=;
 b=CvJuZN3q0cdBHmfsavUoOBfkJ4EflyYynHJCnDoC1hoSpBIL0nj60kH5ky8GJwPf+K
 JtjqhYmrHOhJsaXSqsgxLMvp5hSSGlELhRdBXFhu2s4Q4u/SmiAiLGtBYpiFwDG9oPUO
 bRlNSem5ChvVKZLKKFlkZN/Yz01GTAkU6wy9/oEwKn+BAPtMsxrEWtX82M9qoBth2Pgs
 0NJs/QSVf9hqdeBWar0I9GTrO/jp0nAPU4e0kHdvSeSJ1Q6oA0gEspCwaCIjHFWR1cJ6
 6B0praVHGytRCJFwtqcAWN2Lbl/A99iiAP8ed/TEfrslM2tbh4CtyCTwgHXVGMZxs+q4
 npfw==
X-Gm-Message-State: AOAM533Djd0ThY0QGpBFZwpe1g1OPi5VsCwP+bHGBjOO087FVT+AAF2I
 GqqWlif5g7OMBnsCSqV/H88=
X-Google-Smtp-Source: ABdhPJxcN/vuAFR6hYXAL2h01Re0InCOERdgmfUZow/Edt6aqhQ1XrDUhYSl/p886SGYBfAY1lvqyQ==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr13273214wmc.172.1623006261038; 
 Sun, 06 Jun 2021 12:04:21 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id g17sm8641311wrp.61.2021.06.06.12.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 12:04:20 -0700 (PDT)
Subject: Re: [RFC PATCH 2/5] ppc/pegasos2: Introduce Pegasos2MachineState
 structure
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <7ef9d2058fab88cc83c54e0482eeae8e275f0069.1622994395.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ac0e981-ca13-f70e-aa89-c051030cbe21@amsat.org>
Date: Sun, 6 Jun 2021 21:04:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7ef9d2058fab88cc83c54e0482eeae8e275f0069.1622994395.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/21 5:46 PM, BALATON Zoltan wrote:
> Add own machine state structure which will be used to store state
> needed for firmware emulation.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/pegasos2.c | 50 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 13 deletions(-)

> +struct Pegasos2MachineState {
> +    MachineState parent_obj;
> +    PowerPCCPU *cpu;
> +    DeviceState *mv;
> +};
> +
>  static void pegasos2_cpu_reset(void *opaque)
>  {
>      PowerPCCPU *cpu = opaque;
> @@ -51,9 +60,9 @@ static void pegasos2_cpu_reset(void *opaque)
>  
>  static void pegasos2_init(MachineState *machine)
>  {
> -    PowerPCCPU *cpu = NULL;
> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
> +    CPUPPCState *env;
>      MemoryRegion *rom = g_new(MemoryRegion, 1);

It would be nice to have the 'rom' variable also in the machine state.
Can be done later...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D4510931
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:36:38 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQzF-0007Ij-HA
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1njQcn-0000yb-0e; Tue, 26 Apr 2022 15:13:27 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1njQck-000563-F3; Tue, 26 Apr 2022 15:13:24 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso13700506otf.12; 
 Tue, 26 Apr 2022 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HImGM0AYCpefraln6dCkxJIqupKwm9VAgIp3L01pZ18=;
 b=iT1dQMmP0zET6arrCS9Qf7jKkaEig3rbRgN131GxEGWEWrJx7qHmAc4bwvSnOGVhqI
 mEVmj0CBX10fhFscUbqnT8KcxzKku3a1iLQAsRK8qoslJbB2R0sBYF7YcRDzXpjssvpT
 1180403T20c+JK1gOheXO69xBL+pkTFNZIaXvyi+ezIqmr1HZraGWvlL59pc8Pj/hbKt
 M8kyU2xpBO3Uz28IvQX8Q+lt5Rat1CNrbxjf5sx2K4DtZtXld7EdybUbOmR8QYP54VTN
 qOPYuTFmkQADBNcq0DD7jD2KBEryE9l66rHUeGJdSI7/9c3Pn5EADmL21Q14mActwZeJ
 4t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HImGM0AYCpefraln6dCkxJIqupKwm9VAgIp3L01pZ18=;
 b=ZoXBfRypK1maP650sw14B/EjrsNGpFSY5rh3YoUNTixJFAT7AfjxC4DX9PHNQUj/rx
 YcvRrMrPHpPIujf1orpQhcbeSSotSecOYYr7W3+ozUo+Z7StKOmkau3cFjloip8RSK5+
 4MKb0oWDhuKXh5umBnNOQhmOYzXEcX/vgUOU/fJyQwMIsZW7qRo2hEzzsNw4jCBQqFN/
 WhElqkExoZCgmlfvFjB62fVtuy82101eXidQekyTurFAAY4B3wpFeVCrKruGILWd8tsb
 B8XGEwtI3R3R3b5nVEHMGIez86ULn3H2HiqOssFx95OzQFyr6nI6wyLeN+5K4/u+wZ3U
 EUwQ==
X-Gm-Message-State: AOAM533Jhe6bCfwQ/fDG+rZzxHEMVg7UK1EYnLm1MIEYmoiKo7+NVH08
 DElNZJRkkRifd6jShDsEzG4=
X-Google-Smtp-Source: ABdhPJz3eMbht7BQPYLj4OmKgMSW7m5fgwmU+EkVDa4qG+D24tXhbwuvK5/TfJ3bgDHqHOf67r2fLQ==
X-Received: by 2002:a9d:6d02:0:b0:605:a80a:cfbd with SMTP id
 o2-20020a9d6d02000000b00605a80acfbdmr4797450otp.69.1651000400291; 
 Tue, 26 Apr 2022 12:13:20 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:3a18:8059:d9aa:a8b3:7e6b?
 ([2804:431:c7c6:3a18:8059:d9aa:a8b3:7e6b])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a056830131200b00605518ec640sm5290120otq.23.2022.04.26.12.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 12:13:20 -0700 (PDT)
Message-ID: <39f15196-a247-2a03-4d07-2509c41af0c9@gmail.com>
Date: Tue, 26 Apr 2022 16:13:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
References: <20220421011729.1148727-1-bmeng.cn@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220421011729.1148727-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 4/20/22 22:17, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
> Event" and chapter 8.4.5 "Instruction Complete Debug Event":
> 
>    "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
>    are set ... Branch taken debug events are not recognized if MSR[DE]
>    is cleared when the branch instruction executes."
> 
>    "An instruction complete debug event occurs when any instruction
>    completes execution so long as MSR[DE] and DBCR0[ICMP] are both
>    set ... Instruction complete debug events are not recognized if
>    MSR[DE] is cleared at the time of the instruction execution."
> 
> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> HFLAGS_BE flag, which would cause the immediate debug interrupt to
> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> and MSR.DE is not set.
> 
> [1] https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v2:
> - update commit message to use E500CORERM instead of PowerISA 2.07
> 
>   target/ppc/helper_regs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..77bc57415c 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>   
>       if (ppc_flags & POWERPC_FLAG_DE) {
>           target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
> -        if (dbcr0 & DBCR0_ICMP) {
> +        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
>               hflags |= 1 << HFLAGS_SE;
>           }
> -        if (dbcr0 & DBCR0_BRT) {
> +        if ((dbcr0 & DBCR0_BRT) && msr_de) {
>               hflags |= 1 << HFLAGS_BE;
>           }
>       } else {


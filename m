Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3E50911D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:11:24 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGfb-0005BU-Vv
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFqK-0003x2-Qf; Wed, 20 Apr 2022 15:18:24 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFqJ-0003PF-8Z; Wed, 20 Apr 2022 15:18:24 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so1754546otu.4; 
 Wed, 20 Apr 2022 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bhxX7QJ8j1MyQANdQ1eufsBRpHNEBbvjfnkNgoWuLHA=;
 b=hhux2qZfX6p9I2rAO14fAZa0Ie9olsmiaRssG9Wnf4ZJoT96mr4llQFdMWweOWa6yD
 jmAlePOB80etzc5Tsu2SFHXScUjbudJJ5zW1VdHdnpd69S1B4yvGFOxIFgJ5AGfjBNc2
 oYHv0U7cV2YDF91GoPh/75nFTAWNTsm/0GhXYyOb0mEhPBo7V84pwWxO4CPMjAMJA91u
 CdxryRNalJZlGGbwTi5XWTmeegIP1dHEnU7YkqQu/zHuxTTXu/NVCRKfdccFP8utz6fI
 gGFY8kRG1r0rxCp0r/0cJU+scPT+jjBirCb0y+dSfcRQLgdq0btofzAJj66tndv6uhcL
 jORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhxX7QJ8j1MyQANdQ1eufsBRpHNEBbvjfnkNgoWuLHA=;
 b=2+9aMW6A83L9tKk2RqwEHTQ/8y+Srekddp3LK1QGpyB/2Wu9t72TlbuCWAdp7IloUk
 VauFJz/oSbazMSB7evXgtRkLiXbcbZ4MVITO0JJF8kUNTKpKCGhgf88c0wMJWj496uWt
 ZCSvHmMU6BazRGodwpo/pbNRrqHSA8kDqJ7QGY2J/3/eC3fW18Whx4CqnkaPymj4y6IY
 F1bRJlz3OyI1dX10MxE0zbwDymqpfHLR0wju0OgC7rAnXbxpDxq08bdEBJX/ApSr0XHf
 MzeOeAFYUNJavkCtvzJQKsdRy97AHn7Rt2oQHTk8CEw1FOCh769ZjPk33C9CKQGhuICa
 KWnQ==
X-Gm-Message-State: AOAM531T7oJ516NqaSRA7HCd2HK4UUqUUrtuoYZKM3RAsPLqdouCGMBl
 ndiZNRP6e1gHVpmvGaV0sac=
X-Google-Smtp-Source: ABdhPJypsYpWn9zGb0Qvs7r7LamU1Plp0yREv/Plf+5Ord4OcQs0CGN4zXWz3ekW7sBue4VBW+vV6w==
X-Received: by 2002:a05:6830:44a7:b0:605:705d:90f6 with SMTP id
 r39-20020a05683044a700b00605705d90f6mr521318otv.238.1650482301670; 
 Wed, 20 Apr 2022 12:18:21 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 bp21-20020a056820199500b003298e6877c7sm6816769oob.29.2022.04.20.12.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:18:21 -0700 (PDT)
Message-ID: <652d0ba1-d238-bf1d-072d-26371d8f7386@gmail.com>
Date: Wed, 20 Apr 2022 16:18:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/ppc: Add two missing register callbacks on POWER10
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220411125900.352028-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220411125900.352028-1-fbarrat@linux.ibm.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel



On 4/11/22 09:59, Frederic Barrat wrote:
> This patch adds tcg accessors for 2 SPRs which were missing on P10:
> 
> - the TBU40 register is used to write the upper 40 bits of the
> timebase register. It is used by kvm to update the timebase when
> entering/exiting the guest on P9 and above. The missing definition was
> causing erratic decrementer interrupts in a pseries/kvm guest running
> in a powernv10/tcg host, typically resulting in hangs.
> 
> - the missing DPDES SPR was found through code inspection. It exists
> unchanged on P10.
> 
> Both existed on previous versions of the processor and a bit of git
> archaeology hints that they were added while the P10 model was already
> being worked on so they may have simply fallen through the cracks.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   target/ppc/cpu_init.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 073fd10168..2e9a3ded54 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6457,6 +6457,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>       register_power5p_common_sprs(env);
>       register_power5p_lpar_sprs(env);
>       register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
>       register_power6_common_sprs(env);
>       register_power6_dbg_sprs(env);
>       register_power8_tce_address_control_sprs(env);
> @@ -6467,6 +6468,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>       register_power8_pmu_user_sprs(env);
>       register_power8_tm_sprs(env);
>       register_power8_pspb_sprs(env);
> +    register_power8_dpdes_sprs(env);
>       register_vtb_sprs(env);
>       register_power8_ic_sprs(env);
>       register_power8_book4_sprs(env);


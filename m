Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC84B0D0D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:59:44 +0100 (CET)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI86x-0000SU-8w
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7w9-0006jk-4D; Thu, 10 Feb 2022 06:48:33 -0500
Received: from [2607:f8b0:4864:20::435] (port=45893
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7w7-0008H6-2l; Thu, 10 Feb 2022 06:48:32 -0500
Received: by mail-pf1-x435.google.com with SMTP id 9so6868192pfx.12;
 Thu, 10 Feb 2022 03:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ig9kZqZZfQ9sqdXBPM1U4qU1I9hGNtkiVI/BPqhhhKc=;
 b=gHjRR3KMMjr4GXyMMVsj3qIoQ3XUIZ2LRHojh/SBKk1/ArKNECiBKc5YaqBzLpyafw
 ctys2nLhQQJGtWNe/3YCjlaj5BbUhLndnm9jW774Y1ZJpyiS2f6a/1DxUQgTNNYJamMP
 Mc03HT5MjPZae88D4Busv49cFPFInz22dvTl+0C77PE1n38BdM8/MhKvt5syZBIA2sxX
 gVBKC79gv+bwdPxd8OH4DOJanVUyWNarHLWtAijgFSgLNsPO/Dr5ziEmdIQNuZUulHyM
 0uhJvvHjo2h8BBqTB1ZEHPSDrtA805xtP7TTNInMHO/BQX85U1iU0EG/xwgnnAhzxmAk
 CCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ig9kZqZZfQ9sqdXBPM1U4qU1I9hGNtkiVI/BPqhhhKc=;
 b=4mb7MWiaRSarMuc5xKA8jxO0CpknMNNF+S9yGPxYD2bNNIs0EDJ2Uk0rf/qoiRZGYi
 t82zhrC1wJrYOazoMCpgFXPhJjYLxFrch7lSTQ2dBI4r4kv8axF0dVzR65N0dBqwP/9N
 Ql9rn7d3kdouIxSWcHgOM9TITruBJxACIok60pyqi9Kle0w2dVUZeEG6tIO7JHpZlDU/
 hyzqLHByNoRgKIBqO/m6UmhX4AsRph8z4kyxOd5XzJVp9w/jbW9lL1Vj57qkyk2AzYyr
 8XhQFXhO52cofjvqRbHAp4SL+Xr802BPKXndoR69ppMrjs+MXkoRbeJADx9M4Y1K1Tfn
 r+uw==
X-Gm-Message-State: AOAM533DgiY4menQUt8+gJjzopGidXxt1e9HYcbdPGk9ypG/iE+W3Smg
 tIMyOf7BjkBzipE9ioRE80Q=
X-Google-Smtp-Source: ABdhPJyNmSG1WvX/xGGiQo/Pq5Dam0pcZhc5srG3p4my1VTiE6XGONLTPkpC3kWLf0Vf6ceOEUA/jw==
X-Received: by 2002:a63:28d:: with SMTP id 135mr5934362pgc.517.1644493708996; 
 Thu, 10 Feb 2022 03:48:28 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id k12sm24462870pfc.107.2022.02.10.03.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:48:28 -0800 (PST)
Message-ID: <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
Date: Thu, 10 Feb 2022 12:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Cc: Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>, 
 qemu-arm@nongnu.org
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
In-Reply-To: <20220210113021.3799514-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Alex,

On 10/2/22 12:30, Alex Bennée wrote:
> The previous numbers were a guess at best and rather arbitrary without
> taking into account anything that might be loaded. Instead of using
> guesses based on the state of registers implement a new function that:
> 
>   a) scans the MemoryRegions for the largest RAM block
>   b) iterates through all "ROM" blobs looking for the biggest gap
> 
> The "ROM" blobs include all code loaded via -kernel and the various
> -device loader techniques.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Andrew Strauss <astrauss11@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

> +static LayoutInfo common_semi_find_bases(CPUState *cs)
>   {
> -    MemoryRegion *subregion;
> +    FlatView *fv;
> +    LayoutInfo info = { 0, 0, 0, 0 };
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv = address_space_to_flatview(cs->as);

Why are we using the CPU view and not address_space_memory?

Does this function really need a CPUState argument?

Trying to find a counter example, if used on the ZynqMP, could a
A-profile core would report one heap layout, and a R-profile core
another layout?

Now if we want the per-CPU AS, shouldn't we pass the CPU AS ID and
call cpu_get_address_space() instead of cs->as?

> +    flatview_for_each_range(fv, find_ram_cb, &info);
>   
>       /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it
> +     * equally between stack and heap.
>        */
> -    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
> -                   subregions_link) {
> -        if (subregion->ram && !subregion->readonly) {
> -            Int128 top128 = int128_add(int128_make64(subregion->addr),
> -                                       subregion->size);
> -            Int128 addr128 = int128_make64(addr);
> -            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
> -                return subregion->addr;
> -            }
> -        }
> +    if (info.rambase || info.ramsize > 0) {
> +        RomGap gap = rom_find_largest_gap_between(info.rambase, info.ramsize);
> +        info.heapbase = gap.base;
> +        info.heaplimit = gap.base + gap.size;
>       }
> -    return 0;
> +
> +    return info;
>   }



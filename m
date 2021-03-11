Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750033726B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:22:05 +0100 (CET)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKKK-0007LL-Je
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKKHy-000650-IQ; Thu, 11 Mar 2021 07:19:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKKHx-0005f0-4Z; Thu, 11 Mar 2021 07:19:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id y16so1637708wrw.3;
 Thu, 11 Mar 2021 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gA139IVvOZJwFPTxiVB8roNjBljpbKqqmYHQuob7CMs=;
 b=Leb7nriWIYI9IwliJoDEryV/VYC3lkYFXihP1aaP6v+CJbujKX5go16kL/jU4U6ABm
 ebMahgUdOBCO0M7ktL/jBRPwu1HbhGVngvCRocFwyYvmSBBK4moFtFF5U/61qhyQ2DI8
 lEjGfCze8+vdsJGaNVqTrD1jH1VkCLVjRrLo88xtLwi/I28j1JScjl3uVtuIeHA51bmP
 QfXhaoe83eIEByt2NgJON9ujwPpUacLGYl8oEWIIY1Bi7n0loMXwWbtI2rVNL8IGVaL0
 xfgpq15LD3vRifOInfvRvkwEj7m3KgOYgrxy0IIfri/+NaV+1EAGUsvubGIIIDiVrvR+
 oMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gA139IVvOZJwFPTxiVB8roNjBljpbKqqmYHQuob7CMs=;
 b=LF+M1M+Hg/3KXYcvf+DT1v9xPV+vnR3Ib0e/p8IUH+m59o4q4cWnGdJuXUcCadX0TN
 aMPmBqfkEJvmf2eNzs1ZXHQjgYX1sXCcTV43oO4tcK7F4ZCnIt/T98LHBSlpgOFTj7VE
 WZMmX5hEV1BYJ2Lvw9aDPPApUvcWmOnILgGN9mPl1FkQGvtG3Xj/UsRa8uCJ+uI2fMav
 TUzBY98zImq4ukK5CBi7/QVXWBcTAwTV0yi9+2DGTsBW5lG4TGCU6vUZsRB0YJI7F0RO
 Jw7JQM3mCg6pz+gXeu+YIyAgDisffazlSc6s4q53GvIYKaGb8vBiZC8b4yYO1R883rkB
 r5+w==
X-Gm-Message-State: AOAM532sQylXAfYz8vvZlfswdyUpKV2Xo23ozNFBzMfRRi+SorApT/wx
 uk17hcrmt2D2ip57m4syO2I=
X-Google-Smtp-Source: ABdhPJzlyrLxc4KuJeD1bsENfyWPWkXVcPwYoHFz3RS/LN2LrBspVyVP7p9CHzXB3i9ISSMXdpi+wA==
X-Received: by 2002:adf:82af:: with SMTP id 44mr8160747wrc.279.1615465175511; 
 Thu, 11 Mar 2021 04:19:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z25sm3788484wmi.23.2021.03.11.04.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 04:19:35 -0800 (PST)
Subject: Re: [PATCH 3/3] memory: Make memory_region_to_absolute_addr() take a
 const MemoryRegion
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b5e2547e-1c6b-93f4-d3f2-def8e79c8d41@amsat.org>
Date: Thu, 11 Mar 2021 13:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305235414.2358144-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@ for this single patch.

On 3/6/21 12:54 AM, Philippe Mathieu-Daudé wrote:
> There is no reason to not have memory_region_to_absolute_addr()
> work with a const MemoryRegion. Else we get:
> 
> softmmu/memory.c: error: passing argument 1 of ‘memory_region_to_absolute_addr’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>  6666 |     myaddr = memory_region_to_absolute_addr(constmr, addr);
>       |                                             ^~
> softmmu/memory.c:410:60: note: expected ‘MemoryRegion *’ but argument is of type ‘const MemoryRegion *’
>   410 | static hwaddr memory_region_to_absolute_addr(MemoryRegion *mr, hwaddr offset)
>       |                                              ~~~~~~~~~~~~~~^~
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  softmmu/memory.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 991d9227a88..6d1e96ba37d 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -407,9 +407,10 @@ static inline uint64_t memory_region_shift_write_access(uint64_t *value,
>      return tmp;
>  }
>  
> -static hwaddr memory_region_to_absolute_addr(MemoryRegion *mr, hwaddr offset)
> +static hwaddr memory_region_to_absolute_addr(const MemoryRegion *mr,
> +                                             hwaddr offset)
>  {
> -    MemoryRegion *root;
> +    const MemoryRegion *root;
>      hwaddr abs_addr = offset;
>  
>      abs_addr += mr->addr;
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B453A6F3F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:39:29 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssQi-0001gG-Df
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssPK-0000Qu-4i
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssPH-0008Ge-KK
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623699478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gq7ZN66oJ5BhjrROSkXfWSoJ2dGZUClBMhvzEU7guco=;
 b=EJvMenNKDTqY93Pj61PDNW3g96FZbAGXMofmgfLXHTDx1Na3keaUA0sQq368tlJCfS7vCC
 f/SbaST3wUz5M32wHde2fuGhW6CpJ4sJa2k5AF7F2L3JqCoTzvzYfI6P4z0ReDuPS2tY41
 w7ladLfR4gqGQt8JL/YXXeHApHTxQzo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-IMX6d4yrMmOs7NUPJuwf6w-1; Mon, 14 Jun 2021 15:37:57 -0400
X-MC-Unique: IMX6d4yrMmOs7NUPJuwf6w-1
Received: by mail-wr1-f71.google.com with SMTP id
 k11-20020adfe3cb0000b0290115c29d165cso7451028wrm.14
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gq7ZN66oJ5BhjrROSkXfWSoJ2dGZUClBMhvzEU7guco=;
 b=PhtkZQc5wH6Ld4hB6olxXg8/5YA7yhQnn7LtCu9SFBvqajkpCH/7L0FV/c/ONq79/4
 Sc4MJ15soHh9Cqc42DPOQNEAHOJIBXKPqxMGOvOEZg2VmkR82m6lHVNrENKHI0tu8vQB
 5xjG0xh50KaINzZ/NkxwGpkZBuGasHz9FlfDnUqqGNirVBgmnKWKW1lwjlHuA9ZJuo0m
 0Mw1blyc82PpjMYpPKkFkETllRjaCGPvxykx4MA5DZF6mJZj0AuEAep2Z7fzhIjW+By3
 I/youAYu1/73jIIH9Ha/D53Z4XKC8xcXgV+wU9Bl5yl7KzSptro5V7PUHjwydu2K2Pet
 3uyw==
X-Gm-Message-State: AOAM531ZUuTYZn+ZduN8muZtNjNrBQtkDTaYOGZgFGBOFmaDyd6NT8O8
 D/MW4+gF8aGhBhmhWaex/41JYsAgiVZrY9rWywHsHlW0WKOE6iIi+n+smWtYly5UXR7boAfhRFo
 w323TJPHXc8HfvxA=
X-Received: by 2002:a05:6000:186c:: with SMTP id
 d12mr20720651wri.123.1623699476213; 
 Mon, 14 Jun 2021 12:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMAL49NwKSe4SQvE1OpAiaXxYPvlZ5I+WBy6VqFLzueN6zUWBX++VZ1tOap7TmTQbeT4BVIg==
X-Received: by 2002:a05:6000:186c:: with SMTP id
 d12mr20720629wri.123.1623699476006; 
 Mon, 14 Jun 2021 12:37:56 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a9sm8817458wrv.37.2021.06.14.12.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:37:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7254eff-c9f8-36bf-b951-242c1b21f5f8@redhat.com>
Date: Mon, 14 Jun 2021 21:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
> This patch changes ppc_cpu_get_phys_page_debug so that it is now
> able to translate both, priviledged and real mode addresses
> independently of whether the CPU executing it has those permissions
> 
> This was mentioned by Fabiano as something that would be very useful to
> help with debugging, but could possibly constitute a security issue if
> that debug function can be called in some way by prodution code. the
> solution was implemented such that it would be trivial to wrap it around
> ifdefs for building only with --enable-debug, for instance, but we are
> not sure this is the best approach, hence why it is an RFC.
> 
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 9dcdf88597..41c727c690 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>                    cpu_mmu_index(&cpu->env, true), false)) {
>          return raddr & TARGET_PAGE_MASK;
>      }
> +
> +    /*
> +     * This is a fallback, in case we're asking for priviledged memory to
> +     * be printed, but the PCU is not executing in a priviledged manner.
> +     *
> +     * The code could be considered a security vulnerability if
> +     * this function can be called in a scenario that does not involve
> +     * debugging.
> +     * Given the name and how useful using real addresses may be for
> +     * actually debugging, however, we decided to include it anyway and
> +     * discuss how to best avoid the possible security concerns.
> +     * The current plan is that, if there is a chance this code is called in
> +     * a production environment, we can surround it with ifdefs so that it
> +     * is only compiled with --enable-debug

Nothing forbid us to use --enable-debug in a production environment.

> +     */
> +        /* attempt to translate first with virtual addresses */
> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 1, false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 1, false) ||
> +        /* if didn't work, attempt to translate with real addresses */
> +        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 3, false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 3, false)) {
> +        return raddr & TARGET_PAGE_MASK;
> +    }
>      return -1;
>  }
>  
> 



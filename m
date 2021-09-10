Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB6406E33
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:33:17 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiWi-0006UH-Ps
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOiU0-0003Vu-Il
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:30:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOiTy-000402-V3
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:30:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1651500wmi.5
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a2AJriw+vJebZ0ZXlO8FvXhQ9HGQ8jxvFmctLRkssO0=;
 b=L+mFNKO6HUvEMOB2nP0g30nalyBNkA/G87UmjaJbE2l+5qGhPwHvynYHme3UHjUHmR
 OiEqt/DiTLahfEh1h6OXFxJr+GIzbTqj/RWhPj8NA+OhGQDx8jBoRImHYTEQXqmyQqO4
 5r4FvrXaflXfaha630Nz1tFieuPtsTGRBnFazoL7EpfyKsJoR7a9rMfJkdpHFAYkkfs0
 ijpC8e4/BOKuK+myEhCC3qJT8KvVkFOYIduAaeeFKUgIzO7jfrlLleq5aKvnyMdScdl2
 bgoXBG2F1LIfo3kKcvzvMmaLvzN2l0CL389BmFMaQATIfL4i310rQS1hE098HPJqzqzI
 sbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a2AJriw+vJebZ0ZXlO8FvXhQ9HGQ8jxvFmctLRkssO0=;
 b=L7AVzMPhRG2XqlTgUoOIHizKE5PQ8UDEiaW3303ha5fjDu+N2+EVrYkxO96fnMMube
 T4FvXmLEUJO1RACCg5WfDwHB5KWjGexlkOSSnqkrVQuutRUHTbh+yHvk28isJoSYLuFc
 zewoa5cF5QGqu8MwsaYfjsHkvj0k6EQY6asDlGEVqsy95fYv+bex/YxWEGP000FTf/jG
 vqUjIplONRA4l4fgTQq8oRZGsBPu5gcD1NwKR1yyKi7foZVwZhbGm7exDtAjGOj0ydwf
 QENxtU4zzkVuEb+wDZXLwhqff+M4SF9Ph6aNaVUo6HumW7DyPLE9tUXFKOZrH40rUhu3
 Vyhg==
X-Gm-Message-State: AOAM532rd5J5HPgMkIXFedvlAgoA3+Hf/A03poes+bnkUa1U+gbWej3p
 dUWlIFj7vIV21XPLda+lpnhnYTwdGTY=
X-Google-Smtp-Source: ABdhPJzqplU9PniKTT91L2GKvhbgz4k7ylqdfsGZRu6qkcDxpwL1817IeikqUNQJAupGhepAwK3Mmw==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr8982547wmq.45.1631287824987; 
 Fri, 10 Sep 2021 08:30:24 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i20sm4774595wml.37.2021.09.10.08.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:30:24 -0700 (PDT)
Subject: Re: Adding IO memory region to mipssim
To: Hinko Kocevar <hinkocevar@gmail.com>, qemu-devel@nongnu.org
References: <CACOP0z-956f0eBdv5wdfqWKT140_mSTW3GwJ1fQ5WEDATB=2Aw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <535a03c4-1350-ade3-4596-6ea5498504e0@amsat.org>
Date: Fri, 10 Sep 2021 17:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACOP0z-956f0eBdv5wdfqWKT140_mSTW3GwJ1fQ5WEDATB=2Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.349,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 3:21 PM, Hinko Kocevar wrote:
> I'm trying to add an I/O memory region to mipssim machine to emulate a
> MMIO region used by the u-boot loaded as BIOS image. I can confirm that
> the machine starts and loads the BIOS, starts execution but hangs due to
> unhandled IO access as described below.
> 
> The region should be at 0xB8810000, of size 0x10000.
> 
> I've added these lines of code to mispsim.c mips_mipssim_init():
> 
>     my_state *s = g_malloc0(sizeof(my_state));
>     memory_region_init_io(&s->mmio, NULL, &my_ops, s,
>                          "mips_mipssim.foo", 0x10000);
>     memory_region_add_subregion(address_space_mem, 0xB8810000LL, &s->mmio);

You need to map your device at its physical address, not the virtual
one.

> All goes well, the machine starts, and I can see the newly added region
> in qemu monitor info mtree output like so:
> 
>     00000000b8810000-00000000b881ffff (prio 0, i/o): mips_mipssim.foo
> 
> With some tracing enabled I see this error:
> 
>  Invalid access at addr 0x18810104, size 4, region '(null)', reason:
> rejected
> 
> I know the u-boot is making request to 0xB8810104 and not 0x18810104. I

U-boot accessed the virtual address which is resolved into the physical
one (where your device should be mapped).

> also can see 0xB8810104 address being handed to io_writex(), but
> mr_offset becomes 0x18810104 here:
> 
>   mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> 
> What is going on?
> 
> FWIW, I can place my emulated memory region at 0x18810104, but would
> like to understand the behavior above.

Yes, this is the correct address to map it.

Maybe this helps:
https://training.mips.com/basic_mips/PDF/Memory_Map.pdf

Regards,

Phil.


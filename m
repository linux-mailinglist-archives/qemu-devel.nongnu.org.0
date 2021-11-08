Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D81447B53
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:47:33 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzNM-0005EW-Og
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzKz-0004Ae-NX
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:45:05 -0500
Received: from [2a00:1450:4864:20::333] (port=38885
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzKy-00085m-4K
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:45:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso14321366wmd.3
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0BhT39p/mRAiYKm6I5GTZy3jNRSXfKLEtx4IOsK10Zo=;
 b=gH/H0Bumvwvt0OywnzaPimus9KzGddDUcU2CEppNKwoVjHGQODmxlWZ/J+eWjWDcGB
 0GK80bakBzr04mLPY26IzUnJUrcgiV65B5n0yJzZw9OUvXnsHrRX/ztjCHgclDbqLxrQ
 LbojQ2oJhS0nJkbifY05ZAVi6Z08HY4W3Ap6fiS/dsDT6SveuwpURR3MTkgp0/3Zk6fJ
 K1hXcT2T37rFMTky6sdhQxQY2fUGb4H3oOIv3bnrfRvOqrdsQS0o6qSlP+do2HUDem0M
 X4w8632OjZ9KBrY4poogk5VMalWzWw9r1MfQLjGDdK72DM520AumbYo6ITxN6nfi+7H9
 DaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0BhT39p/mRAiYKm6I5GTZy3jNRSXfKLEtx4IOsK10Zo=;
 b=Rp6/wOj9kyrMnnX2a5MyvaIZravkLqZq2Dr011eApweHFBllBKiagfFX4/1zEmFFMf
 Lu+2Afr1XJV3gFXSv6GA1EVHq1ogI5SGblE/a4WLHmR/kmp0ED+7qDRTZ8As8tCgMxTB
 gHMgrqQ16Po51AqQSt7GoVDArlAPcbbO5MB9S7zdgnRwJBA3/WHPZeLbveQdP6hhli9u
 P9rD1SA5AOafuOgxMMJb99NbdXk4mWoCFbwkZ9GFxkmY4ZLeJKvZjMaIIEjC29abqVUC
 8bXu/aAZ9xpM9tCbEn3RRAoZtiow00ucbtsFgBc7aUb33af7EQgWwIeVcQKvJAbxeD4V
 xTxA==
X-Gm-Message-State: AOAM530YHEFtt2hJtz+eo8bArHm9CC7lte/73ZPcX13QmcWpVHQF9iZu
 c2MqQyTvZdaYb22IHHPbKNQSyVhLS3c=
X-Google-Smtp-Source: ABdhPJx22sbZqkOKE9+tp+I7H2QMELBA7awIn2SjDdgLmswDX6bOEAdqYTDl0IFqe1bwjpA96jJh+g==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr49773624wmi.173.1636357038589; 
 Sun, 07 Nov 2021 23:37:18 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 10sm19158940wrb.75.2021.11.07.23.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:37:18 -0800 (PST)
Message-ID: <39681686-e208-3c75-c0a5-ffda2482311f@amsat.org>
Date: Mon, 8 Nov 2021 08:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
References: <20211106113916.544587-1-f4bug@amsat.org>
 <CANCZdfqjcUBMwdkh=RvNUHd57a_Ed6ui6ciq9y8=qsdMtZOntQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CANCZdfqjcUBMwdkh=RvNUHd57a_Ed6ui6ciq9y8=qsdMtZOntQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/21 01:39, Warner Losh wrote:
> 
> 
> On Sat, Nov 6, 2021, 5:39 AM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     cpu_loop() never exits, so mark it with QEMU_NORETURN.
> 
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     Reviewed-By: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     Reviewed-by: Bin Meng <bmeng.cn@gmail.com <mailto:bmeng.cn@gmail.com>>
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     ---
>     v2:
>     - rebased
>     - restricted to linux-user
> 
>     Supersedes: <20210905000429.1097336-1-f4bug@amsat.org
>     <mailto:20210905000429.1097336-1-f4bug@amsat.org>>
> 
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> 
> bsd-user likely needs similar treatment, no?

IIUC this thread, not yet (I didn't want to get into your refactor):
https://lore.kernel.org/qemu-devel/CAFEAcA-f=n6XHp5Cj7=tH8NWO1GLA50i34=5GyaHrZELyr0bjw@mail.gmail.com/


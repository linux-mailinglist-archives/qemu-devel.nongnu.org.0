Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C43DD596
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:24:22 +0200 (CEST)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWzV-0004d3-36
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWgV-0003aP-1V
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:04:43 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWgT-0005Pt-8f
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:04:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id gn26so30519990ejc.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MJY80RfjH18LW9aAyCX+LpvXazL6yNVxtsKwqkti6uo=;
 b=lWE1222FSgfqNUEoKFvTUIyU2WtkfO7huV75CS4SV0kNdJyGIzXvfPg2r25k+YGHCL
 iTTrnEuZ/syBN13aWjnLUN1TVkcP0L5iIAiCZcKFSMXDfjI05MAWh4HuHAiJKV+U7GXH
 nma2IB+cQdNem5BnO1xSv4aLAI1fx61zHTnAceyonE4nOMLS00oWM/p2vTo3mGHYBsyE
 L9Q7/rvAtzgSz4HhZU12QQL7zoG6+G7MCEz4a0cI5gQRX4TIwtABR5NMlYIP/1MlyOai
 qJPy889Gz0BOFWmrvzBA1oQ8UEBtCZ9JsYoALa4dIoCw9geqSLpJm+IG1q7qn/hZTeYy
 RGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MJY80RfjH18LW9aAyCX+LpvXazL6yNVxtsKwqkti6uo=;
 b=kr8C4GX4L7UAUgQad1k1p/K/pXgbblp/EK4EexexYN70AEUGtYe/aMPBit0QTPtejo
 WvUzZelL7GfwXxXiscUxnsUSdzgV0+tf+1awwQ9LgZ8piFWBBMiRB3LcCTFv6KHmXSTm
 KgWlKdAW+Gv/0SWWb4ZY7x7XSZ0iSbpwO+OQC3HsgYM+dPl13IueIZyU4AUgDguqLD1q
 uSRZyx3rLF/l4O4PwX/4kMDu7D/3nXNQbcLvIR4nUAuNILXfvKBIdrcj7JYliPfQ4QOG
 Wxm/RYg3efvba/dx3CqgJL8QB18BXxIyP/OQxwBpxT/yCb6KBJ7UhruIff68onODhNbh
 KV2A==
X-Gm-Message-State: AOAM533Wqm9EomQ7V7Wo0oBCV0pCyxs72Oe2bIj2b5ayI+Uw9U3Hq3yW
 3/v/w0jnHvtndVRq47qBDEPaK1jh3IcL9Wb5C66J1g==
X-Google-Smtp-Source: ABdhPJzZDOKflzfPJkjRNN5sq1I3mbzSCqwf9tC8bfPp2mKPh2TNyzhkWYbE4PdVI0QlUji0A9XNOuaRwQtxEBNHmr4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14936352ejy.407.1627905879766; 
 Mon, 02 Aug 2021 05:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-3-f4bug@amsat.org>
In-Reply-To: <20210728181728.2012952-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:03:56 +0100
Message-ID: <CAFEAcA8VSh-juGHeSa2N=d1izyexND24Er1B5YvX_4cR8kcUoQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 2/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers the assertion added in commit 84816fb63e5
> ("hw/sd/sdcard: Assert if accessing an illegal group"):
>
>   qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_=
t sd_wpbits(SDState *, uint64_t):
>   Assertion `wpnum < sd->wpgrps_size' failed.
>   #3 0x7f62a8b22c91 in __assert_fail
>   #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
>   #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
>   #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
>   #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
>   #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
>   #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
>   #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492=
:5
>
> It is legal for the CMD30 to query for out-of-range addresses.
> Such invalid addresses are simply ignored in the response (write
> protection bits set to 0).
>
> Note, we had an off-by-one in the wpgrps_size check since commit
> a1bb27b1e98. Since we have a total of 'wpgrps_size' bits, the latest
> valid group bit is 'wpgrps_size - 1'.

The commit message says "wpgrps_size - 1" is valid...

> @@ -820,8 +820,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>
>      wpnum =3D sd_addr_to_wpnum(addr);
>
> -    for (i =3D 0; i < 32; i++, wpnum++, addr +=3D WPGROUP_SIZE) {
> -        assert(wpnum < sd->wpgrps_size);
> +    for (i =3D 0; i < 32 && wpnum < sd->wpgrps_size - 1;

...but the code change makes the loop terminate when
wpnum =3D=3D wpgrps_size - 1, so we don't execute the loop
body for wpgrps_size -1.

Which is correct ?

> +                i++, wpnum++, addr +=3D WPGROUP_SIZE) {

thanks
-- PMM


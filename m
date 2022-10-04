Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3F5F4123
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:56:38 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offbI-0004Wo-Hb
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offYQ-000100-7J
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:53:38 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offYN-0004mf-UE
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:53:37 -0400
Received: by mail-ej1-x62d.google.com with SMTP id au23so7238772ejc.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Kpr+mrMrUQdkMJEhiv+SFh/OrvTKodmrvfpQjEfgfn8=;
 b=dMEUSEhPJSTOWFW3fZq0MJAhwejlXm+cde6mvgLeWXYox1JlE/QtkV+G9RlZCrQ9dR
 6wGx1eFGmA+sIqSi9IufI+thDnlKP9kMpbU+r8zNK6oVwoJUCjz98iE0V1bD6F5BdUeN
 273KYjYw8NtgLJrrsqrZFJftB9gvSeLg3dPydF7nL5vMUdchQSC2/yS8m3EToGg8m5ZO
 uzkH0ICgbnHKr2hEh7Yn/W1iMXqDo6SW+ib2UBX/D+f8OOvrTcLvB306kDbT8HwUwUaF
 A1xYpM7C3Fj+K0xsFUq1nPP+LMKiYEXz+B73O1TbMBA1SN5Vc0+uM6TGNfAnCZw2ekqL
 8HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Kpr+mrMrUQdkMJEhiv+SFh/OrvTKodmrvfpQjEfgfn8=;
 b=soHiXdmRRAmzXUydBesULCq9FdQzl7/DlPzehczQVNSdjh3iDEheQDiALfbtKfxiwo
 9dxo9Ixh9+awIHMbdTOMpIMc6CYnCN+Ljo8ZsnZxL5oUxDvsNZK/0DquBImDrXtkm2wb
 3wisHLCht2f429ZvZ7mzUwvQBkwnonAzA5uUQ9VfGgqGEQZKsQj3p18sH89V69GekOg2
 jjT4Y8DV//9jGDm9DqOwjQUNBve5wm256g/UipJ22/526ySlIFEKjO9lBwxXm0YkAe3f
 AFkH12J/wtjhx3BBfYHZEfMFCajWl8HqFghg5z4fKCPqJuodk4ojkkAMQU+a+WjxHiXw
 kw/A==
X-Gm-Message-State: ACrzQf17PwQ2lgmhKolzab8xjTxgLg/RqSXxlK6THC7OFML02kr2cfVV
 HIlYqSSVCtbC1I9TK7kPJa/7EEdUWMzu8bXaOMznfg==
X-Google-Smtp-Source: AMsMyM5kJpSL758b27/OfCCBDLYfam4LM2nL8cqTs9ozZffOQGjTIOVCC2Rc9YPGS3GZ3wWhhO+oyBLJ4MYrip82ICI=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr18007019ejc.504.1664880814044; Tue, 04
 Oct 2022 03:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
 <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
 <YzwM+KhUG0bg+P2e@zx2c4.com>
In-Reply-To: <YzwM+KhUG0bg+P2e@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 11:53:22 +0100
Message-ID: <CAFEAcA9KsooNnYxiqQG-RHustSx0Q3-F8ibpQbXbwxDCA+2Fhg@mail.gmail.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Oct 2022 at 11:40, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> And just to give you some idea that this truly is possible from firmware
> and I'm not just making it up, consider this patch to U-Boot:
>
> u-boot:
> diff --git a/arch/mips/lib/bootm.c b/arch/mips/lib/bootm.c
> index cab8da4860..27f3ee68c0 100644
> --- a/arch/mips/lib/bootm.c
> +++ b/arch/mips/lib/bootm.c
> @@ -211,6 +211,8 @@ static void linux_env_legacy(bootm_headers_t *images)
>                 sprintf(env_buf, "%un8r", gd->baudrate);
>                 linux_env_set("modetty0", env_buf);
>         }
> +
> +       linux_env_set("rngseed", "4142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f60");
>  }
>

>
> So, as you can see, it works perfectly. Thus, setting this in QEMU
> follows *exactly* *the* *same* *pattern* as every other architecture
> that allows for this kind of mechanism. There's nothing weird or unusual
> or out of place happening here.

I think the unusual thing here is that this patch isn't
"this facility is implemented by u-boot [commit whatever,
docs whatever], and here is the patch adding it to QEMU's
handling of the same interface". That is, for boards like
Malta the general expectation is that we're emulating
a piece of real hardware and the firmware/bootloader
that it would be running, so "this is a patch that
implements an interface that the real bootloader doesn't
have" is a bit odd.

thanks
-- PMM


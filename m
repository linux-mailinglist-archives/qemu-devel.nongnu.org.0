Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED11C020F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 18:19:17 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUBu7-0003FT-Ph
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 12:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBdo-0000te-5P
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 12:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBao-00045D-D9
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 12:02:23 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBan-00044v-V2
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:59:18 -0400
Received: by mail-ot1-x341.google.com with SMTP id m13so5335422otf.6
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AZvzpM0iOvLuHS3OTVM61+QPSNz1OnIyUOVib2ZSyNk=;
 b=MqxWZ/Cy07gtt5H+46vX5buMBOYmQr1V2mkdxbJIxWXbY9WHH4WmmaWPYWFYKRoWkd
 Tt6YfcoR8+fULmD/BHUIARkkMYfMfhJAVdKZhruB6NwqHwDlGpwT3OpAOabRdWiUL7Js
 BE/fDL1CLwEKiUpq/gGiJ7WcS+gVXYMHvIOET77oUyl0VDcoUcIxomyXFFoT9plSL3fn
 ym8nO9taISusAnWrpWjvYD/X/jsufBuVUvSMb3/4uW6SgLCquh/ftqRR11+S/uloVRE7
 JvQjbmxzjgFF3pSt6sW1WQaSZy7/JNtNZcAQZXoT6sd7mHAavvp4AjfUp953aCW5XJuq
 5zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AZvzpM0iOvLuHS3OTVM61+QPSNz1OnIyUOVib2ZSyNk=;
 b=ojAtZWk9U+VXahnIUBT0/yelQfKlG955MwKdIl6k6FUQMvq+rIjomRWjsGS1vPShnD
 5ReX1z9a8zSWpkLwyTl+XUbmrSDNAMJa/9RNX4H1kl6+5IOu5QiderAE6K3LidwM9i14
 0PSeUltgGra3G5r0qFP5k1ir/1ZDejzUV7wSKaocVDujKLbyABd8Dt5KqsbWWtlgIu14
 KpMw1lgx682zn85FpcgIW9MDu6MLK/YyqHID1gk9woY5Ii34XXpKxzH7BOmvU4NY6RjK
 OVdJpLUDYjPvp8nBxZlezKMVqsEPQagONhUMaLYNBKF0cq6gsQ51gNwPZ7mQ+HpwqJXz
 h+zA==
X-Gm-Message-State: AGi0Pubuf7YzFKOml9qD3stNu7ADylv86SIe3g5LNDyziVBS95uhIh8b
 3tioTk8TuSj0ipPmhFDT1Zh7s4oKVGytwMjQ5Dr0nA==
X-Google-Smtp-Source: APiQypIQjAd3+z2nlRW07Z0QvLHBsI0/+J4qiL7KaFIl5g+Vu4kAGBe3/PlejOHrs4zcXgM/6xZ9zpkrpviQMU8LjDM=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr3151692otb.135.1588262356613; 
 Thu, 30 Apr 2020 08:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172634.29707-1-f4bug@amsat.org>
In-Reply-To: <20200428172634.29707-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:59:05 +0100
Message-ID: <CAFEAcA8RymJaowHcp1_Er_GghPAzMV6RTP7jgxNVmZEvR5ssbg@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Use correct variable for setting 'max'
 cpu's MIDR_EL1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Apr 2020 at 18:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.
>
> This fixes when compiling with -Werror=3Dconversion:
>
>   target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
>   target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may change value [-Werror=3Dconver=
sion]
>     628 |         cpu->midr =3D t;
>         |                     ^
>
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied to target-arm.next, with the commit message fixed
up to match the patch contents:

    target/arm: Use uint64_t for midr field in CPU state struct

    MIDR_EL1 is a 64-bit system register with the top 32-bit being RES0.
    Represent it in QEMU's ARMCPU struct with a uint64_t, not a
    uint32_t.

    This fixes an error when compiling with -Werror=3Dconversion
    because we were manipulating the register value using a
    local uint64_t variable:

      target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
      target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=
=E2=80=99
{aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t      =E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may
change value [-Werror=3Dconversion]
        628 |         cpu->midr =3D t;
            |                     ^

    and future-proofs us against a possible future architecture
    change using some of the top 32 bits.

thanks
-- PMM


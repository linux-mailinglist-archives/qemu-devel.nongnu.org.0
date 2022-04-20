Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D6508F14
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:09:13 +0200 (CEST)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhElM-0000Oz-TA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhEiF-0004uC-KO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:05:59 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhEiD-00017c-T3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:05:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ec04a2ebadso26842607b3.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TLCQullsilNIX95lMjeBreZewiOqyqvugl21QnrqWg=;
 b=jhvZnHe7KHDO+fFsuOIJ5MwtTgAcGIub5RG3bJCGi4UwlcOHHN2Y/S7fSUo9fXpo7Q
 rh4PtETYvxoQzEWrC24ziPkzhoKBYZZBT5gOTzH4mNJufoV/ZO5dPxTwz9/RPUY1wOlG
 7NxyfalrBhnwyn2upW7ZBSQ6fsYVlBUKU6/I1cu227Q38qTb2oPonEr+OinkKMhOqQV+
 uC9p/W01fjRdX1O/YOxhop3RBA4seIH6r6LcHheSQ7dacqQkQvTp3RQmXVg4CquoGM+g
 RDVlpPsutYNdtuofllUAbozPirt23H0iD4WU2/Quv5cEiuzfwcC8LGlMAFENjBFwq40c
 rrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TLCQullsilNIX95lMjeBreZewiOqyqvugl21QnrqWg=;
 b=pr3NQCXF29aZUBxRwMV4WixeOWAZ7CKyl+cUDWl7dh3GtepwFMv/uBr7sINaLoeZVr
 JbdpJkpQKDQpb7BzdELm41+2Fa9vTRtkLo8F71C9EmSucAa3hxiq8hl8emEc8OJvwgOV
 UnNWulnoIg/FnS8Otv6xVeC8wqgVR4coRawm7/cYU5JM0SG41ClPmthirpCfXFO+OPaD
 sCPph5S0edtHxjx2yYyWh0bl75nZlKonLIAwFtHHojueebPV5a5i6EUnckAdqZ21jRUD
 11Uzg4wAHqEGpbVyD8jt6kCrwSA9w+hBOTKkmkgBvvMayzXv6arerBeeZMLrfJioze+T
 8PgQ==
X-Gm-Message-State: AOAM533JBz2Vpkadoowy6LpHF9vwsof6wPIXOjaGvUVGpYGIUNIqWKsc
 buwHmWTgO4s/V+97bcMZiweDynDDZDCSOUBwbIKQ7Q==
X-Google-Smtp-Source: ABdhPJzna05kaZNh/dk9pu6bj6cr/HxAhrWnO81/20ZE9lRp1IBLoHKDYO6Yzm179l3fer07lkn7+m0e4hd2/LRKVas=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr14920581ywj.329.1650477954333; Wed, 20
 Apr 2022 11:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
In-Reply-To: <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Apr 2022 19:05:43 +0100
Message-ID: <CAFEAcA-OhS2_cnVU8X9grX_XMeKgdDv__Y-kXsJkyj1_yLzazA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 20:15, Leandro Lupori
<leandro.lupori@eldorado.org.br> wrote:
>
> Add semihosting support for PPC64. This implementation is
> based on the standard for ARM semihosting version 2.0, as
> implemented by QEMU and documented in
>
>     https://github.com/ARM-software/abi-aa/releases
>
> The PPC64 specific differences are the following:
>
> Semihosting Trap Instruction: sc 7
> Operation Number Register: r3
> Parameter Register: r4
> Return Register: r3
> Data block field size: 64 bits
>
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> +}

Does the PPC specification for semihosting really follow the
legacy Arm requirement that the 32-bit version of the EXIT
call doesn't let the caller specify the exit status? It's
not a very sensible choice IMHO if you don't have the legacy
baggage to deal with.

-- PMM


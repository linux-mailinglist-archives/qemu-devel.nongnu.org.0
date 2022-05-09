Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB725203CA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:51:39 +0200 (CEST)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7Xn-0004ia-3x
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no7VZ-0002tn-2I; Mon, 09 May 2022 13:49:23 -0400
Received: from mail-yb1-f180.google.com ([209.85.219.180]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no7VW-0002yh-K1; Mon, 09 May 2022 13:49:20 -0400
Received: by mail-yb1-f180.google.com with SMTP id j2so26402791ybu.0;
 Mon, 09 May 2022 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4G/cAkTU35gF+8ZKIfALWk0i4ZdWdboZrRrhLTBQKjI=;
 b=s1Busb9fbz6iAc3GrhYTlb7fUDf7vD+0u5ftrvURyAZA1l4YroN/JfdGO1FpriGUlU
 B4oX1forViW0ScLfG18xvbi7pTPWMgcKTb/gI7a4AmmW0V7CO2pi6hqPfTRu7A79RRPl
 Y8HGDNqI4kZjaKhcYXqDVoVFs7TTTOZt71JIBLHIP1YCiVS8FICBoIbjjBJrRvz5G2Px
 esYOqP8xvjKLWm1Ra3V84Y0Vy7KDJPe7iVQP5T5Faqq5+jWhZiFU6ztan6SHfdy2h9Ay
 1JLhpjgPxWSzwHu+SvJRofbaG9qm4WFM8khxANG9BTx5DFf8B516Fd/052tVY9ib3Fi2
 9zaQ==
X-Gm-Message-State: AOAM533+r8SY/XZjjXn9zG6YHYAXCHzg9LwHaRI5IEOraQ3u+eDrpCga
 +glV1XxT5WnMtaUM8L+hvc3x+1flk9jhyjJiMg4=
X-Google-Smtp-Source: ABdhPJwXzA8qZ5W3N0ittO7YvJEUdVSCYrdoCSNNT1OEsAOxrUScxZ2HOwoujsJwPn4UX5J4AXLdSah4BSJTtHKossE=
X-Received: by 2002:a25:7691:0:b0:649:fba4:f552 with SMTP id
 r139-20020a257691000000b00649fba4f552mr13824091ybc.335.1652118557255; Mon, 09
 May 2022 10:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220509160443.3561604-1-peter.maydell@linaro.org>
In-Reply-To: <20220509160443.3561604-1-peter.maydell@linaro.org>
Date: Mon, 9 May 2022 19:49:05 +0200
Message-ID: <CAAdtpL4t9_SJ1a+ffz7ivvPwpfunjAzVtKyDMTYnLkJ6pRgNSQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Drop unsupported_encoding() macro
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, May 9, 2022 at 6:05 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> The unsupported_encoding() macro logs a LOG_UNIMP message and then
> generates code to raise the usual exception for an unallocated
> encoding.  Back when we were still implementing the A64 decoder this
> was helpful for flagging up when guest code was using something we
> hadn't yet implemented.  Now we completely cover the A64 instruction
> set it is barely used.  The only remaining uses are for five
> instructions whose semantics are "UNDEF, unless being run under
> external halting debug":
>  * HLT (when not being used for semihosting)
>  * DCPSR1, DCPS2, DCPS3
>  * DRPS
>
> QEMU doesn't implement external halting debug, so for us the UNDEF is
> the architecturally correct behaviour (because it's not possible to
> execute these instructions with halting debug enabled).  The
> LOG_UNIMP doesn't serve a useful purpose; replace these uses of
> unsupported_encoding() with unallocated_encoding(), and delete the
> macro.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.h | 9 ---------
>  target/arm/translate-a64.c | 8 ++++----
>  2 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


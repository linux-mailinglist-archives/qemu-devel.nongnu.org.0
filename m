Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47295380219
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:43:51 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNnq-0005eG-0F
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNml-0004nk-Vk; Thu, 13 May 2021 22:42:45 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNmj-0004YV-EL; Thu, 13 May 2021 22:42:43 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id i4so37172788ybe.2;
 Thu, 13 May 2021 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fFqmDdo06KCryOm411zSmyn96FB3OB+3USOa93pTRuU=;
 b=a50n9EUUSC1VE2eGJd3yxcbKziPDa4xv7jxeeikVLol6UpSRvfj1y3BHpl54lt9eEw
 wJ+NlW+DGXUZf/aGEX0LghpNNLSeISplmvP2bjDlrCJvlOetj3KMMppcF1i3y63tSIOC
 e4leWSJ2ciEk9Xx9mxCFLwowazzStSGOns3XlbOQIzvxigvbFbfVM3yvUBhl4yeZECEV
 dUVCmQxbISozLSLjvCemehVOijL1M69VEBUzEQOoA5rlLnPCKbLlwMi3UCfXk1itNva6
 CSwkyWMejt+O/a9yydIOyuAS73orBQ7/TtV2qnQCYncndUYb5D8N4QYu+2MLbtGDOyj1
 ckjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fFqmDdo06KCryOm411zSmyn96FB3OB+3USOa93pTRuU=;
 b=oeM4j72OyDAhDElZTR7mpznavxr/4oZ3x83T3uEb+NbIidxGhUoFlhcJL1lckCyjIU
 juNDENjiJ0RPUftBx1YLEk+qEC76TeoXbVxF/wJLRLltRux+ovkpA+VHhi1Ndu0lRm2S
 BoFd6fcOCZY194piQwcp7zqigxd4PQ+dZzksFZyDGUCAlz9oKEH2uvynFZIuDL+fK3/U
 RHcheztTcwCaEYrr1HYtx/DBsSG9plJHFIlYIviaQbbhfHz/n+HGjh1zYDkH7VisA3qg
 2sG2xwVLbVwdaM7JQ2GMKmG/v+wwKE4UUUa66TTOSNQCUxdTfj8tox0GnCFKiJ9Pbf/k
 c6qg==
X-Gm-Message-State: AOAM530rr0kIEi5RrESmAqScZbO/+rv4SKOWhDIYtGc5//8F/z3unh/Z
 j5/BNP+wyFqDNYdv02/R4J+1liUKPrjPPDOHKrM=
X-Google-Smtp-Source: ABdhPJx2nBnYqJXydX4Jfe2DR1wPHvhmxD6rJybNu6dlOtRci+f06fMGNJb74A/KSunVYMNWwJFMe6S7HWIFM11o6ZU=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr27593505ybu.332.1620960159510; 
 Thu, 13 May 2021 19:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-4-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-4-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:42:27 +0800
Message-ID: <CAEUhbmXfN=TZU+xi1SG+PzwnPedUQYAYSvwUzdDJrKymFRp4-g@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/arm/Kconfig: Add missing dependency NPCM7XX ->
 SMBUS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Doug Evans <dje@google.com>, Hao Wu <wuhaotsh@google.com>,
 Tyrong Ting <kfting@nuvoton.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
> this isn't advertised with proper Kconfig symbol, leading
> to an early build failure when building NPCM7XX machines
> standalone:
>
>   The following clauses were found for AT24C
>
>       config AT24C depends on I2C
>       select AT24C if NPCM7XX
>
> Fix by adding SMBUS to NPCM7XX.
>
> Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Doug Evans<dje@google.com>
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Tyrong Ting<kfting@nuvoton.com>
> Cc: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


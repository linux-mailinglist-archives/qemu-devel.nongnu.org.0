Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BA6028BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:50:38 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjF5-0000gy-Nb
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okits-00038q-Ld
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:28:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okitg-0003Lg-A4
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:28:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so16793128pjg.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dvj2LZOPuRCIGIZhk+v5GeI+35KsaJkv9TYSPnl6wnU=;
 b=jkJKbAZ/p3RMuvIs6i5EZtloEo8tGv36EsjCV0yjHWma6UUUJz7WBvRISoAY+dEu/P
 bH0f3zaqJ8L70vcSgIFP9ns1CfIyiu8lAcYehe43YjnY0jSC525vQ/Xztmn6TeQr1YfH
 P3Hj7F0rdtA0+xFuFpY2o+Xras5ohli1twxiAaew5r6wlFPOuz9/H76+YyaumhGQ/5fk
 kfmzy2juEktVPdYopnPVkyqZUC2LJIsYrLDS2b/EFrc+uiWYxhkn/HGpu1HL5awF5d+a
 aSMbeM6FV/1fmvIYo9vrINXVjJ182iqKkntZ2+UL3CUP/ye/3bE2HslRyQs+OoUeBCvq
 sO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dvj2LZOPuRCIGIZhk+v5GeI+35KsaJkv9TYSPnl6wnU=;
 b=CdpHOxIDhJ+Ysa1Wflv1scfxsuuaX9qCwXA5Y6x9DyoljvJHW+VBs251dOHgxcTkGR
 TOMnVCQAuuns7KoCx+UYRCk3O+QBFAchX4rgsRuIax0lzgP9UmjtM8KShyScfe8nLL80
 5wzCt5JR0PZ0W/wyEVxh0BdpnLX70hRNttPlR1yykyPs3cDHqOxAKh3KB9JGK8/Dg12O
 sbkHwEJs4AErLKkbq1mv/pEJAK+kDojlQiBfARUgvHcnfkK6MQ/v33Jg8M9pIwK4j+3J
 pZnGb3ecblACmK0uMqcLdx2xo/LHbum6xX0wH8/gkcFFOqyBylvhq97xTJS/JW66Kk+d
 F2HA==
X-Gm-Message-State: ACrzQf2+NDZHFj7xtiz3tQbFaj7zWCETLtAAwiRe/pf4w+s6roa9p9fi
 UnXdFZ1X9jEFYV2quyojR0eJ9PoH0dXPS7j6E6QhgA==
X-Google-Smtp-Source: AMsMyM53i44s3G40KNR5cpU4WKP21xZsiu9Y+vd8RcQslSonMw38u/78Kdsf5VlAzBAUdoZgZp0oNHeM1o2NxJte97A=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr37276928pjb.221.1666085305892; Tue, 18
 Oct 2022 02:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
In-Reply-To: <20221016122737.93755-8-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 10:28:14 +0100
Message-ID: <CAFEAcA_19oiX1FDOTVTfyhLMaEQhcgx+2xoYB+CsZVq5uGb-GA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sun, 16 Oct 2022 at 13:28, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
>
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

> +        pfl = pflash_cfi01_register("e500.flash", size, blk, 64 * KiB, 2,
> +                                    0x89, 0x18, 0x0000, 0x0, 1);
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    pflash_cfi01_get_memory(pfl));

pflash_cfi01_register() puts the memory region into the
system address space. It's just a legacy convenience wrapper
function, so if you need to put the resulting memory region somewhere
else, just directly create, configure and map the device in
this board code.


thanks
-- PMM


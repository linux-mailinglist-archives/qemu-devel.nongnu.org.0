Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C927671723
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:10:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4Rn-0006yy-Gj; Wed, 18 Jan 2023 04:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pI4Rj-0006yC-EV; Wed, 18 Jan 2023 04:09:27 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pI4Rg-0006cV-4n; Wed, 18 Jan 2023 04:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ejXWxr0YLrzKjCzpcF5P5egrNTo3WPZB6fBqBWz8LKQ=; b=H5Cx0Atw++Kz8ZSX4Q1t/k7Y+C
 5zlBBPeyDps3uPHHhSXOoHvfkz1tWGp+74GDLsn3S4AtHXYevvrQT06OqNI8qIJDAd5zoc/52Ygx6
 kb1ERggQK4Kj3iFbS9/14Cp6UF2+qDzYnL9gNVQMT/opVI9FO15L9mKWxoL4Rcf6EJY0=;
Date: Wed, 18 Jan 2023 10:05:02 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Message-ID: <20230118090502.yzulfps3gccwa6t4@schnipp.zuhause>
References: <20230117184217.83305-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117184217.83305-1-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.18.90316, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2022.12.20.5960002
X-Sophos-SenderHistory: ip=84.154.186.130, fs=14434589, da=161642025, mc=69,
 sc=0, hc=69, sp=0, fso=14434589, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 07:42:17PM +0100, Philippe Mathieu-Daudé wrote:
> Remove dead code:
> - unused fields in CPUTriCoreState
> - (unexisting) tricore_def_t structure
> - forward declaration of tricore_boot_info structure
>   (declared in "hw/tricore/tricore.h", used once in
>    hw/tricore/tricore_testboard.c).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/tricore/cpu.h | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

I assume this goes through qemu-trivial, so I will not pick this up.

Cheers,
Bastian


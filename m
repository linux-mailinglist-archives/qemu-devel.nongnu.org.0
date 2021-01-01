Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1D2E839B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 13:04:24 +0100 (CET)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvJAM-00085z-Ns
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 07:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvJ9N-0007fS-Nb
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 07:03:21 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvJ9M-0002VC-1T
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 07:03:21 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ga15so27893090ejb.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 04:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ppveAjEpvQyjxsj/0lwZhLu2sxlDqyE4w/x/BAJMrFM=;
 b=r1hZR4Rix+60NQSp7hsIhQRgmwtOIMShnl5Xppv0/0QrHJJ6txFX3Ic/jmimUdhAHa
 Kh7+IL2ai69FWqL8JfMqjwbvHj6myiyqt0zz8SexW/slbnb4L/NBEyRs5hJVV+niNZK9
 CsoUY9SqwO+bG7r4eAk0DiwKtfQHr3XTz6zPJiftdWiCv6mNybLr7mfsjrsv7DhFD0hF
 2H93+kSxTz+ljXauQFIspK/G5PzxzjJwNTlSvnY5KT4abvCeYY36h0zyf4WXB4GNiDPI
 WD/4Qi4+SOoUdZpspu88YEMJ68Oj81W5bVBTsSB84l1frf/Zvg47BEKUajPKfnv5jji6
 7vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ppveAjEpvQyjxsj/0lwZhLu2sxlDqyE4w/x/BAJMrFM=;
 b=lj/tBRUACZcOQ3KchlLvO9gApnl+S6iPSVysolEWWlPHyPugDOPytWFyG3iXbYHp7t
 M+6XQudjxAjSy4BR7WixvEjD0+Q7UG1f+BkkWBRLK2aeUpw5K+2wvp3CWusk24dI/q5W
 re54Je81cgKeyxhdHF1bejgEMtdu/CYO1AZahiNukAgFvjTMF5n6G6J9PaaiZ+m0/zB/
 MkPCMz+DcSzKiR+uOFjXRAmfgQlPH3wJJ3tbS5zlVqXjPvEE/NhACgreP6y6eTA9656V
 CXBKjBT3N65njxMeuooHm+3kziNWMC0DYzX65MaEtbNoPnDNcquZzsYT74t+waBxWjf6
 Ln1A==
X-Gm-Message-State: AOAM532+mRAuaKxLwlh31rLrK004rzF4KBdtQfdeLwPF0ZymuU4VPZGC
 cE7Oj7TuV9cP4mqJwlDRswZy+FF47T7x7JSYUI7heA==
X-Google-Smtp-Source: ABdhPJygPwlX5CfkG+om7m+d70GjeVr+39CSp23Vyeo0WAefWnHJPaT7JSQYBoOMCP6iS5eNLbcGwCBjaCVdwSgDhsI=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr56207378eje.4.1609502598042; 
 Fri, 01 Jan 2021 04:03:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
 <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
 <CAFEAcA_bAjvx1oWO1DGimmThE7BhGHE0EqCoCR4nhuO3DMY_2g@mail.gmail.com>
 <79681dc2-d689-4518-a83-dead38dd6e8@eik.bme.hu>
In-Reply-To: <79681dc2-d689-4518-a83-dead38dd6e8@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 12:03:07 +0000
Message-ID: <CAFEAcA_hROTuxFmXZq7dyp931XWr3reXHUtqzDLdQu0ynixUHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] sam460ex: Clean up irq mapping
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Dec 2020 at 20:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> The SoC is called 460EX (despite having a PPC 440 core not 460 one) but I
> think you've looked at the right data sheet and it's just a typo. I also
> don't know how the board is wired so I think in this case I prefer
> dropping this patch and keeping the current code just for simplicity but
> to avoid going through this again maybe we should add a comment saying why
> it's working. Can you please suggest a text for such comment pointing to
> the relevant part of pci_change_irq_level() you refer to above? I don't
> think I understand it enough to document it.

How about:

/*
 * All four IRQ[ABCD] pins from all slots are tied to a single board
 * IRQ, so our mapping function here maps everything to IRQ 0.
 * The code in pci_change_irq_level() tracks the number of times
 * the mapped IRQ is asserted and deasserted, so if multiple devices
 * assert an IRQ at the same time the behaviour is correct.
 */

?

thanks
-- PMM


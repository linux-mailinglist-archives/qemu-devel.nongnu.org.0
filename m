Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F52F1C12
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:17:55 +0100 (CET)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0pG-0000xB-4M
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz0ma-0008I6-Fe
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:15:11 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz0mX-0007VW-02
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:15:08 -0500
Received: by mail-ej1-x635.google.com with SMTP id d17so663771ejy.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHH51Ky5Z5iO2qLfE5CJZXdUQNuS8/VjtHYKB1+yRz4=;
 b=qbhPB2rGr8M4/Rme+F2CGihnQLkLpPd7qP9CHhqSuv+Jqp97Lb1dFf54dvFP7nX/ei
 r6uKtLEFP2ynYEWijvHXFOqTEBnGqV0Q5SSzrHnYOhU60s+2rjBcBvTu4ArduTJII7Fs
 VFiDS74zFnDzvFLty5JZwjP3huC0UEo05vZxKCs4QsU5VUlrOkiDmM6z3hKr0vraJth7
 NGzn7TiJzrZJPDNGISr1NSbcC4Jdb4caT3Xt6p6gAR8GHmqzGIzn7/dErjRvggZBxhTn
 2OGnS+rg/qu/8LmfarSxFemtSYSm2HtB4Yc6g/dpg7SwbcpN9/9xYRcRzOK/jT5WkQG8
 78tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHH51Ky5Z5iO2qLfE5CJZXdUQNuS8/VjtHYKB1+yRz4=;
 b=ZJZTNA1F51d7U6yUH4y7vz8Mngv00unjbSJOR5tjo3nH5GBiAx0qUspvPyer+tddHv
 je/QD9ZLutzOBonpIMbc3nls3dXty7ORu9bl9bh8ahJbCSQzmC7J/pLNu/KDNzP4WlL0
 mwbwPjtbCgdgE1DYdJzNBDuQL/OHe26/e4RfuXK+Y4GJ4QeQ332nHCr7Az6lrtzA4H+L
 KwMpKIsfy5W053bZVx5O6gvcYtVB7SXgTmDEiYT1IHwk0TTMznNQD9Ky61TZJvHZteMP
 vKjcKSLEeMLsMIQL91EugmqHOYt3ySq2K9Vl+uouez9maGxdAajyIjg6kk+IQu0p+/Iw
 PyFw==
X-Gm-Message-State: AOAM530l5L7wafNrpYLRaZJGuWMCw8Hs/UFj0I2cARd1LDFJHsicj1f0
 +nXwtrPxzfNWltIzoL1fbN8PsCRndd+BCHhOrK7htg==
X-Google-Smtp-Source: ABdhPJz4O2Brcs/vFSLE5GpJd8xQQqdJQ8/2am6ggTO9RFUOMZRIUtTiNh8QnCMEVyMT5UbP/IskEMyp3Pj5+7v62o4=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr307702ejf.407.1610385302531; 
 Mon, 11 Jan 2021 09:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-5-peter.maydell@linaro.org>
 <20210111010028.GA3499905@ubuntu-m3-large-x86>
In-Reply-To: <20210111010028.GA3499905@ubuntu-m3-large-x86>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 17:14:51 +0000
Message-ID: <CAFEAcA9EFdDq+cLY=Z_R=w-u+N1pCZ-Mnq+ckFQ-z2_1jQckuA@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
To: Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 01:00, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Sat, Dec 12, 2020 at 12:15:33AM +0000, Peter Maydell wrote:
> > Switch the bamboo board to directly creating and configuring the UIC,
> > rather than doing it via the old ppcuic_init() helper function.

> Hopefully reporting this here is okay, I find Launchpad hard to use but
> I can file it there if need be.

Email reports are fine, thanks.

> This patch causes a panic while trying to boot a ppc44x_defconfig Linux
> kernel:

Sorry, yes, this is a bug in this commit of mine. I didn't notice
in the conversion that Bamboo has a non-standard DCR base register
value. I'll just send a patch for this in a second.

Thanks for the repro case.

NB: with the fix for the the kernel proceeds on to the PCI
related assert that it hit in 5.2.

-- PMM


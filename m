Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E72DAC22
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:37:26 +0100 (CET)
Received: from localhost ([::1]:34506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8dw-0006fL-Od
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8cV-00067U-A9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:35:55 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:42637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8cN-00059r-P7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:35:55 -0500
Received: by mail-ej1-x644.google.com with SMTP id d17so27215263ejy.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugHnBKbiOw+vGkqie8l/9hZ/o/LVdpm68kVJpnSWLKM=;
 b=b/OKRcYZRZkaYL476g0MVRN/NbFkCoJsZTnlPSicfZ8cszo0p4TS0DMfT7Az8MEvg4
 OlEF7XtLuKmuIXL+Zdi9VCYKXrXLKBNPA9gmRMPwLl66JOcGsnBSGI8W6998tGM9/wR5
 Osn4hLU6ZRdhFsr+Y+W0lk/9jS1ZIyJl5FgQZn4g1dYfCzvLIWcxuI66vvC3wVzTLDe2
 p0O7jf94T3Gxh6O9ONNfkqDTt3qeBd5dQ8cLq4oukOZ4z1mufJlvNYu6A84+ccIUTl30
 VljBp+CIyDMPi16pIwWK6vBXZV6hrRMvQ9BvxjMD5WHhebITDqnSeQMIcTbRkEXuaEqp
 wQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugHnBKbiOw+vGkqie8l/9hZ/o/LVdpm68kVJpnSWLKM=;
 b=XsGxwCLiWpMeIdwpotlHqTOOeE/uWQx//QjB+1yopWnSNsFKFd1NuJi0ypmJbO6PjG
 WSFYqxos7VJDgVOR8w0Gxy9bGJMdohkMPpnZSKhxWFW/tsHUwCDGGfkrKoIUK+eUfslR
 X6fEMBCsT4MgMDEpKrm2dOKPaKJZzlKHsgf4GzrgZMerKoEP+OIpQFFibhuRjXSK6CWD
 RW7UYap/V+DhbV/V0N8kH5MPxAqgpdbmixsSx3nUSl3vaBUM02GbPhWKfvMZHiffMpIY
 gl/aPPkyiduqsTh+MdIszxddWePgr6wyzVKUfXiWCrhIsm8MhzwLJyvgouVm6hA4SGYd
 8S/g==
X-Gm-Message-State: AOAM533MYZ7xhWa/6SafgbzeGkIAIRwF1pmJpJUWK+MDnYEBsTkOeuVy
 TPAitANNlZrj3Koc2NgMgaf2mvqJe1VZM1y055a/2g==
X-Google-Smtp-Source: ABdhPJzm1ZEdoGmibVNkZqWoylSIVNNbpcozWXwnWwjAdTXaSIE8hKr4pWDb+XSTVfi3yx8pDz8+p/XJHTlhewLB2pM=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr26367127ejf.407.1608032145960; 
 Tue, 15 Dec 2020 03:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20201127071803.2479462-1-ganqixin@huawei.com>
 <20201127071803.2479462-2-ganqixin@huawei.com>
 <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
 <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065F5F11@DGGEMI525-MBS.china.huawei.com>
In-Reply-To: <A5B86EC83C48EF4CB2BC58BEF3A2F496065F5F11@DGGEMI525-MBS.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 11:35:34 +0000
Message-ID: <CAFEAcA9xHaewrSMWfCWDwsFbm4mz6QwKT7vDDHv78mEkW1ad2w@mail.gmail.com>
Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
To: ganqixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 02:38, ganqixin <ganqixin@huawei.com> wrote:
>
> > -----Original Message-----
> > From: Peter Maydell [mailto:peter.maydell@linaro.org]
> > Sent: Tuesday, December 15, 2020 12:20 AM
> > To: ganqixin <ganqixin@huawei.com>
> > Cc: qemu-arm <qemu-arm@nongnu.org>; QEMU Developers
> > <qemu-devel@nongnu.org>; Chenqun (kuhn)
> > <kuhn.chenqun@huawei.com>; Zhanghailiang
> > <zhang.zhanghailiang@huawei.com>; Euler Robot
> > <euler.robot@huawei.com>; Beniamino Galvani <b.galvani@gmail.com>
> > Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the
> > finalize function to avoid memleaks
> >
> > On Mon, 14 Dec 2020 at 16:02, Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> > > Please don't make unrelated whitespace changes like this in a patch.
> > > We don't line up the assignments in this sort of struct -- this is
> > > deliberate, so that if a new line is added whose field name happens to
> > > be longer than those used already, the patch does not have to touch
> > > all the lines in the struct to maintain the formatting.
> > > Instead you get a readable diff where only the new line changes, not
> > > all the others.
> >
> > Hmm. Having said that I see that the other 6 devices touched by this series
> > did use the line-up-the-assignments style.
> > Anyway, the style this device was using is the right one.
>
> Thanks for your reply, I will resend this patch. By the way, do we need to keep
> the other 6 devices in the same style as this device?

My suggestion would be that for all these files you just add
the one new line you need to add, and leave the existing lines
in the struct the way they are now (regardless of which style
the file is currently using).

thanks
-- PMM


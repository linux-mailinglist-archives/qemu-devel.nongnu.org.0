Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577A3A6B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:04:38 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsp4m-0004kH-Jd
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoml-0004Vh-Ix
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:45:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsomh-0003S4-1y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:45:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id r7so32708493edv.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32bMIUTxeonRFRYrGNFnem2Rh5dCNI78PvgM6rEoxZM=;
 b=pRW5gwLtiLlut3KIlHILgsING7SK0jXinODM+UwDS65FH65HJKZebXjlUtvVukkoT8
 2dZsA1hcsVm/AtU14/V6bJmZDDJdZVd1C0ghUJdBZsxStCqLDoFHpHukFPHL5DzR3IlZ
 glVxDZ3jpLnDQL4xKxX4git/tvik6wvMkNuaCt1JPlpfBGyElDcC2Xr2ZuhkpdnwZfjO
 sv5JUIAt34hl4cDkjClH7PdNfJSob7348JckfWZD8zqcEd3lA+hq3JQWlFZ0atJ9RvLf
 BCZ2cAj08gw0XBkjQ/MHE77sKFm0dPz95eCteLm9YKuYCnAqBr5+ze7o6ioyGqaw/UTm
 EzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32bMIUTxeonRFRYrGNFnem2Rh5dCNI78PvgM6rEoxZM=;
 b=ISLzrxSEvw2A+Rx6ISVXN3cNdrhBCrPZw+mBh1zrHojPXKR+vDxhqs8OR0ViBMmr6K
 KXLLmEkZto5y9L4iKJSOPaxRJdI28D34wj052mNWEEd4eLl1H4JHlLQBXGnf/xSedITa
 5O2c7o0MnzTiZzTBhakhseLDvOrsZJbTnTuLIT+IPW8kmzeWpkGSmpslCQ7LsxqNyXov
 TZ7Pdrj5+X0c4Qzba40xeWaMWKB7gg74/lFmX1i3AUzNH2B4P5wH8K0ZFv5jvkmdm8Qs
 XoAJVdjydg5pJUTosRtAPV2NE4+S1mbJ+OkIcLiXHNqf8TxbW9t4WfRS9IDEN/fxNisF
 /HHA==
X-Gm-Message-State: AOAM531KBAY78a6mdQunET24yRW/3IzfutfS/ZaWUDJMugEYQMfN0U8Q
 DA+AT6YH+bmZisJZtLOD6zeYhTKzqSgwnkSiLitS0A==
X-Google-Smtp-Source: ABdhPJym042afK6zkd3AhzXzyoHQG3SHcLycIIwcE6OqY96XeUW0yp5WeWMxMd9Ln7YUjdEdscLislT/19+ruOtdd9k=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18018209eds.146.1623685553161; 
 Mon, 14 Jun 2021 08:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:45:18 +0100
Message-ID: <CAFEAcA_6_DR8274THptyC=pOocDa6mEtJqQGxnh8ioY_8FmiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
>
> This is a board supported by OpenBmc.
>
> v2:
> - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> strap value.
>
> Patrick Venture (2):
>   hw/arm: add quanta-gbs-bmc machine
>   hw/arm: quanta-gbs-bmc add i2c comments
>
>  hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)



Applied to target-arm.next, thanks.

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E830810B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:22:41 +0100 (CET)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5FgW-0001uo-A6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5FeC-0000gt-Mb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:20:16 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5FeA-0001FB-QD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:20:16 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a14so8435605edu.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9v028Lq2c5xwQnF4JkNz1DGTaBodbxP8mrO9SMuNQaE=;
 b=Ih5W84Qi/cSE0qClf0wtbMm+m869H24/jwOFy4EY2JPC1leyCyZEMqHqGguLgw6OUz
 SSHMWl/3UesbNHChjrCB0xDADHpl+0GkBkkXU8I5mPqnnAVqf4fYvDZihbb8WzgrZCzM
 p55mIHxbbTkcg7XRBcFd0bnYeX0yM3f5X5NCGs2dGHv9Zr5kZBBmy1h6fHVpRafvHzcU
 wIwwrgbJ/lk98PmilYn8Sh4QcTxzPxh8Zg26JuXWAQiHe/HfLSLkFNdgbeXw9cC1ZOaZ
 Wsa2Yp31QRdct3k9E/7xUXyoaxcxnOPMoAkM+vFbxgySekR5su8y6tj8SWjmTf7QdN5I
 9KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9v028Lq2c5xwQnF4JkNz1DGTaBodbxP8mrO9SMuNQaE=;
 b=pXac8rNMy/U+S0F5/+ecfgvLjuieSqrcwBfGA8sPdswVsFFROKly06oDCfDt1tcn22
 M+TlrXEVlcVLC4jBUd+73WUBgX67IXZ5tQPvI9gylOeldOq+jmoxXA4V+qGRZHfM2R4R
 GxePVCVpFzvS688HXlmMSHZtsxAzflQxyBI84OnstwQQw7luvJPhelpUKg/M1O2u2fQg
 QJdIvTtgAr1+8m1D34DnCB0p+TQOdQQWyZCvDBx9nLCTgPnS6wOiVEGdkqr+lAElm5Rr
 OLyXbhT5dWLE0BDk/xcjIdTMLnLjTQy/Aybbdz7T63CD/Lh8EzseGeZZzIx70rEqtzsk
 x+Yw==
X-Gm-Message-State: AOAM533E9n3rx0K5m30ADwFtESVgVsO/DZjSVIq0hFAJeBniNZ5yL0bS
 5YrUi/phehoJiKzt/K1uCMYXQooMRr2Xww21C+fGHg==
X-Google-Smtp-Source: ABdhPJxxWrpIEtjr8HzpFg/jDCin07l+tOl/O3AAvxzPMBX0e64NYOk2xBfZWBIr4JGU7b9pFe1cMoSAd66jET0bRWM=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr1997521edd.52.1611872412730; 
 Thu, 28 Jan 2021 14:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20210128221728.14887-1-mark.cave-ayland@ilande.co.uk>
 <20210128221728.14887-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210128221728.14887-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 22:20:01 +0000
Message-ID: <CAFEAcA8Eaor-NLGCp0oB=O=ijFj9iyfMAxbLGiNJzmiGgZBWSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] utils/fifo8: add VMSTATE_FIFO8_TEST macro
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:17, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Rewrite the existing VMSTATE_FIFO8 macro to use VMSTATE_FIFO8_TEST as per the
> standard pattern in include/migration/vmstate.h.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/qemu/fifo8.h | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


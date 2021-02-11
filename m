Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A959A3189A0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:38:57 +0100 (CET)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAJE-0006sh-Pk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAHN-0005ge-6P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:37:01 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAHF-0007F8-D3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:36:59 -0500
Received: by mail-ed1-x536.google.com with SMTP id q2so6608883edi.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xyRTWz4qZDobwfeQvAdCQPdHz6p1m+56zbWZnrK8PDE=;
 b=d+swLS7W/iJM897yQ59PM10M+PnbYLHlvV2ctftY5dhajV0UGxkZL5+I4ObYdIBccO
 E7ri66CCw5DDT0QmuOgIS3KqfUDLRVA18h8yR3j1mbGSraZQCrfaF7Wzn0svbnnKERTt
 6BzX5baUGIqcwxuZGDJ6V1Yg+9gq6/igfy9ltAnCw38W6F3MC74pLmpY740SAP7y2het
 57bff6DoQkQo7B9ScPLn4j8ZU0k5dpHyjbNGSqtuQ5AyrTnPM4zy6ShK5LB9FFMLasDg
 81CYibzLFdNAu3jdUReeIprVh+jYcP/ZIxLsBYkynKCqxoSFGG0MvT6sATMrv8gTlTAz
 Q7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyRTWz4qZDobwfeQvAdCQPdHz6p1m+56zbWZnrK8PDE=;
 b=uaSheaC6HoKOhwvwMSqNuMzWAB0DeugW/FYo3Q5MkaisvFY+aGx/eZ9nzSjgrZYKDr
 gRk09n0qSHo7K+CwRJpiWlyYLWgYWha+6CJrfe9kNHB9iF9nkYIcd9Sg1ubIrrtbhq2m
 88kOfHXZ2crOTSg62whBNWt8dMt1o2ADY7GNAyXmWHNvyPnRrjIVCx6oFp9r/cwMyx4f
 E+qOBT6743sITWzsqpkBedehk0dS+Jbd/kgveY7WIWnAW5VtO+OqIlGboma/gJrxcxiE
 7yznIsvTZzQPzum8S5BZ7suntOvr0MxuBNW3GpN/LUM+FSEK8kY6/LOJSZoi9VJnmKxz
 Elog==
X-Gm-Message-State: AOAM531RXacnHOd+S7RayD90TfMNMwyB3ZBCMpNFL9hMy3T/Rnfo6ni1
 KAE/2eAfQHyiaW/lytHDe6X7TKD9vdR4MNHnxx2+Yw==
X-Google-Smtp-Source: ABdhPJyz8cKIU1rzW5zyHeuItwtoTSseTq3BHlbRNlSLlXFplMlP2rfs9foJxtG/vFMRA4fLVxLVB7o566kpPsAX6/Q=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr7758253edn.251.1613043412018; 
 Thu, 11 Feb 2021 03:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 11:36:40 +0000
Message-ID: <CAFEAcA-EPLtmx1-x3BJYVFzQWJqW5uznZVXYi-3JJMb5FmM3fQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joe Komlodi <komlodi@xilinx.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 14:20, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This is a minor clean-up making it a little easier to play around
> with different CPU configurations.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (1):
>   hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

Applied to target-arm.next, thanks.
PS: you don't really need a cover letter for single patches...

-- PMM


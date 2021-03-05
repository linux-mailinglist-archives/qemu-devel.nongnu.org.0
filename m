Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC732E724
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:22:34 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8XO-0004Sk-Kl
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8WN-0003oR-Nq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:21:27 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8WM-0004Ep-2c
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:21:27 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ci14so2706958ejc.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBrCHZk46J6RhanFMsFG8tijtIBGUooF2MGBbUqVnTE=;
 b=sWUym+xGBKohuikeo0a5AYRvorOwiPWIGbJMxSsHENWS88Hb8hhHhrJrCyqucP3mOK
 hUNzOYNH5Y7XzhOE2FsSqWm83h1n43jw7/cTfP1/K7+cGqYa2zJfVGRvjY/kpHS6A1H5
 cIgCul9BLbMR5b64X9GXkcSEKApxz9QGI6I2Z8QYIAIjPh16J18mIgpxnpjrxXtVvL8V
 q6fDesMxXl5w8jXZqyZa4vC8Xq7C79wM+okw4dFyrmAtuU52EGjztTprL3cGC8gIZZ83
 VP97E9SSQVNS2G0r42ZuwSHxHMmU3FpTdlv3rcoy81ufbg23f9ej/43xQAUnFo5qLF8v
 paWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBrCHZk46J6RhanFMsFG8tijtIBGUooF2MGBbUqVnTE=;
 b=mj4MuChBSTPwG/rP43QBFNyDsN4sP9eZZWzddD5e6+0e3GflRetj3ZpxhJtmWz2gYb
 jye1SRvBOm2hwwJ+Zes2C+oAoXcl/CqszAwT7KAcaNZ2vdnVOGTMgc8t/tWPmiOgo4R9
 zUblkLpKXRgPIjldQZJuSCezVC/+66spe9XbWoRK289qAA4erScsQ+XOUqKpEEG1TGGT
 F/tPiHRHrsFAlh9AwroRZ3D74iTe/hFPRejpVysL5oQu4VDSSYSL6/EAoO7jNgXZlFf/
 tohdtTFHpjJAXpzZvluGFoXyRu/rWGXOxSmUPJhRgBP6lLBZCHNlD9fWd/r8wQTMdTcl
 g3jw==
X-Gm-Message-State: AOAM533ZZPN+X196hHPox6sR1EJrppH3/1MyqJYGPkwSBMgdJbdoeMbo
 /fGudGW5D9Vml5jfzoNKzOe1mo5WGNfnsdyrbxEDIQ==
X-Google-Smtp-Source: ABdhPJyjZm0rbgu/WbmfQkmFUUZ0n8hvwdpB0KkgQLubvJ9QbTEM6tJrlUhNwuvRHO0jqeCJGAN8XkrMTwnqXIjjCDM=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr1852311ejb.56.1614943283854; 
 Fri, 05 Mar 2021 03:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:21:07 +0000
Message-ID: <CAFEAcA9MVZgoAZD7kDQ3MU-z=wp40eUp-yvZ7XdsNPVkk3NP0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] sbsa-ref: update list of supported cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 15:01, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A53 goes away due to 40-bit address space (so below sbsa-ref
> default memory map) and 'max' goes in as we want to be able to test SVE
> support.
>
> Marcin Juszkiewicz (2):
>   sbsa-ref: remove cortex-a53 from list of supported cpus
>   sbsa-ref: add 'max' to list of allowed cpus
>
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM


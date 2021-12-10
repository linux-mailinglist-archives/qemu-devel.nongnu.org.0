Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE34470556
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:09:54 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mviT3-0007Hs-Ab
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviPD-0001lC-VO
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:05:57 -0500
Received: from [2a00:1450:4864:20::436] (port=44001
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviPC-0007vX-9h
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:05:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id v11so15672396wrw.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qgt2FEV5WNQAEOEArrZZgumlAB9OsrfsNuRgDwxszIE=;
 b=WW+bEywuPvZICyukoYKLf0WzbTQcmjm//TAvMPgUGdH5/KA8YW9Rq96M+BHKLeZSuV
 OQrzpoHViwLaSvzpLinmktjdwEqXilu/peixarhBdTLDCFM5h9w1MFkhytXcbJo0mDPw
 WLOaP92ziapW4MPCXoddEZ7o74dByGhpC4vrAF54fP+bG+nsJjt+AYsWlZlxwO8zXEUq
 /OZ7vg18jfnlr3dfILdP38aPGC++m+6+KiJsfalUjltJFDeR3v7aAgaitd5ePid4qvVa
 IW7g1pzpBIpDHtfnUoICwFUNyewcSZcMfHuf5Rslr7wI7/MDNAn2bBcGXVKddjK9c4xM
 noVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qgt2FEV5WNQAEOEArrZZgumlAB9OsrfsNuRgDwxszIE=;
 b=KDZfIQg22PKkkvjdnHR4PercmZ2wN7XGNOvBFCvLEfKl/xGCz/DLuR1g0E+ES/oGFR
 veUJ1sIBEnTxHKrL6FfUOcBJqf3/J0Yvg3+9rK8e2/dAE99cBfbdoHCuZPBifrJQGJHg
 To4ruwXPdW1BGXGvRhxRV8SN0dfmFvA/CZn8GgOsb1QQoOUovPACg+uCWo78AOfOxMn6
 /eVP4xZaCgLMim3+Fbr9LUeA4KIMWDMSI+u6TNV18JB4rzTarJtDS9zc4ZpGFm0eXljY
 bTPxvFPgQDadmOyr65O4qpj8YE/k9wY/S5wZgrPAweq/qvNRJIBd0T1QKAPe9RqDLCSK
 aOYw==
X-Gm-Message-State: AOAM533jj68tfZXKBTdoeGIa2od8cLKlNLqUqam+V6Q2jr95HGLHMerq
 ytOOkei2gyME/Bv6tP0DJNZb4jkw8y7KDMAcJj6sLw==
X-Google-Smtp-Source: ABdhPJxK2cU90iwF5LZpNsANO1ONrjBrvOyWY0j9WtVRlNMOsWYO4vJR2g/brm26Zm+E3GBph6y3nWaIQRsJkw8GSDw=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr15283281wrp.4.1639152352786; 
 Fri, 10 Dec 2021 08:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-11-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-11-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:05:41 +0000
Message-ID: <CAFEAcA-o8_U46C1ApijM9cktAQHyjtztbCsMRM4Kgcsgg0mncg@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] MAINTAINERS: Add an entry for Xilinx Versal OSPI
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:41, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> List myself as maintainer for the Xilinx Versal OSPI controller.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


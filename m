Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523CD3073FA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:45:56 +0100 (CET)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54oF-0001vo-D0
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54mp-0001Jv-Fq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:44:27 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54mn-0002uQ-RM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:44:27 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so6976540ejf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 02:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hwxWhuPAeBOGG7cxyNlAbfsJe23zd190HfsFXc5SNv0=;
 b=TT+1b72xpvG43lT3FgHLt1u44+bwNkKZyv7VGVRiYe3vkd+5wEyAr2Hl6IMqJQ/21d
 P0q+z12TwsxsYsMNSj2p5lUs+dxw6tqgAYKVyK3gFtmzrNtKQIe4kHPoCUBuSFo8wQ83
 ljEjCxiEVHMHmspItr7qV7aCFsmOyCVwWwuiBmXWsxLLRhyFfdhQDpTOxmAUm73fqQzd
 QYZAYpry0GuqhFDKoK+6Ooef2ErvcbRnqYQQJuuaueaglAzehsBJAJQxIOv0WoKQ9NFr
 lTFlOW0WVJRtooRfYwJMmEgn+davoNwnEccdw1bMS/TWUa75jv7XQqXqHh0HL/W61G+c
 jsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwxWhuPAeBOGG7cxyNlAbfsJe23zd190HfsFXc5SNv0=;
 b=H8YrvDAIieOvPBp3Tdcl48smOM+NDBc+FlYnusR9IqEbrG4YMjMe1IazCDXXQJWJD/
 4lz387NmQPEOtl56GpWG0sBVyJBj2WxD41DIRKRI4npDIDEBug+OXd4tWWcW0qbxhdmu
 Xy2QfvBdyjRXic2AGwjnI8MJSCnodZA3CFnJrA6VcFe/7ZWTp/86OnMXm28PLfkvIjyN
 pkASm4wdoiPGqyODLQHOB4NY2b5/mtek2OuFc1i2v8R807mrD6/N1kasIr2NKABVkdcP
 nfWQBNj0xTSBz/FGVj7vvGksy4DjLagVsVMEj8iIdrR+Dj4kRAxl2YNl3JZEi8MO7sUN
 ljTw==
X-Gm-Message-State: AOAM530SdauuIP3ptahixBL8uL7NdlPKRaqq5bXU3IJPrK7plMKmB8Uc
 9EEZy+bK+wJO/WWeQErblVJint5WDgWLk124QJ2QCw==
X-Google-Smtp-Source: ABdhPJxZDsq1yHO8WIHLriNMQdyPFE5TJ2S+pRVK3vGazE9pk4bvAI3GQMZnhgEjq1l0QQSfAJNid67JflJrpdYseew=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6504423ejj.85.1611830664023; 
 Thu, 28 Jan 2021 02:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-19-richard.henderson@linaro.org>
 <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
 <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
In-Reply-To: <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 10:44:13 +0000
Message-ID: <CAFEAcA9tS7eWDoa7Wu3p6Be4Jce9oaPyHh_8ijJJbjZpmgL+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 08:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/22/21 3:59 AM, Peter Maydell wrote:
> > Does it work if we just always queue the SEGV on exit from cpu_exec()
> > and let the signal handling machinery prioritize if we also pend
> > some other signal because this was an EXCP_UDEF or whatever?
> > It would be neater if we could keep the fault-check outside the
> > switch (trapnr) somehow.
>
> I would think so.  I'll try that.

In particular it seems worth testing whether 'singlestep in gdbstub
over an insn that takes an async MTE fault' has reasonable user-facing
behaviour.

thanks
-- PMM


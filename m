Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F648F1C7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 21:59:41 +0100 (CET)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Tff-0004Ga-Kl
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 15:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8Td7-0001gW-O4; Fri, 14 Jan 2022 15:57:01 -0500
Received: from [2607:f8b0:4864:20::32b] (port=35352
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8Td6-0007nS-EB; Fri, 14 Jan 2022 15:57:01 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 60-20020a9d0142000000b0059103eb18d4so11485170otu.2; 
 Fri, 14 Jan 2022 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9cyEBUzATocJv7ZX/1lhYMaB4y2O9dXDe2JOA9IZXFc=;
 b=pS7iLp4AXuX/U1PANWMAsTJ7Lqe0D2ILlOjeCRLQpvGvC7yuVMl3P/27t5I4wfjUzo
 F81obfnE9YMInFX85w8V7W4BDL8YeTYj7u7TjZgjXfPRQxrIPbgktTvMsDIMnWyn8oYD
 tQ4LNcNYDuZmzqJzsYriiZTjxC8CFqSO1/XgKPtgUO9qYNPDud5GT9mhIjm+vp4LxGE9
 /dmeXBsLRZRYJZqHD5Yh1o4k50Mzfx4UrunbrCj0IcyQCr9kEYX60eZ+xNxaZ/U6vUzF
 Zyeg4iZA7qASxasSxhcqQpb2MRL/+8L04tn0PDvPp6bVsm+M4eUl0cytsWcw6HHPyhQY
 TpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9cyEBUzATocJv7ZX/1lhYMaB4y2O9dXDe2JOA9IZXFc=;
 b=gtPnD/Svhr3qmOGZ3t1GovPbC+6NwVok+9ye8jUjZqrlNhhNNPfe8ZUZqkvka9NyO7
 Suqd+wblrW+yg3JsxOQhARU4JcOVeGfzXZQXnlRQOutcTiDxf4/V90QHKXMY5QNykDvz
 rUpEQdsMziosopbHjvbjGdKr8C0F1DkcgWK78a8uEZirRGYc2ZQyuaCozwrpQzgx1yiv
 wratDpT6b4SwAWsTFeEPdfAZ5XLATXcz3pmbD+TWPykoM1wnXUrUUeVVZqz1X8+4TkTX
 q5yx7Qtn3NH3iBSfQgQA0su3O7Cc4pRg+91y8m7hfrduaOMTNjpK5/PZxG85rxN23a/y
 LcFw==
X-Gm-Message-State: AOAM532I3nxkwYyE3Wii3vq4kAPyTWYW0h+7UtKv7C8+dq3U+4XaVzTj
 UHKOa/EzBXhbBGd313GsUCj71xgPzpB0ErJfVhY=
X-Google-Smtp-Source: ABdhPJxniehsxMgrngi34GSfqk8XAa/CW7kiwg8zjXEBSeVMFJyGx0qmtxP1pe8lJznauVcboeenGNGmPO1ZMRza0Zk=
X-Received: by 2002:a9d:27c1:: with SMTP id c59mr6131536otb.150.1642193817521; 
 Fri, 14 Jan 2022 12:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <87ilum8gfp.fsf@linaro.org>
 <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
In-Reply-To: <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Fri, 14 Jan 2022 22:56:46 +0200
Message-ID: <CA+4MfEJyB0T7SLLbXXhNk+JSVxSJk_QRmOsvUpoZi+v0=+sX6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range
 flush
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> cbnz     x9, 0x5168abc8
>

I forgot to include the addresses of the instructions, making this
jump undecipherable, here's the snippet again but with addresses this
time:

0x5168abb0 movk    x0, #0x0
0x5168abb4 movk    x0, #0x0, lsl #16
0x5168abb8 movk    x0, #0xff80, lsl #32
0x5168abbc movk    x0, #0x0, lsl #48
0x5168abc0 mov     x9, #0x64
0x5168abc4 str     x9, [x8]
0x5168abc8 tlbi    rvae1, x0
0x5168abcc ldr     x9, [x8]
0x5168abd0 sub     x9, x9, #0x1
0x5168abd4 str     x9, [x8]
0x5168abd8 cbnz    x9, 0x5168abc8

>
> Idan Horowitz

Idan Horowitz


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EA557A38
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:23:55 +0200 (CEST)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LsH-00015W-Qo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Lgc-000320-H2
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:11:50 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Lga-0008LD-PW
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:11:50 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3177e60d980so170077747b3.12
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7K6L24c+Y1b2KwK/Q66A3sSE8CSQ8aoyDZ6Ql0AsV0=;
 b=sSpGHUTCswvHhT4H1B5KfzqfwiD7oQxtmXZiGYZWoxAyeQ53n3xZie+Ig2mwn4fCKe
 Xkk5l8mFLX0kRrjF8NztrOQAuU52WLUKrooX1ha86jVcPQT+lVHJJzr3EiJ+UF7TjqFM
 nqdYctf2D2InwbxppBsCmKuKQpNw34cClqkrbhhan/C7GZWJQrWrENeasaFTmg0tWRFp
 g/2Ucg8+GEoDhWWrC6Nrg6Fi/50TmkWKpcFMB9baLyloRj6wdJU9WXjRf1SB3ztDT0cg
 FKJhzLt3sFIqvSV/cOBVRkiQZLYWTjptf9Q+C/PdBnkfcBF+uIqQeDB+soTPzUrdXTPY
 stZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7K6L24c+Y1b2KwK/Q66A3sSE8CSQ8aoyDZ6Ql0AsV0=;
 b=EUrFUb0uwrgO5c/BZWTuSOtLiVnO6NMqRzR+W/yr6bh2iXerfxTB83vcTfWhxNmeB5
 fwh/KhBJJHpTH/wjDZTmIKQAO7Z3mWjuMseNfrqIz9UPo/7IZn4Q3GUOPNy7B7V4Gvfd
 1bxMo1zafdZMWwb5XSSly8yZzxRZu41yPtPJn4khr/D6sWwxrBq4sw2iPaiCP88Ive76
 iKqvd+GPDDdVBk5mXYEPMI202m/QG7Sd/yWNscMOQHTLczPrKnXb4pbuLtOybpF78ojV
 Z6BWQEjB7vkFlqkbz5csWnpg226WCLkP74oSWuioOag/2m3EK9xqX6uw5kwfbKBcYOZi
 3HcA==
X-Gm-Message-State: AJIora+0Y5pBxhSF29UUG0PZX5kq8Ua0B2ImxOnxFd0SeETRTWOjZzP0
 ep88ggRGtpTjyWoQy3d0D3h67d6P6tUStGWA1qzMAA==
X-Google-Smtp-Source: AGRyM1tHM2PH06jLutpzWpAloSsRpnBlSBJrLzjiiLlW8Jb+1R5M99HLQ2wspI2xTF78Np9POqoBFx6jx+SutF94Y5w=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr10199573ywf.455.1655986307630; Thu, 23
 Jun 2022 05:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-3-pdel@fb.com>
In-Reply-To: <20220623102617.2164175-3-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:11:36 +0100
Message-ID: <CAFEAcA9k_gW7GDDDiLf7gp-wX=_OCKzKeMHe5Rr5ZZe167kaYA@mail.gmail.com>
Subject: Re: [PATCH 02/14] sysbus: Remove sysbus_address_space
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jun 2022 at 11:56, Peter Delevoryas <pdel@fb.com> wrote:
>
> sysbus_address_space returns the address space associated with a
> SysBusDevice.
>
> That address space is always the global singleton "system_memory", which
> is retrieved through get_system_memory().
>
> This abstraction isn't very useful. Users of the sysbus API (machine
> authors) should know that sysbus_mmio_map et al. are mapping devices
> into the global singleton memory region, not into a specific container
> or some memory region specific to the device's parent bus.
>
> Lastly, only a few uses of this function exist. They can all be
> refactored to just use get_system_memory() directly.

Yeah, we definitely don't need two functions doing the same
thing here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


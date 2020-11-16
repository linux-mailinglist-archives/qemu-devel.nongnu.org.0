Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B62B4C72
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:18:08 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kei8l-0006mc-Hv
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kei6P-0005Zg-W4
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:15:43 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:36201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kei6N-0005gE-Bt
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:15:41 -0500
Received: by mail-ej1-x644.google.com with SMTP id o21so25504863ejb.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5mMiBadc9w/evurIbvGFs4bOERi8qxxgcjltNn6VIs=;
 b=X0Vgm+nRxTw3U3iTBRdtyaLn9s7B2xADRzGZsAQSlAj7qaPHGCO7O0Mfje+zMWEwMK
 Qg5UArU7Dd2x26CPnD3MwdnNFhVDgwvHP9TsCV4tgdEl6YIl4tWHUUgOZivDsID9cH1I
 7LtJ7QjWOKlj35J1b6YKykeV7+OB6dpdBOCxJEu/Y8eRJMFy0iE3sO0I0xmNuss4e73O
 oxQyUYpM5zn+8VKhdbE5RnUh3G8B2tAbz8oRZ+QM8wrs7MrENdm1tVxbwUvSa2/mBqBq
 T4n3Y/oRn8O11lmmZi0huZE3NHR4Sj7gHKwB+lwp3HApLqfJswqlwqbGSpsUqjqEYY5X
 PaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5mMiBadc9w/evurIbvGFs4bOERi8qxxgcjltNn6VIs=;
 b=jLgcT6CelK8Owm6sgSrufRFJaKFx/dC7Vh9TW7QIFDYLsS+a6/g9mvX7EudEXNAbQK
 odSi0+kjWHtMMF/2kf+E5fz+CwptSl/cdp6dZCCqaN0s8Q36y7PnIXDqcUCeTvSh2a3T
 G+F7BiuaA0I1oMwTE4j14++2sjasHmHW5ihDJA2XVPexKg+MJLg11d7n8sxNQXX3//p6
 wHmglA8lrFWEnckPtVPw02LwkuSTxewSIZ/FkexEZMHRbaX7pimrQJaNSsuWq2hRP9oP
 hazPQuv1v7hLAZ3MdHKDUWUXlIVnp+3r4gl+kykJnH7kPz4oTxhrxo/qDyZm2cDrAaaw
 gPZw==
X-Gm-Message-State: AOAM532E/wlXL8K6w2j/FNkEwMfbWumS6xuqC0TlmljEhZNySOdd7Omp
 VMUv0DMOPzk54W66svyqoOyXQFwr2eycmxrW6Acy7w==
X-Google-Smtp-Source: ABdhPJyzJSCaEQIo8u2ye6+2VjuT/d6ANKBUJAognrKtcu2r87Tt225mJW5qMCCIQEly8YLpKabXINhcQygPMUQJXdE=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr5865408ejd.382.1605546937127; 
 Mon, 16 Nov 2020 09:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
In-Reply-To: <877dqldyoh.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 17:15:25 +0000
Message-ID: <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gan Qixin <ganqixin@huawei.com>, "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 17:09, Markus Armbruster <armbru@redhat.com> wrote:
> But TYPE_CPRMAN_PLL is *not* a descendant of TYPE_SYS_BUS_DEVICE, it's a
> bus-less device:
>
>     static const TypeInfo cprman_pll_info = {
>         .name = TYPE_CPRMAN_PLL,
> --->    .parent = TYPE_DEVICE,
>         .instance_size = sizeof(CprmanPllState),
>         .class_init = pll_class_init,
>         .instance_init = pll_init,
>     };

I'm really dubious of devices that directly inherit from
TYPE_DEVICE, because their reset method won't be automatically
called. In this case it looks like the TYPE_BCM2835_CPRMAN
device's reset method manually calls reset on these devices,
though, so it isn't actually buggy, just confusing.

thanks
-- PMM


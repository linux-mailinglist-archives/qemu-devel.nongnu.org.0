Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BEF310A1E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:20:22 +0100 (CET)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z9x-0004gr-5g
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7z8V-0003Yj-Gk
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:18:57 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7z8N-0002VH-52
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:18:51 -0500
Received: by mail-ej1-x631.google.com with SMTP id r12so11331172ejb.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0vuXvM/bJGug4mq7H8UJvt4RDRw8rbMIFY/0o0XjdpQ=;
 b=MpEBRseyWBR3oWy9OyOgEQxXBf4gJb0HC/pyVWsyuFnO3hq/TCEByextSFPDfBq8Sq
 VXnF/xOauIptCsxDdIe8vcK9qYf1hM7BSjVx4Nygdz4CMgst1TR7uyQCUot0GXxniun0
 MjJ9DHoOaFibgmMk/XaXdDXKtZg0Sgp2rsx4eAHtqBl+5z1Ht9NpmhiXlMTY0L9jO0TZ
 0r7rWETt2h7M6g2pZWhXut69b6dSnAqclexpkO5aJk1VmvtPm8S0PNMLy6oy+SzaNchN
 bFMRiynZPwojXhxfZ9ugePaFqi+NQr4cWC8QZZh6FUBLcqYpnzvTHnlt9pb3EcJW0EYd
 e2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0vuXvM/bJGug4mq7H8UJvt4RDRw8rbMIFY/0o0XjdpQ=;
 b=kXO3j+QuZJkzykh7ZIOcQ/SNz0BYSBRHb8HDLFwdKWw/2y2Vqh2yDoo0k06BhhJJo4
 l0FBksotBjMY1djrdH4A4QxSOS4kxd4BEas75y4ArPRbpqSqfkJAfu3ulmY7fx1K0W0Y
 xYBQH69S0Gzilrwiz+vZ/tWX1fdDpnzg/OpooRpJX6Nr3XM2xHMXaOOrEpJQutmahIeu
 jiim4ZUcfkyA24BlDf8UHY+cfAHDugYX4RodVYY/L5ar32Pq3V8xNurp/zBJDTTPSIbQ
 mcnwM2dWiUmTlhBZw+a9Z2PFbp6yMS7gSiS4CX+UTy4OnbOWX7qHOf35yIANhe8YCbiK
 CTGg==
X-Gm-Message-State: AOAM531qVo7aEqwW3fh6RbjwtwlhnMYLNnkUSxT1OVJnzfgHoiDorgVz
 0E/d0U6O7gWevt9/Ol3AqFIQFo4fDX7VUVql4OJecw==
X-Google-Smtp-Source: ABdhPJzxOjBWqgVWGqyIdre6mFG/ULUgzvqwIlx06cvHC30mrKYssxBKoLkWjbR058cWfFE1irKA7ZJYhcTb7bpq/hA=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr3568776eji.407.1612523920088; 
 Fri, 05 Feb 2021 03:18:40 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
In-Reply-To: <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 11:18:28 +0000
Message-ID: <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 10:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> 1/ virtio-mmio must be sysbus-device,

Yes.

> 2/ we can not sysbus-map out of main memory so private container
> is incorrect, and Versal can not use "mr-ps-switch"?

No. If you have a sysbus device, and you want to map it somewhere
other than into system-memory-map, you can do that: you use
sysbus_mmio_get_region() to get the MemoryRegion*, and then map
it into whatever container you need with memory_region_add_subregion().

thanks
-- PMM


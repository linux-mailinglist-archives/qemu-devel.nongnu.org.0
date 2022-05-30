Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7B5378E9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:29:00 +0200 (CEST)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcdu-0000re-Sl
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvcb1-00085d-Ki
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:26:28 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvcax-0004Uv-EN
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:25:57 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso40528327b3.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6raraNE3uknAbp5HvNuUgQl5i+iQBwkm9q8BTORxgms=;
 b=cItdjLEV4sucmB72EYCQ3cA6UMzdQJiBQt+DnvvXfLpl0d5MD15XahzVWQi/HidGsv
 mOm33hAdh++k4RgsBJXepy0kH/lZVJzcBt17IvcjBDObO+Wm9YylFLaXRDpRzxsawJ+e
 EPNwJmuGjqr4Xlc3BvSQrM2hDYi8ZZb2TGGoGb6M5NUL8iDJlhnXeeddKA1OH1PSnCIg
 YaAzbIf/wtslPdT8GSpJleGAtwPCYd12YEsRZc7rLTqNr9mMabeNYpNiDcSHKwKGuOcz
 DebmZZ2FVjtXJ6r63LSCBavAT7p0Bn5tgpIKbkz6Bx2WXKLDpnmcPN6MqRQUfbobBxoH
 pGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6raraNE3uknAbp5HvNuUgQl5i+iQBwkm9q8BTORxgms=;
 b=D1lAIssHnlhYErL4piQ+qv8e/R3DBNkjKzsk8ftcsh/ZWyh9uyXhNSKJ2eF+LTdRmo
 UKxYsrMXLL0CdpETPoJUONotRVSJpFfSeML0zV8ylsg4GMdjYH2ylc9Vam3m8RnVImGn
 x9DV72rAYn2WMk5pSyHVUTf3Ib0Ze/TPAHwbp9O3q7xbcXit4ATMFqkamqtK/BnhHmU8
 c4Wd9uWCoDbGtX904cVHIX9QztTFX6cJpIg6ThufgFK3g6jXagSx5+bYeTElG7vPGiE4
 ADn89BYD5CkYegzAhQd0syZP75nMyxdGqudULw5PCHKpZO7aOq8g1Pds42IL+ENp+FQT
 tEZQ==
X-Gm-Message-State: AOAM5306zQcX18jfRgchJw3ptgV6HbeF83IuEGWAyn7UTzze6wWFfVyo
 Lyp7WkZykW3qUJYrPryQwBJKOi8DFT+7xzTMWP3q6Q==
X-Google-Smtp-Source: ABdhPJyZXD16ODJodUNsWsf3c/WcQOFhuBl1VM9CW1I7cdGV4HdATqVC+8gHHVHvIESaR0FNzdatOHCyNEMtVaiHMj4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr59314997ywb.257.1653906352467; Mon, 30
 May 2022 03:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
 <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
 <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
In-Reply-To: <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 11:25:41 +0100
Message-ID: <CAFEAcA_BinJMmqdTBoCs3V-dqSRQ_jjL7FpdMxCr1etZgn0i_A@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 "edgar E. Iglesias" <edgar.iglesias@xilinx.com>, 
 Mark Burton <mark.burton@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 30 May 2022 at 10:50, Damien Hedde <damien.hedde@greensocs.com> wrote:
> TYPE_SYS_BUS_DEVICE also comes with reset support.
> If a device is on not on any bus it is not reached by the root sysbus
> reset which propagates to every device (and other sub-buses).
> Even if we move all the mmio/sysbus-irq logic into TYPE_DEVICE, we will
> still miss that. The bus is needed to handle the reset.
> For devices created in machine init code, we have the option to do it in
> the machine reset handler. But for user created device, this is an issue.

Yes, the missing reset support in TYPE_DEVICE is a design
flaw that we really should try to address.

> If we end up putting in TYPE_DEVICE support for mmios, interrupts and
> some way to do the bus reset. What would be the difference between the
> current TYPE_SYS_BUS_DEVICE ?

There would be none, and the idea would be to get rid of
TYPE_SYS_BUS_DEVICE entirely...

-- PMM


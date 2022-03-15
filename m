Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E563D4D9B7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:46:25 +0100 (CET)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6ZE-00029e-FU
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:46:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6VO-0000oi-PE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:42:27 -0400
Received: from [2607:f8b0:4864:20::1131] (port=42614
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6VM-0005Pz-Vb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:42:26 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso199567157b3.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2H+ws2OLRIpG1LwWMrUZ55NYVM4saa6d7AwVKdJQiGs=;
 b=f08WJzEwmM/u1kmtPOBru7oSxmCZZrT2i13yEdybfKGWQIzP49zTkOa644VpKbqkES
 GoYbPpvov2Mriacl7TJGfZaTjbKh4OejnRkZ7kYQnVym6DR5dQ/khLs6QERb300gPdLn
 LJDNfUYks61Bp8cygV70tMyRa7HlwNHpUXKqbZ4OeHn2BhbikgSiffnQZy6g9kr4La4D
 /nvoaK5m2WpaoC5014GI+ob9G0pq4WBjvSpFy/Z3AmcRvZm4xp7skF8+/dax7YWRGyI4
 mAqHYSHTOeBEhZWX7TCWc9fVS/m5FgmAqUlbSCB2z1hmN/Ncro3jd8lRq1YBYqZtK0VJ
 8jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2H+ws2OLRIpG1LwWMrUZ55NYVM4saa6d7AwVKdJQiGs=;
 b=QPrsu0EU3Uy3oX9cY7KisKTvuL3NkXkm+1zFxuCSQCo3gCxhHNAD7ocQwkjVduMMzP
 Pm4/0TsDvz4uwXliTbz+Xo8PB97yt7zywlwJ0AkYIgaI2XfnkhlXqucM7ZLmLBualWOJ
 mUP3Xkb0cp6WCr0JMSpPPhQyt1+QKhNj3wim4byU6o9e8htyZMteice53xszIbOXeqZL
 oIKvSQ3Wo8lu9n7RWfBs7rhtj2Fb5ecezJfLHYJZ5oSFodNN0ukqhcFa/1u/0Oe2xFIy
 ZhNIkOIo3+r0E9w/qY4v2dkT0FoGXzCK8v3TbOwXyQkl8w8/vVzDvROZJVKvA0WWfPdy
 1nnQ==
X-Gm-Message-State: AOAM531jPQywCwc12d2QYTarYhGX8+gNvjDnMbAI1rkBmM/2rqdZABzD
 AQDx3wxvA4WvP/LVPC85Gwe3IqHBSlzyz9mXypA8mg==
X-Google-Smtp-Source: ABdhPJwrSAH9JZezeSEbwkt5HbmTyu2fRxHyEcsUCm6EhpJwdeOLUaQT7Q9US4K6N6wWq34RXEyDhgaHkeWhJ660fxY=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr865146ywf.10.1647348143987; Tue, 15 Mar
 2022 05:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
In-Reply-To: <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 12:42:12 +0000
Message-ID: <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 12:29, Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
> I have no kernel specified in the guest, so I'd then expect to boot into
> an completely empty machine (besides the tiny startup stub in the MROM).
> However, I still get the exact same error as mentioned in my initial mail.
>
> Again, without "-enable-kvm", everything works as expected (i.e., I
> don't see any output, because there's basically no guest code to execute).

Well, you'll always be trying to execute something, even if it's
all-zeroes. I dunno what RISC-V does with its encodings, but you
typically either end up in an infinite loop of taking exceptions
(if all-0s isn't a valid instruction) or else you just execute
through all of guest RAM (if it is something similar to a no-op).
In the latter scenario it's quite plausible that the guest ends
up doing something KVM doesn't expect, such as trying to execute
from an area of the address space where there is no RAM, or a device.
If so, "return failure from VCPU_RUN and QEMU aborts" is what I
think I would expect to see.

If I were you I would try it with some actual guest code loaded
at a location where there is RAM...

-- PMM


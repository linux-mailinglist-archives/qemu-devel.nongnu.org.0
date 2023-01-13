Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A31669790
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 13:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJOl-0003T8-9s; Fri, 13 Jan 2023 07:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJOa-0003S0-RA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:42:56 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJOZ-000767-5G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:42:56 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so4641027pje.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n0W2mIawT0ydAYmN/XMBiBeNi6lSFaH2N2Ub/HPnG+o=;
 b=xhWfcZjDj2dY/m92e6ZOVrrWzdEFJues0yxiPtnuUTYuXOg6mZT20Q74E83NuSijPq
 w7l579nHKg54OBdOLBYTY5FrZdYZ22WF5EZ5W+taxikLrDvcaBMX7omwViPzLCjdSvqk
 UHSNr+VA4Dj0Pda9JpQhfXEO15WPvWp1L22WRY2ECRLNcq2Wop/d/dKNRj8S0OAta9XC
 jsKjaJp81vHIfXzMgQ6Dya6s25eM2lMKzwGK0V7xOPAyAy+lJwh+jWgj9oucziVwjLXp
 tlSQWPekic368WNl5y5JhTGNv2UlGzhIOM7Xw38hhAgIwfkWNdmqFkRGt46o+RCoOs6j
 bChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0W2mIawT0ydAYmN/XMBiBeNi6lSFaH2N2Ub/HPnG+o=;
 b=TGmr//YjkWvpU0KGA5f4Iq2lNCTUKvkfhLECzPMgju5lm4HfkDpeCasRkq/ZEfUhCM
 1h+SZoIt+ZY4WXLoWiar9BgmOYMB49q00IMLd+Sn+jl2WtYuBfA2y4VL4Sv3dt9wwqgW
 1R45tiXTyzR0wtmpTFInvdRW1fIZJNDrrv6Qlmzi8cHkaMcBDgLmE/MYt5w3O7w8cZvz
 7x/m/HyqQhQv/Q+oHOgrVY6/d24hk16GZoOGXRXeMs9OXN4v8YGX6uNlb65PZFb6B8UP
 V81W5lLr9OpLGSoH/84v7nZr5nIYts/wg6KU2bYT1smeB3eGsqhxwNopktjLxxYVxzNg
 e4Qw==
X-Gm-Message-State: AFqh2kqry+y5CO0qT3ZWfzRJihuG9v7bUBqtpf6aGU9fFQT8+ynqNEn6
 rLBezsEWTk6qHEnyY4QINr1fS7KHbxV3vVDT+nXSWg==
X-Google-Smtp-Source: AMrXdXusTyxu0htHyfjcei6wGaxy8mCHmGABGTKCNkU0eWrsHn4RmzQ89FXhw/X96KZfnedRpIaI6cY13JI/Anjov8Q=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr6597272pjs.19.1673613773684; Fri, 13 Jan
 2023 04:42:53 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8EcOFE52X5KbzO7@cormorant.local>
 <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
 <Y8FQnsxSwcTUYqYm@cormorant.local>
In-Reply-To: <Y8FQnsxSwcTUYqYm@cormorant.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 12:42:42 +0000
Message-ID: <CAFEAcA9H4bYfqmt2w_xSXS_uX9z-6NCRqdsn3tDz6h-v39cGKw@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 13 Jan 2023 at 12:37, Klaus Jensen <its@irrelevant.dk> wrote:
> There are a fair amount of uses of pci_irq_pulse() still left in the
> tree.

Are there? I feel like I'm missing something here:
$ git grep pci_irq_pulse
include/hw/pci/pci.h:static inline void pci_irq_pulse(PCIDevice *pci_dev)
$

...looks at first sight like an unused function we could delete.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC45599FB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:59:20 +0200 (CEST)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4iu7-00067u-7v
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4is4-0003WG-O7
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:57:12 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4is3-0005gf-0S
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:57:12 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id x184so1611993ybg.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YiA0YGlHhMKy/ne0Mh3r8zXDFLkjCNSQ537FSF96/24=;
 b=LndkKm2MAWPB3fwQ4CrnfzqRxS5hZUiKSw6JB316osM2WjtfhNcO0ZXODAXlPjFbbC
 O3EswrgZMTZBSLV7VYeLgj6r3yzeSPg9Akk6r5WaK21VhfXgfkmGSxmL4Y1Qo8kD59et
 JYvckztr7r5Fa70QOXq003etN8q3ZjQ3nZ8zwymcfg8SBroqtUiPVPA9DYC24sQeMPVA
 bvMoLrP2hj8clExquFlniSO5VqvOkkQylsjqZ83FHiZB/K8TLV2GdvYApnF9XKv4Bob+
 zzQnLOt90NlCeBqNQVGsXS6GyZQyf/Pc6EnMdIYzXPWXa3CIFB8YBuxoez9sGMIDDWM5
 9mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiA0YGlHhMKy/ne0Mh3r8zXDFLkjCNSQ537FSF96/24=;
 b=GU0MKcT+puVsHkvr5nmgzi6r0gkWEB3nI+twDC6kQ0FpTMSv8LdOesfgQ8f1zys2Pe
 ORPVI4Wc0YadBRmqENnTJ49BSU0aGEpotwvpQDmNmvPXhPXtKOTkYXT+4ZS3I9mYO5GW
 Tz0b/mRnV+0OqdLfEmfbee8KpMN0MWVwrJIgGWJfP8hOhuqtTfHDwdfftfMs/OCGAiM3
 93XyD1QpXbaEKQ6x7hd0OaYj8lGlC/y1POJEvt+CXPimD94pyv7RhOXUN8jAF4GGE/jI
 phPRFMUA+Z6fGpJwMVQwweAKQH/TfCRzjFfpytQxgiZxOKd8rElaCZxvRQ0pq9WxRdn4
 BlCQ==
X-Gm-Message-State: AJIora+URgBr0wKj8fHuOKmkbWxxuxZXSOLHTfXAyXKxzV3GPWl9pEe0
 lCbNvElS/LeFiYa7+G52/SsZVD1fe/ON0JP2cnVucA==
X-Google-Smtp-Source: AGRyM1vnqCcyIkxaLhGzDujI38DtPZPyGcfvq+svZqcT4XL627aiXs+NBcZn7a4uOp9e+xW0HhccZsu3w16e46Zi9Gg=
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr4913319ybc.85.1656075429910; Fri, 24
 Jun 2022 05:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
 <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
 <20220624133909.00005f6e@Huawei.com>
In-Reply-To: <20220624133909.00005f6e@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:56:32 +0100
Message-ID: <CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, 
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Fri, 24 Jun 2022 at 13:39, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 24 Jun 2022 11:48:47 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This seems to be missing code to advertise the new devices in the
> > device tree.
>
> Intentionally. I am not aware of any current interest
> in defining DT support CXL or supporting it in operating systems.
> Easy enough to add if anyone does the leg work to figure out the
> bindings, but that needs to come from someone who cares and
> would need to be driven by OS support and a usecase. The ACPI
> stuff here is defined as part of the main CXL spec because the
> target class of machines simply doesn't generally use DT.

I don't really want new devices in the virt board that aren't
usable in the common use case of "just pass a kernel with -kernel"...

-- PMM


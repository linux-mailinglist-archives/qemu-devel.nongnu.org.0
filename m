Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CD32E785
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:00:17 +0100 (CET)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI97w-0001Bb-Jv
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI95A-00080t-L2
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:57:24 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI957-00041o-TR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:57:24 -0500
Received: by mail-ed1-x532.google.com with SMTP id b7so2186256edz.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etJ2pL39JMnOlHW+dUpKkYovPnt5BxDZyU4oZ8AaA+s=;
 b=LV3QJk8RbHxdITUpqM5XHV2mrruM95Wmx5zUk8qrxv6TKWlQC1CpvnGR/EWBhgHTIB
 E1Fbs+Ipzjc8ALypma/u606jfTbUsdsVdzklLeJ3PLfVhsmQAQIYl7kXtMbLX0KYeYzf
 mzzy707CjaWqNHS6Y9ywpOFPVSUbz8G1W6HWALeE4L9AMrK94K0zKUdjv/YmjPIdKMp5
 AU6HtjxFO0eSPOvm3CyqbNfpHnKyYqQnTCuoWFBao6q1WJVPCxoPay4TJDLYesMnOHHP
 /aXwf8nxXrhgbhwhTIhweKKlDYf8ZWDQeF1skIh+aptFw7ryNSVsTn3PS8qEJf5WuODV
 WTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etJ2pL39JMnOlHW+dUpKkYovPnt5BxDZyU4oZ8AaA+s=;
 b=Bb9qrHBaoP3aNYD+2d3qD0DzsBLEya/Eo0nc+12lZ/O5bZ6CEMxYtUYrLPbm8lDo6m
 DLhG2hyEYz/7XwFGrXqBn+JNaD0IeADEoQU3JFmnBcfCnk8kA7sVz7K2EXQsIL+Z/5+J
 PZ+ztQPb1ycwwDb25svodazCBNv43c7jXEHo1AQh+Yq3j9uICxgU4AJ7MsaZQqy+eIhA
 +2ZYriGhDKxzZAYZ1AIvOwSENMyG8FDDv5S98MhRXYAmaL19kwMnLATChlpbWDcy7lxc
 yjK/lUKTnld9BqXA4UnYZa0Gvh09Lso0/4gwaHtMr1x8MhkSqG243oyy0oIGR/Q9r42k
 xdxA==
X-Gm-Message-State: AOAM5331fRd3MiJFLqPcBRt26csM6+uiwRw8uXWVp6eIZHFpZS2T619b
 4yVxCGgBrISdqZRGV+SBBj7IIVlQI0ZiYVr5C8ICXg==
X-Google-Smtp-Source: ABdhPJx10eMR0U/kzwVYK1eI/dYHOtPjTbecy6Ux0LpYp/GikdZWvi5CbG0ThgdTjTfIwfapk6EIbSdxorZkON5o9K8=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8567871edt.251.1614945440175; 
 Fri, 05 Mar 2021 03:57:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
 <20210225053606.385884-1-schspa@gmail.com>
In-Reply-To: <20210225053606.385884-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:57:04 +0000
Message-ID: <CAFEAcA_8EDULp2aZoJb=i4EFHEuy29L9QpJMd6nCzKLmuEAhHw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-mmio: improve virtio-mmio get_dev_path alog
To: schspa <schspa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 05:36, schspa <schspa@gmail.com> wrote:
>
> At the moment the following QEMU command line triggers an assertion
> failure On xlnx-versal SOC:
>   qemu-system-aarch64 \
>       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
>       -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
>       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
>       -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
>       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
>
>   qemu-system-aarch64: ../migration/savevm.c:860:
>   vmstate_register_with_alias_id:
>   Assertion `!se->compat || se->instance_id == 0' failed.
>
> This problem was fixed on arm virt platform in commit f58b39d2d5b
> ("virtio-mmio: format transport base address in BusClass.get_dev_path")
>
> It works perfectly on arm virt platform. but there is still there on
> xlnx-versal SOC.
>
> The main difference between arm virt and xlnx-versal is they use
> different way to create virtio-mmio qdev. on arm virt, it calls
> sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
> sysbus_mmio_map internally and assign base address to subsys device
> mmio correctly. but xlnx-versal's implements won't do this.
>
> However, xlnx-versal can't switch to sysbus_create_simple() to create
> virtio-mmio device. It's because xlnx-versal's cpu use
> VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> system_memory. sysbus_create_simple will add virtio to system_memory,
> which can't be accessed by cpu.
>
> Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
> this will add memory region to system_memory, and it can't be added
> to VersalVirt.soc.fpd.apu.mr again.
>
> We can solve this by assign correct base address offset on dev_path.
>
> This path was test on aarch64 virt & xlnx-versal platform.
>
> Signed-off-by: schspa <schspa@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied to target-arm.next, thanks (unless MST would rather it
go in via another route).

-- PMM


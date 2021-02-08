Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B582313F14
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:34:29 +0100 (CET)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CIm-0003ys-8v
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l969I-0006hx-Ck
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:00:19 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9692-00054L-UL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:00:13 -0500
Received: by mail-ed1-x532.google.com with SMTP id y18so17899190edw.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXstIEEQ61Cn4wtGdWUEpZXJMxNohWtfh/1DgCQY5os=;
 b=vKJK8D4KGRf+al1dK10oFdV13lGK/l/b0qIc+JXR0G4DCV989gmnXDg2jx1/EpHxvK
 Ex6zs5iPbFE//jx3TpeeWRkkcypU9wYdutqzGoCDjtfENY0I004aa3Uw5+iSaOfFQIp5
 iCglpJx9+geiLz83Idl7AR33RO25fiHUeUiWZqCN0rv2mAAjkPUzinc/lYXYvTq3n81c
 lMZEsXpIXUc/rah5AVyiVqFs4VoDCtGmeGYQpkBneUCvDKUlAXZHgoz5oM9XuJmf3cxZ
 vm1eCUhAX7nMbg3Wdtcl0y1wX/wTfh2lNRLL8xXY9nUuYpiHk+LqfIlIArptO+TF2+SB
 v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXstIEEQ61Cn4wtGdWUEpZXJMxNohWtfh/1DgCQY5os=;
 b=M6j5EvIEMlQdBmdoyhiBZI7NE79b9421IS4omx4WVNCANcs0UTjv1E6UG8D3tzUhSF
 7TSl9oEooFeWZqINIrjOwIWsUsIF5xEa3aIqfqKwaU1B6l5zTuHtLaQzSl6MlBfZ6ETU
 UZ+Yoj20gpqQWn3tOJKyO73QAoqxDxC3oJdr3sHGjO8zXafBLrCFbbQikX5uNHmt66yg
 U3pFzg+JrNLZQnneVD3vRkfV6qyYd6RyS7uFthVon7a/GACWNCkBrc70kvTTdY5i0H6b
 E51y/wM3GPaWRs0hMUVBEoHEBWv16z1ytBHIosRQ2Dpy7IZC9BVbThdFAG5gsAXAHKr7
 Bc0A==
X-Gm-Message-State: AOAM530R3RbdyU4+HQ5JFt+KMy399RjUZUgoM5KuycAQOv7RT56kjKFB
 JVkzmp8IZhqB809jZxO+OF0ZC28ezHTQKkHHVTNopQ==
X-Google-Smtp-Source: ABdhPJwNQNcygXCQTk1J1qDFPHFRLfdhD7Wy72Dnd8KnFIWcryggOgj5EVQJC/+J+1Xm5wBdYKbUNcVkpA3QoxUO2VY=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr16916654edd.52.1612789196531; 
 Mon, 08 Feb 2021 04:59:56 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
 <20210205140807.GH477672@toto>
In-Reply-To: <20210205140807.GH477672@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 12:59:45 +0000
Message-ID: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 14:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> I wonder if virtio_mmio_bus_get_dev_path() really should be peeking into
> Sysbus internals mmio[].addr?

Nope, it should not.

> Sysbus mmio[].addr looks like a candidate for removal if we ever get rid
> of the default system_memory...
>
> I don't have any good suggestions how to fix this. I guess we could wrap
> memory_region_add_subregion() with a sysbus version of it that sets
> mmio[].addr but that seems like a step backwards to me.
> Perhaps there's a way fix this in virtio_mmio_bus_get_dev_path()?

I just suggested something on another thread: call memory_region_find()
and then look at the offset_within_address_space field of the returned
MemoryRegionSection. I think that should get you the offset of the
transport within the system address space regardless of how much
use of containers and other oddball mappings are involved. (If the
transport is not mapped into the system address space at all then
you'll get its offset within whatever that other address space is,
but I think we can reasonably ignore that unlikely corner case.)

thanks
-- PMM


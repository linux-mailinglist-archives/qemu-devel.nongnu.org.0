Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AAB5379B6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:23:53 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdV0-0004S9-Sa
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdQy-0003TX-OL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:19:40 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdQx-0007ux-3h
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:19:40 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id t31so5594070ybi.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGPsnghm9faBazpQisd5dDDrpru0dMiB4kg9OE76A8A=;
 b=qogxBTgQwmX7XvBvWUaHyABM7LRDdog/X9ajw/ptrJpmMmqZhsn+Ry7gINDzZJ2oC5
 1RUplR2JaNkIpgDD8FQ/eM1Q+ncYvATCXlh+1giB+9OpTfJF0NxOcs8XERK7gSjpJgwj
 G48ikFSTj3j+V4kwejMVoR3kLejrI/m/OxTe4nJwp0nvGFQ7XzpVno8eZI1Y/j1mPQbw
 549cNUoMjk5TkUhA9rSdSJzZS+aRfw8LafNFthQjGMI0pSTB2Oo4XLmvrJLa3o6IE9kZ
 F0d1Ad5B1pHPvI8XdDiOQEzLvQWyzRfbTslKSZuPh0wBkfBW9pvBPmeLxvToHJHFBL8a
 HMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGPsnghm9faBazpQisd5dDDrpru0dMiB4kg9OE76A8A=;
 b=M1yq8OUUKq/VvKoieF7cSKvDUBAw+omgthbTo1EynfZUkv86Xj3Ok+8DbHFTQCb2Jn
 9bvGRnycTJnvJOahIeB35RPEN/VP5fxrvsc4itGAqbP/t2t1v1g9BaYfwH+Yb68XUqE3
 BeSBUbgfbs/Bueo0mPDac9WkcQZOHL5LyLSzB7eG3XPuRUZM9pkRVufMbGn1K3a/9GH6
 OT5FFWz3bYSXwCKGoLh3dPWmXJKK79XoSaMf+eeQHUyTrUC9DC4oF5vzY4/F5sxjm2Xs
 7Ec6UBM6w43nmM4F5lgeavRxjrAWSohZidMWdcoJztA0p9xVqTjj67OiYIlSrXkC21sm
 Aovw==
X-Gm-Message-State: AOAM5312uz+ksch8jkuXBCxU+CKriI9c17x4qm9DLz/3sGXabN4y4tmm
 ALsFZ3vlneawY0i2eymuTQWHdNbJyQ3bdPI6iSBhFg==
X-Google-Smtp-Source: ABdhPJxg0pz/h6ARoXswNPUrTkqdM9qqfka6jz9o+BbB2WP/d0/lSgTZs+YVolds9FZN/PYIqZ5YYyXOLfGLe9lBbno=
X-Received: by 2002:a25:41ce:0:b0:65b:3723:f73f with SMTP id
 o197-20020a2541ce000000b0065b3723f73fmr14392583yba.288.1653909576772; Mon, 30
 May 2022 04:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
In-Reply-To: <20220527161937.328754-2-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 12:19:25 +0100
Message-ID: <CAFEAcA-PXO8ZGS_DA6E65MK2pvnnepbpA-vc_90xdARLj73=iA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Fri, 27 May 2022 at 17:19, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag should be set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent DMA reentrancy issues. E.g.:
> sdhci pio -> dma write -> sdhci mmio
> nvme bh -> dma write -> nvme mmio
>
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
>
> Assumptions:
>  * Devices do not interact with their own PIO/MMIO memory-regions using
>    DMA.

If you're trying to protect against malicious guest-controlled
DMA operations, you can't assume that. The guest can program
a DMA controller to DMA to its own MMIO register bank if it likes.

>  * There is now way for there to be multiple simultaneous accesses to a
>    device's PIO/MMIO memory-regions, or for multiple threads to perform
>    DMA accesses simultaneously on behalf of a single device.

This one is generally true because device code runs with
the iothread lock held.

-- PMM


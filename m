Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13B589994
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:00:20 +0200 (CEST)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWiI-0001kT-Un
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJWez-0006qM-4b
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:56:53 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJWeu-0000ki-9g
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:56:52 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31f445bd486so193855457b3.13
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=g7ZE34Vze9XEwG3Pdte8geOpS0YpLVqbtlzkQlsFl5s=;
 b=V7Y9AwG/5ljUT+6lu8hgst5qTtPoenjd5hpGWcrEZi0sCcU2av1Q5ALnezgdPTagmG
 PAHyKwLJaOTYeLpCU5dhwHD19u3RIDLET69p2plbAOzOsVNVJfwGgsRE0rl9tbtJv+zd
 aLGCuoVjtam9Q7NGlnZ/1948H4QeOfw1wemr1wDOnuFESxeW2kWGPpBX4en0uy1mBPbb
 YdvJGCo6dpURBBqe8RK55i9BjPpikg1zcHX+JOjxbsJ3lDrNiMQGWMiw/Z+HaBZdWepp
 QSoNXL5zWN+Krgdr9BWfMYjKsC75XjrcyLud8+wRYxAy2hKD3R9PD790bF4zl9Wu51IF
 6R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=g7ZE34Vze9XEwG3Pdte8geOpS0YpLVqbtlzkQlsFl5s=;
 b=TN32Q9h7pIHhDQuq7jXFkHtojjAwGIAaraw4g0tePVPuh6r3x8Zz24tR7jEUgdqlss
 dQW2qW5FTkD2+yqV1rf7nvDtbLMLnzYemghItxfwh7mgU/tDzD4vrCNd5CABpCX4gHxv
 OxIPBp/orGaB+lJ2EL/na7gsruNXN7ZLQEiZGcHiwDF3wQj22m3UffZEvdM/ghLMSxh7
 zI8GMlF4sX46KMxew8gojSN9+eN7FntViE3EuMutvYYCFttSV0IYJCZ7QVYb3NHa7ozb
 xtdso3KAYzkO6eVdpw1nnR+ooHRt8HfMQ2H7F57372xi0z/dEDiOwg3GD0oRWU+ZE2Sr
 If+w==
X-Gm-Message-State: ACgBeo2PaojEJWbNSoQuC0CjEQOUUqlOvAqOmnFX5dKMGLuLgqDbsJ7Q
 xfXwbvOd3A16ycXcYxmCguPllKA5X+sz2qXM5AsQAg==
X-Google-Smtp-Source: AA6agR5PDF9VKnZxTvyABO9iArwabAfcwT2S8N9bzFWI4YuFyNdJrZydLae3mvd8jpk2IjEInQT3Pn9WFGtf766bpsY=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr771533ywd.347.1659603406853; Thu, 04
 Aug 2022 01:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
In-Reply-To: <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 09:56:06 +0100
Message-ID: <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
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

On Thu, 4 Aug 2022 at 09:00, Thomas Huth <thuth@redhat.com> wrote:
>
> On 02/08/2022 16.09, Peter Maydell wrote:
> > On Tue, 2 Aug 2022 at 14:53, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> The XHCI code could enter an endless loop in case the guest points
> >> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
> >> checking the return value of dma_memory_read().
> >
> > It certainly makes sense to check the return value from
> > dma_memory_read(), but how can we end up in an infinite loop
> > if it fails? Either:
> >
> > (1) there is some combination of data values which allow an
> > infinite loop, so we can hit those if the DMA access fails and
> > we use bogus uninitialized data. But then the guest could
> > maliciously pass us those bad values and create an infinite
> > loop without a failing DMA access, ie commit 05f43d44e4b
> > missed a case. If so we need to fix that!
>
> No, as far as I can see, that's not the case.
>
> > Or (2) there isn't actually an infinite loop possible here,
> > and we're just tidying up a case which is C undefined
> > behaviour but in practice unlikely to have effects any
> > worse than the guest could provoke anyway (ie running up
> > to the TRB_LINK_LIMIT and stopping). In this case the
> > commit message here is a bit misleading.
>
> So from what I understand, this is happening: The guest somehow manages to
> trick QEMU in a state where it reads through a set of TRBs where none is
> marked in a way that could cause the function to return. QEMU then reads all
> memory 'till the end of RAM and then continues to loop through no-mans-land
> since the return value of dma_memory_read() is not checked.

But the point of TRB_LINK_LIMIT is that regardless of what the
contents of the TRBs are, the loop is not supposed to
be able to continue for more than TRB_LINK_LIMIT iterations,
ie 32 times. In this example case, do we stop after 32 TRBs
(case 2) or not (case 1)?

thanks
-- PMM


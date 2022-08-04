Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FD589A61
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:24:18 +0200 (CEST)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJY1Y-0001BO-T2
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJXut-00032n-KK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:17:23 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJXus-0004lR-35
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:17:23 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 199so5332000ybl.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=f3Y0qucmVEdVMhovBIX4h6R5OFsdRZOGS2yIGBBi9LY=;
 b=c12Iit3b0MTNvf+bP0t+zYR/aSk/eKqJ2zRYi1hHjvlILlXnPYACUfH18MS5Ik6T/b
 JmqVSYlOHNUFl1A124U+fLKlUfNNyXUmEBXEkPeAp1OKa70J09QDB9XJxJaPYTbzOEx6
 kTcBtElOYWEOnApki+2mtrFR8HJekZZXrd3BgdUv24XQCdJ/yIlmEixh7zEbqdj1XC82
 oV3kRpPJXfd5fNRzd82BNQ8bvkj1zgmZxRIUHwKXc7MTrARv9YOIPOw4tCSa6YMNZWYd
 fN514PLSH+UEzUJQ5JuijnJAELy+zxIFh9S5Ha6ts/2TMuZR5oC4v08X7PjXwUw3kViw
 R0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=f3Y0qucmVEdVMhovBIX4h6R5OFsdRZOGS2yIGBBi9LY=;
 b=nstpUzIM2C5Uu1ewKWmE5R1HuaebQ18KwqwQ/I1Qie94gvsNE0mxwGYwutE/l5mc0D
 dZ1/VUDnHf2SX4/I1Daprjxx9tVviznez8wmrRQGjSc565eoMs46cbSQXuLedL/HZ/PH
 vM6WY3flfmtGiTkNTy09TzuqTfo4AyGdWC0IokiXjgg7AWoq/D+XzeulY2tszaqQOnbQ
 KpSgJcSdC+h9DSMXYRMD2N+Vk83XhRmlbsHaU0kNkuXkUbdKMQ+cg19KJyrVfRsjiqGi
 DosL6sXXzxpGYjIo1QtQWF9x0uNN07N/37J3BNQ8dGV2uywNQjewHBnW2FAFyDFaxIC2
 ZkBA==
X-Gm-Message-State: ACgBeo3c9Jt++TRG3VGsqxPa8bPILdFOnxbWf5DVAg9SNOFj0PXNkSrP
 +AazxcDz2XjCX+07AkGFb3f0AncyrEVIanbkp3KjgA==
X-Google-Smtp-Source: AA6agR6C+/qEYIftOhwbXnpZTKyZHsnapP1CuU0rgUis2ptyhEeEQaWCGMtiJD2JrC9Xf1N8xQT3Du2/sRnqFJXZW2s=
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr802408ybg.288.1659608240848; Thu, 04
 Aug 2022 03:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
 <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
In-Reply-To: <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 11:17:09 +0100
Message-ID: <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
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

On Thu, 4 Aug 2022 at 11:07, Thomas Huth <thuth@redhat.com> wrote:
>
> On 04/08/2022 10.56, Peter Maydell wrote:
> > But the point of TRB_LINK_LIMIT is that regardless of what the
> > contents of the TRBs are, the loop is not supposed to
> > be able to continue for more than TRB_LINK_LIMIT iterations,
> > ie 32 times. In this example case, do we stop after 32 TRBs
> > (case 2) or not (case 1)?
>
> Oh, wait, I think we were maybe looking at different spots. The problem
> likely does not occur in the xhci_ring_fetch() function
> (which you were likely looking at), but only in the xhci_ring_chain_length()
> function (which I was looking at)!
> xhci_ring_chain_length() can certainly continue more than 32 times. In
> xhci_ring_chain_length() the TRB_LINK_LIMIT only applies if "type ==
> TR_LINK", but the TRBs we're talking about here are *not* of type TR_LINK.

That sounds like we do still have an unbounded-loop problem,
then: there's no limit on the number of consecutive TRBs
we try to read in that function. Maybe we're missing an
error check of some kind (does the spec limit how many
consecutive TRBs there can be somehow?) or else we need
another artificial limit.

thanks
-- PMM


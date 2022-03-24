Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DDE4E63AF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 13:54:23 +0100 (CET)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXMyr-0004tG-MK
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 08:54:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXMwc-0004CQ-4p
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 08:52:03 -0400
Received: from [2607:f8b0:4864:20::b35] (port=43531
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXMwa-00042I-FV
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 08:52:01 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v35so8245039ybi.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUwhd4iuQrDuAQT1ztiICXTjPGctL0v9tZcBWAD/u80=;
 b=uhPV37QMsJRc/Y/5sFJekUn+KQGLv0DwKyJlGGlT74S5Po1UuCK1jXE8vJRF8R7Xc2
 qEJHSM5jknTmjFlctxoG9Wl+tjjAb5IxBijI5TJSW8UdyQm2mYBPC79VBCruvR5LSTgn
 RA0sdWdm1GYZhD50FRILPSd+bXH03JMUU6ua5lPAcrvp8l1rkqgx4wLoy7PLuGiP3XBz
 IQkz0knlHkA8wJiubR91vzyuesx5hNg2HWr748MEP2kuwcdw1BP83yn/07+vckt22xf0
 haGKkn6lssUNhLx324cPDCrNKGC2n7weqjYfsmHWZO7AYZXkvEYGDt902r7dIQFGH/54
 SmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUwhd4iuQrDuAQT1ztiICXTjPGctL0v9tZcBWAD/u80=;
 b=3hXbjfwaJbB7KejD/zLfKBsR0KbeNBHHlmo/+zhTkbMPea32YsMbGkx7GXqF6RVABo
 yY9kjIkHWk8k6k0Q17Q75NtHqf70sxUkGt2UVkGYeNAxS8d8fh7kaBL9C4v78hMn2ikY
 iBLEYsPWr+58AHpQuoclDw+2hZ3o6mhGaKGtzSvR3dG3VSxfcSqgSkEn8O0KDGOYvLD9
 6PpzOaJSXBP+w+OMiFGWWrKebp0LkLYsvdu/VsDrEHxUvjvwKllEkdX2HEiU12QQ6pru
 6W3sKF7sYTBT708LPc/ABs88D1AahFdf2QLVHIGTrqTCBXhh64F5UlSzfjdHf9hycTYA
 HT/w==
X-Gm-Message-State: AOAM532CUiL4jGJNuXmy29N7kjvIaXx4YHPGGDGKPFGBzACPXoVpcsOk
 s841e8kNrqk5pfLSphd3GPui7+pQiGPlxG4RMLhkDyzyyeTqmzuE
X-Google-Smtp-Source: ABdhPJz+Untpi1f4nkTXfKMF7uxEOUO1zLTTymjDbr5wUhcLiaR+0oYvo82GxhOrnmQ++lYc8h7Pn61NZ1KoisM26q0=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr4283928ybu.140.1648126319470; Thu, 24
 Mar 2022 05:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220323091637.5609-1-dylan@andestech.com>
 <CAFEAcA-iYmzGg4aqW6qPhiGhbWtp+kY06pGsPHgDiOyyn6YpUQ@mail.gmail.com>
 <YjwUXU0+0xSCjfpN@atcsi01> <YjxBQqnpAbeX/h0Y@atcsi01>
In-Reply-To: <YjxBQqnpAbeX/h0Y@atcsi01>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 12:51:46 +0000
Message-ID: <CAFEAcA-48_ZUFDkoGz+S_tsfta1Lpo6JD6-Pr0cDUc1bFBRxBg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/serial: Support serial_mm_init() with wakeup
 event.
To: Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 10:00, Dylan Jhong <dylan@andestech.com> wrote:
>
> On Wed, Mar 23, 2022 at 05:37:10PM +0800, Peter Maydell wrote:
> > On Wed, 23 Mar 2022 at 09:20, Dylan Jhong <dylan@andestech.com> wrote:
> > >
> > > Although the "wakeup" parameter is declared in SerialState,
> > > but there is no function actually setting it up.
> > > Support "wakeup" as parameter in serial_mm_init().
> >
> > This patch seems to provide a new argument which every
> > caller passes the same value for, unless I missed one
> > somewhere. What's the reason for this change?

> First of all, thank you for your review.
> The purpose of this variable is to allow users to specify their own wakeup reason id.
>
> At present, there are only 4 wakeup reasons provided by QEMU[*1].
> Take uart as an example, which are classified as QEMU_WAKEUP_REASON_OTHER,
> so there is no way to distinguish the source of the wakeup reason when designing a custom power manager device.
>
> Indeed, as you can see, currently there is no device that supports the use of "wakeup_reason".
> But it will be used on the board we are going to upstream later.

None of this tells me why different UARTs would want different
wakeup reasons, or how, if I'm writing a new UART device model,
I should select the wakeup reason, though.

If the intention of this change is as an initial step in
the addition of a new board model, then you should provide
it as part of the patchseries that's upstreaming that board,
so that we can see in context how the proposed new API
is going to be used.

Also, the patch changes the wakeup reason for every user
of serial_mm_init() from "OTHER" to "NONE", which doesn't
seem right.

Since serial_mm_init() is now just a legacy wrapper for
creating a device and setting its properties, consider
just having your new board model create and configure
the device directly, including the new wakeup-reason
property, rather than using serial_mm_init() and forcing
all the other callers of it to change. (Doing that is bette
modern QEMU coding style anyway, usually.)

thanks
-- PMM


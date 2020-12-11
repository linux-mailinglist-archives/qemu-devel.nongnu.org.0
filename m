Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC222D7769
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:07:25 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knj4u-0002dI-IC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj3e-0002Bi-5v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:06:06 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj3a-0002Sy-9d
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:06:05 -0500
Received: by mail-ed1-x544.google.com with SMTP id cw27so9472130edb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+lbFjlaunaLSBFES522FJ0yf9tXkNGgnpl3OldLuhDI=;
 b=tq7uDHQehcfUYFammPrdlMkKRZ7EelB4f1CMmDrTbaVpZS38e+p20RRgFkbngzUneM
 mnftfacvRyEhtbASxYg9GlaPzV8uJ/u3Ix+jBWrDRyBodU9Oe6gYMXDe+HRQCvgYMpHK
 PS4/XuQ8qlASRxaXXC/btd43vP2u2pv2voVWaaw2rYDWaxI7c9KgdATEOinqtFzLpTib
 VHHq3eLtrKqMEudbyFrgJgpKCcroJEOC+xNmjRD55XRyjeG8+mkjVZUN8rWMNLtWQstG
 6P6gDaHp9ZLLcNuaFcizlzboWCMQJTeKJP2a1XeIdjhFgFyKTLlNimWh1FnOq+f/rpcw
 Ci3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lbFjlaunaLSBFES522FJ0yf9tXkNGgnpl3OldLuhDI=;
 b=KhtW7F5wzIlRKwgqW6RXE0h46/e7860uAR7ev4ut3LkxxhlfUpX5spZhCbJVUVCOVw
 6eVZmws/7dKnImR9VXP+Ai7g7+fYCNMpn6FUq6a2HbcDFklYAXx2zQGhckFBManutmOs
 WgVb1OcJ8j3QZzBrAS7ZjxvoEaFJExFCYTECfzYFpige/uzTZRhUc9pfev9gPlm5m0lj
 FhRb8QAhzhA9Fpz0H9Ii39hZRk8EQP51IISt7NE39HBjnrTK5OQ21RHxnXL05Cku7Jpy
 9oMgIzaeONtbYN4XNw93wfAIBqUeamWUegNNsC+RJBLvyn75YPSJwZ8BTfWaN9p8OPNs
 ycSQ==
X-Gm-Message-State: AOAM532vtIQX4LIPI5/0PfCmfaOz0ZfTYf4YEkqcTVBX4eKKwfAHK5gY
 aKBFSWBHtdnCDCYsu8tXTaojC3RyChs+/1+FABNMZnjVb3Y=
X-Google-Smtp-Source: ABdhPJyrBKoEFMCdRveiFtUwV+TR29HMrQaYJ8tkeXmnkH7PeucumIIaU+mhw77I+QxrPJkYe2lTD7eV5qN9BgnHmw0=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr11742028edv.100.1607695560252; 
 Fri, 11 Dec 2020 06:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20201129174022.26530-1-peter.maydell@linaro.org>
In-Reply-To: <20201129174022.26530-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:05:48 +0000
Message-ID: <CAFEAcA_MV-osMjrBvZE+S0y1ntVKR6vS38-mFwAgdpJN4-vZYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/nios2: Roll cpu_pic/nios2_iic code into CPU
 itself
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Nov 2020 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Nios2 architecture supports two different interrupt controller
> options:
>
>  * The IIC (Internal Interrupt Controller) is part of the CPU itself;
>    it has 32 IRQ input lines and no NMI support.  Interrupt status is
>    queried and controlled via the CPU's ipending and istatus
>    registers.
>
>  * The EIC (External Interrupt Controller) interface allows the CPU
>    to connect to an external interrupt controller.  The interface
>    allows the interrupt controller to present a packet of information
>    containing:
>     - handler address
>     - interrupt level
>     - register set
>     - NMI mode
>
> QEMU does not model an EIC currently.  We do model the IIC, but its
> implementation is split across code in hw/nios2/cpu_pic.c and
> hw/intc/nios2_iic.c.  The code in those two files has no state of its
> own -- the IIC state is in the Nios2CPU state struct.
>
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
> can have GPIO input lines themselves, so we can implement the IIC
> directly in the CPU object the same way that real hardware does.
>
> This fixes a Coverity-reported trivial memory leak of the IRQ array
> allocated in nios2_cpu_pic_init().  I think the diffstat on the
> overall patchset is also a pretty good argument for the refactor :-)

Now the tree is open for 6.0 development I'll take this series
via target-arm.next.

thanks
-- PMM


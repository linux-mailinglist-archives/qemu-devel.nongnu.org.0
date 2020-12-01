Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FC2CA135
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:24:37 +0100 (CET)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3ls-0000g0-4B
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3kp-0000DS-6s
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:23:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3kn-00045w-In
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:23:30 -0500
Received: by mail-ej1-x643.google.com with SMTP id jx16so3318537ejb.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZ85ChdcZDjfeQgt3/lbt4tWGobj1813TxrbqKYpXBQ=;
 b=M1noF+usMVMGF/Ic9gEHy7E5WNHRDmy7S56HaS2Usb7pFT7smnx+fbx0VGc5/vKZtr
 xf9xaBiUCCzNR6BQPuT+yvNIHu6v4V6TsWyjrqcv3zUBqXDRBUyZdzrgiBYTKay37YIy
 5FF8f4F7w2LTn/lt/VxjdLdnYTBf44mjUIYx72vLxKXpbTBZI84O+zLda2+kAoQgT6hN
 KJrndNht9DseXzeOfVP7WloinONxw+EHiFblJwUr3pyui3A7NB2YsHLguyzw97olUy13
 cRpyykVg/QTZ0F3mSYhnc2q1BmUsJqclR87Y8PQzhB26NSFMNoyWwNQ4r8gwn8TADUHk
 D2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZ85ChdcZDjfeQgt3/lbt4tWGobj1813TxrbqKYpXBQ=;
 b=AW3dHxgtQvdDSMJV4+BYqTBcL1EJAOZMxw5nFXrrB/4S8eU9zyBZ7M7LR97eYDj3bL
 90nbPJXI8nD6wT7Jwi+6j5xgekEnwFGK7QzlML02MDuGweJLeeYoWuMSmQioIjDnphth
 fg004GDlNGImq7g+6z5MCLtgITY3HndRDfJenZApkFglKfY+Ofw7Jz8U/pQKSrwfTKLd
 0fMF8faTHwW5pNT5ifmKcwrTOVgYexSvtpkMs/IAue/mXOQ9wypZNsymGQBIY5jU8hIr
 GAWKXoptnA3BTHZUfixQAxsZcoSPEb33YgsLUrthQfY4HO0aYpzgOScgxtWEf5w7RjUK
 zD6g==
X-Gm-Message-State: AOAM53141PPOwMobN9fyM2GRD0QdTBGoGGXZlKO4OovdRBMwwDh89NKQ
 sFpBJ/q9k746H0BiE/s8yE01eGKBVOtwx7gLXqJA7Q==
X-Google-Smtp-Source: ABdhPJzmhAd0xHr//42OvYPDHmtWcByGMAneaCMKG4KrHVlfm7RYptMk1UnsBwIfrwz0qtahcLTZjSKOuSaipg1Wrvo=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr2354241ejd.382.1606821807700; 
 Tue, 01 Dec 2020 03:23:27 -0800 (PST)
MIME-Version: 1.0
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-2-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1606811915-8492-2-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:23:16 +0000
Message-ID: <CAFEAcA9JYiv+8Yd9S7wfr=wrZ9TW4H9Fp17-MRJpzs2sKn6F-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] usb: Add versal-usb2-ctrl-regs module
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 08:34, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> wrote:
>
> This module emulates control registers of versal usb2 controller, this is added
> just to make guest happy. In general this module would control the phy-reset
> signal from usb controller, data coherency of the transactions, signals
> the host system errors received from controller.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/usb/meson.build                          |   1 +
>  hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 ++++++++++++++++++++++++++++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c
>  create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


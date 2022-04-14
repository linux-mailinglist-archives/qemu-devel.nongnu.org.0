Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5C50199F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 19:06:22 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2vF-0005Ce-4W
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nf2so-00044U-Ea
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:03:50 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nf2sm-0005bW-GN
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:03:50 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v77so10497987ybi.12
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LxvFT+h41O7+aSa6Uzc5uhj+JGb8TnOCouv+ze+sGM=;
 b=vJFtuZIJZKQYUGi/NUx1x0VGSFajjS5VF7QTqn9F4VEbn1zIUGTKxWV7I3BiBgsMH2
 3Y0C59Bj4F611y/jFC841KhwZ1xyAorZrnCnYAB5Gg1LAsTwXtNkEVocN1IIU3smA/Qo
 Iqw0+YMOKSOgMWOxS4ARFDKmo4YZFa8otRHkFGfju3jbPe3ITDlojgVgOwJyyl/0/59D
 jGQHZSmp8Ek9FY5exIk1eTkDBLr5ovKM2qhImdPBgyvYUDa5VcfbTGdhllPsHS4hNuU9
 XY5PAhbRARtHUH78HCpo/oeq8ZIraqgUGt7HX7+8WTxPRw3oQNX99dz9oOUyZqVGriHw
 UXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LxvFT+h41O7+aSa6Uzc5uhj+JGb8TnOCouv+ze+sGM=;
 b=WO751v04VvblT6YtUp14T/sfR5fl/sj7GxpYz8gCAT0/eO6S3U6+JKzkJsaOHvW0Ap
 QCDkXiDwkHc+K+nPPVf8KR3vhAagPn05Xw4oNrmqltOeiNucHGCiD7rqa0E9sSjaJqOM
 uadO1/FXU8Gv81cZwkVLSiX+RoYZZ3wgQ+1ly1Wy5aJ1xVOEXHs016EcrN1EYCldbQy7
 mlK1tilT3haRxArMrsWtoDo+OIur2XKpF+JeOCk67VmeBa7c2Wx02R3NJtggf+2/o3uO
 aWR09Du8qt7OdIAU5v89F/jmpo/P+votuC6mcvsC1BIoocwIlDSCEe7vnhXiy0aDBo7U
 VNeg==
X-Gm-Message-State: AOAM533HQxeIEMv4YyU+U0ybKSkNSMp9dQljw1L6DL7c9gwzB04uob4C
 Oq/DLKqlRcNcIAPpNS+qfLfGGKEM/CEAwPZVdZhwYcmT4d0=
X-Google-Smtp-Source: ABdhPJwiz/xe7YInjpRGcFixd0sYKzOPTsOezosZ6DeVQd4KnO3pFOf7F0PYqZ1KT3LYa3mc6OkYtBVuq5bK/woszfk=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr2461293ybq.67.1649955826622; Thu, 14 Apr
 2022 10:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220412164921.1685453-1-peter.maydell@linaro.org>
In-Reply-To: <20220412164921.1685453-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Apr 2022 18:03:35 +0100
Message-ID: <CAFEAcA8+aLOoOkyTVR+=_p9x=V6RQCjdu0b-LijC0FvTSAhpyA@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 at 17:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
> don't support DMA.  The core floppy controller code expects this to
> be indicated by setting FDCtrl::dma_chann to -1.  This used to be
> done in the device instance_init functions sysbus_fdc_initfn() and
> sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
> and accidentally lost the setting of dma_chann.
>
> For sysbus-fdc this has no ill effects because we were redundantly
> also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
> this means that guests which try to enable DMA on the floppy
> controller will cause QEMU to crash because FDCtrl::dma is NULL.
>
> Set dma_chann to -1 in the common instance init, and remove the
> redundant code in fdctrl_init_sysbus() that is also setting it.
>
> There is a six-year-old FIXME comment in the jazz board code to the
> effect that in theory it should support doing DMA via a custom DMA
> controller.  If anybody ever chooses to fix that they can do it by
> adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
> (A QOM link property 'dma-controller' on the sysbus device which can
> be set to an instance of IsaDmaClass is probably the way to go.)
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> -void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
> -                        hwaddr mmio_base, DriveInfo **fds)
> +void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds)
>  {
>      FDCtrl *fdctrl;
>      DeviceState *dev;
> @@ -105,7 +104,6 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
>      dev = qdev_new("sysbus-fdc");
>      sys = SYSBUS_FDC(dev);
>      fdctrl = &sys->state;
> -    fdctrl->dma_chann = dma_chann; /* FIXME */
>      sbd = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(sbd, &error_fatal);
>      sysbus_connect_irq(sbd, 0, irq);

Just noticed that deleting this line removes the only use
of the 'fdctrl' local in this function, which then means
we can delete it. I'll send a v2 that does that.

-- PMM


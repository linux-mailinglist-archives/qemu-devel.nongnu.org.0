Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526634AAEE4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:48:06 +0100 (CET)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGf5R-0005ip-DQ
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf1P-0001qk-91
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:43:55 -0500
Received: from [2a00:1450:4864:20::32d] (port=40691
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf1N-0004B8-GV
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:43:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso1375030wme.5
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F2AMYDC7c7A/N+6k/qgXiCpN68x4LOQmQpALrbth+/Y=;
 b=q6staMq80Njonxbu6DmEli+EI7EEaXlw6DMVAxDKKb4rLYUJZI8KZs+gavshdGRCMa
 1h6fOjFepMNr+pELWibJkOV1+OLXAsYygCx8BnT2B/iUoMP08PxQs2zG5vCY36nCwByx
 121pkh42HyESn4P4GzILRYRJwllxOymEdlezfVomEoK7p4G3XvbI322JG8FNjhx2ufjB
 FOjA2dqMByUaQzCtGm8/iYM6u/9OaZtDpM/WVxxuIiWGBYCPDGifEYw2m7OLnPaPwp4M
 iIL+ziuwcTJRYhoHrAfQqtwwiRyKD51zSH9oNRyOKdsUyW54WJN2pqncfREnsMWaZ8Yh
 aIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2AMYDC7c7A/N+6k/qgXiCpN68x4LOQmQpALrbth+/Y=;
 b=fOFKCP51tFgI/AfNDH1hcu6IkmvCtmgGIo1tCYnwvmfAfXssQTRl9r+bx2RqXBXDsP
 FkAw8i9JrWyic8NmwPmNCg4kjYZnvMhUj7PksyR0ISHYCpcTs6/PSfW/aAOLviJaP+VJ
 rdEf+o3NWA4v0DokcP/KGih2zSxr8LqQgCFGD2Tcn2viP6AggJV55sYAAz3eq9I/s38G
 Lr1RJM7xGHIgEiYJGOqxCTIMwjfD/EErC91CK0kIN+1TLaCGoK63Qz89RJMM3AijPjHb
 KiP1+tIkloigUJA0pCcOtwenxfepCOQxiWOVYdea5/GE7Q1Vl7LlUexlYPUkmmPhGtgw
 GxgA==
X-Gm-Message-State: AOAM532uiYQPbT8/QpE1T+tOA686WfmrLbG6+7o1ECXhj8BgHNT7k86P
 l8aoI3cyZQR0DhXSVNJfrWtA/dcZqqE1R4oTj79+bg==
X-Google-Smtp-Source: ABdhPJxdWzkg7GU3i//vuQ8UO0B27zZUrWF8lDFHT3K50i1K5kcWpEp1aI0rkKv90hiduM8HcZ3gEJNZdsjs/FaKkBA=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr10190007wmq.126.1644144232284; 
 Sun, 06 Feb 2022 02:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20220203000550.36711-1-f4bug@amsat.org>
 <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
 <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
 <CAFEAcA820MLMqW4k89sgxiyzYdYajnTLfwQg3JoszuTMMSA3uA@mail.gmail.com>
 <547de7d2-b7a0-5077-acf2-b72e326de544@ilande.co.uk>
In-Reply-To: <547de7d2-b7a0-5077-acf2-b72e326de544@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 10:43:41 +0000
Message-ID: <CAFEAcA_F-gLUqrez+bhs7OLgMR7GdR-05Ze9yBuoBdQftAdm3A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andreas Gustafsson <gson@gson.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 09:30, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 05/02/2022 15:39, Peter Maydell wrote:
> > The handling of the vram buffer seems weird in this device overall,
> > though -- the memory block is divided into three parts
> >   * main vram, one byte per pixel
> >   * vram24, four bytes per pixel
> >   * cplane, four bytes per pixel
> >
> > As far as I can see, only if depth=24 (fixed at device creation
> > time) do we use the vram24 and cplane parts. But we create the
> > memory block at the same size regardless of depth and we expose
> > the vram24 and cplane parts to the guest as sysbus MMIO regions
> > that are mapped into guest memory regardless of depth...
>
> (goes and looks)
>
> It does look a bit odd certainly. Without Blue Swirl being around all I can only
> guess as to why everything is configured to use an alias onto a single VRAM memory
> region :/
>
> As for exposing the vram24 and cplane parts, I don't think it matters since 24-bit
> mode is clearly designed to be backwards compatible with 8-bit mode. During
> initialisation OpenBIOS reads the colour depth using the fw_cfg interface and adds
> the registers for that mode into the DT as required so the correct information is
> exposed to the guest.

A guest won't notice if we expose stuff to it that it doesn't expect
to be there -- but if the 8-bit-only device is not supposed to have
those memory regions we shouldn't be creating them...

-- PMM


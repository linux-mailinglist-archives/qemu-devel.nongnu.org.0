Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61C2FB6C4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:14:14 +0100 (CET)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rlq-0000FP-7G
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rkY-0007s9-Q2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:12:50 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rkW-0000Ob-Di
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:12:50 -0500
Received: by mail-ej1-x636.google.com with SMTP id ke15so20997536ejc.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G90+9oVFQRnmQsOMhZfnDMO73GYi5Rl59CMsJyndS3U=;
 b=KlZTxJ/Rbj+qn8M822eFyVrL9gLiBIRdMQ65MtACkWVvw89ww9rKuJBWztJT3PRW+a
 mEgSoQItTu6w2JnDJP6n7GLHi2SjoHfK88IrFx2eAawADx2908OerhYUyCvgPE2BqX3R
 sROCI1r3GfSqk3iq1vJ1iZmI4kqRt0XAkca8GkuPlWTK87plJetuh0Pp+D/UdoLsxXG7
 tHW3cB6fjPS/BGnKfvqbgV07sB9WuoYNyO+ibKq9VehobWR0d1n9LG/aj/Y5vxln1jyk
 J72nXZhCJ16X8LCl1HmdgB2Wc1ESnFVMEyj94Q8feMTVIM8Cmw2UNKvy1wfAj1UkzyRu
 6ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G90+9oVFQRnmQsOMhZfnDMO73GYi5Rl59CMsJyndS3U=;
 b=a0bYAEOBKTL7BjkQLTlfHuiXNajC+eU5DPEhKjBvhaLn4cwEwA+K7UGU8Xar3eyAJw
 3v9ewY32Nc6gkOC1IXh2BjEBH030EDVOzAr5/Dy6hKcBUXgoOU9dp1Qpw5p9WEGfXw3T
 SypOOCLbzg4aQv7QKNjnZr+lI7skeHWPhHAojZsoYhV6F8yo3p/E3KPzmxzMvYFrzWKH
 q3crxjtCocDg9sZh+a5s3uLFS68MYZmn6UNZ2Lymq8takK1TDk5B5UAMXO9bhwK9PkBm
 IwgPrx3eNuH022l2P7P2rDZWnqgfBBchWLd4LsAdjN6cWNgaewRVhPE83QV+OPEll+Fk
 Z4nQ==
X-Gm-Message-State: AOAM530CqbzK8y/BinNYjKaYmXxBTtOZkXvZpZjlB1KWmzUc5BZi6n9g
 GZIbH6Jk3D1ugpdi6lV0VOStOVaDhFYQ+k/W++6btg==
X-Google-Smtp-Source: ABdhPJwJS+XDgk4zC7QcSl/LgVJ8yKltcfoh5Klk19Y619MUhypSgflVRW9sxrHvS5BEsYnV4mVJoCN4hZ03A7xkqUM=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr3030501ejz.407.1611065566676; 
 Tue, 19 Jan 2021 06:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-4-maxim.uvarov@linaro.org>
 <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
 <CAD8XO3YjP8RUDd2T6+VwfnnCm4fk-i6x5DbmtOHF553yxt9Jtw@mail.gmail.com>
In-Reply-To: <CAD8XO3YjP8RUDd2T6+VwfnnCm4fk-i6x5DbmtOHF553yxt9Jtw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:12:35 +0000
Message-ID: <CAFEAcA-9NR4JtE_heC6N1tX9bd7zAxXgke4APyv81df0nBr2_A@mail.gmail.com>
Subject: Re: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:47, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Tue, 19 Jan 2021 at 16:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > Remind me why we start with GPIO line number 3 and not 0 ?
> >
>
> Original gpio power key use 3 and 4 (non-secure). I just selected the
> same to be consistent.

Those are different GPIO lines on a different PL061 doing a
different job. I don't think they need to be the same number.
The power keys are on 3 and 4 because pins 0, 1 and 2 were
reserved for PCI hotplug, CPU hotplug and memory hotplug.
Unless you have some similar reason why you need to reserve
pins on the secure PL061, I would just start from 0.

> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
> > > +
> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
> > > +                            "label", "GPIO PWR Poweroff");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
> > > +                          ATF_GPIO_POWEROFF);
> > > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
> > > +                           "gpios", phandle, 3, 0);
> > > +
> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
> > > +                            "label", "GPIO PWR Reboot");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
> > > +                          ATF_GPIO_REBOOT);
> > > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
> > > +                           "gpios", phandle, 3, 0);
> >
> > There doesn't seem to be any documented 'gpio-pwr' devicetree
> > binding. Where does this come from ?
> >
> gpio-pwr created from the first patch.  There are no bindings yet.

You can't use bindings you've just made up -- you have to get them
accepted into the kernel's official devicetree documentation if
the ones already there aren't sufficient, before you can add
code to QEMU that generates them.

> > I think the bindings you want to be using are
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-restart.txt
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
> >
> These handles are from 'secure memory' where linux does not have
> access.  But I think we can use that
> binding with other compatible. Like compatible = "gpio-poweroff,secure".

That's not how you specify that a node is only relevant to the
secure world: you set the 'status' property to 'disabled'
and the 'secure-status' property to 'okay':
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt

thanks
-- PMM


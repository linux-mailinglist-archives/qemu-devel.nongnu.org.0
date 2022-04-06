Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEEF4F6B75
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 22:32:05 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncCJw-0003cf-9M
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 16:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncCHE-0002QX-Pe
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:29:16 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncCHD-0001VR-1T
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:29:16 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2eb680211d9so39707897b3.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UzEtRY9xucka5enL+HyWJDFYrwwyjo9/kjQFkntIPn4=;
 b=ynVYPFPJPvqd4IQlbwWnTHWNrRVgCkX+3E8JoP6U0jH+fs7JtF6g2a9MTOW/wlowoc
 myvl+6NdkQc4l5ibYoFyBiKToi3Evk86ilYLYJBfei0jN+QQd+enAPhFLRLL41jPS59I
 99CMDHN9mgR90oi798Y2cciv5q3D4Q1fCnBcPfmam2dJ7tPeotJlXuOVbtg/IWka+A7e
 9xbmkYa0Rp+3O2IaZ74HXt5ZOZ/id3N0UWmj3Rpn1ZUfiq37H7koR3JjiJsk4fqFfwGw
 FIqw3ByXko9gsOI6kipr/WIWg82Y4B/yx/euQbKeI7Su7h4JGTl7pZ1gGs04fNdpDH/e
 buJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UzEtRY9xucka5enL+HyWJDFYrwwyjo9/kjQFkntIPn4=;
 b=ApWUeCWlvC/Mpx/NdPUsOAc4bhvS2hEbdRFoGUxnBmu2Bh8mBG8dKkeTzQSzmfnhhp
 5jjf7q64Ghi3UVcAmno99+fzRmK/9E5Mgi+uje3/TacWzzDGnOKGJ3JeA+dniyRvIt4s
 4Qxbw6MX+XfMvrujUpV4hslqNh9axGirE6OqbZ2tw59w0gOHa3mt6kyPuAQJ/INrdQys
 2U8kyavkcLK0kymcA9Z8FRNcs7odSQB9zXt3A39P+IA0Zr+KUIWx7MmBuR1N28T367D3
 Ol1fbV4lWiB+XzUZiniglJF1CcNrKhEBWXpkJfTXq+jWNxG+35d2v7VhKKAyofj858zC
 Y+hg==
X-Gm-Message-State: AOAM531s/SdQQZUC0q8O/3nBHlV+GF0vAvq600S6j0O3eKpKaoEwr5iq
 +w8F3OhJwgQhuhEoWJz3G4wAKfIQMDpylxK/J5b33A==
X-Google-Smtp-Source: ABdhPJwrTaUAiZ0LZOhBtA2JrSgtD2ejrNeC3rulj1eXgnTBBUFRAs090c1N75eG7DaSTT6fz45f5Rq8TEUW2vE3avw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr9064226ywb.257.1649276953911; Wed, 06 Apr
 2022 13:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220406185812.1055724-1-imammedo@redhat.com>
 <Yk3jILX8JfQG2ABl@work-vm>
In-Reply-To: <Yk3jILX8JfQG2ABl@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 21:29:02 +0100
Message-ID: <CAFEAcA_mGDuzMZEz3uDyxyB9_Zp503FoLr6sdz-7hUF+CFaLRQ@mail.gmail.com>
Subject: Re: [PATCH v2] acpi: fix acpi_index migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, leobras@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 19:59, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Igor Mammedov (imammedo@redhat.com) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > vmstate_acpi_pcihp_use_acpi_index() was expecting AcpiPciHpState
> > as state but it actually received PIIX4PMState, because
> > VMSTATE_PCI_HOTPLUG is a macro and not another struct.
> > So it ended up accessing random pointer, which resulted
> > in 'false' return value and acpi_index field wasn't ever
> > sent.
> >
> > However in 7.0 that pointer de-references to value > 0, and
> > destination QEMU starts to expect the field which isn't
> > sent in migratioon stream from older QEMU (6.2 and older).
> > As result migration fails with:
> >   qemu-system-x86_64: Missing section footer for 0000:00:01.3/piix4_pm
> >   qemu-system-x86_64: load of migration failed: Invalid argument
> >
> > In addition with QEMU-6.2, destination due to not expected
> > state, also never expects the acpi_index field in migration
> > stream.
> >
> > Q35 is not affected as it always sends/expects the field as
> > long as acpi based PCI hotplug is enabled.
> >
> > Fix issue by introducing compat knob to never send/expect
> > acpi_index in migration stream for 6.2 and older PC machine
> > types and always send it for 7.0 and newer PC machine types.
> >
> > Diagnosed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Applied to master for rc3, thanks.

-- PMM


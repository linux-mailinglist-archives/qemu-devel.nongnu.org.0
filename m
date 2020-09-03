Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E425C1CB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 15:42:35 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDpVa-0005wO-K9
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 09:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpUj-0005Uw-0K
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:41:41 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpUh-0000l7-6Y
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:41:40 -0400
Received: by mail-ed1-x544.google.com with SMTP id b12so2680892edz.11
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fzIP45hW+79F4hUNRI+mrLa7HAgsqApgIY4Pjgt/J58=;
 b=Uz/OmN9N3Rby/mP3xtdDL1zRBqdE6Kl+2pchZs6NqePrnAklOOv86iQTmWerXJXlDf
 pIvOEGG4ieCDdRfTQu+HSxfheIMOodH/RwtOV7tE3RxbKbSZnrZTT+i8JMwEhez2Edsb
 wbhSuv3YJ7sAmslJqOrByvLMhzo2Fyw9758Oh1/Xe178HljzO6DAUFjkj1JAxqLO/p9J
 ijYWqdytQGbBCf5dNS9tx3wjLO9WMSI/sJ7GLEdo//zFK5HdojUy9NOb34bGIzxM50y6
 YpyqMghYJsz74MZGwMo/4Xtf6xyrSBgq79sFhk5CiuXy+7aiEr/L8z81rpnlKW4VXJED
 RubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fzIP45hW+79F4hUNRI+mrLa7HAgsqApgIY4Pjgt/J58=;
 b=Gs1L30/bTZ3NjduItbPJt39rtAjafBG5Beb7dKtB4sFrMFnoPgMMDwrT8EaygfZpow
 TqHochUEiDgJIK/9Xf5l2//cWWbCFJnJbOTtXUf2hgxEG0aL2i8s/eBu6BmIzYzZnewC
 5C9QMUYgenUTTYzK3x+J6zvx7KPYjvy4UmSFnnmdzF4I9lSDbgBJMvh05lj6Zex2kfoN
 kYObkJE3DnnaoMsFAZ5deUSJfsgMeFQwjiwkONE49064gU3ljiIvKuzyKSOO94hk7dgX
 dz03872dlVPeB4GrHKhOfXxVAXndyrSsBzmmBat7Eb1C/fbB9KKcDcVy/cmpgG0I+1Yr
 LyZA==
X-Gm-Message-State: AOAM531oVzsnPcxqHDwg3YdURdIlVh5E5o8TkZ/G+A87yUfeI/5YZZvh
 D7udJ701+Y4L3qrQejWXOojkCudYlnnsxHFWwNOtYA==
X-Google-Smtp-Source: ABdhPJxDYxuDTWEAUvS8+0Rl7N2G7imNcqhrAkq06zDvjCSB6l2a6YcSOCiUahgP62hRVqTmMGZdThNmjKhPxG70RKo=
X-Received: by 2002:a50:8f45:: with SMTP id 63mr3287152edy.52.1599140497577;
 Thu, 03 Sep 2020 06:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200902162206.101872-1-liq3ea@163.com>
 <b840aab8-542d-af43-43e5-0a07f442b5d5@redhat.com>
 <CAFEAcA9mvMaR5MJJ74Vv63TG6frWnMeSZA19Zxv8TUceudPUTQ@mail.gmail.com>
 <CAKXe6SLYgkiTAYa81nppHUMEzoeGy3988OmrzZyw8-VY8ajE3w@mail.gmail.com>
 <CAFEAcA9TEpfBmfOOtpfR9JCAFkMF0fy20L=DBVDTFaLp6J3Lfg@mail.gmail.com>
 <CAKXe6SKgVo5HBL2Uf8AscEn5ohZOJZGLMmT3NZL5cEbcQzgivg@mail.gmail.com>
 <CAFEAcA_yTWf2toD_R3ye_cYRZjGOeyrKTV6At2U6vtHn5iiYPg@mail.gmail.com>
 <475a8df6-f54d-9dff-f014-0aedf74ccc88@redhat.com>
In-Reply-To: <475a8df6-f54d-9dff-f014-0aedf74ccc88@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 14:41:26 +0100
Message-ID: <CAFEAcA99QOUaJ-wUZQfxmxfx+Mbp1mwWD=cK_vQ8fCE0RwfQuw@mail.gmail.com>
Subject: Re: [RFC 0/3] try to solve the DMA to MMIO issue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@163.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Sep 2020 at 14:36, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Not sure if this is a valid example, but when adding:
>
> -- >8 --
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index bca71b5934b..b8b4ba362b1 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -96,6 +96,8 @@ static void ioapic_service(IOAPICCommonState *s)
>      uint32_t mask;
>      uint64_t entry;
>
> +    assert(!resettable_is_in_reset(OBJECT(s)));
> +
>      for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
>          mask =3D 1 << i;
>          if (s->irr & mask) {
> ---
>
> I get a MMIO write triggered from an IRQ:

Yeah, IRQs can trigger MMIO writes. In this case one underlying
problem is that the hpet_reset() code is asserting a qemu_irq
in a reset phase that it should not, because it's an old-style
reset function and not a new-style 3-phase one (which would
do the assertion of the IRQ only in the 3rd phase). I don't
think this is a case of ending up with a recursive re-entry
into the code of the original device, though.

thanks
-- PMM


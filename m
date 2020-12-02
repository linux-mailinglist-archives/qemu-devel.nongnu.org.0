Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452A2CCA64
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:16:32 +0100 (CET)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbMM-0006Dv-Td
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkbLM-0005gB-BG; Wed, 02 Dec 2020 18:15:28 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:38732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkbLK-0003xi-1F; Wed, 02 Dec 2020 18:15:28 -0500
Received: by mail-io1-xd41.google.com with SMTP id y5so118432iow.5;
 Wed, 02 Dec 2020 15:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6HQQhVx0AJbcSoL8uZVgdm1ecodMm2kvPL98lDWFJo=;
 b=ZiCHrIGylPTMWJa5OkOQkuKD8zHwbspjceBTpwjz7SLddRNVphkaode7/UhVumlMVC
 qCp4mWtl9jxUk6vFgnQ2is9cDczlhH+S759wJ1EbSIsKWFQYcy6CB5aCi9S0e42QzQLR
 nqNts/GtkGXEozPY/aV7o/ZQTXol68sEtF7Jhq5bmaoG3qv1/aYHHHrWfeq0S9X0fmjQ
 eDnSDMvRFcKiHdL/0fvt2qAEFwfkfCQkyVVuiY6r60GpOicdSVLVMPofiysxMQtLInsh
 BwCQa3A3XEHt7p8gzOEbSRvvlvQzdOwpe2LYBSJ7FZKGZXnMu6pHDsnSfPV7BVZ2wDkR
 nrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6HQQhVx0AJbcSoL8uZVgdm1ecodMm2kvPL98lDWFJo=;
 b=nXIqmIpII7T6s70dHiSFhcElJX05KxntTUnh/fCvtZ8GxF6NvajeMaEDv6uzOia6Sz
 soxQtsvdBY1aOfWf4ACqgi1OyNFv94+38GzptynyaxTHeuQzmi7u2Qvbsrndi+iMQvJ/
 pfqoqRc4/YSUeydNM4mXmYXeUSZM3Z4BYSug18LVY0zwpvsvvJA4WSlaZsYfJNBPovSr
 goHn1GDWe4dxmX3AqARxZF+v7kCChUFkzWbB9YLbRYj5siL0jr5ut8B00EeQyWGCNJ2U
 axRtt2sKlQnmUnp+9etqSvobQyaIIQJ+Fb5l/2srk0UYje/4PEnqMeqV3qEsRvQFOJwx
 GFtw==
X-Gm-Message-State: AOAM530J9JVrkuTNIsXXHPuDe2jVM6146LYXjAyQr2Zixm2qvJ4BhqOF
 nQ4pwmJtVXQK56UO4I+n6JCulSBU50Oq/6zROus=
X-Google-Smtp-Source: ABdhPJwpqro7xxjFlue6dDEiPyFCst+/24jpllWB1YvMixNHYXAiZM09JdE6fTtwc43qlF8Z4BGI0xWdNbbvbReBKTs=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr587525jab.135.1606950924545;
 Wed, 02 Dec 2020 15:15:24 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <CAEUhbmU5mGQSpVu+UXr_3qoP-M4x1pUuiLzMHU7djQE-LTrK+Q@mail.gmail.com>
In-Reply-To: <CAEUhbmU5mGQSpVu+UXr_3qoP-M4x1pUuiLzMHU7djQE-LTrK+Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Dec 2020 15:14:58 -0800
Message-ID: <CAKmqyKOgO6R1Y2qACT0H4ubmzuhKCLdgkg7AYnxM+nD5fQcX2Q@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 2, 2020 at 3:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, Dec 3, 2020 at 3:52 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > SST flashes require a dummy byte after the address bits.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > I couldn't find a datasheet that says this... But the actual code
> > change looks fine, so:
> >
>
> Please find the SST25VF016B datasheet at
> http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf. The
> fast read sequence is on page 11.

Ah cool. I thought it would be somewhere, I just couldn't find it.

Alistair

>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >
>
> Thanks!
>
> Regards,
> Bin


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5EF575161
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:04:56 +0200 (CEST)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Oe-0002Z7-1J
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0MH-000764-IA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:02:29 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0MG-0007tY-00
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:02:29 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31c8a1e9e33so19846957b3.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TOZlZBtKFOOlg01mQGPbGXR4vd3wmbwB1PDObIWoPeA=;
 b=cDsK2kBC5cMHiEGynYFM5dnmhVSvsn/e9FUAgfzVjkZ6xn2YkZJkvYISsYlm0344s7
 7s9/5dChDGxes59kRRUZji8M5y8N9VSvM066N7epnrVjFNK2YswgrmmyWAqVA3m9yGpK
 2HdbZYJCoUdAGYAANWOitCnMOQFQRVrlHlVfVP/sjM5VMldqyAnn9P2q1Qs6HGroH/Es
 5fBc6moy6AIuvJ4g0dzLHEtRGgd3kwuis/aAiy24yEcd6FMl2dT4zVtfJPI2DwTXj4un
 OxCC2A4yt8/PBVNIMgF0g5DMl5kaR7Wyd7kRiZFq6jejKLkBme3hJ71o6si7WmTjTFlI
 8qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOZlZBtKFOOlg01mQGPbGXR4vd3wmbwB1PDObIWoPeA=;
 b=qCYOdD6/j0Oz0ntEOlZzkJYkPBlrIzgHhiHSUYz2r0fgwYnJjkt0IGwl2J2Eq+cZQo
 OguBICfHmYR4yxarPG5ikv+0GUzi0OUfR87Y9GfnjIGUGPQcpbg3fFrgz+5kOjmOUWtB
 9d/QVnnN15gpcL7c3oxIWI+Dp0fHdGKb0uDx1VLU+9nFyBuYw8WTpDqeq8eEODjveV+N
 csP0X5HFSrDU1uGvm1Aq5SRWnVdBbiK4didtjQ2QE5BZabDFs5KNK8tKdR2ehPcFBDyE
 QP17zbG3zIIqPexlvkdvUvyUaHX0Z8WpIhswMUdPiJLU4336ITnUngJ6zCDc7DyXl2Pv
 S89A==
X-Gm-Message-State: AJIora8PFcoZQjnYFax4i0W0h58hhM6KiXah0nTc4mQf++8PIZayzYwG
 s7EKF9FkfXR97XEZPSIITOARUMYL5c7Gotovd+Y/Yg==
X-Google-Smtp-Source: AGRyM1vgQFNFxKDS/rbWglYmwQ/NDPvhIGJ8O9mXst07iw8ZKAUiyvhs6UtrZxKozj2pTJebhnbJW7ii4Om1K3NL8tw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr10253146ywb.257.1657810946547; Thu, 14
 Jul 2022 08:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220713081735.112016-1-shentey@gmail.com>
 <20220713081735.112016-4-shentey@gmail.com>
In-Reply-To: <20220713081735.112016-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:01:47 +0100
Message-ID: <CAFEAcA809MiUD1B2k11+k1UTPbz6vR=2+ePSRNJvS10nZou1mA@mail.gmail.com>
Subject: Re: [PATCH 03/11] hw/isa/piix3: QOM'ify USB controller creation
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Wed, 13 Jul 2022 at 09:49, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The USB controller is an integral part of PIIX3 (function 2). So create
> it as part of the southbridge.
>
> Note that the USB function is optional in QEMU. This is why it gets
> unparented if it is disabled, otherwiese QEMU will abort with:
>
>   src/hw/core/qdev.c:357: qdev_assert_realized_properly_cb: Assertion `dev->realized' failed

I would suggest doing the object_initialize_child() in realize when
we know whether usb is enabled or not, rather than always
initializing it and then unparenting it later. That's the way
I've handled "some property value determines whether or not the
device has a child object" in other places.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA03F97F4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:17:13 +0200 (CEST)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJYv1-0001Fw-0K
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJYtK-0000U5-TQ
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:15:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJYtJ-0001Hk-9u
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:15:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id me10so12678851ejb.11
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8eZme49jQRfYhDzJSJ/77OFV7j4iRnk/WS77defNqc=;
 b=GLLoHXs8Nm+9NSjYiNdwlWBnZz/yA74IOV8DMS1eTs8z0X8bIO+6y1Wlkk4iQBpNFv
 xsreQ8/Zda80wQkNZMjGcGLAT+Rt7qPpZEAYr+5yXv9Ndpnm2TTl2KBhfQ5/g4GTvg8/
 LmpPXN1b2LvFtgzT91ksaQazSAbb5mD6pYpE2SxToFz7UKtARucprxMtRmRDFh/zvRJk
 MuIMqG8iW7XWM5Drseu7Dvt6lRxemBoQX9oFDllOSQAlwo2QoCbf8s2T+YCYHGxp9VXx
 6NyvTL0TD+NnH51Nrs27kAJC9l+7RgGPUgPybpzW+rHk8aIEc3m8grpBDGnKNttrrLUm
 lCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8eZme49jQRfYhDzJSJ/77OFV7j4iRnk/WS77defNqc=;
 b=scp2S9x48BGwIzF3knl04Yk0PE6N4g6DGGw7bkJ1Wbzef5l+MaAPr/t+EvrvICFrot
 e1rVtoX7iVaGM7hddDU0TiIPuqeeg51lYFxazdhiNOtcDlFvHJViwQc1otC4iI4DhUcz
 dpyTEeS5tqrJBuZTWdsX3Ear0Un7MhmljVm5SI3zdjdIrXFGRs3IJWpiGrNj0DZZDgGE
 z9lmGnwkAsnAlVCfZqTTE18Z05TYXI3k1a3QT3b5IK6U+KQoL1dhACdZsUEIL2gWEkci
 g/rPX6d+84c/UKVnQt+HKdRA0PFxz9Dp480nGEEKEg37VpepXRxiCJs9z2IC0gN2YZDL
 MM7Q==
X-Gm-Message-State: AOAM530wlF2Z89v0kd1ucPuzp9h+YquLcc1izdXBC+usrEXutcDqY2m+
 +updXhnSNggHB/wvGrJ9Tz6Y7PRikWI0hOPmG3j21g==
X-Google-Smtp-Source: ABdhPJxp7np42q5owXKclCbBFkr/kfu+aU9H8Oq2E7AgAR6gr1Ce5pnK7CgKJO7BV7aVPq1kxUYrYOKVgoCPftkXGRk=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr9305367ejz.250.1630059315096; 
 Fri, 27 Aug 2021 03:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
 <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
 <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
 <44d7475b-0d4a-58e0-59e1-bba24cb1ca7e@ilande.co.uk>
In-Reply-To: <44d7475b-0d4a-58e0-59e1-bba24cb1ca7e@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 11:14:27 +0100
Message-ID: <CAFEAcA82o8v6zJoYsv0hg9O-rUcUQL8EL2G-o76dwMg9k=bONA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 10:14, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> Ah so the plan moving forward is to always have an explicit MR passed in for DMA use.
> Sorry if I missed that in earlier versions of the patchset, I'm still getting back up
> to speed on QEMU hacking.
>
> Was there a decision as to what the property name should be? I see "dma_mr" used
> quite a bit, and if there will be more patches to remove the system_memory default
> from other devices then it would be nice to try and use the same name everywhere.

No, I don't think we have a convention; it might be nice to add one.
Currently a quick git grep for DEFINE_PROP_LINK and eyeballing of
the results shows that we have:

 "memory" x 7
 "dram" x 4
 "downstream" x 3
 "dma-memory" x 3
 "dma" x 2
 "source-memory"
 "dram-mr"
 "ddr"
 "ddr-ram"
 "gic"
 "cpc"
 "port[N]"
 "dma_mr"
 "ahb-bus"
 "system-memory"
 "main-bus"

This list includes all our TYPE_MEMORY_REGION link properties; a few of these
are special-purpose, and reasonably have specialized names. 2 out of 3 users
of "downstream" are devices which pass on (or filter out) memory transactions
from the CPU (tz-msc, tz-mpc), and I think that name makes sense there.
(The 3rd is pl080.c, which is a plain old DMA controller, and the naming
there is not so well-suited.)

"memory" is mostly SoC and CPU objects taking a link to whatever they should
have as the CPU's view of memory.

I don't have a strong view on what we ought to try to standardize on,
except that I don't like the "_mr" or "-mr" suffix -- I don't think we
need to try to encode the type of the link property in the property name.

It is probably reasonable to have different naming conventions for:
 * SoC and CPU objects, which take a link to the MR which represents
   the CPU/SoC's view of the outside world
 * Endpoint devices which can be DMA masters and take a link giving
   them their view of what they can DMA to
 * filtering/control devices which take incoming transactions from
   an upstream port, filter some and pass the rest through to a
   downstream port

In pretty much all cases, these link properties are used only internally
to QEMU, so if we decide on a naming convention we can fairly easily
rename existing properties to match.

-- PMM


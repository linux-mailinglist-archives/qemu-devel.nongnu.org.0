Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B3441DB7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:08:06 +0100 (CET)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZqu-0001fe-UH
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhZnh-0006LK-1E
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:04:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhZnb-0001EF-M6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:04:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d13so28818847wrf.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9BjVxvpbqA+GnjOJfPUlZZl3rcN+UbWEbMo/gVEwe4=;
 b=FBJMasdREXWFMEcO/Og733/w8H8FcDros9ovHYSCIzhjF108BvniQpK20iFNFlxTAx
 a3+T8P3N6+GErpjZn5c/NfW5yU0rOMtIlKsUw9qugF4+noGmnkIJa3m2KM4xsdXZKgq5
 83qKSbW3n1FUYwur06D41a2jjKRe1g15AmE3d0F9sezuClAnrO3pQWZI/SJXhp1b3uSt
 cIH8/tqYiBLYK3U8BkItqPV/5VdBCPaQ+FLmbnn0QjCujviHE7MId7sv6CZOE1fOLIYW
 sG2ZifbRui6tX5rZe7O5j+fQOq0gvdyG2dIycggEb8SuzYCBi7wnfQToekO8Ak3lYg1E
 +P8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9BjVxvpbqA+GnjOJfPUlZZl3rcN+UbWEbMo/gVEwe4=;
 b=GwMGLO2Nw0Y0eKupNebkhr4h5AvaDQPjq1iBWBcLfIdngi14VhAdIEpYGtojy2E8ei
 Vc8/EzSf3dsWsB3R5N2+QXW11LEgkwSIsibwA2THJ0nEhokj/i4NuObVPwGoWM0C5oKO
 btPySTQDv5W75IO2LNzOQ4jom5IM8ieVG7JRXM5I7MeO6LR3ZFeAny97pm9OWfyuqCPM
 ny40RsLx/EyZpTQ0G7k1RNPcKgjrC7uR3QMcydfqi9R4rLwtvEeIUU+2m9WLbpeT8kD5
 KT8mfegMY9llSo513Xr2VqaxfvYPm54u8WqlJjoI7Av98EFFSGhW8IHgp/HBQW/aVRuw
 qxdA==
X-Gm-Message-State: AOAM531uxP63Xn2AENtA6voFgfMYe3Lm7duILZUX56bTaFHGyFVRw47H
 WAKdd4lflonp3sjnOASbeEMcPq50KMB5IZE41NJ0Tg==
X-Google-Smtp-Source: ABdhPJxHgWLXInhJer7Ml4beDBZZnu0tx7ew3vMAbAnUjh4EC45SIcQ+1a6sNQ8bDNQBevLRu4CdAub9OG9D+ydrE/U=
X-Received: by 2002:adf:e984:: with SMTP id h4mr35166102wrm.149.1635782677891; 
 Mon, 01 Nov 2021 09:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920122535.269988-1-eric.auger@redhat.com>
 <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
In-Reply-To: <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 16:04:26 +0000
Message-ID: <CAFEAcA8tbJ3jbHghvqk3hmUOZmQEzYva2Qqbq49i4dC93bQXCA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Sept 2021 at 13:25, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > The PL031 currently is not able to report guest RTC change to the QMP
> > monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> > to qapi_event_send_rtc_change() when the Load Register is written. The
> > value which is reported corresponds to the difference between the guest
> > reference time and the reference time kept in softmmu/rtc.c.
> >
> > For instance adding 20s to the guest RTC value will report 20. Adding
> > an extra 20s to the guest RTC value will report 20 + 20 = 40.
> >
> > The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
> > require to compile the PL031 with specific_ss.add() to avoid
> > ./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
> > "TARGET_<ARCH>".
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Thanks. This looks plausible to me (well, it would ;-)) but
> I would appreciate review from Paolo or somebody else who
> understands the rtc_change feature and handling.

Ping? Review from somebody who understands rtc_change would
still be nice...

-- PMM


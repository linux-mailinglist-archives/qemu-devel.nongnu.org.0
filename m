Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906F450CDB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 18:42:07 +0100 (CET)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfzZ-0001EQ-RA
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 12:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfyC-0000AY-99
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:40:40 -0500
Received: from [2a00:1450:4864:20::32b] (port=37806
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfyA-0006Ck-Mq
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:40:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso709073wms.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgArtFSsKfuNgvE4Dj7MuprYCDpTclYdEeCfODPLHww=;
 b=u0rqKK4874ee4Czh/apfDjLHU28IIHjO4oO5wYZa83yIzSTiiiaNa2zB756NVW6ww+
 LjaP6Xk51ZCJYkLt2Q4Z3ofm/aCTBY7qwUQud7O6nciueEi4SkWBLgZBmrvZsXNqd1RA
 UnVKHHGboqLdRxjpEm9zKj9SGPfiTeuke1sm0oyHiRsQPD4nnJ711PLzI98WBxqkEQ4V
 xFSd6BBfA5I6bvWDxGIhtuWRi0wPjL1J1wEnbk7egTr2lxqn9ex49/doJTkmZ1/pikRn
 FuZSpqd98bvtGddvxpXmGUw0R3AhSHMrIWAqG+RHWpdruJ5gARifuXZtFqMqQ6PKIDW8
 pwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgArtFSsKfuNgvE4Dj7MuprYCDpTclYdEeCfODPLHww=;
 b=GqdLz9rGNmVfXItMFl+LdeVIsqYs44qFm2ewrum26N6rKT++GsFA53GTJd5qZRo1A/
 QtMr55UI17lh/s68YOzn0js5VJWdZuIwtozhFKJxdJiUrIAgcq4uNgwITGHvdHAugGN3
 UXTnomYh4a/R5h1Ydc3cGuHlUao3igAvEzb5+B6o8e46K2xlkfIwuzHoW1EVJcSwhqF5
 8s1I55/hQl8WDXguiCc8Mo8lDWk1Z73PIsuUwmK8D4TH5i9hIm2zPZe4N22kJtfcpQrh
 oKxVMPhA7cx8KzoYvTlgVC7hdKi6bS5PrFUEigluTSHVDCjOVAPKeRETsqmeYGeJ57fG
 EGfQ==
X-Gm-Message-State: AOAM532oI4MK83Vs6LJNzsGQ/LxaKt8dp49j30eEOl1G52mVLRXaKgTr
 AQocDJvRqlM65Mtns2p/xE4CjI6dnn3IccoSbKOUIg==
X-Google-Smtp-Source: ABdhPJy9Z5+imOxHIIcDiqgjNg9jXd3+pa4ZKSS1CULRFBiCdPCvddER5mvDkkpfxMDYZbYhkm40NLX4wyWCTfSVDgs=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr22448875wmg.37.1636998027427; 
 Mon, 15 Nov 2021 09:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20210920122535.269988-1-eric.auger@redhat.com>
 <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
 <CAFEAcA8tbJ3jbHghvqk3hmUOZmQEzYva2Qqbq49i4dC93bQXCA@mail.gmail.com>
 <3c241757-eea9-90ce-4c86-19391efbba7a@redhat.com>
In-Reply-To: <3c241757-eea9-90ce-4c86-19391efbba7a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 17:40:16 +0000
Message-ID: <CAFEAcA_yQZpDH2mut2ThhpqUSfO7irL3bLWSd1WtKjSQ_zQ_ow@mail.gmail.com>
Subject: Re: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 12:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/1/21 17:04, Peter Maydell wrote:
> > On Thu, 23 Sept 2021 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Mon, 20 Sept 2021 at 13:25, Eric Auger <eric.auger@redhat.com> wrote:
> >>>
> >>> The PL031 currently is not able to report guest RTC change to the QMP
> >>> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> >>> to qapi_event_send_rtc_change() when the Load Register is written. The
> >>> value which is reported corresponds to the difference between the guest
> >>> reference time and the reference time kept in softmmu/rtc.c.
> >>>
> >>> For instance adding 20s to the guest RTC value will report 20. Adding
> >>> an extra 20s to the guest RTC value will report 20 + 20 = 40.
> >>>
> >>> The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
> >>> require to compile the PL031 with specific_ss.add() to avoid
> >>> ./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
> >>> "TARGET_<ARCH>".
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >>
> >> Thanks. This looks plausible to me (well, it would ;-)) but
> >> I would appreciate review from Paolo or somebody else who
> >> understands the rtc_change feature and handling.
> >
> > Ping? Review from somebody who understands rtc_change would
> > still be nice...
>
> The change looks good to me (sorry I missed this v2).  x86 also has some
> logic in the migration post-load, that might end up sending the event.
> However, that's best done separately after understanding and documenting
> exactly what x86 is doing.

Thanks; I've applied this to target-arm.next for 6.2.

-- PMM


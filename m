Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48622575D70
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:29:13 +0200 (CEST)
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGhE-0001gp-3k
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCGeO-0007jc-4A
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:26:17 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCGeL-0001r2-Tv
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:26:15 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31bf3656517so40223817b3.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+e4JROKuz771w3kwRmCoJ57xO3bV3Zq7zUo8kQs2h4=;
 b=XyvdHgZqLVoATNkid/bYH2QAphwCFxoUsbChypsWkkVirdk0STmidtbG1r+4P9P3g7
 DXdt8NFOW8FVz1697WpLeFH28rxgs5qzlxRYAPqAyLOnZoF00hCdTeI+MIAnXZUKJeHU
 +CHHNdRC4gWAZIWpFRaHIT0HJEr0qV3RYHyUgcbresXwK2krwX0JcD7pzSg6G83Yn/8E
 IdCb0ysFcbckiMs57NMr32BehqWIV526Z7aYOMp0AlQLAHa0EwDnWwsIw+r+5JHFChfs
 FTyXlUAfK2MQ7lipd1atEYPneiEIINTgJ5jAnKvo8Z05CC9aQW7OrwpnNJTBkeFbQCoF
 aEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+e4JROKuz771w3kwRmCoJ57xO3bV3Zq7zUo8kQs2h4=;
 b=1dsuR240NMMRl5Z7uFcSnpg5ZQ3qKqTJ8yPIpnQaLEE+eOW6aSDhbKFsOg2at+oiGS
 nFgwzKuO4I+XxtT1LjcsLkASsG8Tkhb/w5T0Pnqrh+BG5LoCVDBtl+b064H59MxLcMcZ
 XYsaIprj/iULUvvu/RUQXRihmnZBHAj9D2M9vCg6K7ComceEp6aItRJJmaUOUicpOOPT
 x0/GD7B0c9jShloqnHIKCCiewUKaVnunRLcVerlzgQvUvruxEHZzHR6Fwx9iY3d6NRXJ
 GdTE0A2os9RgYjMCURU51sp88tmmhQFkt3io0JKbkMyqBKG/ZZWkkInJE676CjS6scEV
 HtKQ==
X-Gm-Message-State: AJIora9Irdx0mKtBwIqWUbvJ8L6USyVOXJYlZ2wfT+6YWaXdGrSuVSyK
 D/GmcPvlZWwkkNpQVWDwkTdBVGWP9vcUzFvn4Jkt/w==
X-Google-Smtp-Source: AGRyM1sH9RtfEHpQmisQA9e0ruXPpLmNRw3OqBiSmZorMxHcAbS0o9vRo1dmYVxC5ydDIqB1saP+40dpYWE7nw8iu/Q=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr14859270ywe.455.1657873568146; Fri, 15
 Jul 2022 01:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
 <20220714015637.817066-3-quic_mkurapat@quicinc.com>
 <CAFEAcA9MZ-yNSY0c7MiXex1U-t3XNzQRUwXiMhJg84tYVMeyiA@mail.gmail.com>
 <a285e9f6-9ae6-7abc-eedd-22ec1919ba99@quicinc.com>
In-Reply-To: <a285e9f6-9ae6-7abc-eedd-22ec1919ba99@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 09:25:28 +0100
Message-ID: <CAFEAcA9Yt1nEJU+C+H4OajKrSb8rBMLoVmfrUzR-xjc6qx8yfw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/sensor: max31785 : add fan status, tach target,
 and tach input object properties
To: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Graeme Gregory <quic_ggregory@quicinc.com>, 
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 22:14, Maheswara Kurapati
<quic_mkurapat@quicinc.com> wrote:
> On 7/14/22 8:10 AM, Peter Maydell wrote:
> > On Thu, 14 Jul 2022 at 14:04, Maheswara Kurapati
> > <quic_mkurapat@quicinc.com> wrote:
> >> This fix adds object properties for the FAN_COMMAND_1 (3Bh), STATUS_FANS_1_2 (81h),
> >> READ_FAN_SPEED_1 (90h) registers for the MAX31785 instrumentation. An additional
> >> property tach_margin_percent updates the tachs for a configured percent of
> >> FAN_COMMAND_1 value.
> >>
> >> Register                property
> >> --------------------------------------
> >> FAN_COMMAND_1 (3Bh)     fan_target
> >> STATUS_FANS_1_2 (81h)   status_fans_1_2
> >> READ_FAN_SPEED_1 (90h)  fan_input
> > This commit message is missing the rationale -- why do we need this?
> The STATUS_FANS_1_2, and READ_FAN_SPEED_1 registers are read-only. I
> added these properties to simulate the error device faults.

I'm not entirely sure what you have in mind here, but
QEMU doesn't generally simulate device error injection.

> > I am also not sure that we should be defining properties that are
> > just straight 1:1 with the device registers. Compare the way we
> > handle temperature-sensor values, where the property values are
> > defined in a generic manner (same units representation) regardless
> > of the underlying device and the device's property-set-get implementation
> > then handles converting that to and from whatever internal implementation
> > representation the device happens to use.

> I am not sure I understood your comment.  I checked hw/sensors/tmp105.c,
> in which a "temperature" property is added for the tmp_input field in
> almost the similar way what I did, except that the registers in the
> MAX31785 are in direct format.

Yes, that is my point. My impression is that you've provided
properties that directly match the register format of this
device because that's easy. I think that instead we should
consider what the properties are intended to do, and perhaps
have a standard convention for what format to use for particular
kinds of data, as we do for temperature already.

-- PMM


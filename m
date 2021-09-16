Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D129440E9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:31:06 +0200 (CEST)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwA5-0005M5-T1
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQw4Y-0002Lp-HA
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:25:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQw4S-0007YL-IU
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:25:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso8062997wmb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLQWi+VQsqU7rdfktb9GjHxd+38EFiznSEk5gl9g1lY=;
 b=kwlG+pZbxZdADWQaK6yg9yoE2SlDhOmUtspeO79sqN4iy/nrFHJJjzhlT0JZ3AG3k/
 dUSSBuYykvDCjiE6f5VALHTLppkaUSvhPJZ/aV724wFE047UtUl1zTwxOPiU440ErwUK
 KS55gvBHf6PrJLeAOKBtxXABx7k6XXf/zNbbIiS4TF+f78f0yabQuQDeu5lmcGoh/7w9
 +q92TWFaRD6Ccj9iSDKcbfz7tha/mrphOaHE6ozhjQTxrFh1eMPvw1nqW+hOV0kSBKKT
 dMhTi1Mfiy02XB/etKBbv2vFSI6w+i1SRDlQM7/ChrfUNA6oTDYsPHeRfQPvGqxgJtRZ
 49xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLQWi+VQsqU7rdfktb9GjHxd+38EFiznSEk5gl9g1lY=;
 b=nJZAZVKLFwwqX3F6dzO5XqzUn7W1LjqNbpC9rOYw8XwrMXjUahuAjRSiFXWk0FFFTk
 cU54QJBmFj1uTh3hWeV0MU+vqHkarKttym9BrGQQvHduOyzGxhVUMAYXJL0cFgj4y+1x
 oLJMmytQxMnc3hKL75U2xdL/Z0R6DBRGKMEuX9RawHRg6diUUPiNVtKI2EIaEOBn41dw
 1KRz8y8UznDkCSQSIEQ76kuoE9nWamwgAFEFKN3sOpjgAaYbbpMi/GGdidZzzd0u1UjA
 Z1cKDomZ1w1iOlXIZKOr8S78BPPiYaSSfi977OBEjJtdJdEgzBLkSe8N/e9swU9K+GFH
 ZbLA==
X-Gm-Message-State: AOAM531PcAerlGpQFmpGymrwSw6le1A/GmafuXrCkF7QWn71M30/A9rq
 EP7kBPN7JGwU3EaHPY2K9FcgFUwyJ9q/1Xj68VqafQ==
X-Google-Smtp-Source: ABdhPJwPZfteenmiBUULBLEhhOU3qlqi2rQDTapN5758TmaS5efMtYc9u7/ratrIeW1fSbp0EUfAioqwgVVPf2OLIww=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr2443441wmi.37.1631816714359; 
 Thu, 16 Sep 2021 11:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210909122402.127977-1-eric.auger@redhat.com>
 <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
 <f6aa5469-3ef4-bda1-51bd-d0eec5bf9fed@redhat.com>
In-Reply-To: <f6aa5469-3ef4-bda1-51bd-d0eec5bf9fed@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 19:24:22 +0100
Message-ID: <CAFEAcA8UQ3t+Zbo_qiM5uEEgJ3D-4OPGp4GXRPyVyWSd5x1+TA@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 18:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
> On 9/16/21 3:32 PM, Peter Maydell wrote:
> > None of the other users of qapi_event_send_rtc_change()
> > seem to have to track the baseline time like this. Shouldn't
> > this be doing something involving using qemu_ref_timedate()
> > as the baseline that it uses to figure out the change value ?
> > (The other users do this via qemu_timedate_diff() but since we
> > start with a value-in-seconds we might want to expose some other
> > API in softmmu/rtc.c.)
>
> I struggled understanding the various kinds of clocks modeled in qemu
> and the PL031 implementation. Both devices calling
> qapi_event_send_rtc_change() seem to store the base rtc in their state
> (mc146818rtc.c cmos data or spapr_rtc tas_ld(args, )) and then
> effectivelly call qemu_timedate_diff() on this base rtc value. I did not
> figure to do the equivalent with the pl031. I will further investigate
> how I can mimic their implementation though.

mc146818rtc.c calls qapi_event_send_rtc_change() in rtc_set_time().
It looks to me like that is just "when the guest writes to an
RTC register such that the guest RTC time has changed, use
qemu_timedate_diff() to find out the delta between that and what
the softmmu/rtc.c clock has as its baseline time, and then pass
that delta in seconds to qapi_event_send_rtc_change()".
This RTC has a lot of separate day/month/year registers, so the
implementation's idea of "current guest RTC setting" is a
complicated thing that it fills in into a struct tm, and which
qemu_timedate_diff() then parses back out into a "seconds" value.

spapr_rtc() is a hypercall implementation, so the guest passes it
a complete set of year/month/day/etc values all at once to set the time.

pl031 is a lot simpler as it is essentially just a count of
time in seconds, which we set up as "seconds since the Unix epoch".
But the basic principle is the same: the device contains the state
that tells you what it thinks the guest RTC value is now, and the
value we want to pass qapi_event_send_rtc_change() is the
difference between that and the reference time kept in
softmmu/rtc.c.

I think what you want is probably:

    struct tm tm;

    qemu_get_timedate(&tm, s->tick_offset);
    qapi_event_send_rtc_change(qemu_timedate_diff(&tm));

But I'm not 100% sure. I also feel like this is doing a
roundtrip from seconds to struct tm to seconds again, which
seems a bit silly (but it might matter if the rtc is configured
to 'localtime'? At any rate it's not completely clear that
it's always a no-op roundtrip).

I've cc'd Paolo who might be a bit more familiar with the rtc code
than I am.

-- PMM


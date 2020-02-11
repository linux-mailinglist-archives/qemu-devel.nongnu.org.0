Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988C1594EC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:28:27 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1YOg-0000sG-Bx
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YNm-0000K9-0X
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:27:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YNk-0000iy-3A
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:27:28 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1YNj-0000ik-VO
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:27:28 -0500
Received: by mail-oi1-x244.google.com with SMTP id q84so13375854oic.4
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 08:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVHXsm2IYBbO0NyhRrtnF1/ntngEqGjIm7d0F0XQrvk=;
 b=zgDrvETeZ98ubY0HRNgI2g9jEA8jJoX/ED4+UpFR+atEhYr56+2n8NOg6kMLgv3Rnr
 4n5nnpYPG0cXSdVX49tRS/ufUSm1llmPiSvhrGu+uhyJokufZD0gPCfLV1rN0EjA2/F+
 7ZYg5KHJTUZQRZ0I2+WAKQ1bpvITGMsZmdTRxFkJ0ruKftoWC/OF/JRQjtdOooStvflb
 Ud8hY87RyjXX16e3GoZkH/Og2IFdB+Dd5gxqGkulEj9QE01t0D1HXpJXcvPl+fr/iFhO
 6oK208vi8WL/kuS8J5phalnb6fuMwPpENxZRLIVpeOnZ+hhClUWqo83ltw1HGhGlrqKC
 Yi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVHXsm2IYBbO0NyhRrtnF1/ntngEqGjIm7d0F0XQrvk=;
 b=ZWHKtxSCDEfFxqwl5Jz0oSdLQZH4wfTH6hx9zsC6HhNHTq+0EyuCm+5zuWubhQp2KB
 PfiLJAsrnmrsT+R6B4heCtKayLdpB09ja0JIy1tEPpPr4+/HcaT2HVgjQjOdrFPZpcSW
 ujUhbWmBvRT/+IOx9ixxd1wq/+A0zIxfTsBPLSAfKvdb5hPqrEVgE0VmhOsRNGopD0ek
 zghlw/wf/EH35kpO7hEBC5r11Tu0l4Hvj3XcL6/XgHaMgS0o3TlsnLoEW0MJWsc7Kyti
 IaMts9SF8agmJOJfYERKGAc2e3np9hLLucF4KflHy01XyKIzWbnZqec9XojBebQg3llj
 MC1A==
X-Gm-Message-State: APjAAAWbX5M20sCqeo/tXxHwtfs+DVmS8/NDjMkLK/eQTMowDclMYqOG
 m/Pp+6tkgU0IXGXBJTPwQCOo8h5v5IlAiLL4AkuJ4w==
X-Google-Smtp-Source: APXvYqxxECM3fLexhrufeAZhTAqwZXYeTdHgsZFsgc6CnwRsYHiLW7ZwJQkutazw5wzjwg+heCPClWtjmUZZrlaigT8=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3432708oid.98.1581438447073;
 Tue, 11 Feb 2020 08:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-6-eric.auger@redhat.com>
In-Reply-To: <20200130112510.15154-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 16:27:16 +0000
Message-ID: <CAFEAcA9Yc9dKTCcP3fP93tQU62Q=2FYOoYGvUqfiOMY=pYV_RA@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 5/9] arm: pmu: Basic event counter Tests
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Andre Przywara <andre.przywara@arm.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jan 2020 at 11:26, Eric Auger <eric.auger@redhat.com> wrote:
>
> Adds the following tests:
> - event-counter-config: test event counter configuration
> - basic-event-count:
>   - programs counters #0 and #1 to count 2 required events
>   (resp. CPU_CYCLES and INST_RETIRED). Counter #0 is preset
>   to a value close enough to the 32b
>   overflow limit so that we check the overflow bit is set
>   after the execution of the asm loop.
> - mem-access: counts MEM_ACCESS event on counters #0 and #1
>   with and without 32-bit overflow.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> +static bool satisfy_prerequisites(uint32_t *events, unsigned int nb_events)
> +{
> +       int i;
> +
> +       if (pmu.nb_implemented_counters < nb_events) {
> +               report_skip("Skip test as number of counters is too small (%d)",
> +                           pmu.nb_implemented_counters);
> +               return false;
> +       }
> +
> +       for (i = 0; i < nb_events; i++) {
> +               if (!is_event_supported(events[i], false)) {
> +                       report_skip("Skip test as event %d is not supported",
> +                                   events[i]);

Event numbers are given in hex in the Arm ARM and also
specified in hex in your test source code. I think it
would be more helpful if the message here used "0x%x", to
save the reader having to do the decimal-to-hex conversion
to find the event in the spec or the test case.

thanks
-- PMM


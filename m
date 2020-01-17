Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4F2140FA2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 18:07:18 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isV5Z-0000dQ-71
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 12:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isV3h-0007C3-4M
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isV3f-0004xQ-Vk
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isV3f-0004wg-RK
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id h9so23064168otj.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkcEsRCXBCVuA0A+wxOuzUf6iDH2mmgP/Rgq98b4r1Q=;
 b=bk80x+5L+S5AnFe9ICJexaR762FVqyvywA3Y0mKwvd/qoNOLPeDNjjz88Va9NZuauk
 IbpjC8HR3L9Zt4lafc2fOqhCjBnhjooIm7R2SKCVWvQ2ChPc5Qe1AzSlYeflIZBvS+uI
 qdostKmXJuCJo+u5Afzj4RpRIJS5LagA+OO50GWoJV7lZp3libMVAH0yUoMx5Jc7AN/q
 GQc4RA97YaUOgblhMVSzIlYbr3AbmQxz6aMZ+7RVyhLTAfv8FU4sHHajZmMQTAC/6I7v
 04+lk1GWyeOwbz7whaPX6xRg5DJBnJFTxo45VlE1g5PlCqr41fYVb78m1JDlU0pTF5Lb
 yFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkcEsRCXBCVuA0A+wxOuzUf6iDH2mmgP/Rgq98b4r1Q=;
 b=plGA2z++NviDVgOcm543AysZo5RKS0bQ/yEq2uU+Ua9x8qDfrQ8Op42Unf92x9rRaJ
 4Z1FpZDVDqpDGcfdvVyx/T/a73KxrXnZPK6BDg9tEEHD6bNLuY3zkPOTtldssvaDxHwe
 1PPOFXqBAfNJwbcKZ9rml/wmAJ0y2hanfqcknqrzlfThxFyhogyHxhx3KK4HVuiVRSoE
 2xKmJmjcl72AcB+Uh5u/ZSVuneuv+2+Qi+rkBDMgs1JAXu0Uw0+JlOo4MqQC1eMTV5UG
 PwVJZw3ae2Jf5hvOVuByQg/0Vj2lWk3+xl5bciCF6qgx0b3E99nhrSmlr9RIvC1hv4Hl
 G9+A==
X-Gm-Message-State: APjAAAUzFBUMhCbQj/wEO206cwclBCbEAyTq+rOsKp6pAct7Qu7z0VoX
 XHKRbNhqqGAq9zagNrhDHj/tiVbY24//aCQggcjsVQ==
X-Google-Smtp-Source: APXvYqy1cSPSdZ0G65UJ94/FrbxdcC0YNIf70iXuKuB6kHDRfy9I+V/q68c3cJpjr7dTjjLxVe2AErjlWwP8WT7LroE=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr6448812otq.97.1579280718778; 
 Fri, 17 Jan 2020 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-2-linux@roeck-us.net>
 <CAFEAcA_k8xdzmsgMK+m6wSgnBN53UjCNU4nTBx=hnHnHz+Su6g@mail.gmail.com>
 <20200117164625.GA27197@roeck-us.net>
In-Reply-To: <20200117164625.GA27197@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 17:05:07 +0000
Message-ID: <CAFEAcA9dvOQpPxkjG4XqYiMXbVsZ1VMCZWEWegeTu-GNW0Znaw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jan 2020 at 16:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jan 17, 2020 at 01:23:46PM +0000, Peter Maydell wrote:
> > Won't this now do all the work of constructing the hexdump strings,
> > even if tracing is disabled ?
> >
> That is correct. Can I check
>         if (trace_event_get_state(TRACE_PL330_HEXDUMP) &&
>             qemu_loglevel_mask(LOG_TRACE)) {
> directly in pl330_hexdump(), or is there some other means to handle
> this kind of situation ?

It's not something I've had to do before.
docs/devel/tracing.txt says "just use the TRACE_FOO_ENABLED
macro", but looking at what it does that doesn't seem to check
the runtime state of the trace event, so maybe those docs are out
of date. Stefan, what's the current best way to guard expensive
computations used only for trace output ?

thanks
-- PMM


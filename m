Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB330F01F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:05:14 +0100 (CET)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bVh-0008Qk-IN
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bPT-0002YA-RF
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:58:47 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bPQ-0008WB-GM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:58:46 -0500
Received: by mail-ej1-x62b.google.com with SMTP id bl23so4301791ejb.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDMQTjX5hIj7OGELKHuMpw7yuO+EJIADPkyuUG3Ijj4=;
 b=VGdSOdY+D6RmXoOtlNDyqSyuStreGPMa4oZUqG+fWpC4/52xROWNR63LYaI3vqRBYm
 2gnqMHVTZq8+vOlZUgPdHeRxTsr3gB6TWLXZRPAzB1cFgLqKWoik1CfUQWpNPNZK/6bv
 5bSDinR0fJ09/Gjb2TiodgeXdel7HvfxOkLMENfWWPMRRimhkTUnjSOT0VIv1M8SLHzx
 TnyG4AQTinmM5EAN/WPklAs0bonKY5v6n6zQ2alqJw+cEPO+k7sWl9iPCOfBBYXNwbDy
 tRDBANFI1m8qzWgM64ceOD877BTcazUrPtv2eAO3yo3GcJV75qMd30dqhlXHpgQA7vuB
 UEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDMQTjX5hIj7OGELKHuMpw7yuO+EJIADPkyuUG3Ijj4=;
 b=oU1P7f6yKXD/Sl40OetbVzxsa7ulcjyi7c+00x9bkGPJ3RaVEDOliht9oaRRflOf/b
 nlUyiaJPaGvhxxXN/OIMvctDMDPVZkCAJ4GsYbfDtaBlrN/C4XBYOkSbRjl/2YeNQHaD
 5/O65W/iKn3z2R13nKbJX7iov1KwHAfeAqtcilzpmUi8WqI9OMhHBplEep/MSWX/a4HX
 iTK3ax+5CPP83LaYgG6VWn1OkcYYeCdV1o8VTt2S4lPmSGxSmt3KVmWPV6ki3YwwlWls
 cJ6MeCNQg0slsGEZH+GmV2jxV7rk4dmNWR2vbsYEERytZK79TGV0wQzBaTdlfZX3BT9W
 IIgQ==
X-Gm-Message-State: AOAM531KY7n55UZ3NlRVOpdH/+sb5u8e+Eim7bChyoURmiULK/4510Td
 C1hF5pADHalS8DFVWVrj4r90PLPfBsEGNsymcxcCug==
X-Google-Smtp-Source: ABdhPJyFZEcaWolsVX3KYx4NcAVB9iPomhIhBvGFsuL53WU4iWQ54ZpEQL8cNcNPOOukTM6wnyBHpgHXdjwEbjfjrzo=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr7394701ejt.56.1612432722582; 
 Thu, 04 Feb 2021 01:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20210204014509.882821-1-richard.henderson@linaro.org>
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 09:58:30 +0000
Message-ID: <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/93] TCI fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 01:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Almost 7 years ago I detailed 5 major problems in tci[1], of
> which three still remain:
>
>   * Unaligned accesses to the bytecode stream, which means
>     that we immediately SIGBUS on any host requiring alignment.
>   * Non-portable calls to helper functions.
>   * Full of useless ifdefs and TODOs.
>
> To my mind, this means the code is unmaintained, despite what it
> says in MAINTAINERS.  Thus tci *should* be simply removed.
> However, every time removal is suggested, someone comes out of the
> woodwork and says we should keep it, because it's useful for $FOO.

Not listed, but also a problem:
 * it's a configure-time choice, not a runtime choice

(Personally I'm on the "we should just remove it" side.)

thanks
-- PMM


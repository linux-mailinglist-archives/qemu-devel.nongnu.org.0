Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3532B9B0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:08:37 +0100 (CET)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVvI-0003iD-G8
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVtp-0002c0-MO
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:07:05 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVtn-00048b-Az
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:07:05 -0500
Received: by mail-ej1-x634.google.com with SMTP id lr13so43975349ejb.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eMACN5yRfbLSuOyxb0PX8KlL9UJOfHAZvGi1RWpi124=;
 b=rBRoieBjuzmUoI+Sv7GP9HBNxHIuHNETdd53xQnL4kayOfSLGhAWvTwE+8ih5LomtX
 R5MDgShpM5VFJ5dOE9Bt3loA+vYqZm4vITmFLyeVuxYE6NrxAO6BJrQNTB9Y3YH6kIFc
 TPPnNpe+3sMAQQBT92NKiwmHKjpSDhm7cG7dHOi6oZ9leKa6UF8bQ9JC7Qa+PIMDn0b3
 /YwYha4UTJzs/r7iNt/IdmTbOBpSsFrdxRwAYLa4993oGtxfaPWYs2VwZl6SbLTRtn1Z
 L+AotTUl/vgboMm/i5GxeN5rTedE7vnl4RUwDugFMaX+jQvyjgxsktNSpXlVMhMpnliq
 tg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMACN5yRfbLSuOyxb0PX8KlL9UJOfHAZvGi1RWpi124=;
 b=WUmex7vo4hd3woDbOYCmgE9TJRsY9DXfkENA2qtZ3w9TzmnTc1zc8p1knoULm4cvhB
 PMOU86VgEDlpqejpVikXU36xyx57hYB5hiLRMZ/i/SLOWG8tdF4qojNQ8OzBTEiiFl63
 RJ/4b7hYDghEr4uLtpEb9rZD0hj/+oRqWp8mvR1uIkzZN4vx1G/I7OcNPSol5MofNDOw
 XKV9GPe9orj8sC5KYS5un7pzV21lSdoGYr+J/nAvaCUUs1V37J69Kn4Hvp+U7CsrOsDn
 o7psDKqpIIIt2W0yEbA/ZN2V11zd4TZic4fMNekd/MYVLUDqAyQauQjvsjo65qWz9ru6
 xclg==
X-Gm-Message-State: AOAM531ZvOyhbkkJpifZ0rm7u7G8V+/KfPVVYwAcMFN8A8GnZhDQXVEt
 bYDySC+Rw0v+5sWZu1xxY3UboDa/Gfc12A2X87KOGQ==
X-Google-Smtp-Source: ABdhPJwySVrvCYLo2PvYEIvZ2B5iw3WlcRHmDC7+40QIHjmPDsWaUkQRUjp4GxBWtdzNOpRgAkW35rpQvGcoPXmSVIk=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr81051ejc.250.1614794821376; 
 Wed, 03 Mar 2021 10:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
In-Reply-To: <20210303174849.GF1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Mar 2021 18:06:46 +0000
Message-ID: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> It would be good if we could get 6.0 closer to SBSA compliance.

How far away are we at the moment ?

> Would it be worth the effort to make this controllable per cpu model?

I don't have a strong opinion on whether we should, but if we do then the
right way to implement that would be to have the PMCR reset value
as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
it is; and then instead of using a PMCR_NUM_COUNTERS value,
extract the PMCR.N field when needed. The hardest part would be
going through all the CPU TRMs to find out the correct reset value.

thanks
-- PMM


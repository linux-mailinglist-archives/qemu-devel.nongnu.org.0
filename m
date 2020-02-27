Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E4171634
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:44:17 +0100 (CET)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HaS-0007hk-IN
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HZH-00077d-Nh
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:43:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HZG-00071v-Rr
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:43:03 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41292)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7HZG-00070n-Ni
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:43:02 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so2951320oie.8
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDQXq5mNOcrVK4bwnf5a0Ln+d/mxjFiHOcdUAdXS/So=;
 b=pb3DQ6TcGYMDaaNWIsaHGt9+u1bjz03+IxGtV47MrVaXxvhNPxj+wYORI2o2JsYIM/
 +NU90cGeflKBVA06t7C84KE/NkDzibiZlAmNPynN/42HRd27bPObpSo3B9EhDm3d9I9H
 Afd7W0hJvdpB9Fk3w02OA5conbR9tywqs27/YJwrLzABqHNmrH01jO4xuMcwPPZVs+Y/
 FyJWAKtl6Km/FdMji2NhNfd3G3FdbfLAvJ2aUZbZs10/FiZqO2fL+RAMFkuliR6x2nQn
 ow7VCgQZ6+Im9Tz073c7eOITPFX7vMG5n6MAHQ23abBigJ/hZ5yL+ceGxtSjgA1x9Pvh
 feCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDQXq5mNOcrVK4bwnf5a0Ln+d/mxjFiHOcdUAdXS/So=;
 b=Fdrm5NNRitA10T/oBNQuQC3qoJJ5S4/NBLJyFJOBafKyGP0HUNr80oGMCoYJfUjjH9
 f74CSUKv6uR3QT9gKPAq/FGLx4fEE/JbepwDRXd+hnYOWydlmNTAdsYElgCpWHEcvNTq
 GbUDUav/tXTbkGG1uG22J1dkxpvSea0N4M7u1grfSXkeKChLibmzjvNOBl5gTqRxg33b
 tLa0DmjgeGOradO+cHCaXf/ew2OwcPrH1/F7c1Xv3Org26GydkiLLYmvIMbaBj3wqXgW
 EWAGzutNu7v4vyP4elypyqr7sdBfhRtCxqWl/+XraTYdC5B65iEOj3ymMqmsFUr7DQd8
 V7vA==
X-Gm-Message-State: APjAAAWw0tM7/eHbzJA/1MGbaH78wk59LFwhT9wuMR88WzfVMxY/AkOd
 kqTkWWrFHGTT3JyQFQbVWZkOCQPzYa5inpP75UKFlw==
X-Google-Smtp-Source: APXvYqza9jTlxLvinDfFczq+DzARYHZUs2+F8ppJz27D1VYrSl1nclN95OxJGOAzW2cQ9SNtawJurMBVjYZUH7NTVDc=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr2973838oid.98.1582803781707;
 Thu, 27 Feb 2020 03:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-8-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-8-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:42:50 +0000
Message-ID: <CAFEAcA_ttkZEUToYaiRaMmQedR_KXCbwOAim5CjP8V9bGDJaXA@mail.gmail.com>
Subject: Re: [PATCH 07/18] qemu-doc: move system requirements chapter inside
 PC section
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The system requirements documented in this chapter are limited to x86 KVM targets.
> Clean them up and move them to the target section.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


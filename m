Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75906151B57
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 14:34:04 +0100 (CET)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyyL5-0003Jv-HX
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 08:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iyyHo-0001f2-9N
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iyyHm-0004cM-Lo
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:30:39 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iyyHm-0004ZM-Dz
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 08:30:38 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so17073084oty.6
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 05:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BTSfrsUNEBJk2EqEMhpZREPGvyWniL0Rs1TCWekFFMU=;
 b=FiUtggBEPB1jnARjh4tLEBgVI3JdTUlQo07AQP4Yq/7eNtAoY4WUaW0h2Sog+Km5mV
 ysuHYpTmK7iGxPym3Gt7M8p9JEzLeMj/GUjSgzl87sttC3XX/H2fz/7Jji5RTGVORoLR
 dKlEAP8cpZ0/T1o0Wnlv8QKHC/z5WKNtBAyshtAvJbA3QiusXXl1/pNtazOe5K8iuhXR
 PQMX8yzG7x2ti+4kDRkJWN/FERdtCknsmb7GwxEGNhVND/LK/gHKhiRj2pSSE2QMcBkM
 2sPSug9bdWpv8QeAyNl6TAre5laJwB9mR6WPvotpET5czqxHTMgpkc+K6cPuGeFvZenY
 RMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BTSfrsUNEBJk2EqEMhpZREPGvyWniL0Rs1TCWekFFMU=;
 b=uboDWZRBXgwuhspKyp0PDAmyWlwE71yqRVdiuM1naZbrYVG5sYRHogJ7O+kil7Ahht
 yO28AkYXwr/onuQR88J44l1xelnuK7VuPKB8/Z/MRwhCee9PeF8jln/arzW+xmbZVSTM
 nIsL9Yl2fBDs4qp+6hgdsnpr4F+H7XCJJsyUdap2/N3GricUmrBneWl8xatye7dd7hCm
 VkhlcuZ7Gw5BX10mcm4j0In9AfQ3iABWzKZEyqnO6t045BjL3Krg8t/THuDI8QImrRpK
 +b5LDsVa+o9Yx89dThyHiB0cS5fEE2DuxyTziAg3o1Qrd28BJsBDWE39FKGkLTjeqOGh
 WP7A==
X-Gm-Message-State: APjAAAW4qMBGbuAZ20dyMPfb+RIL1+CkkBmHVqauNBRKxnVoMSTrGpo9
 f7ShGS8QJPs6kno8NlYOcSSpAu8rKDNMfjVn7w/VY8Qz
X-Google-Smtp-Source: APXvYqzt2xRcm3DkIbblNg95dNNR1BI/UOezicUZpd1Ntl71VBRYsNoLoHSBoSTPNNlW8Aq1yUbOKekNeY/KmF+RGHU=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr21331101otq.221.1580823037088; 
 Tue, 04 Feb 2020 05:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20200201172252.6605-1-peter.maydell@linaro.org>
In-Reply-To: <20200201172252.6605-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2020 13:30:26 +0000
Message-ID: <CAFEAcA_cfJ9uuAa1G7peX4iFxxkjzZ08VQ=Rgx_z0=f1NiNHew@mail.gmail.com>
Subject: Re: [PATCH] Remove support for CLOCK_MONOTONIC not being defined
To: QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Feb 2020 at 17:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> I've left in the runtime-check in init_get_clock(), as it's
> less easy to see if the fallback there is ever used.

That code was first added in 1dce7c3c2244 in 2006, so
it seems at least plausible that we could remove the
runtime-check too at some point. Somebody would need
to go through all our supported hosts and check that
CLOCK_MONOTONIC really did always work rather
than returning 0...

thanks
-- PMM


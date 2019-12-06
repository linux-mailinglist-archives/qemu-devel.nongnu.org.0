Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC511533E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:36:19 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEiQ-0005C8-0K
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idENH-0008Hw-JG
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idENG-000817-8w
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:14:27 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43647)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idENG-0007zk-3t
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:14:26 -0500
Received: by mail-ot1-x344.google.com with SMTP id p8so5866322oth.10
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LO5z31Aslt4xwCTN2K1EOa0J7UYOFLN9b9EVAjdbZyo=;
 b=htwqQtGsCC5F7A1TS7Swo1yzcp2dAP5YtTRIAJ1y0q1ZiAQDnJuaIvj4wezJdzs42G
 N5zPc6dL49p0KdSvSd39qkwWu7pZzPIDVOgapMghzTlrS+Vt3j7Y5ggSGAcsqxenN/7K
 cI2LGzFsACsCxFNaW337CT1kriUoB6Tozwi2xMGPHN5Ijfozl8INvIIZPHtLMLy5tuil
 +uDFD7VhczWmHievZ9aN9/aN81GovYWynLtcIclLvj/SiPe7rSz0wchbFrXpt9udy2g7
 TmvKU+syoS4SAmsIkchUPsg8c3eZcVuNWx3LOUo8YuhhCgmDHf10eIz3hwsuEJE4aPIr
 Evew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LO5z31Aslt4xwCTN2K1EOa0J7UYOFLN9b9EVAjdbZyo=;
 b=nbOvNYqngPmRR/oIpnggwY1Qkwf+qCusi3p7nzTDPIh4fgXYEQsNIR4XkD8gfx/qmu
 CSxNaP5b+ERw+SExmbK2HY06u9UubLnhMSiPGwHcbu2mFUaQMPaGFTGX7xfI8Uwbt593
 HOzRdSphoSU6X8SN0t3K3P7soVbxN4juxdJExGsUijPH9kx58XMp5xL70PqkjNPIDMyk
 htlU2t2TWStQnl1/qhJqniJsk11x9PJOx/+Sx87NLqMERmvYxr19HA/48VEL3Ql7wHMm
 qaFq/YqL7iSecaWoO2GJCKUdToTuy3J6boPANiODCqjiB8v+BIcuv2XE6CZUtmKDSFXP
 eyXA==
X-Gm-Message-State: APjAAAWtOCi3YREWg9ls6oYFcaW2BqRNdV3TWjYlKjQWZoO7MYT2sYCn
 00oWp1H1DIa2YkjVS751uWeCWQ3HPQkisxotjXTQD2v7
X-Google-Smtp-Source: APXvYqwLWslbhimYoA1wLFGCeWIpb147E/+UWK/Zn3tIyISX23P1R145jgfsuwJZMDAhYGbHQelGQFx3oB0qUTQp81Y=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr9750873otp.97.1575631115276; 
 Fri, 06 Dec 2019 03:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20191206012529.81012-1-aik@ozlabs.ru>
In-Reply-To: <20191206012529.81012-1-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 11:18:24 +0000
Message-ID: <CAFEAcA9kTPwW_EY3CFDzhyy+ai=o0FFjjmGoY6YTHVHMQXHHRg@mail.gmail.com>
Subject: Re: [GIT PULL for qemu-pseries] pseries: Update SLOF firmware image
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Dec 2019 at 01:26, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> *** Note: this is not for master, this is for pseries

The way to say this in a way that works with my filters for
handling pullrequests is to say "not for master" and
have the subject tag be "[PULL SUBSYSTEM name-of-subsystem]"
(see https://wiki.qemu.org/Contribute/SubmitAPullRequest
last item).

It's not a big deal, but if you use the right magic words
my email filters can skip pull requests not targeted at
master.

thanks
-- PMM


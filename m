Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51365489DE5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:53:20 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xv4-0007Tv-VH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6xrs-0005xI-GP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:50:01 -0500
Received: from [2a00:1450:4864:20::434] (port=45884
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6xre-00051G-JF
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:50:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id q8so27842728wra.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euHbAAinz4RlZSSUDYBA/qOku4s6bSvqBokGvI9rF9Q=;
 b=AsX3ARSa081XOHsrGu+qHf39ADJFBVb/A2hJ1Wl3611W7jTmXvVKi2HaJ646c55v21
 rFw2eesaa32N6OuScOjCo10ABAVOTgjGZs8PJdmBxjiwFEOrXbfpJRy54/e6Nkwc5rVK
 0CFFG+HV4hrSshQBE8p2pZ+b1o8PDpFlCdfgqZyanKeKPeia7pWiUc/SNXa+tA0PZbNn
 aBdH5CJOcT6hVM56htPy47LMLZfydrtvTXskvkZov3fRuHGktYYPEtHsmgY4YsgiZm3I
 t9qP+JUyBhzvwQ3JYu3KpTAncAukzwdc9WPpx2h+zhOsTcGoFfTeV2Vvx44MRvXoIH3U
 8u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euHbAAinz4RlZSSUDYBA/qOku4s6bSvqBokGvI9rF9Q=;
 b=Tqu/VtpOOcTbz2j0E1YxDFrDI+Lh/qBmgdC7jOQ7Ootc/HhDWFC1nKjfpctrD9PRAx
 UN3yhovzHTW9YniD224fZATT7U2c2t/NLysyG0EsEUjHV8+pjIWD+Q7zxiH2AX9jCwQO
 OPCeBz4FDJDDGXQV+AnZYFUNdWrDNcF63XdAr47Rr1t8nxzk0vMYuyzjNrUOWYBeJKgw
 AiXgk43Vq5eRUMN26O78W8Wlnk0er4J6ym6VhpyJgsyaj0hdTzONEkGy7uPvGBTcpH/9
 Y6Dj4ZrFIBumAstkhD0xaBfqvJrlLO++ZVGXXQa9uRyh9zahPg0iA41Jik8f7aivAiP6
 n3LQ==
X-Gm-Message-State: AOAM5319/0gEGIL6PkASr+mkuvjY/Fporo0Dm3aupVqgHAGlmreAC+74
 CDxI/xEC4eh5nZ3YLvkZfVxF0Lvc2C56yXMIzB0Gog==
X-Google-Smtp-Source: ABdhPJwD5dFm4SkzCDgdbIRKf2BFSUF9ef54E7pEebe4uasySQcAPrJ6HaIFdWzSf2P0AATC1R/iRKuhvYGyVKmT0kI=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr429507wru.172.1641833384781;
 Mon, 10 Jan 2022 08:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
In-Reply-To: <20220110034000.20221-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 16:49:33 +0000
Message-ID: <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:
>
>   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 5136cc6d3b8b74f4fa572f0874656947a401330e:
>
>   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

Fails to build on OSX Catalina:

../../net/vmnet-common.m:165:10: error: use of undeclared identifier
'VMNET_SHARING_SERVICE_BUSY'
    case VMNET_SHARING_SERVICE_BUSY:
         ^

This constant only got added in macOS 11.0. I guess that technically
our supported-platforms policy only requires us to support 11 (Big Sur)
and 12 (Monterey) at this point, but it would be nice to still be able
to build on Catalina (10.15).

(Personally I would like Catalina still to work at least for a little
while, because my x86 Mac is old enough that it is not supported by
Big Sur. I'll have to dump it once Apple stops doing security support
for Catalina, but they haven't done that quite yet.)

-- PMM


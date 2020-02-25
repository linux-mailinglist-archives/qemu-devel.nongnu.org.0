Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05816C2A1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:44:14 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aVR-0000Tu-Vc
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zdi-0007ow-CL
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zdh-0007nC-8A
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:48:42 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41938)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Zdh-0007mv-2m
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:48:41 -0500
Received: by mail-oi1-x241.google.com with SMTP id i1so12406077oie.8
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cH4yIJ3LDfBR7fon/qGvvy8vo1wHfnVaZXHIRFCxNXA=;
 b=xSvSpg4Tg6ciFLCOH6JWSouW85Kbzey2YaAwFNKUZC0csji6a79pk6Zu5dIut5diZW
 FCkSTBVZ30qbI8IE8iufcreQ7ilw+NvydTg9kzg1XB9m+qkHwCWI6oeKDpeML3av54BF
 63knxb6CEg3Qri5zIdOGL9M/O4mTp1pQ6ravT0yxxx6UCZvMjhcYMGt8pBSqUiUXnoO+
 7CR1NDDDA7WxdE3gW19IpFOa2bN0oYALsDN3JQTtCbEZBG5OEcfgwupaHRl7ZT/58EzE
 srTOja15x7xrUN1RPU/XYIItZL9eXo5pPuZBCkPX3aG3nKknNLGa8XHzq+KQcUnffrTc
 irmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cH4yIJ3LDfBR7fon/qGvvy8vo1wHfnVaZXHIRFCxNXA=;
 b=L5ot/GzaEEk7jU2O33PQ2JVAIl7cKZE7SbeGQYTqPe1acNGUCcvyfXLEok87SmmQnp
 v5sjvGQUpwdgJ/pd6bosNR6kxCZ+agYXymbd6Tday18+jywp5x+5KOmUODFIF9de6V8U
 AuG6ChhyHHuoFM5919h1C0PWAQqmXZoi4vT4On4eTgNmHnt33KWoicuFomFUmK9Yvrs3
 oIpOifSqA1WI5B2KglCiJdA+nA17e6Y1Sb758N/SgKYBXAbn8WDbqPBOAomswoVWVHax
 58l5PwXf0FJK8XU8iWFjSplZN7eUqBxZqvVxZgZDZAyOd9H11/VoTvZHGUrn+wx3SXic
 oy8w==
X-Gm-Message-State: APjAAAX74O1br4Xz+PlvEC8Bkn/deARcB75EX+OjyXx7CBNcnLGdbCfF
 3DYJkZdpti52oDKRizGOvBuEmMWQCQioeViLa9Zi4w==
X-Google-Smtp-Source: APXvYqxqnT/1QruLWWb49E9JgPEdq4f1TTUhYoKlSNWCAvMRjjKP1fX6ifWEfvLU/PUg8fuVS9c8wlcsHE9T7ZwjrTY=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3265260oie.146.1582634920399; 
 Tue, 25 Feb 2020 04:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20200223233033.15371-1-f4bug@amsat.org>
In-Reply-To: <20200223233033.15371-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 12:48:28 +0000
Message-ID: <CAFEAcA9VF6LXeOPW+7jUpv_AFHdB46ZaJas4hcNt8KVfEwabAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/integratorcp: Map Audio controller and
 parallel flash
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 23 Feb 2020 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> While looking whether Thomas's test patch [*] requires a respin
> or not, I noticed we could complete the integrator model.
> Thomas patch still applies properly ;)
>
> Since v1:
> - Added uncommitted Kconfig
> - Use hobbyist git-identity
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675828.html
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/integratorcp: Map the audio codec controller
>   hw/arm/integratorcp: Map a CFI parallel flash

I've left comments on patch 2, and taken patch 1 into
target-arm.next.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE3AE761
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:55:58 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7csP-0007qJ-FO
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7crA-00070p-Dt
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7cr8-0001aY-6L
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:54:40 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7cr7-0001Zx-Tu
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:54:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id g25so16334057otl.0
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3KUIhipbw4JLJjzavMMRLejWYR6w3JccLxGFUIRtdYg=;
 b=hgEwf8VhoUdUC2YiGxLaGKktNut28jA0amyUkQS9tukeEdDm3n0TW20C/C+2Urt5vg
 WGDnBXSZFW4T0bQE7u26gLYzqRb/A/Of+BTCNW2PLoebt05p1HgQbFO1b6oYImzdDxta
 vSMs1fUSCkGfWGZN4eLBAg9RHpDxoIqa0hyPM8uWpK+6W6YvQW/lfIAYQahaM8WyE/UN
 KqIRodzAZIlnNWE/ysNBsPRxpQKeTKroSAbfBFqw44oM4OrDd8LbipnMko/hsPRpqikA
 0/IZeAPhDV4u8wGJeQWiPMKTEmQ0ME48jZXcp/nWUxpb7j7VKd0yWCJ84842RDE8pPc9
 DffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3KUIhipbw4JLJjzavMMRLejWYR6w3JccLxGFUIRtdYg=;
 b=YoaypaJQQ7YWPsub6YY1LBxVmdLzlhSaPl5CB+PSHHR8uRfo9jBQNDJgDJxoTZWcIn
 SUhMVT/wwSWf31twE+uh0y693Z0GqX55Z9r3Z0EkzUuSlBNcYG9sXp/XpBg54fiTV2bu
 fxbZff7UjlBYQX97qzfz/r/pchQpVHrBvCjqAlDjqFtukX//53O9ILg7zyJc0zfnnix4
 giekGs6hBnvTXRkadBwVXkIctVqtciu20gSOpngh19aGDO7Dr/KljQ229Bj5/mtsfTBg
 p0zZ8ksCIaNNVgeowDCXSfPLIMP98hO3eyA4qzVw2A8Waxfd/H8t/dkNCwqleGFKVB2Z
 AYaw==
X-Gm-Message-State: APjAAAVo34yTEduRwmUceb0gvOqoK6L8MLxHo1xqFosQYHE1TV1Pb3gh
 RM4ft8EuNBahq9MPQ9kMTPEtRUrPT8uzKgAcJ7gLvg==
X-Google-Smtp-Source: APXvYqwXXaYQfvUdTGMl4rxBBLdAv4guxWEjJpoEYCkc0RR0+0FkObRt1x6tgjcP191cfT1a4ISk3X/9wgBUI5XTNwU=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr1864471oti.135.1568109276731; 
 Tue, 10 Sep 2019 02:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190910090821.28327-1-sgarzare@redhat.com>
 <87mufc1nvd.fsf@linaro.org>
In-Reply-To: <87mufc1nvd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2019 10:54:25 +0100
Message-ID: <CAFEAcA9GMtuDCZVLFECnT0uF377_T0T_-Bn_9-RvC-zHRihqSA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH] elf-ops.h: fix int overflow in load_elf()
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Sep 2019 at 10:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Seem sensible enough (although gah, I hate these glue bits). Would the
> large amount of goto fail logic be something that could be cleaned up
> with the automatic cleanup functions we recently mentioned in
> CODING_STYLE.rst?

Probably not, because one bit of cleanup we *should* be doing
in the fail-exit codepaths but currently don't is to delete
any rom blobs we created for earlier segments in the ELF file
before we gave up, so we need to have an error-exit path anyway...

thanks
-- PMM


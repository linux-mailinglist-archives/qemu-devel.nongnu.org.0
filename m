Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B364E105263
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 13:48:35 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXlsu-0004RY-6j
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 07:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXlqX-0003hU-VM
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXlqW-0001G8-GN
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:46:05 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:45153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXlqW-0001Fm-9s
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:46:04 -0500
Received: by mail-oi1-x22a.google.com with SMTP id 14so2995986oir.12
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AgIB2UpGtxUtL2nVPOrXLydeMgSWh3hfXdGPNphFhDc=;
 b=fyOCEs4sW0NaHNf5oS+axAd1GtRbOhML5kZ4PnSDsN+RSBbQKfmNr9nyIxxmVlXB0I
 5ead9W7sc0Vt+y/ynkpk9N6t1XnxXyDrovl2Ymovhs7v8MhOiubvwvM735h0ceIUG7u6
 QCND/WP5LjcWvGSZtEuie2+KSZGKTHUmpM4jvrT2cQ7BQq6duq4O3nkUBuoig1lcKiBe
 c7MvPKpGdld1fQ52byppcZcmk423tZgiwOccTMPy0kmhoicRBDj4Buw6aN7mhzY7kpgn
 qko5zQkz++vljYZDRjEsQTPHJ5GolRGpWw8rojekk/CSoeWSk62lR/ZkgwO6weOOE5hU
 GKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AgIB2UpGtxUtL2nVPOrXLydeMgSWh3hfXdGPNphFhDc=;
 b=pHIx7fuYQLvefw+oFmKsSZcpylMr3yf7V0NM24jlA9P3EuXzw+OVmHHSrI25iKlARx
 qUxWL9IyfNZV0iYdTiH797H37EnZ3irbhJvESHzvQ4xk3U9SAI32IUSu5tCuZP0LDedU
 VUHwbMkk58eyKdbREen/f6GqhAQuQgj3WdcfR9F57FnhcEnt2t+5/yYBbsN2Bx+5MQjS
 ElHVJdRnG4nEx/faPD62T59fErrrI5kjuPuKN1gHq134GNWJrVVcmoJEn/czOvP5WOLv
 By/BQzbyP5c1ZNTQWNG77cKydaNmVtNuCRS4zpuTHuoRHzroksJ0+gOERmUNCjwVGSKE
 1ynQ==
X-Gm-Message-State: APjAAAV8ikmPpY8U/yLHI0gTQZkhngfOT3DMPt1mxfzo28J9PlXozby7
 /IurWDsyxS1drSPnuXMwT+b/6lG0q4NXSILjCBFU4w==
X-Google-Smtp-Source: APXvYqwniV0gM2Rrp9dLcPXuJ9BsPJxGFesvS+4sQRgXu0lThqgyl6ZiLumwkjFLuHRQLatf+OmUNJtmoHRoFit9zrs=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr7174999oig.48.1574340363446; 
 Thu, 21 Nov 2019 04:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20191120105801.2735-1-alex.bennee@linaro.org>
In-Reply-To: <20191120105801.2735-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 12:45:52 +0000
Message-ID: <CAFEAcA8USj1LGmys3G3bLe6Pak3ibh5tmBtjZ1gQAXyT4Rukmg@mail.gmail.com>
Subject: Re: [PULL for rc3 0/5] a few doc and testing tweaks
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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

On Wed, 20 Nov 2019 at 10:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 39e2821077e6dcf788b7c2a9ef50970ec79954=
37:
>
>   Update version for v4.2.0-rc2 release (2019-11-19 19:34:10 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-rc3-testing-and-tcg-20111=
9-1
>
> for you to fetch changes up to 22c30b2d20e828edadbd992c1d4c4bfd0f3433ba:
>
>   tests/tcg: modify multiarch tests to work with clang (2019-11-20 10:53:=
31 +0000)
>
> ----------------------------------------------------------------
> A few test and doc fixes:
>
>   - tweak DEBUG behaviour for vm-test-build
>   - rename and update plug docs for versioning
>   - slim down MAIN_SOFTMMU_TARGETS
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM


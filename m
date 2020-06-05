Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5261EF9B1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 15:55:36 +0200 (CEST)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhCop-0003hQ-Jx
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 09:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhClg-0001kC-I9
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 09:52:20 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhClf-0001pa-OU
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 09:52:20 -0400
Received: by mail-oi1-x244.google.com with SMTP id a21so8248238oic.8
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+h+dGjzftfPfZGNm1vQr2qqA9j/wsIq//2wBoB2IfFI=;
 b=MxsZa23rcorL6ncvzSi96zKu2TzBpQpT0d6VoqT8RPXXQhWXYRuV88qrtSMBQFdV6M
 2ilMlNqF+rE80Yp5QkW5WObBHa2eKIu9g7RsrExWBs0d5aP4Jmx9ahZq68GiTg3SUeXn
 MhwVTAjGiR96fmAsOzYroSCizh4MPYbj5xa2sSwZZp0Hkw0ZaNuCdaP7G1BSoG0ZEcUw
 XcRE+IZ/s3bHVQzWSaH8n4PzORJdMF678Gyt74OSD8Q3/vptWm6dHqzf8Wd27FxaVLy8
 8zm3QjTD0Yc/eRoucMYfBjNgaKK3XS04JzKhTfKc8EZ/Ut77O4UJaOZuu3e+e9B9NIFE
 O5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+h+dGjzftfPfZGNm1vQr2qqA9j/wsIq//2wBoB2IfFI=;
 b=bcAYucFBvv7zw4f/oV55uGQj8hAm59U0jL4mkbQSwmZPX1D+Jp2FE72QkGT0ygWWdX
 z2wp2hWcbKhlSm7fY13bq4QC+yoGDIMcUjGxAy5jSiVqqslWDs4c7NXkSVD6qNX0R0ft
 DicawvmzWatTYo/yQju+8PAaohLCneEL+8NTV0dTnF9t83dB2ZtyTBaujTQ85AD81v7F
 xg18nVt78BzyyEWZnYu4hEkeTyGHPQDgKbVErJ+mW3Owuhdvyf7uhopyuBqwKmnZTWkq
 xDgwLdEvACqe0S9WFNAsB270a4CX4jx9xpnkt+R1oqoUzo881TaP4DUXtUbBWpoTUtYu
 4y0Q==
X-Gm-Message-State: AOAM530j8jJKJAwhjSGsnf16ncSp14aOj4tdK7KMmwELSqhc0GsU0Hvh
 DwlSk2ilivfYB89KCjkVg5B8OwmkeQg6ya7FDQrgMw==
X-Google-Smtp-Source: ABdhPJxSPw6aX054lUwhnlYCTbZckw95qjZXlwiwP6Y2eQz+RJst/ysvISReGqxrAhlCdk6ju8SO/2A/DijJHr1vgHY=
X-Received: by 2002:aca:568c:: with SMTP id k134mr1854386oib.48.1591365138834; 
 Fri, 05 Jun 2020 06:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200525141237.15243-1-thuth@redhat.com>
In-Reply-To: <20200525141237.15243-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 14:52:07 +0100
Message-ID: <CAFEAcA9Bfx06by3SSZ7q29jTAVknCObJGOUjBJLJiBkBBsr-dA@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: Add a boot test for the
 xlnx-versal-virt machine
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 May 2020 at 15:12, Thomas Huth <thuth@redhat.com> wrote:
>
> As described by Edgar here:
>
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg605124.html
>
> we can use the Ubuntu kernel for testing the xlnx-versal-virt machine.
> So let's add a boot test for this now.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Added "tags=3Ddevice:pl011" and "tags=3Ddevice:arm_gicv3"
>
>  tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)



Applied to target-arm.next, thanks.

-- PMM


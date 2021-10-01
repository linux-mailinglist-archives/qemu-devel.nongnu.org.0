Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F641EB93
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:15:41 +0200 (CEST)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWGVv-0006Oq-Hj
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWGUV-0005Ux-PC
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:14:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWGUF-0007Ld-37
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:14:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id s24so6939285wmh.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6GZT/OhjMqULxUnLiblkkeey8gYvUkSBm2jx7wJXq8=;
 b=yFoEuRoMpszsq2fAHiWtBfeaJJCXkAyQKxL0ACjwImGoMsxtXKbYj0/j9om2xCdazf
 iZtCDVUA/TUucsdHv4eAMktvMTKRR9N5/o+iUCVtSle2+PM0khz/vt0VwWE/V7rp5cyO
 Tm1FVj9YdzzxntDkkPPvN9LdsJLnFHnw6nd8ozcFpzSuy6hyEDfHD5EZVXqlPOJp3Y2l
 poxBNt23Y3v7E+8X+vifPWgVevObRHrePzQ5HXPws7cCZyci8APD/sQnh21iquie8A4z
 eSPqe040dW5s/igGahvcYZwdNpaMKZVCkibV9dGrpTAAXdH5eQscich2nyQygN6xbgFs
 oT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6GZT/OhjMqULxUnLiblkkeey8gYvUkSBm2jx7wJXq8=;
 b=W1HNJ7dzvm9Hm7gagLZOWG8xEXbWxIEoYMtMW/9ItK8lL0cr4CemdQwniq3iuOT6f8
 jPICeKnt7pAEkiQdzrLNzSOCs9ssDTWs0vDQTmWbSxCvntfsclT7NpcdJwMkyikvhfsy
 tRIO6ZiYeDKehlTOEP8MymABXVFCGm3S5RQLcAQUsX3+n9Af9dt/RCbNFhexDDiKzNYr
 9jrwm88B+ckILJKP9RgT3JMFZWEqjV2l0m5Vy+nehW004F9N0a4X4yWtU8Yx3YQrA4Wp
 5KFBV1u4tvRIAJQvqEMzJM5tWOpu8dj7WoB0BW7SJ53aAk+XrIC4VXEkZ+0nZ4IwrG95
 WW4w==
X-Gm-Message-State: AOAM532vX939b+CaBcCqOWMv++XQyX9NLgxKcZPAjuAyWJTnqfoAbgMN
 /qofR73t3aoHZD6UsDbgENZZR+hyWQrmuV5UKD96jg==
X-Google-Smtp-Source: ABdhPJyInq0M72MAxcPYK4UZ0F1Wtv09nxcZdMHW8ezCG0IbWBBIhKB9cuXQgoWU2ICyRaOUD97vAcohMdDSb/vrVMI=
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr3891953wmi.37.1633086833505;
 Fri, 01 Oct 2021 04:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
In-Reply-To: <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 12:12:59 +0100
Message-ID: <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
> Nevertheless, as long as nobody has a hint where to find that
> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
> can see, they do not work without the bios at all, so it's also not possible
> to use a Linux image with the "-kernel" CLI option directly).

It is at least in theory possible to run bare-metal code on
either board, by passing either a pflash or a bios argument.
But I agree that there seem to be no signs of anybody actually
successfully using these boards for anything, so we should
deprecate-and-delete them.

-- PMM


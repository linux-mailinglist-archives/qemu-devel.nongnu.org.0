Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F351B3B90AC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:54:45 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyuLF-0004AL-2H
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyuKP-0003U6-47
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:53:53 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyuKN-0005uQ-Bf
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:53:52 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hc16so9621043ejc.12
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JuLJmX0rQLAynBKjf5A+b+hWxEqT+K7BOWVCg44TYUA=;
 b=y76gZHJZb35lsT2r60lkQ/8c0LFt+1twf+rnud7Ze49xjVWpzP13jknp90ObahHA9J
 8++x5INZmICmwtNabOmIxQzmhgwKAKbh/VCTERYrZJj8lXaPE3D9zMcuuTL0SrQ2X0nt
 OY6RZ7wwKmMwKr38u8wQ7jxtlVOb8LkvsC211ZIoMPW4/tKHqah6FL4sDDqGAMZcoMju
 ohiBxy2Djzmz3fKw4wbPmC4B8O+5caRD6VZ1SAa6pUPOnbotw28IaVpMLotpPKsyLJFX
 yEdN/ABARDnGcq0ffV7zT+SryW4/ntZ9ssQvgBpFdT79As7Nn7oSlaffvOuQsgfWk0Ks
 H2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JuLJmX0rQLAynBKjf5A+b+hWxEqT+K7BOWVCg44TYUA=;
 b=Ug8mUgvBTy3d7CHjdJyQsM9Vn8tMlr9riTWac14QTJsExhD767mLdZYxiEkDlMFn0S
 p2W7TGyD2qZ+V5Y2DLXWVdTBu/Hg2gjLYcwr5WPEGO+6kJIauw5X9eOxzc87NMhZg25d
 c/Gf6PL9/bWp9E+ThVf2AuDO1m6EkjoMewXAOdH6ZbAmjd2WGi6yEbinoZDFj8COVffU
 F1FOp9vMr574pKFZL+JG5xYfNl/8XwIaGxIqcgEeuZA8uNsYyrXl8gl7DnsyW0HBzrw3
 USKs/1Xw+zUOTyidkZ7drMpiiG/ylBG2vs4naLGzwCvNOreR/DAmPo0mqL5Hyx1F+MsW
 hLgA==
X-Gm-Message-State: AOAM532bsLLGnyQz+YAkPCF4DTc91M0BX+ffsb5uwAjJw8oBgLWLlx+C
 OyTdPRJMooJkQuCyMDhp/2yIVSmETu8XdiyB+udeBg==
X-Google-Smtp-Source: ABdhPJwkpm1dq6vB7VKfh3gX12Z6QqojH4lNKqT2VGwAiocHhIIbk/Cbbu3GoKY2da52JRyCQ7fnDXGFJXWk2gj7mvE=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr39757102ejy.407.1625136829262; 
 Thu, 01 Jul 2021 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn> <87y2arpu7u.fsf@linaro.org>
 <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
 <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
 <87k0mapbb5.fsf@linaro.org>
In-Reply-To: <87k0mapbb5.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jul 2021 11:53:11 +0100
Message-ID: <CAFEAcA_3vZWJ+9P-nBPOvDrmiECdHLbkoEiGvicUzAdaBAVnxw@mail.gmail.com>
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, maobibo <maobibo@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Jul 2021 at 11:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Thomas Huth <thuth@redhat.com> writes:
> > I think we'd need some way of automatic regression testing for new
> > targets. If your board has a serial UART that is easy to use, then
> > please add a test in tests/qtest/boot-serial-test.c.
>
> You can also write a very minimal softmmu harness with either
> semihosting or a debug port - currently we can run the tests for
> x86/arm/alpha. See tests/tcg/multiarch/system and the various
> boot.S/kernel.ld in tests/tcg/FOO/system and the Makefile.softmmu-target
> in the relevant directories.

You can only use semihosting if your architecture has actually defined
(ie written down in a spec document that you intend to adhere to)
an ABI for it, though...

-- PMM


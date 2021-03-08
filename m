Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473BF330D0D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:04:02 +0100 (CET)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEcD-0008Vj-Bk
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEa6-0007MY-Cx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:01:50 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEa3-0005sC-TO
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:01:50 -0500
Received: by mail-ed1-x529.google.com with SMTP id m9so14316652edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4czMingbLyNZfQQUERYWEHPbz3mClRCvLPgkaBSxjTI=;
 b=jma5jIMzG3oZjMj2Z7Pnot/MuVivM0oliaPbgKHCy6fY+fypew0slGxCb4b3KcX9DI
 jh3Ka2nglRuSEgBYLJv4MRuHPZGo7nOctY9IQW2P8ngZzvOlIrec2t9XCwnqBt8Tt8cs
 F4zu9GTV/uPNYFOFRSbyebHtP3qOO64rCmJSw3FOigED8VMZ6Valus3fQZNUwfL916hi
 GnPrvcKkHQr+luK1Lz3h8qLWvJgwBEc31ui1twyzlJ4o+qj3cX3Xr52ECak0ubD27Eh+
 rJ39tWGhz4M+vUkdJmsMxexMoWyuEzfT2C1J7hLb8Qg1dEqjjLIY3AyX+QkSe7dAT4B2
 2cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4czMingbLyNZfQQUERYWEHPbz3mClRCvLPgkaBSxjTI=;
 b=Xz1hP7zcP8b83EnQeIu/UID5agdc0TRXYH/AYbzbshIqL1FGZtN4PEbvbdpGV0MxQT
 6nYLtYs4uJ+XnbwWjQBQfd+upYzMtUrihFdmztNcjQ9mX2pP/GtUgQMaYyHfU2gWjNlN
 qSaS0z/Lr57kS91afHEXc78N6wibZaHUAuPMvdhayai75P3MivNRrNl7SiKh1cwx91ge
 v01qW64S+7sZmuulehhLqY+VWAEqkC2BobX085Z1HrMFNO4+muPQCaME9PLxAabjalGq
 UH2PFiAtxonWRoj2OQuSF8jExqO4YMO9PPnlWwiJcxukZNZ6RipLGARIuZgplozQmQ2M
 /rgw==
X-Gm-Message-State: AOAM5308h0w5qkHi4y0BqTGPCj6jhP+cBPH6SY4WgxEjs+VBhxiqy6UV
 7+5NMut1BwlFYpeEoSc23g9cEucXse59sMsbuJxa9Q==
X-Google-Smtp-Source: ABdhPJz2y8sH0/JunCRp2Q0JMWkEKyFYLX9szGxR4oX+G2yggGfh8bvma88gsGC/ZqUFmaysACOOeIJ8ydAwPMmIkxU=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr2441681edt.36.1615204906514; 
 Mon, 08 Mar 2021 04:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
 <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
In-Reply-To: <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 12:01:29 +0000
Message-ID: <CAFEAcA_aOHOfc3OEz4jxUZUQC8Hruqb6iXVCbJHyQDGQt52REg@mail.gmail.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 11:55, Thomas Huth <thuth@redhat.com> wrote:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.html
>
> So this is not about declaring that bsd-user is maintained in a different
> repository, but about giving Warner et al. a chance to finally upstream
> their work.

Thanks; I'd forgotten (or had not read that email carefully enough
the first time around to realize) that the current plan for bsd-user is
improve-in-place rather than delete-and-restart. (I'm supportive of
whatever Warner and Kyle think is the best approach, in any case.)

thanks
-- PMM


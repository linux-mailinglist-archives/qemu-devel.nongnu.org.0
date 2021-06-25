Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66D3B40FE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:58:17 +0200 (CEST)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwibI-00064F-VI
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwi87-0006hX-Iq
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:28:07 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwi85-0004vK-Gd
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:28:07 -0400
Received: by mail-ed1-x52b.google.com with SMTP id s15so12462462edt.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bNnci1iaDuP28/CFU+ugROF0f27cLnnQ/KDn+3pHWmU=;
 b=T/3jnp/YvMI3UXHLbeg25vRKpg/ayHiI03TLgxWKWSsVuNDfVmxuEdRfyORm7H6lOJ
 ++Lao1NYVGsgysMWpWqNL1IwZAYdPf+D/IhloP/WFTb0I6J1mk8cB0YPsykqtOTrViY7
 Zp+QyM4W7QgVcn/fJ1RJ7qmk4gww34mdSEtx2KCM5/p8NZJ6c5aY2QrvKLv9zf6TQ7Dp
 wXTucZU5GjKks6d5BjfI+zP7fcR0Q3LhUF49lZP28W8/qnveRc/NYxwvoRNslawrYM3u
 SFbz+ukIN9iccS0dL5hZ9Vjc/ssu15oFgUVMdSLK7nCDiyFR8SfrwujetCuf90z+CZOc
 V2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bNnci1iaDuP28/CFU+ugROF0f27cLnnQ/KDn+3pHWmU=;
 b=iglBnwFcxjgkk0FBTRqqZ4GI0j2Zi+8KFMjeq6xvbNNBme70EZt/mDd5I5T098Nx6m
 T/o2ZXiojyQerKb6G83r1PUxBnp+EwJ6J/uVN5ynvI8ZKzWaoN3ir2sU+SM2Qn2BcSWS
 0RAL+3tlqkiD9wGZmWn50xVNJdwO/Xh743fO9jxEAyRtfAHzfS0OtBMnwXw6tK3z35b1
 hTaTn1xnxGu63+fvxTxCp3aXunPiZ7RIi06fyHt0r0d5XV1dWq+3szU7Y3fXMEiUB3Tj
 EDme1iMIszICzFi/jWSaHar1OA1FHgsXosSzLrHwFZomsMMTMi/8+jE7xTuP7IHPOoxX
 d3PA==
X-Gm-Message-State: AOAM532gxJn5W8oypM9d/2L4iYLNE9sT3amhLj3v6jtSWxqtpZL7Uksd
 l8C7TRL5idiEe0qPiYkALKUeXoB7NUTNcDQ+zEr4nw==
X-Google-Smtp-Source: ABdhPJwgwfJnR5MkamwcTENk/TRv0gQNDWzIETR9PVueU7QRStz/WjLGEfatf7RhX0xX7jJuOFoO+3uUGvzGRnaUi9s=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr12993088edt.100.1624613283958; 
 Fri, 25 Jun 2021 02:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
 <6c51799c-6882-c459-0996-325c58de87fd@amsat.org> <87zgvfqc5y.fsf@linaro.org>
 <ue5FWr9Im37PzO94ccnHkiZJawfs6i4R8DdYdA5aVq_8BJHXDFLa4ojQpN1CIh5trBH4wiAZNTPzy1V98TQFX4FPh_Z7jngXuYNTaR_hSS4=@pm.me>
In-Reply-To: <ue5FWr9Im37PzO94ccnHkiZJawfs6i4R8DdYdA5aVq_8BJHXDFLa4ojQpN1CIh5trBH4wiAZNTPzy1V98TQFX4FPh_Z7jngXuYNTaR_hSS4=@pm.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 10:27:27 +0100
Message-ID: <CAFEAcA-tS51CCvEB4eG7vkB+edTrZyxNV29YV++XF5SNw_4D+w@mail.gmail.com>
Subject: Re: Difficulties to access guest memory in TCG plugins
To: Kevin Mambu <kevin.mambu@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 10:25, Kevin Mambu <kevin.mambu@pm.me> wrote:
> In the scope of my Ph. D subject, I want to model a DMA-like mechanism fo=
r quick prototyping and evaluation, the plugin emulates an MMIO with Contro=
l/Status Registers. I am actually able to pass parameters to the Control/St=
atus Registers through store instruction without any issue. Only the data t=
ransfer between two guest memory regions fails at times.

This really isn't what the plugin API is intended for -- it's meant
for tracing and similar sorts of "track what the guest is doing" activities=
.
If you want to model an MMIO device, you're better off just writing a devic=
e
model like any of the others in QEMU, I think: the APIs for doing that
are much more well-proven and there's plenty of examples in the tree
of DMA and other devices.

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E732EF86F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:56:50 +0100 (CET)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxsP-0005DC-H8
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxoV-0002dE-DH
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:52:48 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxoR-0004lz-N5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:52:47 -0500
Received: by mail-ej1-x636.google.com with SMTP id x16so16066683ejj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5KlDyDwq4tQx6HE1slbSWN6jVC4VZObz3liUz9MFuI=;
 b=AxYzVJsathWfkoyXn45yAwlwzHJHuzXsJ8vCXk+RWHZE85VX3UDt1Qju/AXnuBYnSh
 h2CvdmVo6TD7D7Meu5/k3Bu72r7r2KLDUQLPACvBqOZKBL94R6F3gFYiYPEcjgqvweLr
 5SuIeTuLXgg3iK82QVSJ+mU1ZpzN+epFkNA0/bjz8HSIitd1hEBExT+lu7MHpTdq8pzl
 W2AHmr5M5dUZrPvt8eB+8hHwi+uCp2SR/njdWJw77FxZeM13/j1FFu+bXlmq8MykPmWq
 X9aaPd9IEDCp+KQgY+wiM5KOshJVa9Q2K4zrPi9XjbRstisUTxDeAb1WjnQbSU/OGZPV
 zj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5KlDyDwq4tQx6HE1slbSWN6jVC4VZObz3liUz9MFuI=;
 b=nOYUSHYAHsVjsycM1E/APe60I16tzhmroINWcSEq19JGLMVfvX1rlyU7zQTBsqHcgA
 eXC5spRSrXt62u3F1iZumNE83CDeNndaFyB8BgfMK7fRk5wCNMDk4macS/M4vrviwpfO
 uzoyzseFDmxr40XflepjgohXDqV4GougB3l3PcgaBYjh6Rdujk9WfKqA0F9OnWDsl5ek
 2OSag+nFtAJujtNWW5aXgmXmOwoKESMn6EcCyLfzpbMcm8AHbWUtIqv0x3R2wgzJt60v
 QGSNe1z/VftFl/DmRk+p6KDrQzzQxemGoojcnxUJs0aOO6rLc491/kKvqRSG4B55slfX
 gV0g==
X-Gm-Message-State: AOAM531muJUCzUJF8GoB75Hcm+iASFMdQ261Mi+dJVRXjYsrgh5PSR5F
 dMTVH648bG6h/Ilpp6cSJHmtTb2PRa1kcWkmelTs7g==
X-Google-Smtp-Source: ABdhPJyG0YivE7Yr2snoT8735wuWC2OvUVZLYVwBUbGJUxHVNTEzSMf1kjMMr+5TyPOE83tVNVobKhreUfpFegaD9mw=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr3695022ejf.85.1610135562390; 
 Fri, 08 Jan 2021 11:52:42 -0800 (PST)
MIME-Version: 1.0
References: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
 <2f710d2a-ab7b-de6c-4ada-8fb7300556da@amsat.org>
 <142ead0d-db31-3e3b-15bc-4614658ef251@roeck-us.net>
 <CAFEAcA819jnU99nQdFZw1dd_x7YZ4SqQHouOw5w+iC2uEY76aA@mail.gmail.com>
 <1ae841c2-7714-f062-f64c-486882287fbc@roeck-us.net>
In-Reply-To: <1ae841c2-7714-f062-f64c-486882287fbc@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 19:52:31 +0000
Message-ID: <CAFEAcA_RLZRSw1jv3GK5RLY+PG79Zm13OiJ1+Q+WUxpHwqwUOw@mail.gmail.com>
Subject: Re: pxa crashes with qemu v5.2 when executing xscale operations
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 18:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/8/21 9:25 AM, Peter Maydell wrote:
> > On Mon, 21 Dec 2020 at 16:01, Guenter Roeck <linux@roeck-us.net> wrote:
> >> Something like the following should do.
> >>
> >> qemu-system-arm -M z2 -kernel arch/arm/boot/zImage -no-reboot \
> >>     -initrd rootfs-armv5.cpio \
> >>     --append "rdinit=/sbin/init console=ttyS0" \
> >>     -nographic -monitor null -serial stdio
> >>
> >> where the kernel is built with pxa_defconfig.
> >> Machine name can be any of the pxa machines (akita, borzoi, spitz,
> >> tosa, terrier, z2, or mainstone). The initrd is from:
> >> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz
> >
> > Do you have a zImage that exhibits this so I don't have to build
> > my own, please?
> >
>
> Attached.

Thanks. Yeah, this is a bug in my refactoring of the coprocessor
insn handling :-(  I've just sent a patch which fixes it.

-- PMM


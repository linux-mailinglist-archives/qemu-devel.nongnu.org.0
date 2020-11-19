Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48642B90E4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:28:31 +0100 (CET)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfi74-0002Zd-S2
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfi5D-0001lx-Cm
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:26:35 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfi57-0000c1-0S
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:26:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so6417291wmb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mpJuL3SnnKlP62I8lBtFfYglIxGvCkHfqcBizqp+ip4=;
 b=lrKvDw5T/5cSfUteZYwQe9FdeOa5c8vk4TPhVOq5eRBs6ed7eZRYzIAKql+fIz2ry7
 Py3WlBfG1fyl9gmqqiHNVbjfeOjbmq9I4hDVpJ48LC6rYt/At61HXtgncCliBc8z8sKD
 adLYVfElOqlFyBRY3uWKZaZsRuJe2BedIvOEGiJ3DgtgqP1RNrjwLmpJLzOuozE6p1BN
 3YWMWk4MR3EPiHrve/5ceJjqrA7FyFBzVmDIXOQMiUaZnicLS/1OPMk+0n5ykCkNiRJ9
 4Di7Lmedt4C6XeMYrCvU+R42g966z35A7ZMjAmjuCBNumuzApRZfJ39JHRUux7t0aEfX
 CaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=mpJuL3SnnKlP62I8lBtFfYglIxGvCkHfqcBizqp+ip4=;
 b=phc+gRO3eeTHylq0xjiE8IYYYGcB5sQdJtns06xIBpW178fvlvH3Z166Id6pNJJO32
 Yqc2gKfQ3ag51kPAZVkXDkhgvdQAriVliAf4s1JPKqdgrwPdLDQHdTJ2BbM2NdE+l8fV
 7kBs6R6cN9DVdpu7H4sGnVyuHz4043sYteDs8OXPA7Xy+yUdj1QFwywNmTElMA9/RXTK
 Rkm2iQqp/iUMXMjjcHCPX2MDf8mtIZdshSmar6nQjWPz54jayiU0KE4VWHUxZ0nf7cSS
 1P0OqGL7Tgh81sl8cmKdSCidA5qVTHvqofZDQqhML/HO/lq6SxCMtOWX2oYpzsQP10mH
 g4pw==
X-Gm-Message-State: AOAM532E6v1JQ0PreRYAVhCycW1mKfbGwojblgxEL9ZmnqeI+1dcQelR
 FDDXdaDnuin9HQ5TbGeqw4fZEQ==
X-Google-Smtp-Source: ABdhPJwNldB5/M6yvGFu2JZiZ6Xk5gRYhM8j3CDTRpzeORiB0J2XkASYGpbhXaWu5uULdojs5MwWIQ==
X-Received: by 2002:a1c:9c56:: with SMTP id f83mr4242294wme.49.1605785187287; 
 Thu, 19 Nov 2020 03:26:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm8620547wml.13.2020.11.19.03.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 03:26:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A5CF1FF7E;
 Thu, 19 Nov 2020 11:26:25 +0000 (GMT)
References: <20201119092346.32356-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2] target/arm: Make SYS_HEAPINFO work with RAM
 that doesn't start at 0
In-reply-to: <20201119092346.32356-1-peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 11:26:25 +0000
Message-ID: <87lfexvb8e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The semihosting SYS_HEAPINFO call is supposed to return an array
> of four guest addresses:
>  * base of heap memory
>  * limit of heap memory
>  * base of stack memory
>  * limit of stack memory
>
> Some semihosting programs (including those compiled to use the
> 'newlib' embedded C library) use this call to work out where they
> should initialize themselves to.
>
> QEMU's implementation when in system emulation mode is very
> simplistic: we say that the heap starts halfway into RAM and
> continues to the end of RAM, and the stack starts at the top of RAM
> and works down to the bottom.

So there is nothing to stop this value being in the middle of say a
loaded kernel or something that happens to overrun into the second half
of memory? AFAICT if an initrd is ever used it will likely smash that.

> Unfortunately the code assumes that
> the base address of RAM is at address 0, so on boards like 'virt'
> where this is not true the addresses returned will all be wrong and
> the guest application will usually crash.
>
> Conveniently since all Arm boards call arm_load_kernel() we have the
> base address of the main RAM block in the arm_boot_info struct which
> is accessible via the CPU object.  Use this to return sensible values
> from SYS_HEAPINFO.

It's certainly an improvement but it feels like it could be a bit
smarter. Maybe it's not an issue for sort of things that use
semihosting?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


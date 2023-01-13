Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E86698DD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKJE-0000az-6T; Fri, 13 Jan 2023 08:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKIz-0000YP-SI
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:41:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKIu-0005WI-BY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:41:13 -0500
Received: by mail-pg1-x531.google.com with SMTP id e10so14988621pgc.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvcSVsmvyc+h6/OYj83JkME0kub54pVGNtG0suC+OuI=;
 b=K0RxuQSEH+5H8u8VO+4t4fePqQTlzcnIb6Oqw78iozAuxUhdtYrMCFqx03nElNdEWv
 /U+Y2QKrZmyfwhwL3wrZQV7yRujGLtqVvY8GoCcNJ1bTQU3b2ewfkqk+e4gToS5FwFME
 JukxNbtfBAK8j2xtbE9d5sjQmzEEUkCF/P4VfmGsQeZlg0mfZrKERias3HpsApXsemSg
 bOWYYPODAG4zLeBXNtSHlKfOacbFNypQFlleB6JkxN6Dj7CyxN2hNI0hpq9lCeMhYWw6
 9h0Tl0DzJDWV+zUvvYjuvjc7byAh8Z3UzmzQ5iNKIx9dpGaPtB52t6MYcQnIEJP8jBL9
 +HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvcSVsmvyc+h6/OYj83JkME0kub54pVGNtG0suC+OuI=;
 b=3LVtoaJMS6rty66YFFxgCtIAJCP5xFLPTh3t1QKB1fF6k7v1jrZoHPZbT5xdHqxGuw
 K21C3zsWq8cwGIG2ewhitJ7hVFqHEl/lH6vL99/MIrKJ0aDOttvtUnk4iIElN1F+RIfw
 vzqAjAb7Aqmzy1keWFoEEi8yuGDs7M1tLWIgi+1rCwdZVTgiNUkhi3m5Z+aoVzPbMPEo
 lDGJTypXxuw2OMi1hAk6Q3oA22eUccq1KXW/yEs1xisr34M+bT1wje+KYvJOkdMsYb7v
 2MTiWLbzVqgFFp4iMjTxb94tX7huclyNxbSFJMsWEnNZjqWsLBGztY/RHUs/YGKUzwpv
 p/mw==
X-Gm-Message-State: AFqh2krJfbPuJo3Uzsr9Pe09BsNyA7QXPn9Q+M4erDNXL9X+ds8ziqy5
 L0JcD3CPjt8GwceK5qM+mK5cvLrb1B7fRVobXH5TqQ==
X-Google-Smtp-Source: AMrXdXs3x23XqiMx++s4EIX3bAEhMWOErtccOtHOXpq9CU0WdS+Y79aFmjwWSk+9UpUpHUxfEVfAEsPqOfmyeKSNsEw=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr3623647pfh.26.1673617266829; Fri, 13
 Jan 2023 05:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-5-philmd@linaro.org>
 <49C85A05-2BE5-4D9B-A08A-B93039669BD8@gmail.com>
In-Reply-To: <49C85A05-2BE5-4D9B-A08A-B93039669BD8@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:40:55 +0000
Message-ID: <CAFEAcA9HNdUtYYK-xk26zc7VnmeQfUSxDTZx3d8Piz6ErXBnrA@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] hw/block: Pass DeviceState to
 pflash_cfi01_get_memory()
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 23:43, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 9. Januar 2023 12:08:16 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phi=
lmd@linaro.org>:
> >The point of a getter() function is to not expose the structure
> >internal fields. Otherwise callers could simply access the
> >PFlashCFI01::mem field.

"modern" QOM style somewhat relies on providing a struct definition
for a device and trusting the code that uses the device not to
peek into its private fields. In this case we're only passing
a pointer anyway, so as you say we can just use a typedef if we want.

> The getter also works with a typedef which doesn't need the structure exp=
osed.
>
> >Have the callers pass a DeviceState* argument. The QOM
> >type check is done in the callee.
>
> Performing the cast inside the getter is essentially "lying" about the ge=
tter's real interface which requires a PFlashCFI01 type to work properly. W=
eakening the typing to the super type also weakens the compiler's ability t=
o catch mistakes at compile time. These mistakes can now only be found by a=
ctually running the code or by analyzing the code very, very carefully.

Yes, I'm not super-opposed to these patches but I did find
myself wondering whether adding all these casts in the caller
is really an improvement and what we're trying to achieve.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A733C026
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:40:01 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpK4-0004n4-C0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLpIE-0003qS-Tk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:38:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLpIB-0005fO-Kd
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:38:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z1so17870088edb.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7hg/VJ5Ns9NsJiuToWsw01d4V9wCJ8LubJnhDb7mGnA=;
 b=iAp6ij+pQK0l1kSUmLVVMa1KfFxVLwgmMUxehKgzpTfOfpgi/M8V+4Vx5BoPbZHKur
 MWys4lbB2zCFFH0m7eGugTc7R7kapr5wpjowWKwQTy6fdH8OKoYGni8jhxzl+v23sH8w
 Q7TwLtCVGhkRlAlRi1fwcXu6G2Tu8WOqk3E0hT5nK4X1MT6SKnpkOjbqjhNc0x374PAZ
 NFQT48Ot4CDzYJsNf8y6ZhG1jN1u4wYKp9lbuATHAWBHA6F2v67TP5Y+w+jf7Pwsp5D/
 SPqwbUHlHWU8cYiBN65ccukHk0citt7tRlpIKP+3qM6qXn5r62FkpT0RhwHKe2AgV+AL
 AppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7hg/VJ5Ns9NsJiuToWsw01d4V9wCJ8LubJnhDb7mGnA=;
 b=LgAayisqQjEfglh02G/ZVPsMjxbQ5OoSXZbJgMuRR5znDq8Fj7gdIpxhR7OeTbYP3z
 6r6+SoO/k4krEPSUINopSTXgNThjoUwMd49YMeSJFw8w+K2yFVpw21D1u59Lv729f3Ce
 08b7RBfS6Lqpz6K5A2GOK8LI6vg6mmuRxK47rsJBEuWxmzvyUvxRUIIKbOZWj8/irzVz
 qMaL59fBCHWpB2HicMIF1d/1HOhK7bhV7KvP9C8LCaiXxu4ZoF7b1wzY+eEgm0MnnJGA
 AKBb+WVLt1IulPkCncwKP1ZJkIO8t1llBhREHWnU5UP0T2r/hOoFVeZgax0OMhvj3nGv
 IVXQ==
X-Gm-Message-State: AOAM533YIIsiJ9AGnxqkGTi6dW/IUTMSJ8JjTlyX7QDOIkIOE34YVbi3
 TlH/WLSXe2Gdko9E5LB7VDQZkCx19SQ+LPYWwFN9YJ9LhzFmxA==
X-Google-Smtp-Source: ABdhPJwcSJ39UqxcxWMSBlf7QTdEaGSnYKdLNwnV41OXNjKlFo6u7ZoI6RROnBFCELv3WcZOe2m2d8/CLNuQqb0/Avg=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr30183311edt.251.1615822682032; 
 Mon, 15 Mar 2021 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315135410.221729-1-thuth@redhat.com>
 <5f8be2a7-5baf-7cdc-42a1-954ea3aeba82@redhat.com>
 <9a6fd794-8ac5-a054-7bf5-b485d57fb1a3@redhat.com>
In-Reply-To: <9a6fd794-8ac5-a054-7bf5-b485d57fb1a3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 15:37:40 +0000
Message-ID: <CAFEAcA9KvqMycFysq_U1NHwUx8RZToZ5DXvqGnhpuw8XcGhrSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 15:26, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/03/2021 15.52, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 3/15/21 2:54 PM, Thomas Huth wrote:
> >> We are generating a lot of target-specific defines in the *-config-dev=
ices.h
> >> and *-config-target.h files. Using them in common code is wrong and le=
ads
> >> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working t=
here
> >> as expected. To avoid these issues, we are already poisoning some of t=
he
> >> macros in include/exec/poison.h - but maintaining this list manually i=
s
> >> cumbersome. Thus let's generate the list of poisoned macros automatica=
lly
> >> instead.
> >> Note that CONFIG_TCG (which is also defined in config-host.h) and
> >
> > IIRC we can't poison CONFIG_XEN / CONFIG_HAX because they are
> > pulled in via "sysemu/hw_accel.h".
>
> That's a good hint ... but I think it can be fixed with a patch like this=
:
>
> diff a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
> --- a/include/sysemu/hw_accel.h
> +++ b/include/sysemu/hw_accel.h
> @@ -12,19 +12,24 @@
>   #define QEMU_HW_ACCEL_H
>
>   #include "hw/core/cpu.h"
> +
> +#ifdef NEED_CPU_H
> +
>   #include "sysemu/hax.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/hvf.h"
>   #include "sysemu/whpx.h"

This doesn't look right, because sysemu/kvm.h itself contains
a NEED_CPU_H check, which implies that there are situations where
NEED_CPU_H is not defined and we need to pull in the header.

thanks
-- PMM


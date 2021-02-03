Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FA30DA50
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 13:57:31 +0100 (CET)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7His-0002lK-2z
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 07:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7HhC-0002E2-UG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:55:48 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Hh7-0001kX-Pl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:55:46 -0500
Received: by mail-ed1-x529.google.com with SMTP id q2so11982675edi.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 04:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3kDP10NA4P8jie8LUWKoRtoLfx2MH7BrjzVE5dzsias=;
 b=Eztp24deQXyUIat7bxX2+8rXegPtCIjoWe+OKxc95MfYVRdlTomItgZxqc25sbOLPf
 Gf1lMeIJIroZoW6ruf/qHN7COK/OmtqMrQIfNbTIb9UslcMWGMnqoapyWJGX3y86JvE5
 HFaH4ii9QZztgKIbyuySeA1qD7u/dERuZ3edsJMv05gVeI5l75b2f3zbJkFy6sUA/VVQ
 Kqu+Rwtl5zsTcCPcfusB1GSEXBES0kxs+tg1Mf0acS1TlsibKLl7vsYpzVMBfPwcAxAX
 mEej5ECRgcUHX881vHvGjtaR7nH3Zjbp/+OnNaErfd4zQn36Utp47LE/u8DH60WYAL2f
 tnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3kDP10NA4P8jie8LUWKoRtoLfx2MH7BrjzVE5dzsias=;
 b=a18QVOPujGX7K+wZJ/RH0K5Fb2DWOQORtYnnfw11Anztoi6eYhEIR526w5+y4kjz5J
 jsFykGGpBh3PZxXTi95aypxIwaoGaKB2wJzr7PDx2RLXN8xieFbz7SrgrDqvspDZwDSd
 yDSkESP4BIGlU3YfdQlXxetYLsZ9CVOkzemWbj2uADzbb8O9GbNibCEq2ly+VIyD0FIr
 fIwkvbC4wvJnwVyPuIV/UTdj1UB+93Sq6TTqG9/BM4oNa5Z0Jjy+kFhAouDsLNKhct9l
 nGyT5XjyDigzWWbKpE1r6vw3TUtBUhnwVgyuWjF1nO1q+EESlZ/UcUmPSz3keAgGTNv3
 WRyg==
X-Gm-Message-State: AOAM533e2wMCstw2U0xu4cb/8N8DoulMTRmrztfbhci2aWz9f6oDn1Jp
 W2kVyT9GkQUOlf+kAwt897kHzv8sAJC7CrrhdZN5MA==
X-Google-Smtp-Source: ABdhPJzy0uHD+8zZooh1mtCO4nkLQkQvisKsch17XXgLMbZCZMBg8pTqkvhHBYp2vMR0P8B6IXQHmsIed4x3MtmM4l4=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr2772826edv.36.1612356937307; 
 Wed, 03 Feb 2021 04:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20210202193020.4107711-1-ehabkost@redhat.com>
In-Reply-To: <20210202193020.4107711-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 12:55:26 +0000
Message-ID: <CAFEAcA-D_CyFrTyDX1qHA21fTaJ2Nh0h9jPjQcMYGgJAL4MO0Q@mail.gmail.com>
Subject: Re: [PULL 0/3] Machine queue, 2021-02-02
To: Eduardo Habkost <ehabkost@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 19:31, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> I still have a huge list of patches to review, but I don't keep
> this series stuck in the queue while I try to catch up.
>
> The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to dbd730e8598701e11b2fb7aee1704f4ec1787e86:
>
>   nvdimm: check -object memory-backend-file, readonly=on option (2021-02-01 17:07:34 -0500)
>
> ----------------------------------------------------------------
> Machine queue, 2021-02-02
>
> Feature:
> * nvdimm: read-only file support (Stefan Hajnoczi)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


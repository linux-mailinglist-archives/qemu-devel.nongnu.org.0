Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4544206D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:01:26 +0100 (CET)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcYf-00081E-M7
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbeT-0002zF-KN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:03:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbeR-0001dX-PG
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:03:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id d3so29273956wrh.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpqW03ZRRzE3ngMKZP0HTZzE1s99xwb5qVR+pvlBmpc=;
 b=zTfU1Yq4byxzZjVsEI8+NdnGsyQYQqNt12yGwnQQ+32iUNzbcm3dv4yWl6RDa4qS08
 +kxHZPQc4nqEp5JW6AmE5OwIvqcrTYDGf6IHs7VSGcv5XOZ/959UIVZxSp7hQw3yBamU
 sjiroLKDycBdaCvNodZRLaRNSovWm5V8eEzgbM2LDIa7EOJZOWzfY+xS/EwsUULAe9IJ
 n5qNEbNXgcdrkiPhwcdZpCNvkYb5J8qut7cgQDKSOs8d3L/Ec9shn8Um2cED4aioQV/6
 RGZ8INMUzUNNk2GHKhnBLGZD5Fja6zMP7HE4/0aMyJAY9coo6Fy8e3+an2FTQVmCRHTx
 Acjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpqW03ZRRzE3ngMKZP0HTZzE1s99xwb5qVR+pvlBmpc=;
 b=0zz3bIxzbl+d0WvtIAKtDsr9pGd8dzoqHgHSLOP3Qbzh9xeYk3gzqBYvu/MvrMEvbe
 uskZXLn0H5pPYXIkOV/rckPlEc52hu4y9JZOKi+LgVLNW+FwTJKK9oEQBiVPp97G3Xk6
 nwmEVYMYzW1hfPdpRh48dXFOuxq/0ZzOuO6pcO75bEbIl25h1K5XupY2tzbR93n5vkqy
 q+gMuC3pSos8Xd6kq+fT4UXVvm78Qv3TFFR6vucAC7/8u5x1bxA3HGu/vufgOCH3iGyZ
 UxRbpfXvYqyYaqv6EhqQYHwX719nUZ364/oUxHnp72TyBcDpt004pWgI1tK5sknEZD/O
 6PBg==
X-Gm-Message-State: AOAM533pez6frjXeFIQPibXjDH2DpLP6E2Fq7uEnO0SDFLRoQCMqjdm6
 kB+oE7xH787ihzhQkywVmdZYzIyZrETnZ5oBvHKpug==
X-Google-Smtp-Source: ABdhPJwZGPJs7H8s3KQPyy3Y5W4rLPyOpKaerxTNikyBKfN64TzjMSxzfLgLHUKoHwx4YC9HSvgEcb/OGiyY1fiEg5c=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr31774773wrt.275.1635789798259; 
 Mon, 01 Nov 2021 11:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
 <27B816F7-3670-428C-AA42-95BC7DD635CC@csgraf.de>
 <8373048b-e930-6c69-54cd-aca33338cb76@linaro.org>
In-Reply-To: <8373048b-e930-6c69-54cd-aca33338cb76@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 18:03:07 +0000
Message-ID: <CAFEAcA-2jAy=5UzVq6OkfkmHrspwog49+2t6PfH5r4gQeotdFA@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 at 18:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Ah hah.  From 0487G.a, page D13-3191:
>
> # For other faults reported in ESR_EL2, ISV is 0 except
> # for the following stage 2 aborts...
>
> (which incidentally sounds like documenting around a historic chip bug, since both EL1 and
> EL3 do get ISV set).

Nope, you have that the wrong way around: EL1 and EL3 get ISV=0 for
almost all cases -- only the FEAT_LS64 ST64BV/ST64BV0/ST64B/LD64B insns
cause a fault with ISV=1. For EL2, in addition to the FEAT_LS64 stuff,
you also get ISV=1 for the loads and stores which are emulatable
without having to load and decode the instruction word by hand,
because all the information you need to emulate them is in the ISS
fields. So you don't get ISV=1 for load/store pair because the ISS
doesn't have fields for more than one transfer register, and you
don't get ISV=1 for instructions doing register writeback because
that's not something the ISS gives you enough information to do, and so on.
And the reason that you only get this extra ISV=1 information for
these faults at EL2 is that the assumption is that only a hypervisor
needs to be doing this kind of emulate-and-continue of a data abort,
so the architecture absolves non-EL2 implementations of the need to
do all this work to track and report the information relating to the
insn that provoked the fault.

-- PMM


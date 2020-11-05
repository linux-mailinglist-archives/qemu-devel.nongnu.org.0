Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F82A8518
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 18:39:33 +0100 (CET)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kajES-0007PR-9a
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 12:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kajD6-0006Q0-7Y
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:38:08 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kajD3-0002yn-AR
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:38:07 -0500
Received: by mail-ej1-x643.google.com with SMTP id o23so2823371ejn.11
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 09:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWZHErI6ntNC3BzXXUFN8qIbLmnbDC5zCUwd2u1Undo=;
 b=pp5RHKtnOsk5XVCejeCFTkWXRCKrkFxlSNx9Fp4OHLwgw9aZ/QWSjsnXoAhcMjWXMI
 heN2UdaqKDNprRUiPOYNo4ro9gkgaFLynRwRdwOaSrdY3WAF2m1gpf4mVgP1z9tvEBC/
 WfRQ9MVy83K+d2PUu6AOWXIWZXGR/cxCgho0Er6C4btUlsDFcDrTDTnHgQbePJt9CznE
 8u4X1yW8wSH4WvADhFG6yCaDpxFTIgC4kBTOjM6GpWv+TCkl/jlFPZVpPjnFCzcFyQww
 Ftdl5z++n9Vrxq51/VH4L7C2pOPZvVetFlcLuEC8tO2rjhePEzeTKxNbuPq2tnQI8UuL
 wsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWZHErI6ntNC3BzXXUFN8qIbLmnbDC5zCUwd2u1Undo=;
 b=USAc4gGB01pQo9fvSa3FuTpUZcDevIa+LODSGJKtH8rD6Z5U8hoF+9hFU26HH6VdfZ
 cXNIWK2Sr8jiD0/o6yXIoFWRtQ+pe3Z+LvhPAozpq0mr4VsZm8mgCYA1qsdVjPmZTI1D
 xgV66vg1GtoK2ApPsi83DVzERN8+gCBwnRptupVs0SfHMsahKk26Hc2oNEmvq5dJKeUn
 7cvMVOmWG5vThvI90+N7NwfNNjSSHJrcEor9UuNYdHd/eep09bAUrDYG65+fn2z3gpvT
 C5LOcdtX3NBhE/r5yud9vuVu5SmJ4omvlngroscYfckqBkOZ/0COIrHOU/EvM8WO/0nT
 EMUw==
X-Gm-Message-State: AOAM531ApiKCK55zvckB31EjxTn1VAGa7zQBzrGlQjtzZdJ5k88Mg6CP
 Eo0EdLHBGKMPE44Zl5MSjHjyQBz7tPVZJWfx4Ep+1+yVWINVyg==
X-Google-Smtp-Source: ABdhPJzaRsvN4PAdE+Gr4VTz3k1u5LptDOw/NlTCpvw/YK7hw6djyTOIPkdhaPZIS/G7PKfkrNL1ZoZgFDswAKg6nbw=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr3269651ejk.382.1604597878085; 
 Thu, 05 Nov 2020 09:37:58 -0800 (PST)
MIME-Version: 1.0
References: <bf2b4da4-385d-a0f7-7915-4f31fa797898@gmail.com>
 <CAFEAcA94OTo=FT6yWVod6SYNEzowQ9ee8kKcih=q1T7TTrYBBw@mail.gmail.com>
 <85656394-930c-cd95-df9b-4a6754f83c84@gmail.com>
In-Reply-To: <85656394-930c-cd95-df9b-4a6754f83c84@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2020 17:37:45 +0000
Message-ID: <CAFEAcA93y7joe0d+gyCuw+s4huwX620QD5usSsDdFfQCgarHhQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Correct definition of stack_t
To: LemonBoy <thatlemon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Nov 2020 at 15:48, LemonBoy <thatlemon@gmail.com> wrote:
> On 05/11/20 16:16, Peter Maydell wrote:
> > Coincidentally, I just noticed this yesterday (am in the middle of
> > trying to debug why qemu-sparc64 crashes trying to start bash...)
> >
>
> What an interesting coincidence, I also stumbled across this bug while
> debugging a crash with some sparc64 binary.

Don't suppose it involves sigsetjmp/siglongjmp?
So far I have discovered that the linux-user/sparc
target_ucontext and friends have host pointers where
they should have abi_ulong and also that target_mc_fpu
needs explicit 16-alignment (patch written, will post it
sometime this week), and once past that have hit another
bug that seems to be down to the setcontext/getcontext
traps not saving and restoring all the right registers.

thanks
-- PMM


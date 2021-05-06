Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DB3759F0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:04:40 +0200 (CEST)
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiMZ-0004Ua-Do
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leiDy-0001NM-Pd
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:55:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leiDp-0007QH-59
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:55:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s7so2488344edq.12
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afbiRjJjF+Ph0WBjURySk36qcFMtK8ubgX935LVRT18=;
 b=f2TqJDAg8JLzGDcnM8Wt4W46VVN6uHcDOOFFYSdShHMf47CwHf8abVfuGmrKO80268
 aMBRWGm8QEke89uTHqEWIu3nbiMSawRVi9Gx7VQThlKP3nWqpIdqExUarP2XR5VPkFWG
 cUQfBCUOcPcGLfDWMP+TquOjrcMiFE1WecKgORDx9F+yCi2reQUf3RkkRD4Q5isRaiwB
 HIqoGor0FWRdL+NxE9CyVNkY5CmvRJX0Al446Rc0nWLtIqYSzPNrgluhuRTNW2NqjP6S
 B643VapahQArvZVj2+uMoDhUjynxBBr0xNdCHLoxCJ9z6jRYhzXbAg6PH/owGP7wh8mp
 B2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afbiRjJjF+Ph0WBjURySk36qcFMtK8ubgX935LVRT18=;
 b=izMUVLK1fmEzJGiOaUCrAvnrlruBfqR2Zgf4s6DjXqHKVwHcRAVSEWr2ZwZHZqLkBa
 37YaQWhdr5GPfO/nhvBlrq0/lBCXADYTNoqNW4WrifkyfBrnhclp1iq+I/NlxGUmiskT
 4t5F/2w1ydjP0bCQKns49fJkV/nQXIsijfhkXSsBT6JEsL9DuhVBMqbrQxkVDsxOVymg
 XzqCFiy6Fk697rlJHvfgY35wS77t4gEs/MfGs5Ac0LowwFaw8SOR5duB7Q48TUzuDyTu
 xJpeHKNC0lDm80xBWLPV9ysouxTuk4K+MTSbaHarfe/56mCV1QDH6hmTwGgHLvRZYbNz
 kvrA==
X-Gm-Message-State: AOAM530lgI4TMhRNf9DFBqcUJLzhVQQk78xSAbUuxpCdeZlg8jUvyGfC
 JG4K/LGCgtq8hLVMNwzgdveNN/ta91dhtVEycUv5kQ==
X-Google-Smtp-Source: ABdhPJzCEAgdpwkLF6C5frL4GE2nI/NbCzk2NUwgK1me2dEXHTMTvW73npjnMFAOw5dxmS2bFBjJaHdXecQRNnKZCzg=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6819345edv.204.1620323735143; 
 Thu, 06 May 2021 10:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 18:54:26 +0100
Message-ID: <CAFEAcA9-QofahniUxr2K9TGG5ur=YE3RQZ83qVLRa09H3AbqVQ@mail.gmail.com>
Subject: Re: [PULL 00/46] ppc-for-6.1 queue 20210504
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 06:53, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210504
>
> for you to fetch changes up to 4bb32cd7b1e42c46d274b727c8be8e45b4df3814:
>
>   hw/ppc/pnv_psi: Use device_cold_reset() instead of device_legacy_reset() (2021-05-04 13:12:59 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-05-04
>
> Here's the first ppc pull request for qemu-6.1.  It has a wide variety
> of stuff accumulated during the 6.0 freeze.  Highlights are:
>
>  * Multi-phase reset cleanups for PAPR
>  * Preliminary cleanups towards allowing !CONFIG_TCG for the ppc target
>  * Cleanup of AIL logic and extension to POWER10
>  * Further improvements to handling of hot unplug failures on PAPR
>  * Allow much larger numbers of CPU on pseries
>  * Support for the H_SCM_HEALTH hypercall
>  * Add support for the Pegasos II board
>  * Substantial cleanup to hflag handling
>  * Assorted minor fixes and cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


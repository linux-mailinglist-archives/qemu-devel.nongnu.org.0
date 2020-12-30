Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096F2E7B15
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 17:36:21 +0100 (CET)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kueSS-0007cZ-9L
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 11:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kueQt-0006zv-OX
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 11:34:43 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kueQq-0001qD-8q
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 11:34:43 -0500
Received: by mail-ej1-x629.google.com with SMTP id j22so22486112eja.13
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 08:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1ljqjT3ypvZHiBeEJkNjIrFyVq+eB/b+gK4dVWjVCc=;
 b=TnIF1sPjLSaPBZ1DiSTD9N8zbZE1GZ0pIIUq/Ng4oQyc/4KV5NR51+LaS8GAzlJySO
 MfqCAqiHOLTUNiPNDl937rTO+MK3RqqTvCuAZc1cdke7ZcrmWIFWGsBGAtYq89B237nC
 mN/cLuGK74tvFRTzbdUvR0DkqbqdTexobppqq8wWRUn7dHQH5tNRf6Z1oeidHyOJFp48
 HVYNL5JutRbLsmmS139fl1nxKWJYOzPpbwd/8pgOVJqJnyRdVfMWB327GS3r08qwmTJd
 WLiZD7ZyjIcm4F5zNRGReJBCpw7spV0WKRQLnRRcIsJlk3Rlf+UN1NV3DM/B9YNAkKMl
 AfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1ljqjT3ypvZHiBeEJkNjIrFyVq+eB/b+gK4dVWjVCc=;
 b=Xoe4XnAlv8/RyO3DMwO+FMQP0nMJWsFfS8R3FF5/Cs3h2m5Tdne+8uUzHtjTvi45gy
 Ioy6xI5oc4vVfOhOFo84lBXnY08YmcmNXOuyUusCBrtifRLtLqVvLzjBOpR6cZ49AoGl
 SiEIrM1IXQh4AqXqdOhIrPJyb9j4vuemDbZFmN8JsUusrSUrj2xDv4+nVy0A4TfAY57Q
 25Z60Hr0HnyCQH1NJq8q0sBeJYFy7SBIFISryBmPYNW5vkmz3ZISEiczHFk9+g+0DjDh
 HimmuNDhWQ9qfy4iRaQeWAYFj7CAdHbKle32/67QszjmQmP8T0i6FkrDvbCaHnbnJUlo
 TgsQ==
X-Gm-Message-State: AOAM530N4rm2FDFBJ6Zew7yZEgTSLfNlo2qvlcjf/7k5SL3eOPQ48Y7J
 yYLcOMSoOpMjimFcCIYys3B9f5SJO+pafxNbhzds6A==
X-Google-Smtp-Source: ABdhPJzKSqV1Gi1UlgbYvhfhhzAJhzoMLWm1wk0qWyoEZWQ8SzOsHAryTFB3hBKuSVL2OudI5vvGNyP4I3SnOTz3EzA=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr48680861ejb.382.1609346078070; 
 Wed, 30 Dec 2020 08:34:38 -0800 (PST)
MIME-Version: 1.0
References: <49c3d04e-a94c-cf77-4df9-5ceb8c9c7f80@physik.fu-berlin.de>
 <86690c16-3bc9-9c77-f720-64db14d0cf72@redhat.com>
 <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
 <559bbdfa-3876-ab22-445f-4bb59d9b4979@redhat.com>
In-Reply-To: <559bbdfa-3876-ab22-445f-4bb59d9b4979@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Dec 2020 16:34:27 +0000
Message-ID: <CAFEAcA-q=V2gfYtN=LvexhRq1o45SV_Ov1k0CdsdEN=Hj6uG9A@mail.gmail.com>
Subject: Re: Deprecation of the LM32 target
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Michael Walle <michael@walle.cc>, QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Dec 2020 at 10:38, Thomas Huth <thuth@redhat.com> wrote:
> On 26/12/2020 10.06, John Paul Adrian Glaubitz wrote:
> > I mean, the whole point of an emulator is being able to run existing code on modern hardware,
> > usually because the old hardware is no longer available. And as long as the target is
> > functional, I don't see a point in taking away the functionality.
>
> You also have to consider that it takes some effort to keep code up to date,
> e.g. if there is a bigger restructuring of the code base going on, you also
> have to work on neglected targets, too. If there is no active maintainer
> left anymore, it's quite a burden for all the other developers.
> So if there is no known user left (are *you* using lm32?), and there is no
> active maintainer anymore, it's IMHO adequate to mark a target as
> deprecated.

Right, the issue is not that the hardware being emulated is old,
it's that the code in QEMU to do that emulation is old and there's
no active maintainer for it and nobody helping to keep it up to
date with the rest of QEMU and its evolving APIs and practices.
"And we don't think there are likely to be any serious users either"
is just the cherry on the cake...

> If someone still wants to run old lm32 code, they still can use
> older versions of QEMU to do this.

Or they could put in the work to be the maintainer :-)

thanks
-- PMM


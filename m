Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F62FF3A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:56:27 +0100 (CET)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2f86-0006pL-Gg
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2f5y-0005nJ-5V
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:54:14 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2f5u-00006f-HA
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:54:13 -0500
Received: by mail-ej1-x636.google.com with SMTP id gx5so4119534ejb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zVGBH9q19uDS9L5jiexH+C7fisY5bY9lacUi9nMEZKo=;
 b=l2HxHTtGdTY2Eh2tV29T2AiU0yJ9Qhznwr45cdZSIQexEF5lQr1c4wiCeRXTAUObi/
 PWvb4fG+vRrHXr1awzJNp8CrEUt6XOwR29La+mLXUBE37p5zDs0kSO9TANRWoht37Q+J
 Q2ipLQ4fo2C/eVopwY+VOs51p0cGBczA8hCi3f4BCQRknq5LV+w8wdJckXHajxgFFY6U
 mIg0SrVbDmOplUF6cA9mJB2ephe8PSfVnLueBsOsr0VQrWCP8N7nIWc3QVpAPWaGvlB2
 xF8wDDHNf1rU2B9bYvSCE7blADZL/d3qjfSR/N+fMOES8kY1H6ElPeBOwnMVrCnOsQQP
 OhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zVGBH9q19uDS9L5jiexH+C7fisY5bY9lacUi9nMEZKo=;
 b=FI0kEwFAgCiwy9OrZWhQOFmf4e6J8E4bh0PhaOmtxpY942/roFrovYvOOko38ebKWE
 SdaW0A1JYdDM+8MI42YcDGleJg1wjAtFoGEfV73+yT7A08/g3u9AHUFtbcUYxXrF3zUG
 3yggzA838L46XxP6JtQhzGFj+bcIPYVKFCf9XZNBUXy4Uhbp4RBbZ/XkBFKUEpr5wJmx
 Q/dpnCtMDO2pxcOSCT0KmNgqE2520FoCTA/ClEIztNDtudOFxWTMcgPQgHoFWQmM7Por
 1xOibXlaeqy2HnFfIuAxPfJzMYjinKhSp0Nb8q3wZ5vk3wzndIC+44iUNk1fgQPamNSN
 1dug==
X-Gm-Message-State: AOAM530chRsIS7bu28Qs5Xp9rW5VK8jHSmm2xovnSFQUcGFqD6ICIOuj
 MhKzo5TU6Dt72GIVGHITfO4JOmZjBUW4lNFxYx/ytg==
X-Google-Smtp-Source: ABdhPJz4/5yLhKClOizyydFuE5q8sj8tYDXX23TMPV583LKA1wz9E0ttjI8ehOV9MZy9qIIpAsKbxQb4d71fLdlHuWk=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr613188ejd.250.1611255248742; 
 Thu, 21 Jan 2021 10:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-4-j@getutm.app>
In-Reply-To: <20210105022055.12113-4-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 18:53:57 +0000
Message-ID: <CAFEAcA-GArVcXbL6-r7jOsOzQ9SOiVByztzTpj+SUp0XahtNNw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] qemu: add support for iOS host
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 at 02:25, Joelle van Dyne <j@getutm.app> wrote:
>
> This introduces support for building for iOS hosts. When the correct Xcode
> toolchain is used, iOS host will be detected automatically.
>
> * block: disable features not supported by iOS sandbox
> * slirp: disable SMB features for iOS
> * osdep: disable system() calls for iOS

> +``ucontext`` support is broken on iOS. The implementation from ``libucontext``
> +is used instead.

Just a note since it came up in another thread today, but
looking at libucontext its aarch64 backend doesn't handle
the floating point registers. I think if the *context
routines don't save/restore the callee-saves fp regs
(v8-v15, FPCR) then it's liable to result in tricky-to-track
down bugs where some kept-in-a-callee-saves-fp-register data
from a function further up the callstack gets corrupted, depending
on what the compiler happens to do. It would be good to work with
the libucontext maintainers to add that functionality.

thanks
-- PMM


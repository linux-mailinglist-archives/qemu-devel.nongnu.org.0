Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF976399F11
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:37:47 +0200 (CEST)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokjS-0004dj-Pw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokib-0003ek-CC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:36:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokiZ-0004JP-7P
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:36:53 -0400
Received: by mail-ej1-x632.google.com with SMTP id h24so8528816ejy.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sltKCqmXoV+X7ECVkCUeY0u+Zfwzu5DyW+4NN+yQtXs=;
 b=Vn5aIndmZ38Z6KufLUUoVwgBGoYLlTUlFq0gn3iuMGSy+1hY+Zi5AhTgkR4+suMPYm
 U+XVMAxXKPeqkmotx4SEcYJCKWnZNJJwoirARf76mqBFcHn39bRqCtlyh+9rLR2TCSLf
 8RJ/YERwTnxqnkvgbydMa5uVXY5/xzR5ghD/bKvrKJpyM+3jM1Yqaq4Kh0iM3zmbyoF6
 EgeBe8MgGQ+j09PG+38agkN1uutyj2IEcRdgv8U1mrL/ixlY5qCy3uMlGl6WBFjvYk64
 UhqwvBGBOh2f9uR+1mq3+sHZ1pr2yvG3gFRrkxkWSNnm67SPgvLwR7XXA4RWIACmJ34C
 B7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sltKCqmXoV+X7ECVkCUeY0u+Zfwzu5DyW+4NN+yQtXs=;
 b=gCnCdPRTWjtQFlWYGvZwDQ5xC5xcG9Tff9kbERLzE6IqWt5nZMpBuzy0TnbvSMqPdZ
 6fMM7gc5RMH9+PkOFCwK4GLrz0azYoC9Lb7iuRmJKodmyyXHqSKj5jK0CqIVvt+1MNqY
 10RwmpwrdQSPWsLbtWWRo0fj2fvI1c2sPlK2c9Be2GuW4dYVjyBkEJT2rXmYa0R1ilKf
 PkndEzb3zIWC9xesTbFSXuu4C5bM8Ucti7BZrM/txx3QiQqweiM31mnDuYtd4skgOfDY
 cMQGXPB+Jsfg2Jka3DU8uqYzb+Sa27Rdk8TNbL9w8lYew/Nfp+suH0+n8RpPv6w02fw2
 AnMQ==
X-Gm-Message-State: AOAM533dTstuyRIav/BgCGzjWZUcP9Bkw/Eh3sNvMd+OccBcdOCd7O97
 FIgIrQxz2ds5T+FWuIeVNQzqcoFXu88VNo1Yy8g39w==
X-Google-Smtp-Source: ABdhPJyG2o5bISq/XbRFzU1Mes/oM0rEpIC36NHkYVDZxraMOZZqaJHzMwfzRDatoLvvkh2qZ+0z5DZCR1sLhYxUbdc=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr22839303ejm.85.1622716609408; 
 Thu, 03 Jun 2021 03:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 11:36:17 +0100
Message-ID: <CAFEAcA_=4A=WbLFXek44i-cmqBzmMtpW93Kvg8EqD5aBK9YEXA@mail.gmail.com>
Subject: Re: [PULL 00/42] ppc-for-6.1 queue 20210603
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 09:22, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 8c345b3e6a736d4985b2bca6f7f24b985900de63:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-06-02' into staging (2021-06-02 17:08:11 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210603
>
> for you to fetch changes up to eba3c766fe355a4e593c1ee6944770f80b68acad:
>
>   target/ppc: fix single-step exception regression (2021-06-03 18:10:31 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-06-03
>
> Next batch of ppc target patches.  Highlights are:
>  * A fix for a regression with single-step mode
>  * Start of moving ppc to use decodetree
>  * Implementation of some POWER10 64-bit prefixed instructions
>  * Several cleanups to softmmu code
>  * Continued progress towards allowing --disable-tcg
>  * Fix for the POWER PEF implementation
>  * Fix for LPCR handling of hotplugged CPUs
>  * Assorted other bugfixes and cleanups
>
> This patchset does contain a couple of changes to code outside my
> normal scope of maintainership, related to the removal of cpu_dump and
> cpu_statistics hooks.  ppc was the last target arch implementing these
> at all, and they didn't really do anything there either.  The patches
> should have relevant acks.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CD6980C6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKXY-0004r3-P4; Wed, 15 Feb 2023 11:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSKXX-0004qr-FF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:21:51 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSKXU-0004BB-Fn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:21:51 -0500
Received: by mail-pf1-x431.google.com with SMTP id bt14so6239716pfb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgcu2KTxDVUVuHafhq0CJ7VBe3lvTUk/WzUzvgOLuTQ=;
 b=WRXa/pQe3PrTcuM9F5E3oI605mOn3bw82sp0zhMorUXWECUHjZ3DW7f5/1Z1Xf3ezB
 S9/IQSX8CRERlUu1nQVVYEpfXCDnIK26VpaVEEFAUMHYRmcc4dDMCFVWRa6WqczsS5Xn
 4pqnwdidyLz4LnQNZOvTwNqqkC8+XtfVFAEVCQQEfG0jCCxIaVgMKV32+oTq//o5jlYD
 hM0RKZWXTw2kKxqRn5mJ24iLeYeFLxdd1eCgyaZCtNGp8OEM3LKhkMF45O5v83NZKf2r
 eylKiCw6eifjO9b1nBNPIqCixcs6TXp56Pr0YCyyq8pG7uLnT5LusTZjmzvmI+Lr1oH7
 d3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgcu2KTxDVUVuHafhq0CJ7VBe3lvTUk/WzUzvgOLuTQ=;
 b=WqnWDEpjC59cUYMRL6XoG0sZg+0CuOEG+JGuREznpML7prNaZPYL3753uxQbLj0QP8
 ZXdyIm69q0xkHKqb7kwmF8zXeEPgCA1zIIOzu7PSApnpYSD6PcR4Xx1rBwZZ0do5p1Ir
 V7Y1qSGAJjPh30055GUJliNP6OKMxbhmJSMLpTQchAYyA7lOZ01wIJevLzgTt6ROh/JZ
 2GSlW2dlWhWU5z8UxupGhc3PI+2nwu8urJUGebUuJiIMaIUlx78bkPLib1b1lEvEd8Wy
 97s8iVZLgiFsYEsA/w9y4YJDTKZJTi/wDgE6I2hTHHv13OUQCrUGBGtwTPL7ZCd8bj5D
 25DQ==
X-Gm-Message-State: AO0yUKWO6DrUgEJtqHdCUvPxJFMwYDdFCPu5USLDZkEjDGSRDxlSzIIK
 v25amtFEtLgkJr3r5LuoR/J7dFaiCXtaoBJd3za41g==
X-Google-Smtp-Source: AK7set+xROFpUkrFlDpPw67VhPOnpVl7iwVhpDRyFcqqAHg0Ort/SXeNORFjR0xBc4rMnkVlMOMssnfS1jC0iQ9gQss=
X-Received: by 2002:a63:34c8:0:b0:4fb:d300:c637 with SMTP id
 b191-20020a6334c8000000b004fbd300c637mr432533pga.6.1676478106038; Wed, 15 Feb
 2023 08:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20230215142503.90660-1-thuth@redhat.com>
 <Y+zzIV2e6UigEIze@redhat.com>
 <1ed8e614-d43c-3d7d-b320-27985b521667@redhat.com>
In-Reply-To: <1ed8e614-d43c-3d7d-b320-27985b521667@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Feb 2023 16:21:34 +0000
Message-ID: <CAFEAcA8qWR-zB_twK1V-fbq2=S+o4nK29JheEOeToGYUiosFuA@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Wed, 15 Feb 2023 at 15:33, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/02/2023 15.58, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Feb 15, 2023 at 03:25:03PM +0100, Thomas Huth wrote:
> >> The meson log files can get very big, especially if running the tests =
in
> >> verbose mode. So dumping those logs to the console was a bad idea, sin=
ce
> >> gitlab truncates the output if it is getting too big. Let's publish th=
e
> >> logs as artifacts instead. This has the disadvantage that you have to
> >> look up the logs on cirrus-ci.com now instead, but that's still better
> >> than not having the important part of the log at all since it got
> >> truncated.
> >
> > Having to go over to cirrus-ci.com is pretty awful user experiance,
> > especially as there's no direct link.
>
> It's not that bad, see e.g.:
>
>   https://gitlab.com/thuth/qemu/-/jobs/3775523498
>
> The log shows a link to cirrus-ci.com at the end:
>
>   Build failed: https://cirrus-ci.com/build/4811273133621248
>
> If you click on that URL, you've just got to go into the "build" and clic=
k
> through the build artifacts to get to the log that you want.

Could somebody write up some documentation for how to get from
"top level gitlab CI pipeline page" to "detailed logs for a
job failure", please? I'm finding that the UI for this (both
Cirrus and gitlab) is very non-obvious, so a writeup like
the above of "follow this link from the log, click this button,
go look at build artefact X" would be very helpful.
Somewhere in https://wiki.qemu.org/Merges is probably a
convenient place for thsi.

thanks
-- PMM


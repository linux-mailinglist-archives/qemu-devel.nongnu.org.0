Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501BD2FB5EF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:56:03 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pcA-0008Dl-EF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1paO-0007ak-2Q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:54:12 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1paM-0002dq-8h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:54:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id u19so21171997edx.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRKgAhLenCcz59EQmJJfYcBGLc4j8hacS9fEnVGBLnc=;
 b=nEYaKX+2dKjcOXMlZm7b2pEgUKflK179azIwH/qA3uk+lckS9X4l/LxsDq5VNA0DoN
 iIRWWkEEcxrmNNwCCQm8b2G2gASJe/Te6rPNvd2wsPN/S+WDFB0vLdQGbgrWPm9huydT
 BT/SLSI5dNl8krxlgA3h0QvZsyTQxjhS7EkM6xpHD86OrmhN7h24hjezmmFSY5amxHgk
 snhXKdpMBDj5GienbHe7m4S4up95XA4SQ8EgQgoSd+bcHE3m9r3HwV4dq/Hpmdc+5nlB
 L3j6wJkPurB7kCNxw5OE+CNMkc1gjkULyXrNj/iyq1/inbb+OLJN7SzpTdpBVPr01JYo
 nXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRKgAhLenCcz59EQmJJfYcBGLc4j8hacS9fEnVGBLnc=;
 b=IFOuQzCeMM844jIwcFbPgrk3jEWXC1jehGhFWkz7yYTaZXebYTalVEBYMbqQXwUV2Z
 Jq3I7ctnrZAViRx6Fwu9wMBVJlRgSfREskZE6n1xZWBup+NbX+vD8YGu9MJ9mQmCS1wv
 bivzM61sQjN1yEjP34SGXGQL7k6MjTI13JKcMW4yaMwfPnqHuMCjwVZWOHNWpPhZVdN6
 dzZkEi9QaStfKCrB2l4Jxbs0wlCjW50aQL+c9p+00+mvW+SbACVlVUAbm++zslAlrkZ1
 6gSPh6XUwi1YQhWBKifBxqyRp6gmD0PvxE6I91hanYzgPtDipEmOuWDPYwvgPnknTJp/
 Myfg==
X-Gm-Message-State: AOAM5334SaJfUXGV1nD725Mh44GR4XVesH+3Sqe5NhcOY84xlpS2Iw2T
 QehFZtd0fjUeMN+QYpz4Sh42EIVuwZkEeYXXvydD+g==
X-Google-Smtp-Source: ABdhPJycdWqh2gnCYrFI78NtKIOym4hpdgmf+N5BGBM/0pf57q0Y/XkeQcIONy910FjethW8vtqURruYVJy9dksh3T0=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr3025622edu.251.1611057248755; 
 Tue, 19 Jan 2021 03:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:53:57 +0000
Message-ID: <CAFEAcA8MTFhnAgv4wDr+brEydJEzP5OuaTH7yeQKiTPQ-U511Q@mail.gmail.com>
Subject: Re: [PULL 00/13] ppc-for-6.0 queue 20210119
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Tue, 19 Jan 2021 at 06:23, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f33:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-18 15:19:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210119
>
> for you to fetch changes up to 2a05350e90ba09b6f42f5cff81f4aa7580a998be:
>
>   spapr_cpu_core.c: use g_auto* in spapr_create_vcpu() (2021-01-19 10:20:29 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-01-19
>
> Next pull request for qemu-6.0.  Not a huge amount here, but it does
> have some important fixes from Greg Kurz.  Includes:
>
>  * A number of minor cleanups from Daniel Barboza (preliminaries for
>    some hotplug changes that are still under review)
>  * Improved handling of memory hotplug from Greg Kurz
>  * A number of fixes for sam460ex and other 440 based platforms from
>    Zolan Balaton
>  * Some fixes for the QOMification of the PPC 4xx UIC interrupt
>    controller from Peter Maydell


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


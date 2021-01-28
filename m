Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2C307622
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:28:55 +0100 (CET)
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Pu-0001Pr-JJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56P3-0000xP-05
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:28:01 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56Oz-0004Fw-NK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:28:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id dj23so6334877edb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=er6co6Q+S0QVJSaVVq2FL7fAShMEzeH0IL5Q199qsXY=;
 b=LIileOV4k/gVzUeJvmA8s3X/4cJ5oPcRvMS+fADoKXdMQyvmNrsDjJamitIUYlrNG+
 9aQvMMHXeMStgpmX3gz/u5As06+K5GtnGT7u64zrVAaw0zijnW/ZiowVtebSYPQAE9A+
 fenITmD11WDQU8pdIMtuoSpEy1WnhComH7P1PcoNFQHj/jIK3BYxJl4lPtXlZ3HghTbS
 SeUkQMTxcFMj39O7TeHYFjlGBVOatSLbbUtEURfoBoDC1FEYXnORYL/ea25D3OwhXdyY
 bHrKPKYJkMeEdzKHHMux/ogrE/JRiZgz+DfNh2yYLBgivXGWQ8lIIvkEY/NpjPIx4xV4
 NOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=er6co6Q+S0QVJSaVVq2FL7fAShMEzeH0IL5Q199qsXY=;
 b=VvSCHoYMit0KWzWtYN3ryN8Z9gRweVjd+QRvYGudiO7ZwkO4hO3BgbsjW+nIx4IFRp
 GNl+pmTo6j4T8y4ZTDLU66xLtQ0pDhVAphzSBJw5q/lzoKbBsWj3jlJk0o3lQyYcia+A
 QgwtUac5yJmFavyQN/NdHuTIZehSaEv6v6qrsmsaojdl9AusjBjEtSbenxOalDsQrTr6
 JsXq+Hh/c5Efs9BenuV7R1TBkdhh2JFnS0TJjKdpsNaOvimhcAyi5VW9o2Q3HZgM3AHg
 ycxp/NwJoOgbUDmjb+/bCLgwvfD2Gbv7UAPvWRWUNXGj/0N/zESxhMs0NP580SsSna03
 BVYQ==
X-Gm-Message-State: AOAM532KIr/OlCMO1uKD1ZX6mTiybwOT4UMSHr51PZBmRdSq1KSbL45L
 u3ZVWSxJwRdYUaOUR2WCw9awe+AHac+2gWqJ1gA/Qg==
X-Google-Smtp-Source: ABdhPJwHyW6e3Bgj/3xDHSizNEXMCTaoL5/5jI3M6TZg7fu1/wUSPtHDoa4L2zmJVoBbxVzmx4ilzhBK1Ut3eTLKQOE=
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14191970edb.146.1611836876141; 
 Thu, 28 Jan 2021 04:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:27:45 +0000
Message-ID: <CAFEAcA9nHHbe2RMFS8uhp4PR3=jtWb-ABARmzoAAipS7rk-mSQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] iOS and Apple Silicon host support
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 01:29, Joelle van Dyne <j@getutm.app> wrote:
>
> These set of changes brings QEMU TCG to iOS devices and future Apple Silicon
> devices. They were originally developed last year and have been working in the
> UTM app. Recently, we ported the changes to master, re-wrote a lot of the build
> script changes for meson, and broke up the patches into more distinct units.
>
> The bulk of the changes allow for cross-compiling for both iOS and macOS running
> Apple Silicon and adds feature detection for parts of QEMU that are not
> compatible with iOS.

Hi; more than half of this series has been reviewed, so given that
the patches are all more-or-less independent fixes I'm going to
take the reviewed patches into target-arm.next (which I'm planning to
do a pullreq for on Friday), so you don't have to keep carrying
those parts around as you revise the series.

Specifically, I'm taking:

>   configure: cross-compiling with empty cross_prefix
>   osdep: build with non-working system() function
>   darwin: remove redundant dependency declaration
>   darwin: fix cross-compiling for Darwin
>   configure: cross compile should use x86_64 cpu_family
>   darwin: detect CoreAudio for build
>   darwin: remove 64-bit build detection on 32-bit OS

thanks
-- PMM


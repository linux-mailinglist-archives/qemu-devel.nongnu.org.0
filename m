Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AD40B7CA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:19:49 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDy8-0006wI-9f
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQDwb-0005dj-H4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:18:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQDwZ-00016W-MC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:18:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id s24so344051wmh.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rUhAeX1MJtvs0qVHEobpFsdm3MQHDFQ7VT02h4tsPs=;
 b=cTOof267lH+mRcx8jYnpmDUEg3HUmYsBzRLx0mXsGORmKl8bZoUd0hfPqGf/6/qA7u
 v2dYhSIz3L5idGq+zyLSg1PEc+lYKiqaxAk1hbptblo8zEDCLl0fqzNgwBoyb7H/enIG
 xtvttyDd2edfcHiRXAXa6w0V45i1NvCADdjANJ8Y9lVW6Iy2trvnvOqECDbsCVNYsqUm
 QwUovXOETbEKQTgm9MpVhqVX9t8ldrYb/rPEtxPgToc8wCkd8Bd6IiWVgFD4um45GoP5
 xZHhD0bCEmvkSuYGCChugRj/sMyxh3d3mH4GipreO8sCwTduZlUgHBbF4qAR3zpEFPzi
 p9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rUhAeX1MJtvs0qVHEobpFsdm3MQHDFQ7VT02h4tsPs=;
 b=DMgR/fyG/KldBYsrn2eelmRlHzLWT8lUPVQh9h9XEPhVLJwKSVBEWg20X/zy50SaxE
 XhH7Ftou+LAxIOVLDJsG6VIUZSsa7bqEx2KYU8ABKHHlmWJOmfec0FhJtg5K2cNgNjR3
 P2mroir1D9GcUCHfb4kWX7TlZxf7M0Cs+/xKGzJtJ3wympt14o8ZI4ogNrScpZGH/ob5
 1738g9U2K6137m/6PDSi7cn5HbVWRFMygcTBlgK249dasAW2sg77SiTSxGXbxkJCopXy
 lFjgDgROaANhNBJ/oEjVJ+0x0G6YpyYdgDwv/VmooO+OClgtHEJ6FVN+njaDWhqmXDmt
 U9UQ==
X-Gm-Message-State: AOAM53094dizoQu6kfFvN4EOhLC1Ys7aMuP9tXWvydtm3OSRKF8bKOWc
 9AQB3qHycPfym19K3Z+81dyv1SpR1iiTLWC9wQxrEoJhmS8w8A==
X-Google-Smtp-Source: ABdhPJztoriBW/gqycugw3qBEIVXBlLZcsY8TM6+on1pbWFu3OTkmf6Vl2DjitGYpnKZP8rqnIbZ70guLD4NLM3ux6I=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr693604wmo.21.1631647090133; 
 Tue, 14 Sep 2021 12:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
In-Reply-To: <20210913101948.12600-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 20:17:19 +0100
Message-ID: <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 11:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we define a lot of jobs for our custom runners:
> for both aarch64 and s390x we have
>  - all-linux-static
>  - all
>  - alldbg
>  - clang (manual)
>  - tci
>  - notcg (manual)
>
> This is overkill.  The main reason to run on these hosts is to get
> coverage for the host architecture; we can leave the handling of
> differences like debug vs non-debug to the x86 CI jobs.
>
> The jobs are also generally running OK; they occasionally fail due to
> timeouts, which is likely because we're overloading the machine by
> asking it to run 4 CI jobs at once plus the ad-hoc CI.
>
> Remove the 'allow_failure' tag from all these jobs, and switch the
> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
> This will let us make the switch for s390x and aarch64 hosts from
> the ad-hoc CI to gitlab.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

It looks like this change has resulted in pipelines ending
up in a "blocked" state:

https://gitlab.com/qemu-project/qemu/-/pipelines

I'm not sure why this is -- is it perhaps because there were
other jobs that depended on the now-manual-only jobs ?
Can somebody suggest a fix ?

thanks
-- PMM


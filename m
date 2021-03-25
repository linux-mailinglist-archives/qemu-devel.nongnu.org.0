Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AA348E82
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:08:19 +0100 (CET)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNqc-0006wp-Qv
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPNpW-0006E3-16
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:07:10 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPNpQ-0001GW-B7
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:07:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y6so1948563eds.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/dbB5DMBBD2s75j1AzC5+hOeiOcLkhHspoGZPWPqeI=;
 b=i6uXrbazTpnRRzY12eCoO+nifSPN7MSDmUdfyPjah91GR7kWQ9U94m4HZHpb983aQi
 X9LflgJZ8FxAhLO6TnkZCHyMXq0tRUi0o2bAr/WGQ+k5n0RAXb7jVHawulF4VQJEhncG
 tCvj6K7WpNmEvaGfeL8d4zpLbvmIp9w92rftlhKmDOIUWIUibAnPfgfvUInhgHq7FRa2
 0f1FCkLtpmB0EDvsk5U6CIcE8Fa1G1rJJtepKwXJ6j55sKNC1UAhY1iCeWg1QxDVo1+k
 04s6rSadQw1c1Sef56wUhiegj8/x5vW587dFauP11jlxaQSnx2rfkpyY5OxxQhQO/w4b
 Z1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/dbB5DMBBD2s75j1AzC5+hOeiOcLkhHspoGZPWPqeI=;
 b=bMfPHFybln7f69voF2D8kCzJVri694yDF1XKXXGn3xNsrJQ5U4xj5ENUcTm5nt3R0Y
 Iz1T8cHBXt4Mayjxjp5F6f2NqV2mX5/pZlmdMr/dAsWiRDBVgIgPllbc9JV54ySJ04ES
 Wf13nnyJ+zAE2NZahHRdeRoakzjvkRcSml/fDBQcIJ7PvRmv38c8jik1H4CcV5Wp/OB4
 OfWGE30/preMoP68kYRmLnhN6RbxLezcTI/Lep3l/zzvOv2JCEFSeLMdTVARFcRhaW7H
 qhzT7Ld2y+fvsD0i/HAnnc/ilLPpcDYziAV+Havs1JVPf10ItfNKwmfj/kA5oOn8B0/u
 s+jg==
X-Gm-Message-State: AOAM531eoxy60tvW4L9CtRcj2KpThmHXKldLqHA5MJ7rHpITlpKlT8S5
 gbjAiTmnhBIQZHv9DD3+IqdbsWeChjaBsDnfPPRdiw==
X-Google-Smtp-Source: ABdhPJy7taMQtFZwq9EQnH+2gzxvq1tvW/Hv/lWGuc0KkrjrnBLgTREpapJZq6+JiG9FDtMMchbxPawsU7qi7YcNS88=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr8408363edu.52.1616670419438; 
 Thu, 25 Mar 2021 04:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
 <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
 <557c7ccc-ce30-a452-8904-590667298389@amsat.org>
 <CAFEAcA_GGr-BT713cWLbJCvMBdw_gn6+aMdPnb=5iN-eSP9nkw@mail.gmail.com>
 <a70af3b7-4500-edd3-9a85-242783b24b2a@redhat.com>
In-Reply-To: <a70af3b7-4500-edd3-9a85-242783b24b2a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Mar 2021 11:06:28 +0000
Message-ID: <CAFEAcA_A9_j_Fb94KL8KZcNxjaVQ_KCb5u=11Pgyu6=OTdE4JQ@mail.gmail.com>
Subject: Re: gitlab-ci: Only build /staging branch?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 11:05, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 25/03/21 11:34, Peter Maydell wrote:
> > It needs to be faster. Mostly I do check the gitlab CI pipeline
> > status, but in the run-up to getting rc0 out I stopped waiting
> > for the gitlab CI job to finish, because I was continually finding
> > that I kicked off a run, my local build-tests would complete within
> > an hour or so, and the gitlab CI jobs were still pending, barely
> > started, etc. Turnaround on testing a merge must be 90 minutes or
> > less, especially during release periods, because there are always
> > a huge number of merges that arrive for me to test in the last
> > couple of days before freeze.
>
> Perhaps we could script it so that if the pipeline passes the merge to
> master is done automatically.

That would be nice eventually, but we can't do it until the gitlab
CI is the *only* gating criterion.

thanks
-- PMM


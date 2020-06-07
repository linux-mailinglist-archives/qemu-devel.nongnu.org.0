Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555D1F0A50
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 09:04:49 +0200 (CEST)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhpMO-0002jr-Df
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 03:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sameid@google.com>) id 1jhpLV-0002A8-Jp
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 03:03:53 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sameid@google.com>) id 1jhpLU-0005qT-2D
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 03:03:53 -0400
Received: by mail-qt1-x842.google.com with SMTP id j32so12213035qte.10
 for <qemu-devel@nongnu.org>; Sun, 07 Jun 2020 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFzBLOI/JFMCOGOf8dosvehUCuveAJId2AtdDz723z4=;
 b=wTrmkGthkALH3ja5kLQxPrmFn3wnKEdmv8ttf0pOSbkSv5nszJ7wuKD9SFQ58wfRz+
 Ugpa7xxOgiKcJmoDwhxZr1Mw0jxaTJtJdqDVSzlhV+7TZ88eprN0u2UgmoYgdJ5S8pjx
 PNgS/cgqky9izX/v63cKF1rM1NocnsUkFIiTnhId4YeIwkU2ZQlJzhRiupCCHpbL3aB3
 gvRnvBZ2FOFglhDODDT0ImSk1J/xxv6RXSlLl++1tiQTB9Ky69ZkLmrVHvhRB5iDc3yR
 exOw4wXBAJn4c/olds6k7ms3o7++JndanuTctupqedytXH5QvWYCgR2ElBpF/uotyNI2
 8KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFzBLOI/JFMCOGOf8dosvehUCuveAJId2AtdDz723z4=;
 b=MyuT/pfzQRorxOcKAQSYbOtkp/L8mGXLxJgiG8Z+FOtUiTZ7xrRL+RO+GisvZjIbJz
 v77bVCEpfMloACfdLsgD+GVkBOlusmh11Yk6qWrCZ4322FnA5MhdZSUU8Say5IxwUJJ+
 gq/PYvM+MZJ06mEqjhVFHiwOqaXZdhdeyrdRn3xL0IbGtMKBAGWI1neuYJ4XD6gpnYJ+
 ont2PKuuEDsRmPr6GK3H+k301COx93Wu/h8CxooXaYuU7bIMUah8R6vbQLJhd4j5ZPez
 3dafnaI9KLH5JryfhA6BrS1ODclu0jBGfC6RJWusCcUbyIwLkE+RKV+roiWvNF62NQHi
 7kgg==
X-Gm-Message-State: AOAM531D4F9f6FEgGg9dyTBy0oxi9zACumYcXOz9SrFjdBxkVAzqRw9z
 0Xc0Dg7fEScN7+Wvyzb9FSbKR0TMD3+2Dx1lO2xFBg==
X-Google-Smtp-Source: ABdhPJwJJl205+T2C+Jyh4lVn3kfq/vPzuq3+aQUQgFn6VlaHVqZ0wLiSSMHL69LcMRQW5HDPm5EPvC0yioEoKyU6Nw=
X-Received: by 2002:aed:2252:: with SMTP id o18mr18490176qtc.258.1591513430519; 
 Sun, 07 Jun 2020 00:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200528101039.24600-7-thuth@redhat.com>
 <20200606100632.26442-1-sameid@google.com>
 <87mu5gct2j.fsf@linaro.org>
 <CAFr6bUnBLLdBK3Pxohynp6vp7qykbb_tNwq5-V6zu8B-vUUb+w@mail.gmail.com>
 <451d6048-8688-d51d-d94d-72e29238d514@redhat.com>
In-Reply-To: <451d6048-8688-d51d-d94d-72e29238d514@redhat.com>
From: Sam Eiderman <sameid@google.com>
Date: Sun, 7 Jun 2020 10:03:39 +0300
Message-ID: <CAFr6bUk2W0z41V5oN7qTiP9qJcsBrtf-yskA8U7RTBjNXmaq7g@mail.gmail.com>
Subject: Re: gitlab-ci: Do not use the standard container images from gitlab
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, crosa@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org, wainersm@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=sameid@google.com; helo=mail-qt1-x842.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see, thanks for the clarification.

However sometimes builds usually do tend to work on Ubuntu but fail to
work on Debian since it's not always a 1-1 (as in this case) - so you
might want to consider to keep testing Debian together with Ubuntu.

Regarding the Ubuntu 20 problem - have you tried "export
DEBIAN_FRONTEND=noninteractive"? didn't see it in the logs

Sam


On Sun, Jun 7, 2020 at 8:39 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/06/2020 14.38, Sam Eiderman wrote:
> > Thanks for the link
> >
> > I do believe that the correct approach for me is to rename
> > BITS_PER_LONG to __BITS_PER_LONG (I just added a sed command in my
> > Dockerfile) and move on with my particular usage, however I am just
> > wondering whether dropping debian10/ubuntu20 in the official qemu ci/
> > pipeline until it's fixed is the correct approach instead of keep
> > failing it until the error resolves, in a way we want to always know
> > on which OSs the compilation fails for visibility, no?
>
>  Hi,
>
> that bug was only one reason to move the pipelines to another OS. The
> other reason is that we are already extensively testing various Ubuntu
> (and thus Debian-based) versions in the Travis CI - but did not test any
> RPM-based distros in the CI yet. Since Travis is bound to Ubuntu, we can
> not test Fedora/CentOS there, thus the Gitlab CI pipelines have now been
> moved to RPM-based distros (except for the "build-user" pipeline which
> is still using Debian, and the "build-system1" which is now using Ubuntu
> 19.04 instead, so I think we still have a good mix there).
>
> Note that the problem with Ubuntu 20.04 is also something completely
> different: It hangs in an interactive prompt during update and waits for
> user input, so that the pipelines finally times out:
>
>  https://gitlab.com/huth/qemu/-/jobs/584573287#L800
>
> If you know a work-around for that, we can move the build-system1
> pipeline from 19.04 to 20.04 ... or if Debian gets finally fixed, we can
> also move that pipeline back to Debian. I'm fine either way, as long as
> the pipelines do not fail due to non-QEMU bugs in the distros.
>
>  Thomas
>


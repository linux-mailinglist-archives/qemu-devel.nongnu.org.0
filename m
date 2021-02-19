Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D36B31FC4A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:43:40 +0100 (CET)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7wR-0004HE-8Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD7BI-0003Xx-3W
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:54:57 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD7BE-0006iw-Vj
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:54:55 -0500
Received: by mail-ej1-x633.google.com with SMTP id jt13so13961395ejb.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XL7qgfbjHglDCOSC0NJ3nmzhkeQ5rB15rTG241dNdYk=;
 b=hPrjHzp0NxFuCzeaXdmY3NZ+4AGnDhLuwf4kvzrCk0YAFaMidU8PwzXQtmDR5PUUvY
 kp9YKo1Em240UPFo+qmG4/XS2E9NAM4t11SpSheR5q/CI2lH34wPmg+Ldrz6brbc//iK
 mM97AwoVCKUACOdpzmX8aerRSqoOxQYm83idaL5bBUfnW3rV0ZuPwNhXIjy5KnhARy5c
 T0Ty5uO2/T3AwgvcWCd4cKiAp5JbJOqUC+YlnIUwFcjIx6ncsirrS0EMeyA+IjqMQayP
 stChZa0q4FnVwbFQknVY9LEU3YdU4PtcHtOLVQrnxcoIFuRcteIMmFC7Y3SRLsl6WhDJ
 zlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XL7qgfbjHglDCOSC0NJ3nmzhkeQ5rB15rTG241dNdYk=;
 b=DwY4p2xnwuNLfYWBLtOnUstpsJW0qiedT6qMM+87kJgVgHe3rXGk4e2R/G9R32paT2
 3G+aD1EXw12+NPYUNb89hPeMTyBEMUmrJ5Gp4pLEOfEcCsdQ/GiyXezlG9cxSzq6ZsbP
 r3+p5hFd4mimMVr267M/vylvv6tp1jrmPhwB94FobGO2cdk43Qw1CG4xMn8mCYk8517/
 rL2iOVh3a3zMer9Y+5s5y130XfdjyxgaH8A5qr3N+0uQxAr9xLm8vPK5UhEkOMV9dHuq
 P09yeRFGN9rPNVU2T5czzE0svllzBIj28p2rbxXKNNvMoJ+5pD4XgbVk0O2VWMP3G5Or
 yQhg==
X-Gm-Message-State: AOAM533R59WeA5vS4REs0m2PRs/mvnH8zDXq3R4To+0JsFkWTb1jUmu0
 8tlIRQ9oNJ+dcglu3HR2GVVE59A4efQ9IjgEnmKo4g==
X-Google-Smtp-Source: ABdhPJxy5R4kMjb4pHWlD3XkKM/5fgjqiG6O25EPWOqPwG7fTRc1actEtQScCteT7jgJdrY24n/muLBrPXIp8xegmhg=
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr6162766ejb.482.1613746491634; 
 Fri, 19 Feb 2021 06:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20210218232415.1001078-1-ehabkost@redhat.com>
 <20210218233807.GI760746@habkost.net>
In-Reply-To: <20210218233807.GI760746@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 14:54:40 +0000
Message-ID: <CAFEAcA9g+=Sv1BX=oV_dj9VV8Jr47ykebxToTUQa3AMaD4Ezdg@mail.gmail.com>
Subject: Re: [PULL 0/3] Machine and x86 queue, 2021-02-18
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Moger, Babu" <Babu.Moger@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 23:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Thu, Feb 18, 2021 at 06:24:12PM -0500, Eduardo Habkost wrote:
> > I'm hugely behind in backlog of qemu-devel messages and patches
> > to queue/review (my apologies to all waiting for something from
> > me).  I'm flushing the few patches I had queued so they don't get
> > stale.
> >
> > The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:
> >
> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
> >
> > for you to fetch changes up to bf475162d70a16a6cef478272aa32be1025aa72a:
> >
> >   hostmem: Don't report pmem attribute if unsupported (2021-02-18 16:43:17 -0500)
>
> My apologies, a corrected version of the pull request tag was
> pushed, with the correct version of the EPYC-Milan patch:
>
> The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to def835f0da0d153b397071e6bb8f2b46f51f96b4:
>
>   hostmem: Don't report pmem attribute if unsupported (2021-02-18 18:34:47 -0500)
>
> ----------------------------------------------------------------
> Machine and x86 queue, 2021-02-18
>
> Feature:
> * i386: Add the support for AMD EPYC 3rd generation processors
>   (Babu Moger)
>
> Bug fix:
> * hostmem: Don't report pmem attribute if unsupported
>   (Michal Privoznik)
>
> Cleanup:
> * device-crash-test: Remove problematic language
>   (Eduardo Habkost)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


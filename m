Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7465FDD0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 10:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDixc-0001dH-Bj; Fri, 06 Jan 2023 04:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDixX-0001cz-IG
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:24:19 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDixU-0005y0-BE
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:24:18 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qk9so2270910ejc.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 01:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q5oFPkgbg5XCh1JAi1izArKLx+GCpkCeR4BsXQBWznM=;
 b=Ros/AYRmblVjGOrDzXMBhcTJsh8ro1UQa81WjK3Ybi+TjKuv8GfzMxpqMUx7b3jAj3
 QuM+e2bMs3tNgEZ0JsFL7ZlFvaoe4e14DKIEvqRM05nI9l/MAcwbtV3q2YMPHNtxuLn+
 feEYJgTJXNo9I2lx/kzqnh6nyWjhJJ8pAkTmPoy9hRK3gjja0UDGnjVcyD4ZKv7jfBca
 L6tZlGd47FOEjH03X7U6G5+ePmCIA5oMJ2bszjsqruNswRneGNeyF6nbU8RfZaBUbmD9
 8DD3DWEm1ygrCafFBr6JblfXXjt8YZplos/Hg2qrQJlWOLDaKCEjmdbivrx8/I9NxSsP
 nsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q5oFPkgbg5XCh1JAi1izArKLx+GCpkCeR4BsXQBWznM=;
 b=ykoZ+a2C7OXVEwbE3/O9AcDb7eE5PIk04P3lKf0YX1iwQc19Hbrf3oCxXYTmX3NisH
 GUeYOBiDR/v8mTpYlZsTlUVh2s6GhUVBS1VQmpz6CU1tjV/bGVWIndVw5SFTtJi6e530
 SsOtHOABsYBGnDTay8UR3jrgU1D5DGotRZne3J/AFTsdulF4PS0oHjMyPBMWh5FZrbar
 K3bOfzJdGtshG+3CZ3KIg61lUBige8Lr8047QCzIe205FPbmOVWXADFYhSKnt4+bM56O
 1HZEKJxOpU41OmDswnf+sppV2V1Nala9XKpRzcmn2SXdBQIiSHv6xhIsyeJBEMtFOng4
 WCtQ==
X-Gm-Message-State: AFqh2kpUhoEmLv6gmS07KmUxwJcaA+bczdOZTQuWiI142UmnTtAlKLLB
 AP2NcH0DzlIktyYEevNuwPSBsHsemEaaLrqVrOw=
X-Google-Smtp-Source: AMrXdXsZ/y9LLmMCoz2+IK5dBi4AFYpyDQlm1Vmc+BBj6uf6k2DiVXNvK77UUtjiJyoYay0ltAJTZcN9dAIQk+fbJdQ=
X-Received: by 2002:a17:907:a08d:b0:846:8c9a:68a3 with SMTP id
 hu13-20020a170907a08d00b008468c9a68a3mr2767535ejc.217.1672997052976; Fri, 06
 Jan 2023 01:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230104123559.277586-1-thuth@redhat.com>
 <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
 <46726378-d075-e77a-5439-bbfa822f70fd@redhat.com>
 <b3fe53d9-67c5-9e22-d5e7-fa98cac5cd58@redhat.com>
In-Reply-To: <b3fe53d9-67c5-9e22-d5e7-fa98cac5cd58@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Jan 2023 17:24:01 +0800
Message-ID: <CAEUhbmUsvseOFDru-Hnw4co-+VNKHDPKne_-Dpj1jPD03w=VnQ@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jan 6, 2023 at 3:35 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 05/01/2023 09.34, Thomas Huth wrote:
> > On 04/01/2023 23.01, Peter Maydell wrote:
> >> On Wed, 4 Jan 2023 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
> >>>
> >>> The windows jobs (especially the 32-bit job) recently started to
> >>> hit the timeout limit. Bump it a little bit to ease the situation
> >>> (80 minutes is quite long already - OTOH, these jobs do not have to
> >>> wait for a job from the container stage to finish, so this should
> >>> still be OK).
> >>>
> >>> Additionally, some update on the container side recently enabled
> >>> OpenGL in these jobs - but the corresponding code fails to compile.
> >>> Thus disable OpenGL here for the time being until someone figured
> >>> out the proper fix in the shader code for this.
> >>>
> >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >>> ---
> >>>   Now that the timeout and OpenGL problems are gone, the 64-bit is
> >>>   working fine for me again. However, I'm still seeing random issues
> >>>   with the 32-bit job ... not sure whether it's a problem on the
> >>>   QEMU side or whether the builders are currently instable, since
> >>>   the issues do not reproduce reliably...
> >>>
> >>>   .gitlab-ci.d/windows.yml | 7 ++++---
> >>>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> Thanks; applied to master on the assumption it will improve the
> >> CI situation. I found that the msys2-32bit job still timed out
> >> at 1h20, though:
> >>
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3555245586
> >
> > I just gave it a try again, too, and for me, it finished within 65 minutes:
> >
> >   https://gitlab.com/thuth/qemu/-/jobs/3557600268
> >
> > ... let's keep looking for a while, maybe it's ok in most cases now, but if
> > not, we have to consider something else.
>
> Ok, so after I've been struggling with a failing msys2-32bit job for my new
> upcoming pull request the last two days (I thought I had a bad patch in
> there), where I had some problems with the test-hmp and qom-test qtests,
> I've come up with a new theory after looking at this CI run from the
> qemu-project staging branch and seeing that these tests are also failing there:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/3558798544
>   https://gitlab.com/qemu-project/qemu/-/jobs/3560870904
>
> That might also explain the timed-out job that you have seen earlier, Peter,
> it was likely a hanging qom-test since that seems to be the first test to be
> executed during the "make check" there.
>
> So the qtests for Windows are definitely not ready for the CI yet (after
> we've enabled them just in December). I think it's best to disable them
> there again completely until the issues are understood and fixed.
>

I cannot reproduce the test failures of both tests (test-hmp and
qom-test) with w32 executables. Neither did the w64 executables.

My testing repo is at commit d1852caab131ea898134fdcea8c14bc2ee75fbe9.

Regards,
Bin


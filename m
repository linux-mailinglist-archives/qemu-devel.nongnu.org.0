Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D71315031
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:32:25 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9T7w-0004YC-DP
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9T5k-0003Cl-8A
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:30:08 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9T5i-0004VE-Ij
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:30:07 -0500
Received: by mail-oi1-f172.google.com with SMTP id l3so9454522oii.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dt75JNJB7okdEvOssRLYA5SIXJLieWuktKT1rR6kU8g=;
 b=OqSrP5Kf+gwvVp1swRauR9Xe5As9cDrXd0sL9njaJXhaxMbkF/xvnWnAFCoKGzMAVD
 iMpyaPCp6HR2ZIn23gr5hh0Plzrd3FRWGF5ZNzYYZcljlSsGetv46u/9VF2nT3Hpw/mV
 +Bz8mdNJFlRsIJx0bPpkku+1C9jGII1Ta84CaXRq0p0Pj3Ak4kqWUJGVcVYeCAUrS01n
 5+HeVwpVRtAggITD+aVS9EP+CvaCZvquEbH4a+uoYbMvDJLM1yM9C/akd21R1phIwMUy
 7txrGBNvgHxs7XLa5AZB4wzA5XXFbH6Vp8TSS1OMwzaERUDr0bgdHkY8r/B8kd7luGRo
 UgvQ==
X-Gm-Message-State: AOAM532S4HjEGDDjzVGtlruQ9Y1uT+mBvpkgEXv7qRC1KLTnorVmk6pX
 36QCx5xW+Q5NHgSsKo4oYKSQ+U7+5cAoh74rKzs=
X-Google-Smtp-Source: ABdhPJwPEobtlczKOTOeQ/Z81Jc3r6ViPWIGov/768Gu/5mQUUbd5A0b8H1yIsuk+HMrQJfta39ajPCSS7wMyVx3Cgg=
X-Received: by 2002:aca:5e84:: with SMTP id s126mr2437885oib.175.1612877403896; 
 Tue, 09 Feb 2021 05:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
In-Reply-To: <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 9 Feb 2021 14:29:52 +0100
Message-ID: <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 1:53 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> On 2/7/21 9:12 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Travis-CI seems to have enforced memory limit on containers,
> > and the 'GCC check-tcg' job started to fail on AArch64 [*]:
> >
> >    [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
> >    FAILED: libcommon.fa.p/disas_nanomips.cpp.o
> >    {standard input}: Assembler messages:
> >    {standard input}:577781: Warning: end of file not at end of a line; =
newline inserted
> >    {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
> >    {standard input}: Error: open CFI at the end of file; missing .cfi_e=
ndproc directive
> >    c++: fatal error: Killed signal terminated program cc1plus
> >    compilation terminated.
> >
> > Until we have a replacement for this job on Gitlab-CI, disable
> > compilation of C++ files by forcing the c++ compiler to /bin/false
> > so Meson build system can not detect it:
> >
> >    $ ../configure --cxx=3D/bin/false
> >
> >    Compilation
> >                         C compiler: cc
> >                    Host C compiler: cc
> >                       C++ compiler: NO
> >
> > [*] https://travis-ci.org/github/qemu/qemu/jobs/757819402#L3754
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > v3: Aarch -> AArch
> > v2: Link to first line with error, describe Meson
> >
> > Supersedes: <20210206200537.2249362-1-f4bug@amsat.org>
> > ---
> >   .travis.yml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
>
>
> Either disable then migrate to gitlab or going straight to the later,
> works for me.

Migration of this job is pending of Cleber's possibility to add an AArch64
runner to Gitlab-CI, right? Then we need someone to support and maintain
the hardware... I don't think anybody volunteered.
Meanwhile we get a replacement I agree with Daniel [1] we should stop
spending time on Travis-CI and simply remove it, along with AArch64 and
s390x coverage.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg780608.html


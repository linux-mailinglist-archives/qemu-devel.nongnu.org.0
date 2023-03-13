Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C76B72BE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbebE-0001ss-2k; Mon, 13 Mar 2023 05:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbeb9-0001s8-SG
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:36:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbeb7-0006Bm-4D
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:36:07 -0400
Received: by mail-ed1-x536.google.com with SMTP id o12so45962310edb.9
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678700163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEagsX9/QPvX5/jUXLfB/2mQockE5naDrIMR9X5hg7g=;
 b=G+H5E2qhjIMBOIAOcWHHDEcQd5jCZFkjyS/6woKuWU0p3Bz3SgUtbvOAaRHOYs2tlM
 2unyA6MmK/c8xpT4JCIVcqv4EUrj302XQpSbZ4yDbfM3UI52TS6x310SPVIMvVMezbsH
 Qd7R1Z+5TWdNjrMurtUL5C3y4FfGt9leA1rqrHsxVGegSIEpd1t6zYfk7KYyPZnJPaSE
 9OUQTxWwpq5Ga5sWY7tTxZBSdme0r3Hw7DqJezuw8ZACGa7IW4wjssuhZYxubhs4rgBF
 MziYFif9ZPMPuWb3tGnrQchFFyeZkLrvmyvofiEH76LKXe93NDShqHprnC41Ukr3JZoL
 EMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEagsX9/QPvX5/jUXLfB/2mQockE5naDrIMR9X5hg7g=;
 b=flksTa+eVr9t4cCHgdu6dZi47j8kDZRXYEvvkCx79gCeEKos6BapKJWUZSZMbyQzlu
 B3RZcF4fMqb0tC37wL/d4i/HlMe5zqIUbq8kvytllp8C/h4GbqakkB03SeDMpk0z0RhP
 TR7sSP0F2l2R0Bg/Re8ULpsLPQQzK72r84KN0IIcSqN5d3A/I7PUEDpgbSPxXCdmxj8j
 c7v/2zCxdelNVsOJH7Lw+Tl0MDLSYUqdLN9cLNtfV9gydwrI0VJDz7SKfGA0hei8vSR9
 NbofljhpC05Lf0Rkt7Tu0t5rsQ6HbxrwapAvynCGUP10CwIfmU7OO1wjYknpM378aMTE
 gSKg==
X-Gm-Message-State: AO0yUKU9R3WhzzQteA22LIpOP/kvXaCocjEx1Nv6LEkiHqye77kqzASv
 TQr7EKpj/caZRhEWc5hU9eVqRAM3cO8cMp77LgM=
X-Google-Smtp-Source: AK7set9xrm/j25f+3QJsLzk0rPr8ZegkkM4CJ818dnBmxPx6vVWw7EcO7s52w09/XWXHoW5lJzpnlkyAhTvZIFDwSHM=
X-Received: by 2002:a17:906:8548:b0:926:5020:1421 with SMTP id
 h8-20020a170906854800b0092650201421mr2015412ejy.9.1678700163012; Mon, 13 Mar
 2023 02:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
 <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
 <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
 <5f1e8a9e-d19b-c9c5-ed07-7393de520b36@linaro.org>
In-Reply-To: <5f1e8a9e-d19b-c9c5-ed07-7393de520b36@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 13 Mar 2023 17:35:51 +0800
Message-ID: <CAEUhbmX1sO4YBbQZ3HtMh+LEtO0q68zxekXzCCsjG1xC=yS46w@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Simon Glass <sjg@chromium.org>, Beraldo Leal <bleal@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?UGF3ZcWCIFBvxYJhd3NraQ==?= <ppolawsk@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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

Hi Philippe,

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 13/3/23 03:09, Bin Meng wrote:
> > On Fri, Mar 10, 2023 at 9:50=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> On 10/3/23 14:38, Peter Maydell wrote:
> >>> On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro.org> wrote:
> >>>>
> >>>> When we introduced this Gitlab-CI job in commit 71920809ce
> >>>> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
> >>>> the naive plan was to have reproducible binaries by downloading
> >>>> what this job would build, testing it and eventually committing
> >>>> it. With retrospective, nothing happened 3 years later and this
> >>>> job is just bitrotting:
> >>>>
> >>>>     Step 1/3 : FROM ubuntu:18.04
> >>>>     18.04: Pulling from library/ubuntu
> >>>>     mediaType in manifest should be
> >>>>     'application/vnd.docker.distribution.manifest.v2+json' not
> >>>>     'application/vnd.oci.image.manifest.v1+json'
> >>>>
> >>>> Remove this job to avoid wasting maintenance and CI ressources.
> >>>
> >>> Does the same thing hold for the opensbi job ?
> >>
> >> Cc'ing Bin, I have no idea.
> >>
> >
> > The OpenSBI job now builds fine. I have no preference on keeping vs.
> > removing it.
> >
> > I remember our previous goal was to create CI jobs for every pc-bios
> > image but apparently that never happened.
>
> Yes, and I don't see interest in the community (neither worry that
> pc-bios/ images committed are built on each maintainer workstations).
>
> If it isn't consumed by QEMU, then better remove that job and save
> precious CI minutes. I presume OpenSBI itself is already tested
> by its mainstream project.

Not sure what does "consumed" here mean?

QEMU uses OpenSBI images on RISC-V machines by default.

Regards,
Bin


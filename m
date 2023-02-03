Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06286893BD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:31:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsP8-0004jm-2L; Fri, 03 Feb 2023 04:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNsP5-0004iG-W3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 04:30:44 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNsP4-0005hR-C2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 04:30:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id m13so4634119plx.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 01:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0169ncvA0yZAo3BpMKNXjIv7PWTKjnoOsKRE/CESMTE=;
 b=LyROLDiE0qMMEbzSEEvEa9XOL24L28mdqqtFxHCroH5KFV1RySGch72epV+vQxNKJE
 BH3BQeTwmnfSgmuTCYqe8TRuhV0D28xNK7cTt9vrjZyXI97YG27WPyKYneXfFRrcfgjr
 wxAA1RrYSPAqi2tLUKcuHFdMFFhX1cJdgNUbmM8uWRmEEC9MOhhDso5YJMHej4fhBKpc
 Ee08nmv1TVGcZ311Hxbg2YKsbTcAswP+DZJ2jsrK4jltQXHQbvwcY5s1/8snU1cZGDuv
 heSNrtIvTLmg1Dpf2/PxNjaPl6gYIkbs/qaShyiY5/w1OgOMBb0sb0//toteAbTv0xRX
 Iccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0169ncvA0yZAo3BpMKNXjIv7PWTKjnoOsKRE/CESMTE=;
 b=z8r3LEy9jIwQqpO4Xp6ic/Da+DZhcB/+j4vmA7lHYiqn40nrYwXz+i4pMky9/nPMJk
 3gsLW3aidICxjWN9xZaPWBpqQ2EP7jEDCmZOZtk/cNGQs74A3K7eMKUB1T/Kj2THbTXG
 WPAxKi1Ah84RbsMGmJUNS7HpzQSnaZJ2VsOv91ItKOVi/xDyJ/tzhsYufhXn1DOTScQM
 MKGEyl/wxp4x//0wiPOyWROW+gIqhESuYNxCS1hGKvisiZXX99eQGz+NM+Xm2mDuxt2W
 h43IEAFxw/lrI8j+8nh2vrH8le0aKeMmXT6FPFHTnqo3NvAVkh4SqArf2X3AZZW4YMWJ
 vIww==
X-Gm-Message-State: AO0yUKVmr1GtDp465i/RVHpJmb9m3FBkd92RJwL8pbUhnTdyuFF+5bSj
 NGMv140HxtDj4dKQGaQwRW4F8WpEW8LPup4k7n705w==
X-Google-Smtp-Source: AK7set/71+dB+QEVSk0/PqtCoSlKVJDfxkdLjTakVHFAysgAWhw8jQZ7V/t/SI6TFWFhf4+UK0+008gj6Q0VgVj+IuY=
X-Received: by 2002:a17:90a:4eca:b0:230:7d5a:3926 with SMTP id
 v10-20020a17090a4eca00b002307d5a3926mr159409pjl.137.1675416640861; Fri, 03
 Feb 2023 01:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20230202160109.2061994-1-alex.bennee@linaro.org>
In-Reply-To: <20230202160109.2061994-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 09:30:29 +0000
Message-ID: <CAFEAcA9=v-bJj=cxQS3-9n7NDbxfcJ4eO7E9bsCXecnjROOXGg@mail.gmail.com>
Subject: Re: [PULL v2 00/36] Testing, docs, semihosting and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

On Thu, 2 Feb 2023 at 16:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 026817fb69414c9d3909d8b1a209f90180d777=
d6:
>
>   Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into s=
taging (2023-02-01 16:15:56 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-jan-omnibus-020223-1
>
> for you to fetch changes up to b3ca9646b9a5c44dfd110c5db9b4a8b8497de34e:
>
>   gitlab: cut even more from cross-win64-system build (2023-02-02 13:25:2=
7 +0000)
>
> ----------------------------------------------------------------
> Testing, docs, semihosting and plugin updates
>
>   - update playbooks for custom runners
>   - add section timing support to gitlab
>   - upgrade fedora images to 37
>   - purge perl from the build system and deps
>   - disable unstable tests in CI
>   - improve intro, emulation and semihosting docs
>   - semihosting bug fix and O_BINARY default
>   - add memory-sve test
>   - fix some races in qht
>   - improve plugin handling of memory helpers
>   - optimise plugin hooks
>   - fix some plugin deadlocks
>   - reduce win64-cross build time by dropping some targets


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


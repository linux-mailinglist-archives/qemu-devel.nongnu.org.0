Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0A6B6D57
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 03:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbXdg-0006kb-Ax; Sun, 12 Mar 2023 22:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbXdd-0006kI-Tg
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:10:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbXdc-0002N4-EK
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:10:13 -0400
Received: by mail-ed1-x534.google.com with SMTP id cn21so12631640edb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 19:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678673410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hv73GzM05i0RanFnM+8pOxo8NV20DLRcHo5Yv7HDOok=;
 b=YMnlhO2cw+SooZ0hzY5gN3y63h/G/U8/gsLDeg3x4kbpLBBbIcipevwAhWsNGKAvvf
 S7b2KZx1wZE1OdZoRnVBL3nKwX5LClL74w8K47QzbEHilx4B34pPZeydzdjMSPtF2QBk
 OSQwlGBJvupLsmF3nsycc6O2WD8865xRleKC1jf5mXriLKIA9sqjvRfsyvJjaIp7yvWD
 yE/WrOiALUSZW5shAXEBKOiY7oWHktgLFrPxP1hoCambvxr+Q5Py6RAdza5d5YjqfIAO
 5dzd2gZOuUA1ZpX4JRw/lyJpnokJI+UgofpZElJ8l/2jvkKmA4CjlHV67qEN86msy9kz
 Mymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678673410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hv73GzM05i0RanFnM+8pOxo8NV20DLRcHo5Yv7HDOok=;
 b=CjEFUfXUReVk+UJRosAk9HeyrWZqnu9rJhTwRR0EYC6pBMmbCtBd5rOMNibV+eRwz2
 q4eODidKxTkjb3D47yChToRKPwA6MNRhrwGdcnRV4otEj/dy0xg0nbyCQK9iLffeJOsU
 3mRq0iddeIxHMx2CFiloxoiAxh8o13MN+qGrFdORS7qqsOFCcTaKEqb9B2FE8uLpTxGN
 dqe5jpMdtxIEX7bCw8hLLGivBchtxg9r3B+L9k5FqeKQLKEno9nPNHfq5wtdrZX0SUi2
 BQ9bdVJBn1+wltdEnOsV3QtbXTjB8aOqZL7a+nqtlUN/4V+Vw+3KVyB17Z94xSC+d4rM
 nKSw==
X-Gm-Message-State: AO0yUKXRCRQBrP8dsysY3smkvSSign2Ac6gAp9vr4H00DNLObiecGxCf
 hRjwiZ4t/Le/Gi3su7DHjm1raCzYcwCjouLAqNQ=
X-Google-Smtp-Source: AK7set/7sidACYthND1fSvNSD2DCrDyUnDK0DV9+NiMvAWXj0gbgSX1f77zGX9g0IMGqDb1AmCVcOOwbLBvuQNyaIr8=
X-Received: by 2002:a17:906:1749:b0:8b1:2fff:8689 with SMTP id
 d9-20020a170906174900b008b12fff8689mr16794901eje.6.1678673410017; Sun, 12 Mar
 2023 19:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
 <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
In-Reply-To: <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 13 Mar 2023 10:09:58 +0800
Message-ID: <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Simon Glass <sjg@chromium.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?UGF3ZcWCIFBvxYJhd3NraQ==?= <ppolawsk@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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

On Fri, Mar 10, 2023 at 9:50=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 10/3/23 14:38, Peter Maydell wrote:
> > On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> When we introduced this Gitlab-CI job in commit 71920809ce
> >> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
> >> the naive plan was to have reproducible binaries by downloading
> >> what this job would build, testing it and eventually committing
> >> it. With retrospective, nothing happened 3 years later and this
> >> job is just bitrotting:
> >>
> >>    Step 1/3 : FROM ubuntu:18.04
> >>    18.04: Pulling from library/ubuntu
> >>    mediaType in manifest should be
> >>    'application/vnd.docker.distribution.manifest.v2+json' not
> >>    'application/vnd.oci.image.manifest.v1+json'
> >>
> >> Remove this job to avoid wasting maintenance and CI ressources.
> >
> > Does the same thing hold for the opensbi job ?
>
> Cc'ing Bin, I have no idea.
>

The OpenSBI job now builds fine. I have no preference on keeping vs.
removing it.

I remember our previous goal was to create CI jobs for every pc-bios
image but apparently that never happened.

Regards,
Bin


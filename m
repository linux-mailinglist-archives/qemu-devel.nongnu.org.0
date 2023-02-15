Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550C69838D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMeG-0001A5-2b; Wed, 15 Feb 2023 13:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSMdy-00016A-PT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:36:39 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSMdv-0004gs-IZ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:36:37 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so13194517pgh.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676486194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5f38SQLrOZK6horc9eNanKUnXYXGFgYD6/NQvGLUHzY=;
 b=C3z0Vu+4fSas/Kpr7emQeOnxo475nATK5FU0QPn4FEMenbfCCc9SwivZxDw7WrrA74
 A9UA5zZzHstE0m5czb8wxQnNkdpOlk8f8UJiepSoWBW5bxBOj9cLCnCk/RXi75+d3klV
 W0xfQJGzFsI+GAwBTb+RefUjhsMjMTS6UgIpJn9Hwj2XAxrIiYBZNoMKEfuJVRHsrhnC
 CPJYT5B00gK722Sb6fE/AtF6/R0w9Lb54HSWaNTTavRr0l0uUApvZ2d4Cy+fs1ch+MnX
 hXNv0I0MuNUh2wrtT2IKI1oO/P4YZmVn28F+R8MeAzXzkRllAV5N5WPwaieTZFKggVHg
 J3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676486194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5f38SQLrOZK6horc9eNanKUnXYXGFgYD6/NQvGLUHzY=;
 b=ZPHSxOCxYi+4uS7YwcVpBpqnv58Q4oMvZgVIfj6TVQVWjDuOR0Sc6faPFJcIPwR5lI
 C7cNrgDUo/4MvR0PRyGNFseh9j1FLCq9/ceM7Xbzm6Ai74yf3XpuR4q77BGsNJMFkd8l
 prDTPKgp0qKrNNdYdhDbTXpbmPZxHnQvCfnvTJjemO61i7m9wTrz4fK/6gDKVFs7vNfD
 wg/JOKG4KISFlk7qQ5DL5FxysXRG6JaSDi92prqEWJ9AioaSQf8a0mOuaEgoWvMfXZki
 ixBn6vOS2rOnvRu++aeHcK1PmnF2fNvhufEK7gidIh1B1eLDXIZoteOIUSDaYhwAYRiA
 czig==
X-Gm-Message-State: AO0yUKXkhzC2NmQQNaGYCPnHYPG4930KWeSQ+MfFR7a2WonsaBoQK23c
 eJUyU4Jr/Es6RY910wNRyxcbpT1qw+/+gzoavQaPOw==
X-Google-Smtp-Source: AK7set/l8a7I0aSgSy0eKlrcNxQCkrS0QDeZtcCYguprVVFLJviC9lstxVffijKHLPihxDppr4Mjeo7X1xMiQREzCLk=
X-Received: by 2002:a62:1bd7:0:b0:593:fa6a:b960 with SMTP id
 b206-20020a621bd7000000b00593fa6ab960mr519986pfb.48.1676486193954; Wed, 15
 Feb 2023 10:36:33 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Feb 2023 18:36:22 +0000
Message-ID: <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
Subject: Re: [PULL v2 0/10] xenpvh
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Tue, 14 Feb 2023 at 23:43, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>
> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f3=
1e:
>
>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu in=
to staging (2023-02-14 14:46:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/sstabellini/qemu xenpvh2
>
> for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fbd46:
>
>   meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:25 -0=
800)
>
> ----------------------------------------------------------------

Fails to compile for some configs, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/3775820949
https://gitlab.com/qemu-project/qemu/-/jobs/3775820984

In file included from ../target/arm/machine.c:6:
../target/arm/internals.h:1141:21: error: field =E2=80=98f=E2=80=99 has inc=
omplete type
1141 | CPUTLBEntryFull f;


This job fails in 'make check':
https://gitlab.com/qemu-project/qemu/-/jobs/3775821028

qemu-system-aarch64: The -accel and "-machine accel=3D" options are incompa=
tible

thanks
-- PMM


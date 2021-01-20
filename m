Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF42FD291
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:24:55 +0100 (CET)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EPm-0004u9-NR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2EOg-00045k-8A
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:23:46 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2EOe-0005qh-F8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:23:45 -0500
Received: by mail-ed1-x52f.google.com with SMTP id f1so11839008edr.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sVPSdMtF0tzSLf8Mgfiw8ULtH76psSeDPoVgi/1B65I=;
 b=vZjEfiT43M0qS7ew2zQ0SWOOJJ7xMUp0mCxysU3i3QskXE3LYvwkCzt9Wf7ZGgF3Je
 J/gMZ3IvWqxIqHUhaz4NR5a0su5khTtdk6sprI/xAzITnu/ke4cGnS7h2NGmDgoxeg8p
 C62r6cQa97HTI5hvCjthzxJmXY7sBGOxUe1aTfuM6VpP92GUlgc1Xqmxfczoh1P9QUbp
 r3VopL5Bt0vLtn43yJzMVHesKqqsj4S3THNObrYKtHqTxeDGn9phqBg4UpFxK+Cju4HM
 oMbNsEKXnpu0WJL6PMN9pwfWKp1LoopD7F45no0nR0hYKAsv+pXO92i+bI+bzyhcF0J0
 +bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sVPSdMtF0tzSLf8Mgfiw8ULtH76psSeDPoVgi/1B65I=;
 b=UX0A9lRImxpAI4l1DMRdRKZ6ytJYSe2s+v2pekmHw9xLB5IO0myjoafrToHzWsAmnZ
 Nu8PdbmqortZqG58HFIESeVC0NvTn/9Fqmbvvn5S15kZ2RXN2iwkihZj0V5M5f/k8PXZ
 xzden/9Pk/+8IZd88wojL2bBVgPNILwEx+03CwXLYE8OBPvfgIhy6TRBC1erEm8SAsc7
 GG+x4XTrC2oAwlCwJ0cOt43dFVzJgVZFRDKGaup0pludkNFJ456I1YHSvTkCgJRne1fT
 24uiny6wEDf59DFaaoWy+7f8QCBvwsU7vQUJYDvyMnmFX1LlCA8ZlRW/7xbTSZAbM2Je
 L84Q==
X-Gm-Message-State: AOAM5315tj7n/+9OsATQwLJDarpYTQF1RW9dEpqtBqAsuyRvallq7KsC
 yuw+xq31bP7MdulnHyj6trtA9ZC9M/ghu5qEJCdMN3Sqm9zpGg==
X-Google-Smtp-Source: ABdhPJx3B3FOmIQ/ij/cJUu8Rl9Jwk7KNWhm/2PX1qwOPMWGl0U6y6//PlVJwNvMJWieekChSaW7em0pTGyKVAz98q4=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr5420119edd.52.1611152622866; 
 Wed, 20 Jan 2021 06:23:42 -0800 (PST)
MIME-Version: 1.0
References: <20210119175427.2050737-1-laurent@vivier.eu>
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2021 14:23:31 +0000
Message-ID: <CAFEAcA92qSpODkOhq2P7gxxB9fRx+Awyiu+KyH9DixaB7YV0MQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 18:27, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f=
33:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.0-p=3D
> ull-request' into staging (2021-01-18 15:19:06 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 07e6a3d4e5160955203b82d7ed0d8f523b6b8963:
>
>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-19=
 18:=3D
> 53:58 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20210119
>
> Remove obsolete F_SHLCK and F_EXLCK translation
> Update sockopt
> Add F_ADD_SEALS and F_GET_SEALS

Hi; this fails to compile on the ppc64 box; looks like the usual
"its system includes happen to be a bit elderly" reason:
../../linux-user/syscall.c: In function =E2=80=98do_setsockopt=E2=80=99:
../../linux-user/syscall.c:2276:14: error: =E2=80=98IPV6_ADDR_PREFERENCES=
=E2=80=99
undeclared (first use in this function)
         case IPV6_ADDR_PREFERENCES:
              ^
../../linux-user/syscall.c:2276:14: note: each undeclared identifier
is reported only once for each function it appears in
../../linux-user/syscall.c: In function =E2=80=98do_getsockopt=E2=80=99:
../../linux-user/syscall.c:2931:14: error: =E2=80=98IPV6_ADDR_PREFERENCES=
=E2=80=99
undeclared (first use in this function)
         case IPV6_ADDR_PREFERENCES:
              ^

(Maybe we should think about some mechanism for getting constant
values from a local copy of the kernel headers by extending
the linux-headers scheme? It would let us cut down on the
ifdeffery...)

thanks
-- PMM


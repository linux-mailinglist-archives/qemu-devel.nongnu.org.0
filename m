Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427682FE7E4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:46:09 +0100 (CET)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XTc-0006Qg-BX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2XRq-0005gZ-HU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:44:18 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2XRo-0004On-Ma
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:44:18 -0500
Received: by mail-ed1-x533.google.com with SMTP id h16so1869463edt.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 02:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=APW0fQrm0tbGmxoGtxDTuOs2ZaEOkryZIMVHHozY67Y=;
 b=VMvOY5dcO/MUv8OcsT9Xl+CdMEeOcWwd0r8c6bhMELIYsyO79J13oWkAcJ0Y+dL05Z
 fWeV0plwMglphC0csH3n7XF2ezscDSvHNdfsOrNWXUOKwwiX5Kvnyn8w7F+Dm0Z2Q+2S
 sx8aEf+fLu3kY3+j4Tn04rKePmCUcZ4DPFGFKGIiBWAhfL5GRzYk4m/n+RemqFR0OZt+
 gXo4FWbPNcG23UpJ05QQ2q85m0tAcdbt0jiN/sUazBe8h4KQtowlwkXg64Ks3jabCGih
 QkVnWTtuXKW3axgg3Ix1exlTugLYgD8JAKKHunceKdj94D50TeGTCkKpnflm2TWsAY7G
 dmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=APW0fQrm0tbGmxoGtxDTuOs2ZaEOkryZIMVHHozY67Y=;
 b=rcwgrypnZ9baS5AYkOgttYIsazfRVYbZ1PdgZX3e7u0/dKfmj1fjmu48ffwTl8oiuI
 3zM/MOJlf842t4OSfjqPx1axbrWayHNAMzT4Jdg6Gz2yGlo/MEqB68VZ8TOvZs1kuadk
 w+E+WSI9EUTHxQAkK/Yruae9/ng/HxZengiICOH9xl048NfpDxc+QjdR7ip50ligbIm0
 2NV0LLIR+3EQKSl6zWFzRGePAlm206cmYonQln93H4ExAMQLYpWItMeWyTep4LIrwChX
 jPN0tp2KaIZiaq8Z0pOI9hNGzMAJDYK+oDa+LBjbd5Myl4Th/WlonJHgVvJxyom0EM8b
 cZ3g==
X-Gm-Message-State: AOAM5301x9zw91PGnOAeU2gD+yVhPqRuZY290X1yJJfDHilVowVnyPpJ
 UBnVia2Z3ZkS5WzTbegWtM5u4BjO89vQuM62Jb9I4Q==
X-Google-Smtp-Source: ABdhPJxeSQZrw3S2SeGDl+7aVINNHhnyachwXMrQpdI9TtN68AeTjcnKAc0sYZ8uh2dc/GaWTcucU9ULkN+deNcGvxU=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr9701884edv.36.1611225854660; 
 Thu, 21 Jan 2021 02:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20210120195317.84222-1-laurent@vivier.eu>
In-Reply-To: <20210120195317.84222-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 10:44:03 +0000
Message-ID: <CAFEAcA_jGAWW=3YxJirzOGosLrrgoXhpWHELeJnGJT3u=TPxcw@mail.gmail.com>
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 20 Jan 2021 at 19:56, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e75=
06:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
1011=3D
> 9-1' into staging (2021-01-19 15:47:23 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 8a7e49050b8d5477a567b0ec5d764a564481abdb:
>
>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-20=
 18:=3D
> 26:46 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20210119-v2
>
> Remove obsolete F_SHLCK and F_EXLCK translation
> Update sockopt
> Add F_ADD_SEALS and F_GET_SEALS
>
Now fails with:

../../linux-user/strace.c: In function =E2=80=98do_print_sockopt=E2=80=99:
../../linux-user/strace.c:2831:14: error: =E2=80=98IPV6_ADDR_PREFERENCES=E2=
=80=99
undeclared (first use in this function)
         case IPV6_ADDR_PREFERENCES:
              ^

thanks
-- PMM


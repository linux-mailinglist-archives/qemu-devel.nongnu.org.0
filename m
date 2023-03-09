Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69E6B2FD1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 22:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paO9b-0005oa-Qe; Thu, 09 Mar 2023 16:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paO9Z-0005o9-Qh
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:50:25 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paO9Y-0002cW-6j
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:50:25 -0500
Received: by mail-pg1-x533.google.com with SMTP id q23so1943371pgt.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 13:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678398622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fPsiSsYXg94prjHG0cRnt+Ptjv+OOLI34PwojHQmp0=;
 b=XQskkL51bTT66DQ7mRZuMSz3u/JnNoHwIRWj1H8S5eoE82y3qa3MSAJcJ3LorC57oL
 IfGkIhvIVwD8LArCr4aVCuRoAs1Jo0iM1m8frg7F/a66lNBWvf63dxARFj+eOe7LDOgl
 8RBUsaMgMhIepR3sKmgp+MIABPE6so+252aLVw7yUCsoTlUTy4CmkVwLqmE4llwx6Ekt
 RaJx2/s+qlPPGLj5u/8+V2GQfV/QfpOeuwjV1bOXC5L0SF72NNPh4HnJhmzFe8p6EmZw
 sRqHgSIeoab/eic5vxQsNvw1Ao5mKxYeroRn5ajQpRvVG8yEmn61H3lGiG5RHYLgGNF8
 63mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fPsiSsYXg94prjHG0cRnt+Ptjv+OOLI34PwojHQmp0=;
 b=Jp1Wqd44iWBhPqYZC2WU923TNUOZL1W9VD9nGI7Xpf65ve3nqyCdbltdohqwFryy+h
 X9AM1PvEboBqVytB88LHhiDu6ZQMChTkepJToq4BuWWA/dz+jofYQbgYYONXAsDJJaV+
 C/y9+3a6cvAoz2O2nFpLZ3aYJbKV9XPDXM2rtlKDi7ouJJL+OdcaJSm4eYnbGjzS7Z5N
 OsfOjCN+FJ/m33iX8rYXwzTUuTOPAtr3gH2neDBEazqU1flZrYaa65WSIXLy+RoXh6d8
 UkHOwCiAJ1OvHLBYs41tt0Kq+E3s+9hsnn7YSoqmZSqvjCKtbU/t9hnlDnqGzJW0JSVE
 lvBw==
X-Gm-Message-State: AO0yUKV1/+hRz4nCAVTcUCUI8kyJX/GpxhjjmxJHhewDmKXj/qzWZb2Y
 BcTusfRCn9l7uMFrkMg+rW8IoAMPlVRwWOYl8y8Q5w==
X-Google-Smtp-Source: AK7set/g2ylX9e31/lb2OMAv0xPO5I6BH1kFRXP43VJsRIM4jCt9tyYl2WDBERyz10TaDRtYJbIlJvtnlOYVy7j8yAQ=
X-Received: by 2002:a62:65c1:0:b0:590:3182:933a with SMTP id
 z184-20020a6265c1000000b005903182933amr9469913pfb.1.1678398622517; Thu, 09
 Mar 2023 13:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20230307212139.883112-1-alex.bennee@linaro.org>
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 21:50:10 +0000
Message-ID: <CAFEAcA-SZVXDcq7rgzCCUSzd=JkwD7ti7qzGp-GW-qnHTVJigQ@mail.gmail.com>
Subject: Re: [PULL 00/30] gdbstub refactor for smaller build
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Tue, 7 Mar 2023 at 21:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8=
bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-d=
abbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-gdbstub-070323-3
>
> for you to fetch changes up to 412ae12647d1086c713e13841fd25d10d5418c7f:
>
>   gdbstub: move update guest debug to accel ops (2023-03-07 20:44:09 +000=
0)
>
> ----------------------------------------------------------------
> gdbstub refactor:
>
>   - split user and softmmu code
>   - use cleaner headers for tb_flush, target_ulong
>   - probe for gdb multiarch support at configure
>   - make syscall handling target independent
>   - add update guest debug of accel ops


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


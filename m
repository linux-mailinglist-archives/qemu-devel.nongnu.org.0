Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D53094AC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 12:17:33 +0100 (CET)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5oFv-0003qo-SG
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 06:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5oDK-0003At-U8
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 06:14:50 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5oDJ-0002h7-34
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 06:14:50 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r12so16771403ejb.9
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 03:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LDX33/GRzCkok44bm63Xj9zVLaWBSMkMcCDM9kUQDW0=;
 b=TPiKH0uGDac4scfC3x259QHO9tT0EAOKAcj0Bgk5xESHAAqbtIaNliI/NildTmxgxH
 rCEFjEpdloCiTIba/fbmscMA5+teA3b416xwiVdpRHhXBQEuwfo63JKZdF4qDML2wxk5
 spOt0qyGpupqjCCv+KoxIVoMr6zz1H+zyjeH/UJMQ4h6B2Sxx9ljEEoS78MLELVi/q6K
 XQZZ2CXVwA2vpJgS/8Jxl/sKhAM00INgjvghn5uSWhMIYuO0gzyUK0TRBjCkP1jfoZJj
 2zWoK1zLn4moz4EA2GBnPRFn3hD4QuIf4kLlK85xp+T2QFjXfkec/x8RMi0naY7ejetQ
 X0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LDX33/GRzCkok44bm63Xj9zVLaWBSMkMcCDM9kUQDW0=;
 b=Ftv/Byo3abZTuNTU0uZeoHup2pWKlOnXUyHqhth5FwZFBu8jMOgx1bVtjzqq+sxZ3m
 Sx1vWhDQDwK7MPQQEc+3bKW6BSMXpwHTMzxYjb36wu9ShtMkkvtK6BJMZt4DKIOqbd6B
 c7JUSGgk1G5VNgzYIjvmJqcrwZLbZsOmQG85G+a+0dPMHmFJDpBEvWQyvkIBqMX4LBPi
 RNcQnXJGYR8qxO6bUGlw47X2gc44Q2OllR06SPit9Eyw250DrT4fOmV1LVhRqEM/vuBJ
 iFDdB5R1JDMmv+ZtqMgZT/GHYB7UpUt+K9EMKI4kkyb4fH49exmqfJIOBi+hWsLQLoE2
 JZYA==
X-Gm-Message-State: AOAM533CfzXlQksIC4bzAi3Rf5crWbiGMfKewpc0gvigbcRIQgrZLIys
 dCvRPKL6NpRhgXTA0n1EkGklGnFxLJW7+vSDXjMixA==
X-Google-Smtp-Source: ABdhPJx5/HHaE5S6Rvjm5MeJ3EXiV9OsZ3wTiHh324MiDmxYNchrKFh8X5KDfzAWCHgh1BEvlF39hS7TNgI0sJVg3pM=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr8699891ejj.85.1612005287054; 
 Sat, 30 Jan 2021 03:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20210129111814.566629-1-pbonzini@redhat.com>
 <CAFEAcA-CPcVyo2fzUX3sSdMoS6xJbxn7V4AwRFFSB+mU9bGGYQ@mail.gmail.com>
 <48eb40fc-8c5f-e2c8-3f51-9a45dc1ee128@redhat.com>
 <CAJ+F1CKmVLWT4HVmcDRBGwQcGfWfpSbHyG_1HFdXfXTD4Z+SqQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKmVLWT4HVmcDRBGwQcGfWfpSbHyG_1HFdXfXTD4Z+SqQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2021 11:14:35 +0000
Message-ID: <CAFEAcA9qsF9jvZxB9utLTFXJkPC0-x-w+iHUNe2Pn4M12MH8Jw@mail.gmail.com>
Subject: Re: [PULL 00/36] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Jan 2021 at 10:11, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> That's weird, https://patchew.org/QEMU/20210129111814.566629-1-pbonzini@r=
edhat.com/20210129111814.566629-24-pbonzini@redhat.com/
>
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 5dce846e3ee82d93462bc637bb0db2fd49f0fc5a
>
> I can't really explain why the submodule wasn't updated to include the fi=
x.
>
> Peter, did this fail on various CI builds or during a manual build?

It failed on my usual pre-merge build (which is just make/make check).

thanks
-- PMM


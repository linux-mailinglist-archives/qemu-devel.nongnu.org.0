Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D96D6C9F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 20:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjljK-0001Cx-Il; Tue, 04 Apr 2023 14:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjljI-0001Cb-GD
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:50:04 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjljG-00084T-KK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:50:04 -0400
Received: by mail-ed1-x535.google.com with SMTP id cn12so134581237edb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680634201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mLXg2EG9vAFGx6rJndJNpaaiMJdiUAxlyFywV9fCwQ=;
 b=wKyO7DEm6Aoh1LfyUmYwtVcCn/+eQhbnxgTYTAmujR9VY60Jg8nBiBO+IZOjsXhIZ3
 B+h3HxeXv/7eE8vi+EGV6g2SYfLdOwmiKKWzYHmO+K0soIfer/4YZFPRKTUN51wdjJQh
 ic/7wEukMnHhXIp0ApzkN2vzcbYW5y8H3iMoiZ4Lq0HRm/uO0rw02FAdCISTB662qu1k
 hmfVO2dvzIHwSHAc5qQ9F1GEJzUQTmwOgEbcLEaD8kfPoQ2eQ+vP0qksBpEbAcNCG0c/
 HyWW8vj0yLCqIA8VrdzgTRS2tFcPCqtkE5e/CO+uXYaNFEgHp2fIQogobPRyNUyL1p+/
 5bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mLXg2EG9vAFGx6rJndJNpaaiMJdiUAxlyFywV9fCwQ=;
 b=AZUekbFsAig2krNESWJTJ818rqYM/Rd4WVARYdLb4c9vjbHwAVrwXuwEGZExjSZZJG
 ONs2a/FospQ8RBClXnknvlnAb8eC//f916UwRmqZ39k6/nP0cfg1nXcmdSvXqrVKILZn
 5cVnS1CBlwr/DrbiOZDV5EqXhg7YT1+UpPCbifs1Qbptsd+MQXIoKX7XQpOu7gE4GdHP
 Um20oPFOLzRCNXSnFI4tcE2kOjcwjAdaDMkFEJL4A6XqLgSw3Rm4iHdcXDdIMZOg7+TI
 xT73mQ9LQrt8P4+lKVg24ecnv7PTE25BuDpizToSujGUyVciM3GjNejuo++Ke5zaBwg4
 m4ww==
X-Gm-Message-State: AAQBX9fTJWnwTp0hY8JRjncRkW23IkHlVmHqaDtZJtUoXGpRVfjyIlIB
 3MZgmsiq1KUGfbr+Vwczthw0gh3N/BNTSf8elIqHXA==
X-Google-Smtp-Source: AKy350ZyNlzMUmcuDayd8qnx6Eg9YWufdbuJB845YZV+M13Et/+OTwhuMmyopGy8vWmPL4A1m7acoB9nMT+j6ad6EX4=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr302325ejb.6.1680634201028; Tue, 04 Apr
 2023 11:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:49:50 +0100
Message-ID: <CAFEAcA97iGGALkp+WzEGchysyc4YXmhMBjdPGii3QeU=5xz43g@mail.gmail.com>
Subject: Re: [PULL for 8.0 00/10] misc fixes (tests, gdbstub, metadata)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Tue, 4 Apr 2023 at 15:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54=
f8:
>
>   Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-040423-2
>
> for you to fetch changes up to c8cb603293fd329f2a62ade76ec9de3f462fc5c3:
>
>   tests/avocado: Test Xen guest support under KVM (2023-04-04 15:56:44 +0=
100)
>
> ----------------------------------------------------------------
> Final test and misc fixes:
>
>   - add basic coverage analysis script
>   - gdbstub only build one of libgdb_user/softmmu
>   - don't break BSD gdb by advertising AUXV feature
>   - add MAINTAINERS section for policy docs
>   - update hexagon toolchain
>   - explicitly invoke iotests with python for BSDs benefit
>   - use system python on NetBSD
>   - add some tests for the new KVM Xen guest support
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


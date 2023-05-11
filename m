Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2066FF163
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:17:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5EG-00048r-JH; Thu, 11 May 2023 08:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5EE-00047E-6z
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:17:02 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5EC-0004Xv-LH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:17:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so11377767a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683807419; x=1686399419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4WollG2BpZBqizCm4Tf83bTEABl91igoWT2QwvIJG/Q=;
 b=Oi713GD4Rvgl/qj8bdFkDuKpbvG/5OfSPSvKcg+aCtFZDFjfGcOMF2KcMHEreJP/yN
 rP/i4owpAvZAG38mfhoX5qxpl8FMrhkSQ41cj4pd1Zt2Ca8ehCdHJXPcZNPTW70TrE8d
 2gFBMZZPV/1H+J4zCaxhIQwjUP+slV2EHpnS/2bNHGKMNdAT9mAKjwipYx3a8O9UGylY
 2oQ1obsvW25iLPw67qOOrLAeappF5l+mKX4s7vcrKlULeyKgSDJPoN6wbWM0zD2l0fWv
 bUENojOjuIVkF14Sop1YXxd2ceRU3EBQmIo0FU5HLwOam6XEwkfUtJP/IBoLZGnBrcfH
 8TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683807419; x=1686399419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4WollG2BpZBqizCm4Tf83bTEABl91igoWT2QwvIJG/Q=;
 b=KPijosAmSwcDhU7twMptfOIt4kPt0X+azScJAOgIj3N8HTvotTOoNWiXPibEW0g6W2
 aD77e5BccStjxKkPM7mk5lvpu+Q09/u6ybsK8sHlYGf97IFfRM3yIAldfRwDBueS5uPn
 FbWg9gjj3UiDHkROStZGUG4vPhAUhysSMLSvgTmM3oMFqZylNoAvGD0CbX5Yuv6Ri3i9
 voc9nRmmGyHJsiKdUsCxQZdXkSL7eVzCMrvx4JZwdrPIeJm/R3O5ZxHsLCJCQc4UpClm
 zAY+WOJ4BK3SwxVufqDW7UE4blK/5KeNrlTPMPqVgurSQn+VS72L8V+cdGnjweERF3zX
 7Pgg==
X-Gm-Message-State: AC+VfDwg/WclWpvUnH0EeTfaxy7pXPYwAgG1x41UC4qP37O2XLqSmLxy
 TbMs8hODV3Rbz4kRrXrTuSxUr7YtyFZ7NpeCcLPlUQ==
X-Google-Smtp-Source: ACHHUZ7ycjcehCnxaw0Nm1FzHLKb2bmOb9Mg+1v2yH+0RxoUYNPDJ+qYzxrLzbcaujxPz+RYsGfeFwg2PpZT5xza9a8=
X-Received: by 2002:a05:6402:3d9:b0:50b:c45d:5808 with SMTP id
 t25-20020a05640203d900b0050bc45d5808mr18553183edw.41.1683807418814; Thu, 11
 May 2023 05:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
In-Reply-To: <20230404011956.90375-1-dinahbaum123@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 May 2023 13:16:47 +0100
Message-ID: <CAFEAcA-wGkaf0jXVoj-Qp5fC8UbBUBH3jWyunObuuTPZ8dk_Kg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/3] Enable -cpu <cpu>,help
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus, I think you said you would review this patchset?

thanks
-- PMM

On Tue, 4 Apr 2023 at 02:22, Dinah Baum <dinahbaum123@gmail.com> wrote:
>
> Part 1 is a refactor/code motion patch for
> qapi/machine target required for setup of
>
> Part 2 which enables query-cpu-model-expansion
> on all architectures
>
> Part 3 implements the '<cpu>,help' feature
>
> Limitations:
> Currently only 'FULL' expansion queries are implemented since
> that's the only type enabled on the architectures that
> allow feature probing
>
> Unlike the 'device,help' command, default values aren't
> printed
>
> Changes since v2: Rebase
>
> Dinah Baum (3):
>   qapi/machine-target: refactor machine-target
>   cpu, qapi, target/arm, i386, s390x: Generalize
>     query-cpu-model-expansion
>   cpu, qdict, vl: Enable printing options for CPU type
>
>  MAINTAINERS                      |   1 +
>  cpu.c                            |  61 +++++++++++++++
>  include/exec/cpu-common.h        |  10 +++
>  include/qapi/qmp/qdict.h         |   2 +
>  qapi/machine-target-common.json  | 130 +++++++++++++++++++++++++++++++
>  qapi/machine-target.json         | 129 +-----------------------------
>  qapi/meson.build                 |   1 +
>  qemu-options.hx                  |   7 +-
>  qobject/qdict.c                  |   5 ++
>  softmmu/vl.c                     |  36 ++++++++-
>  target/arm/arm-qmp-cmds.c        |   7 +-
>  target/arm/cpu.h                 |   7 +-
>  target/i386/cpu-sysemu.c         |   7 +-
>  target/i386/cpu.h                |   6 ++
>  target/s390x/cpu.h               |   7 ++
>  target/s390x/cpu_models_sysemu.c |   6 +-
>  16 files changed, 278 insertions(+), 144 deletions(-)
>  create mode 100644 qapi/machine-target-common.json
>
> --
> 2.30.2


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58D57A412
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:18:07 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDpvB-00052v-8n
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDps5-0000ul-Pd
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:14:55 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDps3-0003Fc-Pg
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:14:53 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31e45527da5so47798527b3.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6jdsehQus5P3gIgIIjaIxFIUKu56mrI2nyLJooBRTA=;
 b=obRZ/gl+9j7VdGvnSVwFdHwfLx0kLj2XPBozL1XZIiB61GWYGDbBSH3gMDml9d/yPM
 9LMmVHdJtWXmYwKtj3qE1qCvKXAc6SEy/suG2AMou5H4gPn8qL3tiiJQeUaqvT8ma5Sy
 iRKsI5OtncyDnklH+90YHiXChGG93lhBgEtEBRV9JxJ+Pr9N3IkDPIVM0kkQ8NEap/uE
 g4l2wb+kbc2Ylg8EysKZL6Ej9Q6IRIi0IoDW/Mep2G31XxYvpK+g/bl1HgLKVtLkHyh1
 RVKLjJyST9lgZLk+umNeJeVeOOTbRsE8yU60diSuB7UQNw4bp8dFSkDkpv6aqJj16hXa
 umiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6jdsehQus5P3gIgIIjaIxFIUKu56mrI2nyLJooBRTA=;
 b=tAUKdqBBaGA5btMeqVeeurnd3NC4zcERBVmFmkNRRoOb3wp20GviNk4bqpnoTLiiJ2
 XKk4tZ2dMVA9YAG/ub2Ue8fQ4nSRgKITsaYUxBzU/H8YctrKbP5zHjmnohdGdNmNTLbb
 EY/ztErCfrXAzkV4fE7oxN5HLXUb2nihun4D7xiT/TuC0zQh0wFu+sum5RbbNm/gVKHh
 ogC+olCH98Q66d4AoDIMvU+CdOoE2+lbKcKQWm8aweH4nxVUNVsxk4aKoamaT8no6NnV
 DBAeN5GCj9FTkSlmHFt3/x2QmcTPQEhb0Rojt11S7ytV60GysaSO+RFBIlwRWxpJqBmD
 qRXw==
X-Gm-Message-State: AJIora/lxal2rX+ZYj/nZjMqDyrJoS51oxEWjCjZkizQE/0xU6q2X+5i
 vk644S1HMFffDV/5M1yJWNkwzUWPbEp2XfvJ72o2hruVhr4=
X-Google-Smtp-Source: AGRyM1uA+aS8W14813711eTAQWp7OyfFLbQGz795YdUAUWJ+OQxy2cG17GaWBkJ/Ll9z6XEMBoXqk1jhQAxhDbNbdeQ=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr36509200ywp.347.1658247290667; Tue, 19
 Jul 2022 09:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220719070412.16757-1-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 17:14:39 +0100
Message-ID: <CAFEAcA8HJw7TYtT8KsgiW8bax0HLE39xqRCQeiYikt7ADnmDDA@mail.gmail.com>
Subject: Re: [PULL 00/14] Testing and misc patches
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 08:04, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:
>
>   Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-19
>
> for you to fetch changes up to 9b0ecfaba5920ddf8601d7b31746a428aa3779c6:
>
>   python/qemu/qmp/legacy: Replace 'returns-whitelist' with the correct type (2022-07-18 20:28:06 +0200)
>
> ----------------------------------------------------------------
> * Clean up tests/vm (remove obsolte VMs, upgrade Ubuntu 18.04 to 20.04 etc.)
> * Fix broken build on Haiku
> * Replace the term 'whitelist' in some files with a better one
> * Some other minor test related fixes
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM


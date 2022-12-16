Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7264F3CD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IYJ-0008Ng-Eq; Fri, 16 Dec 2022 16:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IY1-0008Et-Ff
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:47:17 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IXx-0001Te-Qu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:47:16 -0500
Received: by mail-pl1-x630.google.com with SMTP id m4so3601470pls.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lth6W2fLfLkbqKU26i0X8fFBoUzXz6WqyhWRrJ2rzBk=;
 b=UrAG6p1wuSA/kpAZPuU0ua+O92yo6j98I2DvHQw2qxwn7/emPS5EGB1QSl6KjyTgGW
 niMVmnwPV6KqAg72E46yBpoHkJltYB4ZIoarGJWqeD0Nvkv0uZhmJ5eCTE/kw5Kknvr9
 Nic8NjdHa5msPVAxhjJX7pbSLjxQxiZmAq15J5Mkhel9aG7Q+/h5muDuLBxRjfKQRdMW
 DOFLzA/kn21XIAzVD8F5AncVTHby8BKF0BB8gT2Hr0men1wCV3cprTf1SKcQeSamqUdW
 e6kOkjJKz5oAX2yMpI7bnVTyl2izLj0kPQif2DQ17c7FAk74Gvzj+mTfCLFUyICuTjss
 wikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lth6W2fLfLkbqKU26i0X8fFBoUzXz6WqyhWRrJ2rzBk=;
 b=aOXp/UjXsZSixtjmYsflC1cqCLLeHLJePI90J9U678Pr/SkER40vlqkbLQFN+N68xf
 75QN4/U6Vs6fxZ75eQIJLsnuKW30apeaINC/HnRs4YZ7Xb+/n7fb1SHRr8LcZcYR+TV4
 b5rJRQzJ/SwFFjNf5xNyNAVfBVyI/gv/hIaJDViti9sQS5iKLI41rXQ6yqzvQZNBpQQy
 t0Ol07tMeM7XvzY6DZwZk0rgRMRMxcc6IOs40+lJXkAyOhG7Mqc5MNbFqH6vcy+Z/1J9
 jP9cp7XUFvopG6dcMSMqZtQuJJRufoLI75ZDtPP0ujLYdaa1FCnkE+33lMWKAgGSPXfU
 /H2g==
X-Gm-Message-State: AFqh2krMCagpKg2Mw8VSjytALB4/LdFkYjfhLCriqAeNlRpt0KiBIuzl
 7A/PJoFW64b/2RKRyScNeC61ioy25Jady+B0/VwgOQ==
X-Google-Smtp-Source: AMrXdXsCEGfN8cePHiD0P0qdoX2YXQDpfjvBJ0ZTdeJBL07NGo9nyBv+cYSoBAP0i9O/PuIQZYRDsdWCUG7pZ7pB3nU=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1225676pjb.19.1671227232216; Fri, 16
 Dec 2022 13:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20221216135439.465033-1-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 21:47:00 +0000
Message-ID: <CAFEAcA_=WichNB8qeJJdhrwrkHc_M9zm0+E0XfZ417aGiZ-cYw@mail.gmail.com>
Subject: Re: [PULL 0/8] QEMU Guest Agent misc patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Fri, 16 Dec 2022 at 13:54, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit edc93f455fa823a9a5fcb3a8da430104c7375a0a:
>
>   Revert "hw/loongarch/virt: Add cfi01 pflash device" (2022-12-05 11:24:35 -0500)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-16
>
> for you to fetch changes up to 10d83e7d59af4464ba4382bcbf31ed162db87656:
>
>   qga: map GLib log levels to system levels (2022-12-16 14:24:36 +0200)
>
> ----------------------------------------------------------------
> qga-pull-2022-12-16

Hi; I'm afraid this doesn't apply because Markus' qapi pullreq
has changed the implementation of qmp_guest_fstrim() to not use
the no-longer-existing 'has_*' fields in QAPI-generated structs;
can you rebase and resend, please?


thanks
-- PMM


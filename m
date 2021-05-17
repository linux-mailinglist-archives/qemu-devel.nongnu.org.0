Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23727382CB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:58:12 +0200 (CEST)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licp1-0002Th-44
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1licna-0001bt-Vc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:56:42 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1licnY-0006Bq-BA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:56:42 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so9029788ejc.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nnTHqK4uvzdd9r0Nbi3zXG2xUoMvdk7lsoRM3F037NI=;
 b=lSAUI9izj2A9KfE+NUUp8CJ/wHk1L2De+Me9o2IZhOCY2Je54Ccb7zYhGvoyA6x4TM
 BpHt3jC1lYP3/J2S83Rw+qyZ8fy1ShfF7VcbLh/a+9Dsl8iYsndbctq50HilM8ZT6jUM
 13dXrZ3VYfS8yGD9fAtarD/MmvU4+mCQ5a0vH70Ha43JniqFLPzmsIL9OTrgCwTpUbwV
 PEaOBZThw8R8GULVWEcb0ee7FEHTuZg+YhMPys0eLOqlsCHGHcrMFpkwhmQod5Q3cZoC
 J8HgAiZW1dm3CUhEU+7jScLLUqn6GzsHWw18qVjU07rVvh4WgqyOXppIFLIkR1xj+KE5
 vMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnTHqK4uvzdd9r0Nbi3zXG2xUoMvdk7lsoRM3F037NI=;
 b=emUbIxW4YhLw7a4rb6xk8C7PBssQV9+tFGPD5jNMkbm3QfE708Nen5muDwZncdKDSL
 2jqDEaeQ2pbsvgDr/LkS0lAsnldCtelDTLKx57YN+4ILto4xFUZH6fAiRqHoPx+3dAaA
 0doDT47ZmdRou8ngyErMYaBi/Qrj2beCjx8aZjJW02yFygC7y6Mdmj+zvqa7Sta6NfSe
 scRMPSMZtcVXoJncJLhwTbr3YnfB9X+kgyWAOqVM8aXcc0AheSQsnPjg+9ofvOtgnvTS
 vJqyBbZsbUC8JlzVmRbi8tuF5AgkAcMSK4ZnO3lVrGWFQUbLx7pxLxYk2NFSo0knYt/M
 I0Pw==
X-Gm-Message-State: AOAM533pZGIa/RG91UlG59NGxhwelSZoZu9EDzzPjYpx7PommNec85P1
 3XqP04pOiqUHOtKnZ2esjTcO93N53EOk+wAfTk/DEQ==
X-Google-Smtp-Source: ABdhPJzXEI0JRzatGPEGwCWxPWCMC0POjJcvNh8Zot/b65GqTjhtmFH8MHLoXK1YiA2c+k/jbp/mHAdc+d03MXZsjas=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr61532228ejb.407.1621256198451; 
 Mon, 17 May 2021 05:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210514164514.1057680-1-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 13:56:23 +0100
Message-ID: <CAFEAcA85arWrDP0RLdO+GBG+rivN7FMAhXwjHdkf9VtK7mjc+A@mail.gmail.com>
Subject: Re: [PULL 00/19] Block patches
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 May 2021 at 17:45, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 96662996eda78c48aadddd4e76d8615c7eb72d80:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210513a' into staging (2021-05-14 12:03:47 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-05-14
>
> for you to fetch changes up to c61ebf362d0abf288ce266845519d5a550a1d89f:
>
>   write-threshold: deal with includes (2021-05-14 16:14:10 +0200)
>
> ----------------------------------------------------------------
> Block patches:
> - drop block/io write notifiers
> - qemu-iotests enhancements to make debugging easier
> - rbd parsing fix
> - HMP qemu-io fix (for iothreads)
> - mirror job cancel relaxation (do not cancel in-flight requests when a
>   READY mirror job is canceled with force=false)
> - document qcow2's data_file and data_file_raw features
> - fix iotest 297 for pylint 2.8
> - block/copy-on-read refactoring
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F53063B3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:05:01 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4q7g-0005lX-8s
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4q51-0004gx-CF
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:02:19 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4q4u-0001eu-JY
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:02:12 -0500
Received: by mail-ej1-x62b.google.com with SMTP id by1so4233876ejc.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vru3QfZu/Pm7JSBT5l8yR7Di1zSLAPHvjf7coSDXDhY=;
 b=xFuP5Y4MOhcTGZSEvFYHL9q+TB7G1N+gT20TtQkFE2BGiRuW5tex1fY6D4ClXKRrVw
 6bGB74guxHknLp2rP8+yk6gbmp5IEXCD0lSt8akvVW82B8GpF1FPutegvgOy9kbyPLv3
 82os59EHHAqL+B7UWLZAAmEj2/kT7RbmpoRlAjQclV898ufZHsGlgItEFfSCJtLaorYd
 7Ghr0ehKuAAJImmQ6ycd3qQ/2wwWF+nqdIe53itRjHHyNI50nj6XUS8ZlTbQPiHyyJ1P
 XfA6OGZJMo+pz8fbd7OcDTVELSjDIQDOeXB1tvVCJq0KwXAR0u85SmwcgxK8UWU8mxcQ
 2hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vru3QfZu/Pm7JSBT5l8yR7Di1zSLAPHvjf7coSDXDhY=;
 b=cIQEYEi/oeUYykxU152qERzOawyoG3KZ0xIsn/35iRDEYSKlCaXz+U/mzsMyURKQ84
 wlrqtw+vu77BQwbqowJ8nXwTx3rhZu9D412nzVIfo71EKbYL8erD8OqMrMmtSuintg7m
 9ZIfNC4IUeUDoQxxGecPeRoXjWuDVb5hMZcxDERQVMkWCdcBEfAw7iRkstRiJ+jxQ6km
 1RxBm8bUC4qUXZFek2RjKaFp8BU0biL9SYwxcOW5eDkLfzhNKidOLGz/HvwW34tYApFv
 dlPLkiG0MoLa6ruCyoxqu/fV0bm0cCZ5Ce1Jj/mweMjNsO7FWjL3utlA5CWL5VfQWYGq
 S/dw==
X-Gm-Message-State: AOAM530wfctnFvnjmLFNdSJ5txaFIXR/PYxYy3tLypHs5/WnhNzGhkj2
 GEmTQwlemfZyp91xTsKD2itETe3kfaMXJG8G3+RtZg==
X-Google-Smtp-Source: ABdhPJz7O1Op4MErxU7c6TAJHEp+T5+bwjJmLgEJMYinBUjNlTj1VQw5EaMMqML1qTC6QutugQQsO0NkE17wVkL1kJU=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr3953982ejj.85.1611774122536; 
 Wed, 27 Jan 2021 11:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jan 2021 19:01:51 +0000
Message-ID: <CAFEAcA_xpD=PMWMfd+_fvH3U4sSzs332FHyVD-essU2rkUOxbw@mail.gmail.com>
Subject: Re: [PULL v1 0/3] Xilinx queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 07:48, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:edgarigl/qemu.git tags/edgar/xilinx-next-2021-01-27.for-upstream
>
> for you to fetch changes up to 43a9ede1efd12d297278d017ce7df7130672e15d:
>
>   target/microblaze: Add security attributes on memory transactions (2021-01-27 08:32:55 +0100)
>
> ----------------------------------------------------------------
> For upstream
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


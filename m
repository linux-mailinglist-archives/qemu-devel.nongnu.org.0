Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D53DB799
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:07:19 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QMI-0004VK-JH
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QL3-0002te-47
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 07:06:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QL0-0006eR-5H
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 07:06:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id p21so12582728edi.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pxa5a/F/3l28zkFXUewuXhTN1bpnwBxfWBacQ2xuATQ=;
 b=HKW2j2jZ00xMSNPFKyVpj2IbUPHiIFZYHNBs7OrAyEpV30RTmiIlZuLQ4pmR0HATT5
 a494gU1nVoMepN9LTupkaQS+fPbbt2UrPmZUzOOcrogj5nWwEERQCzWAHNfSR4rHFZIj
 3psHIY3ZUvNt7RA6x+Ju9n4nt2PF0+O3iVAlrXP3b3YaZTCEH6C0Conp9a0FPWw7A+HC
 /jlgCz0CPlX0NIKXvtGY+/c2PkKJNm1//Qy/fm8fjHa7hNrmwoQ4Im0VC5wPKnf0C718
 JRltMgfg7bveqPlfrYqhTwjaLRYLPQ6hBoyQ4Iq2q8HLsOF0jLbPc+/Z4QrVRw2so9hi
 bijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxa5a/F/3l28zkFXUewuXhTN1bpnwBxfWBacQ2xuATQ=;
 b=MSsLinbWTj2qzspAFl+Ek/GD7kavRCVTCrVfUCHOdViMxDXvHfMM9Iyv+xVgGdyDq6
 9O+vwvggeb1Sq40GT8r5n4yJlGWtHILrXeRvcNy9jcQVsBhApXEaoy6hxpIJ7ly5UTE6
 LQCvvyuM7goKfs6uniDv/Y4YTeDiL+CGKyOoK05WuzGoJipA+neIf5ywy/fLLRgZUY/G
 3ob1BfIHmUNYYa31eJIfjr3mJrlLdDGtbOPWI4nV8Z0dgNjHehSLNPxO5Q2/DfcxiEr1
 ZTw5S5m9tuzZ5fa1NVA+69BTQ9xZ+2vxjLi6aZWmrQFvfeA7NHUOS1VnxAJqnH25ZQv/
 j6uQ==
X-Gm-Message-State: AOAM530cepi1en09o0ZFo8RdPsuoZlYaBogBY4/4FidJa4nUp7Ja34PQ
 Kv6o3MEf6qh3KFpUZKROPdJNlIuY+iNDrfIYaW9ueQ==
X-Google-Smtp-Source: ABdhPJzO1HaVyXG7+4nLsyPIumoM7csQrezGaKfOjQEmhUJUSXKrAL8sfUFXlMk8I5029ahbK9JyhqR3iwwYElN4Hjc=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr2206683eds.251.1627643156538; 
 Fri, 30 Jul 2021 04:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210729162239.932125-1-stefanha@redhat.com>
In-Reply-To: <20210729162239.932125-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 12:05:13 +0100
Message-ID: <CAFEAcA9HoZVr6j-CkWrv_kOotzGCgU4bSC+LSbhi2QZc3-_HQg@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/3] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Julia Suvorova <jusual@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 17:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 3521ade3510eb5cefb2e27a101667f25dad89935:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-07-29' into staging (2021-07-29 13:17:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to cc8eecd7f105a1dff5876adeb238a14696061a4a:
>
>   MAINTAINERS: Added myself as a reviewer for the NVMe Block Driver (2021-07-29 17:17:34 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> The main fix here is for io_uring. Spurious -EAGAIN errors can happen and the
> request needs to be resubmitted.
>
> The MAINTAINERS changes carry no risk and we might as well include them in QEMU
> 6.1.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


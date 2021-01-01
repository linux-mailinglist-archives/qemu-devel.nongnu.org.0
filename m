Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF52E8545
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 19:19:38 +0100 (CET)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvP1V-0002j5-9E
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 13:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvP0O-00029C-Ov
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 13:18:28 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvP0L-0007n6-2z
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 13:18:28 -0500
Received: by mail-ed1-x530.google.com with SMTP id b73so20677727edf.13
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WjwTSpMK2+3F6/8RsK/dXh0lvV4hjXgPNN1RComP4mM=;
 b=ZxcXtqLyB8pmJGAcshinCIAqts+eC/GrkG7PQ6LPWgx+OtvseXjeeIRGjFkvRJZnAl
 Ttf2pM5fFYs10XoiukYdFozvfDRJbpEsm1aCPyKj4uLLdXUA3giNOdpzh22oYA2zPrPZ
 /URWnvYJkD+eQU6ASIA9tRh9utWPEOJRNEaAQg/bX3+jO/bLb+Z+vrJRDDZxJ3gqKF7D
 1E7+0yEAn6PMIsXYovJnJhBAvND4ZRD8ODlAktegJZYN8EUmLCaII9GzDVSOV4tl/Qy4
 rEwjNihjGk2Yb/w6vin6hHkYBRZnCOXSeSvrPwrNTikHL/NajK6Q+ShGLmb2Reaf+l7t
 pQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WjwTSpMK2+3F6/8RsK/dXh0lvV4hjXgPNN1RComP4mM=;
 b=FZn/mQHd+VLVHbCmxR6v8OB9PSO9TA8GybUKC3MZWQa/trUlFpwB1LIgnWegFXIOaS
 FBSZzeS4F05roiE7X4pRNNlw1KfgaqOPdXi9b9fnkj4xFNglX7ivZpoVtcY/n9cURT3l
 4z6W2tROiZ2NMol5XoXVZTOuRBa8BD0vWOEvbjQFwk4WnRMfiVkrz3Oa0PzSw340L6sG
 2kR2u38YSrxs0cwhhxHQjerYNOnmRWp3w82rGXeTGnNPFJcQ1WvfBbiaZGkHgGSrxsMK
 z9/gzqnMGMkCL/uXq59Hdtq7PRioGwtfTs8wpvd0EPciuhVDy7a92SxSKJwv6HYgj8Fa
 sBgw==
X-Gm-Message-State: AOAM533VrC/WgJhc6d7VkZKV0Pr/mKHENqhFl3wB/L4Q4sKPp6KEhakV
 XRJXBWkXR5HDoSvlSu+sVQn4QVkiIfbhSHIA2UqOpA==
X-Google-Smtp-Source: ABdhPJxZg0abWhv5z+TNCiQDG6KHkwNn20XY9ASOUfHU+aSLBBLOoUovP9SwqPoKT0/P9eKB0wt3oBe3FYo8s7apdOw=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr59762182edw.44.1609525103349; 
 Fri, 01 Jan 2021 10:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20201221134504.764-1-thuth@redhat.com>
In-Reply-To: <20201221134504.764-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 18:18:12 +0000
Message-ID: <CAFEAcA-3SCV5kGHsMAMBr7Pr2XyEb-VuEaRADTxg9WvALr54ug@mail.gmail.com>
Subject: Re: [PULL 0/5] fuzzer and gitlab-CI patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 at 13:45, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request'
>   into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-21
>
> for you to fetch changes up to df063546c2de1a5045e356253abd9a2e6e2bec6d:
>
>   gitlab-ci: Archive logs of acceptance tests (2020-12-18 12:25:42 +0100)
>
> ----------------------------------------------------------------
> * Two fuzzer patches from Alexander
> * Show logs of failed acceptance jobs in the gitlab-CI
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


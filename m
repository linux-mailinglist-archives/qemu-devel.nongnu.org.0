Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B690531DF84
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 20:21:14 +0100 (CET)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCSNt-0007KT-Hb
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 14:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCSLO-0006rR-5U
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:18:38 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCSLL-0005zv-49
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:18:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id h10so13224245edl.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 11:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JnRiIQa/xqD86XgiFLKEbX1OcI+MqgFHAAoNBHUPRXU=;
 b=oSHaGAtmKD3bdwF/gSpntcgSiPeKzA02Q5/5EPrQycxeEBrraX/7wU7V7G3voCaUeV
 15L3r3ZaxC1gjL4k5l4rB5u8IYs5Op5wwyYMqxH5Dm0h4cY7cDpGj35a8pm/TC5J/F85
 TABwKg8A01zP3F2RCS0+YBP7Him3DxYf3QJWj5PZZ51vTTi12wBlgrADFutTCa7ld1qT
 lxZdBEGv+4sw5+6zCIDo+vqSXafy3immNpJuZI308rKPLlcj5b1Qye6QiKUe6mswqmfu
 ifaiGZ0ruYpKhW2nC4XVC2YaboNee4N1wcti7PfKPIwHQZL3jyqqrKAGFJ9qTi44HSGW
 mxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JnRiIQa/xqD86XgiFLKEbX1OcI+MqgFHAAoNBHUPRXU=;
 b=ivs5MEIaGJRg1+rCB9VdjTlphzqEzm076fdCKARdRQ+s6r8nozhP1lS+M+M59cg3H0
 KKI4QygXMyEFf28vAXtOvzFJkVbTNKNjlFIZQZWOLnQ/79SgASy1c4s83iYds2GsDpMa
 CbVVcWozLbqSSMUpsZA5Tvyp56G9vrXNbUeoS0Knj/GfPVAhKLvQ6OSdpjgMctI6hExC
 91vMH693Rxgdy9dFDkTMPAFJjT3Z6nBzOQtOAw3YWsBEHFq6I7kpiXmZ7STMitw3Xuh8
 68txHcCXSiaDKmJQ3NLGb+FiQvNoSVr2pHplWf3jpsZHHs8+09OrXG8VCmOukFbuJrNj
 TUCA==
X-Gm-Message-State: AOAM5334cVdQ2rO90HlgXtwEQZ6RnZA8yKjdzVwGQ1pzV8kN7Rucz8ZZ
 4wunY1IJbgNy6AiFcQ8AcLa0X8/vHJfCWhPK4BuGPw==
X-Google-Smtp-Source: ABdhPJwBKOrS+ZRDWEL5ytD9QRa5Xo4YMNlBnqAXZRyU8eMyIR+grYGLaN66eWQJfmtq2uU2f7qSuqGLBpMJFmA9qqs=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr381122edc.146.1613589513013; 
 Wed, 17 Feb 2021 11:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20210216183734.57810-1-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 19:18:21 +0000
Message-ID: <CAFEAcA9wzrta4Us2kdWe6x2XMHuF60uVU3qGFzpL98LrYVEZUw@mail.gmail.com>
Subject: Re: [PULL 0/6] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 18:45, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 18543229fd7a2c79dcd6818c7b1f0f62512b5220:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-02-16 14:37:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210216
>
> for you to fetch changes up to 26ec1909648e0c06ff06ebc3ddb2f88ebeeaa6a9:
>
>   virtiofsd: Do not use a thread pool by default (2021-02-16 17:54:18 +0000)
>
> ----------------------------------------------------------------
> virtiofsd pull 2021-02-16
>
> Vivek's support for new FUSE KILLPRIV_V2
> and some smaller cleanups.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


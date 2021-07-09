Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8B3C2688
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:02:50 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s1h-0007QF-56
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1ryl-00052A-Cb
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:59:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1rye-0001ah-Go
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:59:47 -0400
Received: by mail-ej1-x62d.google.com with SMTP id v20so16697332eji.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VSCGHtuA7PpdVeFnwuC+PVVL1xGL4aO58YAuwbed1+o=;
 b=dvnXFZo7T9zkISb6SyHXRPQObUGwIEDKowhr7in1AyQf4ZDpsr8ZOpM3rqPRSavPwd
 NmUs1HwtDTWiJ5uOdo8UjvBXAztBW3zPljKcIj4mMNvUmREP1Iu0/DZyqiiK3iDQIUph
 N3l5TuP74IihrccwflcInoprDd/idDeeC84B19cdNrF7TxKFQxtwRmzqR6Z6+XcG5yoV
 EvrBmCYVFIKwc3zixCQCMTs581hr9dEQjmjsDnuYq3I9sBXmg8shv6evLzmdjGB1lfeg
 qSoICiYCQ9IHuvRyb0erdUVZfczOCcpYuMXUb+w8kcZcxZLELDpUDUBHemrO3kQjjrlA
 d5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VSCGHtuA7PpdVeFnwuC+PVVL1xGL4aO58YAuwbed1+o=;
 b=nQ/qLW81SNtNW+7YAxIiPWL5DK1n5InTbJoPeX0UfHAVHwxLeFu68K6AMyI2+zH/lg
 dKMkZr2BbHVgxALDL66Pd4nGRz4azPHwPAD4qcAfo6XkF6X9aKNAeMj6IqTiCRr9mS1y
 /pNsdq8sLJ6SfhZFnVVD4m5jjp3g7Z/3bsHCkIuv7V2Beg8MlFSRSsZuu/TwbKlhp2il
 LCCUrr9TF6rjDjerJoxKyIQWYFUn4m/xH7DwolDNPJhCO7wezfrHV7u37x0gksGWJBrG
 64zRzruR+OBHYztYVOQCrd8YoUWnLmpkSVfmadCOgnNZjVGRI27Gn8nKZqmmo32bv5Q3
 Difw==
X-Gm-Message-State: AOAM532CgZFc2yNoeMtCGw/v6L6VsgakuppK0RbU0rOrAsn2zAh/emXb
 0o8pxdAn7Q4J+vOnwVB7SEZB9enXL7V3lBFrMoQCJg==
X-Google-Smtp-Source: ABdhPJyRRST1qCAhRG7ywasx7qjvRbYQFm+gLAwoFV9J8twlRXi4Z8ANPXXUKzXA6GsfhYJRMgX0p44lmxwe6OAbWjQ=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr27104382ejc.56.1625842778976; 
 Fri, 09 Jul 2021 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210707150157.52328-1-mst@redhat.com>
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 15:59:00 +0100
Message-ID: <CAFEAcA-nPAOTOVzAmHtfyMWNRF6iu9JLcrcScbVooKZmKZFXjg@mail.gmail.com>
Subject: Re: [PULL 00/13] pc,pci,virtio: bugfixes, improvements
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 16:02, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to e3e01466bff42b5ea977340d8d7d90df482b0c97:
>
>   MAINTAINERS: Add maintainer for vhost-user RNG implementation (2021-07-07 06:11:22 -0400)
>
> ----------------------------------------------------------------
> pc,pci,virtio: bugfixes, improvements
>
> vhost-user-rng support.
> Fixes all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


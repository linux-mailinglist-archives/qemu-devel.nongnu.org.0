Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFC2D4D0C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 22:44:47 +0100 (CET)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn7GQ-0007Fe-3F
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 16:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn7EH-0006mC-PY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:42:33 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn7ED-0003fZ-S6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:42:33 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d17so4325444ejy.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 13:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwfKzvGuu2sHFUAqMKHqVfT+PFAsKF4XELtTGgz5U5k=;
 b=rZtay9Sch9Ot68GC1lzeniwMdRuAanSObxDUheFri2rwod63wUJPuDGwCCDf0L+8zH
 cvnbawxqDOkwtI/iSRRsNWTm82sgh395DVSJ2he8/DNhSDvAu8wWS1Lw4sfZDFgscHot
 uFRBeTGSDgYgrgSYeb4JeX0jZrCQpq8wDdEH694yXjnZ3KN1B+B+11sAXgIsB+AVDdUY
 PiZr7mihghFw6bEIIKPAzKcJRAsEQH3kI78CqHlcgt20fZSYVkqeAdKyJm8YJYI130h7
 YE/9NPyy0QMiZq3xQhp5T03e8TtPLw/qQ5pFu1bB78ffVKf6abBXcEu1JdmsimN9NErV
 NtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwfKzvGuu2sHFUAqMKHqVfT+PFAsKF4XELtTGgz5U5k=;
 b=p4SOYw4OAxnTKrr8AyyaenJHYfJZ5U/ev/Jy+QNSztDjMhuTHP0HaOBan4HPwd6fv4
 tCoYnhY2IN92495hCqXuhg++ikZ8IdMPND+Lfw6FSX0PYrDcyaFW/TCkVg2BP55i77bZ
 bXf1CRZawekzwtZ4dAv6Rr9+r2YY8vkeaP2ynJco6+UFcNuxhQFlqTWKm8imq9pFa1xP
 QwmI/k2QOavX5a8Hpym83YOHIjzvcGb5HiR9F7SJRi/WoT4Ql7ZZkfiDmYHnOvlS4dNQ
 yVwQDXL2POPYL5L2uV4aNZjNNXJGiHa5SMVv428BXw0Wn9fCYuA8wfsjZk6d1MixJgAx
 +VNg==
X-Gm-Message-State: AOAM5300uZN4uPfusbgAbNj6uf72B6PnQkD4Wn3g2+qOV3Ko1tjHQyI8
 22sF4YPeMytEOxQpsNck9+RCXHtw1TvuUvJEKIxWCA==
X-Google-Smtp-Source: ABdhPJwZ+DCAMqK3vYOAeoQ+t6bpfVLSbTHwkyPTvSnglo+ZetuBoE0mbm8838oAzK6a+e21hL/ONHvUJ0n6YdXBLjo=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr3745876ejf.407.1607550147249; 
 Wed, 09 Dec 2020 13:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20201209180546.721296-1-mst@redhat.com>
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 21:42:15 +0000
Message-ID: <CAFEAcA8165jXqBWQcvH9a7oH6uXiNxpnm0iOuDO6QaQGwTvFkQ@mail.gmail.com>
Subject: Re: [PULL v2 00/65] pc,pci,virtio: fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 9 Dec 2020 at 18:06, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
>
>   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to fdfa3b1d6f9edd97c807df496a0d8e9ea49240da:
>
>   hw/virtio-pci Added AER capability. (2020-12-09 13:04:17 -0500)
>
> ----------------------------------------------------------------
> pc,pci,virtio: fixes, cleanups
>
> Lots of fixes, cleanups.
> CPU hot-unplug improvements.
> A new AER property for virtio devices, adding a dummy AER capability.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM


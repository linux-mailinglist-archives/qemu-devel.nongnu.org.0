Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F43C1B55
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:04:39 +0200 (CEST)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1c8M-00074q-Bg
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m1c5A-0004Ak-Ox
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 18:01:20 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m1c58-00077s-KZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 18:01:20 -0400
Received: by mail-io1-xd35.google.com with SMTP id g22so10151975iom.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPG1k/QlORJ8aCvfVaykoOLXbH/cxzIXSJO/JmT8a0M=;
 b=bNBrsCCVVsoq0UZ/Ht5NYCThWwOgx2bHSHPhJWFFR9gnGtm6XurV7clpYfnRK3VV/P
 l8a3W5ar3NVusEdmpDb1tJfUBaXInG7GdX24cIXOgBPqkXVrJqtvL2S1DNLXve/rvvth
 biLPIDrL39tk9SKtwFNm+gud4qZX1fWCpuG2m37llEyIVI8xyK9m4rHQG2FOk8RHWNIY
 ecFtstDvROStWmFMDn/BHTt84MNJgIldHDoA+sVe+7dS5HtocvITcbUAGu63052iJ/sR
 IdE8AliZJiFxCzk/sXfZ4mWoWWeq3JagYGEVeqG1zU1DwN9BWqRzEc98fP+oRmDJp2Ir
 M/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPG1k/QlORJ8aCvfVaykoOLXbH/cxzIXSJO/JmT8a0M=;
 b=DtYIYe88y8+guJFLqLEP2cA+7UY5WaVdgBmUg5ly2G87JHHAr+uaJUTf0SIFB6zdk2
 uIer/mEmf7DB0oKP+lUZR+4ZEeM0g48kit3szzQkxehg0OsZ9uDUqfHdkfWTVouAvHck
 bFhnsfyDBHxSAaVVUN+XCW4TZO+bJ6E4Wc86uaDQKIa8X75UYbwGHrRzgI3QJUtCQnTf
 nngjIM1836mAJzit4295deYFeRxT/dynTUe7ZgTuh9qgv2zBC/1qeR6sY2UTigTwTcY7
 2FkJvW+UxG3NZ1PHpcDfPNf0zpnA/w+1ED2f2kp/0Nw4h6+P+jI24TzXtcPKP4x9JNLH
 tTNw==
X-Gm-Message-State: AOAM531i3SH3lUQ4kEkkaBM85MqjIX8HtVTO2ikd8dlX9oqg9nnAUgTS
 ro5jf5owH+8+1Gd20s+Ff3iRQRZ7Rnypx9r09LvnkA==
X-Google-Smtp-Source: ABdhPJxKS9p9ytynwbqWVBBAEjbP7pl7W0uWVg7JdBc9BAqdiJQopQGEoGNm9TcSoNHhYXfp5rKdyDU4uYaibqnOA3A=
X-Received: by 2002:a05:6638:1606:: with SMTP id
 x6mr20153219jas.98.1625781676089; 
 Thu, 08 Jul 2021 15:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210707150157.52328-1-mst@redhat.com>
 <20210707150157.52328-14-mst@redhat.com>
In-Reply-To: <20210707150157.52328-14-mst@redhat.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 8 Jul 2021 16:01:05 -0600
Message-ID: <CANLsYkw6MbY+8d6HpApZ3np1ACfya8S34MbhoPbUUUyn43Md2w@mail.gmail.com>
Subject: Re: [PULL 13/13] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-io1-xd35.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Wed, 7 Jul 2021 at 09:03, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> This patch adds entry for the vhost-user-rng related files.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Message-Id: <20210614202842.581640-6-mathieu.poirier@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

The pull request's changelog [1] mentions the addition of the
vhost-user-rng feature and patch 13/13 [2] of that same pull request
adds an entry in MAINTAINERS.  On the flip side the files for the
feature [3] are absent from the pull request.  As such I see two
possibilities:

1) The files for the vhost-user-rng feature should have been part of
the pull request but fell through the cracks.
2) The vhost-user-rng feature was added to the pull request by mistake.

Please let me know.

Thanks,
Mathieu

[1]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01530.html
[2]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01543.html
[3]. https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03560.html

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfbf7ef79b..517f22b2e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1949,6 +1949,15 @@ F: include/sysemu/rng*.h
>  F: backends/rng*.c
>  F: tests/qtest/virtio-rng-test.c
>
> +vhost-user-rng
> +M: Mathieu Poirier <mathieu.poirier@linaro.org>
> +S: Supported
> +F: docs/tools/vhost-user-rng.rst
> +F: hw/virtio/vhost-user-rng.c
> +F: hw/virtio/vhost-user-rng-pci.c
> +F: include/hw/virtio/vhost-user-rng.h
> +F: tools/vhost-user-rng/*
> +
>  virtio-crypto
>  M: Gonglei <arei.gonglei@huawei.com>
>  S: Supported
> --
> MST
>


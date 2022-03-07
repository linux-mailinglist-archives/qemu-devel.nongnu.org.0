Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B844D04F5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:09:38 +0100 (CET)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGrZ-0000XO-8N
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGoy-00060m-Rx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:06:57 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=37828
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGox-0002rg-4k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:06:56 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id g1so32316366ybe.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZzBK0bIAnjN//PNQIaLTbezVQGTaq8H2fgbXF77Zgs=;
 b=C/GPDnxElzqKN4XW8WIHghZf7cZqEDZw7IeeHIyHAchy67yKpU6zc8tnytsS93GW+4
 oI6g58IEpRlcT1MhtMcSgtCoPDIfGTSqtI+BHlzBLKvNDuCvCOCO4Y9Ka94QNIobU4Wa
 yMPlEs0RFCzVSb7tcwUjTzmxPwO8NyuV++Z1iOoGMMnHRPgsRE8/gWpfYW8ttafb4rzA
 XiBiQXjpfrw5RtTGhGWW6exfZQbTBvbtOWwcx9Q5wLKRQpukIm0gKxRQZ5/G3+o+WL5s
 m1QirsK/oVn14OC3h6uBfHuz6ZdFPuPNiWyygLKZrhUREqjRSiTihEO9BbtY0Nszd5fZ
 CYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZzBK0bIAnjN//PNQIaLTbezVQGTaq8H2fgbXF77Zgs=;
 b=OrdHwgZYOXUI27LKFE7Kcph2u3Gmc5LBEi95HRSfFrAwwCsLph2cNc3Nfrpst1s3Au
 vQTVRYgSZhBuIkmJ3x4rD07Q1OnVwPBd1XQkAxnSdAoRQbgRlBLxtSD7AacTrvF7jooC
 IxT/NduR+Wj2K2ykJGbk8wpUB4Q3yZWMmxqWMPzQI6f4zq9jezLksKtUvpufIs933eGr
 yWaV1SfRiKI/fGlop0kpjGJsNhGH6oinWBaR7GkchfnGQscpW+vcye19vOPVzMg9bV9c
 Q1j7dRL1CX1PJKjnwVehAj7lYHWb/4Mr7SFeGOd2c6fOlN+5QVWvBugl4eitU0pBPOb7
 PmYw==
X-Gm-Message-State: AOAM531fd917wZUyxL0JvAxAa5Ql7ebYaL+0mpNY6OgY4FA4oxUdNwrk
 SEOUZVej1Ds3A1NBXWpdurfT9xjsB8rwLHw9JWFfbz48rcIJasxl
X-Google-Smtp-Source: ABdhPJzwefq3l5L313f1iRbi5mdV2bqchLIzHpO76XudS7nu97gmavyhwYlVjZs+k/m4DnxYXwRvi3hQaxMnP1lwkUg=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr8496702ybp.39.1646672813937; Mon, 07
 Mar 2022 09:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20220307100058.449628-1-mst@redhat.com>
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 17:06:42 +0000
Message-ID: <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 10:01, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 41d137fc631bd9315ff84727d780757d25054c58:
>
>   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-06 16:06:16 -0500)
>
> ----------------------------------------------------------------
> virtio,pc,pci: features, cleanups, fixes
>
> vhost-user enabled on non-linux systems
> beginning of nvme sriov support
> bigger tx queue for vdpa
> virtio iommu bypass
> An FADT flag to detect legacy keyboards.
>
> Fixes, cleanups all over the place
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Fails to build on the build-system-centos job:

libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
`qmp_decode_features':
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
collect2: error: ld returned 1 exit status

https://gitlab.com/qemu-project/qemu/-/jobs/2172339948

thanks
-- PMM


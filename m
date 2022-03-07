Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936F4D0511
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:14:56 +0100 (CET)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGwh-0000cD-OQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGvK-0007r2-5n
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:13:30 -0500
Received: from [2607:f8b0:4864:20::1134] (port=32775
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGvI-0003rP-Eh
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:13:29 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dbd8777564so172480687b3.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+R+Rt9mlLflvDJam2vp7xh8llWJmOFdTgtnRgf2mUM=;
 b=nE8uINTf6nEYRgjS/IUaa9aoYQz9v6YXR90kmrBPtYIveol3K9I6NLg4szPbmYLAdf
 Co3Sru3HxmRB0cooYeoTqEwQgDip4Ltnbfu4uig9M7j9MSuHfY9bRDGWTnC54uveEzPQ
 tTrdftNVioqyxSzp+vgawVzpJEiDTo6x/q7UQAXbpZhztU/L3eA8nAR0uRlOeCTEagcW
 lpEkyUc8q1L7fK71B4eQgMiMtqUnwbP4XIVzI2CIKlLaVwBQyiMaISJj9Y66ol4IXIrk
 tatVzakqmoraB+ngpPSLenOhnDOl1Q2Stmt+Ln8cuk+IEr/l/PE8cJtzsveMyB9PosEe
 dhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+R+Rt9mlLflvDJam2vp7xh8llWJmOFdTgtnRgf2mUM=;
 b=w8IEpmY1wfAmh8Eh0DR1grEjDYv2L4kZdlsP/Q/Yw60v0cAy8RAGg9PScGicJ9ZtIN
 YuwUPTQzXV9IO/5DIeeGd5EQytog0sHyY/VP51DUYhY9cFElG9hFkx62xVf4ozEU7iZI
 bvv5AV/WjOSo81uJpByNAyPORFVYEhRXvoGqnxMGvbzRqX3SUPwZdq/apA9BqLK/pBIq
 04AOhUSF1bi1GWRvG5wZ0kSv43ZcQwJon6XjsfBg7MBDGkb2vuWlyW6G4is7U9YDt0DA
 IfE7YJTVTd2S+WQRUlwbsAdqyQPRR/lJWt6RjmiLZ/6btemaI8mF+yZupemp23LbI0AL
 z43w==
X-Gm-Message-State: AOAM530Nw+o9RxN/vJhZYCx2YCaBR8p/B2lp9uFdIZ298uXchW9Ud6PB
 HtbIOH+X6HdFuQuVHEBEbmqHqwYI7yvdUFXme+NKEA==
X-Google-Smtp-Source: ABdhPJybao5R9iCasp2sf0emrI9XKfEca2ilnwAZ5gdpA/xS0YXhYcxRDQpMhmgl4iSCs2ydMwGRTK4uPIfUsmlfWCY=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr9436156yws.347.1646673207315; Mon, 07
 Mar 2022 09:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
In-Reply-To: <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 17:13:16 +0000
Message-ID: <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 7 Mar 2022 at 17:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 7 Mar 2022 at 10:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 41d137fc631bd9315ff84727d780757d25054c58:
> >
> >   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-06 16:06:16 -0500)
> >
> > ----------------------------------------------------------------
> > virtio,pc,pci: features, cleanups, fixes
> >
> > vhost-user enabled on non-linux systems
> > beginning of nvme sriov support
> > bigger tx queue for vdpa
> > virtio iommu bypass
> > An FADT flag to detect legacy keyboards.
> >
> > Fixes, cleanups all over the place
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> Fails to build on the build-system-centos job:
>
> libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
> `qmp_decode_features':
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> reference to `gpu_map'
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> reference to `gpu_map'
> collect2: error: ld returned 1 exit status
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2172339948

Also fails on cross-win64-system:

https://gitlab.com/qemu-project/qemu/-/jobs/2172339938

../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
| ^
../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
| ^
../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
| ^
cc1: all warnings being treated as errors

-- PMM



>
> thanks
> -- PMM



-- 
12345678901234567890123456789012345678901234567890123456789012345678901234567890
         1         2         3         4         5         6         7         8


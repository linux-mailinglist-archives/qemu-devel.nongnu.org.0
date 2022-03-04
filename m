Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D74CE026
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:16:54 +0100 (CET)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGEH-000547-N4
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQGAy-0002jr-A7
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:13:28 -0500
Received: from [2607:f8b0:4864:20::1131] (port=44502
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQGAw-00070e-CW
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:13:27 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so106685447b3.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ykF4cG/Z7OAfCSePTnpc5vxiq+4N7sf+cDUasMiTG84=;
 b=OYGFCcq6k3zBB3TiUu+D81HD8Rj3pR8zrSR/hm19sRzaLGW+UBJGGxVpkOHzDb6ehH
 TYxccZj3YsMm/AXZS8nEi1zcxqiA+u9pB6HI9i+/8XJn2FGXRd2wegPzXIDKHWgY3+i9
 Ida6/fsQOp+0hq1BiZR1O8UMYwnqZpSi5Rwm3uGcex9iMR+LFbo6bRbYOQjWq3mQXv5H
 9IfoHlNihKtx7rLbMzoftc++/XXRnwKDdCp+mC8IgqTFWpaBAl5r/g5kUvLu6xqJ8k8O
 iISHbJI22SOlDz+nqBAG3Y2SmOEddQsl7T0hQw5ZZPsM4vN3Q0NyDQ6egN9P0ltxlF3c
 zCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ykF4cG/Z7OAfCSePTnpc5vxiq+4N7sf+cDUasMiTG84=;
 b=wznXHeMPCSZfdjaR+tGNBfXQwwg/zHqilIympjM950ENa0xc3tGy6/x1QYtsOv4Dv2
 bfWFKkXhivkVvhT48yUHVsuGGwCjf38o9Bxss2eLH+TVlD/q7umi2oU2qj6W8q1o7B+3
 9jbmkDnTzvuEFGbOxZc6PRVGkLjk6QC3AJPaN8VLGDJjqf1uCqJ+P6HBlrvttHY31/Ec
 H2nU7y+EYbDFI7ubqr4kEt0WNyRJcLl03aX18YM8swPUl9lcZ05UHCZ9m49/fva3KQcx
 CXw8CQKJnsWvl6EdZLSbRHBwN7PsxNtQQMLVtFdX+a/ZT0WAWTzTJR5dAHNeo2s+FwrV
 f5QA==
X-Gm-Message-State: AOAM533atRfvDUbPrAkvNCCicRGca2mVZfGi6glCGjo/0NWeeZVP6Qzs
 0awGCutbPW1NEtIAiPdAiL2pO6jI5U708p/ALDu0OQ==
X-Google-Smtp-Source: ABdhPJxhpbbP3RO5wZYaykUSPhw0umpGJYqcF1gg4N+QflkriAjYRSz/r33iLAG1vQZ8BA+6NcWRpPn/AqwWBFmDAc4=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr679967ywf.469.1646432005217; Fri, 04 Mar
 2022 14:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20220304133556.233983-1-mst@redhat.com>
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 22:13:13 +0000
Message-ID: <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
Subject: Re: [PULL 00/45] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 4 Mar 2022 at 13:37, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd=
1f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20302' into staging (2022-03-03 14:46:48 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 74bc2c502da74191a34fb61b4c890061368269c8:
>
>   docs: vhost-user: add subsection for non-Linux platforms (2022-03-04 08=
:30:53 -0500)
>
> ----------------------------------------------------------------
> virtio,pc,pci: features, cleanups, fixes
>
> vhost-user enabled on non-linux systems
> beginning of nvme sriov support
> bigger tx queue for vdpa
> virtio iommu bypass
> pci tests for arm
>
> Fixes, cleanups all over the place
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------

This failed an assertion on ppc64:

>>> G_TEST_DBUS_DAEMON=3D/home/pm215/qemu/tests/dbus-vmstate-daemon.sh QTES=
T_QEMU_BINARY=3D./qemu-system-aarch64 QTEST_QEMU_IMG=3D./qemu-img QTEST_QEM=
U_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon MALLOC_PERTU=
RB_=3D120 /home/pm215/qemu/build/all/tests/qtest/qos-test --tap -k
=E2=96=B6  71/716 /aarch64/xlnx-zcu102/generic-sdhci/sdhci/sdhci-tests/regi=
sters
         OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/AC9=
7/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e10=
00/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e10=
00-82544gc/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e10=
00-82545em/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
550/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
551/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
557a/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
557b/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
557c/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
558a/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
558b/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
559a/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
559b/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
559c/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
559er/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
562/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82=
801/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/ES1=
370/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/meg=
asas/pci-device/pci-device-tests/nop
OK
=E2=96=B6  71/716 ERROR:../../tests/qtest/libqos/pci.c:232:qpci_device_enab=
le:
assertion failed (cmd & PCI_COMMAND_IO =3D=3D PCI_COMMAND_IO): (0x00000000
=3D=3D 0x00000001) ERROR



-- PMM


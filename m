Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F515A7F5D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:55:32 +0200 (CEST)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOBn-0002Xg-LN
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO8c-0007Uq-GJ; Wed, 31 Aug 2022 09:52:14 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:37480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO8Y-00039u-0E; Wed, 31 Aug 2022 09:52:13 -0400
Received: by mail-lj1-x22b.google.com with SMTP id x10so14687232ljq.4;
 Wed, 31 Aug 2022 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9HRhfBeqR6k1BIWhxWK/PfLMP4HuYaWp6MLUL7Zx/tI=;
 b=lmlFLhgNZ/DnWhrs5Krw1OOFQa0rrj1lzEoKqSpDCxEr0gtXiCKekvobalhyfDIaLo
 xtwmmbn5/RC+x+RIgfo8/LJH5rrJbBo/Nb0/M7MLHku9oMaspHTEYuP25r7HiHTTk2qT
 cepvNUdlbV36yu/t9+P140Bqj5ZA5+RIJL+u+6w+KRYx1mdHgbbfCSpmVcEholao/f2C
 E/CZ+2oYmg5N0jlBeqCuO/XLOu6skoV70Lnu5XLtvhHz1o31UOLNmLb61J5L6kRUH2G/
 YruDRj5YG6Cg1BSGIV2Pv0XhWIU/uvY5aMw28wWlHBzUnydqNs27EdkkBplFDP/PfH3K
 8QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9HRhfBeqR6k1BIWhxWK/PfLMP4HuYaWp6MLUL7Zx/tI=;
 b=GHisSBidgTmIUjBwzVGxvXoiYKD9P9n6Se8CzWHOaGDGrJSeaWPXNzLLeeViZR5JAX
 7vlqC3IqWuIwWCV5F46EXMh3X5NJl2hO2sptHOaKDSU7/6KshjG8e+HBClEuDRZZX0eq
 iGzUjhVjPPa2KC6BOpTg60Ga4FOrKx4hOskAoZ1N15UiI3vpSxE97syg7y2TAXTpPPIo
 C/2RkvWsONowTpwk7UI+iTeSmrCkS3fCGeApux6xoQ2q+YLj6Pa7ZcVjZfngHJtuYON6
 REfmrajVVnklYkG5O+pIWeGYN/o3w3auYe+UVDqiRNifk8hydndBlQHbHFv/k2i+rGcC
 oHig==
X-Gm-Message-State: ACgBeo3ba7JftrAymZkehmjfQr9DZhhEtYcHmdnMW/H75HACT95Z6q4M
 rQ58wGznALB8zSabYmIg4BaF6IeCBL0wWGsP2M0=
X-Google-Smtp-Source: AA6agR7fLGOAEldhAMqIIGW1TMUNDRSLsjiqjCo4sxE8ZNMWIclc25H/wbd5Hh9S0o2VqqvGmltM4D8FMztFFr0xFmM=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr8465651ljq.529.1661953927815; Wed, 31
 Aug 2022 06:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-26-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-26-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:51:56 +0400
Message-ID: <CAJ+F1CLibf+A-H3nmmwhNhppJr_y70EqioRcsEXo8o4j=udoZg@mail.gmail.com>
Subject: Re: [PATCH 25/51] tests/qtest: libqos: Rename malloc.h to
 libqos-malloc.h
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000080278d05e789cd0d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000080278d05e789cd0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The qtest/libqos directory is included via the "-I" option to search
> for header files when building qtest. Unfortunately the malloc.h has
> a name conflict with the standard libc header, leading to a build
> failure on the Windows host, due to the MinGW libc stdlib.h header
> file includes malloc.h and it now gets wrongly pointed to the one
> in the qtest/libqos directory.
>
> Rename "qtest/libqos/malloc.h" to "qtest/libqos/libqos-malloc.h" to
> avoid the namespace pollution.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/libqos/generic-pcihost.h             | 2 +-
>  tests/qtest/libqos/{malloc.h =3D> libqos-malloc.h} | 0
>  tests/qtest/libqos/libqos.h                      | 2 +-
>  tests/qtest/libqos/malloc-pc.h                   | 2 +-
>  tests/qtest/libqos/malloc-spapr.h                | 2 +-
>  tests/qtest/libqos/pci-pc.h                      | 2 +-
>  tests/qtest/libqos/pci-spapr.h                   | 2 +-
>  tests/qtest/libqos/qgraph.h                      | 2 +-
>  tests/qtest/libqos/qos_external.h                | 2 +-
>  tests/qtest/libqos/rtas.h                        | 2 +-
>  tests/qtest/libqos/virtio.h                      | 2 +-
>  tests/qtest/e1000e-test.c                        | 2 +-
>  tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
>  tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
>  tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
>  tests/qtest/libqos/arm-n800-machine.c            | 2 +-
>  tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
>  tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
>  tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
>  tests/qtest/libqos/arm-virt-machine.c            | 2 +-
>  tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
>  tests/qtest/libqos/e1000e.c                      | 2 +-
>  tests/qtest/libqos/{malloc.c =3D> libqos-malloc.c} | 2 +-
>  tests/qtest/libqos/qos_external.c                | 2 +-
>  tests/qtest/libqos/virtio-mmio.c                 | 2 +-
>  tests/qtest/libqos/virtio-pci.c                  | 2 +-
>  tests/qtest/qos-test.c                           | 2 +-
>  tests/qtest/libqos/meson.build                   | 2 +-
>  28 files changed, 27 insertions(+), 27 deletions(-)
>  rename tests/qtest/libqos/{malloc.h =3D> libqos-malloc.h} (100%)
>  rename tests/qtest/libqos/{malloc.c =3D> libqos-malloc.c} (99%)
>
> diff --git a/tests/qtest/libqos/generic-pcihost.h
> b/tests/qtest/libqos/generic-pcihost.h
> index c693c769df..6493a8712a 100644
> --- a/tests/qtest/libqos/generic-pcihost.h
> +++ b/tests/qtest/libqos/generic-pcihost.h
> @@ -14,7 +14,7 @@
>  #define LIBQOS_GENERIC_PCIHOST_H
>
>  #include "pci.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>
>  typedef struct QGenericPCIBus {
> diff --git a/tests/qtest/libqos/malloc.h
> b/tests/qtest/libqos/libqos-malloc.h
> similarity index 100%
> rename from tests/qtest/libqos/malloc.h
> rename to tests/qtest/libqos/libqos-malloc.h
> diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
> index ba7df448ca..9b4dd509f0 100644
> --- a/tests/qtest/libqos/libqos.h
> +++ b/tests/qtest/libqos/libqos.h
> @@ -3,7 +3,7 @@
>
>  #include "../libqtest.h"
>  #include "pci.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>
>  typedef struct QOSState QOSState;
>
> diff --git a/tests/qtest/libqos/malloc-pc.h
> b/tests/qtest/libqos/malloc-pc.h
> index d8d79853c8..e531473601 100644
> --- a/tests/qtest/libqos/malloc-pc.h
> +++ b/tests/qtest/libqos/malloc-pc.h
> @@ -13,7 +13,7 @@
>  #ifndef LIBQOS_MALLOC_PC_H
>  #define LIBQOS_MALLOC_PC_H
>
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>
>  void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags=
);
>
> diff --git a/tests/qtest/libqos/malloc-spapr.h
> b/tests/qtest/libqos/malloc-spapr.h
> index f99572fd71..f544c0d611 100644
> --- a/tests/qtest/libqos/malloc-spapr.h
> +++ b/tests/qtest/libqos/malloc-spapr.h
> @@ -8,7 +8,7 @@
>  #ifndef LIBQOS_MALLOC_SPAPR_H
>  #define LIBQOS_MALLOC_SPAPR_H
>
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>
>  void spapr_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts
> flags);
>
> diff --git a/tests/qtest/libqos/pci-pc.h b/tests/qtest/libqos/pci-pc.h
> index 49ec9507f2..849bd493de 100644
> --- a/tests/qtest/libqos/pci-pc.h
> +++ b/tests/qtest/libqos/pci-pc.h
> @@ -14,7 +14,7 @@
>  #define LIBQOS_PCI_PC_H
>
>  #include "pci.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>
>  typedef struct QPCIBusPC {
> diff --git a/tests/qtest/libqos/pci-spapr.h
> b/tests/qtest/libqos/pci-spapr.h
> index 20a43718b7..3dbf1e58ae 100644
> --- a/tests/qtest/libqos/pci-spapr.h
> +++ b/tests/qtest/libqos/pci-spapr.h
> @@ -8,7 +8,7 @@
>  #ifndef LIBQOS_PCI_SPAPR_H
>  #define LIBQOS_PCI_SPAPR_H
>
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "pci.h"
>  #include "qgraph.h"
>
> diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> index 871740c0dc..6e94824d09 100644
> --- a/tests/qtest/libqos/qgraph.h
> +++ b/tests/qtest/libqos/qgraph.h
> @@ -21,7 +21,7 @@
>
>  #include <gmodule.h>
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>
>  /* maximum path length */
>  #define QOS_PATH_MAX_ELEMENT_SIZE 50
> diff --git a/tests/qtest/libqos/qos_external.h
> b/tests/qtest/libqos/qos_external.h
> index 8446e3df0b..ea37364887 100644
> --- a/tests/qtest/libqos/qos_external.h
> +++ b/tests/qtest/libqos/qos_external.h
> @@ -21,7 +21,7 @@
>
>  #include "qgraph.h"
>
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qapi/qapi-types-machine.h"
>  #include "qapi/qapi-types-qom.h"
>
> diff --git a/tests/qtest/libqos/rtas.h b/tests/qtest/libqos/rtas.h
> index f38f99dfab..be8353d505 100644
> --- a/tests/qtest/libqos/rtas.h
> +++ b/tests/qtest/libqos/rtas.h
> @@ -5,7 +5,7 @@
>
>  #ifndef LIBQOS_RTAS_H
>  #define LIBQOS_RTAS_H
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>
>  int qrtas_get_time_of_day(QTestState *qts, QGuestAllocator *alloc,
>                            struct tm *tm, uint32_t *ns);
> diff --git a/tests/qtest/libqos/virtio.h b/tests/qtest/libqos/virtio.h
> index b8bd06e1b8..7adc7cbd10 100644
> --- a/tests/qtest/libqos/virtio.h
> +++ b/tests/qtest/libqos/virtio.h
> @@ -10,7 +10,7 @@
>  #ifndef LIBQOS_VIRTIO_H
>  #define LIBQOS_VIRTIO_H
>
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "standard-headers/linux/virtio_ring.h"
>
>  #define QVIRTIO_F_BAD_FEATURE           0x40000000ull
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index c98779c7c0..4cdd8238f2 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -31,7 +31,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
>  #include "qemu/bitops.h"
> -#include "libqos/malloc.h"
> +#include "libqos/libqos-malloc.h"
>  #include "libqos/e1000e.h"
>
>  static void e1000e_send_verify(QE1000E *d, int *test_sockets,
> QGuestAllocator *alloc)
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index c856d3d500..3a3d9c16dd 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -23,7 +23,7 @@
>  #include "qemu/main-loop.h"
>
>  #include "tests/qtest/libqtest.h"
> -#include "tests/qtest/libqos/malloc.h"
> +#include "tests/qtest/libqos/libqos-malloc.h"
>  #include "tests/qtest/libqos/qgraph.h"
>  #include "tests/qtest/libqos/qgraph_internal.h"
>  #include "tests/qtest/libqos/qos_external.h"
> diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
> b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
> index c8a3ea11eb..ab24add8eb 100644
> --- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
> +++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "sdhci.h"
>
> diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c
> b/tests/qtest/libqos/arm-imx25-pdk-machine.c
> index 54d0c95330..8fe128fae8 100644
> --- a/tests/qtest/libqos/arm-imx25-pdk-machine.c
> +++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c
> @@ -20,7 +20,7 @@
>
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "i2c.h"
>
> diff --git a/tests/qtest/libqos/arm-n800-machine.c
> b/tests/qtest/libqos/arm-n800-machine.c
> index ecd46b1daf..4e5afe0164 100644
> --- a/tests/qtest/libqos/arm-n800-machine.c
> +++ b/tests/qtest/libqos/arm-n800-machine.c
> @@ -20,7 +20,7 @@
>
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "i2c.h"
>
> diff --git a/tests/qtest/libqos/arm-raspi2-machine.c
> b/tests/qtest/libqos/arm-raspi2-machine.c
> index 0a2943440b..367c6c17a5 100644
> --- a/tests/qtest/libqos/arm-raspi2-machine.c
> +++ b/tests/qtest/libqos/arm-raspi2-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "sdhci.h"
>
> diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c
> b/tests/qtest/libqos/arm-sabrelite-machine.c
> index ec19a01660..94f6a20fc7 100644
> --- a/tests/qtest/libqos/arm-sabrelite-machine.c
> +++ b/tests/qtest/libqos/arm-sabrelite-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "sdhci.h"
>
> diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c
> b/tests/qtest/libqos/arm-smdkc210-machine.c
> index 4bff249ee8..9bbce924ea 100644
> --- a/tests/qtest/libqos/arm-smdkc210-machine.c
> +++ b/tests/qtest/libqos/arm-smdkc210-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "sdhci.h"
>
> diff --git a/tests/qtest/libqos/arm-virt-machine.c
> b/tests/qtest/libqos/arm-virt-machine.c
> index 139eaba142..4e87405b58 100644
> --- a/tests/qtest/libqos/arm-virt-machine.c
> +++ b/tests/qtest/libqos/arm-virt-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "virtio-mmio.h"
>  #include "generic-pcihost.h"
> diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
> b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
> index 3be80020a6..daac762a06 100644
> --- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
> +++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "../libqtest.h"
>  #include "qemu/module.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "sdhci.h"
>
> diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
> index f87e0e84b2..fc14b07884 100644
> --- a/tests/qtest/libqos/e1000e.c
> +++ b/tests/qtest/libqos/e1000e.c
> @@ -23,7 +23,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
>  #include "qemu/bitops.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "e1000e.h"
>
> diff --git a/tests/qtest/libqos/malloc.c
> b/tests/qtest/libqos/libqos-malloc.c
> similarity index 99%
> rename from tests/qtest/libqos/malloc.c
> rename to tests/qtest/libqos/libqos-malloc.c
> index f0c8f950c8..d7566972c4 100644
> --- a/tests/qtest/libqos/malloc.c
> +++ b/tests/qtest/libqos/libqos-malloc.c
> @@ -11,7 +11,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qemu/host-utils.h"
>
>  typedef struct MemBlock {
> diff --git a/tests/qtest/libqos/qos_external.c
> b/tests/qtest/libqos/qos_external.c
> index b7a0b873a3..c6bb8bff09 100644
> --- a/tests/qtest/libqos/qos_external.c
> +++ b/tests/qtest/libqos/qos_external.c
> @@ -24,7 +24,7 @@
>  #include "qapi/qmp/qstring.h"
>  #include "qemu/module.h"
>  #include "qapi/qmp/qlist.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "qgraph_internal.h"
>  #include "qos_external.h"
> diff --git a/tests/qtest/libqos/virtio-mmio.c
> b/tests/qtest/libqos/virtio-mmio.c
> index a6cca8613b..bd0b1d890b 100644
> --- a/tests/qtest/libqos/virtio-mmio.c
> +++ b/tests/qtest/libqos/virtio-mmio.c
> @@ -12,7 +12,7 @@
>  #include "qemu/module.h"
>  #include "virtio.h"
>  #include "virtio-mmio.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "qgraph.h"
>  #include "standard-headers/linux/virtio_ring.h"
>
> diff --git a/tests/qtest/libqos/virtio-pci.c
> b/tests/qtest/libqos/virtio-pci.c
> index 67c2498c84..485b8f6b7e 100644
> --- a/tests/qtest/libqos/virtio-pci.c
> +++ b/tests/qtest/libqos/virtio-pci.c
> @@ -13,7 +13,7 @@
>  #include "virtio-pci.h"
>  #include "pci.h"
>  #include "pci-pc.h"
> -#include "malloc.h"
> +#include "libqos-malloc.h"
>  #include "malloc-pc.h"
>  #include "qgraph.h"
>  #include "standard-headers/linux/virtio_ring.h"
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index f97d0a08fd..831db5cf2a 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -25,7 +25,7 @@
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qapi-visit-machine.h"
>  #include "qapi/qapi-visit-qom.h"
> -#include "libqos/malloc.h"
> +#include "libqos/libqos-malloc.h"
>  #include "libqos/qgraph.h"
>  #include "libqos/qgraph_internal.h"
>  #include "libqos/qos_external.h"
> diff --git a/tests/qtest/libqos/meson.build
> b/tests/qtest/libqos/meson.build
> index fd5d6e5ae1..cff83c86d9 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -6,7 +6,7 @@ libqos_srcs =3D files(
>          'qos_external.c',
>          'pci.c',
>          'fw_cfg.c',
> -        'malloc.c',
> +        'libqos-malloc.c',
>          'libqos.c',
>          'sdhci-cmd.c',
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000080278d05e789cd0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:22 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzho=
u Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank"=
>xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
The qtest/libqos directory is included via the &quot;-I&quot; option to sea=
rch<br>
for header files when building qtest. Unfortunately the malloc.h has<br>
a name conflict with the standard libc header, leading to a build<br>
failure on the Windows host, due to the MinGW libc stdlib.h header<br>
file includes malloc.h and it now gets wrongly pointed to the one<br>
in the qtest/libqos directory.<br>
<br>
Rename &quot;qtest/libqos/malloc.h&quot; to &quot;qtest/libqos/libqos-mallo=
c.h&quot; to<br>
avoid the namespace pollution.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/libqos/generic-pcihost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqos/{malloc.h =3D&gt; libqos-malloc.h} | 0<br>
=C2=A0tests/qtest/libqos/libqos.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/malloc-pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqos/malloc-spapr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/pci-pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/pci-spapr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqos/qgraph.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/qos_external.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/rtas.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/virtio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/e1000e-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/fuzz/qos_fuzz.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-<br>
=C2=A0tests/qtest/libqos/arm-imx25-pdk-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0tests/qtest/libqos/arm-n800-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/arm-raspi2-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/arm-sabrelite-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0tests/qtest/libqos/arm-smdkc210-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
=C2=A0tests/qtest/libqos/arm-virt-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c=C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/e1000e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/{malloc.c =3D&gt; libqos-malloc.c} | 2 +-<br>
=C2=A0tests/qtest/libqos/qos_external.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/libqos/virtio-mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqos/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0tests/qtest/qos-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0tests/qtest/libqos/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A028 files changed, 27 insertions(+), 27 deletions(-)<br>
=C2=A0rename tests/qtest/libqos/{malloc.h =3D&gt; libqos-malloc.h} (100%)<b=
r>
=C2=A0rename tests/qtest/libqos/{malloc.c =3D&gt; libqos-malloc.c} (99%)<br=
>
<br>
diff --git a/tests/qtest/libqos/generic-pcihost.h b/tests/qtest/libqos/gene=
ric-pcihost.h<br>
index c693c769df..6493a8712a 100644<br>
--- a/tests/qtest/libqos/generic-pcihost.h<br>
+++ b/tests/qtest/libqos/generic-pcihost.h<br>
@@ -14,7 +14,7 @@<br>
=C2=A0#define LIBQOS_GENERIC_PCIHOST_H<br>
<br>
=C2=A0#include &quot;pci.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
<br>
=C2=A0typedef struct QGenericPCIBus {<br>
diff --git a/tests/qtest/libqos/malloc.h b/tests/qtest/libqos/libqos-malloc=
.h<br>
similarity index 100%<br>
rename from tests/qtest/libqos/malloc.h<br>
rename to tests/qtest/libqos/libqos-malloc.h<br>
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h<br>
index ba7df448ca..9b4dd509f0 100644<br>
--- a/tests/qtest/libqos/libqos.h<br>
+++ b/tests/qtest/libqos/libqos.h<br>
@@ -3,7 +3,7 @@<br>
<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;pci.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0typedef struct QOSState QOSState;<br>
<br>
diff --git a/tests/qtest/libqos/malloc-pc.h b/tests/qtest/libqos/malloc-pc.=
h<br>
index d8d79853c8..e531473601 100644<br>
--- a/tests/qtest/libqos/malloc-pc.h<br>
+++ b/tests/qtest/libqos/malloc-pc.h<br>
@@ -13,7 +13,7 @@<br>
=C2=A0#ifndef LIBQOS_MALLOC_PC_H<br>
=C2=A0#define LIBQOS_MALLOC_PC_H<br>
<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts fl=
ags);<br>
<br>
diff --git a/tests/qtest/libqos/malloc-spapr.h b/tests/qtest/libqos/malloc-=
spapr.h<br>
index f99572fd71..f544c0d611 100644<br>
--- a/tests/qtest/libqos/malloc-spapr.h<br>
+++ b/tests/qtest/libqos/malloc-spapr.h<br>
@@ -8,7 +8,7 @@<br>
=C2=A0#ifndef LIBQOS_MALLOC_SPAPR_H<br>
=C2=A0#define LIBQOS_MALLOC_SPAPR_H<br>
<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0void spapr_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts=
 flags);<br>
<br>
diff --git a/tests/qtest/libqos/pci-pc.h b/tests/qtest/libqos/pci-pc.h<br>
index 49ec9507f2..849bd493de 100644<br>
--- a/tests/qtest/libqos/pci-pc.h<br>
+++ b/tests/qtest/libqos/pci-pc.h<br>
@@ -14,7 +14,7 @@<br>
=C2=A0#define LIBQOS_PCI_PC_H<br>
<br>
=C2=A0#include &quot;pci.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
<br>
=C2=A0typedef struct QPCIBusPC {<br>
diff --git a/tests/qtest/libqos/pci-spapr.h b/tests/qtest/libqos/pci-spapr.=
h<br>
index 20a43718b7..3dbf1e58ae 100644<br>
--- a/tests/qtest/libqos/pci-spapr.h<br>
+++ b/tests/qtest/libqos/pci-spapr.h<br>
@@ -8,7 +8,7 @@<br>
=C2=A0#ifndef LIBQOS_PCI_SPAPR_H<br>
=C2=A0#define LIBQOS_PCI_SPAPR_H<br>
<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;pci.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h<br>
index 871740c0dc..6e94824d09 100644<br>
--- a/tests/qtest/libqos/qgraph.h<br>
+++ b/tests/qtest/libqos/qgraph.h<br>
@@ -21,7 +21,7 @@<br>
<br>
=C2=A0#include &lt;gmodule.h&gt;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0/* maximum path length */<br>
=C2=A0#define QOS_PATH_MAX_ELEMENT_SIZE 50<br>
diff --git a/tests/qtest/libqos/qos_external.h b/tests/qtest/libqos/qos_ext=
ernal.h<br>
index 8446e3df0b..ea37364887 100644<br>
--- a/tests/qtest/libqos/qos_external.h<br>
+++ b/tests/qtest/libqos/qos_external.h<br>
@@ -21,7 +21,7 @@<br>
<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-types-machine.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-types-qom.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/rtas.h b/tests/qtest/libqos/rtas.h<br>
index f38f99dfab..be8353d505 100644<br>
--- a/tests/qtest/libqos/rtas.h<br>
+++ b/tests/qtest/libqos/rtas.h<br>
@@ -5,7 +5,7 @@<br>
<br>
=C2=A0#ifndef LIBQOS_RTAS_H<br>
=C2=A0#define LIBQOS_RTAS_H<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0int qrtas_get_time_of_day(QTestState *qts, QGuestAllocator *alloc,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct tm *tm, uint32_t *ns);<br>
diff --git a/tests/qtest/libqos/virtio.h b/tests/qtest/libqos/virtio.h<br>
index b8bd06e1b8..7adc7cbd10 100644<br>
--- a/tests/qtest/libqos/virtio.h<br>
+++ b/tests/qtest/libqos/virtio.h<br>
@@ -10,7 +10,7 @@<br>
=C2=A0#ifndef LIBQOS_VIRTIO_H<br>
=C2=A0#define LIBQOS_VIRTIO_H<br>
<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;standard-headers/linux/virtio_ring.h&quot;<br>
<br>
=C2=A0#define QVIRTIO_F_BAD_FEATURE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x40000000ull<br>
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c<br>
index c98779c7c0..4cdd8238f2 100644<br>
--- a/tests/qtest/e1000e-test.c<br>
+++ b/tests/qtest/e1000e-test.c<br>
@@ -31,7 +31,7 @@<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
-#include &quot;libqos/malloc.h&quot;<br>
+#include &quot;libqos/libqos-malloc.h&quot;<br>
=C2=A0#include &quot;libqos/e1000e.h&quot;<br>
<br>
=C2=A0static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestA=
llocator *alloc)<br>
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c<br>
index c856d3d500..3a3d9c16dd 100644<br>
--- a/tests/qtest/fuzz/qos_fuzz.c<br>
+++ b/tests/qtest/fuzz/qos_fuzz.c<br>
@@ -23,7 +23,7 @@<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
<br>
=C2=A0#include &quot;tests/qtest/libqtest.h&quot;<br>
-#include &quot;tests/qtest/libqos/malloc.h&quot;<br>
+#include &quot;tests/qtest/libqos/libqos-malloc.h&quot;<br>
=C2=A0#include &quot;tests/qtest/libqos/qgraph.h&quot;<br>
=C2=A0#include &quot;tests/qtest/libqos/qgraph_internal.h&quot;<br>
=C2=A0#include &quot;tests/qtest/libqos/qos_external.h&quot;<br>
diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c b/tests/qtest=
/libqos/aarch64-xlnx-zcu102-machine.c<br>
index c8a3ea11eb..ab24add8eb 100644<br>
--- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c<br>
+++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;sdhci.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c b/tests/qtest/libqo=
s/arm-imx25-pdk-machine.c<br>
index 54d0c95330..8fe128fae8 100644<br>
--- a/tests/qtest/libqos/arm-imx25-pdk-machine.c<br>
+++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c<br>
@@ -20,7 +20,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;i2c.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-n800-machine.c b/tests/qtest/libqos/arm=
-n800-machine.c<br>
index ecd46b1daf..4e5afe0164 100644<br>
--- a/tests/qtest/libqos/arm-n800-machine.c<br>
+++ b/tests/qtest/libqos/arm-n800-machine.c<br>
@@ -20,7 +20,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;i2c.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/a=
rm-raspi2-machine.c<br>
index 0a2943440b..367c6c17a5 100644<br>
--- a/tests/qtest/libqos/arm-raspi2-machine.c<br>
+++ b/tests/qtest/libqos/arm-raspi2-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;sdhci.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c b/tests/qtest/libqo=
s/arm-sabrelite-machine.c<br>
index ec19a01660..94f6a20fc7 100644<br>
--- a/tests/qtest/libqos/arm-sabrelite-machine.c<br>
+++ b/tests/qtest/libqos/arm-sabrelite-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;sdhci.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c b/tests/qtest/libqos=
/arm-smdkc210-machine.c<br>
index 4bff249ee8..9bbce924ea 100644<br>
--- a/tests/qtest/libqos/arm-smdkc210-machine.c<br>
+++ b/tests/qtest/libqos/arm-smdkc210-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;sdhci.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm=
-virt-machine.c<br>
index 139eaba142..4e87405b58 100644<br>
--- a/tests/qtest/libqos/arm-virt-machine.c<br>
+++ b/tests/qtest/libqos/arm-virt-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;virtio-mmio.h&quot;<br>
=C2=A0#include &quot;generic-pcihost.h&quot;<br>
diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c b/tests/qtest/=
libqos/arm-xilinx-zynq-a9-machine.c<br>
index 3be80020a6..daac762a06 100644<br>
--- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c<br>
+++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c<br>
@@ -19,7 +19,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;sdhci.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c<br>
index f87e0e84b2..fc14b07884 100644<br>
--- a/tests/qtest/libqos/e1000e.c<br>
+++ b/tests/qtest/libqos/e1000e.c<br>
@@ -23,7 +23,7 @@<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;e1000e.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/libqos-malloc=
.c<br>
similarity index 99%<br>
rename from tests/qtest/libqos/malloc.c<br>
rename to tests/qtest/libqos/libqos-malloc.c<br>
index f0c8f950c8..d7566972c4 100644<br>
--- a/tests/qtest/libqos/malloc.c<br>
+++ b/tests/qtest/libqos/libqos-malloc.c<br>
@@ -11,7 +11,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0typedef struct MemBlock {<br>
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_ext=
ernal.c<br>
index b7a0b873a3..c6bb8bff09 100644<br>
--- a/tests/qtest/libqos/qos_external.c<br>
+++ b/tests/qtest/libqos/qos_external.c<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;qgraph_internal.h&quot;<br>
=C2=A0#include &quot;qos_external.h&quot;<br>
diff --git a/tests/qtest/libqos/virtio-mmio.c b/tests/qtest/libqos/virtio-m=
mio.c<br>
index a6cca8613b..bd0b1d890b 100644<br>
--- a/tests/qtest/libqos/virtio-mmio.c<br>
+++ b/tests/qtest/libqos/virtio-mmio.c<br>
@@ -12,7 +12,7 @@<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;virtio.h&quot;<br>
=C2=A0#include &quot;virtio-mmio.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;standard-headers/linux/virtio_ring.h&quot;<br>
<br>
diff --git a/tests/qtest/libqos/virtio-pci.c b/tests/qtest/libqos/virtio-pc=
i.c<br>
index 67c2498c84..485b8f6b7e 100644<br>
--- a/tests/qtest/libqos/virtio-pci.c<br>
+++ b/tests/qtest/libqos/virtio-pci.c<br>
@@ -13,7 +13,7 @@<br>
=C2=A0#include &quot;virtio-pci.h&quot;<br>
=C2=A0#include &quot;pci.h&quot;<br>
=C2=A0#include &quot;pci-pc.h&quot;<br>
-#include &quot;malloc.h&quot;<br>
+#include &quot;libqos-malloc.h&quot;<br>
=C2=A0#include &quot;malloc-pc.h&quot;<br>
=C2=A0#include &quot;qgraph.h&quot;<br>
=C2=A0#include &quot;standard-headers/linux/virtio_ring.h&quot;<br>
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c<br>
index f97d0a08fd..831db5cf2a 100644<br>
--- a/tests/qtest/qos-test.c<br>
+++ b/tests/qtest/qos-test.c<br>
@@ -25,7 +25,7 @@<br>
=C2=A0#include &quot;qapi/qobject-input-visitor.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-machine.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-qom.h&quot;<br>
-#include &quot;libqos/malloc.h&quot;<br>
+#include &quot;libqos/libqos-malloc.h&quot;<br>
=C2=A0#include &quot;libqos/qgraph.h&quot;<br>
=C2=A0#include &quot;libqos/qgraph_internal.h&quot;<br>
=C2=A0#include &quot;libqos/qos_external.h&quot;<br>
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.buil=
d<br>
index fd5d6e5ae1..cff83c86d9 100644<br>
--- a/tests/qtest/libqos/meson.build<br>
+++ b/tests/qtest/libqos/meson.build<br>
@@ -6,7 +6,7 @@ libqos_srcs =3D files(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qos_external.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pci.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fw_cfg.c&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;malloc.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libqos-malloc.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;libqos.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sdhci-cmd.c&#39;,<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000080278d05e789cd0d--


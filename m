Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6E34D3A8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:22:59 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtjG-0001Ei-2v
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQtiB-0000Yj-Jo
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:21:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQti9-0005dC-SS
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:21:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so8675027wmq.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1TwXN7+AWJEtlFeRZAci481NKtKfPy8PmCFCx5pJvho=;
 b=yKqF3GzEB21mHXb089VNt2IbtVIEFuZhJuEcdLyzgA/6hTAvCxOVrhlPSFAxsJDmKQ
 evbNKzuNgKc4FD0MnyV55HiX11jawjRnji+jocc0uWbdv/Rjfc22I3qDUpq92HYt3WKY
 RAZy20W7qqwFNeg3zwWfKtHPGGpcNkFlH8iZU3s74EG9lsZcKCrZEdXNLkP077+YPy9l
 xt1ayaDsC3+bwdU2NLYUuQszDqjy9E6Pyquqi6GcZY7dh922lbp/Vzf+d2iCtX5ABPna
 4zZfEBcil1hyEGhp5QV8vFI5tiq7wNuEAlErYTWkW4JBuNykgMeYQndk3ZsipRG3exLS
 EVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1TwXN7+AWJEtlFeRZAci481NKtKfPy8PmCFCx5pJvho=;
 b=iVHn+KdE67ZSF3+2gH3geHffmyQJPhlOquLuA0pv2KhgjnTTrs64oUqNpzMwk4MSRt
 s2eePVGE/GKww+lJHHLOr1AiUAlGn4BP4hS79QcEiv1+v86JK6F/9biXPS3DkBPOqCk2
 kSQirnYwDzy6iZmEn1FIiJpkhWxSy0MUMqu4K5NB16TWP+ZMdma81hSgXLG2ZhNGzx0i
 QymhlPd58yikxo9+FIJZPwq0nxoFe+tB6hGz1NzcnDfdYZYa8VLzQroO1Qr1iG2o2bEQ
 g/ScQlN0In9Hf3HAa9XyXEJRIfFmsdEGgi9zP0Gbe/f2MYJ+5NgLO0FgqMdC7NzdGtqu
 hDTw==
X-Gm-Message-State: AOAM533stRvhsijZhlQDZ9cLqY60tBWuamWzGFYcszIeThcZUuVJQX8K
 /QHfT1YcAMb7W/f3HpelWoFJcg==
X-Google-Smtp-Source: ABdhPJzP32yvghg6w9fJVABHk5zj/I+cXKSfuZPAridvNs/1OzUKcoDPBb+sf5A+Y0xJnzS6Zd89kg==
X-Received: by 2002:a05:600c:608:: with SMTP id
 o8mr26023974wmm.42.1617031306255; 
 Mon, 29 Mar 2021 08:21:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a131sm25990561wmc.48.2021.03.29.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:21:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 973DF1FF7E;
 Mon, 29 Mar 2021 16:21:44 +0100 (BST)
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <9fbb332cc66aa1df562ac0dd1f54166d68671681.1616570702.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/5] hw/virtio: add vhost-user-i2c-pci boilerplate
Date: Mon, 29 Mar 2021 16:19:13 +0100
In-reply-to: <9fbb332cc66aa1df562ac0dd1f54166d68671681.1616570702.git.viresh.kumar@linaro.org>
Message-ID: <87im5ax9x3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This allows is to instantiate a vhost-user-i2c device as part of a PCI
> bus. It is mostly boilerplate which looks pretty similar to the
> vhost-user-fs-pci device.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  hw/virtio/meson.build          |  1 +
>  hw/virtio/vhost-user-i2c-pci.c | 79 ++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-i2c-pci.c
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 1a0d736a0db5..bc352a600911 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files=
('virtio-rng.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.=
c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-=
i2c.c'))
> +virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_t=
rue: files('vhost-user-i2c-pci.c'))
>=20=20
>  virtio_pci_ss =3D ss.source_set()
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsoc=
k-pci.c'))
> diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pc=
i.c
> new file mode 100644
> index 000000000000..4bcfeafcb632
> --- /dev/null
> +++ b/hw/virtio/vhost-user-i2c-pci.c
> @@ -0,0 +1,79 @@
> +/*
> + * Vhost-user i2c virtio device PCI glue
> + *
> + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/virtio/vhost-user-i2c.h"
> +#include "virtio-pci.h"
> +
> +struct VHostUserI2CPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VHostUserI2C vdev;
> +};
> +
> +typedef struct VHostUserI2CPCI VHostUserI2CPCI;
> +
> +#define TYPE_VHOST_USER_I2C_PCI "vhost-user-i2c-pci-base"
> +
> +DECLARE_INSTANCE_CHECKER(VHostUserI2CPCI, VHOST_USER_I2C_PCI,
> +                         TYPE_VHOST_USER_I2C_PCI)
> +
> +static Property vhost_user_i2c_pci_properties[] =3D {
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),

I suspect we can drop the property if there is nothing useful the user
can specify here. We can just default to 1 on device realization.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


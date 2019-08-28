Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F59FE37
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 11:16:14 +0200 (CEST)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2u3p-0004Ab-Jo
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 05:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2u2Z-0003bK-5g
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 05:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2u2X-0005K1-1f
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 05:14:55 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2u2T-0005Gv-8w
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 05:14:51 -0400
Received: by mail-wm1-x344.google.com with SMTP id v15so1948189wml.0
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=0kS0DZKFZwQ5PrErvm8mV1nxguXBUPnQleK20HUZjbU=;
 b=pVXYPOjHnsMFSVJ6ngHTz9Wm7ysANiUTOXCsq0Qct5FdJlhaaOmHb3/9t0l6eUxDlL
 Y2C1YTssfZqtGjRE0XKKtZHt0+570Mpc5ITAfhRwYJxJUX8IEB5o6EMb/wv04QMbdydj
 Yxn36o6wee0MXjZ3OpQmjlHXKb8ijcw1hTX6a+BO0lxzNiX9Xk+T0ZatfF/jXcQ2YSLD
 Devp7G6ANSr79R7VuC94qGn7d3VKWD6zt0RUeMRL3yEtifNAl535lGPkeIWl4RHX5wHn
 ivVusfW2p9Kfj0OwcFnVgVKRzwB66D6JqSW5FvQu0dJhQXcxoQN2c2qG/OGYhhAhyZwV
 DIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=0kS0DZKFZwQ5PrErvm8mV1nxguXBUPnQleK20HUZjbU=;
 b=WDHUvAmmPiO3hVsi52uTvwqcS7+U47q1DAIcF1SRyvpNNWF4GdtiiS9JUth3eM2iDo
 PD8MpwJCLt7AP8g90QvLCmLAacWmCxYsiFytdqMAE+HwcCtWKyXMAoS33ljx/55tfcMz
 VLxGW5DUEzQAXYpYRJowjVsQbGDg8qPCHd53rRFddQW0w+BN1k0djBI8dwatx7SUanFO
 oz6eoXF8KLIv6c82V5Mj/y9TL8dXpBrm35ME4GJ4y9MZ1+RugfN2E4T0RXNXZfVq+iNM
 CpetA1cAxc5fdzw5nrKTrrhCtTcQqBt7n2OrUAHmU71s3LYfueyM6WUywKgZ3YQ5AWX9
 7aMQ==
X-Gm-Message-State: APjAAAXmwVv0Uoz426h71TIXj02HgfW1qvW+5cq9kWc4L2upicsqIYwK
 c8bmKgJ6qGnt2BArgaC9kpPi++SwTWA=
X-Google-Smtp-Source: APXvYqzRIJXsXc4UeaG427mAWAtI4UFJ/u9JBruvf60mK9oGUMAWeoIu3hpDvgKez5vYmDvOuEzf2g==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr1914199wma.78.1566983686087; 
 Wed, 28 Aug 2019 02:14:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s192sm1651229wme.17.2019.08.28.02.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:14:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE3351FF87;
 Wed, 28 Aug 2019 10:14:44 +0100 (BST)
References: <20190815132651.22410-1-stefanha@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190815132651.22410-1-stefanha@redhat.com>
Date: Wed, 28 Aug 2019 10:14:44 +0100
Message-ID: <87imqh648r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: add Stefan Hajnoczi as
 vhost-vsock maintainer
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> A MAINTAINERS entry wasn't added when this code was merged.  Add it now
> so that scripts/get_maintainer.pl works for vhost-vsock.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6de200453..b8fc408bf3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1571,6 +1571,13 @@ F: hw/virtio/virtio-crypto.c
>  F: hw/virtio/virtio-crypto-pci.c
>  F: include/hw/virtio/virtio-crypto.h
>
> +vhost-vsock
> +M: Stefan Hajnoczi <stefanha@redhat.com>
> +S: Supported
> +F: hw/virtio/vhost-vsock.c
> +F: hw/virtio/vhost-vsock-pci.c
> +F: include/hw/virtio/vhost-vsock.h
> +
>  nvme
>  M: Keith Busch <keith.busch@intel.com>
>  L: qemu-block@nongnu.org


--
Alex Benn=C3=A9e


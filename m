Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5133D0AEB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:01:28 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m686Z-0004oI-Sy
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m682h-0001vh-DX
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:57:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m682f-0006wk-Tf
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:57:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id d12so1278441wre.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ObtnWl2v+ym/6194D2nVazuWB4T/BNxzcckZfHn+nz0=;
 b=ZS8F0diynudXwwR3NOgsU5B20DF0LxoEEw14x8yfFjBumIFhy+UkZZv27kVYwtFwtl
 dp6Dx/HV3/yHTzszojTQK2RxYzwzKAEvsOVuL3uagnI8iGSBKfHxy8Ol/L6K+yqxUMNA
 iX/GLtaINos+QqK0fmLyWj51Hi3kBguiQ2H4gX63s7dvHRoPu7TY2kVggnUVLl7WP4mk
 N18fchv+lvx3OXSwScQlg4d3atfj71hC/seSQFK53VAsEfIXmziIbBy7Cx/5e2KVAAKQ
 sYcTDNjqAD6SUU8SLt5mrVhtL3dPt6H4rT9c2gBxIvmB7GS0CjDikfp6AvcFxmaAejbE
 DqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ObtnWl2v+ym/6194D2nVazuWB4T/BNxzcckZfHn+nz0=;
 b=CbGu7qEvZgyOvHLqF26p00F20VTyfS0n6ghEYTtWWK/esNAaJae8nAQozdNkk/YblW
 oLU/cdQXDrXquknQNWk330/fRHjY7s4g9Lp2SvCeJ3cqB1TYopUBLtl022cT8zj85Efv
 snkZtTZlndJGXdvJTn+nIU3CE5DIREb2pQRgYSkveCaiGnXTsusyzbYy9PzUZphp4/0b
 oC8zIzdC5M3NO10NVIb1O7+9YEmieE18ZYEwq5ng4Z4mPWQCz3U8tnxwTIH4dI0d8Ec4
 bj9JHQBWla/ag07PTliPCqrUc8gY6QygWe+tlvflggG+2Qob68sEQVyaGr3eEj0/EUS0
 TuAA==
X-Gm-Message-State: AOAM531gz6okvEtVlL2e1POUnkj4uyCTjH6EE4RJYUSuctVYAavM32EC
 vmUPyHFLslRwyHHGJhIaUA6m+Q==
X-Google-Smtp-Source: ABdhPJys5RRk/z/4qkx7YzJ1YUKXLE0C+Ulllg0xGUw0XPTg/Zk83Q/JK0fXnfblvC4CmFn1zibWwQ==
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr18802192wrh.67.1626857844487; 
 Wed, 21 Jul 2021 01:57:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm26883809wrp.34.2021.07.21.01.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 01:57:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E275B1FF7E;
 Wed, 21 Jul 2021 09:57:22 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-3-mathieu.poirier@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 2/4] vhost-user-rng-pci: Add vhost-user-rng-pci
 implementation
Date: Wed, 21 Jul 2021 09:56:50 +0100
In-reply-to: <20210710005929.1702431-3-mathieu.poirier@linaro.org>
Message-ID: <87k0lkkpsd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> This patch provides a PCI bus interface to the vhost-user-rng backed.
> The implentation is similar to what was done for vhost-user-i2c-pci and
> vhost-user-fs-pci.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
<snip>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index e386791f2a05..1430b370e64d 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files=
('virtio-rng.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.=
c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-=
rng.c'))
> +virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_t=
rue: files('vhost-user-rng-pci.c'))
>

Another minor merge conflict here to be fixed on rebase. Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


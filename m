Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06739B6DC9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 22:35:39 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAgfp-0006R7-Qv
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 16:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iAgeI-0005yL-4R
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 16:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAgeG-0006wH-Ub
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 16:34:01 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAgeG-0006ve-NM
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 16:34:00 -0400
Received: by mail-wm1-x344.google.com with SMTP id a6so1620403wma.5
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rxsK/uL8SAziIpZWmRH1ZT9nd3QUzm6vizZNol24XZE=;
 b=at6/8+u0xllCMbIPkyK4nk1USg/Gj4WPSza8dHek12wthtfN2GoVaRnhrCWvTeux86
 zKQAAuWqPFLquBLmNHVWxKvc4eIyQl4BRaFXRKS+ONd/TjFl7yrY07WLXrIiHvXj/hPg
 6RxNHtf2Bqqc+3Yub1+eq526BJnQIRN6mDrQDHrpiaka6F0rgrXo2Ke3HOkfmhLqHvbf
 fKWlmDriHO1oyIQPSdt8mXwjkg+zgDLLV6jvDP7SryOz+Xx1qmLEF1T/WGtugW5QbS2Y
 jmJE/5umfzwh8ys7EAiCx/+wM+7+3CAaDvUlrZH0trSixheG2WCWsvkSgVNE2zecW6Yc
 dO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=rxsK/uL8SAziIpZWmRH1ZT9nd3QUzm6vizZNol24XZE=;
 b=OOL51iMtd17rJ0wAPaLA59eajGP1k9dhP6lM3E+9YWyOi4RC3eZgfgkzcCFTbXFtyR
 T6JLUzz5l9hIbWQuRLUlgSL5Rm5gGF+vqtHAtqt3G+Qjjinnro18u3Z2KqNAVk+2wdE+
 jxsf+AWO0Jg6SvAPWZew8rj3Z9zff2MhGFPSp8H6Lr0fqM1mBpPFMLVrwOt8nijJECrf
 R0FozgfTboxtDEyTsXwCMTFVAcqdItly1ZYsc6TCKJvYglWC+znYEXUleMwyWM80pVWX
 ehV0MXDvJgnXR7gyJhQWwR3w1i62B7oksHKqQbFq93z+C4341ojm/neIQTMLDeem3DUV
 XWhQ==
X-Gm-Message-State: APjAAAWidMfzbsr4Z/Xz+XcIM44Zpmf0q4Rzl5uRC65FxqNx4wH8UJRB
 pf9j+4RpjU6aECSLkCWz0i/hPLKxye0=
X-Google-Smtp-Source: APXvYqyys5og+wt2PjH1UeyuczlNkPqGgnOftDQO4JfdNEEi1jsXVapP0+sPNLDOBIntL2lu7+Nplw==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr4502635wma.111.1568838838789; 
 Wed, 18 Sep 2019 13:33:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm605373wmc.3.2019.09.18.13.33.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 13:33:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 787551FF87
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 21:33:57 +0100 (BST)
References: <20190917172422.5134-1-dan.streetman@canonical.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190917172422.5134-1-dan.streetman@canonical.com>
Date: Wed, 18 Sep 2019 21:33:57 +0100
Message-ID: <87woe5z6mi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] hw/arm: set machine 'virt' as default
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dan Streetman <dan.streetman@canonical.com> writes:

> From: Dan Streetman <ddstreet@canonical.com>
>
> There is currently no default machine type for arm so one must be specifi=
ed
> with --machine.  This sets the 'virt' machine type as default.

We should really have a FAQ entry for why we don't have a default for
ARM. In short unlike PC's every ARM device is different so it pays to be
precise about what you want when you invoke QEMU. Because any given
kernel/image is only likely to work on the machine it's built for.

Why is virt special? It's just one of the many machines we emulate and
while it's probably the most popular these days for "something that
boots a Linux distro" why not -machine sba (when that comes)?

>
> Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d74538b021..e9fe888ca2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -78,6 +78,7 @@
>          mc->desc =3D "QEMU " # major "." # minor " ARM Virtual Machine";=
 \
>          if (latest) { \
>              mc->alias =3D "virt"; \
> +            mc->is_default =3D 1; \
>          } \
>      } \
>      static const TypeInfo machvirt_##major##_##minor##_info =3D { \


--
Alex Benn=C3=A9e


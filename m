Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA2D1B574F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 10:37:34 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRXMT-00089R-Ea
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 04:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRXLa-0007eg-VD
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 04:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRXLa-0004QQ-E7
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 04:36:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60145
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRXLa-0004Od-1W
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 04:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587630996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jt2SI3Ec4+DBoM95/mhaSkMRQB7x7rtS4p5XoJdtD18=;
 b=HcraBqvAmXcUzCGK3rYG5Q/kHmdwT9kUYFqmyCad/Ov63TSeC50vGiY8o/rkPBgRrYuXwX
 kk02qUatO6Ksfy+T+MaqNeUxpBmHqcwpvWyasqJFaL7EcXCaobjqvLJxeLqPgK/AgBaJuE
 glsShTOy242d7aGeIfJ/8bGhbFZ2xBQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Lv7QcZMkOiSyIplaDd6BWQ-1; Thu, 23 Apr 2020 04:36:34 -0400
X-MC-Unique: Lv7QcZMkOiSyIplaDd6BWQ-1
Received: by mail-wr1-f71.google.com with SMTP id e5so2480697wrs.23
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 01:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bRD8O5iG7EfvWKOKXBFAGi4rL5dnL8/PwE9Z+SSrmik=;
 b=oOLZsBUdMTQedlAywgkUo8b6fmXs9UKdZ49N0NxzJtOAl6SfEL+egNavoRZtYC4slt
 8jnjlixA2pHf5wbxwswsNyELomtxIhivYNzeUgUC6h5E11zBz02xVwqPdLZGCqyn0ALy
 tlY97EMr9rG8JmdJhXylQ+Vqk4cFbWIz6q113lbk4V7d6xn/s0CqsKCd1xy+N+NI8ukr
 fjf4ZUw6cADQJ28xG/YuHVUz1oPCZCkVDZxv5tgMvXHY2xKVyeUEpNrnrGOyMAbqOJVY
 Wx30kadG9+0G5XMxlW50E115YpcNyNCaRe+X8kQqMU+ZMDAOgnUUL0g4zmMB8opiM1Mr
 T9oQ==
X-Gm-Message-State: AGi0Pua8bEvYbDbYNX9plNDzJBCw69MOsZOCYiQ4482puShRcnYdQ7tV
 VuzlCBDiqFPGFcBM9eMiAb3cpAO/vc9YDcN+yUG7UVDWNpGf8rBIBNMxmgVl9dcShmaJ8NiAZIG
 g8q7DP2PxPLC0Mvc=
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr2725578wml.166.1587630991702; 
 Thu, 23 Apr 2020 01:36:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsKgGadTcNDt29kt4RwW1MeBi8hDzTQTTl+RYFiTtzryLE6OQChnefkxwejcELjdlw+X5njA==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr2725541wml.166.1587630991255; 
 Thu, 23 Apr 2020 01:36:31 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h188sm2861902wme.8.2020.04.23.01.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 01:36:30 -0700 (PDT)
Subject: Re: [PATCH v3 10/19] target/arm: Restrict ARMv4 cpus to TCG accel
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-11-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6849be34-8e45-98f8-7424-0fdb9466e9bd@redhat.com>
Date: Thu, 23 Apr 2020 10:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-11-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/20 5:06 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> KVM requires a cpu based on (at least) the ARMv7 architecture.
>=20
> Only enable the following ARMv4 CPUs when TCG is available:
>=20
>    - StrongARM (SA1100/1110)
>    - OMAP1510 (TI925T)
>=20

I missed to explain, the point of this Kconfig granularity is on a KVM=20
only build, the TCG-only CPUs can't be default-selected, so most of=20
their devices are not pulled in.

Instead at the end the KVM-only binary only contains the devices=20
required to run the Cortex-A machines.

> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 8b89d8c4c0..0652396296 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -17,8 +17,6 @@ CONFIG_INTEGRATOR=3Dy
>   CONFIG_FSL_IMX31=3Dy
>   CONFIG_MUSICPAL=3Dy
>   CONFIG_MUSCA=3Dy
> -CONFIG_CHEETAH=3Dy
> -CONFIG_SX1=3Dy
>   CONFIG_NSERIES=3Dy
>   CONFIG_STELLARIS=3Dy
>   CONFIG_REALVIEW=3Dy
[...]
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e3d7e7694a..7fc0cff776 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -28,6 +28,7 @@ config ARM_VIRT
>  =20
>   config CHEETAH
>       bool
> +    select ARM_V4
>       select OMAP
>       select TSC210X
>  =20
> @@ -242,6 +243,7 @@ config COLLIE
>  =20
>   config SX1
>       bool
> +    select ARM_V4
>       select OMAP
>  =20
>   config VERSATILE
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index e68c71a6ff..0d496d318a 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,2 +1,6 @@
> +config ARM_V4
> +    depends on TCG
> +    bool
> +
>   config ARM_V7M
>       bool



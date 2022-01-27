Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A149E502
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:48:15 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD64M-0003Jl-7X
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5cb-0005J6-8a
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:19:33 -0500
Received: from [2a00:1450:4864:20::62b] (port=36755
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5cZ-0002pY-Ou
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:19:32 -0500
Received: by mail-ej1-x62b.google.com with SMTP id s13so6235788ejy.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=laSX09zjoWy+fX5bh0LTSIhaA63oEaJIJhnoahkS044=;
 b=zweCcL7eIHPSmak/7XJLFo0yKVIJ/6jtD2up6kUPSY3pqCLJlhYmYpoaiVSEZd02GP
 adKSGRZlU7I56f03DPA+0gHfq/0gQBWrMt/9orITcMuYJlqLi/RNxt7NgY2KxEn2Mv5N
 C0W1Uxk5mZllLe9czbVGxJqcOsclyCZmTkJnKiterGu0De7v9X/r6UGAVBWwtxRXoIj+
 fidsZdRO84oFAaHbK0o06o18i1zEexAB0yU3mb9a9QaESx5qUW0uHGdY0y2g776xxIDx
 27MJO8e4VExlOTaVVQ+LFhRiHOXuIM4FjX7Urq88/4UzI7vXybFQviWkD86KgEhoiqyQ
 kzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=laSX09zjoWy+fX5bh0LTSIhaA63oEaJIJhnoahkS044=;
 b=zatkbA9y+tGSlFt/8WttNfo5RL3Dn+Ore+WpeG8jtFdGT+iF8fC7fb4+D1OybpJYFJ
 dQZElspIRGCeQaEmVSxt/Ej4De19iy0R1ekuvhVHUnHj9sFMA1oo+ichBB4ApbYVcGKG
 oBjT/urniJDY6af8XcWenhdbPYyWJnNT4EBMgBZKrhBJAq+5kebUImzSABiVwCn+f3Wu
 lhytBzQouyks+cG8aTYFU25SJRfs6AfYbOYbovbtSddNHOTvaGhx3deOrTs84WL8vWPc
 LEb8yQdusuc+ZieBUn45Th9js/p07X5TzKXMB2Ls0L9WztcCjVRyJ4RNm3fzXr/G6mNt
 z1Iw==
X-Gm-Message-State: AOAM533qHC6EYv7w/Kc38XcB5lu1rpSesOZNbIoNvn9ocLSZ+5YG4uoi
 TJD/Oz+goG0YW+geExkFVwjmHg==
X-Google-Smtp-Source: ABdhPJwCyZeGV1ho0a3IO39Dy6YHdA6P8rmNrMRrvlEyjt6W1BOwXubJYEfRWWheRNKak/vn4BSh4A==
X-Received: by 2002:a17:907:86a0:: with SMTP id
 qa32mr3137536ejc.336.1643293170193; 
 Thu, 27 Jan 2022 06:19:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lf16sm8649264ejc.25.2022.01.27.06.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:19:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F6DC1FFB7;
 Thu, 27 Jan 2022 14:19:28 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-18-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 17/42] cxl: Machine level control on whether CXL
 support is enabled
Date: Thu, 27 Jan 2022 14:18:02 +0000
In-reply-to: <20220124171705.10432-18-Jonathan.Cameron@huawei.com>
Message-ID: <87wnil8dn3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> There are going to be some potential overheads to CXL enablement,
> for example the host bridge region reserved in memory maps.
> Add a machine level control so that CXL is disabled by default.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/arm/virt.c        |  1 +
>  hw/core/machine.c    | 26 ++++++++++++++++++++++++++
>  hw/i386/microvm.c    |  1 +
>  hw/i386/pc.c         |  1 +
>  hw/ppc/spapr.c       |  1 +
>  include/hw/boards.h  |  2 ++
>  include/hw/cxl/cxl.h |  4 ++++
>  7 files changed, 36 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2b6cc7aa9e..cbb18dcba6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2856,6 +2856,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      hc->unplug =3D virt_machine_device_unplug_cb;
>      mc->nvdimm_supported =3D true;
>      mc->smp_props.clusters_supported =3D true;
> +    mc->cxl_supported =3D false;

You should be able to do this in machine_class_init and then...

<snip>

just turn it on for pc

> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c8696ac01e..b6800a511a 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1739,6 +1739,7 @@ static void pc_machine_class_init(ObjectClass *oc, =
void *data)
>      mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
>      mc->nvdimm_supported =3D true;
>      mc->smp_props.dies_supported =3D true;
> +    mc->cxl_supported =3D true;
>      mc->default_ram_id =3D "pc.ram";
>=20=20
<snip>

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8E3C7C66
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:02:58 +0200 (CEST)
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VAm-0006D6-Dj
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3V9X-0005R3-FJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:01:39 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:33453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3V9V-0006E5-OK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:01:39 -0400
Received: by mail-io1-xd30.google.com with SMTP id z11so312507iow.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Y2tpcdkrFTFybB5VwTBa6i7eSSLkZsheXQyY0qK5vc=;
 b=IKCusgb6uIOZztgexyC+fIR7KQpO5nCKaVO2LyaM6LrGQlG0vSZsObBqLMPSL1Ch1T
 JtYe/TWrs1ce75EYo/Oa72Y9iub/tLJr4xxT0JPPPBj/8fPNCHC9Zmmn12c6nRRjxpjg
 zctu/viRiYXaUp5PBTZ3R8i1by5RgdcDcdS9HUkLBBpPzY80jfUFV05cRFNnXjh+LfQ9
 HsyYtj5/paykVWnrYUNdqpwq72+r+o21m9V7Rn1A0DNnjTfh2ixnHgiJDVZNF4IXinK4
 bvHzsmBTRBTMBdDqPp6ynooS/dUWClNGMMYdKCdnTfe8RJcZjFu7Fb8hMKGvxytT3Y2B
 +jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Y2tpcdkrFTFybB5VwTBa6i7eSSLkZsheXQyY0qK5vc=;
 b=q7ekqa35U5J3ED117YTZhDFRn4DxEWvThCA//meXRKTNBMDqsvT/zVbepQHvII/X09
 KYHlRWXppg4/f7HdzNLMaJoxOLOHsQG11/0ld9tazvkH8Ra5X3dHjPJcdf0sZHH0FMxE
 xPcW5bcLaLuG+4/lbjP5s1WIW721nAbet3SUUJFzeKkYt67XhW+RrPoGx0TqCz/kXtbk
 3vUVXQXv89cp2U6LDx6EICEGpbjMbnrX/afH/LKRMgveebiSFxUbv1qGwMOrQUk0dTAC
 30ijVd5EvZUUV17BFtSpWOBd7WnXlQhHcB/iKHUhxiPnaM0jAiPuk/BmWab5yEdEcROX
 9FSg==
X-Gm-Message-State: AOAM530jm9IiFqWGnF8LRPSRbobyINoL/WSLqlx6DU2xZSPKIsduaA3f
 tMCQm5nNbiJWQydU1P71vk0SrNPiWX7HXg4wd/0=
X-Google-Smtp-Source: ABdhPJz2ddUcG8R9miFQ8U0vbPGEqPdcHi4ehObYjDm6hqYg6QnfBpXfi1T1GTw8ossk3yp38YzM8WwDqpJBNeY9L38=
X-Received: by 2002:a05:6638:4120:: with SMTP id
 ay32mr7007667jab.120.1626231695590; 
 Tue, 13 Jul 2021 20:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210713163051.2133045-1-berrange@redhat.com>
 <20210713163051.2133045-3-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-3-berrange@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 05:01:24 +0200
Message-ID: <CAM9Jb+j5LDOH_5SZN_kP=u-CJOy1EcOdMk0orLTCH7TOoOk_2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] qemu-options: re-arrange CPU topology options
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The list of CPU topology options are presented in a fairly arbitrary
> order currently. Re-arrange them so that they're ordered from largest to
> smallest unit
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qemu-options.hx | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8965dabc83..6b72617844 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -196,17 +196,17 @@ SRST
>  ERST
>
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=3D]n[,maxcpus=3Dcpus][,cores=3Dcores][,threads=3Dthreads=
][,dies=3Ddies][,sockets=3Dsockets]\n"
> +    "-smp [cpus=3D]n[,maxcpus=3Dcpus][,sockets=3Dsockets][,dies=3Ddies][=
,cores=3Dcores][,threads=3Dthreads]\n"
>      "                set the number of CPUs to 'n' [default=3D1]\n"
> -    "                maxcpus=3D maximum number of total cpus, including\=
n"
> +    "                maxcpus=3D maximum number of total CPUs, including\=
n"
>      "                offline CPUs for hotplug, etc\n"
> -    "                cores=3D number of CPU cores on one socket (for PC,=
 it's on one die)\n"
> -    "                threads=3D number of threads on one CPU core\n"
> +    "                sockets=3D number of discrete sockets in the system=
\n"
>      "                dies=3D number of CPU dies on one socket (for PC on=
ly)\n"
> -    "                sockets=3D number of discrete sockets in the system=
\n",
> +    "                cores=3D number of CPU cores on one socket (for PC,=
 it's on one die)\n"
> +    "                threads=3D number of threads on one CPU core\n",
>          QEMU_ARCH_ALL)
>  SRST
> -``-smp [cpus=3D]n[,cores=3Dcores][,threads=3Dthreads][,dies=3Ddies][,soc=
kets=3Dsockets][,maxcpus=3Dmaxcpus]``
> +``-smp [cpus=3D]n[,maxcpus=3Dmaxcpus][,sockets=3Dsockets][,dies=3Ddies][=
,cores=3Dcores][,threads=3Dthreads]``
>      Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>      are supported. On Sparc32 target, Linux limits the number of usable
>      CPUs to 4. For the PC target, the number of cores per die, the
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


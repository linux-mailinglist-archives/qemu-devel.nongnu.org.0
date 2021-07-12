Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447273C5DC4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:52:23 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wMA-0002X5-Af
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2vgT-00006x-Pr
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:09:17 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2vgR-0008B9-8I
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:09:17 -0400
Received: by mail-il1-x12c.google.com with SMTP id b6so9809227iln.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xmcKWCO6RA7yIp/zQQ8oTjg8fJCzT8AJgH6jCup4uhQ=;
 b=StCzMwZoyuPOzK5GH88OI9IRWLpUBK7Oy6Rsf0894JmegrzwqaYViGqSe/TENe9J4X
 dL9lXZ1qPdi22DevNpXmrsqJjgrVhsVjt/v58e5Eq6QkqtTbYQfHdduFVHiUya3XvE90
 1HVhQWxEYGB+wcLRfamuxIYVhdwg+AOr7ej4l8E+rx9d6xJwGR6hgJSGstOY2+LvPwVP
 O2ay3WQiT5NlsumVh8a/bPzqnjpfYAys2TLEyEwysZnuoda8IIHbaGnjFEG3lVw9yD41
 1zn4ONhwaIWiPndZAIiOsvKaiMiKTh8WiVmH+27ud6Ww7YzvBMsXbS/XEugLUvPZrxQs
 CAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xmcKWCO6RA7yIp/zQQ8oTjg8fJCzT8AJgH6jCup4uhQ=;
 b=JmKgT19IynKKQyF90khoXsExwlW1SKESj04THfiEWAEZXauzSUk93k6ATKtviFv2Nw
 2Rqle3z45lIG+VLBkiL04pjuP/086ZJxAQPppeCiphaGCSjyAi/G/7+cccMEeGF7+Ral
 TQe6YS9pkMffya7Acdbi8et1tscFRN+pPxVBMF8iO3Y0iL1TRU6y5mRB9DA4q4iRJv3Y
 qBp/O97wlWUsj4GpFW0BQLAgprtlBACsUYdJ43qDGRIEhQbaXJqzy6CzW5BbE5z6tOHF
 I69bMP7Z6llEHHZmlqMb1YZVEMZWMQEvq57n4/eKAKS8pgsEwsU94YzX5ushRWloh4ae
 4VKg==
X-Gm-Message-State: AOAM532UE7/CgJaKIAMOxa5uMGo2/aVhQPhQqfLb7Ulkz/SX78DMvDdh
 9NJoMKuU/0dt+kgA5SsFteGORI+/13DjTQgVc3I=
X-Google-Smtp-Source: ABdhPJx5JFrIBg1DdLKH+v8RJW/lGbGJMYVoLjQTj8T+tuN79mPLuqOw6LAN4A9XIwHm9hpPS1NIDgVyZxQ49UWMPZg=
X-Received: by 2002:a92:508:: with SMTP id q8mr7574511ile.89.1626095354271;
 Mon, 12 Jul 2021 06:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-3-berrange@redhat.com>
In-Reply-To: <20210628113047.462498-3-berrange@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 12 Jul 2021 15:09:03 +0200
Message-ID: <CAM9Jb+j2hZuYvWzvN8EEk=qyniPR7UETYiLe7ZBvGG8sfzb-FQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] qemu-options: re-arrange CPU topology options
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12c.google.com
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
 Qemu Developers <qemu-devel@nongnu.org>,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The list of CPU topology options are presented in a fairly arbitrary
> order currently. Re-arrange them so that they're ordered from largest to
> smallest unit
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qemu-options.hx | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ba3ca9da1d..aa33dfdcfd 100644
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
>      "                maxcpus=3D maximum number of total cpus, including\=
n"
>      "                offline CPUs for hotplug, etc\n"
> +    "                sockets=3D number of discrete sockets in the system=
\n",
> +    "                dies=3D number of CPU dies on one socket (for PC on=
ly)\n"
>      "                cores=3D number of CPU cores on one socket (for PC,=
 it's on one die)\n"
>      "                threads=3D number of threads on one CPU core\n"
> -    "                dies=3D number of CPU dies on one socket (for PC on=
ly)\n"
> -    "                sockets=3D number of discrete sockets in the system=
\n",
>          QEMU_ARCH_ALL)
>  SRST
> -``-smp [cpus=3D]n[,cores=3Dcores][,threads=3Dthreads][,dies=3Ddies][,soc=
kets=3Dsockets][,maxcpus=3Dmaxcpus]``
> +``-smp [cpus=3D]n[,maxcpus=3Dmaxcpus][,sockets=3Dsockets][,dies=3Ddies][=
,cores=3Dcores][,threads=3Dthreads]``
>      Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>      are supported. On Sparc32 target, Linux limits the number of usable
>      CPUs to 4. For the PC target, the number of cores per die, the

Looks cleaner. With the nit mentioned by Dan:

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


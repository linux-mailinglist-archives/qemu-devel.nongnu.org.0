Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E83C7C7C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:13:07 +0200 (CEST)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VKc-0005UP-HF
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VJO-0004Ph-PE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:11:51 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VJN-00066L-DA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:11:50 -0400
Received: by mail-il1-x12b.google.com with SMTP id o8so154021ilf.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U5KBKzaYhRSjJK7zz5tP4D4Fkk6CbHknsAZWpwKg0hs=;
 b=oGNkVgbqn5FjSq+6YGTfXGXNnpd+nefonk8fHvonueXChj1t6P0aYqQQ6Ukhr6CZwW
 yEyPTXaKtp3CATw9b3saW7R5Bn9jYtd5lcVEeMLkXTCnp8mFtxFSfukdBB34EnkqPyZB
 afQ68UpRUwTQvM6+2Yw7lERi3FRYZBeNWpSiBoaQgnidXENI9WGT8QwMD3XhvAWuucdj
 ejMr4pi/q5WxRLqmwg1rBbi9weEL46kLjWoTBbfzD5Q17/29n9Jd6uGyjzRGXUcRlre4
 trw11tA+O0wufwWggB97J7m3CgaZGn1+HMGHYhfE9hiaGpgdFfbs3Q8JWY9yuzxFgOam
 phEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U5KBKzaYhRSjJK7zz5tP4D4Fkk6CbHknsAZWpwKg0hs=;
 b=DgT9cgVQyjx0eWEIiWneBv/ObpE1dl1tyMf80YSRg1ymHvp/ey35LEz8DQWm4EoVIX
 AUCKTiSxy7EpFvQa6mKdn56eqNf18vEN8gmt/ck3T/2lY4Ek4YQUCBN5tMPLrz7IIrU8
 +xY9tEkcprklY+a3SI9cymHbzYF0d8RRVaiBltZEe2W/Tsp5XFZ3YPU41J02NCg5dqN0
 BVqWZKgz7inrXMzjG1UPErYJDAkrcAuh6ONkO4zR2J/B465FiE/MkkOiU7GnzsFNCPSs
 I2JZcZzUb9E6tUFgQH+mjgn3Q0k/murJzYNTwufKZNkCo4yTEEbqcMCehvJj9H1eI4p9
 AAiQ==
X-Gm-Message-State: AOAM533PxMC1aYc8cDxrJFY7um0I91eiS9MWKsDkmFwZ8mkSpkv1PLzX
 +T/XcfNXz15NIWjQZhzGKiK2PylvS2JRkC5XOUE=
X-Google-Smtp-Source: ABdhPJw29/XMb6rQmB1KfBOXUyq9+LTtnuR6gFZbNuAhyiEz3gOFF515XfyBm4tucEq5CQUuW/hy48fxQInlzw7VOJc=
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr5068969ilu.163.1626232307780; 
 Tue, 13 Jul 2021 20:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210713163051.2133045-1-berrange@redhat.com>
 <20210713163051.2133045-4-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-4-berrange@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 05:11:37 +0200
Message-ID: <CAM9Jb+ihXZyb2WDcapE0Aea45z8X=isq+P53_rkdvKp68K1ZPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] qemu-options: tweak to show that CPU count is
 optional
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12b.google.com
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

> The initial CPU count number is not required, if any of the topology
> options are given, since it can be computed.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 6b72617844..14ff35dd4e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -196,7 +196,7 @@ SRST
>  ERST
>
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=3D]n[,maxcpus=3Dcpus][,sockets=3Dsockets][,dies=3Ddies][=
,cores=3Dcores][,threads=3Dthreads]\n"
> +    "-smp [[cpus=3D]n][,maxcpus=3Dcpus][,sockets=3Dsockets][,dies=3Ddies=
][,cores=3Dcores][,threads=3Dthreads]\n"
>      "                set the number of CPUs to 'n' [default=3D1]\n"
>      "                maxcpus=3D maximum number of total CPUs, including\=
n"
>      "                offline CPUs for hotplug, etc\n"
> @@ -206,7 +206,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>      "                threads=3D number of threads on one CPU core\n",
>          QEMU_ARCH_ALL)
>  SRST
> -``-smp [cpus=3D]n[,maxcpus=3Dmaxcpus][,sockets=3Dsockets][,dies=3Ddies][=
,cores=3Dcores][,threads=3Dthreads]``
> +``-smp [[cpus=3D]n][,maxcpus=3Dmaxcpus][,sockets=3Dsockets][,dies=3Ddies=
][,cores=3Dcores][,threads=3Dthreads]``
>      Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>      are supported. On Sparc32 target, Linux limits the number of usable
>      CPUs to 4. For the PC target, the number of cores per die, the
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


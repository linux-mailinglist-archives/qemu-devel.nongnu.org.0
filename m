Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E503C7C6A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:08:09 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VFo-0002MH-4G
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VE9-0001Td-J4
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:06:25 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3VE7-0001Zi-5Y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:06:25 -0400
Received: by mail-il1-x132.google.com with SMTP id a7so136879iln.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BCksb3y32xfM35Z4zCXXTxxZcwRR92lkT3bnPUa32dk=;
 b=FUEge17x6E5GLGr9SWAyUny/aAo2rvgJDTG7jmxkJsFNhkBWgtlnGD/hQxT2RisR+r
 v3KnUe5zOIr8ZpR+gTkieVvKIDlDW6pyQI9JrZgpGRL2PiPPqpwOoVmJNNHF7KMv0qez
 fi58GzrzACPgseIWsTrdoKV89zsA72/rhvszXqgkChGrm1w9Ma83BgXCSdJ32tkmoEUw
 BLDZfq2zibQ3WAfxp8TDPkAyHGEdWpLT5Jn9EUWKeceogoFNJenVM1LIAs8ezx9U4fgw
 nqMhxi9+VWjNbu2s/FGriBqDMARTIHMx0wcksUm3Mul+fNZWVc65CYr1JU+kwtD9FKWw
 QNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BCksb3y32xfM35Z4zCXXTxxZcwRR92lkT3bnPUa32dk=;
 b=hgf+lQvc/zPJproCm2sozgkhDFF+rC+9HOF8Y2VR+oTlgIDMHvE6aIxdSk/dGHao9q
 P8LX84FqqHbOmsF/U/vhTDPcC2E+1lJLJy8vFr/CkiGVfdG2W47/fDcGpQjUXDb6Ot0U
 9Tx7sfRT3+6oamBwUQC3WaYFNC/FzK0i4359PMBl315kBA2Sc3e1scpuEJSnSXJLrZ7z
 lXPGVayq3MICTYqd2vS+rmrS7sMf7HnBAi7AI8sTgmUSNcjZjlXwmcyq/LjNavUhY2Mb
 /0G3yC0XHW1loqbbQDti+HqwVvM1yCUQa3vf9Jb3Vs8Y41nZCkUtOhug3nH9Qec3++c3
 Fzlw==
X-Gm-Message-State: AOAM532XTfgvwboa8VL53KZ6Q2r8qqicVDgXyZrpbR5YTTBnKd4seTsJ
 GXLldT5BCpzp6RCdZjwdgb88qxgIVLAPWxSZGo4=
X-Google-Smtp-Source: ABdhPJytvwyUSOXuffAyW/EYoArReh3CvJ4AmPUbTcQnEubU2RKp1XdQrL1crsFINJ8Kz3DyNoWMXq8tsvVs8LIqNTE=
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr5056796ilu.163.1626231980634; 
 Tue, 13 Jul 2021 20:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210713163051.2133045-1-berrange@redhat.com>
 <20210713163051.2133045-5-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-5-berrange@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 05:06:09 +0200
Message-ID: <CAM9Jb+jic+6RXtxhDqtOiEA-xJWs8EaMjC-oJtYMW4o56wZvtA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] qemu-options: rewrite help for -smp options
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x132.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The -smp option help is peculiarly specific about mentioning the CPU
> upper limits, but these are wrong. The "PC" target has varying max
> CPU counts depending on the machine type picked. Notes about guest
> OS limits are inappropriate for QEMU docs. There are way too many
> machine types for it to be practical to mention actual limits, and
> some limits are even modified by downstream distribtions. Thus it
> is better to remove the specific limits entirely.
>
> The CPU topology reporting is also not neccessarily specific to the
> PC platform and descriptions around the rules of usage are somewhat
> terse. Expand this information with some examples to show effects
> of defaulting.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qemu-options.hx | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14ff35dd4e..214c477dcc 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -207,14 +207,27 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>          QEMU_ARCH_ALL)
>  SRST
>  ``-smp [[cpus=3D]n][,maxcpus=3Dmaxcpus][,sockets=3Dsockets][,dies=3Ddies=
][,cores=3Dcores][,threads=3Dthreads]``
> -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
> -    are supported. On Sparc32 target, Linux limits the number of usable
> -    CPUs to 4. For the PC target, the number of cores per die, the
> -    number of threads per cores, the number of dies per packages and the
> -    total number of sockets can be specified. Missing values will be
> -    computed. If any on the three values is given, the total number of
> -    CPUs n can be omitted. maxcpus specifies the maximum number of
> -    hotpluggable CPUs.
> +    Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
> +    the machine type board. On boards supporting CPU hotplug, the option=
al
> +    '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
> +    added at runtime. If omitted the maximum number of CPUs will be
> +    set to match the initial CPU count. Both parameters are subject to
> +    an upper limit that is determined by the specific machine type chose=
n.
> +
> +    To control reporting of CPU topology information, the number of sock=
ets,
> +    dies per socket, cores per die, and threads per core can be specifie=
d.
> +    The sum `` sockets * cores * dies * threads `` must be equal to the
> +    maximum CPU count. CPU targets may only support a subset of the topo=
logy
> +    parameters. Where a CPU target does not support use of a particular
> +    topology parameter, its value should be assumed to be 1 for the purp=
ose
> +    of computing the CPU maximum count.
> +
> +    Either the initial CPU count, or at least one of the topology parame=
ters
> +    must be specified. Values for any omitted parameters will be compute=
d
> +    from those which are given. Historically preference was given to the
> +    coarsest topology parameters when computing missing values (ie socke=
ts
> +    preferred over cores, which were preferred over threads), however, t=
his
> +    behaviour is considered liable to change.
>  ERST
>
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEF3E22B8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:53:41 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrrY-0006Wn-S1
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrqq-0005rp-MX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:52:56 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBrqn-0004nh-UP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:52:56 -0400
Received: by mail-io1-xd29.google.com with SMTP id d22so9689140ioy.11
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilAcwSibSETY3YwiN6vwTytdn+tNrPmrNM71rUlQAPc=;
 b=mSH4GiAzcSnqcgiGK9BQgolmWveTfuIxYORjekwm1v6/qmyVe/JCLOaQS48UHjCBiE
 yPOs2PnnXHbQA6ycMq/VuGhLh7QSBNLnJhoZ+MC08aJOKmrtsfaj4e0TQUwCqPqecBJa
 JeVtrSW2i4MBbsQccNPvSr+AkkMzcGseBapWcAZOFipny+2IqAzOTUvNiMM3OkXa3/WB
 Zc80v6WzaNWRnoUAhKH2sY0RR0wvMAx/xmrmoEyO8FzmAYKZQYpP5r9xZDnzOsb8ueG8
 T+D7H2HXS/G2PVOi78dHi1eCQyck2tHeVtx/tHNhS2w3+SWeW+KNdfCoEoxHeOF9MvWp
 eVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilAcwSibSETY3YwiN6vwTytdn+tNrPmrNM71rUlQAPc=;
 b=FIddkFYCey65zWlPf+pF2QM5kvgC3ofc4LlIBh2S+YGmtFUfGfMP/4TMI/j/VU4CxV
 QkCuxQikUh/U4BGZaT4I0TIlfUAXcnXXgL4zevTHVqPtyOnqMPSukKyAz/9SDmxETinX
 1G+gkC0g0U71m7sgGG5tD92BbfAa9GuP0hOrI2hwarrXLzAY58M9bKpYZxGlmiqY2S7v
 g0UDDipb3ZXk7RudjyYuOQ4ibJO7u9rzKxNtp2x0eIcXtcVyYuo9JNwujhVs3W8IA53+
 s1azch3nraGmkSzXQBNBKOkhdHOlFNnzh5kK++qh6j4ERa4rRkYW9lXCyiNE0zTZ50MF
 7myg==
X-Gm-Message-State: AOAM530O4CvJgK4idHx+XIvEhgXt39SkwXxSRMRNvGZFIYFun0awMr3x
 TErbr9mDr/y77QRe+z8e/I/lbgw8kOhj30NQh1g=
X-Google-Smtp-Source: ABdhPJwluXZ/2VwFHxJaOMMMDeBqdomKhDw4qWPAcoGAoUYN5OyLvUZHcFNM5qjQzsraNwLxE+llfzkTlmCoX1hzb7Y=
X-Received: by 2002:a5d:9d19:: with SMTP id j25mr341344ioj.84.1628225572953;
 Thu, 05 Aug 2021 21:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210803080527.156556-1-wangyanan55@huawei.com>
 <20210803080527.156556-5-wangyanan55@huawei.com>
In-Reply-To: <20210803080527.156556-5-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Aug 2021 06:52:42 +0200
Message-ID: <CAM9Jb+gKGCmTwkEa6SLc-X5o7A9YuHfWN=SoBGVhpQD8TtVv2A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v4 04/14] machine: Improve the error reporting of
 smp parsing
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
>
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 958e6e7107..e879163c3b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -777,25 +777,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>
> -    if (sockets * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, cores, threads, cpus);
> +    if (sockets * cores * threads != maxcpus) {
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "product of the hierarchy must match maxcpus: "
> +                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, cores, threads, maxcpus);
>          return;
>      }
>
>      if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }
> -
> -    if (sockets * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology: "
> +                   "maxcpus must be equal to or greater than smp: "
>                     "sockets (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, cores, threads,
> -                   maxcpus);
> +                   "== maxcpus (%u) < smp_cpus (%u)",
> +                   sockets, cores, threads, maxcpus, cpus);
>          return;
>      }
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 9ad7ae5254..fcf6905219 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -747,25 +747,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>
> -    if (sockets * dies * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, dies, cores, threads, cpus);
> +    if (sockets * dies * cores * threads != maxcpus) {
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "product of the hierarchy must match maxcpus: "
> +                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, dies, cores, threads, maxcpus);
>          return;
>      }
>
>      if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }
> -
> -    if (sockets * dies * cores * threads != maxcpus) {
> -        error_setg(errp, "Invalid CPU topology deprecated: "
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "maxcpus must be equal to or greater than smp: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, dies, cores, threads,
> -                   maxcpus);
> +                   "== maxcpus (%u) < smp_cpus (%u)",
> +                   sockets, dies, cores, threads, maxcpus, cpus);
>          return;
>      }
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


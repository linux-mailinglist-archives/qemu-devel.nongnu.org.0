Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D87584EC8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 12:26:46 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHNCe-00087l-K4
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 06:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHN40-0004eZ-Su
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 06:17:48 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHN3y-0004CH-Ir
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 06:17:48 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f661b3f89so46101757b3.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LwUztS6x90CqAMpjxcj3jDUvgj8Zk1ekgkUuu1joTfE=;
 b=bgRa8DcXxyG7O/sl5upANBZcf6HQlbRV0anALrUEOfAq9o7nM+vAdKXV+WnT+pCnUa
 e4nxGfkueVQX4TupAZKu2fKRvE8vec3TFPBM9c8l2NNhDMf0ZL5d45U20h+qI2Ow/GAE
 NoZsvS7layT6Oz6CNS8Q94FBe7cWvX3xOxRZUX+p2CT5Hp7zLRDR3atp9xc+0xdk1QTB
 ldsDSW6TlsWMH1x8ixhPW7RgjR7sii1y1lblRMDs2YVzRDOMC8DDh1Y9yB6WUBl5cDxR
 B9A2GxDPUKrHxtgCstB7ObtHSIYmlQeJB07OGBYTcGzsJB/Yugl9Y2cpTrt3hpZIqJJh
 IXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LwUztS6x90CqAMpjxcj3jDUvgj8Zk1ekgkUuu1joTfE=;
 b=dveN1UUCCnegkdWt28u8zjtAgHDIbV8HCotovF7oDCN26HsbNWmArx2NA2IPgEF8km
 Il4kdCyVomPl+X9YKkUFvEO8iPnz/0hAlBFAxXSGXr9BMXItv+GNaFVFOAkWq/2yUwNg
 PxfRAYBK5wDcnLDYuKKJdvfjsbY4t2Gt8WKsOfy+tyVfxRvs7r5olO630rjzREurrPQC
 luD/KkuFIMp5n7Nw/KKb+Z9ls+1KdGvdOLIezBiueLnGafNp6aBHFb0Vvr9G2yTY2wbN
 rO7mgau/PVFEHG7+qu9a0s6LxhYCxh/QwWWjnWUW1qd/vha7HJgX60X1lHjQzFXxYpM1
 oAdA==
X-Gm-Message-State: ACgBeo3bJng7slfL6ncpSValhJ/ghKRu2ogld5spO2sJQmmwqfUOEXuK
 I1IABa7HQSHTCVLeVsGAQAebQcgfYf7n+HqEHqc1SA==
X-Google-Smtp-Source: AA6agR5P9C2KhsSNEr8RUxKcqFLeAVH/QLMKvlBLWrTaGUQZECPiBleCTXtq2GPKuMWXxSQWTuS5mVEUnqCENLX+kYU=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr2448965ywg.469.1659089865244; Fri, 29
 Jul 2022 03:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
 <20220728165411.5701befb@redhat.com> <YuKmuvgqMQtTXVjX@work-vm>
 <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
 <20220729115753.60d99772@redhat.com>
In-Reply-To: <20220729115753.60d99772@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 11:17:05 +0100
Message-ID: <CAFEAcA_Xa68t7N1MgCy6=xYvE9Cr6SM2xZp-iDdx_e8+tFwpCw@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org, 
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, ani@anisinha.ca, 
 mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jul 2022 at 10:57, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 28 Jul 2022 16:12:34 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 28 Jul 2022 at 16:09, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > On Thu, 28 Jul 2022 15:44:20 +0100
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >
> > > > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > > > > >   $ qemu-system-mips -monitor stdio
> > > > > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > > > > >   Segmentation fault (core dumped)
> > > > > >
> > > > > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > > > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > > > > tables support which is not existent for ithe later)
> > > > > >
> > > > > > Issue was probably exposed by trying to cleanup/compile out unused
> > > > > > ACPI bits from MIPS target (but forgetting about migration bits).
> > > > > >
> > > > > > Disable compiled out features using compat properties as the least
> > > > > > risky way to deal with issue.
> > > > >
> > > > > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?
> > > >
> > > > Not sure what "'stub' vmsd" is, can you explain?
> > >
> > > In hw/acpi/acpi-pci-hotplug-stub.c there is :
> > > const VMStateDescription vmstate_acpi_pcihp_pci_status;
> I think that one is there only for linking purposes and not meant
> to be actually used.

Yes, exactly. The problem is that without this patch which
sets various properties it *does* get used...

> > > this seg happens when the migration code walks into that - this should
> > > always get populated with some of the minimal fields, in particular the
> > > .name and .fields array terminated with VMSTATE_END_OF_LIST().
> >
> > Either:
> >  (1) we should be sure the vmstate struct does not get used if the
> >      compile-time config has ended up with the stub
> > or
>
> >  (2) it needs to actually match the real vmstate struct, otherwise
> >      migration between a QEMU built with a config that just got the
> >      stub version and a QEMU built with a config that got the full
> >      version will break
> >
> > This patch does the former. Segfaulting if we got something wrong
> > and tried to use the vmstate when we weren't expecting to is
> > arguably better than producing an incompatible migration stream.
>
> > (Better still would be if we caught this on machine startup rather
> > than only when savevm was invoked.)
> Theoretically possible with a bunch of mips and x86 stubs, but ...
> we typically don't do this kind of checks for migration sake
> as that complicates things a lot in general.
> i.e. it's common to let migration fail in case of incompatible
> migration stream. It's not exactly friendly to user but it's
> graceful failure (assuming code is correct and not crashes QEMU)

The point here is that if we ever try to do a migrate with the
stub vmstate struct then that's a bug in QEMU. We should prefer
to catch those early and clearly.

-- PMM


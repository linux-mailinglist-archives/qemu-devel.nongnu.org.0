Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA8752CDAC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:57:36 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrb2N-00011X-05
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nratd-0004BU-0z
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nratW-0001BQ-FD
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652946504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFFC6RIvn9JAMbadGKZIgO5Hdh/KTI2HCrCTR2oEGPM=;
 b=Ptli/st1K66BaEaYA4B9i3eHKMMQ6drUH1/r8JLuOfKcOkGno4iQiMnVZJeIs4iwqdDqj+
 Sm//s3OYcyiFKJzFJGFqrnRf/KA24hBbVI+y5QopOKuZO60b7yA03jHYWj/9C00Ymi1L68
 7lT3sF8rfx3LOg4zFUEUwWL6R9Z6tlM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-YAvcvM2IPV-OYrXO_gLKew-1; Thu, 19 May 2022 03:47:17 -0400
X-MC-Unique: YAvcvM2IPV-OYrXO_gLKew-1
Received: by mail-oi1-f197.google.com with SMTP id
 r71-20020acaa84a000000b0032ae4fd6160so805185oie.20
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DFFC6RIvn9JAMbadGKZIgO5Hdh/KTI2HCrCTR2oEGPM=;
 b=VLqDYB7/M0foAUfZcTGZjIkU5yrbnhJcK4Q4e88vYTs+qnS429wLseMxDeYg1iRUQr
 0UAYyy3H5/btbY0qCT4xVOIPx+fFuw2U3JcRcrrRMhuiK26+p0cc10gIDQeYj/wfT2pb
 xn7AQslavDnnuR6mfRYT7h+8uF5Yxb+wpnDMJZbyL8Gnrcp/ZncL8MaDKjhlAWA2O5wF
 8ez8Q0JMPqcGDkTeKFQoA6ZihQIvChnwqKPLo2iqXlozyZpqNuaMXhLbB4fsREUSIldc
 PE+GpEea6Z35eKGVC9Bh910i8caIoV8BGfoghN/pYHfMhmvUWLxsGPOGJa0L3GipOSea
 OV6g==
X-Gm-Message-State: AOAM531Z8GhB19s+DU803nzQtxaAYLqfV9rj5gxLcByrdYKgYD70Lq9J
 nXtBC02hPkTj4vmUM5tYxQoiZ09/nPZKjh8gROGYh8K24xXKZWswM8ke5QEhXKcMq57XouZQzFE
 dLdPi2b16tcd01E5vC7D9mSk81V1+p2c=
X-Received: by 2002:a05:6870:5702:b0:e2:9f03:dae1 with SMTP id
 k2-20020a056870570200b000e29f03dae1mr1938765oap.201.1652946437264; 
 Thu, 19 May 2022 00:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyY5xC9HuXP50wp7e9OT8bH9DpMy+qD5P9AMAiZ39tRBUFk+oThsTtumse5QBO0eqZTdMUfpcYScjKbXxY3b4=
X-Received: by 2002:a05:6870:5702:b0:e2:9f03:dae1 with SMTP id
 k2-20020a056870570200b000e29f03dae1mr1938751oap.201.1652946437086; Thu, 19
 May 2022 00:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com> <YnkDGsIi1vFvXmiP@redhat.com>
 <20220510090325.2781238a@redhat.com> <Ynoe242xK4d5kNwk@redhat.com>
 <20220510133758.5495372c@redhat.com>
In-Reply-To: <20220510133758.5495372c@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Thu, 19 May 2022 09:47:06 +0200
Message-ID: <CAMDeoFV1XsUsRbXb4AapVo0z0tNOmOTinfiHdFCiyfCeX2qLag@mail.gmail.com>
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
To: Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Michael Tsirkin <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 eduardo@habkost.net, jon.grimm@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 10, 2022 at 1:38 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 10 May 2022 09:14:19 +0100
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>
> > On Tue, May 10, 2022 at 09:03:25AM +0200, Igor Mammedov wrote:
> > > On Mon, 9 May 2022 13:03:38 +0100
> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > >
> > > > On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
> > > > > On Wed, 4 May 2022 08:16:39 -0500
> > > > > Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:
> > > > >
> > > > > > This is the maximum number of vCPU supported by
> > > > > > the AMD x2APIC virtualization.
> > > > > >
> > > > > > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd=
.com>
> > > > > > ---
> > > > > >  hw/i386/pc_q35.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > > > > index 302288342a..e82b1c690d 100644
> > > > > > --- a/hw/i386/pc_q35.c
> > > > > > +++ b/hw/i386/pc_q35.c
> > > > > > @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineC=
lass *m)
> > > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU=
_DEVICE);
> > > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVIC=
E);
> > > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDG=
E);
> > > > > > -    m->max_cpus =3D 288;
> > > > > > +    m->max_cpus =3D 512;
> > > > >
> > > > > Maybe we should bump it to KVM VCPU maximum,
> > > > > and make sure we error out if asked for combination of
> > > > > hardware/irqchip is not usable.
> > > >
> > > > In RHEL downstream we currently bump this to 710 CPUs, because you
> > > > overflow the SMBIOS 2.1 tables at approx 720 CPUs (give/take a litt=
le
> > > > depending on other config options).
> > >
> > > Also there were some testing done with 1024,
> > > but my main reason for matching KVM's limit is unblock upstream
> > > testing so it would be easier to push limits for others.
> > > Downstream can clamp that value down to whatever it deems as supporte=
d.
> > >
> > > > Going beyond 710 CPUs value requires using the SMBIOS 3 entry point=
.
> > > >
> > > > AFAIK, the x86 machine types still default to SMBIOS 2.1, so that
> > > > would need changing too.
> > >
> > > Yep, we can change default to SMBIOS 3 starting with new machine type=
 (7.1?)
> > > or conditionally depending on requested number of CPUs,
> > > though I'd prefer machine type approach.
> >
> > Agree, machine type is better IMHO, a it gives us a consistent guest
> > ABI regardless of CPU count.
> >
> > > As for SMBIOS 3, we still have to update CPU structures to support mo=
re than
> > > 255 vcpus (Julia was working on it). It's long standing bug, but that=
 doesn't
> > > seem to be critical, as guest boots fine with old structures.
> >
> > What's the impact of SMBIOS 3 being limited to 255 ?  That's lower than
> > the current max CPUs of 288 in upstream / 710 in downstream.
>
> possibly users that look into SMBIOS for licensing purposes and/or invent=
ory
> Julia told me that dmidecode somehow figures out correct number of total =
vcpus.
>
> CCing Julia for patches ETA.

Should be this week.

Best regards, Julia Suvorova.

>
> >
> >
> > With regards,
> > Daniel
>



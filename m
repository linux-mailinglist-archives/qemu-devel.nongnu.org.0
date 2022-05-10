Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D510521416
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:43:27 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noOGz-0003sL-U0
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noOBq-0001tQ-K8
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noOBo-0006tu-At
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6YK/zUyeQLMYBl9KIIbiEx7kPiVl4Dn5p+EuUgTUmw=;
 b=ISupKs5fKSpXEbi0WMs9tYqHapIJQ1NytqNX6zjydB3HAyCc9x2rOX5ZqGK4ShO/NZ+oSy
 30H6GzA8xlEge5MVRG+sA5tt4w07YsYM0c5Rd7rxRxnr/2oMXjtAc1XLjPnOOnYzGQ5sYG
 rB89qcSsJdUUEwfXRAIMwD6yU7YpFM0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-vVkCmqzePNOjMvel0PboJg-1; Tue, 10 May 2022 07:38:01 -0400
X-MC-Unique: vVkCmqzePNOjMvel0PboJg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc20-20020a1709078a1400b006f4a358c817so8294410ejc.16
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 04:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6YK/zUyeQLMYBl9KIIbiEx7kPiVl4Dn5p+EuUgTUmw=;
 b=hike+UQNxzNuFhITZtEruIuKWddvn3UH3+UZrC4sHelduvBAzTAU9MC1R2esgjWXSQ
 Nw97YGAPp0HwDPeqINnF6NfmjfH1rjjCKMC9j/CRx6OvItEqH3SOl44t3cPOH0vzuCO6
 urCVndZlCf/RYRRJ8/l1FHjlUFnuoG8a/p+DqeGWmjmoc6V6UApFh88Zm8KmFmA30qeY
 8nNSZQ5fxyAf3pTKsTqXJEmn2JxhDL9tPnjA3v8bgN28vDHuSzQ3iZaLiOFlkNZgRLR2
 HuLXzPXygtw2gtGyjpsYR/JQVlbCLTSvADLAdImu1lZBmKhlj5scUjBjAT6cT9T2o4wX
 YDJg==
X-Gm-Message-State: AOAM530bSfULtZOH1K2Bc3D9qJ5czYwx/RWV/P6wThN8dtHo7It8WCQ8
 p2f6cqf8yzmxANADVFko95TDHng07uf9wUNnTaE1zNbFrWRnAIZLVHDF0b6OlWc363UEjg/shwF
 N7+iRaSyp+4A+xB0=
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id
 e20-20020a50d4d4000000b00425e6bf8b81mr22178600edj.209.1652182680543; 
 Tue, 10 May 2022 04:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTLkg1E0n/V4pp7lA1EPVA4fvKpMtE8CBWIq9mVaN5IwzDjJYi1mITarN6wPpYMzzZwJI5tQ==
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id
 e20-20020a50d4d4000000b00425e6bf8b81mr22178572edj.209.1652182680279; 
 Tue, 10 May 2022 04:38:00 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 my14-20020a1709065a4e00b006f3ef214dc5sm6066300ejc.43.2022.05.10.04.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 04:37:59 -0700 (PDT)
Date: Tue, 10 May 2022 13:37:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 jon.grimm@amd.com, Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220510133758.5495372c@redhat.com>
In-Reply-To: <Ynoe242xK4d5kNwk@redhat.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com> <YnkDGsIi1vFvXmiP@redhat.com>
 <20220510090325.2781238a@redhat.com> <Ynoe242xK4d5kNwk@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 10 May 2022 09:14:19 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, May 10, 2022 at 09:03:25AM +0200, Igor Mammedov wrote:
> > On Mon, 9 May 2022 13:03:38 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote: =20
> > > > On Wed, 4 May 2022 08:16:39 -0500
> > > > Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:
> > > >    =20
> > > > > This is the maximum number of vCPU supported by
> > > > > the AMD x2APIC virtualization.
> > > > >=20
> > > > > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.c=
om>
> > > > > ---
> > > > >  hw/i386/pc_q35.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > > > index 302288342a..e82b1c690d 100644
> > > > > --- a/hw/i386/pc_q35.c
> > > > > +++ b/hw/i386/pc_q35.c
> > > > > @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineCla=
ss *m)
> > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_D=
EVICE);
> > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> > > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> > > > > -    m->max_cpus =3D 288;
> > > > > +    m->max_cpus =3D 512;   =20
> > > >=20
> > > > Maybe we should bump it to KVM VCPU maximum,
> > > > and make sure we error out if asked for combination of
> > > > hardware/irqchip is not usable.   =20
> > >=20
> > > In RHEL downstream we currently bump this to 710 CPUs, because you
> > > overflow the SMBIOS 2.1 tables at approx 720 CPUs (give/take a little
> > > depending on other config options). =20
> >=20
> > Also there were some testing done with 1024,
> > but my main reason for matching KVM's limit is unblock upstream
> > testing so it would be easier to push limits for others.
> > Downstream can clamp that value down to whatever it deems as supported.
> >  =20
> > > Going beyond 710 CPUs value requires using the SMBIOS 3 entry point.
> > >=20
> > > AFAIK, the x86 machine types still default to SMBIOS 2.1, so that
> > > would need changing too. =20
> >=20
> > Yep, we can change default to SMBIOS 3 starting with new machine type (=
7.1?)
> > or conditionally depending on requested number of CPUs,
> > though I'd prefer machine type approach. =20
>=20
> Agree, machine type is better IMHO, a it gives us a consistent guest
> ABI regardless of CPU count.
>=20
> > As for SMBIOS 3, we still have to update CPU structures to support more=
 than
> > 255 vcpus (Julia was working on it). It's long standing bug, but that d=
oesn't
> > seem to be critical, as guest boots fine with old structures. =20
>=20
> What's the impact of SMBIOS 3 being limited to 255 ?  That's lower than
> the current max CPUs of 288 in upstream / 710 in downstream.

possibly users that look into SMBIOS for licensing purposes and/or inventory
Julia told me that dmidecode somehow figures out correct number of total vc=
pus.

CCing Julia for patches ETA.

>=20
>=20
> With regards,
> Daniel



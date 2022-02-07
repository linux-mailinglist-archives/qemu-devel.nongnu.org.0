Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF894AB898
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:18:43 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH16Y-0005tp-Eq
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH0Ad-0001wL-CX
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH0Aa-0005oX-PG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644225527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdLBBd8XAdhT3qXZL6JYEUj35brCnQFUeZKmvIrtckk=;
 b=GL+nmfBv9QIKghFHRcdG8A3+PTroSO/kEifYhZR8iTH2EIIyRrBsKET+1+11harnNNH4uN
 HXBItYf5ZkOdG7Xcerq4QjJJnU73z/v2RygLSJsE4L564fCMEv+j+2rRamTm9dVWo6Svyn
 2xRgxGgSwlm7QOqYXgVdMIvJywOUXzo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-uUHz9-R5MnmNp601CXiQJQ-1; Mon, 07 Feb 2022 04:18:46 -0500
X-MC-Unique: uUHz9-R5MnmNp601CXiQJQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 fy20-20020a170906b7d400b006c97d43badaso811020ejb.14
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdLBBd8XAdhT3qXZL6JYEUj35brCnQFUeZKmvIrtckk=;
 b=OKu+Bs2bYG0qRaJczZn+AA5WlmrisYbd/1FK1xKIRI0cj/nArAXOjhDMVQjEwuYZDt
 iQKJN+YchGdCu/NSTPEr6UyfNjZM5heN7O+0JulgcQpnvtDlCE1dLwzYc1JqUwFirBWb
 1SFaZpRbSTp//nOzfV1o0e4ZlvqNISbefuY/uGv3RU59XNgpCSk9/I+dmHpbPAzOWxmT
 ubXOk5RD3ZIQszrUZ9D9KwAHT676/aDsXfUL6sA1oMZkvAyrG3Agtivccclgbw1ymJxC
 KMJw62wPElkp4K5IqBga6dmAM4945lRbpgbK8KYth+jk2xCr7E326r9IsPdKiS5oIeHH
 rruw==
X-Gm-Message-State: AOAM533KB0FCYR/B1WAH/XS+kAxjOA3P7JYCZqSBSPjCzRpuHwekpnCf
 U6ic+G/puTin+NlQQncFWykGCVpjgmK42P3o4Ftq5IIhizuE8yum6zKVq2Hps2S/Oe/kW9nqO/9
 LaLp2F50EQMBPMYc=
X-Received: by 2002:a17:907:d28:: with SMTP id
 gn40mr9525411ejc.750.1644225525601; 
 Mon, 07 Feb 2022 01:18:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPlJGpE9G9CRZMGl2iJ89y/5wCxo9/2R5H0F/kB3mhJrslRIoqxFo4ZqqJ5rtGdkvQPBrn6Q==
X-Received: by 2002:a17:907:d28:: with SMTP id
 gn40mr9525392ejc.750.1644225525358; 
 Mon, 07 Feb 2022 01:18:45 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id os9sm364216ejb.57.2022.02.07.01.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 01:18:44 -0800 (PST)
Date: Mon, 7 Feb 2022 10:18:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <20220207101843.259f517c@redhat.com>
In-Reply-To: <20220207091437.52cf36b1@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 09:14:37 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Sat,  5 Feb 2022 13:45:24 +0100
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
> > Previously CPUs were exposed in the QOM tree at a path
> >=20
> >   /machine/unattached/device[nn]
> >=20
> > where the 'nn' of the first CPU is usually zero, but can
> > vary depending on what devices were already created.
> >=20
> > With this change the CPUs are now at
> >=20
> >   /machine/cpu[nn]
> >=20
> > where the 'nn' of the first CPU is always zero. =20
>=20
> Could you add to commit message the reason behind the change?

regardless, it looks like unwarranted movement to me
prompted by livirt accessing/expecting a QOM patch which is
not stable ABI. I'd rather get it fixed on libvirt side.

If libvirt needs for some reason access a CPU instance,
it should use @query-hotpluggable-cpus to get a list of CPUs
(which includes QOM path of already present CPUs) instead of
hard-codding some 'well-known' path as there is no any guarantee=20
that it will stay stable whatsoever.
=20
> > Note: This (intentionally) breaks compatibility with current
> > libvirt code that looks for "/machine/unattached/device[0]"
> > in the assumption it is the first CPU. =20
> Why libvirt does this in the first place?
>=20
> =20
> > Cc: libvir-list@redhat.com
> > Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  hw/i386/x86.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index b84840a1bb9..50bf249c700 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t ap=
ic_id, Error **errp)
> >  {
> >      Object *cpu =3D object_new(MACHINE(x86ms)->cpu_type);
> > =20
> > +    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu)); =
=20
>=20
> that will take in account only initial cpus, -device/device_add cpus
> will still go to wherever device_add attaches them (see qdev_set_id)
>=20
> >      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
> >          goto out;
> >      } =20
>=20



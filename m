Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320A2AF7FB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:34:06 +0100 (CET)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcuwW-0006yt-MN
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcuvX-0006RF-Rr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:33:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcuvT-00061e-NQ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQciIk3KJ/LNoZlpArgYBI4Qpqtuphnkh6mMzTvU0Q8=;
 b=CgJ11BgVhI6yZCCT2dY5MwMqAzuGF1EVfdzRLlVBIU7zmop6q3W4erF7r/pgEV4s+puzhO
 qAFQPxU3kYMwGDVSM7xCh5gaPHXu6HJJNBP/jC3vAfP1FCW+EXF2yQYx16ZCRWxn5QRfp1
 lEmqnlDXnJywYOwNKMScE5xURU4LB28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-rZ7ZyvhyOH6jYcc6cF8vjg-1; Wed, 11 Nov 2020 13:32:56 -0500
X-MC-Unique: rZ7ZyvhyOH6jYcc6cF8vjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC70106B268;
 Wed, 11 Nov 2020 18:32:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 257A95C1C4;
 Wed, 11 Nov 2020 18:32:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5BA144A43;
 Wed, 11 Nov 2020 18:32:53 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:32:53 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <1098879863.23006642.1605119573830.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201111173932.yjrlkddo6v6msqff@kamzik.brq.redhat.com>
References: <20201111143440.112763-1-drjones@redhat.com>
 <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
 <CAFEAcA9pYcXZ9LF=76N1OxF=UgYkiF+Z549vq9xWpS52qV7cLg@mail.gmail.com>
 <20201111173932.yjrlkddo6v6msqff@kamzik.brq.redhat.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
MIME-Version: 1.0
X-Originating-IP: [10.40.192.178, 10.4.195.7]
Thread-Topic: hw/arm/virt: ARM_VIRT must select ARM_GIC
Thread-Index: LFumSa2vd0Zp2n0M6fxWBdJnJl5k1g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Andrew Jones" <drjones@redhat.com>
> To: "Peter Maydell" <peter.maydell@linaro.org>
> Cc: "Miroslav Rezanina" <mrezanin@redhat.com>, "QEMU Developers" <qemu-de=
vel@nongnu.org>, "qemu-arm"
> <qemu-arm@nongnu.org>, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Sent: Wednesday, November 11, 2020 6:39:32 PM
> Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
>=20
> On Wed, Nov 11, 2020 at 04:00:25PM +0000, Peter Maydell wrote:
> > On Wed, 11 Nov 2020 at 15:05, Miroslav Rezanina <mrezanin@redhat.com>
> > wrote:
> > >
> > > ----- Original Message -----
> > > > From: "Andrew Jones" <drjones@redhat.com>
> > > > To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> > > > Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com,
> > > > "Miroslav Rezanina" <mrezanin@redhat.com>
> > > > Sent: Wednesday, November 11, 2020 3:34:40 PM
> > > > Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> > > >
> > > > The removal of the selection of A15MPCORE from ARM_VIRT also
> > > > removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
> >=20
> > >
> > > Problems with missing dependencies solved by this patch.
> > >
> > > Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
> >=20
> > This is the second of this kind of "missing select" bug I've
> > seen recently. I don't suppose there's some kind of testing
> > we could add to 'make check' that automatically catches them?
> >
>=20
> Miroslav is finding them because the RHEL build of QEMU is more selective
> than upstream as to what gets pulled in. Effort keeps going into making
> upstream more configurable, but it's not quite there yet for RHEL's
> purposes. I'm not sure how best to test something like this upstream.
> I guess it would require the flexible configuration support we don't yet
> have.
>=20

We use --without-default-devices and then add only supported devices - this=
 allow
us to find this kind of errors. To prevent them by test we would need compl=
ete matrix
possible of device configurations (or just usable combinations). Not always=
 is broken
build wrong - it can be caused by unusable configuration.

In this case, we have correct dependency - CONFIG_ARM_GIC_KVM requires CONF=
IG_KVM and CONFIG_ARM_GIC.
In RC1 commit bec3c97e0cf9 (hw/arm/virt: Remove dependency on Cortex-A15 MP=
Core peripherals) removed
indirect CONFIG_ARM_GIC from CONFIG_ARM_VIRT. So anyone using CONFIG_ARM_GI=
C_KVM with CONFIG_ARM_VIRT
now gets build error.=20

Question here is: Is okay to use CONFIG_ARM_GIC_KVM with CONFIG_ARM_VIRT wi=
thout explicit CONFIG_ARM_GIC?
I can imagine both answers:

1) yes - CONFIG_ARM_VIRT implicate presence of CONFIG_ARM_GIC so no need to=
 add it explicitly
2) no - If you want to use CONFIG_ARM_GIC_KVM you have to always add CONFIG=
_ARM_GIC explicitly too

I'm little bit confused now - why KConfig uses depends instead of select? I=
f using option without dependent
one is not possible shouldn't be logical to just get it?


Mirek
> Thanks,
> drew
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B348731D26C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:06:03 +0100 (CET)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC8Tq-0004oU-9f
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8SL-0004If-Mm
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:04:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lC8SI-0008U0-Tg
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613513064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3lPDNBh51Y7aDCu9d8M7wisrN6CtsALNZShbb6FZdk=;
 b=gArgMJn+8fVotgVNBtUN3a1nT8n4BLlIhtZjfR9Q3vV7q0AJAsGZB/DxHkeeiva9Bhqux/
 LRHlv/fxKpeHm/XKuoAcaMi8TFaMEJGrGMt/AaLndKbAS2W2xqZkI6GvJzg6vFjNNSzT5m
 pOwRsHy6JT/vKUWc1BnJT12WE+kjEd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-sfXMVRJlNfmoAaR2KFU8iA-1; Tue, 16 Feb 2021 17:04:22 -0500
X-MC-Unique: sfXMVRJlNfmoAaR2KFU8iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01971107ACF9;
 Tue, 16 Feb 2021 22:04:20 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9197D2C01F;
 Tue, 16 Feb 2021 22:04:15 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:04:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource
 for MMCONFIG region
Message-ID: <20210216230413.4dcd132d@redhat.com>
In-Reply-To: <20210216181325.GB15303@private.email.ne.jp>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
 <20210212205157.GA7151@private.email.ne.jp>
 <20210215134832.5a32e851@redhat.com>
 <20210216094301.GA15303@private.email.ne.jp>
 <20210216084510-mutt-send-email-mst@kernel.org>
 <20210216181325.GB15303@private.email.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 10:13:25 -0800
Isaku Yamahata <isaku.yamahata@gmail.com> wrote:

> On Tue, Feb 16, 2021 at 08:45:48AM -0500,
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > On Tue, Feb 16, 2021 at 01:43:01AM -0800, Isaku Yamahata wrote: =20
> > > On Mon, Feb 15, 2021 at 01:48:32PM +0100,
> > > Igor Mammedov <imammedo@redhat.com> wrote:
> > >  =20
> > > > On Fri, 12 Feb 2021 12:51:57 -0800
> > > > Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> > > >  =20
> > > > > On Fri, Feb 12, 2021 at 04:40:38PM +0100,
> > > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > > >  =20
> > > > > > On Wed, 10 Feb 2021 22:46:43 -0800
> > > > > > Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> > > > > >    =20
> > > > > > > +    Aml *dev;
> > > > > > > +    Aml *rbuf;
> > > > > > > +    Aml *resource_template;
> > > > > > > +    Aml *rbuf_name;
> > > > > > > +    Aml *crs;
> > > > > > > +
> > > > > > > +    if (!acpi_get_mcfg(&mcfg)) {
> > > > > > > +        return NULL;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* DRAM controller */
> > > > > > > +    dev =3D aml_device("DRAC");
> > > > > > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0=
1")));
> > > > > > > +
> > > > > > > +    resource_template =3D aml_resource_template();
> > > > > > > +    aml_append(resource_template,
> > > > > > > +               aml_qword_memory(AML_POS_DECODE,
> > > > > > > +                                AML_MIN_FIXED,
> > > > > > > +                                AML_MAX_FIXED,
> > > > > > > +                                AML_NON_CACHEABLE,
> > > > > > > +                                AML_READ_WRITE,
> > > > > > > +                                0x0000000000000000,
> > > > > > > +                                mcfg.base,
> > > > > > > +                                mcfg.base + mcfg.size - 1,  =
 =20
> > > > > > s/mcfg.base + mcfg.size - 1/mcfg.base/   =20
> > > > >=20
> > > > > AddressMaximum needs to be the highest address of the region.
> > > > > Not base address. By disassemble/assembl it, iasl complains as fo=
llows.
> > > > > Also there are similar examples in acpi-build.c. =20
> > > > I mostly clean up all places to use the same base address for min/m=
ax,
> > > > but probably something were left behind.
> > > >=20
> > > > spec says:
> > > >=20
> > > > acpi 6.3: 19.6.110 QWordMemory
> > > >=20
> > > > AddressMaximum evaluates to a 64-bit integer that specifies the hig=
hest possible base address of the
> > > > Memory range. The value must have =E2=80=980=E2=80=99 in all bits w=
here the corresponding bit in AddressGranularity is
> > > > =E2=80=981=E2=80=99. For bridge devices which translate addresses, =
this is the address on the secondary bus. The 64-bit
> > > > field DescriptorName ._MAX is automatically created to refer to thi=
s portion of the resource descriptor. =20
> > >=20
> > > Ok, Linux guest is happy with min=3Dmax.
> > > I conlude that it's iasl issue.
> > >=20
> > > Thanks, =20
> >=20
> > OK but what about all the other places in the code that seem to use thi=
s
> > field differently? =20
>=20
> Igor, what do you think?
> The followings are the summary of the situation.
>=20
> - acpi 6.4: 19.6.110 QWordMemory
>   _MAX: maximum of base address.
>=20
> - acpi 6.4: 6.4.3.5 Address Space Resource Descriptors
>   table 6.44
>   If _LEN > 0 and _MIF =3D 1 and _MAF =3D 1, then _LEN =3D _MAX - _MIN + =
1
>   This doesn't match with the above description
I'd say it 19.6.110 doesn't describes whole possibilities of resource,
but only subset in its current phrasing.

> - iasl
>   If _LEN > 0 and _MIF =3D 1 and _MAF =3D 1,
>   it emits warning on _LEN !=3D _MAX - _MIN + 1
so IASL is right and follows spec.

Anyways, My apologies for misleading and your patch is correct.

I need to add similar checks to QEMU code plus comments to avoid confusion
in future.

> - Linux Guest MMCONFIG check=20
>   check_mcfg_resoure() uses only _MIN. doesn't use _MAX.
>   _MAX value doesn't matter
>=20
> - Linux acpi code
>   acpi_decode_space() uses _MAX to calulate range [start, end], not use _=
LEN.
>   i.e. It assumes _LEN =3D _MAX - _MIN + 1 if _LEN > 0, _MIF =3D 1, _MAF =
=3D 1
>=20
> - qemu code sets for [qd]word_memory_resource (except this patch)
>   If _LEN > 0 and _MIF =3D 1 and _MAF =3D 1, then set _LEN =3D _MAX - _MI=
N + 1




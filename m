Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDED331AB8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 00:07:06 +0100 (CET)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOxt-000854-8x
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 18:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lJOwm-0007Uy-4b
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lJOwi-0003FH-GS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615244751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NEikep/64gQTJw7feMr/Kpa5BRqPCrvvSIMepis8pI=;
 b=HnQVOTcQeWW+y8mvDwkXXV5vTOWLfBCsJbbdeixMGssLnQvhQo09XO/cTfKrK07utJMyV8
 syhCof8xOEWKrwVKhWJTNZRUMOU+N2Nx/oHergbeHR5qoRqeeO+c/fP3aYIvr/yFS+UUHI
 bm8UCIcyqovuuA89okWoxZ3auhUV1fU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-HD3pHHGsM9an5x4sAPQJ4w-1; Mon, 08 Mar 2021 18:05:47 -0500
X-MC-Unique: HD3pHHGsM9an5x4sAPQJ4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0889080432F;
 Mon,  8 Mar 2021 23:05:46 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 951D15C5E1;
 Mon,  8 Mar 2021 23:05:41 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:05:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Message-ID: <20210308160541.75096520@omen.home.shazbot.org>
In-Reply-To: <YEZSkuQ1ximkfREp@redhat.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
 <YEZSkuQ1ximkfREp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 philmd@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 16:36:34 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Mar 08, 2021 at 09:39:49PM +0530, Tarun Gupta wrote:
> > VFIO migration support in QEMU is experimental as of now, which was don=
e to
> > provide soak time and resolve concerns regarding bit-stream.
> > But, with the patches discussed in
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784931.html , we =
have
> > corrected ordering of saving PCI config space and bit-stream.
> >=20
> > So, this patch proposes to make vfio migration support in QEMU to be en=
abled
> > by default. Tested by successfully migrating mdev device.
> >=20
> > Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > ---
> >  hw/vfio/pci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index f74be78209..15e26f460b 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] =3D {
> >      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
> >                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
> >      DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> > -                     vbasedev.enable_migration, false),
> > +                     vbasedev.enable_migration, true), =20
>=20
> If it isn't experimental then why do we even need an experimental 'x-'
> property at all ?
>=20
> IOW, rather than changing this to "true", shouldn't we just be deleting
> the x-enable-migration property entirely and have the code just do the
> right thing.

I don't think it's necessarily invalid to have experimental disables
for supported features.  We actually have quite a few of those already.
Most of them are generally aimed at debugging, for example disabling
direct mappings or acceleration paths that might mask an access when
trying to trace the behavior of a device.  We might want to consider
changing the polarity of the option to avoid user confusion, ie.
x-disable-migration.  I'm not fully convinced that there might not be
valid non-experimental use cases for such an option, but it seems like
that should be supported at a base device class level rather than per
driver, so best to be left experimental here.  Thanks,

Alex



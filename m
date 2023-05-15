Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846847029B7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUwr-0006J9-2l; Mon, 15 May 2023 05:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pyUwo-0006Ii-27; Mon, 15 May 2023 05:56:54 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pyUwj-0007ce-Qe; Mon, 15 May 2023 05:56:53 -0400
X-UUID: ce3c9677ed1c4a949bab496bfeff5d1b-20230515
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:1b854ef3-94bb-40dc-86a1-8bf488fe4bcc, IP:15,
 URL:25,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:31
X-CID-INFO: VERSION:1.1.22, REQID:1b854ef3-94bb-40dc-86a1-8bf488fe4bcc, IP:15,
 UR
 L:25,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:31
X-CID-META: VersionHash:120426c, CLOUDID:37e1343b-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:2305151652320MOLAW3V,BulkQuantity:4,Recheck:0,SF:24|17|19|43|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: ce3c9677ed1c4a949bab496bfeff5d1b-20230515
X-User: zenghao@kylinos.cn
Received: from [172.20.12.253] [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 350305384; Mon, 15 May 2023 17:56:36 +0800
Message-ID: <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
From: Hao Zeng <zenghao@kylinos.cn>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 15 May 2023 17:56:32 +0800
In-Reply-To: <ZGHyvBb8BQdKhWEy@redhat.com>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Fri, May 12, 2023 at 05:31:08PM +0800, Hao Zeng wrote:
> > Qemu does not support qxl graphics cards in arm, it is recommended
> > to enable
>=20
> Who recommends this and why ?
>=20
> The recommendations from Gerd are what I tend to point poeple to
> for display devices:
>=20
> =C2=A0 https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/
>=20
> and it had this to say about arm:
>=20
> =C2=A0 "On arm systems display devices with a pci memory bar do
> =C2=A0=C2=A0 not work, which reduces the choices alot. We are left with:
>=20
> =C2=A0=C2=A0=C2=A0 virtio gpu, if your guest has drivers
> =C2=A0=C2=A0=C2=A0 ramfb"
>=20
> Not sure if anything has changed in this respect ?
>=20
>=20
> The QXL graphics card is an incredibly complex device, offering
> 2d acceleration that is not very interesting for modern guest OS
> desktops since they're largely focused on 3d acceleration. This
> complexity is bad from a security POV.
>=20
> It would also require a guest driver to take advantage of QXL
> features and while I presume the Linux driver will build, it is
> still mostly pointless because of lack of interest in 2d
> acceleration.
> I'm not sure about status of the Windows QXL driver for aarch64 ?
>=20
> Further QXL is only useful when combined with SPICE graphics and
> the SPICE project is largely inactive.
>=20
> Overall, IMHO, we should keep QXL restricted to as few build
> scenarios
> as possible. Given the status of SPICE, possibly we'll even want to
> deprecate it on x86 eventually, not add it to more arches.=20
>=20
> What are you seeing as the compelling use case that requires QXL to
> exist on aarch64 ?
>=20
hi Daniel:
   Thank you for your answer, it made me learn a lot. No use case, just
outside customer feedback on the ARM architecture qxl use has problems,
I compiled the community qemu, found that the default does not support
qxl display, so the submitted enablement.
  I agree with you, please ignore this commit.

I apologize for the disturbance to you all.

Best regards,
> Hao
>=20
>=20
> >=20
> > Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
> > ---
> > =C2=A0hw/arm/Kconfig | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 0f42c556d7..d0bedf9347 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -32,6 +32,7 @@ config ARM_VIRT
> > =C2=A0=C2=A0=C2=A0=C2=A0 select VIRTIO_MEM_SUPPORTED
> > =C2=A0=C2=A0=C2=A0=C2=A0 select ACPI_CXL
> > =C2=A0=C2=A0=C2=A0=C2=A0 select ACPI_HMAT
> > +=C2=A0=C2=A0=C2=A0 select QXL
> > =C2=A0
> > =C2=A0config CHEETAH
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool
> > --=20
> > 2.37.2
> >=20
> >=20
>=20
> With regards,
> Daniel



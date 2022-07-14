Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4D574CB7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 14:03:33 +0200 (CEST)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxZ6-0005x7-20
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 08:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalii.ovchinnikov@auriga.com>)
 id 1oBxVv-00042g-7l
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:00:17 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:19356 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalii.ovchinnikov@auriga.com>)
 id 1oBxVr-0006Gc-BK
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:00:13 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 14 Jul 2022 14:53:57 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%3]) with mapi id
 15.02.1118.007; Thu, 14 Jul 2022 14:53:57 +0300
From: "Ovchinnikov, Vitalii" <vitalii.ovchinnikov@auriga.com>
To: Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: Internal MAC addresses list (mac_table) usage
Thread-Topic: Internal MAC addresses list (mac_table) usage
Thread-Index: AQHYlcZo8cC1dmFBMkyljjkQx472u619PH4AgACDyqo=
Date: Thu, 14 Jul 2022 11:53:57 +0000
Message-ID: <ae177ae534fa4045885916299bbb0652@auriga.com>
References: <cfdc8ffef03c4574a72faea46f2e1ef1@auriga.com>,
 <CACGkMEvRNMoUSGQZa7wvQu=FKgKw3RJmioHZy1r3f6bYTS-JFQ@mail.gmail.com>
In-Reply-To: <CACGkMEvRNMoUSGQZa7wvQu=FKgKw3RJmioHZy1r3f6bYTS-JFQ@mail.gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.99.99.40]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27014.002
x-tm-as-result: No-10--12.855500-8.000000
x-tmase-matchedrid: X4bcv0S75KmHYS4ybQtcOgrcxrzwsv5uXPK9y3z82Gu3CLdtdG1oCKAe
 /Yw0Hv+DiI9g6JBc05Os/wJ9EGB8eexuEpSKm2TE5jpYq8oRllOyTrWV4vwyX/4DDXoaCqk7jFK
 /NcS7G4ldJRMfBTsO+POUotS/NX+KQ9tg+p38ZomYh7QjWI3JDBmyTBaqiJvcVo0lrxbM8auLt6
 3p7uWNMJ4yh6OkScjIF1zC+MEZV0WGFWqjeDE74QPZZctd3P4B0MQw+++ihy/qFRQsrMdGBPzxf
 g6IZlFlN/cuMNJ8XfbcPfSk4MFdVPSGqCRif9CL9Ib/6w+1lWRaY5+vdounCI5LnhCTh8HJ6bnv
 e26xmNC/+cseRgjV4zEJvQUOinQkGAdnzrnkM4+DGx/OQ1GV8rHlqZYrZqdI+gtHj7OwNO2FR9H
 au8GO7m3tuIXQKer83ZLpYzHoKg77NmA/Ia8TS+xXTiWriRqa/He/CAYT0Rg=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--12.855500-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27014.002
x-tm-snts-smtp: BD97FDDC7E55BA012B9E1DE9D47C55DA0F1B7A1DA0A18D669E94F642DD7F448A2000:8
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=vitalii.ovchinnikov@auriga.com; helo=hq-ms.auriga.ru
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

Thanks for pointing out that corner case with "52:54:00:12:34:XX".

In the NIC model I'm developing qemu_macaddr_default_if_unset is called eve=
ry time MAC is updated in the NIC registers.
This way a just assigned "52:54:00:12:34:XX" MAC is at least marked as used=
 in the mac_table.

However it doesn't cover the case when "52:54:00:12:34:XX" MAC being assign=
ed through NIC registers has already been assigned to another NIC by QEMU.
So one more improvement the code might need is a way to check whether MAC i=
s free or used from within NIC model.
Returning bool from qemu_macaddr_default_if_unset may well do the trick. Mo=
reover it might also help to spot an error when -1 is returned from qemu_ma=
caddr_get_free (for the time being it's silently interpreted as 0xFF MAC LS=
B).

BR,
Vitalii

From: Jason Wang <jasowang@redhat.com>
Sent: Thursday, July 14, 2022 9:44
To: Ovchinnikov, Vitalii
Cc: qemu-devel@nongnu.org
Subject: Re: Internal MAC addresses list (mac_table) usage
=A0  =20
On Tue, Jul 12, 2022 at 4:43 PM Ovchinnikov, Vitalii
<vitalii.ovchinnikov@auriga.com> wrote:
>
> Hi folks,
>
> While developing an Ethernet NIC model I noticed that QEMU maintains the =
following internal array which marks used/free MAC addresses in net/net.c:
>
> static int mac_table[256] =3D {0};
>
> with three private (static) functions accessing it: qemu_macaddr_set_used=
, qemu_macaddr_set_free, qemu_macaddr_get_free.
> Public (non-static) interface to this array includes two functions: qemu_=
macaddr_default_if_unset and qemu_del_nic.
>
> The vast majority of existing NIC models calls qemu_macaddr_default_if_un=
set in their *_realize functions replacing zeroed-out MAC address with the =
free one returned by QEMU, for instance (lan9118_realize functions from hw/=
net/lan9118.c):
>
>=A0=A0=A0 ...
>=A0=A0=A0=A0 qemu_macaddr_default_if_unset(&s->conf.macaddr);
>
>=A0=A0=A0=A0 s->nic =3D qemu_new_nic(&net_lan9118_info, &s->conf,
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 object_get_typename(OBJECT(dev)), dev->id, s);
>=A0=A0=A0=A0 qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.maca=
ddr.a);
>=A0=A0=A0 ...
>
> qemu_del_nic is being called from net_cleanup function right before QEMU =
finishes execution.
>
> What appears to be a possible SW architecture gap is that NIC models have=
 no means to inform QEMU about changing their MAC addresses during executio=
n (again from hw/net/lan9118.c, do_mac_write function):
>
>=A0=A0=A0=A0 case MAC_ADDRH:
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[4] =3D val & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[5] =3D (val >> 8) & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 lan9118_mac_changed(s);
>=A0=A0=A0=A0=A0=A0=A0=A0 break;
>=A0=A0=A0=A0 case MAC_ADDRL:
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[0] =3D val & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[1] =3D (val >> 8) & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[2] =3D (val >> 16) & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 s->conf.macaddr.a[3] =3D (val >> 24) & 0xff;
>=A0=A0=A0=A0=A0=A0=A0=A0 lan9118_mac_changed(s);
>=A0=A0=A0=A0=A0=A0=A0=A0 break;
>
> lan9118_mac_changed function here simply changes NIC info string using qe=
mu_format_nic_info_str, hence stale MAC address stays marked as used in the=
 mac_table whereas it's not actually in use any more.
>
> Am I right in thinking of it as a SW architecture gap/bug that needs to b=
e addressed?

I think so. Note that the code can not deal with the case when
"52:54:00:12:34:XX" was passed from cli.

Thanks

>
> BR,
> Vitalii
>

    =


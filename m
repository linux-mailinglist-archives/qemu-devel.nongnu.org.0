Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DC6BF07C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 19:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEYr-00075a-OP; Fri, 17 Mar 2023 14:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdEYp-00075F-N4
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:12:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdEYn-0000A5-1e
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:12:15 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdXFQ1ftKz6J9dG
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 02:08:58 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Mar
 2023 18:12:06 +0000
Date: Fri, 17 Mar 2023 18:12:05 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Maverickk 78
 <maverickk1778@gmail.com>
Subject: Re: Call failed: MCTP Endpoint did not respond: Qemu CXL switch
 with mctp-1.0
Message-ID: <20230317181205.0000002d@huawei.com>
In-Reply-To: <20230317163720.00005c23@Huawei.com>
References: <CALfBBTuELntcARWxvHyGmYvHbEACujhBq8bphHKnUv_C_z33Bg@mail.gmail.com>
 <20230317163720.00005c23@Huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Mar 2023 16:37:20 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Fri, 17 Mar 2023 00:11:10 +0530
> Maverickk 78 <maverickk1778@gmail.com> wrote:
>=20
> > Hi
> >=20
> >  I am trying mctp & mctpd with aspeed +buildroot(master) + linux v6.2
> > with Qemu 7.2.
> >=20
> >=20
> > I have added necessary FMAPI related patches into QEMU to support CLX
> > switch emulation
> >=20
> > RFC-1-2-misc-i2c_mctp_cxl_fmapi-Initial-device-emulation.diff
> >=20
> > RFC-2-3-hw-i2c-add-mctp-core.diff
> >=20
> > RFC-4-4-hw-misc-add-a-toy-i2c-echo-device.diff
> >=20
> > RFC-2-2-arm-virt-Add-aspeed-i2c-controller-and-MCTP-EP-to-enable-MCTP-t=
esting.diff
> >=20
> > RFC-3-3-hw-nvme-add-nvme-management-interface-model.diff
> >=20
> >=20
> > Executed following mctp commands to setup the binding,
> >=20
> > mctp link set mctpi2c15 up
> >=20
> > mctp addr add 50 dev mctpi2c15
> >=20
> > mctp link set mctpi2c15 net 11
> >=20
> > systemctl restart mctpd.service
> >=20
> > busctl call xyz.openbmc_project.MCTP /xyz/openbmc_project/mctp
> > au.com.CodeConstruct.MCTP AssignEndpoint say mctpi2c15 1 0x4d
> >=20
> >=20
> >  The above busctl configuration is reaching fmapi patch and sets up
> > the endpoint id but then mctpd fails with log after timeout.
> >=20
> > Call failed: MCTP Endpoint did not respond
> >=20
> > Any clue what's going on? =20
>=20
> Hi Raghu,
>=20
> Yikes. Didn't think anyone would still use that series.
> Not even sure I still have a tree with it on.
>=20
> I'll try and bring up again and get back to you. Might be a little
> while though.

It is Friday and this was more interesting than what I was planning to do. =
:)

I think the breakage comes from the async send i2c series that was a month
or so after the PoC was posted. Issues was it was only entering the _bh onc=
e.

Following hack works for me on current mainline (+ CXL patches that shouldn=
't
affect this.)




=46rom c8d819835faaec2b2a4755eb891284fe21c0747d Mon Sep 17 00:00:00 2001
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Date: Fri, 17 Mar 2023 18:07:08 +0000
Subject: [PATCH] misc/i2c_mctp_fmapi: Hack

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/misc/i2c_mctp_cxl_fmapi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/misc/i2c_mctp_cxl_fmapi.c b/hw/misc/i2c_mctp_cxl_fmapi.c
index 219e30bfd5..2e2da80264 100644
--- a/hw/misc/i2c_mctp_cxl_fmapi.c
+++ b/hw/misc/i2c_mctp_cxl_fmapi.c
@@ -330,7 +330,7 @@ static int i2c_mctp_cxl_switch_event(I2CSlave *i2c, enu=
m i2c_event event)
     case I2C_FINISH:
         s->len =3D 0;
         s->state =3D MCTP_I2C_PROCESS_REQUEST;
-        qemu_bh_schedule(s->bh);
+        i2c_bus_master(s->bus, s->bh);
         return 0;
     case I2C_NACK:
     default:
@@ -671,12 +671,11 @@ static void mctp_bh(void *opaque)
=20
     switch (s->state) {
     case MCTP_I2C_PROCESS_REQUEST:
-        i2c_bus_master(s->bus, s->bh);
         s->state =3D MCTP_I2C_START_SEND;
-        return;
-       =20
+//        return;
+        //fallthrough
     case MCTP_I2C_START_SEND:
-        i2c_start_send(s->bus, s->source_slave_addr);
+        i2c_start_send_async(s->bus, s->source_slave_addr);
         s->send_buf[s->len] =3D s->source_slave_addr << 1;
         s->len++;
         s->state =3D MCTP_I2C_ACK;
--=20
2.37.2


>=20
> Jonathan
>=20
>=20
> >=20
> >=20
> > Regards
> > Raghu =20
>=20
>=20
>=20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08388107619
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 18:01:20 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYCJ4-0002R4-8u
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 12:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bala24@linux.ibm.com>) id 1iYBzs-0002Id-Tk
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bala24@linux.ibm.com>) id 1iYBzr-0000ix-2i
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:41:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58644
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bala24@linux.ibm.com>)
 id 1iYBzq-0000hQ-Tt
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 11:41:27 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMGcXd9051560
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 11:41:24 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wdhxmj7r6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 11:41:23 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <bala24@linux.ibm.com>;
 Fri, 22 Nov 2019 16:41:21 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Nov 2019 16:41:19 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAMGeeet27656506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 16:40:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FF07A4060;
 Fri, 22 Nov 2019 16:41:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0230A405F;
 Fri, 22 Nov 2019 16:41:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.54.80])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Nov 2019 16:41:16 +0000 (GMT)
Date: Fri, 22 Nov 2019 22:11:13 +0530
From: Balamuruhan S <bala24@linux.ibm.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/5] ppc/pnv: fix Homer/Occ mappings on multichip systems
References: <20191119175056.32518-1-bala24@linux.ibm.com>
 <779f2a3b-62d2-62e9-674c-b2b53bf26da0@kaod.org>
 <20191121091123.GG14854@dhcp-9-120-236-104.in.ibm.com>
 <2155b5ed-0d17-7e5d-ba98-156311e68468@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2155b5ed-0d17-7e5d-ba98-156311e68468@kaod.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 19112216-4275-0000-0000-00000384F8AF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112216-4276-0000-0000-000038987A85
Message-Id: <20191122164113.GC30881@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_03:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911220143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id xAMGcXd9051560
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 21, 2019 at 11:00:12AM +0100, C=E9dric Le Goater wrote:
> On 21/11/2019 10:11, Balamuruhan S wrote:
> > On Wed, Nov 20, 2019 at 08:46:30AM +0100, C=E9dric Le Goater wrote:
> >> Hello,
> >>
> >> On 19/11/2019 18:50, Balamuruhan S wrote:
> >>> Hi All,
> >>>
> >>> PowerNV fails to boot in multichip systems due to some misinterpret=
ation
> >>> and mapping in Homer/Occ device models, this patchset fixes the
> >>> following,
> >>>
> >>>  - Homer size is 4MB per chip and Occ common area size is 8MB
> >>>  - Bar masks are used to calculate sizes of Homer/Occ in skiboot so
> >>>    return appropriate value
> >>>  - Occ common area is in BAR 3 on Power8 but wrongly mapped to BAR =
2
> >>>    currently
> >>>  - OCC common area is shared across chips and should be mapped only=
 once
> >>>    for multichip systems
> >>
> >> The first thing to address is the HOMER XSCOM region.=20
> >>
> >> Introduce an empty skeleton for P8 and P9 with different mem ops han=
ders
> >> because the registers have a different layout. From there, add the s=
upport
> >> for the different PBA* regs and move them out from the default XSCOM
> >> handlers. That should fix most of the current problems and it will p=
rovide=20
> >> a nice framework for future extensions.
> >=20
> > sure, I will work on it.
> >=20
> >>
> >> Why not add the associated HOMER MMIO region while we are it ? the P=
BA
> >> registers have all the definitions we need and it will gives us acce=
ss
> >> to the pstate table.
> >=20
> > so, idea is to have HOMER MMIO for us to use it accessing pstate tabl=
e / data
> > and HOMER XSCOM for homer associated xscom access for PBA* registers =
to
> > P8 and P9 respectively.
>=20
> yes.=20
>=20
> >> Second is the OCC region. Do we need a XSCOM *or* a MMIO region ? Th=
is is=20
> >> not clear. Please check skiboot. I think a MMIO region should be eno=
ugh
> >> because this is how sensor data from the OCC is accessed.
> >=20
> > Okay, I will do the change for OCC to use MMIO, and will check skiboo=
t
> > for making it better.
> >=20
> >>
> >> On that topic, we could define properties on the PnvOCC model for ea=
ch=20
> >> sensor and tune the value from the QEMU monitor. It really shouldn't=
 be
> >> too complex.
> >=20
> > How can we tune value from QEMU monitor ? This is new to me and will
> > need to check it. I remember you have advised this with the error
> > injection framework patches and Rashmica's patch that provides way to
> > use Qemu monitor to feed data, but I need to do some study.
>=20
>=20
> See Joel's patch which has a simple example : =20
>=20
>    patchwork.ozlabs.org/patch/1196519
>=20
> It simply generates object properties :=20
>=20
>=20
> +    for (led =3D 0; led < s->nr_leds; led++) {
> +        char *name;
> +
> +        name =3D g_strdup_printf("led%d", led);
> +        object_property_add(obj, name, "bool", pca9552_get_led, pca955=
2_set_led,
> +                            NULL, NULL, NULL);
> +    }
>=20
> with defined get and set accessors.=20
>=20
> We could do the same for the OCC sensors with a table describing the=20
> sensor layout. Accessors would just simply update the table. we could
> even trigger the OCC interrupt if needed.
>=20
> This is the initial table :
>=20
>   https://github.com/open-power/occ/blob/master/src/occ_405/sensor/sens=
or_info.c
>=20
> Linux should be able to grab the values through hwmon just as on real H=
W.
> This is the case today for the DTS.

cool...

>=20
> >>
> >> Also the same address is used, we should only map it once but we nee=
d=20
> >> to invent something to know from which chip it is accessed.
> >=20
> > This is something need to check how real hardware handles it while
> > accessing shared occ region from different chip and think how to make=
 it
> > for us.
>=20
> Yes. I suppose there is some chip id in the powerbus message.

:+1:

>=20
> C.
>=20
>  =20
> >=20
> > Thanks a lot!
> >=20
> > -- Bala
> >=20
> >>
> >>
> >> C.
> >>
> >>
> >>>
> >>> Request for your review and suggestions to make it better. I would =
like to
> >>> thank Cedric for his time and help to figure out the issues.
> >>>
> >>> Balamuruhan S (5):
> >>>   hw/ppc/pnv: incorrect homer and occ common area size
> >>>   hw/ppc/pnv_xscom: PBA bar mask values are incorrect with homer/oc=
c
> >>>     sizes
> >>>   hw/ppc/pnv_xscom: Power8 occ common area is in PBA BAR 3
> >>>   hw/ppc/pnv_xscom: occ common area to be mapped only once
> >>>   hw/ppc/pnv_xscom: add PBA BARs for Power8 slw image
> >>>
> >>>  hw/ppc/pnv_occ.c     |  2 +-
> >>>  hw/ppc/pnv_xscom.c   | 37 +++++++++++++++++++++++++++----------
> >>>  include/hw/ppc/pnv.h | 12 ++++++++----
> >>>  3 files changed, 36 insertions(+), 15 deletions(-)
> >>>
> >>
> >=20
>=20



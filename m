Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BC2FA7E4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:50:59 +0100 (CET)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yg6-0005Fl-Vf
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <angel.pagan@stratus.com>)
 id 1l1XzV-00017n-4g
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:07:01 -0500
Received: from us-smtp-delivery-131.mimecast.com ([63.128.21.131]:53234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <angel.pagan@stratus.com>)
 id 1l1XzQ-0008GR-TN
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:06:55 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-QUhDHJg6NcKxG5ksGmeNEg-1; Mon, 18 Jan 2021 12:06:48 -0500
X-MC-Unique: QUhDHJg6NcKxG5ksGmeNEg-1
Received: from BL0PR08MB4676.namprd08.prod.outlook.com (2603:10b6:208:58::11)
 by BL0PR08MB5267.namprd08.prod.outlook.com (2603:10b6:208:55::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 17:06:45 +0000
Received: from BL0PR08MB4676.namprd08.prod.outlook.com
 ([fe80::6df3:e0a8:ba9e:c1ba]) by BL0PR08MB4676.namprd08.prod.outlook.com
 ([fe80::6df3:e0a8:ba9e:c1ba%6]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:06:44 +0000
From: "Pagan, Angel" <Angel.Pagan@stratus.com>
To: Gerd Hoffmann <gerd@kraxel.org>
Subject: Re: [EXTERNAL] Re: USB Gen2 passthrough not working
Thread-Topic: [EXTERNAL] Re: USB Gen2 passthrough not working
Thread-Index: AQHW6oU147qKlTriWkqkboxJoMgbW6oobV2AgAU1ZHQ=
Date: Mon, 18 Jan 2021 17:06:43 +0000
Message-ID: <BL0PR08MB467640E0765647A4FDE790AFE5A40@BL0PR08MB4676.namprd08.prod.outlook.com>
References: <BL0PR08MB4676559855A6894E3B987514E5A80@BL0PR08MB4676.namprd08.prod.outlook.com>,
 <20210115093129.5bqkyme4uz2zzczx@sirius.home.kraxel.org>
In-Reply-To: <20210115093129.5bqkyme4uz2zzczx@sirius.home.kraxel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.88.105.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfbae1e6-500d-470f-2008-08d8bbd36ed5
x-ms-traffictypediagnostic: BL0PR08MB5267:
x-microsoft-antispam-prvs: <BL0PR08MB52674A31690BC8962EC47BE8E5A40@BL0PR08MB5267.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: wD5C+Mq2iPpZu1h4l7N6PIEkEWwAIpbfrIONmLmwlaM0ZdgxgbfRv9Bbll8RD7ihj1dtJE+k8opy0l5U2CoJoVf/go974mN3GUzxiMjr2xIBHim3g37v0Mb8OXM7STbJ71Ewi0K/s4E2OeknV2gt0ZPeJFAA1SZcls8zMTTx76+nRcmiVLssKS0nqShuF8gHPI4Xq5Qgh7lnz1zk8EWL2jlFIgzheEEQqlVzqttpO+eGJc04WCbSYiJ9T6Rg+d7lfGrwkvgrYG9ZLMFW7sRX/u/j2q/OgfU0PAUHIHTrzmR62xvR5GqK05A/hNHuBRV/95HzHtr3fVTt7CL0tdGwGQWMvhk2ivCllrk11nRBL+UFBfCa0ap1kDEFScqfh8mik9x44Yauqiq0rT3YDcMV9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR08MB4676.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39850400004)(136003)(346002)(366004)(396003)(8936002)(186003)(66556008)(26005)(66946007)(66476007)(6506007)(76116006)(478600001)(55016002)(64756008)(33656002)(66446008)(4326008)(9686003)(316002)(53546011)(2906002)(7696005)(52536014)(86362001)(8676002)(19627405001)(83380400001)(5660300002)(6916009)(71200400001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DyI2WcrPsgmslC6AvBOjLCsZAk0s0uuOY8xCwRye524rRkVpmM+tRuhgDGuV?=
 =?us-ascii?Q?dpsEExpy/FvYDYOr+kk1+yoMcPSwpxBibvBa4iG6haWnvNQmqWvJ+s/FISHx?=
 =?us-ascii?Q?0vEXp3pSM6YWeU23HsMUJnjSgJhTXoqwRX3iVgT9/dh06yRM8p+EYiQMTZHw?=
 =?us-ascii?Q?r27KRaso1lR8e93sgZ2iegksXLK7pz1BNSTB1F+YC8lOQa5/pV/J+cyvoePW?=
 =?us-ascii?Q?NKX6cYGYa8WMoaaNqvcG5XzcO2mtPthBli0JNLfDeNJQte3eLkn3FrccUq2W?=
 =?us-ascii?Q?BFyNcilBbpmBjHpiBdlZnoiPZcsre+f69gp8SptnxCs9xpk79yrXvWJnjVuq?=
 =?us-ascii?Q?Mx1PN3zxhYdIzwLM6xcJ3pqU/a4dh3/xJ/aZMje93tng+u1MOO1s/x3gh4q/?=
 =?us-ascii?Q?e3yMyH/w2Vh36bsEH38SaQCPiXk+eiNvZlSdqLsaAJ5cBXKTsnTsK7HS5cGL?=
 =?us-ascii?Q?zFfAABuJYS+q3ydxMr0C45KDX1to3JJJv+epaxkO3iCq+pABFnPtL8qj6s/b?=
 =?us-ascii?Q?6+6DjBhhvVIqnrjZdFknXKLAnborWCFWv/bxBbIP1z6vnXLf/YBC/+CerxT1?=
 =?us-ascii?Q?Hpj/t/qjNheerMcYIF86rqcBrbcvM773CMyTg2L6J2/DgqBc5cVRRYK33DWE?=
 =?us-ascii?Q?wi5hyDEMZEEgYo9nXqDcXwu3xC9M6ObY42OOa6eRhZmnubGHi9crN7L+M2YY?=
 =?us-ascii?Q?YtXgkFYnTt+srVKi3NCFYcZvehjcN6uMHUYqA5zBDcQ53xMzfak0WmTb/VFv?=
 =?us-ascii?Q?Nz3SETu70Dx1o3m7GT09Vmo1l4uXnGYdHdFbAEMUZ0CgoA2GKTyNztkMIF92?=
 =?us-ascii?Q?CdpX74Gl969Po0YQn39SafzadsaCXwaMRac5IiwFI3SDBSe2W8r+dRc3dvJh?=
 =?us-ascii?Q?DgfoWxCsxzcp4Nx14fzyQbuDak56zg+KyOAEiE6YI+YMRcVCBIOlKhX6HIwd?=
 =?us-ascii?Q?5MWGyy34+qFL2bo/HZ10H400odGynWI/NJwo/WZ00UOeDnmZJt2REwCXp5ka?=
 =?us-ascii?Q?nrm72PpxfoWVxlcTDlWKBR0yMyrxviPBd4kBx1RdIRPviangAOYHcsx+RQVU?=
 =?us-ascii?Q?dI6WSk9k?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stratus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR08MB4676.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbae1e6-500d-470f-2008-08d8bbd36ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 17:06:43.7853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de36b473-b8ad-46ff-837f-9da16b8d1b77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Grnceh8TRPewEMVlpkbqirwu6Mb9Fbn2HxdxENEWbUPuUoFFmy7zhnQoXhKV3Zm2FTAujfbBVQL8OiQif4JIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB5267
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA31A22 smtp.mailfrom=angel.pagan@stratus.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: stratus.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BL0PR08MB467640E0765647A4FDE790AFE5A40BL0PR08MB4676namp_"
Received-SPF: pass client-ip=63.128.21.131;
 envelope-from=angel.pagan@stratus.com; helo=us-smtp-delivery-131.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BL0PR08MB467640E0765647A4FDE790AFE5A40BL0PR08MB4676namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Gerd,

This patch works. The USB3 Gen2 device is now seen in the guest as a Gen1 d=
evice when attached and I can perform reads and writes to the device. Will =
you be checking this in soon?

Thanks,
Angel

guest:
Jan 18 16:49:52 localhost kernel: usb 2-4: new SuperSpeed Gen 1 USB device =
number 2 using xhci_hcd
Jan 18 16:49:52 localhost kernel: usb 2-4: New USB device found, idVendor=
=3D154b, idProduct=3Df00c, bcdDevice=3D 1.00
Jan 18 16:49:52 localhost kernel: usb 2-4: New USB device strings: Mfr=3D2,=
 Product=3D3, SerialNumber=3D1
Jan 18 16:49:52 localhost kernel: usb 2-4: Product: PNY PRO ELITE PSSD
Jan 18 16:49:52 localhost kernel: usb 2-4: Manufacturer: PNY
Jan 18 16:49:52 localhost kernel: usb 2-4: SerialNumber: 511200715265B31300=
24
Jan 18 16:49:52 localhost kernel: usbcore: registered new interface driver =
usb-storage
Jan 18 16:49:52 localhost kernel: scsi host6: uas
Jan 18 16:49:52 localhost kernel: usbcore: registered new interface driver =
uas
Jan 18 16:49:52 localhost kernel: scsi 6:0:0:0: Direct-Access     PNY      =
PNY PRO ELITE PS 0    PQ: 0 ANSI: 6
Jan 18 16:49:53 localhost kernel: scsi 6:0:0:0: Attached scsi generic sg0 t=
ype 0
Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] 976748545 512-byte logi=
cal blocks: (500 GB/465 GiB)
Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Write Protect is off
Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Write cache: enabled, r=
ead cache: enabled, doesn't support DPO or FUA
Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Optimal transfer size 3=
3553920 bytes
Jan 18 16:49:53 localhost kernel: sda: sda1
Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Attached SCSI disk

[root@localhost ~]# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 5000M
    |__ Port 4: Dev 2, If 0, Class=3DMass Storage, Driver=3Duas, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 480M
[root@localhost ~]#
________________________________
From: Gerd Hoffmann <gerd@kraxel.org>
Sent: Friday, January 15, 2021 4:31 AM
To: Pagan, Angel <Angel.Pagan@stratus.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Subject: [EXTERNAL] Re: USB Gen2 passthrough not working

[EXTERNAL SENDER: This email originated from outside of Stratus Technologie=
s. Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.]

  Hi,

>  usb 2-3: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd

> localhost login: [   72.763264] usb 1-4: new low-speed USB device number =
3 using xhci_hcd

ilibusb reports LIBUSB_SPEED_SUPER_PLUS and qemu
doesn't handle it ...

Lets treat it like superspeed for now, does that help?

--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -186,6 +186,7 @@ static const char *speed_name[] =3D {
     [LIBUSB_SPEED_FULL]    =3D "12",
     [LIBUSB_SPEED_HIGH]    =3D "480",
     [LIBUSB_SPEED_SUPER]   =3D "5000",
+    [LIBUSB_SPEED_SUPER_PLUS] =3D "5000+",
 };

 static const unsigned int speed_map[] =3D {
@@ -193,6 +194,7 @@ static const unsigned int speed_map[] =3D {
     [LIBUSB_SPEED_FULL]    =3D USB_SPEED_FULL,
     [LIBUSB_SPEED_HIGH]    =3D USB_SPEED_HIGH,
     [LIBUSB_SPEED_SUPER]   =3D USB_SPEED_SUPER,
+    [LIBUSB_SPEED_SUPER_PLUS] =3D USB_SPEED_SUPER,
 };

 static const unsigned int status_map[] =3D {


--_000_BL0PR08MB467640E0765647A4FDE790AFE5A40BL0PR08MB4676namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Gerd,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This patch works. The USB3 Gen2 device is now seen in the guest as a Gen1 d=
evice when attached and I can perform reads and writes to the device. Will =
you be checking this in soon?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Angel</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
guest:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jan 18 16:49:52 localhost kernel: usb 2-4: new SuperSpeed Gen 1 USB device =
number 2 using xhci_hcd
<div>Jan 18 16:49:52 localhost kernel: usb 2-4: New USB device found, idVen=
dor=3D154b, idProduct=3Df00c, bcdDevice=3D 1.00</div>
<div>Jan 18 16:49:52 localhost kernel: usb 2-4: New USB device strings: Mfr=
=3D2, Product=3D3, SerialNumber=3D1</div>
<div>Jan 18 16:49:52 localhost kernel: usb 2-4: Product: PNY PRO ELITE PSSD=
</div>
<div>Jan 18 16:49:52 localhost kernel: usb 2-4: Manufacturer: PNY</div>
<div>Jan 18 16:49:52 localhost kernel: usb 2-4: SerialNumber: 511200715265B=
3130024</div>
<div>Jan 18 16:49:52 localhost kernel: usbcore: registered new interface dr=
iver usb-storage</div>
<div>Jan 18 16:49:52 localhost kernel: scsi host6: uas</div>
<div>Jan 18 16:49:52 localhost kernel: usbcore: registered new interface dr=
iver uas</div>
<div>Jan 18 16:49:52 localhost kernel: scsi 6:0:0:0: Direct-Access &nbsp; &=
nbsp; PNY &nbsp; &nbsp; &nbsp;PNY PRO ELITE PS 0 &nbsp; &nbsp;PQ: 0 ANSI: 6=
</div>
<div>Jan 18 16:49:53 localhost kernel: scsi 6:0:0:0: Attached scsi generic =
sg0 type 0</div>
<div>Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] 976748545 512-byte=
 logical blocks: (500 GB/465 GiB)</div>
<div>Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Write Protect is o=
ff</div>
<div>Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Write cache: enabl=
ed, read cache: enabled, doesn't support DPO or FUA</div>
<div>Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Optimal transfer s=
ize 33553920 bytes</div>
<div>Jan 18 16:49:53 localhost kernel: sda: sda1</div>
<div>Jan 18 16:49:53 localhost kernel: sd 6:0:0:0: [sda] Attached SCSI disk=
</div>
<div><br>
</div>
<div>[root@localhost ~]# lsusb -t</div>
<div>/: &nbsp;Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p=
, 5000M</div>
<div>&nbsp; &nbsp; |__ Port 4: Dev 2, If 0, Class=3DMass Storage, Driver=3D=
uas, 5000M</div>
<div>/: &nbsp;Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p=
, 480M</div>
<div>&nbsp; &nbsp; |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device,=
 Driver=3Dusbhid, 480M</div>
[root@localhost ~]# <br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gerd Hoffmann &lt;ger=
d@kraxel.org&gt;<br>
<b>Sent:</b> Friday, January 15, 2021 4:31 AM<br>
<b>To:</b> Pagan, Angel &lt;Angel.Pagan@stratus.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: USB Gen2 passthrough not working</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[EXTERNAL SENDER: This email originated from outsi=
de of Stratus Technologies. Do not click links or open attachments unless y=
ou recognize the sender and know the content is safe.]<br>
<br>
&nbsp; Hi,<br>
<br>
&gt;&nbsp; usb 2-3: new SuperSpeedPlus Gen 2 USB device number 3 using xhci=
_hcd<br>
<br>
&gt; localhost login: [&nbsp;&nbsp; 72.763264] usb 1-4: new low-speed USB d=
evice number 3 using xhci_hcd<br>
<br>
ilibusb reports LIBUSB_SPEED_SUPER_PLUS and qemu<br>
doesn't handle it ...<br>
<br>
Lets treat it like superspeed for now, does that help?<br>
<br>
--- a/hw/usb/host-libusb.c<br>
+++ b/hw/usb/host-libusb.c<br>
@@ -186,6 +186,7 @@ static const char *speed_name[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_FULL]&nbsp;&nbsp;&nbsp; =3D &quot;12=
&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_HIGH]&nbsp;&nbsp;&nbsp; =3D &quot;48=
0&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_SUPER]&nbsp;&nbsp; =3D &quot;5000&qu=
ot;,<br>
+&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_SUPER_PLUS] =3D &quot;5000+&quot;,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static const unsigned int speed_map[] =3D {<br>
@@ -193,6 +194,7 @@ static const unsigned int speed_map[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_FULL]&nbsp;&nbsp;&nbsp; =3D USB_SPEE=
D_FULL,<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_HIGH]&nbsp;&nbsp;&nbsp; =3D USB_SPEE=
D_HIGH,<br>
&nbsp;&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_SUPER]&nbsp;&nbsp; =3D USB_SPEED_SUP=
ER,<br>
+&nbsp;&nbsp;&nbsp; [LIBUSB_SPEED_SUPER_PLUS] =3D USB_SPEED_SUPER,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static const unsigned int status_map[] =3D {<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BL0PR08MB467640E0765647A4FDE790AFE5A40BL0PR08MB4676namp_--



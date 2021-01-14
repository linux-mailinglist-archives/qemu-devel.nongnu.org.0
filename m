Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D312F6394
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:59:53 +0100 (CET)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l046K-0008Pm-MK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <angel.pagan@stratus.com>)
 id 1l0448-0007HS-0W
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:57:36 -0500
Received: from us-smtp-delivery-131.mimecast.com ([216.205.24.131]:51851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <angel.pagan@stratus.com>)
 id 1l043y-000772-Fr
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:57:35 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-9H3E_pxSNPiAmQgCSxvCmQ-1; Thu, 14 Jan 2021 09:56:16 -0500
X-MC-Unique: 9H3E_pxSNPiAmQgCSxvCmQ-1
Received: from BL0PR08MB4676.namprd08.prod.outlook.com (2603:10b6:208:58::11)
 by MN2PR08MB6256.namprd08.prod.outlook.com (2603:10b6:208:1a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 14:56:12 +0000
Received: from BL0PR08MB4676.namprd08.prod.outlook.com
 ([fe80::6df3:e0a8:ba9e:c1ba]) by BL0PR08MB4676.namprd08.prod.outlook.com
 ([fe80::6df3:e0a8:ba9e:c1ba%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 14:56:11 +0000
From: "Pagan, Angel" <Angel.Pagan@stratus.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: USB Gen2 passthrough not working
Thread-Topic: USB Gen2 passthrough not working
Thread-Index: AQHW6oU147qKlTriWkqkboxJoMgbWw==
Date: Thu, 14 Jan 2021 14:56:11 +0000
Message-ID: <BL0PR08MB4676559855A6894E3B987514E5A80@BL0PR08MB4676.namprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.88.105.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eaeb957-45b7-44cc-31ed-08d8b89c8893
x-ms-traffictypediagnostic: MN2PR08MB6256:
x-microsoft-antispam-prvs: <MN2PR08MB6256368101CD69A3FF656510E5A80@MN2PR08MB6256.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: AK1TgAHLR4HEgNVFTy6/NBr3RS5vcuA1dhkmiO6bTPGKRVQo338tIc3W+7ENj0r0ZFr5vY4ULEVtKAdQ8OdMx4tAKP4flk8Eee9ZMpDxNJhHrkTHkerH0p03dzLvYG5oC83+OmkxSh6dzB/KdaaFBdARFkgBjchV/oRElocDvV9CTfHsSm7y8sQGNQIbgoy9mbjbocTLONZ14V3M+juCbFuNW/5aFxwiKJ3DlZpdwIyKteM0JAFDm+KWSX5Yvzfl5TObujHtZ1nCF+352Ryhq+wkuqVxaGyehpacYq8zZxnETLfsEammwm+dY7qE6lCU0jVo+19cF6DgQ+Ct9iZxB0jTj6f4nqmep5mqd/5VbkA/pDIrscOGdixVQqs6F7efb+XQRXEoL2h/gJW41IQLag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR08MB4676.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(39850400004)(366004)(71200400001)(30864003)(2906002)(66476007)(64756008)(66556008)(66946007)(26005)(19627405001)(66446008)(186003)(6916009)(8936002)(4326008)(76116006)(478600001)(9686003)(8676002)(83380400001)(7696005)(5660300002)(52536014)(86362001)(55016002)(316002)(33656002)(6506007)(559001)(579004);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+onAWFwQK4Swmf9bQB04+I6nEaNrjIbwk1B1TcA1G+SNGYIpH2thVVGOP2?=
 =?iso-8859-1?Q?DI/6ZCw49P6P/K4KTMT8XqRcj/xzPJ8379j/U3kFhFIN8Mn6uCJnNeW/X2?=
 =?iso-8859-1?Q?OY1Fd1jOglTqYRLztgMXmNr4/ImNqkS2yMix5VgdPMUNG7fNDG+e0v97qU?=
 =?iso-8859-1?Q?0zL1vLrGNodcspW+DLyDqZjsbvrlml+NQsazBd1mnDl79kTv4pmonBtbvy?=
 =?iso-8859-1?Q?rv5LEbSraEDxKUf4KZ1c5EdRvcfPE7vzFy6Ytwje+pYJEE7v+zhBOP9tLC?=
 =?iso-8859-1?Q?vQJ2oYam6W//FfL96d+7iJKdRLYW7XvdvVErI1oMjuv3clgkloh2qfMFze?=
 =?iso-8859-1?Q?/W1fqngrUyY9uMAOuv15sSBWfEyrGr1DaDWMdaOEkyF1ZxrgFSpZl2xdkq?=
 =?iso-8859-1?Q?05Qg57h80RkOkxAOUqiHdNAx9UoUIt3afh7PoHBCoIiTpWQeO30pz/q5m/?=
 =?iso-8859-1?Q?pGy1XLglztizrJFQhRoJqSkME6gK0UfQ2s5qnsvwaghzi1bGnAKL6ymHqm?=
 =?iso-8859-1?Q?kPZChSqY6fIY+Yo3fR3HCgogENNPoGJxdwMoEqAFRNmpmOtY0/XXUUdiNh?=
 =?iso-8859-1?Q?Z8YdezY7E4qDtPVU6SMQ5oa+ka+Lj4IYnfnKwmqF77rnD4d5fT+AA2SsX3?=
 =?iso-8859-1?Q?JbmyRo04jr638B66OpFfIHXAN8thXpa+3TyFzbqnc+Y2ctE+JQp5O9/+Oe?=
 =?iso-8859-1?Q?UiEwLWSwISOcH2WRfal7i8TdHKJaHD6vaEPtQxADZMjLGmNVAg1ls8oYIk?=
 =?iso-8859-1?Q?gp0Ui8qqNF4MpfbRgVez6t2pxQ/avdlp19Sv8OJ9nk+8cb98c75u90QS9B?=
 =?iso-8859-1?Q?a6lJC8hdFH0G3eSUGOJDEXEnDsvL98HcYIwXzSzt14Yzuc5LL9aO4nJCCz?=
 =?iso-8859-1?Q?m/jM/lbGzkTKxWrhOcCo5XoybCIwtDsNX09VTT/3mDKatPwEjZVNJLy21O?=
 =?iso-8859-1?Q?nHig0Yg5Eo6D8FFlFITrT/g/iPIqW2dvNMRSh4bqQwBZhyZYykc5YlHiQ7?=
 =?iso-8859-1?Q?YSHshB6zPzgTAbw4s=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stratus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR08MB4676.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaeb957-45b7-44cc-31ed-08d8b89c8893
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 14:56:11.7242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de36b473-b8ad-46ff-837f-9da16b8d1b77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5n3SjY1zzCxVMirsjk6ImB3sAL7hEiYNGesgD+58Po7HgmyqutipMyFz4oulIo6yQgoC/RQv05ahovybOeO1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6256
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA31A22 smtp.mailfrom=angel.pagan@stratus.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: stratus.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BL0PR08MB4676559855A6894E3B987514E5A80BL0PR08MB4676namp_"
Received-SPF: pass client-ip=216.205.24.131;
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
Cc: Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BL0PR08MB4676559855A6894E3B987514E5A80BL0PR08MB4676namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Anyone know why a USB Gen2 (SuperSpeedPlus) device does not work when attac=
hed to the guest. I know the guest max USB speed is Gen1 (SuperSpeed), but =
I thought during guest attach qemu would downgrade the speed so that it wil=
l work at Gen1 speed. See trace and details below.

USB device on usb Gen2 host port
--------------------------------

 usb 2-3: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
 usb 2-3: New USB device found, idVendor=3D154b, idProduct=3Df00c, bcdDevic=
e=3D 1.00
 usb 2-3: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D1
 usb 2-3: Product: PNY PRO ELITE PSSD
 usb 2-3: Manufacturer: PNY
 usb 2-3: SerialNumber: 511200715265B3130024
 usbcore: registered new interface driver usb-storage
 scsi host2: uas
 usbcore: registered new interface driver uas
 scsi 2:0:0:0: Direct-Access     PNY      PNY PRO ELITE PS 0    PQ: 0 ANSI:=
 6
 sd 2:0:0:0: Attached scsi generic sg1 type 0
 sd 2:0:0:0: [sdb] 976748545 512-byte logical blocks: (500 GB/466 GiB)
 sd 2:0:0:0: [sdb] Write Protect is off
 sd 2:0:0:0: [sdb] Mode Sense: 43 00 00 00
 sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't suppo=
rt DPO or FUA
 sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes


:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 10000M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
        |__ Port 4: Dev 3, If 5, Class=3DCommunications, Driver=3Dcdc_ncm, =
5000M
        |__ Port 4: Dev 3, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
        |__ Port 4: Dev 3, If 1, Class=3DApplication Specific Interface, Dr=
iver=3Dusbfs, 5000M
        |__ Port 4: Dev 3, If 6, Class=3DCDC Data, Driver=3Dcdc_ncm, 5000M
        |__ Port 4: Dev 3, If 4, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
        |__ Port 4: Dev 3, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
        |__ Port 4: Dev 3, If 0, Class=3DVendor Specific Class, Driver=3Dus=
bfs, 5000M
    |__ Port 3: Dev 4, If 0, Class=3DMass Storage, Driver=3D, 10000M  <<< a=
ttached to guest but not seen in guest os - centos7.8



guest
-----
localhost login: [   72.763264] usb 1-4: new low-speed USB device number 3 =
using xhci_hcd
[   72.877449] usb 1-4: device descriptor read/64, error 18
[   73.092928] usb 1-4: device descriptor read/64, error 18
[   73.310240] usb 1-4: new low-speed USB device number 4 using xhci_hcd
[   73.428389] usb 1-4: device descriptor read/64, error 18
[   73.649497] usb 1-4: device descriptor read/64, error 18
[   73.752079] usb usb1-port4: attempt power cycle
[   74.171241] usb 1-4: new low-speed USB device number 5 using xhci_hcd
[   74.184867] usb 1-4: Invalid ep0 maxpacket: 9
[   74.444275] usb 1-4: new low-speed USB device number 6 using xhci_hcd
[   74.462281] usb 1-4: Invalid ep0 maxpacket: 9
[   74.465899] usb usb1-port4: unable to enumerate USB device

[centos@localhost ~]$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 480M

Host
----

~/workspace/qemuorg$ virsh qemu-monitor-command centos7.0 --hmp info usbhos=
t
  Bus 2, Addr 4, Port 3, Speed (null) Mb/s
    Class 00: USB device 154b:f00c, PNY PRO ELITE PSSD
  Bus 2, Addr 3, Port 1.4, Speed 5000 Mb/s
    Class ef: USB device 17e9:4307
  Bus 1, Addr 3, Port 6, Speed 480 Mb/s
    Class 00: USB device 058f:6366
  Bus 1, Addr 2, Port 3, Speed 480 Mb/s
    Class ef: USB device 0408:5300
  Bus 1, Addr 10, Port 2, Speed 480 Mb/s
    Class 00: USB device 05dc:c75c
  Bus 1, Addr 4, Port 10, Speed 12 Mb/s
    Class e0: USB device 0bda:b00a
  Bus 1, Addr 9, Port 1.3.1.2, Speed 12 Mb/s
    Class 00: USB device 04d9:1830
  Bus 1, Addr 8, Port 1.3.1.1, Speed 12 Mb/s
    Class 00: USB device 046d:c077

            class USB controller, addr 02:00.0, pci id 1b36:000d (sub 1af4:=
1100)
            bar 0: mem at 0xfca00000 [0xfca03fff]
            bus: usb.0
              type usb-bus
              dev: usb-host, id "hostdev0"
                hostbus =3D 2 (0x2)
                hostaddr =3D 4 (0x4)
                hostport =3D ""
                vendorid =3D 0 (0x0)
                productid =3D 0 (0x0)
                hostdevice =3D ""
                isobufs =3D 4 (0x4)
                isobsize =3D 32 (0x20)
                guest-reset =3D true
                guest-resets-all =3D false
                loglevel =3D 2 (0x2)
                pipeline =3D true
                suppress-remote-wake =3D false
                port =3D "4"
                serial =3D ""
                full-path =3D true
                msos-desc =3D true
                addr 0.2, port 4, speed 1.5, name PNY PRO ELITE PSSD, attac=
hed




2021-01-14 03:06:08.835+0000: starting up libvirt version: 6.0.0, package: =
0ubuntu8.5 (Christian Ehrhardt <christian.ehrhardt@canonical.com> Thu, 08 O=
ct 2020 07:36:06 +0200), qemu version: 5.2.50v5.2.0-991-g4524
0eed4f, kernel: 5.8.0-36-generic, hostname: pavilion
LC_ALL=3DC \
PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/b=
in \
HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0 \
XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.local/share \
XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.cache \
XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.config \
QEMU_AUDIO_DRV=3Dspice \
/usr/local/bin/qemu-system-x86_64 \
-name guest=3Dcentos7.0,debug-threads=3Don \
-S \
-object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/do=
main-3-centos7.0/master-key.aes \
-machine pc-q35-4.2,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-core=3Dof=
f \
-cpu SandyBridge \
-m 4098 \
-overcommit mem-lock=3Doff \
-smp 2,sockets=3D2,cores=3D1,threads=3D1 \
-uuid 12fbe73b-64f1-45dc-a10c-8a18801491b1 \
-no-user-config \
-nodefaults \
-chardev socket,id=3Dcharmonitor,fd=3D31,server,nowait \
-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
-rtc base=3Dutc,driftfix=3Dslew \
-global kvm-pit.lost_tick_policy=3Ddelay \
-no-hpet \
-no-shutdown \
-global ICH9-LPC.disable_s3=3D1 \
-global ICH9-LPC.disable_s4=3D1 \
-boot strict=3Don \
-device pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mult=
ifunction=3Don,addr=3D0x2 \
-device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=
=3D0x2.0x1 \
-device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=
=3D0x2.0x2 \
-device pcie-root-port,port=3D0x13,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=
=3D0x2.0x3 \
-device pcie-root-port,port=3D0x14,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=
=3D0x2.0x4 \
-device pcie-root-port,port=3D0x15,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,addr=
=3D0x2.0x5 \
-device pcie-root-port,port=3D0x16,chassis=3D7,id=3Dpci.7,bus=3Dpcie.0,addr=
=3D0x2.0x6 \
-device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 \
-device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 \
-blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/CentOS-7-x8=
6_64-GenericCloud-2009.qcow2","node-name":"libvirt-1-storage","auto-read-on=
ly":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow=
2","file":"libvirt-1-storage","backing":null}' \
-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.4,addr=3D0x0,drive=3Dlibvirt-1-=
format,id=3Dvirtio-disk0,bootindex=3D1 \
-netdev tap,fd=3D33,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 \
-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:c5:52:e1,=
bus=3Dpci.1,addr=3D0x0 \
-chardev pty,id=3Dcharserial0 \
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
-chardev socket,id=3Dcharchannel0,fd=3D35,server,nowait \
-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0=
,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
-chardev spicevmc,id=3Dcharchannel1,name=3Dvdagent \
-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D2,chardev=3Dcharchannel1=
,id=3Dchannel1,name=3Dcom.redhat.spice.0 \
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \
-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing,image-compression=3Do=
ff,seamless-migration=3Don \
-device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram64=
_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bus=3Dpcie.0,addr=3D0x1 \
-device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,addr=3D0x1b \
-device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 \
-chardev spicevmc,id=3Dcharredir0,name=3Dusbredir \
-device usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 \
-chardev spicevmc,id=3Dcharredir1,name=3Dusbredir \
-device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D3 \
-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.5,addr=3D0x0 \
-object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \
-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.6,addr=3D0x0 \
-sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcec=
ontrol=3Ddeny \
-msg timestamp=3Don
2021-01-14 03:06:52.939+0000: Domain id=3D3 is tainted: custom-monitor

41228@1610593643.553534:usb_port_claim bus 0, port 4
41228@1610593643.558646:usb_host_open_started dev 2:4
41228@1610593643.558680:usb_host_detach_kernel dev 2:4, if 0
41228@1610593643.905496:usb_host_parse_config dev 2:4, value 1, active 1
41228@1610593643.905521:usb_host_parse_interface dev 2:4, num 0, alt 0, act=
ive 1
41228@1610593643.905528:usb_host_parse_endpoint dev 2:4, ep 1, in, bulk, ac=
tive 1
41228@1610593643.905534:usb_host_parse_endpoint dev 2:4, ep 2, out, bulk, a=
ctive 1
41228@1610593643.905789:usb_port_attach bus 0, port 4, devspeed unknown, po=
rtspeed full+high+super
41228@1610593643.905807:usb_xhci_port_link port 19, pls 7
41228@1610593643.905813:usb_xhci_port_notify port 19, bits 0x20000
41228@1610593643.905819:usb_xhci_queue_event v 0, idx 37, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41228@1610593643.905861:usb_host_open_success dev 2:4
41235@1610593643.906377:usb_xhci_oper_read off 0x0004, ret 0x00000008
41235@1610593643.906427:usb_xhci_oper_write off 0x0004, val 0x00000008
41235@1610593643.906472:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.906504:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.906540:usb_xhci_port_read port 16, off 0x0000, ret 0x0c000=
e63
41235@1610593643.906581:usb_xhci_port_read port 17, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906609:usb_xhci_port_read port 18, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906635:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.906666:usb_xhci_port_read port 20, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906685:usb_xhci_port_read port 21, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906700:usb_xhci_port_read port 22, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906719:usb_xhci_port_read port 23, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906744:usb_xhci_port_read port 24, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906769:usb_xhci_port_read port 25, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906795:usb_xhci_port_read port 26, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906821:usb_xhci_port_read port 27, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906846:usb_xhci_port_read port 28, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906874:usb_xhci_port_read port 29, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906897:usb_xhci_port_read port 30, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.906935:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e258
41235@1610593643.906960:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41235@1610593643.906993:usb_xhci_runtime_write off 0x0038, val 0x6cf9e268
41235@1610593643.907023:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593643.907096:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593643.907240:usb_xhci_oper_read off 0x0000, ret 0x00000005
41235@1610593643.907275:usb_xhci_oper_write off 0x0000, val 0x00000001
41235@1610593643.907334:usb_xhci_port_read port 30, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907372:usb_xhci_port_write port 30, off 0x0000, val 0x0000=
02a0
41235@1610593643.907400:usb_xhci_port_read port 29, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907439:usb_xhci_port_write port 29, off 0x0000, val 0x0000=
02a0
41235@1610593643.907476:usb_xhci_port_read port 28, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907517:usb_xhci_port_write port 28, off 0x0000, val 0x0000=
02a0
41235@1610593643.907555:usb_xhci_port_read port 27, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907596:usb_xhci_port_write port 27, off 0x0000, val 0x0000=
02a0
41235@1610593643.907633:usb_xhci_port_read port 26, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907674:usb_xhci_port_write port 26, off 0x0000, val 0x0000=
02a0
41235@1610593643.907710:usb_xhci_port_read port 25, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907753:usb_xhci_port_write port 25, off 0x0000, val 0x0000=
02a0
41235@1610593643.907790:usb_xhci_port_read port 24, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907831:usb_xhci_port_write port 24, off 0x0000, val 0x0000=
02a0
41235@1610593643.907868:usb_xhci_port_read port 23, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907911:usb_xhci_port_write port 23, off 0x0000, val 0x0000=
02a0
41235@1610593643.907947:usb_xhci_port_read port 22, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.907988:usb_xhci_port_write port 22, off 0x0000, val 0x0000=
02a0
41235@1610593643.908033:usb_xhci_port_read port 21, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.908072:usb_xhci_port_write port 21, off 0x0000, val 0x0000=
02a0
41235@1610593643.908105:usb_xhci_port_read port 20, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.908131:usb_xhci_port_write port 20, off 0x0000, val 0x0000=
02a0
41235@1610593643.908159:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.908184:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0ae1
41235@1610593643.908212:usb_xhci_port_read port 18, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.908230:usb_xhci_port_write port 18, off 0x0000, val 0x0000=
02a0
41235@1610593643.908249:usb_xhci_port_read port 17, off 0x0000, ret 0x0a000=
2a0
41235@1610593643.908275:usb_xhci_port_write port 17, off 0x0000, val 0x0000=
02a0
41235@1610593643.908304:usb_xhci_port_read port 16, off 0x0000, ret 0x0c000=
e63
41235@1610593643.908328:usb_xhci_port_write port 16, off 0x0000, val 0x0000=
0e61
41235@1610593643.908359:usb_xhci_oper_read off 0x0000, ret 0x00000001
41235@1610593643.908376:usb_xhci_oper_read off 0x0000, ret 0x00000001
41235@1610593643.908393:usb_xhci_oper_write off 0x0000, val 0x00000005
41235@1610593643.908421:usb_xhci_oper_read off 0x0000, ret 0x00000005
41236@1610593643.908470:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593643.908526:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593643.908573:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593643.908620:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41235@1610593643.908674:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41235@1610593643.908730:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.908788:usb_xhci_port_read port 19, off 0x0000, ret 0x00020=
ae1
41235@1610593643.908826:usb_xhci_port_write port 19, off 0x0000, val 0x0002=
0ae1
41235@1610593643.908856:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
ae1
41235@1610593643.908905:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41235@1610593643.908950:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909004:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909084:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909155:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909214:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909281:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909337:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909403:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909458:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41235@1610593643.909525:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593644.010105:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
ae1
41235@1610593644.010147:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.010154:usb_xhci_fetch_trb addr 0x000000016cf9c0b0, CR_ENAB=
LE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401
41235@1610593644.010156:usb_xhci_slot_enable slotid 2
41235@1610593644.010158:usb_xhci_queue_event v 0, idx 38, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c0b0, s 0x01000000, c 0x02008401
41235@1610593644.010173:usb_xhci_fetch_trb addr 0x000000016cf9c0c0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.010184:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.010206:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.010223:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.010262:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e268
41236@1610593644.010270:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.010278:usb_xhci_runtime_write off 0x0038, val 0x6cf9e278
41236@1610593644.010285:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.010299:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.010470:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
ae1
41235@1610593644.010482:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0af1
41235@1610593644.010484:usb_xhci_port_reset port 19, warm 0
41235@1610593644.010486:usb_xhci_port_link port 19, pls 0
41235@1610593644.010488:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.010489:usb_xhci_queue_event v 0, idx 39, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.010499:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.010505:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.010515:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.010528:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.010539:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.010545:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.010551:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.010558:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010565:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010572:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.010580:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010591:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010599:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010605:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010612:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010622:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010630:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010639:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010647:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010653:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010661:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.010671:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e278
41236@1610593644.010680:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.010689:usb_xhci_runtime_write off 0x0038, val 0x6cf9e288
41236@1610593644.010697:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.010715:usb_xhci_oper_read off 0x0004, ret 0x00000000
41236@1610593644.053093:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.053115:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053121:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053125:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.053130:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053134:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053139:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053143:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053149:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053153:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053158:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053162:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053167:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053171:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.053176:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593644.071155:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.071213:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.071228:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.071237:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.123307:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.123320:usb_xhci_fetch_trb addr 0x000000016cf9c0c0, CR_ADDR=
ESS_DEVICE, p 0x000000007b120000, s 0x00000000, c 0x02002e01
41235@1610593644.123326:usb_xhci_slot_address slotid 2, port 4
41235@1610593644.123329:usb_xhci_ep_enable slotid 2, epid 1
41235@1610593644.123334:usb_xhci_queue_event v 0, idx 40, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c0c0, s 0x01000000, c 0x02008401
41235@1610593644.123346:usb_xhci_fetch_trb addr 0x000000016cf9c0d0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.123355:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.123385:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.123404:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.123431:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e288
41236@1610593644.123441:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.123450:usb_xhci_runtime_write off 0x0038, val 0x6cf9e298
41236@1610593644.123457:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.123476:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.123516:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000
41235@1610593644.123529:usb_xhci_oper_read off 0x0034, ret 0x00000001
41235@1610593644.123549:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.123557:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.123573:usb_xhci_fetch_trb addr 0x0000000033949000, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.123576:usb_xhci_fetch_trb addr 0x0000000033949010, TR_DATA=
, p 0x0000000033804000, s 0x00000040, c 0x00010c05
41235@1610593644.123578:usb_xhci_fetch_trb addr 0x0000000033949020, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.123581:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.123585:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.123590:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.123609:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.123614:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593644.123719:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.123726:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.123730:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.123733:usb_xhci_queue_event v 0, idx 41, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x0000000033949010, s 0x0d00002e, c 0x02018001
41228@1610593644.123740:usb_xhci_queue_event v 0, idx 42, ER_TRANSFER, CC_S=
UCCESS, p 0x0000000033949020, s 0x01000000, c 0x02018001
41228@1610593644.123742:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.123768:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.123784:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.123810:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e298
41236@1610593644.123823:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.123833:usb_xhci_runtime_write off 0x0038, val 0x6cf9e2b8
41236@1610593644.123845:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.123860:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.123868:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.123872:usb_xhci_fetch_trb addr 0x0000000033949030, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.123875:usb_xhci_fetch_trb addr 0x0000000033949040, TR_DATA=
, p 0x0000000033804000, s 0x00000040, c 0x00010c05
41235@1610593644.123877:usb_xhci_fetch_trb addr 0x0000000033949050, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.123879:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.123881:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.123883:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.123895:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.123900:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.123912:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.123983:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.123988:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.123990:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.123992:usb_xhci_queue_event v 0, idx 43, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x0000000033949040, s 0x0d00002e, c 0x02018001
41228@1610593644.124002:usb_xhci_queue_event v 0, idx 44, ER_TRANSFER, CC_S=
UCCESS, p 0x0000000033949050, s 0x01000000, c 0x02018001
41228@1610593644.124007:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.124024:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.124038:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.124056:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2b8
41236@1610593644.124066:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.124074:usb_xhci_runtime_write off 0x0038, val 0x6cf9e2d8
41236@1610593644.124083:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.124096:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.124399:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.124405:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.124409:usb_xhci_fetch_trb addr 0x0000000033949060, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.124411:usb_xhci_fetch_trb addr 0x0000000033949070, TR_DATA=
, p 0x0000000033804000, s 0x00000040, c 0x00010c05
41235@1610593644.124412:usb_xhci_fetch_trb addr 0x0000000033949080, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.124414:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.124416:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.124418:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.124425:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.124427:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593644.124512:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.124517:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.124520:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.124522:usb_xhci_queue_event v 0, idx 45, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x0000000033949070, s 0x0d00002e, c 0x02018001
41228@1610593644.124527:usb_xhci_queue_event v 0, idx 46, ER_TRANSFER, CC_S=
UCCESS, p 0x0000000033949080, s 0x01000000, c 0x02018001
41228@1610593644.124529:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.124540:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.124557:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.124583:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2d8
41236@1610593644.124596:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.124606:usb_xhci_runtime_write off 0x0038, val 0x6cf9e2f8
41236@1610593644.124618:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.124632:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.124654:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593644.124661:usb_xhci_port_reset port 19, warm 0
41235@1610593644.124663:usb_xhci_port_link port 19, pls 0
41235@1610593644.124665:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.124667:usb_xhci_queue_event v 0, idx 47, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.124683:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.124696:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.124709:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.124723:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.124735:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.124746:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.124764:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.124777:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124786:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124794:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.124801:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124809:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124818:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124826:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124834:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124841:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124849:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124859:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124866:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124874:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124881:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.124890:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2f8
41236@1610593644.124899:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.124907:usb_xhci_runtime_write off 0x0038, val 0x6cf9e308
41236@1610593644.124914:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.124969:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.185172:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.185238:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.185249:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.185255:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.236079:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.236096:usb_xhci_fetch_trb addr 0x000000016cf9c0d0, CR_RESE=
T_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401
41235@1610593644.236099:usb_xhci_slot_reset slotid 2
41235@1610593644.236102:usb_xhci_queue_event v 0, idx 48, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c0d0, s 0x01000000, c 0x02008401
41235@1610593644.236115:usb_xhci_fetch_trb addr 0x000000016cf9c0e0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.236128:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.236176:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.236195:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.236218:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e308
41236@1610593644.236230:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.236238:usb_xhci_runtime_write off 0x0038, val 0x6cf9e318
41236@1610593644.236247:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.236285:usb_xhci_oper_read off 0x0004, ret 0x00000000
41236@1610593644.303087:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.303109:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303115:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303120:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593644.303125:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303130:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303135:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303139:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303145:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303150:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303155:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303159:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303164:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303169:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.303175:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593644.338144:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.338162:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.338170:usb_xhci_fetch_trb addr 0x0000000033949090, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.338172:usb_xhci_fetch_trb addr 0x00000000339490a0, TR_DATA=
, p 0x0000000033804300, s 0x00000040, c 0x00010c05
41235@1610593644.338174:usb_xhci_fetch_trb addr 0x00000000339490b0, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.338175:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.338178:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.338182:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.338196:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.338198:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593644.338312:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.338334:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.338340:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.338343:usb_xhci_queue_event v 0, idx 49, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x00000000339490a0, s 0x0d00002e, c 0x02018001
41228@1610593644.338365:usb_xhci_queue_event v 0, idx 50, ER_TRANSFER, CC_S=
UCCESS, p 0x00000000339490b0, s 0x01000000, c 0x02018001
41228@1610593644.338369:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.338404:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.338420:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.338441:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e318
41236@1610593644.338447:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.338453:usb_xhci_runtime_write off 0x0038, val 0x6cf9e338
41236@1610593644.338459:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.338474:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.338501:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.338509:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.338514:usb_xhci_fetch_trb addr 0x00000000339490c0, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.338516:usb_xhci_fetch_trb addr 0x00000000339490d0, TR_DATA=
, p 0x0000000033804300, s 0x00000040, c 0x00010c05
41235@1610593644.338518:usb_xhci_fetch_trb addr 0x00000000339490e0, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.338519:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.338521:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.338523:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.338533:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.338536:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593644.338623:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.338629:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.338632:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.338634:usb_xhci_queue_event v 0, idx 51, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x00000000339490d0, s 0x0d00002e, c 0x02018001
41228@1610593644.338643:usb_xhci_queue_event v 0, idx 52, ER_TRANSFER, CC_S=
UCCESS, p 0x00000000339490e0, s 0x01000000, c 0x02018001
41228@1610593644.338648:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.338700:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.338718:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.338740:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e338
41236@1610593644.338753:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.338765:usb_xhci_runtime_write off 0x0038, val 0x6cf9e358
41236@1610593644.338778:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.338807:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.338815:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.338819:usb_xhci_fetch_trb addr 0x00000000339490f0, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.338822:usb_xhci_fetch_trb addr 0x0000000033949100, TR_DATA=
, p 0x0000000033804300, s 0x00000040, c 0x00010c05
41235@1610593644.338823:usb_xhci_fetch_trb addr 0x0000000033949110, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.338825:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.338827:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.338829:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.338837:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.338840:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.338851:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.338921:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.338926:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.338928:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.338930:usb_xhci_queue_event v 0, idx 53, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x0000000033949100, s 0x0d00002e, c 0x02018001
41228@1610593644.338937:usb_xhci_queue_event v 0, idx 54, ER_TRANSFER, CC_S=
UCCESS, p 0x0000000033949110, s 0x01000000, c 0x02018001
41228@1610593644.338941:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.338953:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.338967:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.338989:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e358
41236@1610593644.339001:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.339010:usb_xhci_runtime_write off 0x0038, val 0x6cf9e378
41236@1610593644.339017:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.339032:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.339048:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593644.339051:usb_xhci_port_reset port 19, warm 0
41235@1610593644.339053:usb_xhci_port_link port 19, pls 0
41235@1610593644.339054:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.339055:usb_xhci_queue_event v 0, idx 55, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.339065:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.339072:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.339080:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.339091:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.339104:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.339115:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.339125:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.339136:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339144:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339155:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.339163:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339173:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339183:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339193:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339202:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339212:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339222:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339232:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339241:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339249:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339259:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.339269:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e378
41236@1610593644.339278:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.339288:usb_xhci_runtime_write off 0x0038, val 0x6cf9e388
41236@1610593644.339297:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.339309:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.400228:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.400335:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.400368:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.400387:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.451275:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.451327:usb_xhci_fetch_trb addr 0x000000016cf9c0e0, CR_RESE=
T_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401
41235@1610593644.451338:usb_xhci_slot_reset slotid 2
41235@1610593644.451347:usb_xhci_queue_event v 0, idx 56, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c0e0, s 0x01000000, c 0x02008401
41235@1610593644.451378:usb_xhci_fetch_trb addr 0x000000016cf9c0f0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.451421:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.451488:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.451552:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.451659:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e388
41236@1610593644.451698:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.451734:usb_xhci_runtime_write off 0x0038, val 0x6cf9e398
41236@1610593644.451765:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.451822:usb_xhci_oper_read off 0x0004, ret 0x00000000
41236@1610593644.553254:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.553359:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553409:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553460:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593644.553508:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553575:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553626:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553693:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553754:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553821:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553874:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553939:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.553999:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.554060:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.554119:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593644.555224:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.555307:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a03
41235@1610593644.555344:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.555512:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.555576:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.555599:usb_xhci_fetch_trb addr 0x000000016cf9c0f0, CR_DISA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801
41235@1610593644.555613:usb_xhci_slot_disable slotid 2
41235@1610593644.555621:usb_xhci_ep_disable slotid 2, epid 1
41235@1610593644.555634:usb_xhci_ep_state slotid 2, epid 1, running -> disa=
bled
41235@1610593644.555652:usb_xhci_queue_event v 0, idx 57, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c0f0, s 0x01000000, c 0x02008401
41235@1610593644.555690:usb_xhci_fetch_trb addr 0x000000016cf9c100, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.555728:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.555812:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.555892:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.555989:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e398
41236@1610593644.556049:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.556089:usb_xhci_runtime_write off 0x0038, val 0x6cf9e3a8
41236@1610593644.556129:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.556189:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.556218:usb_xhci_fetch_trb addr 0x000000016cf9c100, CR_ENAB=
LE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401
41235@1610593644.556228:usb_xhci_slot_enable slotid 2
41235@1610593644.556234:usb_xhci_queue_event v 0, idx 58, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c100, s 0x01000000, c 0x02008401
41235@1610593644.556255:usb_xhci_fetch_trb addr 0x000000016cf9c110, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.556297:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.556365:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.556436:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.556542:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3a8
41236@1610593644.556587:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.556629:usb_xhci_runtime_write off 0x0038, val 0x6cf9e3b8
41236@1610593644.556664:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.556728:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.556831:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.556901:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593644.556921:usb_xhci_port_reset port 19, warm 0
41235@1610593644.556932:usb_xhci_port_link port 19, pls 0
41235@1610593644.556940:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.556946:usb_xhci_queue_event v 0, idx 59, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.557021:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.557079:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.557165:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.557240:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.557311:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.557361:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.557406:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.557452:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557493:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557534:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.557574:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557610:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557653:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557690:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557728:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557770:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557810:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557849:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557889:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557930:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.557970:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.558019:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3b8
41236@1610593644.558062:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.558110:usb_xhci_runtime_write off 0x0038, val 0x6cf9e3c8
41236@1610593644.558150:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.558235:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.618110:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.618168:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.618185:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.618194:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.670134:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.670151:usb_xhci_fetch_trb addr 0x000000016cf9c110, CR_ADDR=
ESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002e01
41235@1610593644.670158:usb_xhci_slot_address slotid 2, port 4
41235@1610593644.670162:usb_xhci_ep_enable slotid 2, epid 1
41235@1610593644.670168:usb_xhci_queue_event v 0, idx 60, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c110, s 0x01000000, c 0x02008401
41235@1610593644.670180:usb_xhci_fetch_trb addr 0x000000016cf9c120, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.670193:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.670217:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.670241:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.670268:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3c8
41236@1610593644.670281:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.670314:usb_xhci_runtime_write off 0x0038, val 0x6cf9e3d8
41235@1610593644.670340:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000
41236@1610593644.670348:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.670358:usb_xhci_oper_read off 0x0034, ret 0x00000001
41235@1610593644.670376:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.670381:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.670386:usb_xhci_fetch_trb addr 0x000000007b19d000, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.670389:usb_xhci_fetch_trb addr 0x000000007b19d010, TR_DATA=
, p 0x0000000033804640, s 0x00000040, c 0x00010c05
41235@1610593644.670391:usb_xhci_fetch_trb addr 0x000000007b19d020, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.670393:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.670396:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.670400:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.670414:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.670417:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.670431:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.670492:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.670501:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.670505:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.670507:usb_xhci_queue_event v 0, idx 61, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d010, s 0x0d00002e, c 0x02018001
41228@1610593644.670516:usb_xhci_queue_event v 0, idx 62, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001
41228@1610593644.670519:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.670543:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.670568:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.670602:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3d8
41236@1610593644.670618:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.670628:usb_xhci_runtime_write off 0x0038, val 0x6cf9e3f8
41236@1610593644.670638:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.670658:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.670666:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.670674:usb_xhci_fetch_trb addr 0x000000007b19d030, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.670677:usb_xhci_fetch_trb addr 0x000000007b19d040, TR_DATA=
, p 0x0000000033804640, s 0x00000040, c 0x00010c05
41235@1610593644.670679:usb_xhci_fetch_trb addr 0x000000007b19d050, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.670682:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.670686:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.670689:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.670700:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.670703:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.670716:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.670809:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.670816:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.670819:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.670821:usb_xhci_queue_event v 0, idx 63, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d040, s 0x0d00002e, c 0x02018001
41228@1610593644.670828:usb_xhci_queue_event v 0, idx 64, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d050, s 0x01000000, c 0x02018001
41228@1610593644.670832:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.670852:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.670864:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.670884:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3f8
41236@1610593644.670896:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.670907:usb_xhci_runtime_write off 0x0038, val 0x6cf9e418
41236@1610593644.670918:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.670933:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.670940:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.670945:usb_xhci_fetch_trb addr 0x000000007b19d060, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.670947:usb_xhci_fetch_trb addr 0x000000007b19d070, TR_DATA=
, p 0x0000000033804640, s 0x00000040, c 0x00010c05
41235@1610593644.670949:usb_xhci_fetch_trb addr 0x000000007b19d080, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.670951:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.670953:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.670955:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.670964:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.670969:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.670982:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.671065:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.671074:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.671079:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.671081:usb_xhci_queue_event v 0, idx 65, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d070, s 0x0d00002e, c 0x02018001
41228@1610593644.671090:usb_xhci_queue_event v 0, idx 66, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d080, s 0x01000000, c 0x02018001
41228@1610593644.671093:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.671114:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.671131:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.671154:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e418
41236@1610593644.671170:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.671182:usb_xhci_runtime_write off 0x0038, val 0x6cf9e438
41236@1610593644.671193:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.671213:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.671241:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.671262:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593644.671267:usb_xhci_port_reset port 19, warm 0
41235@1610593644.671270:usb_xhci_port_link port 19, pls 0
41235@1610593644.671272:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.671274:usb_xhci_queue_event v 0, idx 67, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.671291:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.671302:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.671318:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.671337:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.671356:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.671370:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.671384:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.671396:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671408:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671421:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.671433:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671444:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671457:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671468:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671480:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671492:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671504:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671516:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671528:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671540:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671552:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.671565:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e438
41236@1610593644.671577:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.671588:usb_xhci_runtime_write off 0x0038, val 0x6cf9e448
41236@1610593644.671600:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.671623:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.732280:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.732415:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.732456:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.732482:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.783285:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593644.783351:usb_xhci_fetch_trb addr 0x000000016cf9c120, CR_RESE=
T_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401
41235@1610593644.783363:usb_xhci_slot_reset slotid 2
41235@1610593644.783374:usb_xhci_queue_event v 0, idx 68, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c120, s 0x01000000, c 0x02008401
41235@1610593644.783417:usb_xhci_fetch_trb addr 0x000000016cf9c130, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593644.783472:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593644.783556:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.783658:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.787197:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e448
41236@1610593644.787261:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.787298:usb_xhci_runtime_write off 0x0038, val 0x6cf9e458
41236@1610593644.787327:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.787385:usb_xhci_oper_read off 0x0004, ret 0x00000000
41236@1610593644.803086:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.803124:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803137:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803146:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593644.803157:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803166:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803177:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803187:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803197:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803207:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803219:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803233:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803249:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803272:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.803289:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593644.892437:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.892500:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.892526:usb_xhci_fetch_trb addr 0x000000007b19d090, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.892537:usb_xhci_fetch_trb addr 0x000000007b19d0a0, TR_DATA=
, p 0x0000000033804980, s 0x00000040, c 0x00010c05
41235@1610593644.892546:usb_xhci_fetch_trb addr 0x000000007b19d0b0, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.892554:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.892567:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.892581:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.892639:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.892649:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593644.892959:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.892999:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.893017:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.893026:usb_xhci_queue_event v 0, idx 69, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d0a0, s 0x0d00002e, c 0x02018001
41228@1610593644.893082:usb_xhci_queue_event v 0, idx 70, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d0b0, s 0x01000000, c 0x02018001
41228@1610593644.893100:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.893299:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.893387:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.893497:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e458
41236@1610593644.893555:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.893599:usb_xhci_runtime_write off 0x0038, val 0x6cf9e478
41236@1610593644.893632:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.893699:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.893722:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.893744:usb_xhci_fetch_trb addr 0x000000007b19d0c0, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.893757:usb_xhci_fetch_trb addr 0x000000007b19d0d0, TR_DATA=
, p 0x0000000033804980, s 0x00000040, c 0x00010c05
41235@1610593644.893768:usb_xhci_fetch_trb addr 0x000000007b19d0e0, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.893779:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.893792:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.893808:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.893858:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.893881:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.893943:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.894046:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.894085:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.894105:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.894116:usb_xhci_queue_event v 0, idx 71, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d0d0, s 0x0d00002e, c 0x02018001
41228@1610593644.894160:usb_xhci_queue_event v 0, idx 72, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d0e0, s 0x01000000, c 0x02018001
41228@1610593644.894170:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.894319:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.894467:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.894569:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e478
41236@1610593644.894637:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.894690:usb_xhci_runtime_write off 0x0038, val 0x6cf9e498
41236@1610593644.894731:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.894797:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593644.894835:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593644.894859:usb_xhci_fetch_trb addr 0x000000007b19d0f0, TR_SETU=
P, p 0x0040000001000680, s 0x00000008, c 0x00030841
41235@1610593644.894873:usb_xhci_fetch_trb addr 0x000000007b19d100, TR_DATA=
, p 0x0000000033804980, s 0x00000040, c 0x00010c05
41235@1610593644.894882:usb_xhci_fetch_trb addr 0x000000007b19d110, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593644.894893:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593644.894906:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593644.894920:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593644.894966:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593644.894979:usb_xhci_xfer_async 0x7efed4abd090
41236@1610593644.895051:usb_xhci_oper_read off 0x0004, ret 0x00000000
41228@1610593644.895180:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 18
41228@1610593644.895218:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593644.895234:usb_xhci_xfer_success 0x7efed4abd090: len 18
41228@1610593644.895242:usb_xhci_queue_event v 0, idx 73, ER_TRANSFER, CC_S=
HORT_PACKET, p 0x000000007b19d100, s 0x0d00002e, c 0x02018001
41228@1610593644.895283:usb_xhci_queue_event v 0, idx 74, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d110, s 0x01000000, c 0x02018001
41228@1610593644.895306:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593644.895430:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.895502:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.895602:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e498
41236@1610593644.895665:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.895723:usb_xhci_runtime_write off 0x0038, val 0x6cf9e4b8
41236@1610593644.895759:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593644.895821:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593644.895897:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593644.895919:usb_xhci_port_reset port 19, warm 0
41235@1610593644.895929:usb_xhci_port_link port 19, pls 0
41235@1610593644.895935:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593644.895942:usb_xhci_queue_event v 0, idx 75, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593644.896000:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.896051:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.896097:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593644.896160:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593644.896226:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.896273:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.896298:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593644.896327:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896349:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896371:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593644.896391:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896413:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896435:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896457:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896477:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896500:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896522:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896545:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896568:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896591:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896613:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593644.896642:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4b8
41236@1610593644.896666:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593644.896694:usb_xhci_runtime_write off 0x0038, val 0x6cf9e4c8
41236@1610593644.896715:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593644.896769:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593644.957191:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.957265:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593644.957287:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593644.957301:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.008156:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.008176:usb_xhci_fetch_trb addr 0x000000016cf9c130, CR_RESE=
T_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401
41235@1610593645.008180:usb_xhci_slot_reset slotid 2
41235@1610593645.008184:usb_xhci_queue_event v 0, idx 76, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c130, s 0x01000000, c 0x02008401
41235@1610593645.008199:usb_xhci_fetch_trb addr 0x000000016cf9c140, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.008220:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.008244:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.008265:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.008297:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4c8
41236@1610593645.008315:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.008333:usb_xhci_runtime_write off 0x0038, val 0x6cf9e4d8
41236@1610593645.008348:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.008375:usb_xhci_oper_read off 0x0004, ret 0x00000000
41236@1610593645.053274:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593645.053361:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053389:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053409:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593645.053436:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053458:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053481:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053502:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053528:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053551:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053576:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053603:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053639:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053669:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593645.053716:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593645.110220:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.110367:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a03
41235@1610593645.110441:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.110607:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.110689:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.110706:usb_xhci_fetch_trb addr 0x000000016cf9c140, CR_DISA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801
41235@1610593645.110720:usb_xhci_slot_disable slotid 2
41235@1610593645.110726:usb_xhci_ep_disable slotid 2, epid 1
41235@1610593645.110739:usb_xhci_ep_state slotid 2, epid 1, running -> disa=
bled
41235@1610593645.110768:usb_xhci_queue_event v 0, idx 77, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c140, s 0x01000000, c 0x02008401
41235@1610593645.110821:usb_xhci_fetch_trb addr 0x000000016cf9c150, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.110874:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.110942:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.111026:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.111090:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4d8
41236@1610593645.111135:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.111323:usb_xhci_runtime_write off 0x0038, val 0x6cf9e4e8
41236@1610593645.111493:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.111625:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.114651:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.114972:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.115185:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0801
41235@1610593645.316298:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
803
41235@1610593645.316399:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
803
41235@1610593645.316451:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a01
41235@1610593645.316490:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.316536:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.417327:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.417381:usb_xhci_fetch_trb addr 0x000000016cf9c150, CR_ENAB=
LE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401
41235@1610593645.417392:usb_xhci_slot_enable slotid 2
41235@1610593645.417397:usb_xhci_queue_event v 0, idx 78, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c150, s 0x01000000, c 0x02008401
41235@1610593645.417433:usb_xhci_fetch_trb addr 0x000000016cf9c160, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.417473:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.417581:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.417651:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.417727:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4e8
41236@1610593645.417757:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.417786:usb_xhci_runtime_write off 0x0038, val 0x6cf9e4f8
41236@1610593645.417808:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.417855:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.418094:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.418165:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593645.418175:usb_xhci_port_reset port 19, warm 0
41235@1610593645.418183:usb_xhci_port_link port 19, pls 0
41235@1610593645.418186:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593645.418191:usb_xhci_queue_event v 0, idx 79, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593645.418252:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.418294:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.418432:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.418512:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.418579:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.418627:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.418685:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593645.418731:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593645.418788:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593645.418831:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.418882:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593645.418925:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593645.418978:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419019:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419070:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419115:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419167:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419212:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419266:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419313:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419365:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593645.419418:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4f8
41236@1610593645.419471:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.419515:usb_xhci_runtime_write off 0x0038, val 0x6cf9e508
41236@1610593645.419566:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.419643:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.479270:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.479408:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.479448:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593645.479481:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.532089:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.532114:usb_xhci_fetch_trb addr 0x000000016cf9c160, CR_ADDR=
ESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002c01
41235@1610593645.532126:usb_xhci_slot_address slotid 2, port 4
41235@1610593645.532136:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7effea5b4de0, state undef -> setup
41235@1610593645.532141:usb_host_req_control dev 2:4, packet 0x7effea5b4de0=
, req 0x5, value 2, index 0
41235@1610593645.532146:usb_host_set_address dev 2:4, address 2
41235@1610593645.532149:usb_host_req_emulated dev 2:4, packet 0x7effea5b4de=
0, status 0
41235@1610593645.532153:usb_xhci_ep_enable slotid 2, epid 1
41235@1610593645.532160:usb_xhci_queue_event v 0, idx 80, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c160, s 0x01000000, c 0x02008401
41235@1610593645.532180:usb_xhci_fetch_trb addr 0x000000016cf9c170, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.532203:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.532251:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.532301:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.532361:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e508
41236@1610593645.532393:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.532462:usb_xhci_runtime_write off 0x0038, val 0x6cf9e518
41235@1610593645.532501:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000
41236@1610593645.532538:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.532618:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.532698:usb_xhci_oper_read off 0x0034, ret 0x00000001
41235@1610593645.543159:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593645.543184:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593645.543197:usb_xhci_fetch_trb addr 0x000000007b19d000, TR_SETU=
P, p 0x0008000001000680, s 0x00000008, c 0x00030841
41235@1610593645.543203:usb_xhci_fetch_trb addr 0x000000007b19d010, TR_DATA=
, p 0x0000000033e7b100, s 0x00000008, c 0x00010c05
41235@1610593645.543207:usb_xhci_fetch_trb addr 0x000000007b19d020, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593645.543211:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593645.543218:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593645.543226:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593645.543252:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593645.543257:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593645.543418:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 8
41228@1610593645.543437:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593645.543446:usb_xhci_xfer_success 0x7efed4abd090: len 8
41228@1610593645.543452:usb_xhci_queue_event v 0, idx 81, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001
41228@1610593645.543479:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593645.543581:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.543622:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.543675:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e518
41236@1610593645.543700:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.543728:usb_xhci_runtime_write off 0x0038, val 0x6cf9e528
41236@1610593645.543751:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.543812:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.545138:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.545170:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a03
41235@1610593645.545187:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.545264:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.545290:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.545296:usb_xhci_fetch_trb addr 0x000000016cf9c170, CR_DISA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801
41235@1610593645.545302:usb_xhci_slot_disable slotid 2
41235@1610593645.545305:usb_xhci_ep_disable slotid 2, epid 1
41235@1610593645.545310:usb_xhci_ep_state slotid 2, epid 1, running -> disa=
bled
41235@1610593645.545317:usb_xhci_queue_event v 0, idx 82, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c170, s 0x01000000, c 0x02008401
41235@1610593645.545333:usb_xhci_fetch_trb addr 0x000000016cf9c180, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.545357:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.545387:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.545423:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.545467:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e528
41236@1610593645.545494:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.545517:usb_xhci_runtime_write off 0x0038, val 0x6cf9e538
41236@1610593645.545536:usb_xhci_runtime_write off 0x003c, val 0x00000001
41235@1610593645.545562:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.545576:usb_xhci_fetch_trb addr 0x000000016cf9c180, CR_ENAB=
LE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401
41235@1610593645.545582:usb_xhci_slot_enable slotid 2
41235@1610593645.545586:usb_xhci_queue_event v 0, idx 83, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c180, s 0x01000000, c 0x02008401
41235@1610593645.545598:usb_xhci_fetch_trb addr 0x000000016cf9c190, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.545620:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.545648:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.545683:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.545732:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e538
41236@1610593645.545771:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.545831:usb_xhci_runtime_write off 0x0038, val 0x6cf9e548
41236@1610593645.545866:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.545906:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.545961:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.545994:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a11
41235@1610593645.545998:usb_xhci_port_reset port 19, warm 0
41235@1610593645.546002:usb_host_reset dev 2:4
41235@1610593645.691480:usb_xhci_port_link port 19, pls 0
41235@1610593645.691489:usb_xhci_port_notify port 19, bits 0x200000
41235@1610593645.691490:usb_xhci_queue_event v 0, idx 84, ER_PORT_STATUS_CH=
ANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801
41235@1610593645.691561:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.691589:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.691603:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593645.691620:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691631:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691640:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.691653:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691662:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691674:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691683:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691695:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691704:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691716:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691725:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691752:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691768:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691774:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691807:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.691817:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.691827:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.691836:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.691844:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593645.691852:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691859:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691867:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41236@1610593645.691873:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691881:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691889:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691897:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691907:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691915:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691922:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691931:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691938:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691945:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691956:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41236@1610593645.691967:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e548
41236@1610593645.691975:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.691981:usb_xhci_runtime_write off 0x0038, val 0x6cf9e558
41236@1610593645.691987:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.691997:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.752101:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.752130:usb_xhci_port_read port 19, off 0x0000, ret 0x00200=
a03
41235@1610593645.752137:usb_xhci_port_write port 19, off 0x0000, val 0x0020=
0a01
41235@1610593645.752143:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593645.803114:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41236@1610593645.803162:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803208:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803332:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41236@1610593645.803381:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803437:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803499:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803538:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803588:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803648:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803707:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803765:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803810:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803900:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41236@1610593645.803951:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593645.807664:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.807687:usb_xhci_fetch_trb addr 0x000000016cf9c190, CR_ADDR=
ESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002c01
41235@1610593645.807700:usb_xhci_slot_address slotid 2, port 4
41235@1610593645.807713:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7effea5b4de0, state undef -> setup
41235@1610593645.807720:usb_host_req_control dev 2:4, packet 0x7effea5b4de0=
, req 0x5, value 2, index 0
41235@1610593645.807727:usb_host_set_address dev 2:4, address 2
41235@1610593645.807730:usb_host_req_emulated dev 2:4, packet 0x7effea5b4de=
0, status 0
41235@1610593645.807736:usb_xhci_ep_enable slotid 2, epid 1
41235@1610593645.807744:usb_xhci_queue_event v 0, idx 85, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c190, s 0x01000000, c 0x02008401
41235@1610593645.807777:usb_xhci_fetch_trb addr 0x000000016cf9c1a0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.807815:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.807924:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.807979:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.808027:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e558
41236@1610593645.808055:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.808071:usb_xhci_runtime_write off 0x0038, val 0x6cf9e568
41236@1610593645.808083:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.808124:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.809655:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000
41235@1610593645.809720:usb_xhci_oper_read off 0x0034, ret 0x00000001
41235@1610593645.820346:usb_xhci_doorbell_write off 0x0008, val 0x00000001
41235@1610593645.820450:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41235@1610593645.820484:usb_xhci_fetch_trb addr 0x000000007b19d000, TR_SETU=
P, p 0x0008000001000680, s 0x00000008, c 0x00030841
41235@1610593645.820496:usb_xhci_fetch_trb addr 0x000000007b19d010, TR_DATA=
, p 0x0000000033e7b400, s 0x00000008, c 0x00010c05
41235@1610593645.820503:usb_xhci_fetch_trb addr 0x000000007b19d020, TR_STAT=
US, p 0x0000000000000000, s 0x00000000, c 0x00001021
41235@1610593645.820509:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, epid =
1, streamid 0
41235@1610593645.820530:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state undef -> setup
41235@1610593645.820557:usb_host_req_control dev 2:4, packet 0x7efed4abd098=
, req 0x8006, value 256, index 0
41235@1610593645.820615:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state setup -> async
41235@1610593645.820622:usb_xhci_xfer_async 0x7efed4abd090
41228@1610593645.820753:usb_host_req_complete dev 2:4, packet 0x7efed4abd09=
8, status 0, length 8
41228@1610593645.820772:usb_packet_state_change bus 0, port 4, ep 0, packet=
 0x7efed4abd098, state async -> complete
41228@1610593645.820783:usb_xhci_xfer_success 0x7efed4abd090: len 8
41228@1610593645.820790:usb_xhci_queue_event v 0, idx 86, ER_TRANSFER, CC_S=
UCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001
41228@1610593645.820823:usb_xhci_ep_kick slotid 2, epid 1, streamid 0
41236@1610593645.820928:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.820979:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.821049:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e568
41236@1610593645.821078:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.821103:usb_xhci_runtime_write off 0x0038, val 0x6cf9e578
41236@1610593645.821130:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.821253:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.824400:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.824447:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a03
41235@1610593645.824460:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.824567:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.824600:usb_xhci_doorbell_write off 0x0000, val 0x00000000
41235@1610593645.824609:usb_xhci_fetch_trb addr 0x000000016cf9c1a0, CR_DISA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801
41235@1610593645.824615:usb_xhci_slot_disable slotid 2
41235@1610593645.824618:usb_xhci_ep_disable slotid 2, epid 1
41235@1610593645.824626:usb_xhci_ep_state slotid 2, epid 1, running -> disa=
bled
41235@1610593645.824636:usb_xhci_queue_event v 0, idx 87, ER_COMMAND_COMPLE=
TE, CC_SUCCESS, p 0x000000016cf9c1a0, s 0x01000000, c 0x02008401
41235@1610593645.824693:usb_xhci_fetch_trb addr 0x000000016cf9c1b0, TRB_RES=
ERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
41235@1610593645.824715:usb_xhci_doorbell_read off 0x0000, ret 0x00000000
41236@1610593645.824747:usb_xhci_oper_read off 0x0004, ret 0x00000008
41236@1610593645.824781:usb_xhci_oper_write off 0x0004, val 0x00000008
41236@1610593645.824818:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e578
41236@1610593645.824839:usb_xhci_runtime_read off 0x003c, ret 0x00000001
41236@1610593645.824873:usb_xhci_runtime_write off 0x0038, val 0x6cf9e588
41236@1610593645.824895:usb_xhci_runtime_write off 0x003c, val 0x00000001
41236@1610593645.824921:usb_xhci_oper_read off 0x0004, ret 0x00000000
41235@1610593645.828010:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.828084:usb_xhci_port_write port 19, off 0x0000, val 0x0000=
0a03
41235@1610593645.828094:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.830634:usb_xhci_port_read port 30, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830660:usb_xhci_port_write port 30, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830669:usb_xhci_port_read port 29, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830676:usb_xhci_port_write port 29, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830685:usb_xhci_port_read port 28, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830692:usb_xhci_port_write port 28, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830700:usb_xhci_port_read port 27, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830708:usb_xhci_port_write port 27, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830718:usb_xhci_port_read port 26, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830728:usb_xhci_port_write port 26, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830737:usb_xhci_port_read port 25, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830748:usb_xhci_port_write port 25, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830759:usb_xhci_port_read port 24, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830771:usb_xhci_port_write port 24, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830782:usb_xhci_port_read port 23, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830793:usb_xhci_port_write port 23, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830804:usb_xhci_port_read port 22, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830817:usb_xhci_port_write port 22, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830827:usb_xhci_port_read port 21, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830839:usb_xhci_port_write port 21, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830850:usb_xhci_port_read port 20, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830861:usb_xhci_port_write port 20, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830872:usb_xhci_port_read port 19, off 0x0000, ret 0x00000=
a03
41235@1610593645.830886:usb_xhci_port_write port 19, off 0x0000, val 0x0c01=
0a61
41235@1610593645.830897:usb_xhci_port_link port 19, pls 3
41235@1610593645.830908:usb_xhci_port_read port 18, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830916:usb_xhci_port_write port 18, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830924:usb_xhci_port_read port 17, off 0x0000, ret 0x00000=
2a0
41235@1610593645.830931:usb_xhci_port_write port 17, off 0x0000, val 0x0a00=
02a0
41235@1610593645.830939:usb_xhci_port_read port 16, off 0x0000, ret 0x00000=
e63
41235@1610593645.830947:usb_xhci_port_write port 16, off 0x0000, val 0x0c00=
0e61
41235@1610593645.830955:usb_xhci_port_read port 16, off 0x0000, ret 0x0c000=
e63
41235@1610593645.830964:usb_xhci_port_read port 17, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.830975:usb_xhci_port_read port 18, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.830990:usb_xhci_port_read port 19, off 0x0000, ret 0x0c000=
a63
41235@1610593645.831005:usb_xhci_port_read port 20, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831013:usb_xhci_port_read port 21, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831024:usb_xhci_port_read port 22, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831036:usb_xhci_port_read port 23, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831050:usb_xhci_port_read port 24, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831062:usb_xhci_port_read port 25, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831073:usb_xhci_port_read port 26, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831089:usb_xhci_port_read port 27, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831113:usb_xhci_port_read port 28, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831123:usb_xhci_port_read port 29, off 0x0000, ret 0x0a000=
2a0
41235@1610593645.831135:usb_xhci_port_read port 30, off 0x0000, ret 0x0a000=
2a0
41228@1610593661.563759:usb_xhci_ep_kick slotid 1, epid 3, streamid 0
41228@1610593661.718275:usb_xhci_ep_kick slotid 1, epid 3, streamid 0



--_000_BL0PR08MB4676559855A6894E3B987514E5A80BL0PR08MB4676namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Anyone know why a USB Gen2 (SuperSpeedPlus) device does not work when attac=
hed to the guest. I know the guest max USB speed is Gen1 (SuperSpeed), but =
I thought during guest attach qemu would downgrade the speed so that it wil=
l work at Gen1 speed. See trace
 and details below.
<div><br>
</div>
<div>USB device on usb Gen2 host port</div>
<div>--------------------------------</div>
<div><br>
</div>
<div>&nbsp;usb 2-3: new SuperSpeedPlus Gen 2 USB device number 3 using xhci=
_hcd</div>
<div>&nbsp;usb 2-3: New USB device found, idVendor=3D154b, idProduct=3Df00c=
, bcdDevice=3D 1.00</div>
<div>&nbsp;usb 2-3: New USB device strings: Mfr=3D2, Product=3D3, SerialNum=
ber=3D1</div>
<div>&nbsp;usb 2-3: Product: PNY PRO ELITE PSSD</div>
<div>&nbsp;usb 2-3: Manufacturer: PNY</div>
<div>&nbsp;usb 2-3: SerialNumber: 511200715265B3130024</div>
<div>&nbsp;usbcore: registered new interface driver usb-storage</div>
<div>&nbsp;scsi host2: uas</div>
<div>&nbsp;usbcore: registered new interface driver uas</div>
<div>&nbsp;scsi 2:0:0:0: Direct-Access &nbsp; &nbsp; PNY &nbsp; &nbsp; &nbs=
p;PNY PRO ELITE PS 0 &nbsp; &nbsp;PQ: 0 ANSI: 6</div>
<div>&nbsp;sd 2:0:0:0: Attached scsi generic sg1 type 0</div>
<div>&nbsp;sd 2:0:0:0: [sdb] 976748545 512-byte logical blocks: (500 GB/466=
 GiB)</div>
<div>&nbsp;sd 2:0:0:0: [sdb] Write Protect is off</div>
<div>&nbsp;sd 2:0:0:0: [sdb] Mode Sense: 43 00 00 00</div>
<div>&nbsp;sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doe=
sn't support DPO or FUA</div>
<div>&nbsp;sd 2:0:0:0: [sdb] Optimal transfer size 33553920 bytes</div>
<div><br>
</div>
<div><br>
</div>
<div>: &nbsp;Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, =
10000M</div>
<div>&nbsp; &nbsp; |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5=
000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 5, Class=3DCommunica=
tions, Driver=3Dcdc_ncm, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 3, Class=3DAudio, Dr=
iver=3Dsnd-usb-audio, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 1, Class=3DApplicati=
on Specific Interface, Driver=3Dusbfs, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 6, Class=3DCDC Data,=
 Driver=3Dcdc_ncm, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 4, Class=3DAudio, Dr=
iver=3Dsnd-usb-audio, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 2, Class=3DAudio, Dr=
iver=3Dsnd-usb-audio, 5000M</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; |__ Port 4: Dev 3, If 0, Class=3DVendor Sp=
ecific Class, Driver=3Dusbfs, 5000M</div>
<div>&nbsp; &nbsp; |__ Port 3: Dev 4, If 0, Class=3DMass Storage, Driver=3D=
, 10000M &nbsp;&lt;&lt;&lt; attached to guest but not seen in guest os - ce=
ntos7.8</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>guest</div>
<div>-----</div>
<div>localhost login: [ &nbsp; 72.763264] usb 1-4: new low-speed USB device=
 number 3 using xhci_hcd</div>
<div>[ &nbsp; 72.877449] usb 1-4: device descriptor read/64, error 18</div>
<div>[ &nbsp; 73.092928] usb 1-4: device descriptor read/64, error 18</div>
<div>[ &nbsp; 73.310240] usb 1-4: new low-speed USB device number 4 using x=
hci_hcd</div>
<div>[ &nbsp; 73.428389] usb 1-4: device descriptor read/64, error 18</div>
<div>[ &nbsp; 73.649497] usb 1-4: device descriptor read/64, error 18</div>
<div>[ &nbsp; 73.752079] usb usb1-port4: attempt power cycle</div>
<div>[ &nbsp; 74.171241] usb 1-4: new low-speed USB device number 5 using x=
hci_hcd</div>
<div>[ &nbsp; 74.184867] usb 1-4: Invalid ep0 maxpacket: 9</div>
<div>[ &nbsp; 74.444275] usb 1-4: new low-speed USB device number 6 using x=
hci_hcd</div>
<div>[ &nbsp; 74.462281] usb 1-4: Invalid ep0 maxpacket: 9</div>
<div>[ &nbsp; 74.465899] usb usb1-port4: unable to enumerate USB device</di=
v>
<div><br>
</div>
<div>[centos@localhost ~]$ lsusb -t</div>
<div>/: &nbsp;Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p=
, 5000M</div>
<div>/: &nbsp;Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p=
, 480M</div>
<div>&nbsp; &nbsp; |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device,=
 Driver=3Dusbhid, 480M</div>
<div><br>
</div>
<div>Host</div>
<div>----</div>
<div><br>
</div>
<div>~/workspace/qemuorg$ virsh qemu-monitor-command centos7.0 --hmp info u=
sbhost</div>
<div>&nbsp; Bus 2, Addr 4, Port 3, Speed (null) Mb/s</div>
<div>&nbsp; &nbsp; Class 00: USB device 154b:f00c, PNY PRO ELITE PSSD</div>
<div>&nbsp; Bus 2, Addr 3, Port 1.4, Speed 5000 Mb/s</div>
<div>&nbsp; &nbsp; Class ef: USB device 17e9:4307</div>
<div>&nbsp; Bus 1, Addr 3, Port 6, Speed 480 Mb/s</div>
<div>&nbsp; &nbsp; Class 00: USB device 058f:6366</div>
<div>&nbsp; Bus 1, Addr 2, Port 3, Speed 480 Mb/s</div>
<div>&nbsp; &nbsp; Class ef: USB device 0408:5300</div>
<div>&nbsp; Bus 1, Addr 10, Port 2, Speed 480 Mb/s</div>
<div>&nbsp; &nbsp; Class 00: USB device 05dc:c75c</div>
<div>&nbsp; Bus 1, Addr 4, Port 10, Speed 12 Mb/s</div>
<div>&nbsp; &nbsp; Class e0: USB device 0bda:b00a</div>
<div>&nbsp; Bus 1, Addr 9, Port 1.3.1.2, Speed 12 Mb/s</div>
<div>&nbsp; &nbsp; Class 00: USB device 04d9:1830</div>
<div>&nbsp; Bus 1, Addr 8, Port 1.3.1.1, Speed 12 Mb/s</div>
<div>&nbsp; &nbsp; Class 00: USB device 046d:c077</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; class USB controller, addr 0=
2:00.0, pci id 1b36:000d (sub 1af4:1100)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bar 0: mem at 0xfca00000 [0x=
fca03fff]</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bus: usb.0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type usb-bus</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev: usb-host, id &qu=
ot;hostdev0&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hostbus =3D 2 =
(0x2)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hostaddr =3D 4=
 (0x4)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hostport =3D &=
quot;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vendorid =3D 0=
 (0x0)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; productid =3D =
0 (0x0)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hostdevice =3D=
 &quot;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isobufs =3D 4 =
(0x4)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; isobsize =3D 3=
2 (0x20)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; guest-reset =
=3D true</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; guest-resets-a=
ll =3D false</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; loglevel =3D 2=
 (0x2)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pipeline =3D t=
rue</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; suppress-remot=
e-wake =3D false</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; port =3D &quot=
;4&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; serial =3D &qu=
ot;&quot;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; full-path =3D =
true</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msos-desc =3D =
true</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; addr 0.2, port=
 4, speed 1.5, name PNY PRO ELITE PSSD, attached</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>2021-01-14 03:06:08.835+0000: starting up libvirt version: 6.0.0, pack=
age: 0ubuntu8.5 (Christian Ehrhardt &lt;christian.ehrhardt@canonical.com&gt=
; Thu, 08 Oct 2020 07:36:06 +0200), qemu version: 5.2.50v5.2.0-991-g4524</d=
iv>
<div>0eed4f, kernel: 5.8.0-36-generic, hostname: pavilion</div>
<div>LC_ALL=3DC \</div>
<div>PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/s=
nap/bin \</div>
<div>HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0 \</div>
<div>XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.local/share =
\</div>
<div>XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.cache \</di=
v>
<div>XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-3-centos7.0/.config \</=
div>
<div>QEMU_AUDIO_DRV=3Dspice \</div>
<div>/usr/local/bin/qemu-system-x86_64 \</div>
<div>-name guest=3Dcentos7.0,debug-threads=3Don \</div>
<div>-S \</div>
<div>-object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qe=
mu/domain-3-centos7.0/master-key.aes \</div>
<div>-machine pc-q35-4.2,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-core=
=3Doff \</div>
<div>-cpu SandyBridge \</div>
<div>-m 4098 \</div>
<div>-overcommit mem-lock=3Doff \</div>
<div>-smp 2,sockets=3D2,cores=3D1,threads=3D1 \</div>
<div>-uuid 12fbe73b-64f1-45dc-a10c-8a18801491b1 \</div>
<div>-no-user-config \</div>
<div>-nodefaults \</div>
<div>-chardev socket,id=3Dcharmonitor,fd=3D31,server,nowait \</div>
<div>-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \</div>
<div>-rtc base=3Dutc,driftfix=3Dslew \</div>
<div>-global kvm-pit.lost_tick_policy=3Ddelay \</div>
<div>-no-hpet \</div>
<div>-no-shutdown \</div>
<div>-global ICH9-LPC.disable_s3=3D1 \</div>
<div>-global ICH9-LPC.disable_s4=3D1 \</div>
<div>-boot strict=3Don \</div>
<div>-device pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0=
,multifunction=3Don,addr=3D0x2 \</div>
<div>-device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0=
,addr=3D0x2.0x1 \</div>
<div>-device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0=
,addr=3D0x2.0x2 \</div>
<div>-device pcie-root-port,port=3D0x13,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0=
,addr=3D0x2.0x3 \</div>
<div>-device pcie-root-port,port=3D0x14,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0=
,addr=3D0x2.0x4 \</div>
<div>-device pcie-root-port,port=3D0x15,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0=
,addr=3D0x2.0x5 \</div>
<div>-device pcie-root-port,port=3D0x16,chassis=3D7,id=3Dpci.7,bus=3Dpcie.0=
,addr=3D0x2.0x6 \</div>
<div>-device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 \</d=
iv>
<div>-device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 \=
</div>
<div>-blockdev '{&quot;driver&quot;:&quot;file&quot;,&quot;filename&quot;:&=
quot;/var/lib/libvirt/images/CentOS-7-x86_64-GenericCloud-2009.qcow2&quot;,=
&quot;node-name&quot;:&quot;libvirt-1-storage&quot;,&quot;auto-read-only&qu=
ot;:true,&quot;discard&quot;:&quot;unmap&quot;}' \</div>
<div>-blockdev '{&quot;node-name&quot;:&quot;libvirt-1-format&quot;,&quot;r=
ead-only&quot;:false,&quot;driver&quot;:&quot;qcow2&quot;,&quot;file&quot;:=
&quot;libvirt-1-storage&quot;,&quot;backing&quot;:null}' \</div>
<div>-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.4,addr=3D0x0,drive=3Dlibvi=
rt-1-format,id=3Dvirtio-disk0,bootindex=3D1 \</div>
<div>-netdev tap,fd=3D33,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 \</div>
<div>-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:c5:5=
2:e1,bus=3Dpci.1,addr=3D0x0 \</div>
<div>-chardev pty,id=3Dcharserial0 \</div>
<div>-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \</div>
<div>-chardev socket,id=3Dcharchannel0,fd=3D35,server,nowait \</div>
<div>-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharcha=
nnel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \</div>
<div>-chardev spicevmc,id=3Dcharchannel1,name=3Dvdagent \</div>
<div>-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D2,chardev=3Dcharcha=
nnel1,id=3Dchannel1,name=3Dcom.redhat.spice.0 \</div>
<div>-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \</div>
<div>-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing,image-compressio=
n=3Doff,seamless-migration=3Don \</div>
<div>-device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,v=
ram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bus=3Dpcie.0,addr=3D0x1 \<=
/div>
<div>-device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,addr=3D0x1b \</div>
<div>-device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 \</div>
<div>-chardev spicevmc,id=3Dcharredir0,name=3Dusbredir \</div>
<div>-device usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D=
2 \</div>
<div>-chardev spicevmc,id=3Dcharredir1,name=3Dusbredir \</div>
<div>-device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D=
3 \</div>
<div>-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.5,addr=3D0x0 \</div=
>
<div>-object rng-random,id=3Dobjrng0,filename=3D/dev/urandom \</div>
<div>-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.6,addr=3D0x0 =
\</div>
<div>-sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,reso=
urcecontrol=3Ddeny \</div>
<div>-msg timestamp=3Don</div>
<div>2021-01-14 03:06:52.939+0000: Domain id=3D3 is tainted: custom-monitor=
</div>
<div><br>
</div>
<div>41228@1610593643.553534:usb_port_claim bus 0, port 4</div>
<div>41228@1610593643.558646:usb_host_open_started dev 2:4</div>
<div>41228@1610593643.558680:usb_host_detach_kernel dev 2:4, if 0</div>
<div>41228@1610593643.905496:usb_host_parse_config dev 2:4, value 1, active=
 1</div>
<div>41228@1610593643.905521:usb_host_parse_interface dev 2:4, num 0, alt 0=
, active 1</div>
<div>41228@1610593643.905528:usb_host_parse_endpoint dev 2:4, ep 1, in, bul=
k, active 1</div>
<div>41228@1610593643.905534:usb_host_parse_endpoint dev 2:4, ep 2, out, bu=
lk, active 1</div>
<div>41228@1610593643.905789:usb_port_attach bus 0, port 4, devspeed unknow=
n, portspeed full+high+super</div>
<div>41228@1610593643.905807:usb_xhci_port_link port 19, pls 7</div>
<div>41228@1610593643.905813:usb_xhci_port_notify port 19, bits 0x20000</di=
v>
<div>41228@1610593643.905819:usb_xhci_queue_event v 0, idx 37, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41228@1610593643.905861:usb_host_open_success dev 2:4</div>
<div>41235@1610593643.906377:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41235@1610593643.906427:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41235@1610593643.906472:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.906504:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.906540:usb_xhci_port_read port 16, off 0x0000, ret 0x=
0c000e63</div>
<div>41235@1610593643.906581:usb_xhci_port_read port 17, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906609:usb_xhci_port_read port 18, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906635:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.906666:usb_xhci_port_read port 20, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906685:usb_xhci_port_read port 21, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906700:usb_xhci_port_read port 22, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906719:usb_xhci_port_read port 23, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906744:usb_xhci_port_read port 24, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906769:usb_xhci_port_read port 25, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906795:usb_xhci_port_read port 26, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906821:usb_xhci_port_read port 27, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906846:usb_xhci_port_read port 28, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906874:usb_xhci_port_read port 29, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906897:usb_xhci_port_read port 30, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.906935:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
58</div>
<div>41235@1610593643.906960:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41235@1610593643.906993:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
268</div>
<div>41235@1610593643.907023:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593643.907096:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593643.907240:usb_xhci_oper_read off 0x0000, ret 0x00000005<=
/div>
<div>41235@1610593643.907275:usb_xhci_oper_write off 0x0000, val 0x00000001=
</div>
<div>41235@1610593643.907334:usb_xhci_port_read port 30, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907372:usb_xhci_port_write port 30, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907400:usb_xhci_port_read port 29, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907439:usb_xhci_port_write port 29, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907476:usb_xhci_port_read port 28, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907517:usb_xhci_port_write port 28, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907555:usb_xhci_port_read port 27, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907596:usb_xhci_port_write port 27, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907633:usb_xhci_port_read port 26, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907674:usb_xhci_port_write port 26, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907710:usb_xhci_port_read port 25, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907753:usb_xhci_port_write port 25, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907790:usb_xhci_port_read port 24, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907831:usb_xhci_port_write port 24, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907868:usb_xhci_port_read port 23, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907911:usb_xhci_port_write port 23, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.907947:usb_xhci_port_read port 22, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.907988:usb_xhci_port_write port 22, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.908033:usb_xhci_port_read port 21, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.908072:usb_xhci_port_write port 21, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.908105:usb_xhci_port_read port 20, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.908131:usb_xhci_port_write port 20, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.908159:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.908184:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000ae1</div>
<div>41235@1610593643.908212:usb_xhci_port_read port 18, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.908230:usb_xhci_port_write port 18, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.908249:usb_xhci_port_read port 17, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593643.908275:usb_xhci_port_write port 17, off 0x0000, val 0=
x000002a0</div>
<div>41235@1610593643.908304:usb_xhci_port_read port 16, off 0x0000, ret 0x=
0c000e63</div>
<div>41235@1610593643.908328:usb_xhci_port_write port 16, off 0x0000, val 0=
x00000e61</div>
<div>41235@1610593643.908359:usb_xhci_oper_read off 0x0000, ret 0x00000001<=
/div>
<div>41235@1610593643.908376:usb_xhci_oper_read off 0x0000, ret 0x00000001<=
/div>
<div>41235@1610593643.908393:usb_xhci_oper_write off 0x0000, val 0x00000005=
</div>
<div>41235@1610593643.908421:usb_xhci_oper_read off 0x0000, ret 0x00000005<=
/div>
<div>41236@1610593643.908470:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593643.908526:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593643.908573:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593643.908620:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.908674:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.908730:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.908788:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00020ae1</div>
<div>41235@1610593643.908826:usb_xhci_port_write port 19, off 0x0000, val 0=
x00020ae1</div>
<div>41235@1610593643.908856:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000ae1</div>
<div>41235@1610593643.908905:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.908950:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909004:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909084:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909155:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909214:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909281:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909337:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909403:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909458:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593643.909525:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593644.010105:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000ae1</div>
<div>41235@1610593644.010147:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.010154:usb_xhci_fetch_trb addr 0x000000016cf9c0b0, CR=
_ENABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401</div>
<div>41235@1610593644.010156:usb_xhci_slot_enable slotid 2</div>
<div>41235@1610593644.010158:usb_xhci_queue_event v 0, idx 38, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c0b0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.010173:usb_xhci_fetch_trb addr 0x000000016cf9c0c0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.010184:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.010206:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.010223:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.010262:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
68</div>
<div>41236@1610593644.010270:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.010278:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
278</div>
<div>41236@1610593644.010285:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.010299:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.010470:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000ae1</div>
<div>41235@1610593644.010482:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000af1</div>
<div>41235@1610593644.010484:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.010486:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.010488:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.010489:usb_xhci_queue_event v 0, idx 39, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.010499:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.010505:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.010515:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.010528:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.010539:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.010545:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.010551:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.010558:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010565:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010572:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.010580:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010591:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010599:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010605:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010612:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010622:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010630:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010639:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010647:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010653:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010661:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.010671:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
78</div>
<div>41236@1610593644.010680:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.010689:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
288</div>
<div>41236@1610593644.010697:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.010715:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41236@1610593644.053093:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.053115:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053121:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053125:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.053130:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053134:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053139:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053143:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053149:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053153:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053158:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053162:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053167:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053171:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.053176:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593644.071155:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.071213:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.071228:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.071237:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.123307:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.123320:usb_xhci_fetch_trb addr 0x000000016cf9c0c0, CR=
_ADDRESS_DEVICE, p 0x000000007b120000, s 0x00000000, c 0x02002e01</div>
<div>41235@1610593644.123326:usb_xhci_slot_address slotid 2, port 4</div>
<div>41235@1610593644.123329:usb_xhci_ep_enable slotid 2, epid 1</div>
<div>41235@1610593644.123334:usb_xhci_queue_event v 0, idx 40, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c0c0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.123346:usb_xhci_fetch_trb addr 0x000000016cf9c0d0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.123355:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.123385:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.123404:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.123431:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
88</div>
<div>41236@1610593644.123441:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.123450:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
298</div>
<div>41236@1610593644.123457:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.123476:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.123516:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000<=
/div>
<div>41235@1610593644.123529:usb_xhci_oper_read off 0x0034, ret 0x00000001<=
/div>
<div>41235@1610593644.123549:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.123557:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.123573:usb_xhci_fetch_trb addr 0x0000000033949000, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.123576:usb_xhci_fetch_trb addr 0x0000000033949010, TR=
_DATA, p 0x0000000033804000, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.123578:usb_xhci_fetch_trb addr 0x0000000033949020, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.123581:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.123585:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.123590:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.123609:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.123614:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593644.123719:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.123726:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.123730:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.123733:usb_xhci_queue_event v 0, idx 41, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x0000000033949010, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.123740:usb_xhci_queue_event v 0, idx 42, ER_TRANSFER,=
 CC_SUCCESS, p 0x0000000033949020, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.123742:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.123768:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.123784:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.123810:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
98</div>
<div>41236@1610593644.123823:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.123833:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
2b8</div>
<div>41236@1610593644.123845:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.123860:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.123868:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.123872:usb_xhci_fetch_trb addr 0x0000000033949030, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.123875:usb_xhci_fetch_trb addr 0x0000000033949040, TR=
_DATA, p 0x0000000033804000, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.123877:usb_xhci_fetch_trb addr 0x0000000033949050, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.123879:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.123881:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.123883:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.123895:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.123900:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.123912:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.123983:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.123988:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.123990:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.123992:usb_xhci_queue_event v 0, idx 43, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x0000000033949040, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.124002:usb_xhci_queue_event v 0, idx 44, ER_TRANSFER,=
 CC_SUCCESS, p 0x0000000033949050, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.124007:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.124024:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.124038:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.124056:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
b8</div>
<div>41236@1610593644.124066:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.124074:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
2d8</div>
<div>41236@1610593644.124083:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.124096:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.124399:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.124405:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.124409:usb_xhci_fetch_trb addr 0x0000000033949060, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.124411:usb_xhci_fetch_trb addr 0x0000000033949070, TR=
_DATA, p 0x0000000033804000, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.124412:usb_xhci_fetch_trb addr 0x0000000033949080, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.124414:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.124416:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.124418:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.124425:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.124427:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593644.124512:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.124517:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.124520:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.124522:usb_xhci_queue_event v 0, idx 45, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x0000000033949070, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.124527:usb_xhci_queue_event v 0, idx 46, ER_TRANSFER,=
 CC_SUCCESS, p 0x0000000033949080, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.124529:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.124540:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.124557:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.124583:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
d8</div>
<div>41236@1610593644.124596:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.124606:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
2f8</div>
<div>41236@1610593644.124618:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.124632:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.124654:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593644.124661:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.124663:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.124665:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.124667:usb_xhci_queue_event v 0, idx 47, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.124683:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.124696:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.124709:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.124723:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.124735:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.124746:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.124764:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.124777:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124786:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124794:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.124801:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124809:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124818:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124826:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124834:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124841:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124849:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124859:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124866:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124874:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124881:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.124890:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e2=
f8</div>
<div>41236@1610593644.124899:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.124907:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
308</div>
<div>41236@1610593644.124914:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.124969:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.185172:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.185238:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.185249:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.185255:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.236079:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.236096:usb_xhci_fetch_trb addr 0x000000016cf9c0d0, CR=
_RESET_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401</div>
<div>41235@1610593644.236099:usb_xhci_slot_reset slotid 2</div>
<div>41235@1610593644.236102:usb_xhci_queue_event v 0, idx 48, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c0d0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.236115:usb_xhci_fetch_trb addr 0x000000016cf9c0e0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.236128:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.236176:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.236195:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.236218:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
08</div>
<div>41236@1610593644.236230:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.236238:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
318</div>
<div>41236@1610593644.236247:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.236285:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41236@1610593644.303087:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.303109:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303115:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303120:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593644.303125:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303130:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303135:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303139:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303145:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303150:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303155:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303159:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303164:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303169:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.303175:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593644.338144:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.338162:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.338170:usb_xhci_fetch_trb addr 0x0000000033949090, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.338172:usb_xhci_fetch_trb addr 0x00000000339490a0, TR=
_DATA, p 0x0000000033804300, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.338174:usb_xhci_fetch_trb addr 0x00000000339490b0, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.338175:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.338178:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.338182:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.338196:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.338198:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593644.338312:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.338334:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.338340:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.338343:usb_xhci_queue_event v 0, idx 49, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x00000000339490a0, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.338365:usb_xhci_queue_event v 0, idx 50, ER_TRANSFER,=
 CC_SUCCESS, p 0x00000000339490b0, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.338369:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.338404:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.338420:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.338441:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
18</div>
<div>41236@1610593644.338447:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.338453:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
338</div>
<div>41236@1610593644.338459:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.338474:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.338501:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.338509:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.338514:usb_xhci_fetch_trb addr 0x00000000339490c0, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.338516:usb_xhci_fetch_trb addr 0x00000000339490d0, TR=
_DATA, p 0x0000000033804300, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.338518:usb_xhci_fetch_trb addr 0x00000000339490e0, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.338519:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.338521:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.338523:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.338533:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.338536:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593644.338623:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.338629:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.338632:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.338634:usb_xhci_queue_event v 0, idx 51, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x00000000339490d0, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.338643:usb_xhci_queue_event v 0, idx 52, ER_TRANSFER,=
 CC_SUCCESS, p 0x00000000339490e0, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.338648:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.338700:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.338718:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.338740:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
38</div>
<div>41236@1610593644.338753:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.338765:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
358</div>
<div>41236@1610593644.338778:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.338807:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.338815:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.338819:usb_xhci_fetch_trb addr 0x00000000339490f0, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.338822:usb_xhci_fetch_trb addr 0x0000000033949100, TR=
_DATA, p 0x0000000033804300, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.338823:usb_xhci_fetch_trb addr 0x0000000033949110, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.338825:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.338827:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.338829:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.338837:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.338840:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.338851:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.338921:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.338926:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.338928:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.338930:usb_xhci_queue_event v 0, idx 53, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x0000000033949100, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.338937:usb_xhci_queue_event v 0, idx 54, ER_TRANSFER,=
 CC_SUCCESS, p 0x0000000033949110, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.338941:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.338953:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.338967:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.338989:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
58</div>
<div>41236@1610593644.339001:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.339010:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
378</div>
<div>41236@1610593644.339017:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.339032:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.339048:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593644.339051:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.339053:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.339054:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.339055:usb_xhci_queue_event v 0, idx 55, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.339065:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.339072:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.339080:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.339091:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.339104:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.339115:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.339125:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.339136:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339144:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339155:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.339163:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339173:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339183:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339193:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339202:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339212:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339222:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339232:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339241:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339249:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339259:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.339269:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
78</div>
<div>41236@1610593644.339278:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.339288:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
388</div>
<div>41236@1610593644.339297:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.339309:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.400228:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.400335:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.400368:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.400387:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.451275:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.451327:usb_xhci_fetch_trb addr 0x000000016cf9c0e0, CR=
_RESET_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401</div>
<div>41235@1610593644.451338:usb_xhci_slot_reset slotid 2</div>
<div>41235@1610593644.451347:usb_xhci_queue_event v 0, idx 56, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c0e0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.451378:usb_xhci_fetch_trb addr 0x000000016cf9c0f0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.451421:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.451488:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.451552:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.451659:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
88</div>
<div>41236@1610593644.451698:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.451734:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
398</div>
<div>41236@1610593644.451765:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.451822:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41236@1610593644.553254:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.553359:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553409:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553460:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593644.553508:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553575:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553626:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553693:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553754:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553821:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553874:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553939:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.553999:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.554060:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.554119:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593644.555224:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.555307:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a03</div>
<div>41235@1610593644.555344:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.555512:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.555576:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.555599:usb_xhci_fetch_trb addr 0x000000016cf9c0f0, CR=
_DISABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801</div>
<div>41235@1610593644.555613:usb_xhci_slot_disable slotid 2</div>
<div>41235@1610593644.555621:usb_xhci_ep_disable slotid 2, epid 1</div>
<div>41235@1610593644.555634:usb_xhci_ep_state slotid 2, epid 1, running -&=
gt; disabled</div>
<div>41235@1610593644.555652:usb_xhci_queue_event v 0, idx 57, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c0f0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.555690:usb_xhci_fetch_trb addr 0x000000016cf9c100, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.555728:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.555812:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.555892:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.555989:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
98</div>
<div>41236@1610593644.556049:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.556089:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
3a8</div>
<div>41236@1610593644.556129:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.556189:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.556218:usb_xhci_fetch_trb addr 0x000000016cf9c100, CR=
_ENABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401</div>
<div>41235@1610593644.556228:usb_xhci_slot_enable slotid 2</div>
<div>41235@1610593644.556234:usb_xhci_queue_event v 0, idx 58, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c100, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.556255:usb_xhci_fetch_trb addr 0x000000016cf9c110, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.556297:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.556365:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.556436:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.556542:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
a8</div>
<div>41236@1610593644.556587:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.556629:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
3b8</div>
<div>41236@1610593644.556664:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.556728:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.556831:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.556901:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593644.556921:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.556932:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.556940:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.556946:usb_xhci_queue_event v 0, idx 59, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.557021:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.557079:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.557165:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.557240:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.557311:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.557361:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.557406:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.557452:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557493:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557534:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.557574:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557610:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557653:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557690:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557728:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557770:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557810:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557849:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557889:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557930:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.557970:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.558019:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
b8</div>
<div>41236@1610593644.558062:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.558110:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
3c8</div>
<div>41236@1610593644.558150:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.558235:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.618110:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.618168:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.618185:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.618194:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.670134:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.670151:usb_xhci_fetch_trb addr 0x000000016cf9c110, CR=
_ADDRESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002e01</div>
<div>41235@1610593644.670158:usb_xhci_slot_address slotid 2, port 4</div>
<div>41235@1610593644.670162:usb_xhci_ep_enable slotid 2, epid 1</div>
<div>41235@1610593644.670168:usb_xhci_queue_event v 0, idx 60, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c110, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.670180:usb_xhci_fetch_trb addr 0x000000016cf9c120, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.670193:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.670217:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.670241:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.670268:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
c8</div>
<div>41236@1610593644.670281:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.670314:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
3d8</div>
<div>41235@1610593644.670340:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000<=
/div>
<div>41236@1610593644.670348:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.670358:usb_xhci_oper_read off 0x0034, ret 0x00000001<=
/div>
<div>41235@1610593644.670376:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.670381:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.670386:usb_xhci_fetch_trb addr 0x000000007b19d000, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.670389:usb_xhci_fetch_trb addr 0x000000007b19d010, TR=
_DATA, p 0x0000000033804640, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.670391:usb_xhci_fetch_trb addr 0x000000007b19d020, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.670393:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.670396:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.670400:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.670414:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.670417:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.670431:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.670492:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.670501:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.670505:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.670507:usb_xhci_queue_event v 0, idx 61, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d010, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.670516:usb_xhci_queue_event v 0, idx 62, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.670519:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.670543:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.670568:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.670602:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
d8</div>
<div>41236@1610593644.670618:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.670628:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
3f8</div>
<div>41236@1610593644.670638:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.670658:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.670666:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.670674:usb_xhci_fetch_trb addr 0x000000007b19d030, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.670677:usb_xhci_fetch_trb addr 0x000000007b19d040, TR=
_DATA, p 0x0000000033804640, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.670679:usb_xhci_fetch_trb addr 0x000000007b19d050, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.670682:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.670686:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.670689:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.670700:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.670703:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.670716:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.670809:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.670816:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.670819:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.670821:usb_xhci_queue_event v 0, idx 63, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d040, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.670828:usb_xhci_queue_event v 0, idx 64, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d050, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.670832:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.670852:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.670864:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.670884:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e3=
f8</div>
<div>41236@1610593644.670896:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.670907:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
418</div>
<div>41236@1610593644.670918:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.670933:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.670940:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.670945:usb_xhci_fetch_trb addr 0x000000007b19d060, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.670947:usb_xhci_fetch_trb addr 0x000000007b19d070, TR=
_DATA, p 0x0000000033804640, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.670949:usb_xhci_fetch_trb addr 0x000000007b19d080, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.670951:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.670953:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.670955:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.670964:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.670969:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.670982:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.671065:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.671074:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.671079:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.671081:usb_xhci_queue_event v 0, idx 65, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d070, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.671090:usb_xhci_queue_event v 0, idx 66, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d080, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.671093:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.671114:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.671131:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.671154:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
18</div>
<div>41236@1610593644.671170:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.671182:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
438</div>
<div>41236@1610593644.671193:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.671213:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.671241:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.671262:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593644.671267:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.671270:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.671272:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.671274:usb_xhci_queue_event v 0, idx 67, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.671291:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.671302:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.671318:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.671337:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.671356:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.671370:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.671384:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.671396:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671408:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671421:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.671433:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671444:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671457:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671468:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671480:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671492:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671504:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671516:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671528:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671540:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671552:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.671565:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
38</div>
<div>41236@1610593644.671577:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.671588:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
448</div>
<div>41236@1610593644.671600:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.671623:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.732280:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.732415:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.732456:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.732482:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.783285:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593644.783351:usb_xhci_fetch_trb addr 0x000000016cf9c120, CR=
_RESET_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401</div>
<div>41235@1610593644.783363:usb_xhci_slot_reset slotid 2</div>
<div>41235@1610593644.783374:usb_xhci_queue_event v 0, idx 68, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c120, s 0x01000000, c 0x02008401</div>
<div>41235@1610593644.783417:usb_xhci_fetch_trb addr 0x000000016cf9c130, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593644.783472:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593644.783556:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.783658:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.787197:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
48</div>
<div>41236@1610593644.787261:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.787298:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
458</div>
<div>41236@1610593644.787327:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.787385:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41236@1610593644.803086:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.803124:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803137:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803146:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593644.803157:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803166:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803177:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803187:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803197:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803207:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803219:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803233:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803249:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803272:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.803289:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593644.892437:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.892500:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.892526:usb_xhci_fetch_trb addr 0x000000007b19d090, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.892537:usb_xhci_fetch_trb addr 0x000000007b19d0a0, TR=
_DATA, p 0x0000000033804980, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.892546:usb_xhci_fetch_trb addr 0x000000007b19d0b0, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.892554:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.892567:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.892581:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.892639:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.892649:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593644.892959:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.892999:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.893017:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.893026:usb_xhci_queue_event v 0, idx 69, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d0a0, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.893082:usb_xhci_queue_event v 0, idx 70, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d0b0, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.893100:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.893299:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.893387:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.893497:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
58</div>
<div>41236@1610593644.893555:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.893599:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
478</div>
<div>41236@1610593644.893632:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.893699:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.893722:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.893744:usb_xhci_fetch_trb addr 0x000000007b19d0c0, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.893757:usb_xhci_fetch_trb addr 0x000000007b19d0d0, TR=
_DATA, p 0x0000000033804980, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.893768:usb_xhci_fetch_trb addr 0x000000007b19d0e0, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.893779:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.893792:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.893808:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.893858:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.893881:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.893943:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.894046:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.894085:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.894105:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.894116:usb_xhci_queue_event v 0, idx 71, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d0d0, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.894160:usb_xhci_queue_event v 0, idx 72, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d0e0, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.894170:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.894319:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.894467:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.894569:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
78</div>
<div>41236@1610593644.894637:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.894690:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
498</div>
<div>41236@1610593644.894731:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.894797:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593644.894835:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593644.894859:usb_xhci_fetch_trb addr 0x000000007b19d0f0, TR=
_SETUP, p 0x0040000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593644.894873:usb_xhci_fetch_trb addr 0x000000007b19d100, TR=
_DATA, p 0x0000000033804980, s 0x00000040, c 0x00010c05</div>
<div>41235@1610593644.894882:usb_xhci_fetch_trb addr 0x000000007b19d110, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593644.894893:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593644.894906:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593644.894920:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593644.894966:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593644.894979:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41236@1610593644.895051:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41228@1610593644.895180:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 18</div>
<div>41228@1610593644.895218:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593644.895234:usb_xhci_xfer_success 0x7efed4abd090: len 18</=
div>
<div>41228@1610593644.895242:usb_xhci_queue_event v 0, idx 73, ER_TRANSFER,=
 CC_SHORT_PACKET, p 0x000000007b19d100, s 0x0d00002e, c 0x02018001</div>
<div>41228@1610593644.895283:usb_xhci_queue_event v 0, idx 74, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d110, s 0x01000000, c 0x02018001</div>
<div>41228@1610593644.895306:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593644.895430:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.895502:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.895602:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
98</div>
<div>41236@1610593644.895665:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.895723:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
4b8</div>
<div>41236@1610593644.895759:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593644.895821:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593644.895897:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593644.895919:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593644.895929:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593644.895935:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593644.895942:usb_xhci_queue_event v 0, idx 75, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593644.896000:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.896051:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.896097:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593644.896160:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593644.896226:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.896273:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.896298:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593644.896327:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896349:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896371:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593644.896391:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896413:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896435:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896457:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896477:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896500:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896522:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896545:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896568:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896591:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896613:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593644.896642:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
b8</div>
<div>41236@1610593644.896666:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593644.896694:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
4c8</div>
<div>41236@1610593644.896715:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593644.896769:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593644.957191:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.957265:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593644.957287:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593644.957301:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.008156:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.008176:usb_xhci_fetch_trb addr 0x000000016cf9c130, CR=
_RESET_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x02004401</div>
<div>41235@1610593645.008180:usb_xhci_slot_reset slotid 2</div>
<div>41235@1610593645.008184:usb_xhci_queue_event v 0, idx 76, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c130, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.008199:usb_xhci_fetch_trb addr 0x000000016cf9c140, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.008220:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.008244:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.008265:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.008297:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
c8</div>
<div>41236@1610593645.008315:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.008333:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
4d8</div>
<div>41236@1610593645.008348:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.008375:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41236@1610593645.053274:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593645.053361:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053389:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053409:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593645.053436:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053458:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053481:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053502:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053528:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053551:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053576:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053603:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053639:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053669:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.053716:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.110220:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.110367:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a03</div>
<div>41235@1610593645.110441:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.110607:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.110689:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.110706:usb_xhci_fetch_trb addr 0x000000016cf9c140, CR=
_DISABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801</div>
<div>41235@1610593645.110720:usb_xhci_slot_disable slotid 2</div>
<div>41235@1610593645.110726:usb_xhci_ep_disable slotid 2, epid 1</div>
<div>41235@1610593645.110739:usb_xhci_ep_state slotid 2, epid 1, running -&=
gt; disabled</div>
<div>41235@1610593645.110768:usb_xhci_queue_event v 0, idx 77, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c140, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.110821:usb_xhci_fetch_trb addr 0x000000016cf9c150, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.110874:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.110942:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.111026:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.111090:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
d8</div>
<div>41236@1610593645.111135:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.111323:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
4e8</div>
<div>41236@1610593645.111493:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.111625:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.114651:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.114972:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.115185:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000801</div>
<div>41235@1610593645.316298:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000803</div>
<div>41235@1610593645.316399:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000803</div>
<div>41235@1610593645.316451:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a01</div>
<div>41235@1610593645.316490:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.316536:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.417327:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.417381:usb_xhci_fetch_trb addr 0x000000016cf9c150, CR=
_ENABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401</div>
<div>41235@1610593645.417392:usb_xhci_slot_enable slotid 2</div>
<div>41235@1610593645.417397:usb_xhci_queue_event v 0, idx 78, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c150, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.417433:usb_xhci_fetch_trb addr 0x000000016cf9c160, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.417473:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.417581:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.417651:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.417727:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
e8</div>
<div>41236@1610593645.417757:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.417786:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
4f8</div>
<div>41236@1610593645.417808:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.417855:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.418094:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.418165:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593645.418175:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593645.418183:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593645.418186:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593645.418191:usb_xhci_queue_event v 0, idx 79, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593645.418252:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.418294:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.418432:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.418512:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.418579:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.418627:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.418685:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593645.418731:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.418788:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.418831:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.418882:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.418925:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.418978:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419019:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419070:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419115:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419167:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419212:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419266:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419313:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419365:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.419418:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e4=
f8</div>
<div>41236@1610593645.419471:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.419515:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
508</div>
<div>41236@1610593645.419566:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.419643:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.479270:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.479408:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.479448:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593645.479481:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.532089:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.532114:usb_xhci_fetch_trb addr 0x000000016cf9c160, CR=
_ADDRESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002c01</div>
<div>41235@1610593645.532126:usb_xhci_slot_address slotid 2, port 4</div>
<div>41235@1610593645.532136:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7effea5b4de0, state undef -&gt; setup</div>
<div>41235@1610593645.532141:usb_host_req_control dev 2:4, packet 0x7effea5=
b4de0, req 0x5, value 2, index 0</div>
<div>41235@1610593645.532146:usb_host_set_address dev 2:4, address 2</div>
<div>41235@1610593645.532149:usb_host_req_emulated dev 2:4, packet 0x7effea=
5b4de0, status 0</div>
<div>41235@1610593645.532153:usb_xhci_ep_enable slotid 2, epid 1</div>
<div>41235@1610593645.532160:usb_xhci_queue_event v 0, idx 80, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c160, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.532180:usb_xhci_fetch_trb addr 0x000000016cf9c170, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.532203:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.532251:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.532301:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.532361:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
08</div>
<div>41236@1610593645.532393:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.532462:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
518</div>
<div>41235@1610593645.532501:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000<=
/div>
<div>41236@1610593645.532538:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.532618:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.532698:usb_xhci_oper_read off 0x0034, ret 0x00000001<=
/div>
<div>41235@1610593645.543159:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593645.543184:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593645.543197:usb_xhci_fetch_trb addr 0x000000007b19d000, TR=
_SETUP, p 0x0008000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593645.543203:usb_xhci_fetch_trb addr 0x000000007b19d010, TR=
_DATA, p 0x0000000033e7b100, s 0x00000008, c 0x00010c05</div>
<div>41235@1610593645.543207:usb_xhci_fetch_trb addr 0x000000007b19d020, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593645.543211:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593645.543218:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593645.543226:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593645.543252:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593645.543257:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593645.543418:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 8</div>
<div>41228@1610593645.543437:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593645.543446:usb_xhci_xfer_success 0x7efed4abd090: len 8</d=
iv>
<div>41228@1610593645.543452:usb_xhci_queue_event v 0, idx 81, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001</div>
<div>41228@1610593645.543479:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593645.543581:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.543622:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.543675:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
18</div>
<div>41236@1610593645.543700:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.543728:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
528</div>
<div>41236@1610593645.543751:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.543812:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.545138:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.545170:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a03</div>
<div>41235@1610593645.545187:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.545264:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.545290:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.545296:usb_xhci_fetch_trb addr 0x000000016cf9c170, CR=
_DISABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801</div>
<div>41235@1610593645.545302:usb_xhci_slot_disable slotid 2</div>
<div>41235@1610593645.545305:usb_xhci_ep_disable slotid 2, epid 1</div>
<div>41235@1610593645.545310:usb_xhci_ep_state slotid 2, epid 1, running -&=
gt; disabled</div>
<div>41235@1610593645.545317:usb_xhci_queue_event v 0, idx 82, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c170, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.545333:usb_xhci_fetch_trb addr 0x000000016cf9c180, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.545357:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.545387:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.545423:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.545467:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
28</div>
<div>41236@1610593645.545494:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.545517:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
538</div>
<div>41236@1610593645.545536:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41235@1610593645.545562:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.545576:usb_xhci_fetch_trb addr 0x000000016cf9c180, CR=
_ENABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002401</div>
<div>41235@1610593645.545582:usb_xhci_slot_enable slotid 2</div>
<div>41235@1610593645.545586:usb_xhci_queue_event v 0, idx 83, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c180, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.545598:usb_xhci_fetch_trb addr 0x000000016cf9c190, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.545620:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.545648:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.545683:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.545732:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
38</div>
<div>41236@1610593645.545771:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.545831:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
548</div>
<div>41236@1610593645.545866:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.545906:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.545961:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.545994:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a11</div>
<div>41235@1610593645.545998:usb_xhci_port_reset port 19, warm 0</div>
<div>41235@1610593645.546002:usb_host_reset dev 2:4</div>
<div>41235@1610593645.691480:usb_xhci_port_link port 19, pls 0</div>
<div>41235@1610593645.691489:usb_xhci_port_notify port 19, bits 0x200000</d=
iv>
<div>41235@1610593645.691490:usb_xhci_queue_event v 0, idx 84, ER_PORT_STAT=
US_CHANGE, CC_SUCCESS, p 0x0000000013000000, s 0x01000000, c 0x00008801</di=
v>
<div>41235@1610593645.691561:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.691589:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.691603:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593645.691620:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691631:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691640:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.691653:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691662:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691674:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691683:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691695:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691704:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691716:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691725:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691752:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691768:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691774:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691807:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.691817:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.691827:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.691836:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.691844:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593645.691852:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691859:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691867:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41236@1610593645.691873:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691881:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691889:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691897:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691907:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691915:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691922:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691931:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691938:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691945:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691956:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.691967:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
48</div>
<div>41236@1610593645.691975:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.691981:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
558</div>
<div>41236@1610593645.691987:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.691997:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.752101:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.752130:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00200a03</div>
<div>41235@1610593645.752137:usb_xhci_port_write port 19, off 0x0000, val 0=
x00200a01</div>
<div>41235@1610593645.752143:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593645.803114:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41236@1610593645.803162:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803208:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803332:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41236@1610593645.803381:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803437:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803499:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803538:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803588:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803648:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803707:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803765:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803810:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803900:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41236@1610593645.803951:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.807664:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.807687:usb_xhci_fetch_trb addr 0x000000016cf9c190, CR=
_ADDRESS_DEVICE, p 0x0000000034c10000, s 0x00000000, c 0x02002c01</div>
<div>41235@1610593645.807700:usb_xhci_slot_address slotid 2, port 4</div>
<div>41235@1610593645.807713:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7effea5b4de0, state undef -&gt; setup</div>
<div>41235@1610593645.807720:usb_host_req_control dev 2:4, packet 0x7effea5=
b4de0, req 0x5, value 2, index 0</div>
<div>41235@1610593645.807727:usb_host_set_address dev 2:4, address 2</div>
<div>41235@1610593645.807730:usb_host_req_emulated dev 2:4, packet 0x7effea=
5b4de0, status 0</div>
<div>41235@1610593645.807736:usb_xhci_ep_enable slotid 2, epid 1</div>
<div>41235@1610593645.807744:usb_xhci_queue_event v 0, idx 85, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c190, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.807777:usb_xhci_fetch_trb addr 0x000000016cf9c1a0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.807815:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.807924:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.807979:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.808027:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
58</div>
<div>41236@1610593645.808055:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.808071:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
568</div>
<div>41236@1610593645.808083:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.808124:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.809655:usb_xhci_oper_read off 0x0030, ret 0x6cf9b000<=
/div>
<div>41235@1610593645.809720:usb_xhci_oper_read off 0x0034, ret 0x00000001<=
/div>
<div>41235@1610593645.820346:usb_xhci_doorbell_write off 0x0008, val 0x0000=
0001</div>
<div>41235@1610593645.820450:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41235@1610593645.820484:usb_xhci_fetch_trb addr 0x000000007b19d000, TR=
_SETUP, p 0x0008000001000680, s 0x00000008, c 0x00030841</div>
<div>41235@1610593645.820496:usb_xhci_fetch_trb addr 0x000000007b19d010, TR=
_DATA, p 0x0000000033e7b400, s 0x00000008, c 0x00010c05</div>
<div>41235@1610593645.820503:usb_xhci_fetch_trb addr 0x000000007b19d020, TR=
_STATUS, p 0x0000000000000000, s 0x00000000, c 0x00001021</div>
<div>41235@1610593645.820509:usb_xhci_xfer_start 0x7efed4abd090: slotid 2, =
epid 1, streamid 0</div>
<div>41235@1610593645.820530:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state undef -&gt; setup</div>
<div>41235@1610593645.820557:usb_host_req_control dev 2:4, packet 0x7efed4a=
bd098, req 0x8006, value 256, index 0</div>
<div>41235@1610593645.820615:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state setup -&gt; async</div>
<div>41235@1610593645.820622:usb_xhci_xfer_async 0x7efed4abd090</div>
<div>41228@1610593645.820753:usb_host_req_complete dev 2:4, packet 0x7efed4=
abd098, status 0, length 8</div>
<div>41228@1610593645.820772:usb_packet_state_change bus 0, port 4, ep 0, p=
acket 0x7efed4abd098, state async -&gt; complete</div>
<div>41228@1610593645.820783:usb_xhci_xfer_success 0x7efed4abd090: len 8</d=
iv>
<div>41228@1610593645.820790:usb_xhci_queue_event v 0, idx 86, ER_TRANSFER,=
 CC_SUCCESS, p 0x000000007b19d020, s 0x01000000, c 0x02018001</div>
<div>41228@1610593645.820823:usb_xhci_ep_kick slotid 2, epid 1, streamid 0<=
/div>
<div>41236@1610593645.820928:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.820979:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.821049:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
68</div>
<div>41236@1610593645.821078:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.821103:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
578</div>
<div>41236@1610593645.821130:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.821253:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.824400:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.824447:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a03</div>
<div>41235@1610593645.824460:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.824567:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.824600:usb_xhci_doorbell_write off 0x0000, val 0x0000=
0000</div>
<div>41235@1610593645.824609:usb_xhci_fetch_trb addr 0x000000016cf9c1a0, CR=
_DISABLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x02002801</div>
<div>41235@1610593645.824615:usb_xhci_slot_disable slotid 2</div>
<div>41235@1610593645.824618:usb_xhci_ep_disable slotid 2, epid 1</div>
<div>41235@1610593645.824626:usb_xhci_ep_state slotid 2, epid 1, running -&=
gt; disabled</div>
<div>41235@1610593645.824636:usb_xhci_queue_event v 0, idx 87, ER_COMMAND_C=
OMPLETE, CC_SUCCESS, p 0x000000016cf9c1a0, s 0x01000000, c 0x02008401</div>
<div>41235@1610593645.824693:usb_xhci_fetch_trb addr 0x000000016cf9c1b0, TR=
B_RESERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000</div>
<div>41235@1610593645.824715:usb_xhci_doorbell_read off 0x0000, ret 0x00000=
000</div>
<div>41236@1610593645.824747:usb_xhci_oper_read off 0x0004, ret 0x00000008<=
/div>
<div>41236@1610593645.824781:usb_xhci_oper_write off 0x0004, val 0x00000008=
</div>
<div>41236@1610593645.824818:usb_xhci_runtime_read off 0x0038, ret 0x6cf9e5=
78</div>
<div>41236@1610593645.824839:usb_xhci_runtime_read off 0x003c, ret 0x000000=
01</div>
<div>41236@1610593645.824873:usb_xhci_runtime_write off 0x0038, val 0x6cf9e=
588</div>
<div>41236@1610593645.824895:usb_xhci_runtime_write off 0x003c, val 0x00000=
001</div>
<div>41236@1610593645.824921:usb_xhci_oper_read off 0x0004, ret 0x00000000<=
/div>
<div>41235@1610593645.828010:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.828084:usb_xhci_port_write port 19, off 0x0000, val 0=
x00000a03</div>
<div>41235@1610593645.828094:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.830634:usb_xhci_port_read port 30, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830660:usb_xhci_port_write port 30, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830669:usb_xhci_port_read port 29, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830676:usb_xhci_port_write port 29, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830685:usb_xhci_port_read port 28, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830692:usb_xhci_port_write port 28, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830700:usb_xhci_port_read port 27, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830708:usb_xhci_port_write port 27, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830718:usb_xhci_port_read port 26, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830728:usb_xhci_port_write port 26, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830737:usb_xhci_port_read port 25, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830748:usb_xhci_port_write port 25, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830759:usb_xhci_port_read port 24, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830771:usb_xhci_port_write port 24, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830782:usb_xhci_port_read port 23, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830793:usb_xhci_port_write port 23, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830804:usb_xhci_port_read port 22, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830817:usb_xhci_port_write port 22, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830827:usb_xhci_port_read port 21, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830839:usb_xhci_port_write port 21, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830850:usb_xhci_port_read port 20, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830861:usb_xhci_port_write port 20, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830872:usb_xhci_port_read port 19, off 0x0000, ret 0x=
00000a03</div>
<div>41235@1610593645.830886:usb_xhci_port_write port 19, off 0x0000, val 0=
x0c010a61</div>
<div>41235@1610593645.830897:usb_xhci_port_link port 19, pls 3</div>
<div>41235@1610593645.830908:usb_xhci_port_read port 18, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830916:usb_xhci_port_write port 18, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830924:usb_xhci_port_read port 17, off 0x0000, ret 0x=
000002a0</div>
<div>41235@1610593645.830931:usb_xhci_port_write port 17, off 0x0000, val 0=
x0a0002a0</div>
<div>41235@1610593645.830939:usb_xhci_port_read port 16, off 0x0000, ret 0x=
00000e63</div>
<div>41235@1610593645.830947:usb_xhci_port_write port 16, off 0x0000, val 0=
x0c000e61</div>
<div>41235@1610593645.830955:usb_xhci_port_read port 16, off 0x0000, ret 0x=
0c000e63</div>
<div>41235@1610593645.830964:usb_xhci_port_read port 17, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.830975:usb_xhci_port_read port 18, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.830990:usb_xhci_port_read port 19, off 0x0000, ret 0x=
0c000a63</div>
<div>41235@1610593645.831005:usb_xhci_port_read port 20, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831013:usb_xhci_port_read port 21, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831024:usb_xhci_port_read port 22, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831036:usb_xhci_port_read port 23, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831050:usb_xhci_port_read port 24, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831062:usb_xhci_port_read port 25, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831073:usb_xhci_port_read port 26, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831089:usb_xhci_port_read port 27, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831113:usb_xhci_port_read port 28, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831123:usb_xhci_port_read port 29, off 0x0000, ret 0x=
0a0002a0</div>
<div>41235@1610593645.831135:usb_xhci_port_read port 30, off 0x0000, ret 0x=
0a0002a0</div>
<div>41228@1610593661.563759:usb_xhci_ep_kick slotid 1, epid 3, streamid 0<=
/div>
<div>41228@1610593661.718275:usb_xhci_ep_kick slotid 1, epid 3, streamid 0<=
/div>
<div><br>
</div>
<br>
</div>
</body>
</html>

--_000_BL0PR08MB4676559855A6894E3B987514E5A80BL0PR08MB4676namp_--



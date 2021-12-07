Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4946AF2F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 01:31:53 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muOOe-00086p-5i
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 19:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <megamoix@hotmail.fr>)
 id 1muONV-0007SO-N3
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 19:30:41 -0500
Received: from mail-oln040092069074.outbound.protection.outlook.com
 ([40.92.69.74]:5263 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <megamoix@hotmail.fr>)
 id 1muONT-0001jN-Ax
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 19:30:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K15kUlBk1fhRehW3cZXya6Z/Q6NNrPhVgE/xEnPgnDaRvkBnomXM/0ZF6CN/K3Rb7uazN/bEFVg+Ox8oTiX7YVyrFJ5SjY1dWZzpytzS5WGcue2YHnWfONN0ch3HQWES7OxFPUxa+P6+5vORYZTlPyuargoNip35gjL+8EoDvodlxPxm0E6YcgJOQFoPsA6E30ZSJax6628xiPvfdPPp/cRTwMAkUy0CSA/6+WOJnqooz5PDm0voyy7f6XXAOicfzZk87Tq7EIaGgzvMI4vx3ed9leHt5ZAGJwXLzNQEOkD0BLaFvrmuLcH6S/NdgahdZBTXuKYDyzv7EKxSnJ+j5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM9Pm5t8oXkCczDguAfPwn/1GU6KOaFw41EGtOg1M9Q=;
 b=UN+DZAaRhk6ZMIUdzIjaSw7tlsjd1cfYfFxdE8ZszM+rsWLrSbu9ocnI5MCNUoxhjYKqugAs3IImLgt9osfoTXtFLnxZJUtOwyEoEX14CwP62j/t2M+yX2rB4g3kV4clhybZWkjskp584oLG24F5HgjtIW/nsSaDGkvkDZJeRFFy3c8QtlM85/C5cHECiA5fgqiAJuHTjFL781Ca2yaUAyaUbLFRnMQgTH6TUUZ7vBhUuhp5VG3qeaCxka9Ccu09z6jY/GwTNdHOXqegHdzkhuZl2CCstNrS2vmocKtofrbbMlU/H25TgmsRDaX5geP7fV1TGRXnTuF8ZSW6gFt6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PA4PR02MB7152.eurprd02.prod.outlook.com (2603:10a6:102:10b::22)
 by PR3PR02MB6300.eurprd02.prod.outlook.com (2603:10a6:102:72::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 00:10:37 +0000
Received: from PA4PR02MB7152.eurprd02.prod.outlook.com
 ([fe80::80f8:8576:9be1:eba0]) by PA4PR02MB7152.eurprd02.prod.outlook.com
 ([fe80::80f8:8576:9be1:eba0%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 00:10:36 +0000
From: Mega MoiX <megamoix@hotmail.fr>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Issue using few e1000 nic in xen
Thread-Topic: Issue using few e1000 nic in xen
Thread-Index: AQHX6vqCN+Mpk4d7PkSDlvcbF7cWeA==
Date: Tue, 7 Dec 2021 00:10:36 +0000
Message-ID: <PA4PR02MB7152DCD614B7B733E3B1DD78A76D9@PA4PR02MB7152.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7744ab96-6b46-f550-609c-a6b8dccb68e6
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Dze+4LVgOY50h2bVQJa7lt4FKC6HMEoO]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33112632-7595-4676-c2d9-08d9b915fecb
x-ms-traffictypediagnostic: PR3PR02MB6300:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZGbxppj9KsQ5rqrbFkMdckim/vy745uwrSDhaVSCIYiVkN4Gbh+2aTdtLp7fPRDM13QPcY2ndEAYkNORXViYXas5LhQorUfZAdTQ5SrnDE/4Oinq+EBTyuU8OqVHoo1MW7+29u5eLkJ1No+l5Jta+4G7yIAK1weoESN0ixobAB0WZtWIM00p9/rDsRqMDb4v8I2sJ/jHuVDG7GpvJpFII0ElMzA7cVbOMHx0ykiNwjgChhmUn9C8y0GBcrStXFv0C5bo2OXcJm6AdSotUx1Z5hXhryZtZiCeEgcypgd2EkuXw52TA9A3TQiSCpybYSIEHElcgChDuHNV+xx5P5qJjOlar3z8iy0zh9D7XFsKNXBkKQRivEuipUXkG7EqOJZAOMhQfnYJuyjKFWYt6zN69v8j2PI5V+Dv7TTyPb3ZDBeZgvUTYNT/j1Wm+PFyRWpRyWxy96sD7bkrOohtMY7t0w9mehUfH9UqgYBScaf/BBWwjyqttAaLq8y2pwKpjnECjdxfKwgz9RIRGxu/H7IgAk6vEl0j3NH12Z+1lF5DlI4zOv7Iiqq8pwI3fI0iMORZHgsqLNpbqYRhA0H38CD/A==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: IoTCOndPr4fmymDgiDrDmiEtaKSLhpVPvav8njZvhREDA9f40xwGk8oyyn5omO2DgBmwrJv0zcabl40paT0QEy1UZ+s5tRmUGiT4logYZ+W662WyWkiscb/6BbBk+QgoaBZ8299uue8voG9Nzx3QQIf7NDPTzUtL60sWWXXz6dC37CrXnVmL+Bsehjcax6lVfnOK9SeB6S10J26pwzHrr05n0aqeE+Meo/rB+xs2yoTlrwH7BWYwdVJpCfyAEU4nOjOOgPnHtjXBT3Ap6taR6TYVp1sjuyH2SkCLH/zmnsdIexZU+fYFdCbho1EWAgWtRrHeKoJ94sEzKgxKcqdR1UtkUfGDbYZRs7iXXXBoWPS15h9LDHmbgqAAUShx5L2xp5Z9Tf8T6gP7yoB19BtbnRrG8mC3rMmOELeKtcd+YYG0g9zWk98PGaCgPMODrLS8ZbhpRzlWrvIGf/7tGPJj8hnx8aRA9T+hr8WKVfs63At4uGQqABktJMeRrVpgRMguV+Q42irKmP2GO2YNJreodAm+N/XXVkd9SczvP7nGlfX79KXVtC6hjtrIz8kzlCW68tnfhaevsXfceivTO7HP2KUsx71HrTD3Iuhh9klvdVAhF+qp2i2qC7XqieKoQrD0dWkYO3rE+y1ceduBQarS4CkSHWpCvuNWQLBIZy0gYD6qqRjwLU1u3Bdpxs66QKbwg4wixZrEhPMyVbRZbag/XHFbeQ0XSkYWBcMdU1oaFUBodkECOiOOGs9uqodaOIHZc4Ezzu2iIhr/k86oNkfu4DL5r/iNvC3gWu91tZ99mx5r6lFOnf/K/LX20guYoRCcZw3TbEa7cJviszSz9dG3815XUsV0ERNhFRCWw/ygjbZ1MO/Eh+DOxEYFVfHboCrkpH5D8ddbKJPnBQfs8cM281wK/8uKeE6QlJHNJyq7D/IyzF4e1TY9SWXW9H3ScdQg
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-ab7de.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB7152.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 33112632-7595-4676-c2d9-08d9b915fecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 00:10:36.8729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6300
Received-SPF: pass client-ip=40.92.69.74; envelope-from=megamoix@hotmail.fr;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone,=0A=
=0A=
I hope everything is going fine!=0A=
=0A=
Thanks for your hard work;-)=0A=
=0A=
I am trying to migrate my personal environment bare metal from Ubuntu 16.04=
.x with xen like 4.4 or 4.6 ? to Ubuntu 20.04.x with xen 4.11 for nearly on=
e year now without success.=0A=
I use those two USB drive to boot so I can do trials with the new env, then=
 rollback to use the machine as before when I meet issues.=0A=
=0A=
And I have this old virtual machine that I can't modify, which is working f=
ine with the old env with multiple e1000 nic.=0A=
But on the new vanilla environement same xl config file with mutliple e1000=
 nic it doesn't boot cause it cannot allocate memory as it sems to me cause=
 of the multiple e1000 roms?=0A=
=0A=
Error is:=0A=
qemu-system-i386: -device e1000,id=3Dnic1,netdev=3Dnet1: xen: failed to pop=
ulate ram at 3100c0000=0A=
=0A=
Any advices to where I could start to understand this  ?=0A=
=0A=
Thanks in advance,=0A=
Have a nice day,=0A=
Best Regards,=0A=
Micka=EBl.=0A=
=0A=
PS:=0A=
=0A=
#!/usr/sbin/xl=0A=
=0A=
name =3D 'test1'=0A=
builder =3D 'hvm'=0A=
vcpus =3D '12'=0A=
memory =3D '11264'=0A=
=0A=
vif =3D [=0A=
'mac=3DXX:XX:XX:XX:XX:XX,bridge=3DXbridge,model=3De1000'=0A=
,'mac=3DYY:YY:YY:YY:YY:YY,bridge=3DYbridge,model=3De1000'=0A=
,'mac=3DZZ:ZZ:ZZ:ZZ:ZZ:ZZ,bridge=3DZbridge,model=3De1000'=0A=
]=


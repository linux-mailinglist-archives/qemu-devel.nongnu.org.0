Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE95ECF6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 21:49:47 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hilGE-0004Tz-KV
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 15:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <amarkovic@wavecomp.com>) id 1hilDL-0003o4-RQ
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 15:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amarkovic@wavecomp.com>) id 1hilDK-00020s-RY
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 15:46:47 -0400
Received: from mail-eopbgr700136.outbound.protection.outlook.com
 ([40.107.70.136]:62816 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amarkovic@wavecomp.com>)
 id 1hilDK-0001zp-DJ
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 15:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1NwcNmiC2/yMVxWnk+yV2YyJgH10AdQuaOVOXgqtpc=;
 b=aH9HWr8F3Php6NRNSnULpS5LmmR0aaCqv4iwevHk1SRi6MPQaaw8Qjr4QkBaivTTEyBalflPzpWsMBec+rVSLN8SNObaO23kSbZ8lOX6KEMp4hS4fGRc7JgHWhU2wMPwWFtyOBLjLUcdc6HEdIEYPa7tO0hizNodBRJnpGFPVBY=
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com (10.174.81.139) by
 BN6PR2201MB1234.namprd22.prod.outlook.com (10.174.81.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Wed, 3 Jul 2019 19:46:42 +0000
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com
 ([fe80::c4a7:ebf7:ad07:f5f7]) by BN6PR2201MB1251.namprd22.prod.outlook.com
 ([fe80::c4a7:ebf7:ad07:f5f7%10]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 19:46:42 +0000
From: Aleksandar Markovic <amarkovic@wavecomp.com>
To: Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>
Thread-Topic: [BUG] Inappropriate size of target_sigset_t
Thread-Index: AQHVMdW9rYddusddyUKgOhYBGFbH+g==
Date: Wed, 3 Jul 2019 19:46:42 +0000
Message-ID: <BN6PR2201MB12513A40434D1750AAF40020C6FB0@BN6PR2201MB1251.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=amarkovic@wavecomp.com; 
x-originating-ip: [82.117.201.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cf941ba-81c1-416a-89a8-08d6ffef2c2f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR2201MB1234; 
x-ms-traffictypediagnostic: BN6PR2201MB1234:
x-microsoft-antispam-prvs: <BN6PR2201MB123472ED8F0CEA6133679982C6FB0@BN6PR2201MB1234.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(376002)(39840400004)(199004)(189003)(186003)(256004)(476003)(102836004)(486006)(55236004)(6506007)(7696005)(26005)(71200400001)(52536014)(110136005)(66066001)(478600001)(4326008)(71190400001)(25786009)(81166006)(81156014)(8676002)(316002)(99286004)(8936002)(86362001)(6436002)(5660300002)(33656002)(3846002)(6116002)(2906002)(53936002)(66446008)(64756008)(66556008)(66476007)(9686003)(55016002)(73956011)(14454004)(305945005)(66946007)(76116006)(91956017)(7736002)(74316002)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR2201MB1234;
 H:BN6PR2201MB1251.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ej7CjligqCVZYz794cspko8MYdpr1Q5PmwA979AqT69ZycCE9kOLZRsQ9oJ9ogLaCPEJALH6XTS1MZLrikaXPbT80Se2mH4ZxmLS48PLgKd8n7TziByxWxgF3rgGh3dj9pMlBfrIoAGh7NNP+vt9Bgs59a6890Te4aCFGS1GUrw6Ltlwny31m7p1bVqt+eoJUbj9z4ZbNC0mSiF6ZIeCSmzn3Vs1AxPuUtP9f0nHOb6ZauRyezjRqcru1MV+24PYdOZS9guP/jbrBf7RUwxUO9TFpzRv10/3UBYuvsJGbbr/UTQX6eERS4rVfC4kBKJ/5y3OPO88Hci0Oaqyg4Vh0CsmXttY+HCocGM5pEeMXu99J3wwnuYzdGO1qjUBEJI4MkZDLvZ7fy/TWF2KxG+SmC2xXPGdZc1cK8+1ijzugjU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf941ba-81c1-416a-89a8-08d6ffef2c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 19:46:42.0411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: amarkovic@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1234
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.136
Subject: [Qemu-devel] [BUG] Inappropriate size of target_sigset_t
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

Hello, Peter, Laurent,=0A=
=0A=
While working on another problem yesterday, I think I discovered a long-sta=
nding bug in QEMU Linux user mode: our target_sigset_t structure is eight t=
imes smaller as it should be!=0A=
=0A=
In this code segment from syscalls_def.h:=0A=
=0A=
#ifdef TARGET_MIPS=0A=
#define TARGET_NSIG	   128=0A=
#else=0A=
#define TARGET_NSIG	   64=0A=
#endif=0A=
#define TARGET_NSIG_BPW	   TARGET_ABI_BITS=0A=
#define TARGET_NSIG_WORDS  (TARGET_NSIG / TARGET_NSIG_BPW)=0A=
=0A=
typedef struct {=0A=
    abi_ulong sig[TARGET_NSIG_WORDS];=0A=
} target_sigset_t;=0A=
=0A=
... TARGET_ABI_BITS should be replaced by eight times smaller constant (in =
fact, semantically, we need TARGET_ABI_BYTES, but it is not defined) (what =
is needed is actually "a byte per signal" in target_sigset_t, and we allow =
"a bit per signal").=0A=
=0A=
All this probably sounds to you like something impossible, since this code =
is in QEMU "since forever", but I checked everything, and the bug seems rea=
l. I wish you can prove me wrong.=0A=
=0A=
I just wanted to let you know about this, given the sensitive timing of cur=
rent softfreeze, and the fact that I won't be able to do more investigation=
 on this in coming weeks, since I am busy with other tasks, but perhaps you=
 can analyze and do something which you consider appropriate.=0A=
=0A=
Yours,=0A=
Aleksandar=


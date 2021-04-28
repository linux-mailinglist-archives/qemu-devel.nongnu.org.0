Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3558F36E102
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 23:35:03 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbrpm-0007ov-99
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 17:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1lbnkq-0000Lk-5n
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:13:40 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1lbnkn-0001Ct-6o
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619630016; x=1620234816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SrWEjZGeoKr5e+Fclx9TnalV0U2dOwwtUiovQyD88ac=;
 b=sfnrV4/b0AkFO/M/EqOz80L5YpStNy5qTUv5ll+8tI4FhS8M2u/Hm5KL
 8LHu2lW0KVIi32x1EuB9XjRYK+y4v4fyUH/TLK3grqSiwLzg1tEPVYA+y
 r7JBr1ttamY/rqFY+bJEMY80kDjUtfQRHI0Np1q1S27qeu/hm/UomF39M Y=;
IronPort-SDR: R+jcR22mF8pDkJi6BHFXl3IzQ/7b0CeXN2vJgKdyZOIX4IUPpx6KKc50mkHJuy7SI+aDalGFm5
 2xkqRM1UkTjk6dn5fgNvaz+eyGBSvWZ4S/OPHdVw4RzPv+tqvg/fu/yDbS2JvO9aLmNOWLyRkl
 uEXEQUCcm0WRxGAtZ7XM8+KKsOgEI4uaVYgrXP+ftoHAzT58bKHksLKzMlqJyjUt7YgeydUp99
 fE0fUF+QxjX4M4IRO7ActAsPhZe0X24mqIE0qozZx0CR9QUeaArD54YO1o7SuJOCNJ7h2ET+eU
 gi0=
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 30163
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 17:13:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXD8vvvHFh5Q4bXW3BUfi8pFjMgl5OGKqaUsjD366CVvX7oDkqjI790PPGxYqHY5Mn5j5WMz7fHSnloFpZGX71Fejqvq+M3YcYzZFlsqBtKeyV8NMNZZON3p8tuIvv/yrwv95jQVnDfoeKkMYzcEWgffCyWJDSafn1A+5/kcItG9my39XkTByV0J78cCtkxIPK1yL1kxtzuAWKBNy5BxrTbWl3b5uTHo+Iz+u+tDgaPdB1wA5kr+ymEEe1RYNPagViCDGK9VCAAoSxJBA9hqNUwZClJoOW9tgy2PXXILvMI0mpQ67GpM+7J7aED9tkdL8GquPFuqUxT6KKmLgXvkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR352cDrDmZUtd0ZrA0fIPtMJmUN0AwXT93caN5qdEo=;
 b=D2HMzj+LBn2bJEzc3z1GIgSjox2GfxYtu8duYqHLbFvp+h1Dk6bkZIGBh6zGbnq4yRBxpqyOlbW7dxt8BhUEJaBwNhpDHKMW8hrj3vJXg5EnoNl4aM7aasE0UdofFGeKygAcOVDSVnvGQAixBEpsjQO8O/0reLeTUwBwzAuWBJuSRYT9fjIytvdaJwjj/ve3LegdQC5zYnpy8O7BzyCiKPDJ+1a8yEE0KDrmCsiJ/lyU/yhTwd3dzj+P2DFmuxLRk1ncp5aZnhDcsqlguM5p8pWcG2M9l8j1aEv+sZRE2pZ/tfzzpnkvBzj+ombnvaYox5oEGl/19BbJJvHOIFKdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BY5PR02MB6931.namprd02.prod.outlook.com (2603:10b6:a03:232::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 17:13:32 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::e84f:f62a:4384:b16e]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::e84f:f62a:4384:b16e%6]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 17:13:32 +0000
From: Trilok Soni <tsoni@quicinc.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, "stratos-dev@op-lists.linaro.org"
 <stratos-dev@op-lists.linaro.org>, "rust-vmm@lists.opendev.org"
 <rust-vmm@lists.opendev.org>
Subject: RE: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Topic: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Index: AQHXPCk3ArzJr3k09kiUN4EG3FfQgKrKKVcQ
Date: Wed, 28 Apr 2021 17:13:32 +0000
Message-ID: <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
In-Reply-To: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.176.58.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efec7755-6ced-4bbc-6011-08d90a68f357
x-ms-traffictypediagnostic: BY5PR02MB6931:
x-microsoft-antispam-prvs: <BY5PR02MB693180BA50E77323424F8039B0409@BY5PR02MB6931.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nX2gA8UNhvtot8hIrj8LFSZhED4eeJF37Bc56Td6Er65WHH7b2jVqp2KfM9ruVr1Nwn12x1/SSP2QZzFSQt37J3gMHIxMGtYmav1oac9WetSWbRNsVSqyVEJV7m41xlYYB1W0TRsAGzis0AbyDQpdkRmdJuJHXalYpTigyZFDysvGNsDXIu/wxNMCeHAwMfulbbjKLi2IHU+lqf04FKktrdy9FVCqQXw5f11zT1cqezw5yybj2MO4qT8hOXRgeN9WUcN2pO+4UqHlXx8uIT2hgRh/qx47DKb/L6V3Sqj6xnvTMikwzTvsrwHBUV2DZIdgzdx/iy17/2DGFZOG6m2WL3vMQK2is30A70jZVDsY3QDwYboDybKZi1naVLQP3GV3VQeybs5pSUJb40F4exuwprVNw2n0yV2XSp56RsjjrlKxyMQTkMh6XrKxTORhdQO6Ivz/LUoPgEXMRfitbwkyihHs1FMr7yDz2AlNPhla5AmCLQcLPFFHN5MEf1M3OqxZmBb+haeMUi0am430LfaTyDk6g9c6fR8aTktHRXJ2VVjOwARGLu6Y9G1REBJarHSSM9DCUJWrQaJ5CKUg2lJ7gcE9WC97i4njYcE2vjmIuYc7sZVZcgpNWrfzeKVxMhE16u+WdncPX067Re5YkLTkdzVbnwPb8kgrn/+74k3e7+CFgkYJ9WEOFwh5gAKxlNYrBu/AOFV3h/nu5CIbLEzOLcUWmZHRe5YNgUIz7nMuRg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(76116006)(122000001)(6506007)(66946007)(52536014)(53546011)(4326008)(33656002)(110136005)(8676002)(66476007)(38100700002)(7696005)(54906003)(478600001)(66556008)(7416002)(26005)(86362001)(9686003)(966005)(66574015)(55016002)(316002)(5660300002)(83380400001)(2906002)(8936002)(71200400001)(186003)(64756008)(66446008)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?Y59BkFucfYQmNH217xyz/OSsI6T4RnFfnLDJ3CMBn/lOfQRYGsDwZtd6Il?=
 =?iso-8859-1?Q?hgwMjCaFR0UflxjlAJGUbkNXAuqPrrBGwjGdNp+PvmRfJ1aQdqxSqcBLH6?=
 =?iso-8859-1?Q?zERFlZDpLij3X6MQuni/rY0AMpyEyKp9cDkES3CEmNl3Np+gnjyp5NyJZe?=
 =?iso-8859-1?Q?4gKxvojqpfqAchf0qvuQTgPEQMISoLMjQVrww7qrp9s73i3kMAlW9K0fca?=
 =?iso-8859-1?Q?Vw4rrrMijEaxwBNlotPU0cuRX0gQ9O/0IHyzByVqpQWUxh5mao2EJwpcoy?=
 =?iso-8859-1?Q?w+SoL7EhsTHydWe1M6mjNwhv/mekwTx/sH4uDwxV/YuhioBN8g1B9NHlhJ?=
 =?iso-8859-1?Q?BlUlPplR6MUxoKfUc+V/mlf/jpghKv9X8rDKX89OB1f7sn8eJj4Om+RA6O?=
 =?iso-8859-1?Q?nR/MXouPgT7FJuXPKHwnVF60SB71Ez41vhZyr42Q82uGeUmE8L1+5DgKOU?=
 =?iso-8859-1?Q?ffFPYR0Wz0T3P5IQIQd08VIYhGNc2kW7ZzbZzuh2siPdOa6k9rofIgl8/C?=
 =?iso-8859-1?Q?B8f32+WbhgSrYMdrByqRnTYTzmYF7pYbuH2iytjdl7EQT718TUrrIu7n0P?=
 =?iso-8859-1?Q?SwPAePmzVnDdgQpCA4hHMoi217S72Z9/vetxsKYUr+LHFupJURbCrnBJg3?=
 =?iso-8859-1?Q?2FjWMM0Dj15nrnUSgL3G6yLUyXRTM8J8WeIIb5yRLQ+ZX1MBx/b7PNf175?=
 =?iso-8859-1?Q?EmYWcLj5swOFYHnGOIwFF/Bxx2JVMpUMhAnye/dXPKz3x3uab67JVpK7av?=
 =?iso-8859-1?Q?l3ly2AGRqv/pUSqCV4io5eBHn5095X1TLtDf6vbUvcMwFN/PgL1LzPOqMO?=
 =?iso-8859-1?Q?NC8FEsuU1Sw359xcmxGKCjPSww2pScv/Nx4znrGy0XQOSyp9cpi8mznrXl?=
 =?iso-8859-1?Q?W3fTIO8KIggBWecEU5UHynauJhE3uU+7b5mSw8TYmhBO7N4DPKkXOBfZS/?=
 =?iso-8859-1?Q?8mEgzrt5SsQlu5eK3tGYI24B0HLf94RrrL8xmUeoQXtei5I9zvil9/Td5i?=
 =?iso-8859-1?Q?QLfy5Oj/VvorlOwrtL89xkcWLy+VCsrMBmTF0d87M4qskV/ieglrxArty5?=
 =?iso-8859-1?Q?Aj9JJot6OpykPh9Ke80tuDBuHS/XvRWRoioFG1bGVz1i5MN2WjA326e5Cb?=
 =?iso-8859-1?Q?o8mZAmWIP6Ps/R3cKJCgV7iF+BVzrFL5mPATSI3LUBpmhBYa7zS23wdkqk?=
 =?iso-8859-1?Q?kPpQjLUfGBH+uxhgfWlkruYELAHL3Qj3EKzPTTLV+4Ttq/CZijRl89PLXM?=
 =?iso-8859-1?Q?uChLMcqa0/iQcRWo/65HLHS4wKx/CngI7KLtFHIBt0xYY18W/Y2Nw1t36f?=
 =?iso-8859-1?Q?6uyl0tPTLd6gWyBVDHFpLKw4yrPXKT7haq/zd/9eyKz6Zw0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec7755-6ced-4bbc-6011-08d90a68f357
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 17:13:32.3499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C34aKwiuEmOsIdsaVP6AlvD4tVUhlCaKNbvF6n1SAvApcWkGfpqtHWt5ks59B2bopJXkL974Ga9F8//siHr33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6931
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsoni@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Apr 2021 17:32:10 -0400
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Viresh,

For rust-vmm, you need to create the new issue in the right project. You ca=
n probably pick up vmm-reference project at rust-vmm and ask for the new cr=
ate. You can also send email to rust-vmm mailing list but github "issues" f=
eature is used heavily in the rust-vmm project. There is also bi-weekly mee=
tings which is attended by me, Vatsa and rust-vmm developers where it can b=
e put up as agenda.=20

The minimal requirement for the new crate is to have less (or almost none) =
dependencies on other crates so that they can be independently tested in th=
e rust-vmm CI. Anyways, please file a new issue and I will ask Vatsa and ot=
hers to comment there.=20

https://github.com/rust-vmm/vhost-user-backend
http://lists.opendev.org/pipermail/rust-vmm/2021-March/000406.html

---Trilok Soni

-----Original Message-----
From: Viresh Kumar <viresh.kumar@linaro.org>=20
Sent: Wednesday, April 28, 2021 5:23 AM
To: stratos-dev@op-lists.linaro.org; rust-vmm@lists.opendev.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>; Mike Holmes <mike.holmes@=
linaro.org>; Bill Mills <bill.mills@linaro.org>; Alex Benn=E9e <alex.bennee=
@linaro.org>; Arnd Bergmann <arnd.bergmann@linaro.com>; Jie Deng <jie.deng@=
intel.com>; qemu-devel@nongnu.org; Trilok Soni <tsoni@quicinc.com>
Subject: [RUST] Add crate for generic vhost-user-i2c backend daemon

-------------------------------------------------------------------------
CAUTION: This email originated from outside of the organization.
-------------------------------------------------------------------------

Hello,

In my earlier attempt [1], I implemented the vhost-user-i2c backend deamon =
for QEMU (though the code was generic enough to be used with any hypervisor=
).

And here is a Rust implementation of the vhost-user-i2c backend daemon. Aga=
in this is generic enough to be used with any hypervisor and can live in it=
s own repository now:

  https://github.com/vireshk/vhost-user-i2c

I am not sure what's the process to get this merged to Rust-vmm.
Can someone help ? Is that the right thing to do ?

-------------------------8<-------------------------

Here are other details (which are same since the earlier Qemu
attempt):

This is an initial implementation of a generic vhost-user backend for the I=
2C bus. This is based of the virtio specifications (already merged) for the=
 I2C bus.

The kernel virtio I2C driver is still under review, here [2] is the latest =
version (v10):

The backend is implemented as a vhost-user device because we want to experi=
ment in making portable backends that can be used with multiple hypervisors=
.  We also want to support backends isolated in their own separate service =
VMs with limited memory cross-sections with the principle guest. This is pa=
rt of a wider initiative by Linaro called "project Stratos" for which you c=
an find information here:

  https://collaborate.linaro.org/display/STR/Stratos+Home

I2C Testing:
------------

I didn't have access to a real hardware where I can play with a I2C client =
device (like RTC, eeprom, etc) to verify the working of the backend daemon,=
 so I decided to test it on my x86 box itself with hierarchy of two ARM64 g=
uests.

The first ARM64 guest was passed "-device ds1338,address=3D0x20" option, so=
 it could emulate a ds1338 RTC device, which connects to an I2C bus.
Once the guest came up, ds1338 device instance was created within the guest=
 kernel by doing:

  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[
  Note that this may end up binding the ds1338 device to its driver,
  which won't let our i2c daemon talk to the device. For that we need to
  manually unbind the device from the driver:

  echo 0-0020 > /sys/bus/i2c/devices/0-0020/driver/unbind
]

After this is done, you will get /dev/rtc1. This is the device we wanted to=
 emulate, which will be accessed by the vhost-user-i2c backend daemon via t=
he /dev/i2c-0 file present in the guest VM.

At this point we need to start the backend daemon and give it a socket-path=
 to talk to from qemu (you can pass -v to it to get more detailed messages)=
:

  target/debug/vhost-user-i2c --socket-path=3Dvi2c.sock -l 0:32

[ Here, 0:32 is the bus/device mapping, 0 for /dev/i2c-0 and 32 (i.e.
0x20) is client address of ds1338 that we used while creating the device. ]

Now we need to start the second level ARM64 guest (from within the first
guest) to get the i2c-virtio.c Linux driver up. The second level guest is p=
assed the following options to connect to the same socket:

  -chardev socket,path=3Dvi2c.sock,id=3Dvi2c \
  -device vhost-user-i2c-pci,chardev=3Dvi2c,id=3Di2c

Once the second level guest boots up, we will see the i2c-virtio bus at /sy=
s/bus/i2c/devices/i2c-X/. From there we can now make it emulate the
ds1338 device again by doing:

  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[ This time we want ds1338's driver to be bound to the device, so it should=
 be enabled in the kernel as well. ]

And we will get /dev/rtc1 device again here in the second level guest.
Now we can play with the rtc device with help of hwclock utility and we can=
 see the following sequence of transfers happening if we try to update rtc'=
s time from system time.

hwclock -w -f /dev/rtc1 (in guest2) ->
  Reaches i2c-virtio.c (Linux bus driver in guest2) ->
    transfer over virtio ->
      Reaches the qemu's vhost-i2c device emulation (running over guest1) -=
>
        Reaches the backend daemon vhost-user-i2c started earlier (in guest=
1) ->
          ioctl(/dev/i2c-0, I2C_RDWR, ..); (in guest1) ->
            reaches qemu's hw/rtc/ds1338.c (running over host)



SMBUS Testing:
--------------

I wasn't required to have such a tedious setup for testing out with SMBUS d=
evices. I was able to emulate a SMBUS device on my x86 machine using i2c-st=
ub driver.

$ modprobe i2c-stub chip_addr=3D0x20
//Boot the arm64 guest now with i2c-virtio driver and then do:
$ echo al3320a 0x20 > /sys/class/i2c-adapter/i2c-0/new_device
$ cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw

That's it.

I hope I was able to give a clear picture of my test setup here :)

--
viresh

[1] https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@li=
naro.org/
[2] https://lore.kernel.org/lkml/226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1=
616493817.git.jie.deng@intel.com/



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96136E106
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 23:37:29 +0200 (CEST)
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbrs8-000138-Ky
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 17:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1lbnmX-0002B1-PK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:15:27 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:50573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsoni@quicinc.com>) id 1lbnmR-0001sd-IK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619630119; x=1620234919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4MXZUzMzA37OHxVHPH0ZGAChUQuRcbRblBwgGMasenw=;
 b=ZddM0gYO8XCu18YRzn+GeCm0xtC6acBC92SADZZ2IGNpOj89w0uVbA0e
 yt+32FYIjGrzJw402eGFtrt3XKhKpnO5EIqDHarWA8J8tHtF3KrDESZ8o
 ABgJZhSOCEIC+DcU1eqPNWFyPpDxo6r86NZuS+Mu8d353bJ9ucdswcbVv k=;
IronPort-SDR: 7x0DHLR1VhMkAQ94smcHimBv8zDgpyoIL52bRWSUYbQXvYWefUVZ+FRXGN3dT+DV/BrCz3T3Cf
 dpNeQskjjupWk1DckdhOADrSZgjhc0sGpSrhP1UlDNTzvpQbwI1RyuFQfrUiilyZdq4r1SgERw
 sIyreZrNT1SoNamzwcbJ4vhtpZ8IX8UZKSZG+wipmeSlmB/H0TI5CEBRbaviP+VOsAfUJ2bm/8
 tndZwkbU6NsN96wj0laPNbfNGYtjSIzVHUlGMf/+oXKLotLD1SwzDDahC60meizxsNJ9Uy6Mpk
 KkA=
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 30152
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 17:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hsu4gF+yExwb3F0hDHrAbWi07WtB/oP5cH4SkRNSEN3CyW9TRyyNiktP3J5tUlztPEMnqr7Ic3lLlJE0MbeE3yhUIqDBzqB6DGXXp+Oyoyw2pmkem8Qnum2UHcYMGU7siUlMpZqINoF/9ksvIWIixpaGEF85YCN+M4ZSD4iwJ0hYcZBfeR64Ws7Vzi0Dt85IS2Tu4dYRRAPnuY+rYjz8Lj7GM10B8uW3ASLxONGH7XvH++vFXWw+AJUVUlJvy1bsEIgOS5iaOXjysExAVCv10YC4wAfCzwtiKcmlOkWJ4ZvNqT93f/1ngrOa59VltkOGw24LjilbuLIuapjJwpA1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdI8LCfamTUTJEHPmVdZmmSD6XsYL0I4e0P6O9JJA/I=;
 b=bfmc6+waWguO0tbQy0BhuFADyFPPYYz8a/9SDjLc61mzwS/5dfev7iLV6q8oY1X5b/NQFqgTr9+Ehyle2A8vQIB4oEKbMK5r0VM5ox0rFhEcFf10HwSE80T0OHAQSO6/jN9SLiOEcWTD31BEi8AN8AgrRbnAYLpn+k8aqoTTqhLypyCkJmfQx7FmAwL92kEXP6Aqu97RoMRppaM/ruNkru5GpE5NwCG9pGju7l02yt+8hIWO5+ZOa95EdjqAxMvaX+CZjf4jcjxV4AyD7DgQ6s81TWrWFdTZ5Boo77wV2sCD3W8B+2FiUb3unW5iblk7f2mQpoFxdlKtg1/9SDFuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB3976.namprd02.prod.outlook.com (2603:10b6:a02:ff::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 17:15:08 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::e84f:f62a:4384:b16e]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::e84f:f62a:4384:b16e%6]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 17:15:08 +0000
From: Trilok Soni <tsoni@quicinc.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, "stratos-dev@op-lists.linaro.org"
 <stratos-dev@op-lists.linaro.org>, "rust-vmm@lists.opendev.org"
 <rust-vmm@lists.opendev.org>
Subject: RE: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Topic: [RUST] Add crate for generic vhost-user-i2c backend daemon
Thread-Index: AQHXPCk3ArzJr3k09kiUN4EG3FfQgKrKKVcQgAACSUA=
Date: Wed, 28 Apr 2021 17:15:08 +0000
Message-ID: <BY5PR02MB67723D1A938BF34B1C5B363EB0409@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
 <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.176.58.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfe88c8d-53dc-46c0-7edb-08d90a692ca1
x-ms-traffictypediagnostic: BYAPR02MB3976:
x-microsoft-antispam-prvs: <BYAPR02MB397637B7BD19133A80106301B0409@BYAPR02MB3976.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t2XTIknutJ5k4I2NNNMz10CZc1q8233rIxO2PGtY2I5HnYVsuYpC/aJz5e6jRiqT6p4Emtq3QmLGZuS2gdaKJ1Oc/ug0DA1yw2m2YFLvAkjVnuFBJJr134fJJniZoCw+Vb55doygb7lV2OhR1ZcF2e/7ZqvXt5FRvWmQU4vaJbda8V0/jl/Jlm/bPjICWnTHglMfICY6nvu+n7NjyeRLrDbiQpTtt3uwNzr3neuk20Mc0klmMTnqUEeE+AlH1HbsK25k+u+Q8L4J+iGiknPpRdr10oKha9CTQHfNj4PI2SnyXm98VLyptz3kidaYW/l2dnoZWjU3aXWX4ITheRxtxcZuN4xmBRBfZj8fvWf4O1SsCu6goA5fHuxcXumXpy2iBnBk+EGqZOJo4mB6Rx25RpqCChh1G8btBshkPD+e9BEL9Rl6syRA55p4yp/MWhDLdtzz5PEHywWELxKUYxg3bKq0mMxTJcVh/eJHe/KKXpBdH22pZc617CPKymC0Vag9bLdjWqtmsycCWuk0t8D1V5JT4l4j2jL02hVw5flTKFLaVUOzOH+TDYvluJP6IVPvGSFM/0sJicYy9Yb93iSPhRusFmscUGGCfAPa/KQ43d7W5XC4Z4jmqCT3tdvLS1vfpfgdpHitsW2++58tsokSf/cOJOF4JYrd/ZLEtSMGpOx7C0gpgLlngdDG0dIy73xvRWlTMUMfrgY+1POdogbtSV2j3QkmMHMZQ1U/ubYI0cc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(55016002)(2940100002)(71200400001)(2906002)(7416002)(38100700002)(4326008)(316002)(53546011)(26005)(9686003)(66556008)(52536014)(64756008)(122000001)(186003)(54906003)(6506007)(76116006)(66946007)(66476007)(66446008)(110136005)(7696005)(5660300002)(966005)(8936002)(86362001)(8676002)(478600001)(66574015)(83380400001)(33656002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?WHsCkRcxkBE2O238++Hb57z+XLcGr5fHegbI4xtz1T1Tj4rZLTjAEJcmhB?=
 =?iso-8859-1?Q?LiRJXE36qi1JCSjP99xUoJX6GI63IJtSehHdMoGL3FFzQ1/UXoklh18YhZ?=
 =?iso-8859-1?Q?9Cl1Ge3py45vl0K2/zidYtXKYFxszrGGwYVr277eLG9xzlWAbtC++M8md8?=
 =?iso-8859-1?Q?3bm6ZA7Kf2vRUnIMC8Hfq2zzSYSb9oYe3wd1Eq8LUZJr2LpG6T/mf+JuC1?=
 =?iso-8859-1?Q?Vy9I80m4qjJroujLYJ0JhavcwxcEXOfATOjRiF4mAlIomp/gtf8HDVnKHt?=
 =?iso-8859-1?Q?9cHn9z2uch8Q+xNJjkB0dIkDTOYvd3EJG4DPy6XKtwCFE7cadsRgKw/4cC?=
 =?iso-8859-1?Q?lpM3PaH8ZcI/mcPud4JVYBgEY2mMe0xSCRpCvHs0qAOEIjPhlaR4l07KYr?=
 =?iso-8859-1?Q?ST6fne63xnIM6HxWE1DiJraItn1+SpDcEor7djl9DuArD2QMDEgbhVLcbP?=
 =?iso-8859-1?Q?QzjeAYaZjywCu5nJoc9L2BDhjI0VpN5T8222olxEitPY+NYI9Qd745djj2?=
 =?iso-8859-1?Q?JxVG9YtjihJVLJEaB0/N3WeUS+mm6h/GqYqcIao5vkribuP+DMkR8FkM3f?=
 =?iso-8859-1?Q?2bivMOJ2TshtnFdKdnDnVnm/p97VshMNI9XTFp+ZxuZ4CXCt2ZhPABchjj?=
 =?iso-8859-1?Q?ltX+LJSEmYol0vSt7Pgt7S/1qhrOjbFSb7EC/9/VAhPW1BmXIew4M4oDE3?=
 =?iso-8859-1?Q?A4FagLus1vRFfF33pSw0BouUHiQ+ZNiUrP90nPiL74ADwpsrUXU2Ha5p21?=
 =?iso-8859-1?Q?OtxbNWiHOUe86gzyaJnbFo6VYaWTBTokPsRHOPl7USfmg2/NnoO99DsIDJ?=
 =?iso-8859-1?Q?X0OKwgd6utmmxKV6lLTSsSesk1tLbl3zcg4LuAHHFD8utUt3iM7HjXuPoi?=
 =?iso-8859-1?Q?o+gKnfHx2JffcFJYSvMxZZb/IzK+qdHXf1Jzft8KUtEcQFLAhRMQv3dX7C?=
 =?iso-8859-1?Q?wBRHVQZX3YX31Jvm/gps+kf9TdJI2WL6tis6pMZ3LYqxWVUZj12+hkJhap?=
 =?iso-8859-1?Q?bcdvQ1kxltIMdnB5kobvvPSn33mQ4ABpU3CZbmsRthWEERETtFIaLdwBi2?=
 =?iso-8859-1?Q?SSbWTXpZ92vToxgTWtFf4PNBTSxnOIPcWKxW+VdU1PJfS9m//5Ib8jMlVD?=
 =?iso-8859-1?Q?A8Lur5Fh5GjSqCN9JvkylMqGglVG/3c45IZUS+EUgBN0RPuysGH4xw74zd?=
 =?iso-8859-1?Q?6bRkxySy5bt9bxFeNl1g5XRjaDSx1n0Qo57axL8j05DMhG8610D95+QuYb?=
 =?iso-8859-1?Q?PaJJOix6Rfl7p03qBwIJXkpRs0Ycdl6pbKL5M1n8MbQ5JleaGYmlzkZVId?=
 =?iso-8859-1?Q?uLvFU4nm0jUPaK90ZGJmljB0LMAzZ+fs0f6fgaIXMG66o04=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe88c8d-53dc-46c0-7edb-08d90a692ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 17:15:08.4767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXTj02o1nHQlWba+hUgqNzMX5qaeHTnVwWNNC56VT4zCq6nwcj6FhUZvzu7a4NEJGM7ebtBr84OFUxDHPmuO5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB3976
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsoni@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Apr 2021 17:32:12 -0400
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

Hi, I didn't realize that you had already CCed the rust-vmm mailing list, s=
o anyways it is a good start.=20

-----Original Message-----
From: Trilok Soni=20
Sent: Wednesday, April 28, 2021 10:14 AM
To: Viresh Kumar <viresh.kumar@linaro.org>; stratos-dev@op-lists.linaro.org=
; rust-vmm@lists.opendev.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>; Mike Holmes <mike.holmes@=
linaro.org>; Bill Mills <bill.mills@linaro.org>; Alex Benn=E9e <alex.bennee=
@linaro.org>; Arnd Bergmann <arnd.bergmann@linaro.com>; Jie Deng <jie.deng@=
intel.com>; qemu-devel@nongnu.org
Subject: RE: [RUST] Add crate for generic vhost-user-i2c backend daemon

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066B3F7561
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:50:50 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsMj-0004Iu-5d
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIsKj-0003bl-OJ; Wed, 25 Aug 2021 08:48:45 -0400
Received: from mail-eopbgr740090.outbound.protection.outlook.com
 ([40.107.74.90]:6073 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIsKd-0004js-PK; Wed, 25 Aug 2021 08:48:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQH5EOuuVMSvfJ2A7Y5FQl20JA9Vm/SGZNIjAGP7Ej7SBHz+0Uk4MbDkBReBTdb0bYcZjl1fhHT18Csdq3UOa+Hcl5Y2Fv5eU7QRSHUSQ+oHZqYovKmlYDOECbaxVCuQloO64+19hZUTmCJZsEiyWZbvHs/aw0x8HcEJbX+nKgAH6rPnP9ZVQ7EcOaKsbTkPO6JA41k4ORS/+LP+xia/UjmVoUi6l9ezDLEary4b0dtV9oa8k91eq/8eN4b20bQuzxKTrl9WnPmzefd7pRuB/PsRJOFJCjk9Xfsq4EWThXakHTtjs232gAj7IgWpylg5Pkosg0Cq3TSJg8kiaEXipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=facyRYPXTZUKXSJLfJvXZ9w8A+pLOxkHjpf+ulEXacQ=;
 b=JQfMyybrOEl+vzFqkNT9xS3TWZ3pwnSL8/2I4++GSxWHJD49zgCgs65Pa6RsVZSqP8dbfKE+L/rim4bvgtD3SkvXiGcVXklYQDtHXCrRS9vRkfpJNQONZwWLHPEF55jJmm7yp0LbtJMxsAicL7GGXWfYEn22EIQCIfC1KvhJUnC9O2UGGU/cNj8m1XbPmy375THSvmKbT57DdNKfNrGW/xh/sbgErNvrU2P2RnUJ9QZwaCYHjGEKkUkTQ4Ix0tfi+xwkmJWzrClMks4kmDtjCw0kDUY+KDxAEFCyXFiAQR8mBrxvbqS2oywFhlf33JcfY/Nq+a0x0TzxiGHF0P2OVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=facyRYPXTZUKXSJLfJvXZ9w8A+pLOxkHjpf+ulEXacQ=;
 b=PNvH6/+LJHq39FyOkQSBC0+6zX9/D8bBXuFIQgeUHPLFYfqw5x8xThzK5JKGsuRTFmFoPCCm3RIDGHP1SE3aMhB8NQlboVzNpn3K/h4QhmOf1beOJMG7JGtVo8ftDRwm/I2lJmXjuaqpA6wSrK84/lmLNepG6ILsinGZiZ+tL8u/QjnOJTr/+Ci2Ov/0+upCC7lr+pRcAsUOOBgrlRLoKbXqT/dq31ALKbB2Urk0GtJwblcu+fia/m4Xj9s1mtmndR4HiQvSJ5vgJ29N7xCrXgoSvNODVwjyHgGTagbGIq0eEDoNz0uOgFlN2Fz+vuUtRAk9iVcR2rEB4C2WajZflA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5492.lamprd80.prod.outlook.com (2603:10d6:102:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 12:48:35 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89%7]) with mapi id 15.20.4415.025; Wed, 25 Aug 2021
 12:48:35 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Topic: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Index: AQHXmPRAdENEpSrR8kmmTHTdl92jxauDlL0AgACYYqA=
Date: Wed, 25 Aug 2021 12:48:35 +0000
Message-ID: <CP2PR80MB36683DC7E9BEEA136FD0DD5EDAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br> <YSW8TigYwJVIrd5w@yekko>
In-Reply-To: <YSW8TigYwJVIrd5w@yekko>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 802c3c16-5165-41cd-b3a4-08d967c6a6ff
x-ms-traffictypediagnostic: CP2PR80MB5492:
x-microsoft-antispam-prvs: <CP2PR80MB54922C012368ED7972678446DAC69@CP2PR80MB5492.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1KJKF1TbvRUCX+8eyPWvX5Yg+4qJh6RJkiVvMuJrDKiQ3JdtaekTKZ1eNxD9yxNbfGKZIbJYWmGF+DcxAXEAvMg7Epw3BdMd4hwglVJ6yBPG7xqyTDH8X2730JrIjcaGFURW0owkw5kNGK4/y9Z+TIZTJj2EI18vEmZROUBSeHN3efteMHVQqChWe+KB/xswUhkKt9XCVNircAC0NzloDNX/Rca4VRYiGfMVumfwteKuXqymbD/W1Fz4S2ui3O81JUwDoAOvoOWFT+s+5S6lkCnC3+wT9mhLD4yNNGByN3zjWg2RyErXB4Xqya/HnnRlcCS2IfXDBNEVPx0YXaPFk+MwhF5YJtzj2J6S51AM+flYWPd+6puK41EB5UF34sxbyyJjmzMVibPa3ne+MwJgjlBvuU2sZ2MRw3HnvQXGGC5b7g+5U6cNLjKKwa9Yl9gIYiqGFnm2Fq78icJUMKT7MceLvDOEW/Z22C1v8R5N/vERFecHwFFvzRrT2xcvYiUuhHzX80LvW5gpgVs1snUg2jHNw6Qdcsmkip3oB7sOhoIVaNnReA/i6FUDH/mLTbqlUnuOxC2syaSaWpnyXnIBtvVkmg0g/GmWBW1rnM7l+2Af01lkLr4VlVm9QG8uT4cw0pSX5Sp/c5qzK/XL6OHxKQN8JoTTNpU3B1xql12AUpTTWjE1dC4IJafilIb83EHYgUSnzHXc43F2uh7wslR8/5pVrAMcaj5CdCdCdWLKBzFSM2Zd2CjnmhqYKpXDaMBKrhOIo2pVo71n43Qx32nzFWm2RkbmGodfQc2J88wYNqY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(186003)(478600001)(66446008)(55016002)(52536014)(26005)(6916009)(33656002)(8676002)(9686003)(71200400001)(55236004)(5660300002)(86362001)(6506007)(4326008)(64756008)(7696005)(66556008)(4744005)(54906003)(76116006)(2906002)(38100700002)(122000001)(38070700005)(316002)(8936002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nLdi7eC++Mfi+LgWKJ30HT2k6mqc9o04JKqNTThuPgWp1hT8DETILsIqY1HY?=
 =?us-ascii?Q?ykuS7OSAOTB8lLcRzicR9mctF8+FM2ZJq6Y1HwD6ihMiDJGoUothLTh7SQsY?=
 =?us-ascii?Q?3x6dHpEOucI4epecLoywk9NUh1LJz1qfm4v4q0I7043SuGkOGaMfFS/lDaAT?=
 =?us-ascii?Q?n+jLMv0QdDvARKCtxUxN95DIFFHRKVG+7AkJ7iTEsuzmeuALoFZgqlYqPnsv?=
 =?us-ascii?Q?cqpJ5vqmZ0Ul6ry5zvz+Qsin0RBiB1ghvU3xBgm2DvLw50oRgyHjSVrDZaKH?=
 =?us-ascii?Q?iOYpCDYP+LPtWarnekwdvAzHJce1lJi5LoC0dE+2sSkjSwSRoN1ZDRkp1R+z?=
 =?us-ascii?Q?JAC0fzDvDMhbFKbq3cAhaKSbNTsyFwzEGIZSXmWJ/cON+BIONQY4W31tOnjk?=
 =?us-ascii?Q?BkIusOATatXUu0l7oFL3wWXh1WMUNaTKWpsIXLXTsmDQp0BlzM0XRmKNz5gL?=
 =?us-ascii?Q?HLGxzB62dGqc9/HG+LdTscKhWzZS0G/N62hlEWVRoSObMcsAxju0gW7nXSHS?=
 =?us-ascii?Q?YMHm/UKxFgD4EHXuS0RpOK8Hswb3gDkgW/yP5Zm2dje6iKUNJn/TP1y/dbHT?=
 =?us-ascii?Q?AIKnC7QnyY0jBOdIOHxAQ+LIO2fY4cmqiXerN2EaXMIpff28wZ26ZPDDMTBi?=
 =?us-ascii?Q?UEuQTnjwoE/r0LWtoMez4AOXeqnYcwF/XEAVf3w1WWHjsPf625Ohxn7QvfkQ?=
 =?us-ascii?Q?AuKEFOVi+CbY33M2k3QK9pvseyn+7wNCzGoVVWCLRJZoUTeoTSgBEDbKpvyU?=
 =?us-ascii?Q?11xLHvHcj+Oykgvu95+0IREUhQ76rsgqbLkaqU1AduEvkf5hS8QdMyxRdKev?=
 =?us-ascii?Q?zp7g9yMIawv8hS3ElQWO10NUwFzU53EcjcyaUThoolVosCQriSklILTbs7CU?=
 =?us-ascii?Q?nYb5OAH+OCg3dwXRRQXv1UXBKkkNSW69SzOEyaTd211Cvu5kkEgb39jJk84f?=
 =?us-ascii?Q?DR0kLm52oFniaG+Im/oUamgLkrvolta0sTx8aquauoOm1dhirgebalw5l2V7?=
 =?us-ascii?Q?fOIwdfPEXv4l9S8UpOx5ejRK7kqiQlysHKzC3o/vjonDQFYXb+3529mck56r?=
 =?us-ascii?Q?2rdvvq8eYEoi+Nfmn5tvQTpCEMVfDnwm6LkHxSK0AzNxYQv/4MeTakLG8aZl?=
 =?us-ascii?Q?atu1yIlqFIebT4q0oboNdMN401vQf2SepMHKzsUCfR56ZdRs8rX2h2ffK2q6?=
 =?us-ascii?Q?+Njwy9t9JLn325t7WrH4uJZI8kTBhNNTj+ODFUEIOGjKsAJagbAv84C//G+K?=
 =?us-ascii?Q?7JAVsqS6/lbgP/CD03vL+bGlaC7zM5qUjlpsJkA0j/WJV9VDNsPNcGi8Rn7r?=
 =?us-ascii?Q?Y32ayj65vG2kTmog07GWr5Bg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802c3c16-5165-41cd-b3a4-08d967c6a6ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 12:48:35.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuZrVCds2N3rmCUTMaw8wnW7UW0OibodbP+1J7DPtN6fzZLk2UtQXXjaqL97AZwCHQCXm6UNGJw/5Q78MIaSeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5492
Received-SPF: pass client-ip=40.107.74.90;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "groug@kaod.org" <groug@kaod.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>
> Hrm..  I'm a bit concerned about mkaing this a more widespread function,
> because it has a nasty edge case... which is basically unavoidable in an =
abs64()
> implementation.  Specifically:
>=20
> abs64(0x800_0000_0000_00000) =3D=3D 0x800_0000_0000_0000 < 0
>=20
> At least in the most likely 2's complement implementation.

Right, that's true of any standard implementation of abs().
I thought about making it return uint64_t, but that could make it weird for=
 other uses of abs64(), where callers wouldn't expect a type change from in=
t64_t to uint64_t. Maybe create a separate uabs64() that returns uint64_t? =
Or is that even weirder? :)

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


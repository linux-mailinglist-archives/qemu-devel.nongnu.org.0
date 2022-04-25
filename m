Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67150E777
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:45:32 +0200 (CEST)
Received: from localhost ([::1]:40244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2mB-0000kD-IE
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2hb-0007Nm-Tm
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:40:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2hZ-0003Cm-J7
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:40:47 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PGK6Jl023432;
 Mon, 25 Apr 2022 17:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=FTABrd+bSo4zWII3cTTjkQw6u3awVuXP6EH9mN0ct6U=;
 b=rCqD69TF0WbzB1CzVNXrxqVPYV2ErI1qwM+qRfXpZBLaNkkOMjK60fLuCnf0Qv/xhdMb
 HGP6QiIxn5w+3XH6ArONO0ODd0QXGgWJeKHGlNPh+GwbSreXzD3VZ+wkAC9S4hvHzAJB
 5sVTV5Q54Mcj4CQRPhWgTB7+99jhEgNGGgZpOs1inJmDYQzt334gldSqVj2Rqs4eWEkq
 6Da+lUGSgb8hsZt6r2B0ktQsxIt1GRPP9g2aXkilusx+/dQPePR9AsnslV+cbH8mxNvm
 e2JhNZCb3RYh3Zc0WL3JK0zGyaMgnbtmUif76jbXfe2SLgj/mHy3CdyuoRoHAnr0U/9j GQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb0yutap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:40:40 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHe6b0002233; Mon, 25 Apr 2022 17:40:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w2u3xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoQjyu7erM8uYn+AoJXYumEeZhCE8T+vczE6n0UIDQDJYzf0sh1G+NEfzweM8ih6BHht6SeQSuUwjParWrTf0LE9arEaenk0au6/8k33qit3g2PAsMXrgQfxrIZDwYNn5DzAoEDhaCfI6Rx09ZMvNub7uOGb/6pnGRrGL5AyNjpX5Xi+l6G5hboDTJ8zOKI0cIjZ6ig+vjDyiJaMji+SjmjbBRhQbxSIm/nRv5hPvzJPtObnFC+PjkQ8gJ4yVofWug78E6eLDZcv8JakcIF7EdSUGOKep820+pGav3HIs/Kkhtc9yXCCl/z/pd/0BTwTGpxNpgmD1onS6x8eDOvvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTABrd+bSo4zWII3cTTjkQw6u3awVuXP6EH9mN0ct6U=;
 b=WmP2gzd+PGVQqRIMQy5Y38MdT1Woe0rITX5g8MDHAnVToOLQQ4MHmLKu24+ijwkqnt/Tj9lqxnDJLiGuL9WYQY18QVZ6LlWya0UUD5Uis1WkQu7wVbx2tqzAwesrQiM7yiymL63IMfGIZS7iA01ai2bQw98f7JU8yqN/rt+FPOO/PZZr/PNniWaUxpLxsQ0FYvsjp1mPOEJmiO6JIP3+IanBqi9fIpe4k5q7FfqdV6/QInS6dzhS50a7jfnS+7oAvC6hGpFxWdyt2cLcu+awOG4AqfeS28C7/raXEZyOzfI2lRaK4yJg6B8wO1izQJ25S1sFoZjn8R88Df0WDLN4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTABrd+bSo4zWII3cTTjkQw6u3awVuXP6EH9mN0ct6U=;
 b=Ba1zZosl2ph4U+q3uPcCz1V95rvikAZxM1lfsxPZfxNqCIBhsXny4NKwFkOJnLAwgepY20iscoxOjgBlrZOwlV5Ryvksrm2DpD+HjgK4bPm4t3/owff76UF2vk/BlkagHhF3DkYSXPtrO5AkVtwr6xMT1JF6l3sBEYJXwslykKw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1999.namprd10.prod.outlook.com (2603:10b6:300:10a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 17:40:37 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:40:37 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 00/17] vfio-user server in QEMU
Thread-Topic: [PATCH v8 00/17] vfio-user server in QEMU
Thread-Index: AQHYVC5Eev6OAq3QMU6UXBWp2m83tK0Ad0aAgAB3goA=
Date: Mon, 25 Apr 2022 17:40:37 +0000
Message-ID: <63C89ADF-1E2F-4C05-A2A7-4876A60AF5EC@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <YmZ41Z4nO7xv3n6X@stefanha-x1.localdomain>
In-Reply-To: <YmZ41Z4nO7xv3n6X@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ec6eec8-8bc6-43ec-b576-08da26e2b58c
x-ms-traffictypediagnostic: MWHPR10MB1999:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1999562A1EFD21C579660D2F90F89@MWHPR10MB1999.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SUJa3VH7lNG2OmqcrLpS1FNrDoHecoAHoI7BIPnhQRg3sLrEYl7cQem2Dulp2zJTGy0bGqo4pC0MfQqeCZJeFC6Mxe6wISYlt5V0yPeI6D4WmJwC1zKsqJoYo8yTXZK1kmglB4s9VVGIy6g8Uc18AZN8cTN8aFbMuJJQaRMiQWqE6VfMAME0/MLW5iZ4/uliiAtVW+DTi9AOyGNElfIF5wHcDAzrJYGYv5Qnz1IZo1GFmlRGAbtKFRP7b/ofsNOrCY2XP0YHIm2JK8ObZ+QAtljemyfHRgD42xXcgex2jRSfUV4RNxV3wDoA3f2PjOun8HPOOrmhg20uZeFwZ7QIBi/ir6oViro7bmDPimNPFhl7sVcvJBeFUIPOy/uvsksaLvK3uuxFs21sgnLNG13u+o6QZc7KLLYLmoYNj8PRy6kk8W8FUAyZegwEdlYmcA+FSBVuOtSNVepTGH/gOV6XI9yXApyge/S/JxOeCcQtikG0xdHmqQ33bwDqxc+DWA2UYemqBNSNFFd1x2vA2fBz+wHa/iqTFnJ0hwn5IqqmZn57HU4bn8mLVSK7a789POG9/YuK+u0ZtijV4mi+IOzpXtaJcX/dgmToBALaBORX3illiquqVSoChqDf6qquXVsXW+xhQIIoQZRf1aEvcxy6e/yRSjNIs6hLLia4mZWWH44D0K2899FmOXD8bCXT03aMOhZ0Po+Ve+JH/rHWO9ICbLvI6AXvSKOGDpOMFY2ZGYN8l/T7Qfi/vSvGRHBmw5AP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(38070700005)(76116006)(122000001)(2906002)(6916009)(91956017)(53546011)(508600001)(71200400001)(6506007)(6486002)(6512007)(36756003)(33656002)(54906003)(5660300002)(316002)(7416002)(86362001)(107886003)(186003)(2616005)(8936002)(64756008)(8676002)(66446008)(4326008)(66556008)(4744005)(44832011)(66946007)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IXnKMps7A6BwQ7wKpPK+Fp/Yd3JMVnYfr5nPGgNsSNxEDHptQz/nJr9LG9?=
 =?iso-8859-1?Q?kZOfIS8HJFejVvrAvz46vJ68ig8mnDXFD/7k1buQR8aaaeI7tZX2VQjTKk?=
 =?iso-8859-1?Q?o0WC2hWmwc1vge7aMWfmRKMpyPfIMUDaVNRRalloE8PfjimQ8liWnhDoO+?=
 =?iso-8859-1?Q?XWgTdDWP1vYUG9R/NFYblqooyb1KnFhw8VIPcWOK1O7/9Jsl+uifAJ6fbS?=
 =?iso-8859-1?Q?JcuF/7Q3Ap+dHbPxYp85x2zj24hM8qlbBlhEeIHIOxSmc2vP9/hj0E/OJx?=
 =?iso-8859-1?Q?zRPjzuUn1UaCBmnezXgCWLzWOHIUnDIEom9vEg3PkvrlnvidWUK+e2fKxd?=
 =?iso-8859-1?Q?NqVWwkgpPF0qW172ye2yy8LHF95Hjiz0ztbzcirSB19WSWrt2M817R5Okp?=
 =?iso-8859-1?Q?tnEXUDXitq+a2DFDITzXdbFfpCMwI3LSIL7aZDGh+PUxk9W729UTksrIBM?=
 =?iso-8859-1?Q?2OizZCNVZ2vhLBLuAOXgM7MyEKFVuunTZRSeDCp+ra4tMEYRxk4q2DsAON?=
 =?iso-8859-1?Q?JsRYzUWr7NDbxSmAtZL5fgce2e4qqNxIE8XxXquJ14Nwh7NW4B98p5cNAE?=
 =?iso-8859-1?Q?2lLK/UGyy0r6sRZyVvIcNJtqMmaxMZXs3eSZk3KajMbDDOwSa6ZKngJLRf?=
 =?iso-8859-1?Q?NCb1CMMSBiAPh7nnPyo2dk525kFKj/nVmITPUTS/bSic2O7gfjKFmZnFUP?=
 =?iso-8859-1?Q?Vc2STsp1+ayWfrd0vqz5H9Sjor2QUpzbau9uNx0K3bPWki+jSPKHA/lK5L?=
 =?iso-8859-1?Q?nrkTPl8rGVUwDFW1ZCV+WGIcYt1ITdAhy7Lis4wOT0W7Q7GM5lfrZZn/S6?=
 =?iso-8859-1?Q?WDwm9vT4zxC+faOtFA5Zy7DbWiJCTvDGeyBjanKRkWe0iVPsUQVfRjbdAU?=
 =?iso-8859-1?Q?LjZJW+s8ADuJId4ZIzKAKx1dTgn3K8ZiLWPBDii3ChCjYx3vzeGA14AbY6?=
 =?iso-8859-1?Q?Rx24equRTorZSun7TrMScWlgmmrc0nlpo5bLjA/DVecEkrhaa/gIbds4fV?=
 =?iso-8859-1?Q?UZ7spDO4R8WwRkEAjiXpuDSyiRkl9lyWbNbIVnw9Hd15InWwPgumL6RgvY?=
 =?iso-8859-1?Q?QgAlgGrEkfYhOk7ZoUFXVtpIbV6rzQaCd7dT5Gb7Tb/HWPI5kx7UMlCTDk?=
 =?iso-8859-1?Q?Io0Mcf3fNiAlhux5EkDXiFePWwMDgDMHGVWv0UxjKfeJe7PrBlvd7xG6ca?=
 =?iso-8859-1?Q?6NxTXvlBLD9/iIxsCsE/SW7GdbmScBJRb0xzIe5dWeCJp3bEWGmHjeqdsj?=
 =?iso-8859-1?Q?a3x46wPX8PQN5eNkLKtxNyboD5GQgT+e0jLZShHAeoshZJEyf+3+eHUoQ/?=
 =?iso-8859-1?Q?KaMvGNmXy+T6f4tVttYFhP8+uqU4ANktqD1C+jhv9ppHAOwTk5jqC9kbMY?=
 =?iso-8859-1?Q?m52/yqEhupIwmUrZzTiQhu2DxZvDPypxdUeZm9CNTcdVLyqZVGr3y2DMlr?=
 =?iso-8859-1?Q?djgKRhPJ/lENjUVb/6Lh4KfXf9jlDH9T/bUm5kWwrIB8OpGbv+YsDp8A/J?=
 =?iso-8859-1?Q?22KMYv3BTDaDOPhBs3vCGBBHhpMkqq1FyL1T1uThGFbukGgp4dqr0cL11I?=
 =?iso-8859-1?Q?bAt/8/v1SfugzOqpAlL0ClmpO4cqvN7XgqEYxMs7ZaBGY3lynNu+/nCe7h?=
 =?iso-8859-1?Q?sG0v8uqEx3ZXhWtaYMOmbXnb2hlms2RKjdO0ABohd/OHwrXSlOqbSjK/DB?=
 =?iso-8859-1?Q?6o/E63uzKYfjqT9la93sPvFhS9DfniHnfKA1re1+Vs9LBadZD/eFfhutdP?=
 =?iso-8859-1?Q?3r4284JN3DMqfkLConTAp4veyQ9Ql4O3uUTLhwHNWnURC9i0xQhbOIJsox?=
 =?iso-8859-1?Q?kCx7qrqcR8ck1dugaUd1bpcLGzfT6Nih0lhFUzr211fJ9ZlZh7P3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C60E1DB3FBE5824FAD69A2A4D8B4BD58@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec6eec8-8bc6-43ec-b576-08da26e2b58c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:40:37.6239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2TbodPmOL5DYtCfqJfAdxQKCqOpLlTYq/WYhW4iZw8Mj0/mZEYByAHVpRiWxazM59uyFfv+QLznlth5KM/n+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_08:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=726
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250079
X-Proofpoint-ORIG-GUID: zmWEi7pQlNq5N-qgoCx9LLIjqpp0hqvL
X-Proofpoint-GUID: zmWEi7pQlNq5N-qgoCx9LLIjqpp0hqvL
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 25, 2022, at 6:32 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Tue, Apr 19, 2022 at 04:44:05PM -0400, Jagannathan Raman wrote:
>> This is v8 of the server side changes to enable vfio-user in QEMU.
>>=20
>> Thank you very much for reviewing the last revision of this series!
>=20
> I posted some minor comments. I hope the next revision or the one after
> it will be merged because the code will benefit from being in-tree where
> more people can easily try it out.

Thank you very much!

Will send the next revision out shortly!

--
Jag

>=20
> Stefan



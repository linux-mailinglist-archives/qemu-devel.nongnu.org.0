Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502FF4BB053
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 04:43:28 +0100 (CET)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKuB4-00031x-Uf
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 22:43:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKu8r-0001gW-Lv
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 22:41:09 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKu8m-0003Wm-A8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 22:41:08 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HMOK1F014655; 
 Fri, 18 Feb 2022 03:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=VjiL7qHb2NB60H8SE5MCH741cJoGUC4Fp80Wd6fO8Lw=;
 b=zqgz9xpZV53nSh+CPlpOxUE1WE6a78fBayUdCU0S0rOcnEG9eSr9COTl9CFQj7ultxwL
 HMBrgvf7mD32uxnZDHP0jR6MHzmw2src+3xyjDyN9L12Fq1g35n+4Ex48ymS1qy0QWu2
 aTJ7qqZ10uQ5Wykealig9ecQ4zM4u+ndXKfzLHiYH0lccxg6Gx8M09mIsgBtyIAtc7p5
 IXkQLR6/maMcLVCS8BKG0vsqrpRgl7DKOWHF5mMQoTfdmJWF2DV6tcVejwqtgAkMSCKF
 70myorH4FxdSVTbLSOoEQmuFZh5S/uRS1yt8Xd/G4j4oiZAj+h8yftQnC53mCINGOdVN Og== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3qmad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 03:40:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21I3VJll042544;
 Fri, 18 Feb 2022 03:40:53 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3030.oracle.com with ESMTP id 3e8nm0km3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 03:40:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF1k3KPcj5YYdMVuZGmXjsgb1vWNRGrK+w307tiT+v26f4dWuRYHb/2KE6/U/hS1NGVVRuadkdyLfcvTDVBHQg4w4wrII0FY2GF06jCqI/Zf3NKRJSRJfpwVhHq8mMitBtd0wZHVKOPIY95K8zEU+Irz4sszHRSmk/X4dvbPE6I7avLhDFfKCemZ8sLF9jjJAZbMKPiVDMIg2foFY9QJX+9uZtfv7S1rHl67+GAWgneS6nMqSs5RmNAsM2LR//ZE8/CMOOM9ZvTEVDfej6GFHoct0MY2LpVGC5CAsjZvdZiYbglffNHNMW6PxLYOcO+bM0AOa48wtNG4v7kSSs0u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjiL7qHb2NB60H8SE5MCH741cJoGUC4Fp80Wd6fO8Lw=;
 b=eEGjLNIfYvdaF4j/yLbBykonufHMIusFSCWFDeSqSrLobCPt7JtrHd2+p+RI21gxP6sFYYU4JW8chZta4A7QGrOwR8X6/iILNhfhxa8muT7Byg+09YggiEy65lSg4z8Coc5Cu7qoXYWzllj7Nq7JGvtnZLzuyi7t0oq7BdpvLE38B0YwXEj3aLGyoWddQdA904A2UEFM+TTW45GdMkRoBX/q/kcXGJJk3BgPNgouVDug01j2i196rYutRy6ns8hAILd0BLUMomUL3Csl6aG0+vzImE0LSyYkCw3qysFjaBfwR698s7OXoU1WWT3REYthr3bh/bp12OUS3yjf6G1gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjiL7qHb2NB60H8SE5MCH741cJoGUC4Fp80Wd6fO8Lw=;
 b=CRKkEl8gz7W+m0s0KLwnmrYdel4HeB2VJ9XobwFbTO7vmp0oevsffMQUK65ZdIj4ztSKde5eBMt4mtismqbElRJrf1rOsvXcMeVA6siRymz46+Vq1HqddwUxS3TsGQ8d7KG4ClTw/zWFS6Gcd7oAs854YBBRwbO/kdLJ3oyZmfg=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 03:40:50 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 03:40:50 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENAA=
Date: Fri, 18 Feb 2022 03:40:50 +0000
Message-ID: <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
In-Reply-To: <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 547d2408-d689-4a74-3d61-08d9f2907512
x-ms-traffictypediagnostic: MN2PR10MB4093:EE_
x-microsoft-antispam-prvs: <MN2PR10MB4093D45D7B0CBFC494D4B0CD90379@MN2PR10MB4093.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aus4YWLGeCCkKYP9ud7KhH34PMo5bQdKPZpAToALU0+B6xVT70RBWjNx7rlI3inIouBWjIJ0tlCrEDm89ETC2hbjPyGxvtNDGW3UaKx81nruUpHDqpJrvKtm6h0HgRPHdirPD5mFhzrnqdYDR6mg2FV+BdGKRUzQw5F6Mu6kMms3q4kbtBxnNVLt0kY2Zn4RkfSn2GVKJIuveIrKraLaZIOSFEEGcQFblXkpBJPlX7F9yeWUG7E9fC85X5+IVkcN+DnTkARSLeyUMRHnyBBAoOf8gCw0JlIHuCDC2cxh9fj0fpNV6BfhVCO9AGEUuCXc7kO7/z5GU7DEpjeBN4LuXF6rFueAWzujA4mDdlHLUchk4afQywi3V00ARvqenROWiRRQvDGNVKxElatMhODz4lJ5gy9uk7xr2qP06+Xfgo/8hLYdjYxu6vVz6mzTDrcaCz4Zh6eSsl8vIv7T5pg6TJeZpfVcqqppmIUMM2KYG23g7Qzjf1Jy1JVz9mRpIvfkN6g2M3i6S8vC2dgNRt2cqqFk52vrgmPuSAysPp3rAIN+z8dCVJQK7261Ssa2QULC6VaBajTCvCuvf6GCulKTGIFCieM5WQU1U3Aq2AqVK3kUkxWLBLkIywXvvO5sqpHRQI/tVNt6sBJgLPmQ4C98maFr/HXrxlaYGuT062orl9PtceG5W5qKX8Ywf/UZL01gIkIm3DRYfFckea7RAWSxcKjgjD1Az8TahTVJOvaT8GXf5qxsnOOsWztbt7B3tz8F4gkHeBl9bVQYwIcIzQrXKRaXDX08Js7V3GqZ9pH0xMPSQtY0awlZ28JlzaPWMAOXyWT88SUvme8uBzVuD80a5UpMIKmNg+cokW1A41eqrhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(5660300002)(8936002)(71200400001)(4326008)(53546011)(83380400001)(2616005)(7416002)(33656002)(2906002)(6512007)(6506007)(66476007)(44832011)(8676002)(508600001)(38100700002)(316002)(122000001)(64756008)(66446008)(66946007)(91956017)(66556008)(36756003)(38070700005)(76116006)(966005)(110136005)(6486002)(54906003)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGNjcjdaNmpxbFVnSWdYUXVxVHNkdytBNHJQNHBpUWp3Mk9JZE9iWHU3YlRk?=
 =?utf-8?B?N1A5dlVuM3JjRXV1RVJLZ1dhWmZBU2FkL3YwZXlZNTRQc0NkYU1wNXZ2aE53?=
 =?utf-8?B?UVZXSEw3UzNkTFBuUmp0d3F4ZWFCek1HUG83L2ZneHhLUFQ1ZE5sR0ZtSGhO?=
 =?utf-8?B?LzU2WjZyTUtCZU14UCtKNlkyQXBmUTA2ekJEbHZpVmV2TElrTU94UEhmcVR2?=
 =?utf-8?B?MWwwanF2SnVteCszYTlCLzc1TGtkQlJ5NitjZTdBUyt3R3d6R0FBaDZFS2hL?=
 =?utf-8?B?NzYwbEVqdkJVd21VdWVNdzNhbWdPcm1XZWI5ZEM5bWdsd3UwNjFNaXByVlZi?=
 =?utf-8?B?WlBRanMwamtSWVZlSExBWW9raGhXNjJzWDByd2VMWEUzQ01lemg3aTdyRTBu?=
 =?utf-8?B?YjR1U1gxcGh3aXRrdmcxNnR0VnFXd09IZDZBL1VEU3EwMUJNeXhXV3dKWlVy?=
 =?utf-8?B?a0N2MU54SXE1bUFCaXoyNlhkNHFOVjFqczNZWWxtZmVMQzR1OEFlblRPSkdN?=
 =?utf-8?B?cGNrVWRUc3I1YU1uTU9kTXI2YWwxalN4a3NIUlpOOFNndFl0azM1ZkNmdjMr?=
 =?utf-8?B?dUxZZjRmbHVyL3NlTHNlVTVwV3lhNjNtTVNaTDMrNXlpN3graGd3dGhSR2V4?=
 =?utf-8?B?YU1uTGZXYmttUXNSaTh1QktMN3Mvc0FyaUhBZG9OYVBicVE2eS82WTBYajlz?=
 =?utf-8?B?SVRLcG9EempyUURpS1IvUlpFVHpYcmRnU1REOHNadHMxK2duODVLOGFXUm5T?=
 =?utf-8?B?TWdkWVVGVEpOV2FiZTN0YmxocE5uOVV4ZFpWY2ZiZUV1em5HUFhTTmsraHlO?=
 =?utf-8?B?SWl6RjVtZ2dySHdOeFN0RC9HaXdRdkJWa3N6MVQwbEdaSFFFWngzV1dJa2M3?=
 =?utf-8?B?SDJOeXlQM3NNN0lqOTEyaW9UeTBPR1pJdlplWVRqRjBCZHZ0YWNvRHVsRVJH?=
 =?utf-8?B?NyszVkRoUHJrMTRlWTVBODZuTkVYRmlKd1FNMEx1VGVFaTBvWFQ0RHdwbW95?=
 =?utf-8?B?Vmg4eWVzQ0pjVWx6UnU4QjlhZ3Y0a2ZNMWhOVHJYc1RUK0d1M24rTGo4RThy?=
 =?utf-8?B?UHZGbHNKVEthZG8rZ1d2K1JLcUJVMTdTcHByUzZjZ20yWEE3UlZ2a0tXdVht?=
 =?utf-8?B?VlVLU1QvMTZhbG9IMU5iYmFqYVppR1BCb2tuQmcrK1dvdGtmZ0JxYkZtd2hW?=
 =?utf-8?B?VllMdjFwa2xFQzJvWjdyVWFRTHBlblJqblgrc3BUMS9IODhKS0lwZjdDREJ6?=
 =?utf-8?B?SG1LL2Nvb0xwOUFkeDkzdTJRZE01RHEwajNsYkVSTXB1elVLOXNKeXp0Yk5h?=
 =?utf-8?B?cGk5ZXhGQ281aDVLUFhHdWRSbDNvYWJNV1dEdkdYSm54end2OEV6QXFGZ1hM?=
 =?utf-8?B?K05uYkF1TDdQUWpFWG94NlZaQUVCc3luVjY5UE9PcFlKR0dnUSs1V3VPSjhn?=
 =?utf-8?B?aDFTVXJObVEvNnpvQ0k2NjcxRmNiQ0xvZWZQVUpPWG1MNTVsV2hyUUtpUnFS?=
 =?utf-8?B?MGNDQlZCTG94K1B5V2dIZksrZjdXUjBoZUFuMkJ6bFQvaTkvZThzWkRYRGgz?=
 =?utf-8?B?UStaR3YreHMzcDd5SUIxMkQ2OG5UYU9iZ25sS0FNRnpGOXkyd2tzeDkxQzJL?=
 =?utf-8?B?aFVVc3V5ZnB1QTRvUjlsVmM4eTdIQVRWeHNjS2FJbEVOcGFNb2tpTHU3dmtM?=
 =?utf-8?B?eFNnYlduVkhTYnBoUm4rNHo2VVhKa2FUVnM0NXZXMEo4OUFubDZ5UllmMWJ5?=
 =?utf-8?B?YWEzOVo5dmQ4dWVDOStUbjNXNnVhNTAwVFk4c1Z6Y05pQWFaYkdrYWRSTWls?=
 =?utf-8?B?OWtZMlRSVnVxT2E4NlZMNnNrZy9pM1ZGN1l3cE5hRUdmVVNydkFaY3ZybE9u?=
 =?utf-8?B?R2VKYk1yMXhsV3lVT0VBdzZJYlFqcjI5YnBhWGVyRGtkTjRVanpKQ2xFMzc2?=
 =?utf-8?B?MjZXVTZrRy9sWlpDcTNlcXRJN0RCTVlyQ0ZNNTFjT2RhajJHSS9GaEQ3N0Yr?=
 =?utf-8?B?aU9ZL3pPbC9RS1FRd21NSGNxUlh4Slpoa25wdHhaYW9PYUZzeG9icjRvQWxX?=
 =?utf-8?B?VG9meE5DM0R5aXgrdDlHTmpCM05vOTY3SEJodDUrOEtmVGhLdUdhNFhPZEFQ?=
 =?utf-8?B?bkU5enVoa3RMK0RxcGduOS9TN3NtaGVtaHorUEZ2c0hIK0xEcStDZGV3TFpw?=
 =?utf-8?B?eXVpWTQvMDZQTElqWUhtVFFpZVp3RzMrSmw4TzR1VnpIbm9CUzV6QURNMVkz?=
 =?utf-8?B?NnIwQ0s3SW1KNHpOUXBkTkRUOW53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C2DBABB0A167F4EBA9DA1274BF9AEDE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547d2408-d689-4a74-3d61-08d9f2907512
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 03:40:50.2196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shtMPlIjluO6odrssoYurpdSs+Fx3jWNWG1BipfshKINH4CIWoNzMv/gVHynGmg25FLKv6lApCwjjdrqmG3eMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4093
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180017
X-Proofpoint-GUID: xAUJlVXuv16rItbyfgqQbgwVBVfCjYnz
X-Proofpoint-ORIG-GUID: xAUJlVXuv16rItbyfgqQbgwVBVfCjYnz
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 John Levon <john.levon@nutanix.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDE3LCAyMDIyLCBhdCA3OjA5IEFNLCBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxNyBGZWIgMjAyMiBhdCAw
Nzo1NiwgSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cm90ZToNCj4+
IA0KPj4gVGhlIGNvbXBpbGVyIHBhdGggdGhhdCBjbWFrZSBnZXRzIGZyb20gbWVzb24gaXMgY29y
cnVwdGVkLiBJdCByZXN1bHRzIGluDQo+PiB0aGUgZm9sbG93aW5nIGVycm9yOg0KPj4gfCAtLSBU
aGUgQyBjb21waWxlciBpZGVudGlmaWNhdGlvbiBpcyB1bmtub3duDQo+PiB8IENNYWtlIEVycm9y
IGF0IENNYWtlTGlzdHMudHh0OjM1IChwcm9qZWN0KToNCj4+IHwgVGhlIENNQUtFX0NfQ09NUElM
RVI6DQo+PiB8IC9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvYmluL2NjOy1tNjQ7LW1jeDE2DQo+
PiB8IGlzIG5vdCBhIGZ1bGwgcGF0aCB0byBhbiBleGlzdGluZyBjb21waWxlciB0b29sLg0KPj4g
DQo+PiBFeHBsaWNpdGx5IHNwZWNpZnkgdGhlIEMgY29tcGlsZXIgZm9yIGNtYWtlIHRvIGF2b2lk
IHRoaXMgZXJyb3INCj4gDQo+IFRoaXMgc291bmRzIGxpa2UgYSBidWcgaW4gTWVzb24uIElzIHRo
ZXJlIGEgTWVzb24gYnVnIHJlcG9ydA0KPiB3ZSBjYW4gcmVmZXJlbmNlIGluIHRoZSBjb21taXQg
bWVzc2FnZSBoZXJlID8NCg0KSGkgUGV0ZXIsDQoNClRoaXMgaXNzdWUgcmVwcm9kdWNlcyB3aXRo
IHRoZSBsYXRlc3QgbWVzb24gWzFdIGFsc28uDQoNCkkgbm90aWNlZCB0aGUgZm9sbG93aW5nIGFi
b3V0IHRoZSDigJxiaW5hcmllc+KAnSBzZWN0aW9uIFsyXS4gVGhlIG1hbnVhbA0Kc2F5cyBtZXNv
biBjb3VsZCBwYXNzIHRoZSB2YWx1ZXMgaW4gdGhpcyBzZWN0aW9uIHRvIGZpbmRfcHJvZ3JhbSBb
M10uDQpBcyBzdWNoIEnigJltIHdvbmRlcmluZyBpZiBpdOKAmXMgT0sgdG8gc2V0IGNvbXBpbGVy
IGZsYWdzIGluIHRoaXMgc2VjdGlvbg0KYmVjYXVzZSBmaW5kX3Byb2dyYW0gZG9lc27igJl0IHNl
ZW0gdG8gYWNjZXB0IGFueSBjb21waWxlciBmbGFncy4NCg0KVGhlIGNvbXBpbGVyIGZsYWdzIGNv
dWxkIGJlIHNldCBpbiB0aGUg4oCcYnVpbHQtaW4gb3B0aW9uc+KAnSBzZWN0aW9uIHVzaW5nDQpv
cHRpb25zIHN1Y2ggYXMg4oCcY19hcmdz4oCdLCDigJxjcHBfYXJnc+KAnSBhbmQg4oCcb2JqY19h
cmdz4oCdIFs0XS4gV2hlbiBJDQptb3ZlZCBDUFVfQ0ZMQUdTIGZyb20gdGhlIGJpbmFyaWVzIHNl
Y3Rpb24gdG8gdGhlIGJ1aWx0LWluLW9wdGlvbnMNCnNlY3Rpb24gaW4g4oCcY29uZmlndXJlIiwg
SSBkb27igJl0IHNlZSB0aGUgaXNzdWUgYW55bW9yZS4gDQoNClsxXTogaHR0cHM6Ly9naXRodWIu
Y29tL21lc29uYnVpbGQvbWVzb24uZ2l0DQpbMl06IGh0dHBzOi8vbWVzb25idWlsZC5jb20vTWFj
aGluZS1maWxlcy5odG1sI2JpbmFyaWVzDQpbM106IGh0dHBzOi8vY21ha2Uub3JnL2NtYWtlL2hl
bHAvbGF0ZXN0L2NvbW1hbmQvZmluZF9wcm9ncmFtLmh0bWwNCls0XTogaHR0cHM6Ly9naXRodWIu
Y29tL21lc29uYnVpbGQvbWVzb24vYmxvYi9tYXN0ZXIvZG9jcy9tYXJrZG93bi9SZWZlcmVuY2Ut
dGFibGVzLm1kIChzZWN0aW9uIOKAnExhbmd1YWdlIGFyZ3VtZW50cyBwYXJhbWV0ZXIgbmFtZXMi
KQ0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg0K


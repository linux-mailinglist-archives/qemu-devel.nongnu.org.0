Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C85EEB40
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 03:54:12 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odikd-00030G-Ax
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 21:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1odijT-0001eE-KG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:52:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1odijP-0005a7-GY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:52:59 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T1PmLO006378;
 Thu, 29 Sep 2022 01:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=rczEFuTZVANHUrSsgg5KJCPkXgHeV+HirCCsaULpbb0=;
 b=jGQOlV1HV0gWyZQH9/O/YZyUhh+Z7OV5GQooDlyfabnQ/Eg8SI1XNAbLsMuY61jZO8Yf
 dWNwQuigDbv73xb/1/qn1uJIKstuH/jeaw8Ott65dYNOBWhmfzOFe06NgEFRNkeqXGZg
 iDJu0hy7qP+UkybSWE7pV570Q4p4YkU4yrIOoIRqPXlPolg0pg27FJdUGxeeVDc+2iiX
 jD/o0xLty8YE3dozuToIDTtYj+VorSgYaSxKUXy7pUSkkcEPGszVw440pMF/vAvuSOVN
 UM/P0ptxDWC5dJI4CjHJwBrV6VJwmXOGDcI4k4/9vJzAYY2Ohgp2jaayg/42QHUI1P6w nQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jst0ku7nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 01:52:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28SMRu9v033642; Thu, 29 Sep 2022 01:52:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpv21u9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 01:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCjAzML1vggqkEM/xcHywnfPb/A5Oq7aSkRV1X/SMfBptAxaNENjmzy0zeVbSVUC4sJv2emTIfr9WOBMwsXestZuUqrKY/Q7wl2mJBKOZEW+PZFtelvhRAnt6AWOBH2Ur202E0vXe92eGkXpcGXiCnvbNz+ULfS6rKk/L4UpyBT+RL5yPKJTgfLZHHMHIsauK85D0KQpiN2ZpYk2YuhkAXmeD23b2ybxifV7VLt2paxlLg6zybgTlUAj259y0GXHYv2OXNfxkJaWtUuPVmRKquoG1FMKhRUZQd9PK7z/ls6euvelLgzsKqMiVy9AsJDQitLUC03gaYgtdQPaeuBa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rczEFuTZVANHUrSsgg5KJCPkXgHeV+HirCCsaULpbb0=;
 b=RBOiUO/ihjB0pPxbJ7LfSxT1flebNxvx0bGLnmbCBfaKDVj0fOeoDofAOcJvdw8wrTGwTLigm8I4t7wp/IAz+iyiBLYO8meXh9JQ2ztExtI9zHe7aqQPoUFyf7cTCZjUtihsJeCJrWxkV5lPGaAv5gSJNLgmtzg/H1pVyFl5udOzFgr7QTgF6mWWfnkTpW8WzETRAfSw15VWwGMmbG8rud6at6SpEB9byMoonBqIkQkKEeqclNJ968tn33jt8EAdWKVjqO47TJ14rNKWfjgNZgJvMDTissQ+3aE3dz8xWua3AvAqSOQEmjW0dsBEF9ngCORk1ZUFpnqAVVDEw2VgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rczEFuTZVANHUrSsgg5KJCPkXgHeV+HirCCsaULpbb0=;
 b=FKU0e7WU6NRvhBj3RNf8dzT4DCHHvWqklLAHV/7FOi97/hFiVlC9wVnk33gY7GKqEOiEnt1vrmiHB8WyD6RgPaok8CzK02aiQJZhxPwwxPCNSAnMU6eQXkA4HjFYiD8L62uilpxdvtCE2hlPLnk7u02DUwy7mRJ/vM247V0vrpg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB6133.namprd10.prod.outlook.com (2603:10b6:8:b4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Thu, 29 Sep 2022 01:52:42 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::fb75:60fd:c5d3:899c]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::fb75:60fd:c5d3:899c%5]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 01:52:42 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
CC: John Levon <levon@movementarian.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, John Johnson <john.g.johnson@oracle.com>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Thread-Topic: [PATCH 0/1] Update vfio-user module to the latest
Thread-Index: AQHYpg6QCKwouhM1pkGys08s4dAfg62bYSQAgASKmoCAABHUAIADSkMAgCK1KICAMAM3gA==
Date: Thu, 29 Sep 2022 01:52:42 +0000
Message-ID: <29C30B29-B948-4DCF-AB4A-C0CA6E3041A5@oracle.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com> <Yu+WYmwvr/1fBww+@movementarian.org>
 <abc2219f-9ee6-59aa-fee6-4b0ec29aed2c@redhat.com>
In-Reply-To: <abc2219f-9ee6-59aa-fee6-4b0ec29aed2c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB4013:EE_|DM4PR10MB6133:EE_
x-ms-office365-filtering-correlation-id: f4ffe34b-5171-4aa3-8204-08daa1bd4c14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UAIMJ+rXAAA+wsk+vRanNh6T7qSI/O0BcXyKzz/gueZkWc5+IAxnzPaFSeH7p58GcKfzCsjMbkBzCHknoh9SVQ5zkbpr9L8KQNStWeWPygG9IZe2ickX1EhilgLDdRyI2iuMtVZfP54yHg1fxleML6Kyk9bSL7Hx3d2Bq6GtGWYZHUGKpR+2pWLgYlaoESd3Fn/7TU8p5oib1iB4hAXXrenVkXOfOSPqT1DUOcK+qrDN12Lbg1OranAlOuSyfUuznJnqp64ZEmv/lFDk4hJ1BynFsw5EpphEvXcatMixkY94+3v8gR0mQ4O0nQh7P8QY17epDmNxgAHKKH4Fav0f4Hx/7BQMShxExhjdUPxkuFGv7vOCOxA51GZzwD23b9H6x42SJR5k1ruzB1tAnHKsd5jd1ggu91fQtCYAuW8X1bWDqvfsLeJ9XtWpGDWWk4Ev3Iytk5B4dcP4zK/p3roCh5FYIL9wrWbsQo2Cyu14hhrWPtUNDO6QVUedheSahgvUDVO6ktxrM4K/YH4+RoavS7Qhr+glpZDgJvpFGeKNVja03emFDdlqcuYuJwfPCQH2sUrjvf2VZSvA3fn1TFDn/LOxplfcXF5XQX+/MnYZfBnLDdyXmOgBfsmLCi9UcVY1Ppyr/Ro5oVlaM4FxoSWvYSB13TQIb9OtlvVtDKagQ+kNkN5uJCVAVQ6idVgLT3hQLtkh7Clzb6Om2lIJrts2p3ErOjieCBomic3fEBpeD85xskx0djdEfwdbRWwLBZ2TxKerN1Rr7B+DCifAaIYf4bdme1uiMRNzT40XKeHuUigwrtXN4B0WRp8z2TXcpx2bwlEknP1IdgYiDKYPNiFgZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(6506007)(6512007)(83380400001)(8676002)(33656002)(38100700002)(38070700005)(66476007)(8936002)(76116006)(36756003)(66556008)(2906002)(6916009)(86362001)(44832011)(66946007)(122000001)(4326008)(5660300002)(64756008)(66446008)(316002)(2616005)(6486002)(478600001)(91956017)(186003)(54906003)(71200400001)(41300700001)(966005)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkMwckNxSDkyRlY5a2paODJGM0s3cUljcGtIdHdxT2ZrMksrejluOXhZQm04?=
 =?utf-8?B?ai92MzI4TGRwU2c0Smx2OUgzcks0aHQrK3FmOUlhTlNTMldSa25WRGtTdktX?=
 =?utf-8?B?SHBxazB5Y00zVTRCaks0bnY1V1JRQjRvWS9Kc2RzQmdhbWdRTXRNb1ZORjhz?=
 =?utf-8?B?cTlCamY4eXpIa3QvVm5Bcmc3QnFNVThGRDdCSGU5YUhjWllIZmVsT1NMck1q?=
 =?utf-8?B?dHBCWm55Z1BMTVBtVUVUSjM4Snd0WXZPdzN6VkRFdEVSTnRFYlozVmdBYkh3?=
 =?utf-8?B?Q1Z0M3IvZjErWEJ5bTFMZnNwbFJ1VTdQM3pIbndJdS9HOEtBRW9HMGxFdytV?=
 =?utf-8?B?VGJETFZsSklOWUZIYll1T1grRGlFU1pzUUZnSk9JbHB4d2VEdWpPak9kL3NM?=
 =?utf-8?B?ME5pMUFiMW9wbFhab2xtVFpOUHFvQjhsbjNhVEJsbll1dWpzM3pqZXZpQWVV?=
 =?utf-8?B?Y2cvRnQyeDVTcmFtaXllOXM0dC9Vbm5GdlNTaVAvdXZ1RjJpTXQ3R1Rpc245?=
 =?utf-8?B?TXBQSGFHaURZWGI2VHd0aTBncm5BUGx5UVROVnhHdDJ3T1NwSFlzaVk5NmZi?=
 =?utf-8?B?ZHhrbm1meUpoN3FXRlJxeEFJdmErcDJHWGFrdzNldlRQOG1PMDlTdHhLYm5I?=
 =?utf-8?B?TkdpR2s4ejBJeVU5ZnZydEdxeGIyVG52Qi8rU1NESVFWYkZIWkg4bHNxSHlZ?=
 =?utf-8?B?aTArYjQ5VzM3WUJ3ZERBR1hyQUJKRWY4a3dkTFhjRWozOVhLbWJYdHp1ZXJT?=
 =?utf-8?B?TTk2MDZDWXRmbXJxNHhLa21BRlVkdklKWW5TRjdpSWIwdklIM0Jsb1BUVlI1?=
 =?utf-8?B?cmdLdXE1ckZQOCs3MFZqSy9CY1JHdHJOSkxmM0JhL2taTGZTbnpyQnFCenp6?=
 =?utf-8?B?ei9YaDhuYmUxWCszaE9HdXA1aFRaMTE4TGpKVjRzckRKZ3FRVVVxOGxoN0dG?=
 =?utf-8?B?NVpIVVF6c1RKaFBqNWJQTjNBbEtwODJmOVJCd0g3TUJXSTVsVnJGMU1ITnhs?=
 =?utf-8?B?RzFBTjRDZkJtejlvY2xMVk1BdXhlbE02UXJrL1kwMVdXNGtvbC9DN3NjZmVG?=
 =?utf-8?B?UFlhM3NoZk9hTEwzR2Q5c3NHV1Jhd1Uzb1Uzd3pRU1EyRTdMZ3hIMHJUb1Bw?=
 =?utf-8?B?Rzg5RGpzSmxqbXQxY0lJajR1bDNVSFNBTS9LWFloKzkyOTZnOW9wZEdCcCtj?=
 =?utf-8?B?RnFJSDhJeG9YSnM0WnJRZVBGWWNTa3VQR2x6a2R1YjNQOHl2OXQybU12b0R1?=
 =?utf-8?B?QWxBaDJRajZldk1ZSHJDNGpHU3VrUVo4MExRVG5FV1RpOFVQYnpBeEwvWTJp?=
 =?utf-8?B?bHRqOGNTa2ZwdjZDOEQ5cnV4R1N2ejNQa0J5Sm10bE5ma00yaGpnaXU1bHpB?=
 =?utf-8?B?ZkVKcmxTRmVpbVJTTEk0U1l6cDd2aXdDaU9hWE5LVE5xa1E0VmR5VHN5R3pJ?=
 =?utf-8?B?S1Fod2NvUks2V1U4NS9EaDFjYnFIdWpMcTkzbVJsMGU1UWFJLzRTQmhqbG81?=
 =?utf-8?B?U1BWdUF2d29vbjFBV01uRTVjTVpDV2x6MUlNUCtPeTZoemswREVldnRoMG4w?=
 =?utf-8?B?dWNDRUVpZjRnZmI3R0c4NlFkVHpXaUJTN3IrNTJNenBNdU1hc3V1THlWTGRJ?=
 =?utf-8?B?aktNSXFGY05hbjFFZFo1UjRFbVcyVzVHRUNYRDFyVE8xQmtaQUtVcUhLRFBJ?=
 =?utf-8?B?bnZMb2dORFgvaFpib0dESitSSldlVnhCc1h2aW5VMmR1ZDVlQy9CSFN1cGdz?=
 =?utf-8?B?TjFGa2s2cmsyNHVySVdYTDYxWGRPQ2I5Ync5V0JaVWdEYUJIbFFYYTMzSUVP?=
 =?utf-8?B?QnFZWGFaSGtTUDQzQ1Qza2Ria1ZGeENkc2dCeThFSDdTbU1keVE5SkJYck1z?=
 =?utf-8?B?c1NtR0xGQm9lT1FHWTRScGI2c2x5K0JTb3lOdHhKN2s5WVJiR3Nxc0NvR3Bq?=
 =?utf-8?B?cFlIVUcyOWhvRHhRNlBuSWtMUzZHZDR4dFBsWFc3NkxId2Z6SDQyb3VTaXRN?=
 =?utf-8?B?RlRQdjZBTjZ6L2pwVTdtT2ZvOUdmaHVqK3FNUWlQRThvclVsNnFzczJQK0c0?=
 =?utf-8?B?Zk9TQ01kS2pyOS9XeVJGSTJzU3Q5KzVnVzJtLzhjMjg3N2lhZDI0QWQySWVu?=
 =?utf-8?B?Ky9HRHBsdVIzR1dvT2xCakNiOHNQR0w1YlJkVGQ2a0R4c0loUFNMdmRKNGxL?=
 =?utf-8?Q?r0jgdNqUZAMxABjgsFh8zrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25FD6CAD9DF1914E97B34DC94352565D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ffe34b-5171-4aa3-8204-08daa1bd4c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 01:52:42.3337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QiB526BXw99tfS5UzTyapTqz8f3kXg4+wxc/C7pdAvSeLMkjnd+j9e2D0bgKnAWQgY9THAe/cu0ne1kgQQbSVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6133
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290010
X-Proofpoint-GUID: 27C0Pxn-N50a55xy3POw_LxNxhxC3Cvj
X-Proofpoint-ORIG-GUID: 27C0Pxn-N50a55xy3POw_LxNxhxC3Cvj
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

DQoNCj4gT24gQXVnIDI5LCAyMDIyLCBhdCA4OjQwIEFNLCBUaG9tYXMgSHV0aCA8dGh1dGhAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNy8wOC8yMDIyIDEyLjM5LCBKb2huIExldm9uIHdy
b3RlOg0KPj4gT24gRnJpLCBBdWcgMDUsIDIwMjIgYXQgMDk6MjQ6NTZBTSArMDEwMCwgRGFuaWVs
IFAuIEJlcnJhbmfDqSB3cm90ZToNCj4gWy4uLl0NCj4+PiBJZiB3ZSBkbyBhZGQgc29tZXRoaW5n
IGFzIGEgc3VibW9kdWxlIGZvciBzb21lIHJlYXNvbiwgSSdkIGxpa2UgdXMgdG8NCj4+PiBzYXkg
dXBmcm9udCB0aGF0IHRoaXMgaXMgZm9yIGEgZml4ZWQgdGltZSBwZXJpb2QgKGllIG1heGltdW0g
b2YgMw0KPj4+IHJlbGVhc2VzIGFrYSAxIHllYXIpIG9ubHkgYWZ0ZXIgd2hpY2ggd2UnbGwgcmVt
b3ZlIGl0IG5vIG1hdHRlciB3aGF0Lg0KPj4gSSdtIG5vdCBjbGVhciBvbiB0aGUgY29zdHMgb2Yg
aGF2aW5nIHRoZSBzdWJtb2R1bGU6IGNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aHkNCj4+IGl0
J3MgYW4gaXNzdWUgZXhhY3RseT8NCj4gDQo+IFNvbWUgcmVhc29uaW5nIGNhbiBiZSBmb3VuZCBo
ZXJlOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC9kN2E3YjI4Zi1h
NjY1LTI1NjctMGZiNi1lMzFlN2VjYmI1YzhAcmVkaGF0LmNvbS8NCj4gDQo+PiBJIGNhbiBvbmx5
IHRoaW5rIG9mIHRoZSBmbGFreSB0ZXN0IGlzc3VlIChmb3Igd2hpY2ggSSdtDQo+PiBzb3JyeSku
DQo+IA0KPiBTcGVha2luZyBvZiB0aGF0IHRlc3QgaXNzdWUsIHllcywgaXQgd291bGQgYmUgZ29v
ZCB0byBnZXQgdGhpcyBwYXRjaCBpbmNsdWRlZCBub3cgYXMgc29vbiBhcyB0aGUgNy4xIHJlbGVh
c2UgaGFzIGJlZW4gZG9uZS4gV2hvJ3MgZ29pbmcgdG8gc2VuZCBhIHB1bGwgcmVxdWVzdCBmb3Ig
dGhpcz8NCg0KTm93IHRoYXQgUUVNVSA3LjEgaGFzIHJlbGVhc2VkLCBjb3VsZCB3ZSBwbGVhc2Ug
cHVsbCB0aGlzIHBhdGNoIGluIC0ganVzdCBzbyBubyBvbmUgZWxzZSBoYXMgYSBiYWQgZXhwZXJp
ZW5jZSB3aGVuIHRlc3Rpbmc/DQoNCi0tDQpKYWcNCg0KPiANCj4gVGhvbWFzDQo+IA0KDQo=


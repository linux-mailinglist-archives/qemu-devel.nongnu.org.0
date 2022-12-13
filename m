Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51A64C051
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 00:12:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5EQA-0005rh-Qt; Tue, 13 Dec 2022 18:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p5EQ2-0005pQ-Jn
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 18:10:43 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p5EQ0-0001WU-Dl
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 18:10:38 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDLOOBp026380; Tue, 13 Dec 2022 23:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=FSXfjfnmYoX0Zr3xYWdkbZ+cWvxFn+pOk4FlfR3G1N0=;
 b=Kr3VyJNs+9QEij5YAhKTj+aSrUa/w2HqCWWsH6gAGQYmhZYJ46WxQoMigvJKqrfNvwXR
 jMfRj46ErrPsT+0fl8NaTuAJDO+ATPE/9DhRWkM2cLstOC69QvOyeGbFbuKxAPJ/XYj/
 HLdHI6imzRVcc7NsVwVUlmxEalMTPGji0+rKStBkHnKuWboNaUV3pGZvKYC7/4GpGr/8
 26D2l/38ECxfRP34aTbflKJDBrmxp2hSJuC9r5onBCcZ8E8zM5lJAu9spOhMUL9kwq4T
 urpVslmb2OHT9yJgchJVrB1D30tqoK7XEMlEIqNmXPj1CZetWSsBp33Z+yobROWAKcot Uw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3meyewrhv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 23:10:32 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BDLKGqP037354; Tue, 13 Dec 2022 23:10:31 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3meyeka1t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 23:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC3VBx7Xc09iTm6wvv1C9C3ZfZeFnax3Nh1ajX5TUrSQQG5OL2VdyyoemO63HILD/BV+JnLjrx1CcKiFtOXlj4dQvukcElxq1S9YzMLFPEE7V8/v6xLKgMFzxMXqQKfBO+Kg3bcxyFpjG9aPlUh96kNg4+ptFw1xVQHFDabMfKsNg6ugL0hXXtvvXg0N0fvHNT9KlU8RupOQ1kOyjMp+ondkFJBbJa4deboEns4il986nRa8PfjVMlywLPz5ITm9j3VJ7Rm7B8tTfC4N7UBxQubWrLEAZu9uyhYpM1XLr5hL6Pq98grmnk53ZaUfjkqQ2PnqUSNmJQia9uumUucEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSXfjfnmYoX0Zr3xYWdkbZ+cWvxFn+pOk4FlfR3G1N0=;
 b=FwN7zw8LwFh2mywc3VqftLJQBlD3/ZUxfvQ4JcqY/3/H1g5IRZzcMMDyRdmtQ9p6EZLzAB9kaaxXl9IL9AMtQWsJ8Z8Sn6qy5Xnke1/lWDJpkHFO+Mn4YY7E42ZDEH3Iniud3nLEFdOlc1OY2tvMwCBu+nmLPGn+8G3DuYz/2HFiE0WCJxSxws92gySonkg9A5c4KB3W6KDh7/N+2Cn96ZY440TWMG4wv3/fEnxGlLQ+Mc30rbU8ornS0x4v+q5uNBD+VrVAe1baItSxPKrICbBAncXRwAE38pR6JfmztB4Wpthb0BN0eIhKYrEviD70R5LxXSTawLDQXVsWX0giGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSXfjfnmYoX0Zr3xYWdkbZ+cWvxFn+pOk4FlfR3G1N0=;
 b=IPxKYWm86tuEEI1KKGjQXY0/Tkm+kmSVkzjK6jkH3+qbL8omklK9oRlsX23EED3X8RxBY3Q4nBc1+iGF/mFnnizQwYpM8AWmFmyWGY5u1Y342DuxFR/ZmgXXVwfIoui7P8gAaW6kE9FbOMh9hOL/QMiKy5NRhKpHRRSY8Zg+2gY=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 23:10:29 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 23:10:29 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Topic: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Index: AQHY86IbZmOj4+Y5z0Gyi+NUEacgdK5sO8SAgABtJoA=
Date: Tue, 13 Dec 2022 23:10:29 +0000
Message-ID: <056D4C41-E082-4EAA-96FE-ACD8015D02DA@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
 <9fb35cf6-53bf-1309-c27e-de3bece7fbe1@redhat.com>
In-Reply-To: <9fb35cf6-53bf-1309-c27e-de3bece7fbe1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|SJ0PR10MB4463:EE_
x-ms-office365-filtering-correlation-id: 3e48d71a-1c35-478a-b4d6-08dadd5f3a59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: keoT3OZMQ+X50V7DJNNHfiB3hN1ug4OqbxeZ7umENRUPHLo5v4+kpwC3f1uDZxO0J/LnsnPpHpGdBPKwL4hoB5s4W4G7jOJ3NMNsJ0FYK/DczPiQ2aikct8lApBmakOyF1aumYkNsNFYTYvtD6vEA0RSViiLGcvWeTzfwXWYEMPvHlNErLki+l8Y0XLasNEq4vFhL5P/TwarHaD2+s3GhvVQo+l7rqFkL49/7O6wn3O6Gu+lSZn4DLOgxbYk3Fkh+pkqjjcCUY2uavhFUvIVogu12FIdWxb1OORtN3wsffvn2e7Yc/2p+DQHuM5D6I4RBJ0XZU2ydiuO8HLt3nzpnTj1e9mAANr85Kd1hF0iWjjImMWrMsyH0IMfZMapwHbv4tFzPSMWohCxr0yDBWLGB0HTxxsTRfLlNFNgcD6862oTESaFA3UASzz6i1tr6/6FRBl/3aDlqg0j4Yyq9VcUTzshYrm6/KvkcQDZXPnzwRH5JlsNAEHp7fl+lGsrkGHRRNvRvtk4E5KDraZXHdf8LsQyfMpm2I9N+W1tmbfX31kTD3n/HVL02e6R2guiAQ/YHxS9o8gxsKKfoSk5BhTAUTifeIwq5CGrVGXrc0jwu/YaRIeeSHxa6AtR5yc7OwvOSx2D/xeIErSFDGKzgfT3BOlZABoDtmczVGGwLAqfhLHb2fcDwCU52yYwfHF1FnQv3gadaJghlR7XQ40zjQhQei1gCwIApP23R6KzXTblJjo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199015)(4744005)(38100700002)(6506007)(2616005)(478600001)(41300700001)(186003)(66946007)(76116006)(4326008)(86362001)(6512007)(26005)(8676002)(64756008)(66556008)(66446008)(53546011)(71200400001)(38070700005)(66574015)(83380400001)(66476007)(5660300002)(6486002)(8936002)(36756003)(6916009)(316002)(33656002)(122000001)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am1Ca0hLRVM1eUswazh3bmV2c1V6cjMycWhyR2l5T05JdldNdWw4Q1RQVzds?=
 =?utf-8?B?VGV4dis2Q1lBRERaSjVyckhPdlZEdk1ENkMwVDNIam80eDRsbEI0cjFVUDhE?=
 =?utf-8?B?V0l3MTc3VWhoSThBUVlLK1FtcUdiWGs2bVgva3BsSXA3eFFXUjRNcURlUVZN?=
 =?utf-8?B?MHZBV3pFSTY1Smo3aWxiTk04UkowK2h2b0NWNHEyWHpkMGdlcnIyTkpxcDJ4?=
 =?utf-8?B?WDM1U3BxU1dONWlITTRxK2MvK0NPUU9lWUE5dnF2K3lOZjdnN1JrbXdnWEhO?=
 =?utf-8?B?dzNhZFBFUUovblQxWVYrVy94VUltRHViQlNzcHk4ckM2MFdYODZBdnpNdXVO?=
 =?utf-8?B?QkdtcXN0c09NWlZjUkQ4ZklSN1UzNFVlVmN2WTRMckZrNFcxNTU3eE5VK0M2?=
 =?utf-8?B?bFBPWlZIYlpoTjR1dWE2YnpZMndyV1IwOXlXcFZXRWhRbkxLbjhnWDBrb2h0?=
 =?utf-8?B?L3RUUG5RanFjVThBOGtkektUWER3U2I2VWtCTm9FMHZ6bGowUXk4NjZSalhR?=
 =?utf-8?B?b1BPWFp1NVRKMWZTL1V2WTRJL1ZIZ1BXMzZuZUViWjUrK0hoSUt3SnphMUJY?=
 =?utf-8?B?VkVhR0xKWnpTeStjYTJtMG5rdGpySVJrZXZuQjc1Q0RwWk1Ga0l5UHBkVjFs?=
 =?utf-8?B?dXpVbzRKbnRMRnE5NmRvVFhCa0pNcmJDSUFPS1lnQnQxQUtucWJwNnBPRGI3?=
 =?utf-8?B?c3h1S21QdGU2a2UvQmRkaFdpUno5R0pIRVpmNXNNb0JCWW5vMlV6OEQvRXVS?=
 =?utf-8?B?K0J4VEZvTEtFd0lrOGxHUjBhN3NjdHRpN2JBYTh4ak1WaERLQXQyYmFRRE9X?=
 =?utf-8?B?RWZCcG1WeExlM2wwVjZIV1A2Y3JwejFORDkxK0dUOGhIVjBJSFhqY0tDVkZk?=
 =?utf-8?B?YnAvV0tBNkVIM3VUa1BpeFplWit3b0F4bWcrN1RSKzRtRTM0Z2wxeWhDUUQ0?=
 =?utf-8?B?NFIxUzl1aG1vYXVzSys2dzRYYnBQWmpqLzVYRlEyNHZtVUJtMzMxU0JEY05M?=
 =?utf-8?B?ZExzRTFlZEYwMGZ5b1lYUW5DWlo3T0Eyc0pzanJDR3dUSlE0b1pKajlkMkxh?=
 =?utf-8?B?aVZQaTdUM0tXWk5xL0dJQ2lzdXd6Z3Rwc3ZmK3lsZ2o1RjA1SGxzcW9oYmJp?=
 =?utf-8?B?V3Z4d3BPVkdRcndlb1Fjc3dXMmpTUVlmQTczZ0dBamtLZXZoU2hrWk5Ickdn?=
 =?utf-8?B?ZmxvRDA3dElSM2U2UHdTblM4VXNIYTk2dXNRandmOUlEZ1NOZ1JSR20rM0tH?=
 =?utf-8?B?N3RvS0N2clB1RUppRGdQK1k0UXFIaHJqOEZVWWVxZjc5bi9UR21aWHRQMHBO?=
 =?utf-8?B?ck1Cc3hvYy84d3o1TWdVQmdyTXhVUFFKQTIwaENzZTBCRitjL2RqeEpBakRs?=
 =?utf-8?B?M2IyNXJrSVhHb2trRXVmdnpYYlhicEZ6bEl4a1Jnb0ZVcE9tSFR0ZDYzVjQ3?=
 =?utf-8?B?U2ZsQzVFd1JrQzRkY1J2OHNZVGpCRHFpUys1MUxVVFBwcmdVY2pFOVZZUmdx?=
 =?utf-8?B?VTNDT01HZ3RlejFrUEp4cGE1TUk1UjNEaHpUZWRpcTVJa2dJbThrOXlkcHRG?=
 =?utf-8?B?L1hmMmx4NGxnRlo0Wk1YVG45Tzh3WlZTQWtzcXRtdXNFbzhTZU5LcmlSMFZJ?=
 =?utf-8?B?ZVNzdDdPZFdKTzJmVnQ4aFB6c1lsdm8yODJxUlNsSnhSWmlUR1hPenBUZHov?=
 =?utf-8?B?RmttV043emRxS3VzTEpjT0gzUk1ibnlhN254OVNYdHR0NGYxekJJTEFQZU9x?=
 =?utf-8?B?ZkRid0FVaU8yR2pTZ1pQdnNsMU9kMnhWVjljeU1JK1FIc3l4eE4rMWpoOGlH?=
 =?utf-8?B?YzJBSVc4OUtHRkgrZ0xQbXNDZ0g3NDNqb1Z5d1l3UnFqZGJiWU9mUXRFeWVJ?=
 =?utf-8?B?MlN6dGdrNElGWUlvMDJwR2VxNGNVMWdzRnhEZ216OGUvaXdOK2hNbjFUWGVM?=
 =?utf-8?B?Wk1PbnduRFUwSHNIYnhhb0xreUUwakp1NW9kREZsYldkaGwxOGFQS1lLbEZL?=
 =?utf-8?B?UUVXOTlNYlBHZW4zUXBFTGdJVXdVeWlPS1ZZTVBxYjgzQ1R4aGxGQm4rTytr?=
 =?utf-8?B?WmpsbnFMN2pzWWM3ckVOZEc4d012RnNyeHFOMllZYXZPRVhBNTlQNkpCcW9E?=
 =?utf-8?B?YU5DamRDNC91Vlp5UEd6V01Hc3dYZkVqY1ZNYTFmM2lWODhOeFRoc0x0TVgy?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D270862C01BB7946911284100248D31F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e48d71a-1c35-478a-b4d6-08dadd5f3a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 23:10:29.6310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQLoNeHkT+xchqAPwaCAp2Jllq9DycwLYjQR5164utEqBdwzJbSSHsgKHYbzhENjBwHz9yIm2bSQcm2ps89aWmnbT+3VphhAI4QBoUqHuUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212130200
X-Proofpoint-GUID: F88mqhAFpkoHG31IFGNJgp_F4JtfNpNt
X-Proofpoint-ORIG-GUID: F88mqhAFpkoHG31IFGNJgp_F4JtfNpNt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gT24gRGVjIDEzLCAyMDIyLCBhdCA4OjM5IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gDQo+PiArDQo+PiArICAgICAgICAvKiBtdXN0IHNlbmQgYWxsIHZhbGlkIEZE
cyBvciBhbGwgaW52YWxpZCBGRHMgaW4gc2luZ2xlIG1zZyAqLw0KPiANCj4gd2h5IGlzIHRoYXQg
Pw0KPiANCg0KCVRoaXMgaGFzIHRvIGRvIHdpdGggaG93IFZGSU8gc2VuZHMgRkRzIHRvIHRoZSBr
ZXJuZWwuICBUaGUNCmlvY3RsKCkgaS9mIGhhcyBhbiBhcnJheSBvZiBGRHMsIHdpdGggLTEgc2ln
bmlmeWluZyBhbiBpbnZhbGlkIG9uZS4NCkZEcyBjYW4gb25seSBiZSBzZW50IG92ZXIgYSBVTklY
IHNvY2tldCBhcyBhIHNpbmdsZSBhcnJheSBvZiB0aGVtDQooYWxsIG11c3QgYmUgdmFsaWQsIG5v
IC0xIGhvbGVzIGluIHRoZSBhcnJheSkuDQoNCglJbiBvcmRlciB0byBlbXVsYXRlIHRoZSBpb2N0
bCgpIHVzZSwgd2XigJlkIG5lZWQgdG8gc2VuZCBhbg0KYW5jaWxsYXJ5IGFycmF5IHRvIG1hcCB0
aGUgb3JkaW5hbCBpbmRleCBvZiBpcnFfZGF0YSB0byB0aGUgb3JkaW5hbA0KaW5kZXggb2YgdGhl
IEZEcyBpbiB0aGUgbWVzc2FnZS4gIFNpbmNlIG11bHRpLUZEIHNlbmRzIGFyZSBvbmx5IGRvbmUN
CmF0IGRldmljZSBzZXQtdXAsIGl0IHNlZW1lZCBzaW1wbGVyIHRvIGp1c3QgYnJlYWsgdGhlbSB1
cC4NCg0KCQkJCQkJCUpKDQoNCg0K


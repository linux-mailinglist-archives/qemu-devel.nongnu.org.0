Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843846B4B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:53:18 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVHp-0000XP-7P
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVDS-0004wA-Ea
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:48:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVDQ-0005cm-0B
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:48:46 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B752PxO016363; 
 Tue, 7 Dec 2021 07:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6E3ac2nccCkZ++7lWQhuDb9aGqOTRQhmRu7sGw5p9Xs=;
 b=L9D3uHSWNX6SF38o6IwcIISb0+2at3yEHnRlNymfgZTxXAvbrBppRPRzhCj3sK1iBUCZ
 1dXCAb3eMAJJEld1O2NHvvUeK7PYuR7vJjMc3Gi+D3+RqmbuwJdvFhUCqdw4ia8iv80K
 XTbCgUibx7UX2zp8xTX+HB58FccxM7f+hT+1umo6Ct7jQG5CCOhRarOoyzeD/3/rTuGj
 +Ws8drGe3gKMkRf99DuwMmlcWhrEljrdhk96MqXMW/uD6mvtoIlu/4fZAA2GcFhGf4ed
 hrw1K/30vLh6UIp9JCdXmelvej2ENFg/WPVEbNNyfoESy7rQmva5ffZ8qqx+22NU8Oag jQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwmjpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:48:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77eeGN008063;
 Tue, 7 Dec 2021 07:48:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3020.oracle.com with ESMTP id 3cr1snjenv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:48:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOt0WU8zQKvOkwg7aSEFf9m8REISGu2YgPaxGaBMCPiGElRosVGFJSFkm7sOZgW/ohGB0reqFXqSFrdtaoSlTC+DHaBvKF0GFZqdwUccb4Sf0WrKKp0z/JqAjwrA2S/r+H3KAC/kbh6DGKDwL6VXyFIGjyTMMOb6QQwWce5n8328gFRswc5GToCBbWNVrt2OxT+qJ50StoumHxooWvy3j5EZ765wSQVxMASNNwcKQJDgMs44ehWhKJ3YPoPk6JLdaCt2BUaA0yX4JGme6gn8VnkJZqoFnQ+hWErxJ3V6EgUaP5OQ8PdeF5cQzGe6fTyrnMpflwJmml43ybgsgDhY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E3ac2nccCkZ++7lWQhuDb9aGqOTRQhmRu7sGw5p9Xs=;
 b=a2w6cIctDWLdTghRqzR8aawpoJdhc+9JeQGNKnLIWjGF2R9K+8V5BCITNFJ4bsAt86u0qgEgYxTRjuerNYIdvtTIVgMOj7JU3TROoMtrLjWwJ0V+p1dLH8EV27pwWpL118MmmWPX3sya8UkqM+EL6e31TvSdPRNiZ7gMgH202irTW7iifTmhKzJjsFjhZ/0trxB9NFFNLHcht835BeFut5UoEyZRjtSHqOhVrFZTPSYWEu6nj0Cy0qk0yF37FZvL7R+pY1Z5Kx7z86vGYZmX6raKQ3kcD7dSKchXG6jpmv9g8Rnv03BVPuGo4BYMd+B7NTv2DSN+UcWrfR4bdBBQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E3ac2nccCkZ++7lWQhuDb9aGqOTRQhmRu7sGw5p9Xs=;
 b=Cx4wq+Gi2kVlE8x2RKiK4TZVGlfZKzefHO8+O7Lz7Y+o9qn0Z6+b5YVC/fkb1z89Zn1c1RmlmIZq7qpEFoKa9AGn5BRElLVLvb91jvgFv03o16/qbnIEiDO6aMtHueHdlMdODtkCezDQcE71Uj8zaiodcXv5Dlde5z9jk2BMatY=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 07:48:33 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:48:33 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 04/19] Add device IO ops vector
Thread-Topic: [RFC v3 04/19] Add device IO ops vector
Thread-Index: AQHX0bosJ42Nm9UEE0eC07OYMNhwJqwLifGAgBtQRYA=
Date: Tue, 7 Dec 2021 07:48:33 +0000
Message-ID: <2616C02F-E11D-4E70-81D0-4F89329FEF44@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <c8f636ad86d8b89f4610e95089ad49816c70a7a6.1636057885.git.john.g.johnson@oracle.com>
 <20211119154215.31c599eb.alex.williamson@redhat.com>
In-Reply-To: <20211119154215.31c599eb.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7612d713-ea0b-4bb6-ef4d-08d9b955f813
x-ms-traffictypediagnostic: BYAPR10MB2999:EE_
x-microsoft-antispam-prvs: <BYAPR10MB299972B9E75E5E31C74CE4A6B66E9@BYAPR10MB2999.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5VKU1hdeZbVIw7ClCg7d5EYzKL8QWE1sOqnVHdNbxnNP5BYk5C61uP8bfJwmYHR60iT0cLRzS+6coGvwPAMo/Spi3A0CIPCwOWikgY/oHGhGLC6bzgI6DA196X8fmMGqsRRxEi4UVyXIKoPRk4UBsXbJsHeXN2agtv6WhVN+q2VGsR9/IJjvQCk4PIuvd5GakZYd/bHa+7RD351EUW2a3CKipDzzyoQD6sZS8EtQWcVrifEKyMMvE21vzMQKfCOXSruiR9l0bdkW8o/zIB03ERYWyGDaztxCp4sE8jzfRv6yzXCndqhbDFHW/EEADdJgwGZ96RFCF/qA+WN6QKjJjhlK1je+9cGS09WYHX+l4UCd4+bqwAnoFiCtfh9Srwhwu6nv6tmgQTiDZNTpK2QNC6DnGW4O5PgFTfv1ZX6cG0mTOmTtIdzVHIkkdVNomoi+jeWvdMa3Z71UoQS754ZvSpLgKPJ8UQW16/kxdyeJJAHQl0039ymz09fx7kcMO+y0gGDaDNBgvKXDPNQ3XuJXFnIY23sz3Sm+N8UOTOwuyaG3Ag0+KV0a9NoMbBIDGHXzcIT7QJCe3qkUHISOaeS1PGyxI0acv9XMKCAQ0NkIvtI/bKPNPbn/pt1V7UFyJZjdTv71IdZe4dfLSmYMZ2i5ETIO5EEMYbyVH1ucP5P4xWgZ8FlOmTcrRUcM1BBKUsFidTKrrAa3hsBVD9fwWD/KEbfMog/EZigUpJCQlBVNJ0JegSI71TDstF/MgeDjnPX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(316002)(186003)(8936002)(2906002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(6506007)(53546011)(26005)(4326008)(83380400001)(86362001)(36756003)(6512007)(5660300002)(6486002)(38100700002)(122000001)(71200400001)(6916009)(33656002)(8676002)(2616005)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekJxUUo3SXBKMzlRL05OWWlEL3RocVVVZkxPT2NqNFA2Yzllbys1ZTJ4dy9x?=
 =?utf-8?B?QldkOEYybVBCNDFtRmNpay9oZFo0ZXg5anJFck9OUUVZYmY4RHduRk96NHBV?=
 =?utf-8?B?YjJsZXFLeDNyZnVIZ1kwVldkdUNOWjJZYzg4Z2tPNEpRQjBBUEw3SHRRckpn?=
 =?utf-8?B?Q3VlSk5LR0FsWlpmWEJIQzFBMzlYL3YvZnBlTFBLYy95VUFHZDJ4cXRaTnR3?=
 =?utf-8?B?Qkh2Unlya3dmZ1Z1cSsybTR6c3ovWmF5RHVBMlJtZTN4Q0EvUnVuMDFwUHg1?=
 =?utf-8?B?cTlkM1ZhYlUzU0QwOUZlVVpjR2M3d216bFFqVUxpdDRKWHI0cHMvd21GbXBY?=
 =?utf-8?B?Mk9sUExpblJqZzFmNVdINXNpRTFTZE01bGhpRUtUcGxJK2V3YmNBa1I0YXVa?=
 =?utf-8?B?V3A0OUxvS0F0UGUzMGhOeEJFdGtKbUdCRVBqV3JCWWp5QngyTVVDb2YyUmpI?=
 =?utf-8?B?Z21PVHhKL2lxaFhNU1VhdEpxcGNPVWRxK0M2Tm0yZDdOV1RSUW1QbmMzYnlv?=
 =?utf-8?B?M29FMmdTMEdKakc2WXBPYkdWT083SGR0QlpBMzhHcWttOEp0VHEvelNZSWRm?=
 =?utf-8?B?Mit1MnRjNUtzTEh5UHJTdmoza05YeENlaUloYm83UDcxUXJtVHBhWEhJcGs4?=
 =?utf-8?B?TU40dEtQdVhrUGw2VWhsOWNMQmtwWTZsSUdXMnhCdWFMYjFXYWIzWjJaNVF2?=
 =?utf-8?B?Q3ZORUQwVUJJQzJTOHgrUXdvMzF1b1g3b0d1TVBxUTZLdzBZZFFOU2FUY0ZN?=
 =?utf-8?B?dmxTd1NnWTI2VEV6RGIrRUxIV0IyYVlURDZ6RjRYQ0tqenQwN0ZlY3c4RjJI?=
 =?utf-8?B?VElLRHVITEhwdjNhbTk5T1Bsc1J5cHNjZnE5aFJIelNhT01HbWlsMlpyb1Jo?=
 =?utf-8?B?REd0MzFDU3pEeE9zNGJ6QmFaazVKbWVnMmllTGJBc3kyOGpDQlZ5d3dFdVov?=
 =?utf-8?B?WU9sakJaMjBLRjQ5ZEVneUVyTE5hRVRsSWN1RDdtaiszdHpnMENNcnFVT3RN?=
 =?utf-8?B?V2Iva3VxbGNReEQ0emhaTTZacmU3eFBZL1NXL1NMUDJxR2gxSmNyeGtyb2pK?=
 =?utf-8?B?cHlCQ01SK1FudDd1TVprRTVZaHM4SXJKNlMwU0w1bHFaM0huNUF5S0pUaU4x?=
 =?utf-8?B?L213d3NNQXp3d0ZPLzE3WHF3eUd1T0Z2N0duSzhNbTVqZWZBMUpESnVBRUJm?=
 =?utf-8?B?WmdubjZQY05KL1RwaHR2S1VXbCtPVGVmc2FIVkFlRlowOWVpbUNZbDQ5U2ti?=
 =?utf-8?B?TnEwd2RYaStvQS9sZGRDL0tUQ3h1c2hKMXFUMEVscGFNMjk5TThicWkvNDR2?=
 =?utf-8?B?UXZhU0dHVVpDMU93dUo1ck1GYTVOc2x1NUxjb1ppRGdaRnpjT3hyOEJ4b25y?=
 =?utf-8?B?TUdBaWZLYXU4TlhzNGNxV2RMOUMxbmdoQW5DS0lDUFIxUU1jYzFmNnMwYUpr?=
 =?utf-8?B?NGZ3MGM5R3dOQW9URVNMTURSTTIxaHAyVWZaam9RRExqUmtVSlBBSlF4NVpJ?=
 =?utf-8?B?UnB0citOQ2s3eWFmRm1XelZuNlVaM1N3ZWIvTFlEL0xmWW8zaTd6amd0c0dx?=
 =?utf-8?B?YS9Fa05GMy9BOGo5YlBteGNrZjh6bk5INXpBY2pjSVpxY0JNMFVCdXJkRTNQ?=
 =?utf-8?B?MjdWNmR4MXlrYzloTmhJNzh2M1BmQXdOY1lpdEZLY1M1SUpTdHYraFFVRjg1?=
 =?utf-8?B?bVc5cEFVQTA0MGVHRzRFUHZvaUc4Rk1CSDVPMmphM2hwWnF2bTFLclkyNFFy?=
 =?utf-8?B?ZXUvOFN3M0xqZzVUYWxYNWtteTcvMVg3eVdJd0JWdEdvSmZtZG1mbkh5U3pP?=
 =?utf-8?B?MUd0NllOSkFjK241NzZ1bDJoRm5ONVpkVHVHYmZ2dkxzdEUrV09wZHl5MHpy?=
 =?utf-8?B?RXhHaGVyZHFwTmNXU0NSWE1lZERVRGFJMndVaHVDUjE2K1YxdGY0WDJTMmN0?=
 =?utf-8?B?eFhSQWp4VGorcFNjZG5pdXovOEduUnM3TUNKRG5oOUp0Q05taVBENEZFT3p0?=
 =?utf-8?B?NWFFVm5ROTNXcHY4YnY4dEZ5b3owbFhUYXpmd2h0VHoyTE52cmRkY0lSYzlW?=
 =?utf-8?B?R2txSk0yTGJibFJzOTE3QmlESzgySStuVXd5NWFUczNvZXFBRXEyR01ySHNQ?=
 =?utf-8?B?Q0hhR0p1QzR5N2xwV3lRRDZoeHFCVmpKMEI4cE5JSDd5SW1aY2c1bWE4dDFC?=
 =?utf-8?B?Mk5SVGkwZElwdERVNGpRRFc2RnBTdVNlUkRwK1VCSjVUamRrNnd1RWcxWmFp?=
 =?utf-8?Q?5/DlMfsIc2J1Yncbhgpx7Bbukw6g0cuWf3zyJQDYP0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96FC860898819C4CA2954CD6FC6DC074@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7612d713-ea0b-4bb6-ef4d-08d9b955f813
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:48:33.4269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zk1R19Jy6L4+Tda4reJw3KMq7BrTF9zW65Dqnck4bD3NYXXmhbFpTiXPHz0MKNLRAo0JVSDaHZu7m3X3eEuhdNlP3RtAsI3PQ20KPxLji6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2999
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: Ge4z6_WUj-yUGXbJ6XmIuShOtwBil5Ly
X-Proofpoint-GUID: Ge4z6_WUj-yUGXbJ6XmIuShOtwBil5Ly
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6MzIgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiANCj4+ICsgICAgaW50ICgqcmVnaW9uX3dyaXRlKShWRklPRGV2aWNl
ICp2ZGV2LCB1aW50OF90IG5yLCBvZmZfdCBvZmYsIHVpbnQzMl90IHNpemUsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgYm9vbCBwb3N0KTsNCj4gDQo+IFRoZSBAcG9z
dCBhcmcgaXMgbm90IHJlYWxseSBkZXZlbG9wZWQgaW4gdGhpcyBwYXRjaCwgaXQgd291bGQgbWFr
ZQ0KPiByZXZpZXcgZWFzaWVyIHRvIGFkZCB0aGUgYXJnIHdoZW4gaXQgYmVjb21lcyBpbXBsZW1l
bnRlZCBhbmQgdXNlZC4NCj4gDQoNCglvaw0KDQoNCj4+IA0KPj4gQEAgLTIzODIsNiArMjM5OCwy
MSBAQCBpbnQgdmZpb19nZXRfcmVnaW9uX2luZm8oVkZJT0RldmljZSAqdmJhc2VkZXYsIGludCBp
bmRleCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmZpb19yZWdpb25faW5m
byAqKmluZm8pDQo+PiB7DQo+PiAgICAgc2l6ZV90IGFyZ3N6ID0gc2l6ZW9mKHN0cnVjdCB2Zmlv
X3JlZ2lvbl9pbmZvKTsNCj4+ICsgICAgaW50IGZkID0gLTE7DQo+PiArICAgIGludCByZXQ7DQo+
PiArDQo+PiArICAgIC8qIGNyZWF0ZSByZWdpb24gY2FjaGUgKi8NCj4+ICsgICAgaWYgKHZiYXNl
ZGV2LT5yZWdpb25zID09IE5VTEwpIHsNCj4+ICsgICAgICAgIHZiYXNlZGV2LT5yZWdpb25zID0g
Z19uZXcwKHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICosDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2YmFzZWRldi0+bnVtX3JlZ2lvbnMpOw0KPj4gKyAgICB9DQo+IA0K
PiBTZWVtcyBsaWtlIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiBwYXJ0IG9mIHZmaW9fZ2V0X2Rldmlj
ZSgpIHNpbmNlIHRoYXQncw0KPiB3aGVyZSB3ZSBzZXQgbnVtX3JlZ2lvbnMuDQo+IA0KPj4gKyAg
ICAvKiBjaGVjayBjYWNoZSAqLw0KPj4gKyAgICBpZiAodmJhc2VkZXYtPnJlZ2lvbnNbaW5kZXhd
ICE9IE5VTEwpIHsNCj4+ICsgICAgICAgICppbmZvID0gZ19tYWxsb2MwKHZiYXNlZGV2LT5yZWdp
b25zW2luZGV4XS0+YXJnc3opOw0KPj4gKyAgICAgICAgbWVtY3B5KCppbmZvLCB2YmFzZWRldi0+
cmVnaW9uc1tpbmRleF0sDQo+PiArICAgICAgICAgICAgICAgdmJhc2VkZXYtPnJlZ2lvbnNbaW5k
ZXhdLT5hcmdzeik7DQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsgICAgfQ0KPiANCj4gV2h5
IGFyZSB3ZSBjYWxsaW5nIHZmaW9fZ2V0X3JlZ2lvbl9pbmZvKCkgZW5vdWdoIHRoYXQgd2UgbmVl
ZCBhIGNhY2hlPw0KPiBUaGlzIGxvb2tzIGxpa2UgYW4gb3B0aW1pemF0aW9uIGZvciBzb21ldGhp
bmcgdGhhdCBkb2Vzbid0IGV4aXN0IHlldC4NCj4gQW5kIGlmIHdlIGhhdmUgYSBjYWNoZSwgd2h5
IGFyZW4ndCBjYWxsZXJzIHVzaW5nIGl0IGRpcmVjdGx5IHJhdGhlcg0KPiB0aGFuIGNyZWF0aW5n
IGEgY29weSBmb3IgZWFjaCBjYWxsZXI/DQo+IA0KDQoJVGhlIGFyZSBhIGNvdXBsZSB0eXBlcyBv
ZiB2ZmlvX2dldF9yZWdpb25faW5mbygpIGNhbGxlcnMuDQpPbmUgdHlwZSB3YW50cyBhIHNwZWNp
ZmljIHJlZ2lvbiwgd2hpY2ggaXQgdGhlbiB1c2VzIHRvIGZpbGwgaW4NCml04oCZcyBvd24gZGF0
YSBzdHJ1Y3R1cmVzIChlLmcuLCB2ZmlvX3JlZ2lvbl9zZXR1cCgpKSBhbmQgdGhlIG90aGVyDQp0
eXBlIHVzZXMgdmZpb19nZXRfZGV2X3JlZ2lvbl9pbmZvKCkgdG8gbG9vcCB0aHJvdWdoIGFsbCBy
ZWdpb25zDQpsb29raW5nIGZvciBhIHNwZWNpZmljIG9uZSAoZS5nLiwgZm9yIHRoZSBtaWdyYXRp
b24gcmVnaW9uIG9yIGZvcg0KYSBzcGVjaWZjIGRldmljZSB0byBzZXR1cCBpdHMgcXVpcmtzKSAg
T24gdG9wIG9mIHRoYXQsIGVhY2gNCnZmaW9fZ2V0X3JlZ2lvbl9pbmZvKCkgd2lsbCBuZWVkIHRv
IGNhbGwgdGhlIHNlcnZlciB0d2ljZSBmb3IgcmVnaW9ucw0Kd2l0aCBjYXBhYmlsaXRpZXM6IG9u
Y2UgdG8gZ2V0IHRoZSBwcm9wZXIg4oCYYXJnc3rigJkgYW5kIG9uY2UgdG8gYWN0dWFsbHkNCmdl
dCB0aGUgaW5mby4NCg0KCUkgdGhvdWdodCBqdXN0IGhhdmluZyBhIGNhY2hlIHRoYXQgZ2V0cyBm
aWxsZWQgb25jZSwgdGhlbg0Kc2F0aXNmaWVzIGFsbCBsYXRlciBjYWxsZXJzIHdhcyBhIGNsZWFu
ZXIgaWRlYS4gIEl0IGFsc28gc29sdmVkIHRoZQ0KaXNzdWUgSSBoYWQgdGhhdCB0aGUgRkQgcmV0
dXJuZWQgaXNuJ3QgdXNlZCB1bnRpbCB0aGUgY29udGFpbmVyIGlzDQpzZXR1cCwgd2hpY2ggd291
bGTigJl2ZSBuZWVkZWQgYW5vdGhlciB2ZmlvX2dldF9yZWdpb25faW5mbygpIGNhbGwuDQoNCglJ
IGNhbiBjZXJ0YWlubHkgbW92ZSB0aGUgY2FjaGUgZmlsbCB0byB2ZmlvX2dldF9kZXZpY2UoKQ0K
YW5kIHJlbW92ZSB0aGUgY29waWVzIGlmIHlvdSBsaWtlIHRoYXQgaWRlYSBiZXR0ZXIuDQoNCg0K
DQo+PiANCj4+ICAgICAqaW5mbyA9IGdfbWFsbG9jMChhcmdzeik7DQo+PiANCj4+IEBAIC0yMzg5
LDE5ICsyNDIwLDI4IEBAIGludCB2ZmlvX2dldF9yZWdpb25faW5mbyhWRklPRGV2aWNlICp2YmFz
ZWRldiwgaW50IGluZGV4LA0KPj4gcmV0cnk6DQo+PiAgICAgKCppbmZvKS0+YXJnc3ogPSBhcmdz
ejsNCj4+IA0KPj4gLSAgICBpZiAoaW9jdGwodmJhc2VkZXYtPmZkLCBWRklPX0RFVklDRV9HRVRf
UkVHSU9OX0lORk8sICppbmZvKSkgew0KPj4gKyAgICByZXQgPSBWREVWX0dFVF9SRUdJT05fSU5G
Tyh2YmFzZWRldiwgKmluZm8sICZmZCk7DQo+PiArICAgIGlmIChyZXQgIT0gMCkgew0KPj4gICAg
ICAgICBnX2ZyZWUoKmluZm8pOw0KPj4gICAgICAgICAqaW5mbyA9IE5VTEw7DQo+PiAtICAgICAg
ICByZXR1cm4gLWVycm5vOw0KPj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+ICAgICB9DQo+PiAN
Cj4+ICAgICBpZiAoKCppbmZvKS0+YXJnc3ogPiBhcmdzeikgew0KPj4gICAgICAgICBhcmdzeiA9
ICgqaW5mbyktPmFyZ3N6Ow0KPj4gICAgICAgICAqaW5mbyA9IGdfcmVhbGxvYygqaW5mbywgYXJn
c3opOw0KPj4gKyAgICAgICAgaWYgKGZkICE9IC0xKSB7DQo+PiArICAgICAgICAgICAgY2xvc2Uo
ZmQpOw0KPj4gKyAgICAgICAgICAgIGZkID0gLTE7DQo+PiArICAgICAgICB9DQo+IA0KPiBVc2Ug
b2YgZmQgaGVyZSBpcyBoYXJkIHRvIHJldmlldywgaXQncyBjbGVhcmx5IGZvciBzb21lIGZ1dHVy
ZSB1c2UgY2FzZS4NCj4gDQoNCglUaGUgRkQgY29kZSBjYW4gYmUgbW92ZWQgdG8gYSBwYXRjaCB3
aGVyZSBpdOKAmXMgdXNlZC4NCg0KDQo+PiANCj4+ICsNCj4+ICtzdGF0aWMgaW50IHZmaW9faW9f
cmVnaW9uX3dyaXRlKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCB1aW50OF90IGluZGV4LCBvZmZfdCBv
ZmYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBzaXplLCB2
b2lkICpkYXRhLCBib29sIHBvc3QpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgdmZpb19yZWdpb25f
aW5mbyAqaW5mbyA9IHZiYXNlZGV2LT5yZWdpb25zW2luZGV4XTsNCj4+ICsgICAgaW50IHJldDsN
Cj4+ICsNCj4+ICsgICAgcmV0ID0gcHdyaXRlKHZiYXNlZGV2LT5mZCwgZGF0YSwgc2l6ZSwgaW5m
by0+b2Zmc2V0ICsgb2ZmKTsNCj4+ICsgICAgaWYgKHJldCA8IDApIHsNCj4+ICsgICAgICAgIHJl
dCA9IC1lcnJubzsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gK30N
Cj4gDQo+IFNpbXBsaWZ5IGFsbCB0aGVzZSB3aXRoIHRlcm5hcmllcz8NCj4gDQo+ICAgIHJldHVy
biByZXQgPCAwID8gLWVycm5vIDogcmV0Ow0KPiANCg0KCW9rDQoNCg0KDQo+PiANCj4+IHN0YXRp
YyB2b2lkIHZmaW9fcGNpX3NpemVfcm9tKFZGSU9QQ0lEZXZpY2UgKnZkZXYpDQo+PiB7DQo+PiAr
ICAgIFZGSU9EZXZpY2UgKnZiYXNlZGV2ID0gJnZkZXYtPnZiYXNlZGV2Ow0KPj4gICAgIHVpbnQz
Ml90IG9yaWcsIHNpemUgPSBjcHVfdG9fbGUzMigodWludDMyX3QpUENJX1JPTV9BRERSRVNTX01B
U0spOw0KPj4gLSAgICBvZmZfdCBvZmZzZXQgPSB2ZGV2LT5jb25maWdfb2Zmc2V0ICsgUENJX1JP
TV9BRERSRVNTOw0KPj4gICAgIERldmljZVN0YXRlICpkZXYgPSBERVZJQ0UodmRldik7DQo+PiAg
ICAgY2hhciAqbmFtZTsNCj4+IC0gICAgaW50IGZkID0gdmRldi0+dmJhc2VkZXYuZmQ7DQo+PiAN
Cj4+ICAgICBpZiAodmRldi0+cGRldi5yb21maWxlIHx8ICF2ZGV2LT5wZGV2LnJvbV9iYXIpIHsN
Cj4+ICAgICAgICAgLyogU2luY2UgcGNpIGhhbmRsZXMgcm9tZmlsZSwganVzdCBwcmludCBhIG1l
c3NhZ2UgYW5kIHJldHVybiAqLw0KPj4gQEAgLTkyNiwxMyArOTI4LDIzIEBAIHN0YXRpYyB2b2lk
IHZmaW9fcGNpX3NpemVfcm9tKFZGSU9QQ0lEZXZpY2UgKnZkZXYpDQo+PiAgICAgICogVXNlIHRo
ZSBzYW1lIHNpemUgUk9NIEJBUiBhcyB0aGUgcGh5c2ljYWwgZGV2aWNlLiAgVGhlIGNvbnRlbnRz
DQo+PiAgICAgICogd2lsbCBnZXQgZmlsbGVkIGluIGxhdGVyIHdoZW4gdGhlIGd1ZXN0IHRyaWVz
IHRvIHJlYWQgaXQuDQo+PiAgICAgICovDQo+PiAtICAgIGlmIChwcmVhZChmZCwgJm9yaWcsIDQs
IG9mZnNldCkgIT0gNCB8fA0KPj4gLSAgICAgICAgcHdyaXRlKGZkLCAmc2l6ZSwgNCwgb2Zmc2V0
KSAhPSA0IHx8DQo+PiAtICAgICAgICBwcmVhZChmZCwgJnNpemUsIDQsIG9mZnNldCkgIT0gNCB8
fA0KPj4gLSAgICAgICAgcHdyaXRlKGZkLCAmb3JpZywgNCwgb2Zmc2V0KSAhPSA0KSB7DQo+PiAt
ICAgICAgICBlcnJvcl9yZXBvcnQoIiVzKCVzKSBmYWlsZWQ6ICVtIiwgX19mdW5jX18sIHZkZXYt
PnZiYXNlZGV2Lm5hbWUpOw0KPj4gKyNkZWZpbmUgcm9tX3JlYWQodmFyKSBWREVWX1JFR0lPTl9S
RUFEKHZiYXNlZGV2LCAgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFZGSU9fUENJX0NPTkZJR19SRUdJT05fSU5ERVgsICBcDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUENJX1JPTV9BRERSRVNTLCA0LCAodmFyKSkNCj4+ICsj
ZGVmaW5lIHJvbV93cml0ZSh2YXIpIFZERVZfUkVHSU9OX1dSSVRFKHZiYXNlZGV2LCAgXA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19QQ0lfQ09ORklH
X1JFR0lPTl9JTkRFWCwgIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9ST01fQUREUkVTUywgNCwgKHZhciksIGZhbHNlKQ0KPj4gKw0KPj4gKyAgICBp
ZiAocm9tX3JlYWQoJm9yaWcpICE9IDQgfHwNCj4+ICsgICAgICAgIHJvbV93cml0ZSgmc2l6ZSkg
IT0gNCB8fA0KPj4gKyAgICAgICAgcm9tX3JlYWQoJnNpemUpICE9IDQgfHwNCj4+ICsgICAgICAg
IHJvbV93cml0ZSgmb3JpZykgIT0gNCkgew0KPj4gKw0KPj4gKyAgICAgICAgZXJyb3JfcmVwb3J0
KCIlcyglcykgUk9NIGFjY2VzcyBmYWlsZWQiLCBfX2Z1bmNfXywgdmJhc2VkZXYtPm5hbWUpOw0K
Pj4gICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gKyN1bmRlZiByb21fcmVhZA0KPj4gKyN1
bmRlZiByb21fd3JpdGUNCj4gDQo+IEhtbSwgSSB0aGluayBJJ2QgcmF0aGVyIHNlZSBhIGdlbmVy
aWMgZnVuY3Rpb24gYnJva2VuIG91dCBmb3IgdGhpcywNCj4gbWF5YmU6DQo+IA0KPiBpbnQgdmZp
b19wY2lfc2l6ZV9iYXIzMihWRklPRGV2aWNlICp2YmFzZWRldiwgaW50IG9mZnNldCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBtYXNrLCB1aW50MzJfdCAqc2l6ZSkNCj4gew0K
PiAgICB1aW50MzJfdCBvcmlnLCB2YWw7DQo+ICAgIGludCBpbmRleCA9IFZGSU9fUENJX0NPTkZJ
R19SRUdJT05fSU5ERVg7DQo+IA0KPiAgICBpZiAoVkRFVl9SRUdJT05fUkVBRCh2YmFzZWRldiwg
aW5kZXgsIG9mZnNldCwgNCwgJm9yaWcpICE9IDQgfHwNCj4gICAgICAgIFZERVZfUkVHSU9OX1dS
SVRFKHZiYXNlZGV2LCBpbmRleCwgb2Zmc2V0LCA0LCAmbWFzaywgZmFsc2UpICE9IDQgfHwNCj4g
ICAgICAgIFZERVZfUkVHSU9OX1JFQUQodmJhc2VkZXYsIGluZGV4LCBvZmZzZXQsIDQsICZ2YWwp
ICE9IDQgfHwNCj4gICAgICAgIFZERVZfUkVHSU9OX1dSSVRFKHZiYXNlZGV2LCBpbmRleCwgb2Zm
c2V0LCA0LCAmb3JpZywgZmFsc2UpICE9IDQpIHsNCj4gDQo+ICAgICAgICBlcnJvcl9yZXBvcnQo
Li4uDQo+IA0KPiAgICAgICAgcmV0dXJuIC0xOw0KPiAgICB9DQo+IA0KPiAgICAqc2l6ZSA9IH4o
bGUzMl90b19jcHUodmFsKSAmIFBDSV9ST01fQUREUkVTU19NQVNLKSArIDE7DQo+IA0KPiAgICBy
ZXR1cm4gMDsNCj4gfQ0KPiANCg0KCW9rDQoNCg0KPiBSZWFsbHkgSSB0aGluayBpdCdzIGp1c3Qg
dHJ5aW5nIHRvIGhhcmQgY29kZQ0KPiBWRklPX1BDSV9DT05GSUdfUkVHSU9OX0lOREVYIGFuZCBQ
Q0lfUk9NX0FERFJFU1MgaW50byB0aGUgbWFjcm8gY2FsbHMNCj4gdGhhdCBkZW1hbmQgc29tZSBz
aW1wbGlmaWNhdGlvbiwgaWYgd2UgdXNlIHZhcmlhYmxlcyBpdCBsb29rcyBmaW5lDQo+IGlubGlu
ZS4NCj4gDQo+IFdlIGNvdWxkIGFsc28gcmUtd3JhcCBWREVWX1JFR0lPTl9SRUFEL1dSSVRFIGlu
IHZmaW8vcGNpLmggdG8gc2ltcGxpZnkNCj4gY29uZmlnIHNwYWNlIGFjY2VzcywgcHJlc3VtYWJs
eSB3ZSdkIG5ldmVyIGhhdmUgcG9zdGVkIHdyaXRlcyB0byBjb25maWcNCj4gc3BhY2UuICBUaGFu
a3MsDQo+IA0KDQoNCglUaGVyZSBhcmUgbXVsdGlwbGUgcGxhY2VzIHdoZXJlIGNvbmZpZyBzcGFj
ZSBpcyByZWFkIG9yIHdyaXR0ZW4NCmluIHBjaS5jLCBzbyBhZGRpbmcgYW4gaW5saW5lIG9yICNk
ZWZpbmUgZm9yIGl0IGlzIGEgZ29vZCBpZGVhLg0KDQoJCQkJCQkJCUpKDQoNCg0KDQo=


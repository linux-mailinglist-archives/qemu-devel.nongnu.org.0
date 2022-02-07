Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850A4AB615
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 08:51:47 +0100 (CET)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGyoL-0001OD-JU
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 02:51:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nGy9I-0007tn-9R
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:09:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nGy9F-0003t2-Kl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:09:19 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2176b4Fw021140; 
 Mon, 7 Feb 2022 07:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vOYMyQbQcmMIDqXUztt20XunkjLfkl8DAWxXLxqCwOg=;
 b=lldlkLPycA1VJWbAU4VRTuSCOV99551kZeR0mncCB4/ajf8CCcpV6aIbDlXoJKIPAehh
 cfD8SLzh+XWROmVFFs7PvGKZWxUdphCsx0WrJX6webMhHr+TjXw2w7twyr6QobnzjEox
 qymsxDM3yLDxphOx3AeI+qlQJCWZkDhrypcGMY+J1KaWeKPwYOezJoaXVqVX5oRQ9H7h
 dMO6LaulO6YRFngZXspvAZIGqH4t60QWAeO7k3tPnITB5bXbb0IhhzDxM7KjzBoW39th
 03pYHC9lKxo2GjmqT7TCG82pX3GepY1pvduc8sEe6ZAYFna6yKrQ4YxSbv25DamFTqds jA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1fndd0kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 07:07:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21771Tjq026962;
 Mon, 7 Feb 2022 07:07:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3020.oracle.com with ESMTP id 3e1h23vkvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 07:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp/ZYaBa/iSwwXieKLRICUaypE9hEd9P/IBYzbi0J5/p1U50gGeeBUrj6OotC8kbUPMNIOsh4FUwcS2pyab8737MdP6vTH9fqtjDJ8A7sEWgZdcrcwaFekqcXhghakK2Jc5ChaAXLd+js1zEWuLXsRGDvL0wkBYx+PbLsmtmJrjHxi4hVmPD7R+/9kK2l+5OI+duflti65635B/hPK2FxPVG8bd34HyQCwh0UuSBm30SdGKb5dXWEnHEV+pBWBmItyQdJWyt5qU3BGtHKciQmEomO0RIRpvcXqT+na1pJRBEVoGyRgvUgcZvOoFMhwR7mMkKHLO9xq6HMwgnSGHeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOYMyQbQcmMIDqXUztt20XunkjLfkl8DAWxXLxqCwOg=;
 b=NaiyhQcI6Hk1tkTFKeh/BeB27cD+hZ8WuklEdl2PQypa3QwMBWS8+LsdTUHTHF/6uxvMwfNeGtYhKyz3Y0QnjBJMOVy4L5wzx9mdUwro83lfK4buzO1hTAM/pLIX/AFyk1PhjpHmM++2B5K5SOXxlYWwJmJzE8uV0gBV9KaSxRYjsJ5bMC04oUGubzgEpX2u0KPqQCXCrlWp6Hafvl6WBYAggty0IhIqOnneToXl/97VEt0wNRwUBElzQGux6YlAcx7KyyP1ntnH2iQ8GBeAnYmJx/Zje6VZttjZkZsHEVPLDp/Wx42xAVJi/8PMA5mvxDXOk+xux/EjHPT2tCh+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOYMyQbQcmMIDqXUztt20XunkjLfkl8DAWxXLxqCwOg=;
 b=QR6WnTkMNpoArQ4pfiZVVBoyszr4whXCK9+K9Pu1iF2vvZ7miA05Oj46P9rmDgtz09R3aFLaRJqMRnbxz3eTvv4a3wNfkCwZedGIGwtQUOTk2HByff9jqKB3bRO0vbY79BcjNEWQY/nWBTSrSiqsyVW8SKxeheysEz+hAv7dTCo=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:07:50 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::5b8:f070:2b72:3a93]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::5b8:f070:2b72:3a93%6]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:07:50 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Topic: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Index: AQHYA/12hpHBWFGS8E+PGV+BaY4N36yCiQqAgAD4MgCABFmcAA==
Date: Mon, 7 Feb 2022 07:07:50 +0000
Message-ID: <90CFACF0-59B6-4301-8E9A-422B5F3BB833@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a89cfd3195740dfb313d1947c0c7de583e4d0f46.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB800566B66BD854CD37E6B0B98B289@DM8PR02MB8005.namprd02.prod.outlook.com>
 <DM8PR02MB8005BA12B1E54234DD98AA3F8B299@DM8PR02MB8005.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8005BA12B1E54234DD98AA3F8B299@DM8PR02MB8005.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2a249ab-3517-4dc7-ed43-08d9ea088d51
x-ms-traffictypediagnostic: MN2PR10MB4397:EE_
x-microsoft-antispam-prvs: <MN2PR10MB43975980F9823F600BA97716B62C9@MN2PR10MB4397.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 60uB7tE9+xWpFXewXJ2bobnlxv3+9S07DUhjElw3JRXuLytAFHmxyavp3FAuVMBHG0TtcPgfzlFj2GE4x/zQ08AJryFabXOvtbOuiTovbeXU6aEnjx7wseYuBbi65Yv2Tyin9RBgMDZgSmU4c3N2/jSZu3COr0T2QY0pFg2uW4HmKfQgDkLUCMZJoxrtDE1O9cFHNELmGN/kEF+lNF29u1C1OHUEcaoQTGArgAeagwaB5rpUm0CiKr1MlPwk5qf9+WoeGdfGCHAis0sPtqPe3rMundU56MATi7OXg97IEKGKQnP43Bzbg/Mik3+WigPrj9q3d+AVviJ667wj92NqZwHkgyE1O9aOQWP+Tjn/1G7qIOJPAKTVq8/Qd9zU7A6gvWXczlLZ6w3bYUxTxXPewkGTBXw95xpszdEzo35vveFEtDqtQFBIi6Q4obboxi7BccsrQC51liq0itn+Ltn/oaQw6/OyF3kyzhAaCCW62VQFSZqi4kMxhQf681LO0MjgTDm2tiuNbBbYrTein3KmsMAlWiYjqQEgL0G4+tMFhXu2GzknRfubNf9kuRPTNBtlXf9gDQoeRLJUBPQgtupheh3SMgl67SXlIR+Um0ZVu5G613orRQBFFq2d09WCh2BXt0uqM5r9vOSZme4204zMAV2xvC8FO8Vl9w15F+IOz4+nSwtRhE39vBPiu1PUa1iOy+P5r/flbGHXGb2WnbW7fasEwmNpZR/B2O/YeuvEiBo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(122000001)(6916009)(53546011)(508600001)(6512007)(6506007)(316002)(296002)(2906002)(2616005)(6486002)(38070700005)(86362001)(36756003)(76116006)(26005)(66946007)(38100700002)(33656002)(66476007)(186003)(4326008)(8676002)(8936002)(83380400001)(66556008)(66446008)(5660300002)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNJektzVC9OWmd5bWVnVnExd2JUNnRYTWRlSEd4S1RzSTlNbEtvWDZvb2Nz?=
 =?utf-8?B?UE8rZ0N2SVl5STBURXEwWDUzOWdkRkN1cG42cThYZXRJTWp6bzYzakdjK2pM?=
 =?utf-8?B?NGhKZDRNN2tnM2pSSEJnSVhwYzhpVFN4RUVLTFZpbEdqeU55Z21qNmpyU0Jz?=
 =?utf-8?B?czdxZ0EwTHhjMmliUHRqTWVUUnVkUGlxaEJ0MjBBaHhXSWNScVBpeHNxemsz?=
 =?utf-8?B?Sm5kL25WSStML1NBYS9FQUt0eEZ5T0xWN0lGTjYyUUFVbkdPWjdQbXNNR2NR?=
 =?utf-8?B?dTdGM3IxdFQvTCtaWnNNRXhtQm82QzFYQTM4aWY5SFJzaFUrY29UN2FnKzFZ?=
 =?utf-8?B?M2x6L1lya0VLc05jRzFWL0dxU0NGMTA3Tnc4SFpKZGU3LzRtQTNmWUNDaDg5?=
 =?utf-8?B?OXJVRi9tZzVXVU5qVWk3M3Z2UlBjTDFFZVN5bjliVFFOaUUxc0I2ZS9FVWtT?=
 =?utf-8?B?ZWxpRTJ4MGlseXZwWGZ0STUxczF1Z1B6aG5iRFlyQVMxa2lWeERiZWtXMGlh?=
 =?utf-8?B?dktHUmtxRW1tTHI4d2JZbEtZWmxjVDVSayt6YnkrL2xQWHIzamFTSmhuc2N3?=
 =?utf-8?B?U2pMb2RJOUExaFl6OVdwV0Nla1Q0ekNDVEFpc2tEY25IRUt1d1ZacUNSQjJC?=
 =?utf-8?B?NTFPb29rY3hiMHhPeUsxLzlwZjhsTkMyVFpVTm1sN1FoL2ZyVDBsTTJhUFR3?=
 =?utf-8?B?bTJJVHpNT3Q2ajBZNmdJNXNzSVVoQ25rQjlTMUpPVFNlUTdMeHFTVnZDT3po?=
 =?utf-8?B?Tjl4UXJBdFcrSFFIdGVJekx2ZnBnNXlOc1NuQ1o1QlJYcnM3M0F5UnZkRU0z?=
 =?utf-8?B?VmdDTUhFbW53YStPYUJ4dmpadG5mSmh4RHRQMktYV0JPU1podEhQVyt6Q2Jl?=
 =?utf-8?B?RHVUdnFBNmVPYkk1cDNiaUpJbnVielVscllldEIyYnpETkE2cEtjSVI5SE41?=
 =?utf-8?B?blJpdnovKzRhdVo0UXg3Rlc4QU45QjhDVzdFUFZoamttcEVYcHlJRVZDek41?=
 =?utf-8?B?WEt3K2VSeU84Q01SdFNvYVlUdk41MFprMjg2bHNsQ3ZhRDBQMXpjUW5zZmNp?=
 =?utf-8?B?QVFxcHJqMWp3YnBwRngrbENWYVBhdm1DelIrSXlSSmV5S25IZGxnSFVOUUtj?=
 =?utf-8?B?S1dUQ21wSUJPdk8yeHpqWXllYnVkL1hCQU5JbGlSUTdWSlJVa3lOZjF2K1lG?=
 =?utf-8?B?SUhXM21Hdm1aQVhOWVh5akRsaXhHRE9CYmEycmtlVjRpYmtPRVVaZTQrZmNo?=
 =?utf-8?B?aFBodU81SFlkaURxODF3bmpZRklBUnh3WDlZeGJoM2kvakdvOFNldHMyS25H?=
 =?utf-8?B?NUc5Vll6Z1FxR2xoVlBtQmtuUEwvNHRpVnpiQWFvZnE5bVo4Y1JJaUJ4aFZs?=
 =?utf-8?B?ajlyTWh1ZENmWTJvUXFWM3VKeGlraEEwWnF6ejBjR0wvK25GakxydFF5dXFj?=
 =?utf-8?B?dG1GSWljLzNYV2NmK2x0YjIvQ05nSlVXTk13S1Y4THZBNmFzak1hdHFCdVBC?=
 =?utf-8?B?VjZYM3lkcHpteFEwbWhDSzVOSGZIbU9WZjF2YTF5c21zQUM4dThrSUdNMWlP?=
 =?utf-8?B?QjdGeU5peEdLSzdYTUZmYTJFTCt4UEJTbHp6a2UzZ21KRnlQa0RQQmhmb1ZT?=
 =?utf-8?B?ODJRUEU5Q1lTL1RJZU1CZTBzSmtIY2tGQlZwZEMzRUY0WWI0eXNIcFhWU2ZQ?=
 =?utf-8?B?cC9naDFFb2VSYnNRdzA3QkhNcXRoeWZJczl3dTdnazJyR3dORFljRy9LT1FT?=
 =?utf-8?B?SmhycG0reFBPWUQwM2hLamk4bTZxQWRXN3h1dXJEaHNyVldYZ3BDWW9tRFk3?=
 =?utf-8?B?Qy9BN1Z0ZEhKTkhMRkNFWEVpRnU3azM2dlJIOTl5SmM3bDdScjBQWW5WMFpB?=
 =?utf-8?B?R2xYaHltc3o4cG15ejR3cXZXV3NSVk5VdnBKZ3cwR0R1c2EwVzMyOTUvM1kz?=
 =?utf-8?B?bVJkdGVMOU85K3lKOUVEYjF3WHBXclpucXF2WUl1U2FPQnIyOE84ZUFCS2pO?=
 =?utf-8?B?OEhaSHoxMjg0SzlNMTVaRHExT2VFQ0gwMm01NlRQZUdBeFVzWG9DZHU4bjlu?=
 =?utf-8?B?M1VxNHF4V0tBQU1wZ0c1SDRLelRNKyt3Z0VRdThNUkluWFc3OTRhejNIQzA0?=
 =?utf-8?B?SnNhVGxsMk9Cb1FtekFpSWQzVjVNeW9FR2VhWTN5eDBWU2ptNFZxRTRHZ2Vz?=
 =?utf-8?B?L3haZUlRUHBITFB0bUViRGh3eFlFcXdJSjBxM3A0L3Z3UVBlNFlSL1EwZ3Bx?=
 =?utf-8?Q?9BL4Hm5uZicjFNqXYMkzWfIpa7G1tb630QoACnybg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49137B7ACF021D40AEB7C3828361F8DC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a249ab-3517-4dc7-ed43-08d9ea088d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 07:07:50.0605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/PED59JT+nChRROcZytMOxnhohFwCdIuY3KiQ+5jQ14rYB36KYNn1VpfoCtv51cQJRJ2yYXcAe8qvxhb3gypK6dTCUSAZtr5F6txvxlms8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070046
X-Proofpoint-GUID: 5OBbHXgewZYEFHudRHSzoB3KvZGF2eQW
X-Proofpoint-ORIG-GUID: 5OBbHXgewZYEFHudRHSzoB3KvZGF2eQW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDQsIDIwMjIsIGF0IDQ6NDIgQU0sIFRoYW5vcyBNYWthdG9zIDx0aGFub3Mu
bWFrYXRvc0BudXRhbml4LmNvbT4gd3JvdGU6DQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtDQo+PiBib3VuY2VzK3RoYW5v
cy5tYWthdG9zPW51dGFuaXguY29tQG5vbmdudS5vcmc+IE9uIEJlaGFsZiBPZiBUaGFub3MNCj4+
IE1ha2F0b3MNCj4+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjIgMjE6NTQNCj4+IFRvOiBKb2huIEpv
aG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcN
Cj4+IFN1YmplY3Q6IFJFOiBbUkZDIHY0IDA4LzIxXSB2ZmlvLXVzZXI6IGRlZmluZSBzb2NrZXQg
cmVjZWl2ZSBmdW5jdGlvbnMNCj4+IA0KPj4gDQo+PiANCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPj4+IEZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtDQo+Pj4gYm91bmNlcyt0
aGFub3MubWFrYXRvcz1udXRhbml4LmNvbUBub25nbnUub3JnPiBPbiBCZWhhbGYgT2YgSm9obg0K
Pj4+IEpvaG5zb24NCj4+PiBTZW50OiAxMiBKYW51YXJ5IDIwMjIgMDA6NDQNCj4+PiBUbzogcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+Pj4gU3ViamVjdDogW1JGQyB2NCAwOC8yMV0gdmZpby11c2Vy
OiBkZWZpbmUgc29ja2V0IHJlY2VpdmUgZnVuY3Rpb25zDQo+Pj4gDQo+Pj4gKyAgICB9DQo+Pj4g
Kw0KPj4+ICsgICAgbXNnbGVmdCA9IGhkci5zaXplIC0gc2l6ZW9mKGhkcik7DQo+Pj4gKyAgICB3
aGlsZSAobXNnbGVmdCA+IDApIHsNCj4+PiArICAgICAgICByZXQgPSBxaW9fY2hhbm5lbF9yZWFk
KHByb3h5LT5pb2MsIGRhdGEsIG1zZ2xlZnQsICZsb2NhbF9lcnIpOw0KPj4+ICsNCj4+PiArICAg
ICAgICAvKiBlcnJvciBvciB3b3VsZCBibG9jayAqLw0KPj4+ICsgICAgICAgIGlmIChyZXQgPCAw
KSB7DQo+Pj4gKyAgICAgICAgICAgIGdvdG8gZmF0YWw7DQo+Pj4gKyAgICAgICAgfQ0KPj4gDQo+
PiBJSVVDIHFpb19jaGFubmVsX3JlYWQoKSBlbmRzIHVwIGNhbGxpbmcgcWlvX2NoYW5uZWxfc29j
a2V0X3JlYWR2KCkgd2hpY2ggY2FuDQo+PiByZXR1cm4gUUlPX0NIQU5ORUxfRVJSX0JMT0NLICgt
MikuIFRoZSBpZiB3aWxsIGJlIHRha2VuIHNvIGxvY2FsX2VyciBpcyBOVUxMDQo+PiBhbmQgdGhh
dCBjYXVzZXMgYSBzZWdmYXVsdCB3aGVuIGVycm9yX3JlcG9ydF9lcnIobG9jYWxfZXJyKSBpcyBj
YWxsZWQgYmVmb3JlDQo+PiByZXR1cm5pbmcgZnJvbSB0aGlzIGZ1bmN0aW9uLg0KPiANCj4gSW4g
ZmFjdCwgZG9uJ3Qgd2UgbmVlZCB0byBjb250aW51ZSBpZiBxaW9fY2hhbm5lbF9yZWFkKCkgcmV0
dXJucyBRSU9fQ0hBTk5FTF9FUlJfQkxPQ0sgYW5kIG9ubHkgZmFpbCBpZiBpdCByZXR1cm5zIC0x
Pw0KPiANCj4+IA0KPj4+ICsNCj4+PiArICAgICAgICBtc2dsZWZ0IC09IHJldDsNCj4+PiArICAg
ICAgICBkYXRhICs9IHJldDsNCj4+PiArICAgIH0NCj4+PiArDQoNCg0KCUkgY2Fu4oCZdCBsb29w
IGluZGVmaW5pdGVseSwgYXMgYSBtYWxpY2lvdXMgc2VydmVyIGNvdWxkIGNhdXNlIHRoZSByZWNl
aXZlciB0byBsb29wDQpjb250aW51b3VzbHkgaWYgaXQgc2VuZHMgYSBwYWNrZXQgd2l0aCBhIGhl
YWRlciBsZW5ndGggZ3JlYXRlciB0aGFuIHRoZSBwYWNrZXQgbGVuZ3RoLg0KDQoJSWYgbGFyZ2Ug
bWVzc2FnZXMgYXJlIGJlaW5nIGZyYWdtZW50ZWQgYnkgdGhlIHNvY2tldCBjb2RlLCB0aGVuIEkg
dGhpbmsgSeKAmWxsIG5lZWQNCnRvIGNoYW5nZSB0aGUgcGFja2V0IHBhcnNlciB0byBhYmxlIHRv
IHJlYXNzZW1ibGUgdGhlbS4NCg0KCQkJCQkJCQkJSkoNCg0K


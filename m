Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFF475B64
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:06:37 +0100 (CET)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVrY-0004Sc-8a
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxVnL-0001A6-42; Wed, 15 Dec 2021 10:02:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxVnI-0005aF-Bk; Wed, 15 Dec 2021 10:02:14 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEYwv8008125; 
 Wed, 15 Dec 2021 15:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=R+96v8rcfzrheCmMs+vxXHFXkDJ9nEGnBJhk1cu6UXo=;
 b=HMZFas669WXn+DyAHiq/djIUuCG7ailT/w85+iNj5RY2qJQ64cXXIPVkW4Vgcs1CUVbg
 MYmoDS4VwMjHArbYENnZAYIneFw+nABHtiC/S00sHYYHYLBsnui8nNf+Vx/tPDvbVVhx
 B8zqC5tld9i3cF89cyb3jxFH6JqcOOwkTWGg865zfrIpgH35r3z544Xz+lTFBzeyg3TR
 aCBOvvGleBdVUTRisP4LWbe9uvKc0Dd/LMxCDJZ2R07atFjcvxE+7WhfFVSPTDe1MLwV
 Ipfd/4kQfJssr9Qn+DXExBjzTHsl6GMKLr2CNMmqKe/SQyFPrUY8Sn6s72Vxot4WQJ2e ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff3nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:01:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFF0XT8146340;
 Wed, 15 Dec 2021 15:01:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3020.oracle.com with ESMTP id 3cxmrby25u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVZWdwG2V6gFD9CIBsnL184YI94ejkcToV+KNOgYbS9zjuKXed/xA4xHna/KM6Vqf/v9++Dizv4fVcq0rpaTDqmCAYLhiot1BIPgNDaUinBCi9IFpt+rtY3R6xKnDug5NuWwYP2cAJ6my/XTAqsi8j6+6kgo16fTaOthI4pX/Zq536+cNZBpBKr+nKFVJ8zDTkM2q1D370WeVtmPrzkhFQywzObyIZ+Xohr+sDakTor3u848aLuXhFTu+mPryDpcPGBlEhmoFTtDRO1Tag0CQq7RR9O7P2x2tGG9Ngg2RvWGdeKg8iaQ9WIytvZOybYtBxP3It+cANB/I9JLh/iuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+96v8rcfzrheCmMs+vxXHFXkDJ9nEGnBJhk1cu6UXo=;
 b=KT4SN5zXVdLoF+/Et7OLue+SED2EFjdZQsWXcdek+TcjyWod8tVFn5gS9HAK/bRRnuoLYypK91qpp3EnrlC43Ux451qMDd8Pb819Jzd5qojaPoV5yGWSTt46bGEIaPgzHcHYKbyvB/nAz2NaPZU4rxHaa+vjsHIkHIE8+GOLRIBrlXUodDXbKoasmRC5Y4/VJYjsq6sfpvV9EFaETYgcnGO9Pe0Wxf+RAiwhMRbKQ3R7OE1zeKhSEPsmIG5FHEIiMk6kbil7FctdrH64eqjiNMr3pTfy9VgD4R0hqUIzBgECQUtc1ro/tgnDNIP7fUUBTDW82bVzP6Ab+BAQRZVvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+96v8rcfzrheCmMs+vxXHFXkDJ9nEGnBJhk1cu6UXo=;
 b=EOikNes2N6igPBCB+k7uVc8c5zIrKSY2Rvedg9K0BPpbjQ036qfyt25v1YrUSEg8ZQ+TtzM1fVj4XISi09jWRaHte9A9FVfOLT0qhY2rOjqF3ItNiXKSbJNL7aIykqRQqXJEbIkt/PAjq2e52dOL+ttk+lITL74kjQDPXUzhw+g=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3790.namprd10.prod.outlook.com (2603:10b6:208:1b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:01:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:01:56 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH-for-7.0] hw/pci: Don't open-code pci_intx()
Thread-Topic: [PATCH-for-7.0] hw/pci: Don't open-code pci_intx()
Thread-Index: AQHX2w8tsSRSI4yWU0uAb3X0fPKS8Kwz00eA
Date: Wed, 15 Dec 2021 15:01:56 +0000
Message-ID: <B56577FE-163C-439E-A5EB-26BB32363D24@oracle.com>
References: <20211116172655.2752742-1-philmd@redhat.com>
In-Reply-To: <20211116172655.2752742-1-philmd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe3bc84-9a43-4675-0154-08d9bfdbd647
x-ms-traffictypediagnostic: MN2PR10MB3790:EE_
x-microsoft-antispam-prvs: <MN2PR10MB37908EB7772FD50AF233438790769@MN2PR10MB3790.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLc31MrfEJkDoLj0bKHtjcUIW6+CTsEiqUJ+AKBkS48pxBeyLs4Cy/s1hvbJfJCfwQqEdASQWrA+nTVitJUnSoHwNQ7dh3ByrjAQpDqfNBcsjC0NdNuI8KJvdaj5167ZYMpB99IR/YSiuRC4msvdSvogsgpmEcf//QgMr3Q1sWeAMS08KhtmwiTDNoixv1JQ3WFpCLc5Ln8HsU/0urQ2fivfRaIMDEZnmX5ksyiLSi+LEzEUjl5WNzRoKUSZJFy2u4zIiGfw1jQU5y7K17vpypmfMo28SuePLbrmZHFjYKIhgXcZjr6m/TbmKRz3waGFtD9Jit6XqBB6+/MvIJC4EdmCd7C4XKWQ5xGQdY7KxonfnFncmS2Q/BeNfFFBmqBwpM1tma4dSCjqGxjby1bXMf3V/49xCdM8ywj4f653vQutdj/X7jMK49NO5Vyf+L/LZmFCzEr2HQ+Tly+vmMEmX6k+7pMcLH7cRfmKlS1w2wy4pyPImngapNdv4eSyIMVVR0afsUOtYFYx5nqa4BilMJMgWEwezg0clbFtMTaD9+V2RlWFSEuK8LZL8313B9ePBFiQVQwdtB1sWvEDF4VeWW1pgbcgkK8+xiUIikkJP4I5Wcdzbz7UPppdV54SXzgzHDrB41qoAVcNTzoBDRoWU6x/6SGNLUWWip5xztkQKcLyJAyXjea9M8TARMWJU5J43o1aCY9B0RK4vAxOM2umHmiSkwpomsfyT9mUu2Amq6w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(91956017)(71200400001)(6486002)(36756003)(64756008)(6916009)(53546011)(44832011)(2616005)(122000001)(2906002)(86362001)(38100700002)(6506007)(186003)(38070700005)(33656002)(107886003)(76116006)(8936002)(8676002)(83380400001)(6512007)(508600001)(66446008)(54906003)(4326008)(316002)(66946007)(66476007)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZhZlVpZG81MHk1ZlV5YThXUGlmTFpRd0tNcDVZMVVUV2hyK2VLcFJIMllG?=
 =?utf-8?B?UWFRSy9mOTlabzZWYjZmcmhWemN6cEhqLzR2TzJsV2g1dnJVVldFSVYyS3Zj?=
 =?utf-8?B?STc0bFdEdXRhZFEwT01Ya3Q5Q2tZMVNyM0lTS2haQVVPRExkRHBXUVNZNHZ0?=
 =?utf-8?B?eHNIbE5XcU45dVFvV25zQ0MvZWxVcEVlamFjeHp5NUMydktpeUM2N1NvL0Z0?=
 =?utf-8?B?ZlB2dndjR0MyNkU1REplcDA1RzBsbHkxV1BtYjJGZUh2ekVIelhIN0dKQUJs?=
 =?utf-8?B?aCtnMEsrZXNkWUhlOXB3bEJJYzc0WkR5YTh3dGtPOEMvUjhTK1RFcE11a2NE?=
 =?utf-8?B?ejVVWGJPcW84N01zcm02ckZDaWhSTXd1L0MxNkJmV3c0MlVFa0hpblRoMTZ6?=
 =?utf-8?B?YStYdXJSYjlYVTFyL3pPMWtuTTMvREllc3JNWVRId0Y0Y2NnbWJQQUxvQUVI?=
 =?utf-8?B?dnZDQlV1TUVLb1F3UWxDRVJmNnBVTWdQZWhMU01hYmdwd0N5c1lTQU4vUyt2?=
 =?utf-8?B?MFlGQjByUXRkMytPRy9IdUtNb2JMTFdoKzYrY1pSckJsSFlVMEdiVXBvR204?=
 =?utf-8?B?TzVINlUzMmt1Rjk3NU5oSUxlSEk1NW1ocittQ29Dc21VSnZhRktmUnFMSFND?=
 =?utf-8?B?QU5iMkRxSHByYlo0Rkh5NnFROWVqRHdoMmZPUnFKUno0cllQQnR6cHh5Q2Zo?=
 =?utf-8?B?UlhZamlGUGJ2NUhyS05OcHBMYzJUWDBnMjMveTJCTXJQU1UxOXJMTUovd2pz?=
 =?utf-8?B?R0tSVks2M0JVb1VYY3hCN2s1RXVVWHhrVXhXT0Z5OStCNWgvalhmTVpHbFZu?=
 =?utf-8?B?dlpHaFRueno0SmFNM1ZpOW9kSVdzZXVCbUp2ZG9TZTEwNk1mWkxKVmJ3Ly9y?=
 =?utf-8?B?OExQeW5zRDJ1V3NnZFdzbnhzYlZ1OWtueE1NdUxrNVg3NzhCUHptUjFmbjU0?=
 =?utf-8?B?S25ad1ZmNjA1YUxiZllHT1VJUFp5VmN5R1Jab0JCZWNLR2VaSzlYNXlEWFRO?=
 =?utf-8?B?NTdDWEZnOGprWXRMVUR1TFM4dVVma2xyd1pxNkhKNnNVSEsxdnVMbnBXNDZD?=
 =?utf-8?B?YXkvdThvK1JBTHN2UnFrZWp6czc0Qkh6emFkZ3JsQVQraVQwM3h1c1NXWUY3?=
 =?utf-8?B?V3cxUnIySHBkcGhrWG5kaVJ0QWtvdWJnMTQxTGY5bjRmY09uQTh4RWQxZnlm?=
 =?utf-8?B?VThiUE1nQ00rcGR5UnNPWXh2QlhVVjE2ak85SkRwMjRmTkFKQ096YXpzZ2lN?=
 =?utf-8?B?TU84QXhWdVVzbFp5bk5aaGpZZW1NcEhaRElaVGZOcndPNXhkUGgvTWJsOU9j?=
 =?utf-8?B?QVFWRDdmNWU1V2xHWkdJWVdQQWtWS3VHMk9GVUkyd1c3KzhtVUI1WU5BVWlM?=
 =?utf-8?B?cGpsWFpTei95VHdlYSt1am5uaExBYTQreE9JMEhzYTkxU0pYY3MxQWZObE5L?=
 =?utf-8?B?cWdKWjhLbjdxd0gxOU0vTHRSVkcxYTZCcC8zUmdmV3VHSGUrbkF6QnhYMldB?=
 =?utf-8?B?N1pYYTRTaTAwZzR2RWNTcWpWSzgyaTNTaDhEN29JZlBEZUFYcGUwem5YS3RI?=
 =?utf-8?B?UC92aUlNemV3QzQ1ZTZjWGUrWlEzdUhUSXJxbmlzM2kxN2kvUEx3MC9tVDlz?=
 =?utf-8?B?RDh6VTBQc2dMQlZGbXhjSXZFcmJTYjhQZFJ3ZVZSSjVhaDBDUkxJSTVPNnpM?=
 =?utf-8?B?NWgyZ1RYQmZhWnZhMERPMWdtOUxVRVNLVndYK090aXFxaEZ0MFF2b09MWWdZ?=
 =?utf-8?B?TTZzdHkzRVdienM5TldHVmFhNVMxWUlMVmRpdGM1bnp3MEhTdFBRY1F3dlZz?=
 =?utf-8?B?emhzVG9vYjFUVGRLVHhlbVdlNGpYNkZ0S0E5ZkppMDlydHNlUEV6MEVzVVZL?=
 =?utf-8?B?WklBR045b3BrRmhXVDlsdkJOQWJnMEg4dDd5cXBZeFZldWVydE9rRnBwY1dX?=
 =?utf-8?B?dXJDMzZPZmxMK2xsVjhSMEhwSW8rU0VhRGtVS0dFTlExeHpwR3BPRFNsc2oz?=
 =?utf-8?B?dmYwWnl2MW1jbGpGN08xdE1NdllwNDdCWFhoY2hlL3pHM1dKMWF2WThnckpt?=
 =?utf-8?B?ekN2UlIxYkZ4VS9QNGFLQmR0WWpTdXhtWXhUbk5NTGFZb0lUU3hOUjFZS3d3?=
 =?utf-8?B?WGU4WHJyUVE4TFRCQTUwRWJPSWJSYzlMMEFWRzNRd2ZVaVVYOC9XdmYxOHFx?=
 =?utf-8?B?SUVMN2ZaUUJEZXdOS2FiV1B1REJ6YS9YSFJCWHh1SjU1YlZGSTNtUkpWbUxy?=
 =?utf-8?B?QytmRUlQSXhlOHhES1pQeHBTUW1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <611C81BAF3D32B4EB7419E3FCA72B17B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe3bc84-9a43-4675-0154-08d9bfdbd647
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 15:01:56.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IVNvyY1A3/QmePgpYBlYKGCfVw8LTsxkWa+UwOH/bXHVSZauBIlwFNbD/1WmeRU3Xjp1B7E6dOpsyjZ7+A5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3790
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150086
X-Proofpoint-ORIG-GUID: e8M8ScIHeDkEgjjU9SR4YR1uCiVNfe9K
X-Proofpoint-GUID: e8M8ScIHeDkEgjjU9SR4YR1uCiVNfe9K
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE2LCAyMDIxLCBhdCAxMjoyNiBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IFVzZSB0aGUgcGNpX2ludHgoKSBo
ZWxwZXIgaW5zdGVhZCBvZiBvcGVuLWNvZGluZyBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj4gLS0tDQo+IEJhc2Vk
LW9uOiA8MjAyMTExMTYxNzAxMzMuNzI0NzUxLTMtZmJhcnJhdEBsaW51eC5pYm0uY29tPg0KPiAt
LS0NCj4gaHcvbmV0L3ZteG5ldDMuYyAgfCAyICstDQo+IGh3L3JlbW90ZS9pb2h1Yi5jIHwgNiAr
Ky0tLS0NCj4gaHcvcmVtb3RlL3Byb3h5LmMgfCAzICstLQ0KPiAzIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9uZXQv
dm14bmV0My5jIGIvaHcvbmV0L3ZteG5ldDMuYw0KPiBpbmRleCA0MWY3OTZhMjQ3ZC4uYzdmYzVm
NDRkOGYgMTAwNjQ0DQo+IC0tLSBhL2h3L25ldC92bXhuZXQzLmMNCj4gKysrIGIvaHcvbmV0L3Zt
eG5ldDMuYw0KPiBAQCAtMTM1MCw3ICsxMzUwLDcgQEAgc3RhdGljIHZvaWQgdm14bmV0M191cGRh
dGVfZmVhdHVyZXMoVk1YTkVUM1N0YXRlICpzKQ0KPiBzdGF0aWMgYm9vbCB2bXhuZXQzX3Zlcmlm
eV9pbnR4KFZNWE5FVDNTdGF0ZSAqcywgaW50IGludHgpDQo+IHsNCj4gICAgIHJldHVybiBzLT5t
c2l4X3VzZWQgfHwgbXNpX2VuYWJsZWQoUENJX0RFVklDRShzKSkNCj4gLSAgICAgICAgfHwgaW50
eCA9PSBwY2lfZ2V0X2J5dGUocy0+cGFyZW50X29iai5jb25maWcgKyBQQ0lfSU5URVJSVVBUX1BJ
TikgLSAxOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgfHwgaW50eCA9PSBwY2lfaW50eChQ
Q0lfREVWSUNFKHMpKTsNCj4gfQ0KPiANCj4gc3RhdGljIHZvaWQgdm14bmV0M192YWxpZGF0ZV9p
bnRlcnJ1cHRfaWR4KGJvb2wgaXNfbXNpeCwgaW50IGlkeCkNCj4gZGlmZiAtLWdpdCBhL2h3L3Jl
bW90ZS9pb2h1Yi5jIGIvaHcvcmVtb3RlL2lvaHViLmMNCj4gaW5kZXggNTQ3ZDU5N2YwZmUuLjBl
MGJiNjUxZDFhIDEwMDY0NA0KPiAtLS0gYS9ody9yZW1vdGUvaW9odWIuYw0KPiArKysgYi9ody9y
ZW1vdGUvaW9odWIuYw0KPiBAQCAtOTMsMTEgKzkzLDkgQEAgdm9pZCBwcm9jZXNzX3NldF9pcnFm
ZF9tc2coUENJRGV2aWNlICpwY2lfZGV2LCBNUFFlbXVNc2cgKm1zZykNCj4gew0KPiAgICAgUmVt
b3RlTWFjaGluZVN0YXRlICptYWNoaW5lID0gUkVNT1RFX01BQ0hJTkUoY3VycmVudF9tYWNoaW5l
KTsNCj4gICAgIFJlbW90ZUlPSHViU3RhdGUgKmlvaHViID0gJm1hY2hpbmUtPmlvaHViOw0KPiAt
ICAgIGludCBwaXJxLCBpbnR4Ow0KPiArICAgIGludCBwaXJxOw0KPiANCj4gLSAgICBpbnR4ID0g
cGNpX2dldF9ieXRlKHBjaV9kZXYtPmNvbmZpZyArIFBDSV9JTlRFUlJVUFRfUElOKSAtIDE7DQo+
IC0NCj4gLSAgICBwaXJxID0gcmVtb3RlX2lvaHViX21hcF9pcnEocGNpX2RldiwgaW50eCk7DQo+
ICsgICAgcGlycSA9IHJlbW90ZV9pb2h1Yl9tYXBfaXJxKHBjaV9kZXYsIHBjaV9pbnR4KHBjaV9k
ZXYpKTsNCj4gDQo+ICAgICBpZiAoZXZlbnRfbm90aWZpZXJfZ2V0X2ZkKCZpb2h1Yi0+aXJxZmRz
W3BpcnFdKSAhPSAtMSkgew0KPiAgICAgICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIoZXZlbnRfbm90
aWZpZXJfZ2V0X2ZkKCZpb2h1Yi0+cmVzYW1wbGVmZHNbcGlycV0pLA0KPiBkaWZmIC0tZ2l0IGEv
aHcvcmVtb3RlL3Byb3h5LmMgYi9ody9yZW1vdGUvcHJveHkuYw0KPiBpbmRleCBiYWQxNjQyOTlk
ZC4uMjJmMzJhNTkzMGIgMTAwNjQ0DQo+IC0tLSBhL2h3L3JlbW90ZS9wcm94eS5jDQo+ICsrKyBi
L2h3L3JlbW90ZS9wcm94eS5jDQo+IEBAIC0zMiwxNCArMzIsMTMgQEAgc3RhdGljIHZvaWQgcHJv
eHlfaW50eF91cGRhdGUoUENJRGV2aWNlICpwY2lfZGV2KQ0KPiB7DQo+ICAgICBQQ0lQcm94eURl
diAqZGV2ID0gUENJX1BST1hZX0RFVihwY2lfZGV2KTsNCj4gICAgIFBDSUlOVHhSb3V0ZSByb3V0
ZTsNCj4gLSAgICBpbnQgcGluID0gcGNpX2dldF9ieXRlKHBjaV9kZXYtPmNvbmZpZyArIFBDSV9J
TlRFUlJVUFRfUElOKSAtIDE7DQo+IA0KPiAgICAgaWYgKGRldi0+dmlycSAhPSAtMSkgew0KPiAg
ICAgICAgIGt2bV9pcnFjaGlwX3JlbW92ZV9pcnFmZF9ub3RpZmllcl9nc2koa3ZtX3N0YXRlLCAm
ZGV2LT5pbnRyLCBkZXYtPnZpcnEpOw0KPiAgICAgICAgIGRldi0+dmlycSA9IC0xOw0KPiAgICAg
fQ0KPiANCj4gLSAgICByb3V0ZSA9IHBjaV9kZXZpY2Vfcm91dGVfaW50eF90b19pcnEocGNpX2Rl
diwgcGluKTsNCj4gKyAgICByb3V0ZSA9IHBjaV9kZXZpY2Vfcm91dGVfaW50eF90b19pcnEocGNp
X2RldiwgcGNpX2ludHgocGNpX2RldikpOw0KPiANCj4gICAgIGRldi0+dmlycSA9IHJvdXRlLmly
cTsNCg0KSGkgUGhpbGlwcGUsDQoNCklmIHBvc3NpYmxlLCBJ4oCZZCByZW5hbWUgcGNpX2ludHgo
KSB0byBwY2lfaW50eF9pcnEoKSAtIHRvIGRpZmZlcmVudGlhdGUgdGhlIHBpbiBudW1iZXINCmFu
ZCB2ZWN0b3IgbnVtYmVyLg0KDQpJIHdvdWxkIGFkZCBhIGNvbW1lbnQgdG8gcGNpX2ludHgoKSBz
YXlpbmcgdGhhdCBuZWdhdGl2ZSByZXR1cm4gdmFsdWUgbWVhbnMNCklOVHggaXMgbm90IHN1cHBv
cnRlZC4NCg0KQnV0IGl0IGxvb2tzIGxpa2UgcGNpX2ludHgoKSB3YXMgZXhwb3J0ZWQgaW4gYSBk
aWZmZXJlbnQgc2VyaWVzIGFuZCBub3QgcmVsZXZhbnQgdG8NCnRoaXMgcGF0Y2guDQoNCkFja2Vk
LWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQoNClRoYW5rIHlv
dSENCi0tDQpKYWcNCg0KPiANCj4gLS0gDQo+IDIuMzEuMQ0KPiANCg0K


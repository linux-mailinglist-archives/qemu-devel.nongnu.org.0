Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B574AB5DD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 08:28:14 +0100 (CET)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGyRY-00034D-Hw
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 02:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nGy9l-00088r-Fq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:09:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nGy9i-000465-Ks
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:09:49 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21765T4u021180; 
 Mon, 7 Feb 2022 07:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=o9wMS0+4jq27Y4wDF+7ZEpukt62GS6wbbOakvzRfRpc=;
 b=ZMD8O1otVf0kd6tc0ogJ+aUs1TNOUJiA6v+R9XLsRbJoqokMKAT2SJ5C6M1Ap16SsoGx
 ulVbyOT23szmWd038NmLSiclk/fq7mmMz/QN1qfZg40I+6OFbJAbUbC87yciiC6UBSnA
 qOR+U6pXkzoFL0+3FobnBMI2ytmCqd9fR3XDQihPkORhq/BHavdvzzL6YIDFPRxjG8gF
 SI7xiDpGTZxlDTpOsyeIeLuw+gQx39Hv2EGH/HBcPbW8j3T2l1PQ89xg4fSw4TJxHupG
 u/oubAkgctydnM3ncFEBcSnbfrw5bU3IVIt41fupetZauVcSeDx4ygzICQDqz50Hha00 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1fndd0q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 07:09:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21771pEp176330;
 Mon, 7 Feb 2022 07:09:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3e1jpn0c27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 07:09:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdSFk7fhjzJ/Flii4r9pRjzYEqmQg1Foa2XL1c196FJbVSrYl7iu+/+gtnLCf8QM5LLP3Q8xM/AdmnvuXYLDMKZvHY38BspaseBl5lAStLO76kNwiA28ee2Ap/Cqh1q1FXRleU0de8DMA4yP+4OoTXqhG9mn5SNX2aJ0CYs8xEwRltComXeU6ZQpGA4SYRurObNDTnYfmfRF+x1g+sizBIj3VphlJrcC8Rspp7PEtGlnY+Tb3xk27j1eRX2KHdi2WvOV3EH5S//5YO/VPnVqCN7unH4F5cJu07Utt5RLBpPaEZ3cMVwbllU7fg/tQRjU0NLCu8QPl3AE1ABLyPGflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9wMS0+4jq27Y4wDF+7ZEpukt62GS6wbbOakvzRfRpc=;
 b=Z4+UvjD3weF0NX9bIY2n90apa4p+oWpT6xPTS5ZgIm+0lRLLCzl9wNakM+EImwNTl1nXl0U+usxb7cd6mgNxLjGrw44pwpCoZnYY82SmKFaqWPH8cGjoojAVSHDfLc4SrfQKI7XgbqjL+hRk3R+jR4KkOSe4fKXqh1l/dQ9nAM67mjF1JR2goiKpn6Ut3K+OmI19qCU1uLcgLpO66/oxxf++yRtCKNYbRbQqgIs7faqhTIm2b8uoTfCdihECz2rH+RqvokLBNxfuPJF1+G72rb9d2X+n3Evpa1Laqlvk+4bYLA6HdY/DIUP+QIHUWTg0YOIFRNustXv3UK/XeU52kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9wMS0+4jq27Y4wDF+7ZEpukt62GS6wbbOakvzRfRpc=;
 b=xJ+fb2sNIPssJ9lQk9BbJ16nfpMBobfX3iZkYxY7Nv1NS7a/SbPfgm2hBqR+X1k7jP0GjrDFML0aKnp/+zAaXrlNS1wkVEwCzotsyHxbLc43dDUdZV7TOoLBoszjIfk13YV8+LCUT6VyPnoZamK95FJAP/hUQjhvdE2T9TXcwW4=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:09:42 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::5b8:f070:2b72:3a93]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::5b8:f070:2b72:3a93%6]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:09:42 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v4 09/21] vfio-user: define socket send functions
Thread-Topic: [RFC v4 09/21] vfio-user: define socket send functions
Thread-Index: AQHYA/13dD5FNBWOg0KHYUtBa6Eweax1M/YAgBKnaIA=
Date: Mon, 7 Feb 2022 07:09:42 +0000
Message-ID: <DEBA6512-8DCD-4AD2-A92B-49D9EB07E238@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <62f4ed7290dc1ac50187fb7287ba4d109ea96b9d.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB8005B4D97069BFB0204F87EA8B209@DM8PR02MB8005.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8005B4D97069BFB0204F87EA8B209@DM8PR02MB8005.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c680243-fce6-4e52-85c9-08d9ea08d047
x-ms-traffictypediagnostic: MN2PR10MB4397:EE_
x-microsoft-antispam-prvs: <MN2PR10MB4397535F85BCE7BFFD6BFCF2B62C9@MN2PR10MB4397.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P4zUxm11/4terNg7P3Eex/7X8/fFvTd5pxImnRGG+CcJkSbpdHknNKxb39Dd3Dn+gkLfDIhaHbjdWbqZJyTb6AGBFbqvI/D3z0HWUdKbGxbvodp5rEn7Xu7HawkosLlf9WGP++RysANVGEJyyztE8Rvw+Fl2XXTjekyTikBvrlCGYKpf8M+8ipbw054udkuPb+nkxYBTtJfB7KRG491eFZC/zUlWU0ppNn42GNFz/vFxxgcnYGBVltcImN4z5uJisiScbzQe0Ey7khHxBTs8fZW8nfIBdqr1r1XwJTlDFavHuh2W+eOtGos30T+8m34ZmL+G7aM8sUPMIWabE4+E+UYo6I8P+6SWj5yGx3ScK+98bR0l/q+ChWumxnYmTVw+4+2PFKvwBPRM4w1fWs/4AM77vYYJMeWgHHn35vJ25EKX6R/mGqr1wRLJCRdqMD8SmEhUmt+KgHQdjARyiiDFv/1qWYKbUqtb6oo4rv7J1SGcRlmo9vbUgd+Pnl+tv6aCFUqQU5GW+rEa8on+wYz9EBK0XBlTYi31TxRR3qNiaivraAai6TIjqHLb73HtILN2h3N1rLh1RtZ8N5+7NPzJ1T+12uWts6nfR/Nl3NYU5JXagVEjAIScanyuzrquqQMNp2qxKVvdWzvtemWEo1bT/+1T5q4g7B/ugrRVO9Tiu8IJVjamFDtWzlFsZEYu3D6CKN+iiqiwGeQ8+4RGTcJCGOAoBzowLm82aVcvUQMvKx4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(122000001)(6916009)(53546011)(508600001)(6512007)(6506007)(316002)(296002)(2906002)(2616005)(6486002)(38070700005)(86362001)(36756003)(76116006)(26005)(66946007)(38100700002)(33656002)(66476007)(186003)(558084003)(4326008)(8676002)(8936002)(66556008)(66446008)(5660300002)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9wvx5UYa8LoR6aCd0Xt7KWYLl/+eQlIHMieqC+lhpvi9v9Xq6VWdwc/f1s7E?=
 =?us-ascii?Q?YniLmF2Lviespg15sF9Scs7FfbsiAYaSj9CNhg8kcoQIKiayzXoJ8hhMx3Up?=
 =?us-ascii?Q?xf1el4ILf5FV7B9rOyRpzcinS4wT/AYCCtZVsMMsYwHq6vBNie5JPq/56Uh3?=
 =?us-ascii?Q?U4gfHnLjEgp+cDzkCB9alWCwdSwEIRy+1Ot9T43ls4Zma0M+M3RLAX/yPcO4?=
 =?us-ascii?Q?A9D6vuHQn14L63841n42SzoqEijs0qkUFSlM3296aYvUWrRgSNkuXwzGwGfv?=
 =?us-ascii?Q?h9fTnrnjAK2V62OKwI8968eDgiEW73BWM8w58QNYRz8VeL34Du2IbFLSIaE7?=
 =?us-ascii?Q?rFMj11UQxVarDMcfj86EkUvXOKkqBmNwi3TquWlplM0O5lkbr3MH1ewyAkoS?=
 =?us-ascii?Q?iWM8JKdsBDpIHG/eAHTdIojZ8/DIo/fc4VmZFZtI/UkqCRorNYahzdBDcMXD?=
 =?us-ascii?Q?lsoXKCR+dHxYt58hCzuvWSY+EvnMIgQtFnj/1Uqc1z8yi2LB8lFgLtLlkt0y?=
 =?us-ascii?Q?nfYZh5uWZb5vJ7E1LUtRyi/n25Z8AIq/sdjnJltrsYuDKIqbc7LLcfyXVioK?=
 =?us-ascii?Q?SFFIcrj3ix8PCBpYqbrcoGWSONK8PSTJdoHt98qPlghYPqeU0/yjYZzm6mxG?=
 =?us-ascii?Q?qRdvkdfHb/oaECQl0G58wkvgyVvITUov5Cs722E6igNbKt0umzAuzZUI/yPx?=
 =?us-ascii?Q?bR6EQgJC4hO4IGlWQNGPQ3xI9Nh1TlqZlZ2z00kwhZt6nCINUJr8fFUy82Ig?=
 =?us-ascii?Q?ewc3u4iK1oUKyIZ9WWRtNlC106UOpVOa/yA4zq+HU59ue44+fAYk5WeYDMH8?=
 =?us-ascii?Q?8o8mfQQV06dzea6q2/sQlChChsJFvAm6j+mszu0xuh6WB+uzg3BUAyz46RKm?=
 =?us-ascii?Q?muoUcL2fb3KAfjIdHUV+06rE2M7nMvG1zsyyBXyUyxXyN/lvf/YSd67YS1mq?=
 =?us-ascii?Q?8u+NtCE8XyYur4LLaD/9kRkJHBQ7NU0hyirQaZ5IskAg5ObJrGzr5F1jFyoc?=
 =?us-ascii?Q?UN4Nig1bzwC9tIqJyWks3MfRjsZx3XlsFb27fTTfx4vAIRrzYWeo0Us8ht23?=
 =?us-ascii?Q?fQkJn/3rgGOOXL+7HGNK5+Y0q9f9jHT0R/C/Lna3H7qHeGW6WF1HUfROa0zQ?=
 =?us-ascii?Q?MDU//AFf1FbXVqCMRa+Ug6qI/PaXBMWnwYrWYtuY37nd5/GJoSFLgxRu9aSw?=
 =?us-ascii?Q?2RQBPxKQK8SBCdNt783PoGaH6pEzEOBqkWCSMkICBUihKHLO5+kHY9sDoWW8?=
 =?us-ascii?Q?L77F3v4kvQ9bICsNVDn4AcaGODpGeoJTjXhxKZYCJ6yp63ATDXC1t89V80xj?=
 =?us-ascii?Q?8XFcOaSJYzoBoONTZ3xBfd71GJc0ZCiWAR8j3opnXkhWdePnbrNQqFu3zOhy?=
 =?us-ascii?Q?G3tW06ZOrafqe9OF3qARP83cAVzP9OgkK3prUD4Sis8CM+Ge6wBtoRry8w+s?=
 =?us-ascii?Q?C6UyUSfuW2OlEOYRfsecz/+HmLa2eYvwlb4+xccTAP/K5z77HHauizgNF5OK?=
 =?us-ascii?Q?bknktTHLe8beeAumthtG7xCvgbpbLKUlHXSUwcC3C5gtAHGD1GKYy12QJMDW?=
 =?us-ascii?Q?MnssaIvJfLRgsIAR0M7uFcZe+etvnhY6DlysP4r5NscY0R1PZ5seikI1i2ib?=
 =?us-ascii?Q?feJ5baEbyWEfqEFyQlHUZOhhgMOFj63BSVmk3sDevPWTWSoajhd0H/0giG26?=
 =?us-ascii?Q?DrRhtAZNv2sP/HqqZUOhG61yp3I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9B4C3C24947B54E8E27190F949394C1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c680243-fce6-4e52-85c9-08d9ea08d047
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 07:09:42.4309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: USgiOA6Qu8PWPv8JuTForT60upehSWe832V82JiWh3oCApQIplcFZbeq8sTU//tzhhCJoIBUwsT8UxzGnJpYt+ndOnGPaBCtVpk6kUdjDu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070046
X-Proofpoint-GUID: kDUev85qg3RCQW7HEaSXY0LIpPn1EOPp
X-Proofpoint-ORIG-GUID: kDUev85qg3RCQW7HEaSXY0LIpPn1EOPp
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 26, 2022, at 2:17 AM, Thanos Makatos <thanos.makatos@nutanix.com> =
wrote:
>=20
>>=20
>> +static int wait_time =3D 1000;   /* wait 1 sec for replies */
>=20
> Could we make this configurable via the command line as it helps debuggin=
g?
>=20

	Yes, I can add a CLI option.

				JJ




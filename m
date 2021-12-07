Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4146B4E4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:56:41 +0100 (CET)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVL6-0006Cr-CT
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFC-0006So-Mp
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFA-0005w2-4K
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:33 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B752Pxx016363; 
 Tue, 7 Dec 2021 07:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5EoasAeGYoq0JGVvuHjnIB4YzWRpTprzby9ip+qpiA8=;
 b=D7dnwFWhhQNjxaF6nxT6Io45plG2wZ455vU7ej847/dDeKzfL+Dd+cBQuIlz9UcEyMOn
 tXXiy7PpYxpu6xUFuGGQqR6/TEmSmFuBBzwXEnLBATdJP3ZFR++E/cwgJR8GETzrkI1t
 WxIOK+buUER3pP14kEib1B7FRUp3pzXhRqtYdj5wHRBE94H0+ddWXRukcqfZfaPnCQC4
 sdy1OmTjAc13KkMJW4WDzxQjPXffCs8PguvXkiY+v9YzobGFQv9ZmpJd7sxG141mqpQP
 +NuipCS5EAvwt/m7hrrB2rtYDod5ENQQK5JTqdNeFpoOnffPQUAt333wVppiDhTJmJIq /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwmjvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77fDF8179310;
 Tue, 7 Dec 2021 07:50:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3030.oracle.com with ESMTP id 3csc4sx0aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuX0eKr3f1uj0dnQAUUOsB+S2fuznJqzf5YO2x7mU86ptKmiRWt/KZOcJRh+fSbW810xFsqFtQYnV+jqvOhx1j28M4YLzMRl1ijqLFYVQrexXbUvsKfbp0C4T/cuB/7wvF1ilP2V3eQBZ4ayBSumQvrabMLO52OGOff5c4sKYnrGy75BUK+Vu3r7ygOiVmBRKbf8VkbQAzRkKb9abbw3/sCEcBnugUsyhfGw13+/878ClUhzRGQ8WROq3zCNaw29GOFg4LUWASvjHe8UGMbeKpEUIED/G5tTIgQRihtpEf7rSGnbubB4wwayffLe8xggn6l5vU0wLcb/m10c4uYOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EoasAeGYoq0JGVvuHjnIB4YzWRpTprzby9ip+qpiA8=;
 b=LqxLoar+p/6paoBRU88L8maNd/b/ANY2V5YyEJJpftn/DTf8+iJz18YOPzMxjlL/Dg09/+kUWlLcPyNGpcOFOIOzBrplYRnfBZ5DhVrIf07XkXKAzBKRM7STCXnLTvafOmbBSF5sU2Yq+1u5+eV+JQDvHUJWh42yHHagD34CQLNw5tu3YkHFYY8SUe7MrZ76ytYXmV0z97DUM4AC+3xo9Kkj6lIGomDgZVhJWW+JLolEHtCm5grtBFeRARgrtGBssU2zbpCVC+zEzGVYg6JdV27asrbiXGyvoqu9FbERkb86/HBh3aIerZ4XqUFHNcWRFtXtcbTHIaMBb4+flzN+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EoasAeGYoq0JGVvuHjnIB4YzWRpTprzby9ip+qpiA8=;
 b=0VLBYe5Kl3NNDRjqXZGHNfNBzJHCO4KHhgMG23+yhJGG/Rqq/LxAUu/Jm7H2W3LD2BRqx9Kb6ko//HMv6B5PsnxD1+3lInjE8jUXshs1tPvZKu6UydblmFgMtSfwUSxn6BvaUcUKC+88DBoqFYYE+YkC1QdIVNBHWrgGEU7MmFk=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:50:27 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:50:27 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 12/19] vfio-user: region read/write
Thread-Topic: [RFC v3 12/19] vfio-user: region read/write
Thread-Index: AQHX0bouWNMva2j200mZNogyvMjBfKwLigEAgBtQuwA=
Date: Tue, 7 Dec 2021 07:50:27 +0000
Message-ID: <2D907FA5-2F84-4306-82D9-F6E53580E00B@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <fec3b2318fe49e39d026a18fdccdb2737226aafc.1636057885.git.john.g.johnson@oracle.com>
 <20211119154228.551293fc.alex.williamson@redhat.com>
In-Reply-To: <20211119154228.551293fc.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c26f2499-1762-4df9-9daf-08d9b9563bdb
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB422542AE6057B59E7DE96BC2B66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdQN/+88njDRc2J/cXZiw9jgwzm++4pMIehkne3sI6Irxe6XL/qc/DCzhXYlcmfHlgP21td7+znZICdnfnIHq2eQoTlkB64+HWdNq2iTKBGMzmYFWUgkFBYeenCr5eoP+VOWi2MLhS4sqzhTd+RIj5ZKBu0OTaQNfLqkrLXCr5OK5Niv8Tn0+ElT8W71c2Y/nrf+BtTN6rGYlqo/aK9v2Lj7ybYyPHT0v+DAx7gdmenAT2lYIbfY2/pN94eeQLyTEixtapF90g6LipTQaz5wvS+gKRxZLajCL1lsCPoP5HxQXWgMlIpx0Pqw5isL99hbwjowJV/whn8QDQhnhhhodEFpOZ/KT9QBBl7HvU3sDzGaE1xI73CyrQzwCtLx/xzXkt312qS+tO1OZqyaB6h73HyJn03eSLkf7UkKmvaWBpeum6/K2N62mS1PDabgDFB9vixb7mhcJWXrABHPXNg1yuEa3a3NBquYA8yxftNjKFBPr7nxFlnXlvxMEWpXz6n/nU6lrQSPlugzvyZ+vTN2dQvBIPCERvnv/r4oE3ZXMfNrzvFkcVkcZYE6ObD+G67zh6NfIqz0qAAjjwYyacy8/ykRk4D/9jabxvS40lMgs9E5uhu6+X0pswfPSvvwSZmCsQyqhfjk3l7HRwrGkbwdTQmGaqrlI4gEbArMcoxEdHvmSAzpyApMbJMtP0IFV+iQcWGhnlkEt5lxXzLvJyayn/pPo9FZ0PIV0T/AnmX0S1I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(4744005)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUpnQTh5S1FEUUhuUEpXNS9CU05zU2JYV2tzVXdrRDk0UGpZZytPbWtsNm94?=
 =?utf-8?B?QnNJakFOYi9EVXNDYmZ3ZWZIaGxYZWNGRXl1eWRFaEZnMnp3dytsYTFmdFp0?=
 =?utf-8?B?R3lRc3lYdDl1RXlXTFBzeEswZ21jdFhyL0FRYzFwUmxYcmFYblZoVVVReEVt?=
 =?utf-8?B?WlViNnptYkIzazdvN0tCb2tiTzJNQjk3ajEyU044RkZ1TVdBczZnd0tjdnor?=
 =?utf-8?B?NHNhMjh1cXl0S080VXFXTDdXVjVBTytkdm5UTzBjQVZvWFlyYmVXcUNZUGRy?=
 =?utf-8?B?aCtrS2ExcnMreWRmVXh5b1hQUGVKL242Uk9ZYnNYRDBxV3ppZ0JocWR5alpW?=
 =?utf-8?B?SjJSVjV3M2ZBQUt6NzQ2cUUxL0FkV2hmeE9Tbm9JUEZPeXdjaXU2eVNQM0VJ?=
 =?utf-8?B?VlpGMnlCU01RV0h3OCtWUTE3TjVjUThWcWIzSWpSamUvNGFXMjgvQnNYcWxn?=
 =?utf-8?B?bmRkcVVHOE1KbU9jSjNmd2JpUEl4WDJvVlVabzZKUFpPVEJ4RUI0dm9ILzVj?=
 =?utf-8?B?SUJGbW1CaTRXU0F3ZVQySGZFc3VJTW5iVTczWnlya0xyem1YTjBCYUJ0aEtX?=
 =?utf-8?B?TndJQWtwbzFwMGQzWGdXVWJUZnFudDdxTS9UbDE4RVB3N0F4YlBhb2llOGl0?=
 =?utf-8?B?Nk9LdFZvL2JSTXdVT2MxWnZiKzlnNE5JSmV0dElyRnhPSVArNWRqajAyVTJR?=
 =?utf-8?B?a0thZy9PNjhSckZjOHlDS01RTWV5ejFlbGFBV3dYdDhuVjcxdHRCeGk3cTM2?=
 =?utf-8?B?U1ZTbmNmQitUaVRIcHZzdlJ5UkNmU2NlYURPcjYyUmwyV2doZG16eEptUURX?=
 =?utf-8?B?bUZmSXQ5UUNEVnZLTkpkeTFjQlNzbmd2WlRXS0RHRkxVVnB0NW52dkU1dDdH?=
 =?utf-8?B?N0lBa2xuakdNcE1pYWJPN2VaMis1ZFk0dlNTUm00c2l3emZBeG1FN1JqbkQ1?=
 =?utf-8?B?bTh4NUdIang3SVU1aEJVSHltZWNpa2g4VElPbVE4czY0Z2NxcktEdVJoeHFv?=
 =?utf-8?B?TlRRSkRNUFBHY2VqNEFVcFZzSlNhTTNKSitsQ0xycEVJVzBIWGFOOWlNMVdB?=
 =?utf-8?B?eUlEbWlzMTlBaEd4M25Odk9SRFBKNDRDN0taaXdlak5qVFRhYnd5MG1hUmJY?=
 =?utf-8?B?VXVHWVRRZHh4STY5UFZxY2ZicUZiblRRMEc1UzYwMDZWeXQrS1liMnBJSXlG?=
 =?utf-8?B?ZUw1djBjY2NrV2ljNjFydHAxSVVkMkNpVEFyRk5vU28yYUt2YXNITWVWY3Y2?=
 =?utf-8?B?dW5WOVJFWXVmOWt3WVJoeDB1aTMzNFlvdlRzY2Njb1QwY3BscG0yV05XQUFk?=
 =?utf-8?B?U0c4TnRjbkVtd0V3RW9jQitMRGZNdmxVcnNZbXlxSG1GZkRIREhLUi9ER1hI?=
 =?utf-8?B?R3hhOUE1dFc5Q1BFSm51NDI3ekphNGEvSk9rRWJubExvT0JUaWNCRncvTVlE?=
 =?utf-8?B?NW5uSGhncW9ReGxxN1BNbytCYjFmRWc5dEkyWmdWUmNDNUY1NWJnTlAyNHdh?=
 =?utf-8?B?NTMySVZVbTBucTNZMDRRTU5paFFZUUVySE41cVNycUpySlBYNkJscDFSeHVv?=
 =?utf-8?B?UlBJU1VXRzM2OXp0VDYvMS92Qll4UTZHVVM0UGhabGZNcHozSEM1bkhFSWhU?=
 =?utf-8?B?eG83WjRBbVFyMkh1NXJkVjhUOEl1d3IzYUZudk1oeE9vMDd2VFRSakQ1WGtO?=
 =?utf-8?B?QkxyQitPaGVlcVVTL1ZjWEpvVTR3bmlGRDIyNWl3T28yaFFBZU1CR1BWZkZp?=
 =?utf-8?B?QlU3MlVtOVRNZVVLMVV1TGViUGhXcnJ2T3dlTnhuUWFsdWluQ1VqZHlNNEZO?=
 =?utf-8?B?RVVXZW1LSVRhQTc0bnpDZmhhcnA5SGZxdFJTN1BqVXNuZjVTYjM2YlNSc0RO?=
 =?utf-8?B?TFBTZENnVW9NQkwwS1p1ZEluVlAxeTVkcXlZNlpIbWg0LzBmeERua3A0T3NQ?=
 =?utf-8?B?c0lONEw3TVZxc1paQmFsekQ3SFFCZjB0WVU2ZGFLN04zcVdMbjdIeG4vZEhJ?=
 =?utf-8?B?cFMwQ0kwQkkyOXAvaTJpbXUzSjhZTWVaOUFKNGt4L3dKMTJGVCtuREtxcTJp?=
 =?utf-8?B?TDBxQy8xandFWmVaY1pnNUxBc0xaQ3dERXM0cFc2MGo0SC8xOXc4Q3NvS1NZ?=
 =?utf-8?B?SkxWeGN0MWl1SzR6UmZLc3lZMmNsQTNTYTNUd094eXJoNU55TDBBYVhxVDI0?=
 =?utf-8?B?Q1RQTUJHay80cE84S3VlS2JTdURYSGtqOVhpUDRxMGowZmdMU0NLVTlCY1VU?=
 =?utf-8?B?cFB1QklqMTk2aXBHTGt2bEFyQU93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <712FBCE5BC3DB444830CD5AD49F24F03@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26f2499-1762-4df9-9daf-08d9b9563bdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:50:27.1429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UF+i/QD1PY5EQXPlBadMOTc80hep53D5hRzQ+dH/+02j/alGVsLvfjpOjhhDOGE+a31g29TCwiON41PrlWtvKJWRXfaRsRpp0fI4bQrhKBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: 4_N-8I1AMCrCJBufH0nWsxrY4oYbR5jc
X-Proofpoint-GUID: 4_N-8I1AMCrCJBufH0nWsxrY4oYbR5jc
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
MTY6NDY6NDAgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiANCj4+IFZGSU9Qcm94eSAqdmZpb191c2VyX2Nvbm5lY3RfZGV2KFNv
Y2tldEFkZHJlc3MgKmFkZHIsIEVycm9yICoqZXJycCk7DQo+PiB2b2lkIHZmaW9fdXNlcl9kaXNj
b25uZWN0KFZGSU9Qcm94eSAqcHJveHkpOw0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmZp
by92ZmlvLWNvbW1vbi5oIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgNCj4+IGluZGV4
IGUyZDdlZTEuLmI0OTg5NjQgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1j
b21tb24uaA0KPj4gKysrIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgNCj4+IEBAIC01
Niw2ICs1Niw3IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9SZWdpb24gew0KPj4gICAgIHVpbnQzMl90
IG5yX21tYXBzOw0KPj4gICAgIFZGSU9NbWFwICptbWFwczsNCj4+ICAgICB1aW50OF90IG5yOyAv
KiBjYWNoZSB0aGUgcmVnaW9uIG51bWJlciBmb3IgZGVidWcgKi8NCj4+ICsgICAgYm9vbCBwb3N0
X3dyOyAvKiB3cml0ZXMgY2FuIGJlIHBvc3RlZCAqLw0KPiANCj4gQXMgd2l0aCB0aGUgZmQgaW4g
dGhlIHByZXZpb3VzIHBhdGNoLCB0aGlzIGlzIHdoZXJlIHRoZSBjb25jZXB0IG9mDQo+IHBvc3Rl
ZCB3cml0ZXMgc2hvdWxkIGJlIGludHJvZHVjZWQgdGhyb3VnaG91dC4gIE9yIG1heWJlIGV2ZW4g
YmV0dGVyDQo+IHdvdWxkIGJlIHRvIGludHJvZHVjZSB3cml0ZSBzdXBwb3J0IHdpdGhvdXQgcG9z
dGluZyBhbmQgdGhlIG5leHQgcGF0Y2gNCj4gY291bGQgZXhwb3NlIHBvc3RlZCB3cml0ZXMuICBU
aGFua3MsDQo+IA0KDQoJSSBjYW4gcGxhY2UgaXQgd2l0aCB0aGUgcmVnaW9uIHdyaXRlIG9wcyBw
YXRjaCB3aGVyZSBpdOKAmXMgdXNlZC4NCg0KCQkJCQkJCUpKDQoNCg==


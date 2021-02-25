Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3993254C8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 18:51:55 +0100 (CET)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFKnp-00059q-AD
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 12:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lFKmH-0004df-D2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:50:17 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lFKmE-0003SL-GB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:50:16 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11PHo1Pw120953;
 Thu, 25 Feb 2021 17:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=gteFE4WZ7xXWpfyJqxayRsxe9sPxs30pPke5Xhs7SAQ=;
 b=Q5tDf2QBH9O4oo8Aj+DOgXxbJefLiM2MY97mTREewS9Zbvz71NjlVaXgWj+/IRAp5w2z
 RJQhWEQPAekc8RIRItSOW/oz33Z8ABoegSVPG6b/7TAUuN1qn4K/Vnul27EMmJJNf7aE
 Bc0XHpOuoIceAESPxIHuNumfL4xcP9PGvtCHrFRLY/5ePTidrf5nMJ9fefVaplKQLYrP
 RU8oa/ZLAml0zE9utsbzK1wQ5nBNxpkIhGo0dsK8gyUUqTOsf+MMnULRCklHFdS9pldR
 sp5MpboYvLCmfHvLwdPf2g4SxVG6TcTBUOtQJ7pDuamc+1CwaAq1t7/LJOPb5p0S+g/K jg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 36tsur7c1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 17:50:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11PHifLw026310;
 Thu, 25 Feb 2021 17:50:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3030.oracle.com with ESMTP id 36ucc1hhbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 17:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co4RAKh/mIdSRa5z8PUiZFWp8O5pnakmODEiAU8eonzAOMtqn/06ui9qm+agXJ709ltDQA8+cAavUoWd5/P4LwcOt9T0Eo8zXLEUGtR3t4uKmxhASn3vi4xYDTQJicQzTaX7vNx8X0iSkRmumIcgaPb7pyv/O9nDpNmvGfJ9fcYgA50vlA6p/M6H98VpM5k6+9MqHSKPk2lIfYEdyrBMcju7Yr6OGDUiv9ZUnYgWuB1FuW37zXdf8KaE1DIpNPfdqqJvOOpIOJoBqLmZsbpdsau8+B5k41kJ1HoNfkWB7faFMoGt3gxHiA2ulrUW5wL/RGttMNVJd4IyIuBKp4IGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gteFE4WZ7xXWpfyJqxayRsxe9sPxs30pPke5Xhs7SAQ=;
 b=Y1jWCLtOdk8AahZRlBv7aIlflQSV93ieSx3aFHVuhBCLN/xVI2EGJgRqqrJKcdyX70K5t7Hv2rh5gxevKN3oX7qij4I6D7N4sGVEkXORJRfhzRlSr8e0nGJyrOIIQxcj9y9JEqjhXRrgQdnHsfeKbIudSy8h0q8Fhq14os0kUZZKC+moJPjhj8h83voCKKcAPa9JkhhMkpfuFkyvvPGSSpTfsQRGP0kllHAGVnl2/GCsNGupl+m/VaGfvfmswaB40R4oQenhYKjEpkFTUH7JR2NEBWpd5jraLEQYLXRGp+9/rwiajU9monMu1vPqFeiwC5uhrpuOfp1aNGuyBUZC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gteFE4WZ7xXWpfyJqxayRsxe9sPxs30pPke5Xhs7SAQ=;
 b=w9k0vFKzLl4V7TFn0NGeg+whVEJcQfGc+itTX92kbz3oba0wY214eSN0sJINB4kv4XqDhb/1mu32nAHFn/xhfIysH0Wu2eksAgz57a2H/QYlL3Lt/FJUpZLqaX64+xA2RKl7UEzbsPMZUJWvQ3zppocaFYoushws+7ejrW7BNZw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3917.namprd10.prod.outlook.com (2603:10b6:208:183::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 17:50:07 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471%6]) with mapi id 15.20.3868.031; Thu, 25 Feb 2021
 17:50:07 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
Thread-Topic: [PATCH] multiprocess: move feature to meson_options.txt
Thread-Index: AQHXCqfuYuH4586JxEGusZ0DiGQhkapor06AgAAbToCAAEiGgIAAFNsA
Date: Thu, 25 Feb 2021 17:50:07 +0000
Message-ID: <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
 <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
In-Reply-To: <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:d4ba:ef1f:13ce:d5b4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85e1186d-3c4f-4ba0-c263-08d8d9b5c9f7
x-ms-traffictypediagnostic: MN2PR10MB3917:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB391743D9CE5F17FD31755551909E9@MN2PR10MB3917.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BajIXc+P8xx0RMJ0DHQ8TqBJZ36k0sotfYzQ6ewd2NjbwSsiXamLnhC27jtEEVkqNx0vgkzBJmnQq4TdWn2JQHOXnuMoiq+qZJZuOxsu1WgMgZ5AUN2SJocOB+Vwm0sPCBznHLYIzqMp8BVGnwIXtSl4+rVVuVvtj4zRZ6wQIY9F0/IofA7n7tBeq4VtjoTLEJQbD2BcYXu6IiyA8NRbyRZegQVrzLv+FuWcXfgaIH2JGpNYqw2sdx3M3iDyRmlsZk8rMXwA85O9QsVo4CASN1u1gRT3x//5eMk1GS+0W2UnmwXqSybVi6tXD7ssSiBA6RZVdyDHyOhIOJO507RS6es41ldiTBX8W/0lmAIFBvTchgZ6Sf/6esYOqwHIIqlaW62uh5Bb0Ucj7fyI8Ijw/dLZpFVFOU9jSrkIh89BJ782VzGyWO528yNIVlpx3sZlwAS3qOADRB197eVFo+RyiwxW86GiSBPS0Slc+XYogPmD2TFv9SxbP8GhMUQZxpq3ldqGcJ+P8pjJukt2CiU+ob0YWJA/NsNW4irqgCxssRTZgIOUVamwEscQEMHZI743rrN9+Sh4LpjHQI7k6WzPDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(346002)(39860400002)(136003)(64756008)(2616005)(4326008)(54906003)(33656002)(66946007)(66556008)(316002)(2906002)(478600001)(53546011)(6506007)(44832011)(186003)(8936002)(86362001)(83380400001)(5660300002)(6486002)(71200400001)(66446008)(8676002)(6916009)(76116006)(36756003)(6512007)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cVNGeFlDTUNMck5udzliTkRRcDNVMHU1clJndWh5aVYxdVQ5SVU3cWJWdFhh?=
 =?utf-8?B?VkYxTjdOdXNwbkpXcU1FWkRzS2ZSUVZOcEU3UEx0ODFoVlZ6UC90Q09Ib0xX?=
 =?utf-8?B?VVF1RlF6S1JscytsUXFxc25ENmM2N3RLMW1jeDRyL2pwc0U5UWEvSkZWakJG?=
 =?utf-8?B?aFpoVkFHVWZIMy80QzVISVRVL21kZU5mVHhIeU43Y3NVNkliN0txU054WFlM?=
 =?utf-8?B?Q2syS3FWQkY3WEFPd2NobHJyOFFaUXY2QktqM0ZDZitzS2ZYR2k1b05jQUNF?=
 =?utf-8?B?K3BBN3lKbnJ0VHJoRjJ5MVlNbk1xTzJYNy9CbU1EK3ZwWUhzVTh1NEFVTDNG?=
 =?utf-8?B?TjBNanpQRDUvL0JlZWZNTmN2SWhobzYwOHgxam9QT3EwZWVmNU82TmwwVUMw?=
 =?utf-8?B?NTlSQ0hsemt0STIxRzlrOHMwekRYSE5DVFN4T2t0NzdXU3pUM3loS3QrUldX?=
 =?utf-8?B?Uk8wVjNtVENlSXFPMHIwaUdkK011c0tJNWRrT2psN3Z5c3ltMkJHVGUxSGtS?=
 =?utf-8?B?WXFvNEVFV0pKSDJpYjF4Mk9RS2tLbXZCSEpQNFZDdXB0clVGMENNR0dyU0Ns?=
 =?utf-8?B?ejU3UU51UWRnUmYwSmJ3Y3VyNzgyckdPc3l3dEYvakozOGhTY29aQkdPdW5B?=
 =?utf-8?B?VkU3ZFdjQnREV0NZNk5wbkgvNGpZU1FON2dHSWh2eW42TTMxeUNNY05qRVlM?=
 =?utf-8?B?T1pMb1ZKaVl2Uk5nbDVuSktuM1kzbkIxVE1uM0E3MnFkMyszTzdadTFxaElF?=
 =?utf-8?B?L3Q3UFNYUmMrYnVxenVFcitWb25nRHJnWlB5M2JwKzExZTlRZUVJTGNqWTFF?=
 =?utf-8?B?clFuUjA0Y1RxTEVIS1RmaVJMSGkwejVmREY1Ukl5L2ZyTDAxbit5MlNqVSts?=
 =?utf-8?B?Tk9SWmpPWHRTSTF6bThQcno1Wnlkc25QcU9iNnVRZ2VBQUluQ3diQnFUYVJw?=
 =?utf-8?B?U3BlM0hMU2JlbzlIWTZoVXBaWUtkNTZUQSs0THZTMldTY2FMdk1BYXJvYVJQ?=
 =?utf-8?B?U2Z3cmw4Wk94NkFtQ29VU3JtTGh5STVtY1BYb0FMRVloWmptNXRNQjhmamlS?=
 =?utf-8?B?aVU5OWdyZGdseERXblQrWjlhN1pBREk3UmtvK1JCTFdSZHFvWU56OWRGaFAv?=
 =?utf-8?B?bzhwaVVQZnd2cFo4cnlVdUpTdWtjNXJ6WVpYNUFMaGZwUHAzcmdYMktjTlll?=
 =?utf-8?B?aXlJQTJIZlZraXZ5TVU5blJSbjlwWU5ITnMzbVdYdk55TWY4RUZBTldkRldn?=
 =?utf-8?B?SGFSU0ZJTDU0UmJ1a0x0V21za3kxUWRPM25GaUt3NFNEYk1tN3gyMXlkcnFm?=
 =?utf-8?B?eDdteDEvekwzdEhRMDBuNFZXdityc3g0U3J2OFRmVTF5VTRER2NtVi80N0hG?=
 =?utf-8?B?VEFpdkpFVEN6RE9vejlocjhlV3kyKzF4YTh5cm8rZEQ5RkdtbU1WcERmV21m?=
 =?utf-8?B?V25pUGdOZmNBVE5wNDk1Z2xYNlBmL0RyYllPQ01qY0JaNXlSVlQ1YzZVdXBE?=
 =?utf-8?B?MnVITWxIdHFhTWVVL0RRRm1LOU0zRVRMSWxsL3F3TExvekZ2Z0tSWUh4eUxS?=
 =?utf-8?B?YUFHUHR0aGtrZ1ZIT1NQYVZ3TVpzZlpXVmRmdm50ZVZXbmhJaVBRUWRTWVY4?=
 =?utf-8?B?TXpNOFhQOHZDVDZSbThaZzl5WGpSVm5RSkRla3VkT3RQUzVMbXJCTXI3NVM1?=
 =?utf-8?B?YzZyc3o0aXJEUnk0cTNEWjR6VllGWG5qck5YZW5SZnRyUEF4bzg3bkhMZ1pF?=
 =?utf-8?B?TTFSSThmLzZjZ0FYV2M1b1pvMmhsTGR1V2tOR3VVa0NtZGR6Zm8wQkVpSk9p?=
 =?utf-8?B?N2tyb3VaV0x5SEwwc1VuTDBHZnZOUEYyaVJaMm9NeVNmbkhqVytLOHVZODJP?=
 =?utf-8?Q?3fGeXIqWSaiZP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8179214FE50F94DAD3E009CDF0633D7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e1186d-3c4f-4ba0-c263-08d8d9b5c9f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 17:50:07.2881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nBFsgPmxGUzA0C72wdtj0TNxMNmHcC1t3oYO/GVfBF2IUhIJ8/9xhXif18QKjBsTtu5Hzv7rahANy1kgu+z2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3917
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250135
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102250136
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDI1LCAyMDIxLCBhdCAxMTozNSBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgRmViIDI1LCAyMDIxIGF0IDAx
OjE1OjUzUE0gKzAxMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6DQo+PiBPbiAyNS8wMi8yMSAxMToz
OCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+Pj4gT24gMi8yNC8yMSAxOjIzIFBN
LCBQYW9sbyBCb256aW5pIHdyb3RlOg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPg0KPj4+PiAtLS0NCj4+Pj4gIGNvbmZpZ3VyZSAgICAgICAg
IHwgMTIgKysrKy0tLS0tLS0tDQo+Pj4+ICBtZXNvbi5idWlsZCAgICAgICB8ICA5ICsrKysrKyst
LQ0KPj4+PiAgbWVzb25fb3B0aW9ucy50eHQgfCAgMiArKw0KPj4+PiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+PiAuLi4NCj4+PiANCj4+Pj4g
QEAgLTI1MzUsNiArMjU0MCw3IEBAIGVuZGlmDQo+Pj4+ICBzdW1tYXJ5X2luZm8gKz0geyd0YXJn
ZXQgbGlzdCc6ICAgICAgICcgJy5qb2luKHRhcmdldF9kaXJzKX0NCj4+Pj4gIGlmIGhhdmVfc3lz
dGVtDQo+Pj4+ICAgIHN1bW1hcnlfaW5mbyArPSB7J2RlZmF1bHQgZGV2aWNlcyc6ICAgZ2V0X29w
dGlvbignZGVmYXVsdF9kZXZpY2VzJyl9DQo+Pj4+ICsgIHN1bW1hcnlfaW5mbyArPSB7J011bHRp
cHJvY2VzcyBRRU1VJzogbXVsdGlwcm9jZXNzX2FsbG93ZWR9DQo+Pj4gDQo+Pj4gU2luY2UgeW91
IGFyZSBjaGFuZ2luZyB0aGlzLCBpdCBpcyBhIGdvb2Qgb3Bwb3J0dW5pdHkgdG8gZmluZCBhDQo+
Pj4gYmV0dGVyIGRlc2NyaXB0aW9uIHRvIHRoaXMgZmVhdHVyZSAoc2ltaWxhcmx5IGhvdyB3ZSBy
ZWNlbnRseSBjbGFyaWZpZWQNCj4+PiB0aGUgVENJIGRlc2NyaXB0aW9uKS4NCj4+PiANCj4+PiBU
aGUgY3VycmVudCBkZXNjcmlwdGlvbiBpcyBjb25mdXNpbmcgd2l0aCBtdWx0aXByb2Nlc3Npbmcg
KHdoaWNoIGlzDQo+Pj4gYnkgZGVmYXVsdCBvbiBRRU1VIGFuZCBldmVyeSBkZXZlbG9wZXIgd2Fu
dCB0byBleHBsb2l0IHRoYXQpLg0KPj4+IA0KPj4+IFNvIHRoZSBtYWluIG11bHRpcHJvY2VzcyBj
b2RlIHJlc2lkZXMgaW4gaHcvcmVtb3RlL21wcWVtdSouDQo+Pj4gDQo+Pj4gSSBoYXZlIHRoZSBp
bXByZXNzaW9uICJtb25vbGl0aGljIGFwcGxpY2F0aW9uIiBpcyBjb21tb24gaW4NCj4+PiBzb2Z0
d2FyZSBlbmdpbmVlcmluZy4gV2hhdCBhYm91dCAicG9seWxpdGhpYyBRRU1VIj8NCj4+PiANCj4+
PiBTdGVmYW4gb25jZSBkZXNjcmliZWQgaXQgYXMgIm91dCBvZiAobWFpbikgcHJvY2VzcyBkZXZp
Y2UgZW11bGF0aW9uIi4NCj4+IA0KPj4gT3V0IG9mIHByb2Nlc3MgZW11bGF0aW9uPw0KPiANCj4g
V2hlbiBNdWx0aXByb2Nlc3MgUUVNVSBzd2l0Y2hlcyB0byB0aGUgdmZpby11c2VyIHByb3RvY29s
IHRoZSBmZWF0dXJlDQo+IGNvdWxkIGJlIHJlbmFtZWQgdG8gInZmaW8tdXNlciBkZXZpY2UgYmFj
a2VuZHMiLg0KDQpJIHBlcnNvbmFsbHkgZG9u4oCZdCBoYXZlIGFueSBwcmVmZXJlbmNlIGZvciB0
aGUgbmFtZS4NCg0KTGlrZSBTdGVmYW4gcG9pbnRlZCBvdXQsIHRoaXMgd291bGQgYmUgbWVyZ2Vk
IHdpdGggdGhlDQp2ZmlvLXVzZXIgbW9kZWwgZm9yIGVtdWxhdGluZyBkZXZpY2VzIGluIGEgc2Vw
YXJhdGUNCnByb2Nlc3MuIFdlIGNvdWxkIHByb2JhYmx5IHJlbmFtZSB0aGlzIGR1cmluZyB0aGF0
IGNoYW5nZS4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCENCuKAlA0KSmFnDQoNCj4gDQo+IFN0ZWZh
bg0KDQo=


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A03FCB98
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:40:43 +0200 (CEST)
Received: from localhost ([::1]:33584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6oU-00036n-DK
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL6mi-00018j-Bh; Tue, 31 Aug 2021 12:38:52 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL6mf-00042a-PC; Tue, 31 Aug 2021 12:38:51 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VGU4fu024933; Tue, 31 Aug 2021 09:38:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=adrSda76QhQo5531aZw0/0/isUspkONf17Uchig3FP4=;
 b=hGJcW8hRRCe/UczstHZgjZgy8kcORNVlhZbegjm6o8h0B3g8mZv0mjnsKbtairLOCFO4
 B2KHqVh2sh9avx6Y4jlok2iF1RPbqkp/9R9XoQt2fPTjWaXHFUI4Tcu3fOkyabueb0Cu
 VyxeFzA0QXxR8AzcJCKq2TBxsHgPL7fz1DU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3arnw1bjxp-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Aug 2021 09:38:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 09:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxG69l3g/18Y2qdVem0pSd9LeQJSdZfVdHCUbvFF6SbtHiXvXFyjDfY0377kwlBBDjee/6hBczULHLCMYAHGVnkISvnaj+F9jUPWZ+0VgG+rRF1jzg0j8DzdbNrZM/MjJ2s4ZGtK5xa2QBTT5GsW57qnF0iIfsj2rGFinCfwdxVRmh6wiONuBZ8wYRKR4zXwnMEL/J2LVVsJOKjs73/Ic9JXXVg5GMAdbYfqmOfZnVSZDz889IlRl4rJnV9hpLVUtLyCe+yW+SaGQLFi6bxyz3DU53SHf3Oax07cHk4STCFIwSfhFd2gQ6qi+fv1lA6qI/dZs8YQrIcSXnBzrGU0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adrSda76QhQo5531aZw0/0/isUspkONf17Uchig3FP4=;
 b=AG9+fsmCh08dtr4sQSU9yN8j1Ey7Wcbw70VqL6JIq3g9jLtZ2K+E4uISTj0vlHQVvN1kzrk1aSOXusfAskTi9K+DHkd3q6ymDV61WxrgFEj6uPNJSWrYjDrx6jBdlLZ8xDhZTupnugrR/pFfl8vv+ADzABXxlf/RYF4EjkwZtvyzQaFW73oEqHw7FoZ5fph8tD3Gwhgmr0wCu4Q2Q2h0gytP6GZKCSz/XTNH/b2ZKuMXh012ZzhpiyDrS52QsnYT7F9qfCPKpcGLqJKT6g8ciKqIBMZ1/gOD98xjk6KfktJopdGV+R8f6oDKEcjKJ9HbxvC8tOeMnNFL2a01+TTJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB4276.namprd15.prod.outlook.com (2603:10b6:a03:1b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 16:38:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 16:38:24 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
Thread-Topic: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
Thread-Index: AQHXm4djy02Xdrkh9Eqde0Cl/c+kM6uIll4AgAB97U6ABLdIAIAACpiA
Date: Tue, 31 Aug 2021 16:38:23 +0000
Message-ID: <2134A466-2C51-41F8-849C-434AF05EF018@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-4-pdel@fb.com>
 <5278af17-e56a-772a-21fe-8594790427d3@kaod.org>
 <BYAPR15MB3032502C1B7CE0F8E8431C73ACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <7ebbc78c-2deb-de51-5c7e-301633cead6e@amsat.org>
In-Reply-To: <7ebbc78c-2deb-de51-5c7e-301633cead6e@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a3f56c5-3367-4e8e-0893-08d96c9dc03a
x-ms-traffictypediagnostic: BY5PR15MB4276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB4276ED9103DFC956FE3B0E60ACCC9@BY5PR15MB4276.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: keSHCYWI7Lj/b5s7NBqHsz74ECSUd6FzwldzeRk8b7UoqS34YyD8ppJ4xzynOtAe2t4chlyF2bWF4eCyn6stdqut/n6p7Xk+OsY1iqB851uwB9d1U6qf8GRjoC+DHIoXj4mCtIyVr5GXr1Lh5NnCgd8dYLKipWLH2XbJsPX5hu6kt5Bbc4KUAZUn2UDr0+9dnZ5vSl4++hDSQqY6E8DtfCH84hAtkpRJMcdjFUptsrI11Y8wsH89UeDtQIK4sZKiWdZRKe+Ht6ACvs1+uGyeVWGJFKOuZpq7BO6stqdh3b3vFjIi94v61a+JguPMncuWvuNeCEEmI65R9cQpEmUDD0+Gm83YZRz9eyAGahkPybRy+Cw89rJYZROokHqWEnh4s9ZdgAwMPYuncIs8id1RWnhWJ0Nj/YQcfkgUtLTBfHrF0I8zZQAOPSmKeacN3o9vLYSqVlCvFRaAythNYUt6XfssiTltJZ3SIo+5lJGnajZuIFOv2xf2PQp8wKsDG4foPY1ALohp0K3On9Abw2I7MjhrvImeDiYkjAewceoOUzxzPPps2xLZKLhjsVta3PFDqgeZ43AtLJ+TgvPVr9vcK8absAFkL88uH0G9j53+Q80gqSVhdWU2nBRAGuEM1My1UXitfGphKgG2r0agFJ9XSsKNNU2Ffg+zjPTTeNjnYQb1Ia4XYc9COKxlXugT/mf5yUDOwGQrxX1ek1L2NOX5bJ5Tcavgq8LsDbPX4+8Gqkmw4T4Cvlpfnn62o9+/opq3QB2fRUmO7mKRZ3Niy09BTSpVPL7cU2ogN7qihfVPzeBPNLxztbbGt/sDPWUZOuAY9A6eMZA+MDTVZR1uZ4UBxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(6512007)(8676002)(6916009)(6486002)(5660300002)(2906002)(4326008)(186003)(38100700002)(316002)(54906003)(8936002)(122000001)(6506007)(53546011)(76116006)(38070700005)(66556008)(64756008)(2616005)(66476007)(66446008)(33656002)(66946007)(966005)(86362001)(478600001)(71200400001)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVk1RFhNTG5wMjdiNmVoNVkwK0tCd3RqTWRvSEdRK0F4U21Yd2VkbERZcURK?=
 =?utf-8?B?cXVzTnV0Q3JoNmI0YVV3bFZ2WTcwTG1PNml4TWptcU1SOHkvbmlkbEhpY0ZW?=
 =?utf-8?B?dDVtNGZwTHlteDNXT0RyVS9YcWFYM1VWU1M1dmNvQ0RRZTNCZmVJd0VRWU1i?=
 =?utf-8?B?Sy9VL3NERENPOTlXaEVXTmRGbmw0NStORk8wREhuS09tZGRmTkhpS251TGg5?=
 =?utf-8?B?Ny9PbnE1NjYxREhDOVhlMkVaU1RzQUMwTzEwS09zaWw2OTYvakVQUzlKTXdW?=
 =?utf-8?B?QzBFQ0poeThHUUlkOWI3WW5OSGhZL0hzRDdZdVVkRUk4NEl1M3pUbDNMYVpw?=
 =?utf-8?B?b2RsZzdDVGhQcjQySnJia2JKenVFL2hqYjVYUkoyeVY1Z2thazJRSjloYTBP?=
 =?utf-8?B?dzYvSUhSYnl5SE4wSFhETnFLYWU4UlFIT2IvdzR5c3RDdWcxeFJJd1BJaXlD?=
 =?utf-8?B?S1RyV2F2OEEyak1TSWJoYUZsek5GN2lHUXZMT29sbDVGaG1SVUMwVUdyZTM1?=
 =?utf-8?B?VGZidm10VE43SnJiRmprVWkyK0ErdFJxVUJqcXpkR2pZMk5yUVBXVVJDMDBB?=
 =?utf-8?B?MDNkd0hUZzJEU1AvWk9zUEZsRVI5N04wNHNmSU1XOVNkWXJMbU1ZRGtyQk01?=
 =?utf-8?B?QSs3elo3VWoyRGh4ZVRWY2J2OEFldFl4NkkzNU9oUWZWMmsycHIzL1lnbVlp?=
 =?utf-8?B?bmJpZmQ0ZldyM0xaSWpMMG5PSmYxQ1lUVS94SDdNclUwbmFrOC9MUGRrVUEx?=
 =?utf-8?B?QUpLQjBnckNSREY3U0UyVkZCMzJ4MXZxZTlTdVBXQzhYenM2SDBhUUlXbXgy?=
 =?utf-8?B?bGVtWjVBd0F1OXBrRWRTdnlhU0lIUm96NTFUMHZmVTZPTHJHeVZGd2h0Qll6?=
 =?utf-8?B?R3VyNndLNmpWWFYzQTBXNDQ0SXRXRnRTQjZDa2dIOWpwQXV0WXBBbGxwSmNK?=
 =?utf-8?B?bXpNckIwMFRVdm9LaFRUYzE5ekU0eVl2czROUEFqbWxZK2hCa1FUYVRqb1lZ?=
 =?utf-8?B?RFhNZE1UUE0vQnZJWnhkN1ZFazBwQ3llMENKT3ByeE43Y2EvNUs2VElMSWRh?=
 =?utf-8?B?ajZUZHlEUk1oQnBEZFJoNnJwUTlBRE1EWlBzcTdsUXlueVRWazdUWTRlT3lQ?=
 =?utf-8?B?Wjd5MmtkbVhML0xkTUNBalg0NDlJTXFEem56QTMxNGJWUFN6d3huQVg4K003?=
 =?utf-8?B?bjNYczhlaWR0c1pudUMvUE5lWEw0QWRzQ3VXOVBxaEZHd3h3SVd5akFxWEhG?=
 =?utf-8?B?NjZ1Q3Q5ejZYZkxaNWloUC9SMDRBWENKNzUwczZ1WVVTRlppMzlvemJRZU5r?=
 =?utf-8?B?Z2VpL0VxTWkyR3J4aHNoZG1reDlJeno3M3dHb0ZDaVlMckhuYmJ2ZHprTWUx?=
 =?utf-8?B?VjdDWVlKblFzaWhKcDg3dEVKenZhM1N6Z21oWFVMWnVRdGJtZGI5ZGtlenlI?=
 =?utf-8?B?NVY1OUhHY2FHUDFjSHpjNUkxM0tZMXZlUFRndWFVTmF2YUkvcSt2OEd5OEh0?=
 =?utf-8?B?TnQ4b2FQYUxGVHRRR1c4ZkdSb0dvSk5QZERKSzl0aXpWaHBpRWZqVEdFclhq?=
 =?utf-8?B?ZmRkUnJGTm1pMG1sczBRYnpGd2JYUDZKaTRQL3BQT3pFMXoxS1lGcjl2YVg5?=
 =?utf-8?B?am15OUpNR2oyZjcxZFhYcktrbnZTVWRuUDEzbnV1UWtpTHFxK2FwVmN3VUh3?=
 =?utf-8?B?Y1BHMWlOZDNDZFlIS3pDR0VCRFZ4aVY1VUtNK0JsNXp4V0Rpb0Q3ZS9SZitE?=
 =?utf-8?B?b1NVdTVRcXZiYkZybTNhZ2NRSlQxSG1rV1dNOGtDOFNXZGZscTFFTXlYYTV6?=
 =?utf-8?Q?ccy3Z6crnctXBZVQ304LqM6xc3aqM9UDwGLdI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C02FC0562CED14CBFD2CF5221A3AF54@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3f56c5-3367-4e8e-0893-08d96c9dc03a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 16:38:23.8660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7FPfRxNKqaIZzMxlKdsb6NCMZtE1ZCXrZqAmS8b6W1aUdascjc1uRwCsKc9y8HY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB4276
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 4xN09ty52_K6A8bQsxGzOK2iBFsqVp3L
X-Proofpoint-GUID: 4xN09ty52_K6A8bQsxGzOK2iBFsqVp3L
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_07:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310089
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=88771d3da1=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDMxLCAyMDIxLCBhdCA5OjAwIEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDgvMjgvMjEgNjowMCBQTSwgUGV0
ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+IEFjdHVhbGx5IHllcyEgSSBzaG91bGQgaGF2ZSBpbmNs
dWRlZCBhIGxpbmsgdG8gaXQ6DQo+PiBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJt
Yy11Ym9vdC9ibG9iL29wZW5ibWMvaGVsaXVtL3YyMDE5LjA0L2FyY2gvYXJtL2R0cy9hc3BlZWQt
Ym1jLWZhY2Vib29rLWZ1amkuZHRzDQo+IA0KPiAoT24gdGVjaG5pY2FsIGxpc3RzLCBpdCdzIGJl
c3QgdG8gYXZvaWQgdG9wLXBvc3RpbmcsIGFuZCB0bw0KPiBpbnN0ZWFkIHJlcGx5IGlubGluZSB0
byBtYWtlIHRoZSBjb252ZXJzYXRpb24gZWFzaWVyIHRvIGZvbGxvdykuDQo+IA0KPiBDYW4geW91
IGFkZCBhIHRlc3QgZm9yIHlvdXIgYm9hcmQgcGxlYXNlPyBTZWUgZXhhbXBsZXMNCj4gaW4gdGVz
dHMvYWNjZXB0YW5jZS9ib290X2xpbnV4X2NvbnNvbGUucHk6DQo+IC0gdGVzdF9hcm1fYXN0MjUw
MF9yb211bHVzX29wZW5ibWNfdjJfOV8wDQo+IC0gdGVzdF9hcm1fYXN0MjYwMF9kZWJpYW4NCg0K
KFNvcnJ5IGFib3V0IHRoYXQsIEnigJlsbCByZXBseSBpbmxpbmUgbm93KQ0KDQpZZWFoIGFic29s
dXRlbHksIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhvc2Ugb3V0OiBJIGFjdHVhbGx5IHJlc3VibWl0
dGVkIFtQQVRDSCA1LzVdDQpzZXBhcmF0ZWx5IGFscmVhZHksIHNob3VsZCBJIGp1c3Qgc3VibWl0
IGl0IGFnYWluIGFzIFtQQVRDSCB2Ml0gd2l0aCB0aGUgdGVzdHMsDQpvciB3b3VsZCB5b3Ugd2Fu
dCB0byByZXBseSB0byB0aGF0IHBhdGNoPyBJ4oCZbGwgaW5jbHVkZSBhIGNvdmVyIGxldHRlciB0
aGF0IGhhcyBhDQpkaWZmLXN0YXQgb2YgdGhlIHRlc3QgY2hhbmdlcyByZWdhcmRsZXNzIEkgc3Vw
cG9zZSwgc28gaXTigJlzIHByb2JhYmx5IG5vdCBuZWNlc3NhcnkNCnJpZ2h0Pw0KDQpUaGFua3Ms
DQpQZXRlcg0KDQo+IA0KPj4gKkZyb206ICpDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
Pg0KPj4gKkRhdGU6ICpTYXR1cmRheSwgQXVndXN0IDI4LCAyMDIxIGF0IDE6MjggQU0NCj4+ICpU
bzogKlBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4gKkNjOiAqam9lbEBqbXMuaWQu
YXUgPGpvZWxAam1zLmlkLmF1PiwgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+PiA8cWVtdS1kZXZl
bEBub25nbnUub3JnPiwgcWVtdS1hcm1Abm9uZ251Lm9yZyA8cWVtdS1hcm1Abm9uZ251Lm9yZz4N
Cj4+ICpTdWJqZWN0OiAqUmU6IFtQQVRDSCAzLzVdIGh3L2FybS9hc3BlZWQ6IEFkZCBmdWppIG1h
Y2hpbmUgdHlwZQ0KPj4gDQo+PiBPbiA4LzI3LzIxIDExOjA0IFBNLCBwZGVsQGZiLmNvbSB3cm90
ZToNCj4+PiBGcm9tOiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+PiANCj4+PiBG
dWppIHVzZXMgdGhlIEFTVDI2MDAsIHNvIGl0J3MgdmVyeSBzaW1pbGFyIHRvIGBhc3QyNjAwLWV2
YmAsIGJ1dCBpdCBoYXMNCj4+PiBhIGZldyBzbGlnaHQgZGlmZmVyZW5jZXMsIHN1Y2ggYXMgdXNp
bmcgVUFSVDEgZm9yIHRoZSBzZXJpYWwgY29uc29sZS4NCj4+IA0KPj4gRG8gd2UgaGF2ZSBhIHB1
YmxpYyBEVFMgZm9yIHRoaXMgYm9hcmQgPw0KPj4gDQo+PiBUaGFua3MsDQo+PiANCj4+IEMuDQo+
PiANCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNv
bT4NCj4+PiAtLS0NCj4+PiAgIGh3L2FybS9hc3BlZWQuYyB8IDEzICsrKysrKysrKysrKysNCj4+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdp
dCBhL2h3L2FybS9hc3BlZWQuYyBiL2h3L2FybS9hc3BlZWQuYw0KPj4+IGluZGV4IGZmNTNkMTIz
OTUuLmQyZWI1MTZhMWQgMTAwNjQ0DQo+Pj4gLS0tIGEvaHcvYXJtL2FzcGVlZC5jDQo+Pj4gKysr
IGIvaHcvYXJtL2FzcGVlZC5jDQo+Pj4gQEAgLTEwMjksNiArMTAyOSwxNSBAQCBzdGF0aWMgdm9p
ZA0KPj4gYXNwZWVkX21hY2hpbmVfcmFpbmllcl9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywg
dm9pZCAqZGF0YSkNCj4+PiAgICAgICAgICAgYXNwZWVkX3NvY19udW1fY3B1cyhhbWMtPnNvY19u
YW1lKTsNCj4+PiAgIH07DQo+Pj4gIA0KPj4+ICtzdGF0aWMgdm9pZCBhc3BlZWRfbWFjaGluZV9m
dWppX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPj4+ICt7DQo+Pj4g
KyAgICBNYWNoaW5lQ2xhc3MgKm1jID0gTUFDSElORV9DTEFTUyhvYyk7DQo+Pj4gKyAgICBBc3Bl
ZWRNYWNoaW5lQ2xhc3MgKmFtYyA9IEFTUEVFRF9NQUNISU5FX0NMQVNTKG9jKTsNCj4+PiArDQo+
Pj4gKyAgICBtYy0+ZGVzYyA9ICJGYWNlYm9vayBGdWppIEJNQyAoQXNwZWVkIEFTVDI2MDAsIENv
cnRleC1BNykiOw0KPj4+ICsgICAgYW1jLT5zZXJpYWxfZGV2ID0gQVNQRUVEX0RFVl9VQVJUMTsN
Cj4+PiArfQ0KPj4+ICsNCj4+PiAgIHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfbWFjaGlu
ZV90eXBlc1tdID0gew0KPj4+ICAgICAgIHsNCj4+PiAgICAgICAgICAgLm5hbWUgICAgICAgICAg
PSBNQUNISU5FX1RZUEVfTkFNRSgicGFsbWV0dG8tYm1jIiksDQo+Pj4gQEAgLTEwNzgsNiArMTA4
NywxMCBAQCBzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNwZWVkX21hY2hpbmVfdHlwZXNbXSA9IHsN
Cj4+PiAgICAgICAgICAgLm5hbWUgICAgICAgICAgPSBNQUNISU5FX1RZUEVfTkFNRSgicmFpbmll
ci1ibWMiKSwNCj4+PiAgICAgICAgICAgLnBhcmVudCAgICAgICAgPSBUWVBFX0FTUEVFRF9NQUNI
SU5FLA0KPj4+ICAgICAgICAgICAuY2xhc3NfaW5pdCAgICA9IGFzcGVlZF9tYWNoaW5lX3JhaW5p
ZXJfY2xhc3NfaW5pdCwNCj4+PiArICAgIH0sIHsNCj4+PiArICAgICAgICAubmFtZSAgICAgICAg
ICA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJmdWppIiksDQo+Pj4gKyAgICAgICAgLnBhcmVudCAgICAg
ICAgPSBNQUNISU5FX1RZUEVfTkFNRSgiYXN0MjYwMC1ldmIiKSwNCj4+PiArICAgICAgICAuY2xh
c3NfaW5pdCAgICA9IGFzcGVlZF9tYWNoaW5lX2Z1amlfY2xhc3NfaW5pdCwNCj4+PiAgICAgICB9
LCB7DQo+Pj4gICAgICAgICAgIC5uYW1lICAgICAgICAgID0gVFlQRV9BU1BFRURfTUFDSElORSwN
Cj4+PiAgICAgICAgICAgLnBhcmVudCAgICAgICAgPSBUWVBFX01BQ0hJTkUsDQo+Pj4gDQo+PiAN
Cj4gDQoNCg==


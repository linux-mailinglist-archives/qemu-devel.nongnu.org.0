Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644C434487
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:09:49 +0200 (CEST)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3rI-00059m-9U
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99270d430e=pdel@fb.com>)
 id 1md3fX-000414-73; Wed, 20 Oct 2021 00:57:40 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:28016
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99270d430e=pdel@fb.com>)
 id 1md3fV-0000AP-93; Wed, 20 Oct 2021 00:57:38 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 19K1Xhs6021494;
 Tue, 19 Oct 2021 21:57:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=fDH0FMe6Cf8P5arCmqCABSepkSr1vJGqKT8DZZOB5EU=;
 b=nvlxXoZmLJD+W60NEue/vxp6G6kebuA5QDmmVXjMhaw0Rhq9dmhRm4+8N16IcD3kPeFP
 xkyNtS06WJ7vBJ94ynJYN0z69BP9lq5+nsP2QeRHS5cX1R3sGnv+hZqGsGpzI0/QCNvo
 mypj9fXKp3ewOfbVQ2D13ZGrhU5WzYf5YYo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 3bt9j50txm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Oct 2021 21:57:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 21:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2I/RUl4T8fMT5EgxPjRM80bQcyKyZGIPjfzxVHrFmC+KByU5yXrZ5SCLuMxYtkqUH9Px0SHx4nSm3IA+nZYKTdqfCVhhcjJIMoYtCK2zgtH9aP3J8fe7uvjY+Y+dfK4GNHnUB2Gdna5hrjwsWzs8hHUVWkud9CHnMbBwem4GNu3cNul4925OcaMXSV/P3nFIFWNTZKk5fAzHKOxY1/7BM+e2p+obE9yffLChQleAUIHA2HvPIH20Z4ZJL+ZjKedhivhE94Vc3/mltnRj6nFJrLluxtAPFGswXxYIm7uJxPtA2BQ5CasqXSVySVQ+Sa4LAUdErPNHh2054ZR3ruroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDH0FMe6Cf8P5arCmqCABSepkSr1vJGqKT8DZZOB5EU=;
 b=LHoOs0m4SXGu9ry+keGARxLXv4ATzvYHkUwj9WpEFqM6ER0C04qDCVxhHpzXu/ScLm7xhTZmmeO2AI8FeIyg8o2leoDW3SRh6JnUU1yLx6JaceopG17mZpomsJkcsl7mvaHhmykON1hcJ0Li167R9S4H9m7olICJG4fECLKcLxqi4VRR7jhiomNv8UbYW5wNqS9Qy7+hy3xTcrhxy4a1Y+awj5H0IdZN0tN6Kq8gd1cenvmpv8q9KgwcnkMvF4LagBEVxihL9xOtmtdMyATurm0MDUjRQwWC1kxb0kUcklnpX+d+/B26j0HksG8/46IdzdwwD3d/ifHBnfxNKAUzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4405.namprd15.prod.outlook.com (2603:10b6:a03:35a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 04:57:21 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e034:cb74:cc86:7f89%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 04:57:21 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Thread-Topic: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate
 boot function
Thread-Index: AQHXxW72jbkRiQFizkyIML431+7yTg==
Date: Wed, 20 Oct 2021 04:57:20 +0000
Message-ID: <DDD67A99-FA65-4671-ACE6-5D3BACE3F45A@fb.com>
References: <20211018132609.160008-1-clg@kaod.org>
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db557129-c4f4-4365-035a-08d99386196f
x-ms-traffictypediagnostic: SJ0PR15MB4405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB4405A7DDF4BDF6F45BFAB7EEACBE9@SJ0PR15MB4405.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZF6w6iibdrczu1SaoKQW4ogNgvVQ22j7Wh6gzbbwDoFBm1iEAAJj7VOPIaZf0IEgtB3TK9vsz26sJyvzhEqQXHCBQ1ymihzuqiYUWz/M66os9Je4XPDunRWVuTY/umo2ZQu6xSxzKYDYtcKvg+SpjodvrKUNxyiwxEo/DuulKETnWY4QqkvbdqlEQa3oehlC73qwiwKEO2QvdI/ff5PAKckvXvXesE+0KTkXNXTjcmKS9l5iMUJZyhUq3Uwo9oPrYpPJF+/aOBsxVFhyhtsG4FH+wlP7Qn/Fz5X5E2kXfW01NVSQawzdUqMBNaNMEh9MWUdQXxIXCqnisyBX+KALwx1bRRt0IQMDbwES4JFcclcDqeihAxFi02qBHfyo649dkVSkrDphvORzb43izaGihkvHpimgThxB++Br+hjO9c0CMBwRYwG722DtSyeGvIF63Ef7MnsfR78YsizwiZS1NXxr085IAoSe7YPtUJc+vSnO1Kjgmbf4460AohHSfsXW1wIoMpEG7uWb4RkreVJ7Eb+Aop0+WS6nSUM0wxdW9eHv309RS6MH1FnnvNU3vImnV9rm89YIj4ES+51Z98CSeEGsbkotGwOOeIqNOcmC5oDzWBXpmUhBmOD2n3qQHIq5nCUz42Yn6CncKjXhRCPefihzAvGQ3n+/URbLdOJrD+vhg2+wDaUUw8iwueoRu0Cb1xds0wm9aBSR+vNVvc3lyqb4jlRKgqGgFgStRXAWwM4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(54906003)(6512007)(4326008)(6506007)(53546011)(83380400001)(8936002)(38100700002)(109986005)(66574015)(91956017)(2906002)(2616005)(66476007)(66446008)(33656002)(8676002)(71200400001)(6486002)(5660300002)(38070700005)(122000001)(36756003)(66556008)(76116006)(66946007)(64756008)(508600001)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmVxckg4ajhJKzlZa01hc2pXbVd1ODNwSDdxNzhkdDN2bVdoR1Z4cm1qM1M5?=
 =?utf-8?B?NjBsNkJsVkIzemxtVGhQUG9tT2NWd25LbGM4SVdtMEdiZ2txN0xFbUE0djJl?=
 =?utf-8?B?WGtvdktsNkZ3Y09NZFZCcDBVaElEdkMxclc3OFArM1NERzlTVGJkMWhOQmIr?=
 =?utf-8?B?WnNodkRsNG1FZEcwUFczM3loME82Kys5UjM2bk00OVJ4Z0VJb2NLMmVHYWRP?=
 =?utf-8?B?aFVLc0d0cEkyTk1LdEV0cytVWUY3dGhxNktkdGhsaXJ2N09JNC8vQU9nNHEz?=
 =?utf-8?B?TFIxVm5pQnJkZVlBUTh0dnFiUlM4VVgxZXBQQjNUM29YOUJIdVFXR09YcWh4?=
 =?utf-8?B?NFNHbTlpeTVCRkRpR3RmN1c5dGJIN1pEdnY2YnVieEhIZkhTbFlaeUVUM0pV?=
 =?utf-8?B?RVlOS3FsMktYbDd3ckNNY1BaTUdQSUUzdlZlRmpVNld5RVdZY0pER0FnMTJi?=
 =?utf-8?B?elo1WlZDeEdzTlEvRWgyaGQrSjd3V1UrTDNaMDQ2Zk0vSStlTlpaTTdnSi92?=
 =?utf-8?B?QkFPOEtMbjBuK3E1MERid3hjS2lhYmJma3lOWDRSaTE3S1RXMFdMc2V3ditN?=
 =?utf-8?B?RWRwbXNPUHV0dU1XZS9SSmxCSDRWYjN2a2xBaVczcXRpcWkvTU5WeUlSbVRl?=
 =?utf-8?B?Q3VEZDJoN2l0aTM1aGtLMW9Sb3h3SU4wRThoUzJrUnlZY1orUitYUzJvQkRV?=
 =?utf-8?B?YXVjSmVsODZNaklxTXRQYjArWWdjeldlZkVZbGdVMEgxN1kreDBoRkhlb3pX?=
 =?utf-8?B?S3lkdjAxQ1RnM1hJb1I2M21Yb1RuczFDYTdvU0p3T3p1dkFpSFR0OXNONENX?=
 =?utf-8?B?KzhkNEwxNVhyYkJ2UnNtSHdiSGxUSmxEcDNkOUVhcWc5VXZCemoraGdESUZK?=
 =?utf-8?B?MU1ibFdYRW5lL0xjL3BESU1WRkZISXNPdGVDQkNYWE5sRlgxU0JqT0VRMS9Q?=
 =?utf-8?B?a2E2SGVYNWExVHEzemFFNnVha3gyNXBLbjNGREczNGJYeVVUUStIdnh4aTRN?=
 =?utf-8?B?T3FWaHdzai83L05jQjFFdGZiZk83aWlQSDdGMXFBN014dklKQ3h1K0FUZzFS?=
 =?utf-8?B?VG55WitkL0lsUCtuQTI4NWdNZGhjR01vaTNkQVcyU2NXSHg2Sy9SNmNUMXFt?=
 =?utf-8?B?S1lBUmFYTW44TmxIbUF3WUJ2eDlsa3RDd1dFdUdwNGtGYUV3ZzJ5UjU0d2Z1?=
 =?utf-8?B?UzV6SDB5TUJaS3NXSHNObmx1Y3hGbE43MVpXMkd4ME4vcUMyakFPankwbWZG?=
 =?utf-8?B?VFcwNmJNSGh6TFhjeGo4aUtFUVRKR0p5blFPTDFWVEh4Y3ZvdXdrM01iSG1s?=
 =?utf-8?B?OFdTU2NMQVVmWVNrNUhKZlQwd3Z3UVZnQXQyTXhsd293UzFxVzVaK0ErU21W?=
 =?utf-8?B?bzJZeDAxaDErUzFPRzNFK2tXdndNK0ZGbm9MNUJKcFh5eHp6ajdTcWVUa3d4?=
 =?utf-8?B?RUlxbGd0bDVaVzBqQWhKV2dIUE1EV2NhTGdmaHd0a21DZVFRY0lKUmsrTUox?=
 =?utf-8?B?ZzB4UUlVWFpwNnZIYzJEYzZoa0I4cXFpSnYydkE1b05UdEF2cUpiWllJRHBm?=
 =?utf-8?B?UlZocU01bjhBRG8ra21BYWxaVi9VN1d4bGlOckR3SmJSNGxHYmppamFCSHN4?=
 =?utf-8?B?d1F1OWRjUkg0eTZlb3ZGU3REMWlCTStraFp3cU11ZU85akQ0djBTWWdJMmRG?=
 =?utf-8?B?czFxRTc3NitVYlNIUUpXTHkrWlZtdkVBTGttR0dJTHRpenlwWHVBS2dQVjY2?=
 =?utf-8?B?NlRSYytDcnZGbzZrUk83RVdYNm5PcXB0ZUNjTXdtUkF2aEI2L2QzMWdTTHJa?=
 =?utf-8?Q?3ZkykAayPLzk4joMzJbAr3bjovcUrUdi9lxVQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57940F4A92BC504ABF6416E462B1D3C4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db557129-c4f4-4365-035a-08d99386196f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 04:57:20.8903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngM+W5IOG+5p1S/muFHdDqfeVlUoZTvAbJuiG9qbhUUM+dUh0TwKYftgxZ0XlV/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4405
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 9CSSstROgtzKB_gcggoh8pjYed-mQL22
X-Proofpoint-GUID: 9CSSstROgtzKB_gcggoh8pjYed-mQL22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_01,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=969 lowpriorityscore=0
 clxscore=1011 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200025
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=99270d430e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

DQoNCj4gT24gT2N0IDE4LCAyMDIxLCBhdCA2OjI2IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IEhlbGxvLA0KPiANCj4gVGhlIEFzcGVlZCBTb0NzIGhh
dmUgYSBkdWFsIGJvb3QgZnVuY3Rpb24gZm9yIGZpcm13YXJlIGZhaWwtb3Zlcg0KPiByZWNvdmVy
eS4gVGhlIHN5c3RlbSBhdXRvLXJlYm9vdHMgZnJvbSB0aGUgc2Vjb25kIGZsYXNoIGlmIHRoZSBt
YWluDQo+IGZsYXNoIGRvZXMgbm90IGJvb3Qgc3VjY2Vzc2Z1bGx5IHdpdGhpbiBhIGNlcnRhaW4g
YW1vdW50IG9mIHRpbWUuIFRoaXMNCj4gZnVuY3Rpb24gaXMgY2FsbGVkIGFsdGVybmF0ZSBib290
IChBQlIpIGluIHRoZSBGTUMgY29udHJvbGxlcnMuDQo+IA0KPiBPbiB0aGUgQVNUMjYwMCwgdGhl
IEFCUiByZWdpc3RlcnMgY29udHJvbGxpbmcgdGhlIDJuZCB3YXRjaGRvZyB0aW1lcg0KPiB3ZXJl
IG1vdmVkIGZyb20gdGhlIHdhdGNoZG9nIHJlZ2lzdGVyIHRvIHRoZSBGTUMgY29udHJvbGxlci4g
VG8NCj4gY29udHJvbCBXRFQyIHRocm91Z2ggdGhlIEZNQyBtb2RlbCByZWdpc3RlciBzZXQsIHRo
aXMgc2VyaWVzIGNyZWF0ZXMgYQ0KPiBsb2NhbCBhZGRyZXNzIHNwYWNlIG9uIHRvcCBvZiBXRFQy
IG1lbW9yeSByZWdpb24uDQo+IA0KPiBUbyB0ZXN0IG9uIHRoZSBmdWppLWJtYyBtYWNoaW5lLCBy
dW4gOg0KPiANCj4gICAgZGV2bWVtIDB4MWU2MjAwNjQNCj4gICAgZGV2bWVtIDB4MWU3ODUwNEMg
DQo+IA0KPiAgICBkZXZtZW0gMHgxZTYyMDA2NCAzMiAweGZmZmZmZmZmDQo+ICAgIGRldm1lbSAw
eDFlNjIwMDY0DQo+ICAgIGRldm1lbSAweDFlNzg1MDRDDQoNClRoaXMgbG9va3MgZ29vZCB0byBt
ZSEgSSBsb29rZWQgYXQgdGhlIHdob2xlDQpwYXRjaCBzZXJpZXMsIEkgdGhpbmsgYWxsIHRoZSBj
aGFuZ2VzIGxvb2sgcmlnaHQuDQoNCkJ5IHRoZSB3YXksIGp1c3QgdG8gbWFrZSBzdXJlIEnigJlt
IHVuZGVyc3RhbmRpbmcgY29ycmVjdGx5Og0KDQpUaGUgQVNUMjQwMCBkYXRhc2hlZXQgc2hvd3Mg
b25seSAyIHdhdGNoZG9nIHRpbWVycywgYW5kDQp0aGUgZmlyc3QgdG8gYmUgdXNlZCBhcyB0aGUg
cHJpbWFyeSBzeXN0ZW0gZGVhZGxvY2sNCnJlc2V0IChidXQgc3RpbGwgcmVib290IGZyb20gdGhl
IHByaW1hcnkgZmxhc2gpLCBhbmQgdGhlDQpzZWNvbmQgd2F0Y2hkb2cgaXMgZGVzaWduYXRlZCBh
cyBhbiBhbHRlcm5hdGUgYm9vdA0Kd2F0Y2hkb2csIHdoaWNoIHJlYm9vdHMgZnJvbSBzZWNvbmRh
cnkgZmxhc2ggYW5kIGlzDQpvbmx5IGVuYWJsZWQgaWYgdGhlcmXigJlzIGEgc3BlY2lmaWMgaHcg
c3RyYXAgcGluIGVuYWJsZWQsDQphbmQgdGhlIHNlY29uZCB3YXRjaGRvZyBpcyB1c3VhbGx5IGRp
c2FibGVkIG9uY2UgYm9vdGluZw0KaXMgc3VjY2Vzc2Z1bCwgcmlnaHQ/DQoNClRoZSBBU1QyNjAw
IGRhdGFzaGVldCBzaG93cyB0aGVyZeKAmXMgOCB3YXRjaGRvZ3MgKGJ1dA0Kd2Ugb25seSBoYXZl
IDQgZGVjbGFyZWQgaW4gUUVNVT8gSSBzZWUgb25seSB0aGUgZmlyc3QNCmZvdXIgc3VwcG9ydCBl
eHRlcm5hbCByZXNldCBzaWduYWxzLCBtYXliZSB0aGF04oCZcyB3aHk/KQ0KYnV0IGl0IGRvZXNu
4oCZdCBzZWVtIHRvIHNheSBleHBsaWNpdGx5IHRoYXQgdGhlIDJuZA0Kd2F0Y2hkb2cgaXMgdGhl
IGFsdGVybmF0ZSBib290IHdhdGNoZG9nLCBpdOKAmXMgcHJvYmFibHkNCmp1c3QgaW1wbGllZCB0
aGF0IHRoZSB1c2VyIHJlYWQgdGhlIEFTVDI0MDAvQVNUMjUwMCBkb2NzDQpyaWdodD8gQW5kIHRo
ZSBGTUMgcmVnaXN0ZXJzIGFyZSBqdXN0IGFuIGFsaWFzIHRvIHdyaXRlDQp0byB0aGVzZSB3YXRj
aGRvZyAyIHJlZ2lzdGVycz8gSnVzdCBjdXJpb3VzLCBpcyBpdA0Kc3RyaWN0bHkgbmVjZXNzYXJ5
IHRvIHVzZSB0aGUgRk1DIHJlZ2lzdGVycyB0byBkaXNhYmxlDQp0aGUgYWx0ZXJuYXRlIGJvb3Qg
d2F0Y2hkb2csIG9yIGNvdWxkIHlvdSBqdXN0IHVzZSB0aGUNCm9sZCBhZGRyZXNzLCAweDFlNzg1
MDRDPyBJbiBvdXIgT3BlbkJNQyBpbml0aWFsaXphdGlvbg0KZm9yIEZ1amksIHdl4oCZcmUgdXNp
bmcgdGhlIEZNQyByZWdpc3RlcnMsIGJ1dCB3b3VsZA0KaXQgc3RpbGwgd29yayBpZiB3ZSB1c2Vk
IHRoZSBvbGQgYWRkcmVzc2VzPyBKdXN0IGN1cmlvdXMsDQp0aGUgbW9yZSBJIHRoaW5rIGFib3V0
IGl0LCBpdCBzZWVtcyBvZGQgdG8gbWUgdGhhdCB0aGVzZQ0KRk1DIHdhdGNoZG9nIHJlZ2lzdGVy
cyBleGlzdCBpZiB0aGV54oCZcmUganVzdCBhbiBhbGlhcy4NCg0KQWxzbywgSSB3YXMgd29uZGVy
aW5nOiBkb2VzIHRoZSBhbHRlcm5hdGUgYm9vdA0Kd2F0Y2hkb2cgYWN0dWFsbHkgc3dpdGNoIHRo
ZSBmbGFzaCBkZXZpY2Ugb3IgZmxhc2gNCnJlZ2lvbiB0aGF0IHdlIGJvb3QgZnJvbSwgb3IgZG9l
cyBpdCBqdXN0IHJlYm9vdCBmcm9tDQp0aGUgcHJpbWFyeSBwYXJ0aXRpb24/IEkgZG9u4oCZdCBz
ZWUgYW55dGhpbmcgaW4NCndhdGNoZG9nX3BlcmZvcm1fYWN0aW9uKCkgdGhhdCBvYnZpb3VzbHkg
aW5kaWNhdGVzIHdl4oCZcmUNCmFjdHVhbGx5IHN3aXRjaGluZyB0byBhIHNlY29uZGFyeSBmbGFz
aCwgc28gSSB3YXMgY3VyaW91cw0KYWJvdXQgdGhhdC4NCg0KVGhhbmtzIGZvciBhZGRpbmcgdGhp
cyB0aG91Z2ghIFRoaXMgaXMgdmVyeSB1c2VmdWwsIHdl4oCZcmUNCnVzaW5nIFFFTVUgbW9yZSBh
bmQgbW9yZSBmb3IgdGVzdGluZywgZXNwZWNpYWxseSB0aGUNCmJvb3QgcHJvY2Vzcywgc28gbW9y
ZSBhY2N1cmF0ZSBlbXVsYXRpb24gb2YgdGhpcyBmdW5jdGlvbmFsaXR5DQppcyBncmVhdC4NCg0K
VGhhbmtzLA0KUGV0ZXINCg0KUmV2aWV3ZWQtYnk6IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIu
Y29tPg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+IEMuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0K
PiANCj4gLSBpbnRyb2R1Y2UgYSBjb250YWluZXIgcmVnaW9uIGZvciB0aGUgV0RUMiByZWdpc3Rl
ciBhZGRyZXNzIHNwYWNlDQo+IC0gaW50cm9kdWNlIGEgY29udGFpbmVyIHJlZ2lvbiBmb3IgdGhl
IGZsYXNoIG1taW8gYWRkcmVzcyBzcGFjZQ0KPiANCj4gQ8ODwqlkcmljIExlIEdvYXRlciAoNSk6
DQo+ICBhc3BlZWQvd2R0OiBJbnRyb2R1Y2UgYSBjb250YWluZXIgZm9yIHRoZSBNTUlPIHJlZ2lv
bg0KPiAgYXNwZWVkOiBJbml0aWFsaXplIHRoZSB3YXRjaGRvZyBkZXZpY2UgbW9kZWxzIGJlZm9y
ZSB0aGUgRk1DIG1vZGVscw0KPiAgYXNwZWVkL3NtYzogSW1wcm92ZSBzdXBwb3J0IGZvciB0aGUg
YWx0ZXJuYXRlIGJvb3QgZnVuY3Rpb24NCj4gIGFzcGVlZC9zbWM6IFVzZSBhIGNvbnRhaW5lciBm
b3IgdGhlIGZsYXNoIG1taW8gYWRkcmVzcyBzcGFjZQ0KPiAgc3BlZWQvc2RoY2k6IEFkZCB0cmFj
ZSBldmVudHMNCj4gDQo+IGluY2x1ZGUvaHcvc3NpL2FzcGVlZF9zbWMuaCAgICAgIHwgIDUgKy0N
Cj4gaW5jbHVkZS9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmggfCAgMSArDQo+IGh3L2FybS9hc3Bl
ZWRfYXN0MjYwMC5jICAgICAgICAgIHwgMzggKysrKysrKy0tLS0tLS0NCj4gaHcvYXJtL2FzcGVl
ZF9zb2MuYyAgICAgICAgICAgICAgfCAzNiArKysrKystLS0tLS0tDQo+IGh3L3NkL2FzcGVlZF9z
ZGhjaS5jICAgICAgICAgICAgIHwgIDUgKysNCj4gaHcvc3NpL2FzcGVlZF9zbWMuYyAgICAgICAg
ICAgICAgfCA4OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiBody93YXRjaGRv
Zy93ZHRfYXNwZWVkLmMgICAgICAgICB8ICA2ICsrLQ0KPiBody9zZC90cmFjZS1ldmVudHMgICAg
ICAgICAgICAgICB8ICA0ICsrDQo+IGh3L3NzaS90cmFjZS1ldmVudHMgICAgICAgICAgICAgIHwg
IDEgKw0KPiA5IGZpbGVzIGNoYW5nZWQsIDE0MSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMo
LSkNCj4gDQo+IC0tIA0KPiAyLjMxLjENCj4gDQo+IA0KPiANCg0K


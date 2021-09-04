Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31A4008EE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 03:24:13 +0200 (CEST)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMKPk-0007Hb-8v
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 21:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8881c65811=pdel@fb.com>)
 id 1mMKOg-0006QA-V9; Fri, 03 Sep 2021 21:23:06 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:23424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8881c65811=pdel@fb.com>)
 id 1mMKOe-0001rm-Oo; Fri, 03 Sep 2021 21:23:06 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1841Ig6t026102; Fri, 3 Sep 2021 18:22:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=hNVrUGULEbNTCQ6HmX5yaKTXPsgOhHV1Fo2OI16S2is=;
 b=buZzgvr3fMMd1OXPWbAKwxR3nZWVDRNf8ElEHAF6t9tdheV5D3bRDk1UgPeYn9oLxSdQ
 pzWqGNg5wpoGYnKMEIxuhvrIP9c4+6b0mo90ad+vWbgQsf4UDrLwzID7RwNwBKCNBmQV
 dxSFzxzq5K/cUCR+gzECUEzbf2I8l05/XEM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3aua0772ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Sep 2021 18:22:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 3 Sep 2021 18:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efKgferYllheDma5va94gzcPqxI9xlWLgjZ665gIVKzJDkADSWTSp78Qi4XvNTok0rGaJsJ9ilRR3av2Eyax9CfuNKi9QBT198B2o/SwT3F32rn6h1sktF59KQTBlS2Ply5Nuo63XqemLItokVEBz2KYyxmv7auKFG4ksX74TlK7TUvyoA0okrxUUsfHGZbZ6Zt3QdtXuwFunEwK1JVDiJc+tm30hI2rqixiZ9gkPzZYmW/HOJPJiU+cwJY4b2ePCBCkn2yTMVhuqG1eVEz4stx+Ux3uo9EZXalpfDHXZhSQzgmxRUB+O8v3Y033cHupVaRn7hj0YDJM0O9Dnw4W/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hNVrUGULEbNTCQ6HmX5yaKTXPsgOhHV1Fo2OI16S2is=;
 b=eP77P/EdaaIdBmt0KIcVkQn0W8x835KoJulyZn5SopHveGNecZVioESq+8OyM+1YZAsEhc7YOYbAPaE7w9iETdtKMcIRwmgI/QBvVxsT6DyRU/QB+VqndGRL4zbdiLufE7G8KyvhASa/KzrSEetrxKj8s/Sw6PAPW2JlU6vMBAPvhj30Nf5dGMDxkH9fVfw9t4tFYHvH+6xAJE63Y+HQmu9SkhGPB5fLU2EFu8wEpkl1wbOxfQTQBHLOH/aqeLJMowXZdN4WoZORIJsZLbw+cYn+tQmbMrbpdk+N9H3Fljd5yXt3Zqsb7BSCvWWkQTO6jQqJPvA2EyZAw6X4bTKphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY5PR15MB4273.namprd15.prod.outlook.com (2603:10b6:a03:1fe::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Sat, 4 Sep
 2021 01:22:39 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Sat, 4 Sep 2021
 01:22:39 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
CC: "clg@kaod.org" <clg@kaod.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add Fuji machine type
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Add Fuji machine type
Thread-Index: AQHXoJybtLYSfmTqxk2vlpgecEnKmKuR/wyAgAEWbbQ=
Date: Sat, 4 Sep 2021 01:22:39 +0000
Message-ID: <6D76F82A-30B1-49C6-856A-C08D02B98268@fb.com>
References: <20210903082027.704397-1-pdel@fb.com>
 <20210903082027.704397-2-pdel@fb.com>
 <7dc54057-0303-6c68-041a-2bcc60e93e6a@amsat.org>
In-Reply-To: <7dc54057-0303-6c68-041a-2bcc60e93e6a@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e564a6a2-48a2-42e3-bab9-08d96f427c43
x-ms-traffictypediagnostic: BY5PR15MB4273:
x-microsoft-antispam-prvs: <BY5PR15MB42732FEA3AA2619FB9630503ACD09@BY5PR15MB4273.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +m3G/OUtQ8mQkFZQ/Eap83NrWnh9QMI1y9CmQn/dKB7ruGL4omxnlTaDayAxH3I0r95seaz11Q6AvjX/OjwNginCh7LNtX/OVPvKmzg/V/KnHtRLWZvh1NuLg9j+s9UKJQ7eJe5KQbnzjOfSLy5XMcn8Ted8pHmwlNPRZzIwpegpuYaUm3NESro8D7EQwXr/SaYhgcOkiaAtJgX7slglJbUfTz41dK78v4TkgsX3d2RzXH/FUn9qLK4QUycqL0++W4VXNMrX3Bv17tCdQ8iphfmkOTdTqHbjUkWjnkCu5ExGHgRS7Asv62ps7Opg51CbsIDs9JiemoLLB/651dpi/yf7FzBEwF2B83dAYQ1KM5IeMT6cByMT2zUmbqIZ7HOmhhf04pvOYIVUovDw/TpMVAakDsYY3vkCksoEZh7kgMwaMPdxH9F8ZhNsoti18vcrSQ0J16eYxq3nEo3Jyr93HPmllhR58DiE7hsKPAfHnfai1rAor/rjB178JY161nZgk46CNapUGDgYoBEO+OXjL4gbEimH52NYO9RMBF9EBBdfvjYn6cFmTn6PVQJKfAuJDLQvSgJIQlVJW2N8e5Yz65oE2BMk1L+JadQprVkkDOYhLQtJc325kxS0sCY05MsnPcGXrSnSdWcfa7C76aFi6hNhYG2vMk/VmWT8oOoD3FRd6tmjqLZ/Q5XgnVCS0NTjABveDjwfEjHmD7BGDm5jVFB83MmAgJftRdsWBjwb/7NJ6KaZC8Cxk07/XMCLCbadA0DVdgi1WlbfxjXrvb1qqc198KdEfdGbCR+BJ5ac1Ax1n1mmdMtWB8hZ1eECVdqczJAQe2kDMzVUKiocAzdnWl8N3wORRXofZgIp1kKDD+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6486002)(478600001)(966005)(26005)(316002)(6916009)(5660300002)(2906002)(2616005)(4326008)(54906003)(33656002)(8676002)(64756008)(76116006)(66476007)(66446008)(66556008)(36756003)(186003)(71200400001)(38070700005)(86362001)(38100700002)(6506007)(53546011)(8936002)(122000001)(6512007)(66946007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW5zZDNOV0s2Mk95akxpUFFZWFNpM2Y4Rk5vdllpdG02UnRORnpRTTcyc29z?=
 =?utf-8?B?TE9BMERhekZqZnA3UFEwTGhJcThRaER3MkdsQ0pCUldqeEFrY0ZGdXlLbnVG?=
 =?utf-8?B?M0lZaXpUNXJ3ODNmb2ZqNzM2OWwwclZOaVduTnV5RDVrTWhyZ2tpTjc3S2dy?=
 =?utf-8?B?Zit0SjVqWnVvMlhWTFN2TjgyU1FGSlBnZFVCNWpLRDZOdm8vYk1rWDQyV2dW?=
 =?utf-8?B?QjlqcURveWJqb1JMUUtSRFJIdFZZSnlsY0Jaa1hpSGRuQ014cFhQZ3EvbFFn?=
 =?utf-8?B?djNZRUpRQVFzM01nYmlxOENFdmdESkZLRnhNV2FXY1RPVkJyOGFDdlIxV0M0?=
 =?utf-8?B?VW05WWdoSHRoSVJDdkJ3dUo0NndDd2QvN2RuT0xEb0E1LzdVQUVvc2YzWllS?=
 =?utf-8?B?QWxvbDVHUHIwcWxZVFlEUWh6Ukx0RTJiVzhKZE85bUVmNno0Ky9TaGVESkN4?=
 =?utf-8?B?amRjRXJLRWIrdURXWEphbkJzN1cwb21FRHllTzZiaDZlZkY3cFJOUU53TmFm?=
 =?utf-8?B?TjFLbHZzT25DdHRBVWY4NGx3b2dIOHBhTGVxZk9rL25tT3FtS0Z4ODhsQnB4?=
 =?utf-8?B?ajVYa0J6VFVtS0hmOGQ1NmdhRSt4WjdVUlJJWVN4c0dyc0RTQnd3VWp3QVNQ?=
 =?utf-8?B?K3NuMVdBbVgzeSsxaDdrWG9qdkFGUXAxaVRFRm85M2FNMmRkbjBCQVNXSEYx?=
 =?utf-8?B?d3phOWdvVytFQkxlczQweXNRMUhvMEtCOGpDaTZ5VW1VSlFyQk5EMTAzYnly?=
 =?utf-8?B?cDRZdUpEdUcrSk42OVUzNFZPcHVhVzhoMktXZ1pxVTJlYXQ3M2Yxb1VDek5B?=
 =?utf-8?B?eFFDL0tQNDQvUnc4U3c1RDdjK0E0cGw0dnRicVBvRHR1dUVCWmVEcGFoR0pO?=
 =?utf-8?B?eEN5czQ5czVMMnl3RlVMTGNLRVpuV3hnRUxsazBHb01wVU42bjg2Mlk5dmh2?=
 =?utf-8?B?K1RWWTBLalZ0TS96OVN4VHdlVkE0Q0l5Lzk3TC9raTk5ZmgzSURKQW84ejJR?=
 =?utf-8?B?b3dvS2NmSThCKzdCdXlNNVNWeTYrTm9uUXlZQlRaVFlxMkppdTl2T3BrS0Vm?=
 =?utf-8?B?RlZ3T2dYNkkrNGI2SVNDdlFsZ3B0dFdyZFNqL3lPclBUUnNaa3NobGpvcGM4?=
 =?utf-8?B?MEN5R2tENEw1VXBZWUR3cmVCQm9sTloyaUFyZXR1Tmdpa2JJNnBoVkI2SUZ3?=
 =?utf-8?B?Q0VLRnBnalZIZkpxeCtZclBjQUVRWGxycXhoT0RPZjBjWVlKY1h3NC8rVVhS?=
 =?utf-8?B?ZDZOVVYvYkViK0ZEWXdMUnUzT2VVRUphWURyaEZKUHN2OGdEdzhKQTJ2K1JY?=
 =?utf-8?B?N2NOYlFwMDRvc3d2OUNjZlF6WklrUGVBQmdPS3VCejRkbW5wYkpnUVNGR0Z4?=
 =?utf-8?B?Tk1DMC9CWm9TYlRRQ2xLN3gxamFzK3lzcDltWE9rZjE4ekJCdUxUNjg2YTJl?=
 =?utf-8?B?bXN4Y2J4ZVVUbHN2R090M1JxNWplbDFSQllmTHczSWZ6RkdMcHFLY0luL2R5?=
 =?utf-8?B?QzUySkhRM1Exa0xCV0JPN3ArYURHK0RTNlluSmlkZmM4VkpOZWFWODArYXZP?=
 =?utf-8?B?bXRPSHdjRFdhY3NGUTlwNzYzNnpDTDZRdzNiRGw1ZVYxUStnTG5JaW5MNXEw?=
 =?utf-8?B?b1cwT1NLZUpsYUo5T296eE55VTdrU3VZbjhleS9DUTR0b0oyMWRCTGVhdGlQ?=
 =?utf-8?B?ai9ORVR6aFN6TW5kcms1ZnFodG1vNnkvd3JxdjdoNnhvN3J4N29aUklpWGVF?=
 =?utf-8?Q?dnrhLsczU+SOxJHmtikcBR+QwftALIPh0CACdbT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e564a6a2-48a2-42e3-bab9-08d96f427c43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2021 01:22:39.1414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3lYKd2R2h+KqyLwRJtMdHqwrFOlQF9vdid3n+g3kJdEYZhGsshyXgyl4LQZ12Gf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB4273
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 00U_2ry5Dl1_gs8rXFFS583cthUxhx2v
X-Proofpoint-GUID: 00U_2ry5Dl1_gs8rXFFS583cthUxhx2v
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_09:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109040007
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8881c65811=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

DQoNCj4gT24gU2VwIDMsIDIwMjEsIGF0IDg6MzAgQU0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxmNGJ1Z0BhbXNhdC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gOS8zLzIxIDEwOjIwIEFNLCBw
ZGVsQGZiLmNvbSB3cm90ZToNCj4+IEZyb206IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29t
Pg0KPj4gDQo+PiBUaGlzIGFkZHMgYSBuZXcgbWFjaGluZSB0eXBlICJmdWppLWJtYyIgYmFzZWQg
b24gdGhlIGZvbGxvd2luZyBkZXZpY2UgdHJlZToNCj4+IA0KPj4gaHR0cHM6Ly9naXRodWIuY29t
L3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMt
ZmFjZWJvb2stZnVqaS5kdHMNCj4+IA0KPj4gTW9zdCBvZiB0aGUgaTJjIGRldmljZXMgYXJlIG5v
dCB0aGVyZSwgdGhleSdyZSBhZGRlZCBoZXJlOg0KPj4gDQo+PiBodHRwczovL2dpdGh1Yi5jb20v
ZmFjZWJvb2svb3BlbmJtYy9ibG9iL2hlbGl1bS9tZXRhLWZhY2Vib29rL21ldGEtZnVqaS9yZWNp
cGVzLXV0aWxzL29wZW5ibWMtdXRpbHMvZmlsZXMvc2V0dXBfaTJjLnNoDQo+PiANCj4+IEkgdGVz
dGVkIHRoaXMgYnkgYnVpbGRpbmcgYSBGdWppIGltYWdlIGZyb20gRmFjZWJvb2sncyBPcGVuQk1D
IHJlcG8sDQo+PiBib290aW5nLCBhbmQgc3NoJ2luZyBmcm9tIGhvc3QtdG8tZ3Vlc3QuDQo+PiAN
Cj4+IGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYw0KPj4gY2Qg
b3BlbmJtYw0KPj4gLi9zeW5jX3lvY3RvLnNoDQo+PiBzb3VyY2Ugb3BlbmJtYy1pbml0LWJ1aWxk
LWVudiBmdWppIGJ1aWxkLWZ1amkNCj4+IGJpdGJha2UgZnVqaS1pbWFnZQ0KPj4gZGQgaWY9L2Rl
di96ZXJvIG9mPS90bXAvZnVqaS5tdGQgYnM9MU0gY291bnQ9MTI4DQo+PiBkZCBpZj0uL3RtcC9k
ZXBsb3kvaW1hZ2VzL2Z1amkvZmxhc2gtZnVqaSBvZj0vdG1wL2Z1amkubXRkIFwNCj4+ICAgIGJz
PTFrIGNvbnY9bm90cnVuYw0KPj4gDQo+PiBnaXQgY2xvbmUgLS1icmFuY2ggYXNwZWVkLW5leHQg
aHR0cHM6Ly9naXRodWIuY29tL3BldGVyZGVsZXZvcnlhcy9xZW11DQo+IA0KPiBQbGVhc2UgZG9u
J3QgYnVyeSB0aGlzIGluIHRoZSBtYWluc3RyZWFtIHJlcG9zaXRvcnksIHNpbmNlIHRoZQ0KPiBj
b21taXQgZGVzY3JpcHRpb24gbWlnaHQgYmUgcmVhZCBhbmQgdGVzdGVkIGR1cmluZyB5ZWFycy4N
Cg0KT2gsIHNvcnJ5IGFib3V0IHRoYXQsIHllYWggSeKAmW0gaGFwcHkgdG8gcmVtb3ZlIHRoaXMg
ZnJvbSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIChvciBtYXliZSBDZWRyaWMgY291bGQgcmVtb3Zl
IGl0PykuIERvIHlvdSBtZWFuIHRoZSB3aG9sZSB0ZXN0aW5nIHNlY3Rpb24gKGNsb25pbmcgT3Bl
bkJNQy9ldGMpLCBvciBqdXN0IHRoZSBsaW5rIHRvIG15IHJlcG8gYnJhbmNoPyBFaXRoZXIgd2F5
LCBmZWVsIGZyZWUgdG8gcmVtb3ZlIGl0LCBvciBjaGFuZ2UgaXQgdG8gd2hhdGV2ZXIgc3Vic2V0
IG1ha2VzIHNlbnNlLg0KDQo+IA0KPj4gY2QgcWVtdQ0KPj4gLi9jb25maWd1cmUgLS10YXJnZXQt
bGlzdD1hcm0tc29mdG1tdSAtLWRpc2FibGUtdm5jDQo+PiBtYWtlIC1qICQobnByb2MpDQo+PiAu
L2J1aWxkL2FybS1zb2Z0bW11L3FlbXUtc3lzdGVtLWFybSBcDQo+PiAgICAtbWFjaGluZSBmdWpp
LWJtYyBcDQo+PiAgICAtZHJpdmUgZmlsZT0vdG1wL2Z1amkubXRkLGZvcm1hdD1yYXcsaWY9bXRk
IFwNCj4+ICAgIC1zZXJpYWwgc3RkaW8gXA0KPj4gICAgLW5pYyB1c2VyLGhvc3Rmd2Q9OjoyMjIy
LToyMg0KPj4gc3NocGFzcyAtcCAwcGVuQm1jIHNzaCByb290QGxvY2FsaG9zdCAtcCAyMjIyDQo+
PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4g
LS0tDQo+PiBody9hcm0vYXNwZWVkLmMgfCAxMTIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMo
KykNCg==


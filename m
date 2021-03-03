Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9A32B896
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:25:29 +0100 (CET)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSRM-0003Xx-Ih
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHSQH-00033M-Pb
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:24:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHSQE-0003Tq-4Q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:24:20 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123EK6Fu040106;
 Wed, 3 Mar 2021 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=AK4Ztf6CHQa8HvCaIXcbtTZuQSppaGdN6IAKj/bKQrw=;
 b=Ve2ckb77frE2VgeVlwEjWH7G7Q9F8MfeLL/iNMbRvl1K9ZYsw7CBJJsqNd/HsOaxr6Uk
 UrkEY2Yh9CsDrgpKG9+RPjAGNyN8+pg6Odnh0VAfGsSdnZv49J4KEk2j3y7LtNxzSAGp
 Fkid83fBLuTzNcjsUEyaXexi3UIOsPHoaX/4ArtCquKO8aetOUjeyGCo4bkWh7Xzl1JC
 Yx285y2F5ngxpz3kYmt7HEaSCAUFasaekKl37KKdXcez4SqZBLcx3B5Zopr4aD4/oVG7
 jqkCySa9C9v7f81OUnjmiPRTc/mhRAt8CbhHDdi5ir9j0nSXQMikodnOIkIhiZ15iy6C xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 371hhc4xrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 14:24:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123EL38G030411;
 Wed, 3 Mar 2021 14:24:06 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by aserp3030.oracle.com with ESMTP id 36yynqm5ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 14:24:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmQIV/ACKGwIP3C1S48WRVljsrchco5QpInBCpl7YMnZZjNOl7v2V960IZTUiIdJeFgx97aD/Kqj86tpfh9CYjC/9zA8GNsohl0FQqWwUuccqQkwYOVC/kxnYb7Y8VVeepG7a1tRPMdE7aZT4gu033rZDyi8J13WYocK6rC9tw0Cdjz69kznBy7rAAM0zCKUJaujNZyrcM8CAowfWeuw0aC1Zv4KpCXeDnhO6ydmMbNv5C3lsyTGzrOlpiGXlXhJAdHmzimC1sg1/6Mue1aUp6hpiqixAlxpJ/f0mz6iXS0hx3Vmnz3jjlmG2O56wYFVcS1Mq2K0vCtd5plGBTy9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK4Ztf6CHQa8HvCaIXcbtTZuQSppaGdN6IAKj/bKQrw=;
 b=PqO4gPwjMMOcnFNwD5mp5EV/SnQ8+Jo/kn667Uaw5SfjMofixsfzh0ygUgI9K6TQbpvUUT+ziwszxMgckagXNk/bHiVMj4+/DCY2zEx9+i36AwT1qqGABHyRSg00xB6jsXtGf+CqjWHqAxMOon7L5ltAaTq8HgE5kTjKaw5lODVNcXBZNa6/fPHJMvSpDZWFigUVl6WusOhm9I6vHrM4pxpt9xbE8q2IpXbapHGf2MAT1uhuLocX3KqPbjH2r1iI89hlKcINNdk92BoMAgkzA/0m5APZC2k4KRboNHN3IAlhUtXTXWt1to8z0J+L+ahhJRWl+5Jiz64f2BTlAaJbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK4Ztf6CHQa8HvCaIXcbtTZuQSppaGdN6IAKj/bKQrw=;
 b=NZnoRQJ7z42yuftFb7OI/K9ZwlYY88ykEd8JwX30kW/pPoyjD/O7CcDLYhIknXEyGDnUvuNzUASuzPm+RfrW2pJnwHd+GTIF5yt07UpjMj9W79UqmD+t+FniIgxdnRZbDgjh2HYPrtEFJczkhdEz0F1WbeLD2RIIsJM0HHn0Pe4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4208.namprd10.prod.outlook.com (2603:10b6:208:1d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 14:24:04 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471%6]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 14:24:04 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Topic: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Index: AQHXD/wRtkqMtsSwEEuAanyZjyyT1apyDPUAgABEy4A=
Date: Wed, 3 Mar 2021 14:24:04 +0000
Message-ID: <245D5971-0F34-42BB-9C84-4039BEE255E1@oracle.com>
References: <20210303070639.1430-1-yuzenghui@huawei.com>
 <YD9iTgCNgrsbzWfx@redhat.com>
In-Reply-To: <YD9iTgCNgrsbzWfx@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:9dd:70b4:51fd:d8c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e9f44b9-7725-4e77-b8cf-08d8de4fff98
x-ms-traffictypediagnostic: MN2PR10MB4208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB4208E568C6B132925F911F1B90989@MN2PR10MB4208.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QctL4DHP4YrIErC4e+O0OQVsp2iYK6F4IG0byGIQLprVcoGXFtNKGC2ZKdS9QlLu83Z52GUFxQprTEoprQbGdVl0jzR5UE0ed3ct8eD+E1m8oP2L4W97EBWCAMWMhIHIVaYczAAsotdzPnel+su/o8jZrJO7lsQVm+BOasaxTOUmZNsXubQThmSBiOuGHf8CHPJ80VQaUW19xXSJok27wk34zBKc1lmbJ7iO9hMk71kayWB/duflc5NIrLtF5HuRscNWpAVRSUExihEANPSApcvhWhZs6A0wb3cQPvZTrX7Ca1c5cbJ5+6pgY7+VHJwJ2zCAfzjVUMH2QYRj7dwakLQMTFySJbAyBw4SlNvi42Yap5+6dNWKwJK92pyn9Jnq2wx0xIwRA98Wq2abM7BcTPLS4qVRNVDxx4cSb/ItghoSiCunk5P6XLrkstQRig0XGWTn79m2SKBdF9XL4c7HjYBQYRsUV5MSSzqFmKftG1lpk3gOA1l48TrqnrjBytEXc2NHXMj5V0UtMonqkfIFM/MwJbNKzaMQkJphapNQhbJj3Xhlof01P2Sev5a2eaHIozkABW/dmQcoxv5pqZIful5RRERsN3LrHoEuR+eMfFuNpSW8EEqGfwBuuXveC+CFIiT2Bqke6cv0+5ouLfY4cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(346002)(136003)(376002)(76116006)(91956017)(33656002)(36756003)(54906003)(66556008)(8676002)(478600001)(64756008)(66476007)(66946007)(66446008)(966005)(8936002)(2906002)(6486002)(71200400001)(6512007)(6916009)(6506007)(44832011)(316002)(5660300002)(2616005)(4326008)(53546011)(83380400001)(86362001)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NVd0ZWc0TkxZaFd3cmx5TTRLdVNaeC9ScWJPa21VQjNYMmw2N2djTUNjZytW?=
 =?utf-8?B?RDZ1VWpTdlA2L1p6VTJhaTVQQXFoQVRPSXROSlhHdmFOaU1xcVdJN1pRcDRO?=
 =?utf-8?B?dGFvYkVUOUt3clJ5Skl0WXp1R3YxUTNnM1pwdmJMMHpMdkQzL0VTU0FMWTdt?=
 =?utf-8?B?cUwyU2M5WE9FZnFkY2pDemFidTFZcjBTQ29jWkxNbkJKTkJCS3ROVmQ4cGdn?=
 =?utf-8?B?N1Z0ekpJeldMMlhLTkI3VTRBYWJMU2FOVjVuYUpJdUtpQklQVFV3eUFYclVG?=
 =?utf-8?B?Z05oWmxkS2srRDBqdzlleWZjREVDck9hczVHNTBuOGpOSGtqTVVVWkhsRDlp?=
 =?utf-8?B?dTkyNFFteEg0aGZrNHAvSC9TRWdQRjVEN2JsVHZ4dFh5OTg2bEdpeXFPS0Fl?=
 =?utf-8?B?OWVUdHJ4QjBtbUZ5QktjdG42YmZLKy93M1lpTVdSdUNmK1o4TWwwQkUxNG12?=
 =?utf-8?B?end1UE5JYkVQUUxYQnllb05SbjR6a3ZNWEhya2JHdUpFNEdjNDVydlRrSVJB?=
 =?utf-8?B?NGl6UzVDK0xyYisrUDVLUjhIdzQyVmdOTmU0YU0rUzFEYjhkYXVJeFk2Q3lQ?=
 =?utf-8?B?bVVrNnRzb0Z4QTJIZEJDemVxeFMyRlZmUWErN3hOWmNmR21OQ0FVbjFLNXVX?=
 =?utf-8?B?K1hsL3NiU01BS001T3I0MElTOW1sMzJDay8rb3l5SWxEcUlPUm5oMnBWQ1Z2?=
 =?utf-8?B?b282dTkxMHpock01cWtEQnVUNGZFNnlVOWVsWC82QllTbDQzamcrK1hiNkNG?=
 =?utf-8?B?WEJiOVJtRmJkc29aTjJXeHhSME1EWmRDcSsrSW9OWlNpTXVFSWdFTnBBL3d0?=
 =?utf-8?B?ZWZKRWRYVVZoYmtvYWdOYXl0NklqK2RtSFBuQTdFMnRKSVQvZ243MXdwWG9z?=
 =?utf-8?B?Ukk0RDVhRzF5UTYyKzFWbnZsZFhZeXVrUGRFbDAzSHhFazhVMS9tNEhJcllv?=
 =?utf-8?B?SUhpRC8vQjdCUXIxU0h3Y0c4OVhObmk0NVBqMWxrVExISUlOUjNRcjNCSnhR?=
 =?utf-8?B?SW1Nbm5SUFVESDJrWGUwM212RTFkRWxKNW91dTJhRE9Ea2RyTlMwVC9OWFZ3?=
 =?utf-8?B?cDhtRnRIRk0vSXk3ZlFMMTMxbzl3WWpEZm1VUlhkbVcxS1VzaTJxeVUxdGM2?=
 =?utf-8?B?OWFpWjd6QUMyN2pHcHJzT0NrUFU0aWZaRnY4SWZId054Sng4aGhnNTl5REdw?=
 =?utf-8?B?cEdHbndtY0h2RENmQ1lqQlU0SFY4aGxrdytIaUpzMyt1dkVkNWM5NWhoQjRN?=
 =?utf-8?B?cVduVDFxRkVMaDB2SCttRWFyQURwWGc4ZitmZTRjZms0WVU3OTVwYzM5Q3Mz?=
 =?utf-8?B?dFhOcWI1Y3ZBaEFMaHQ2VlMxYTB2aFcrZVdTK0VOR3VIb25FR1R3ZUJUMGZK?=
 =?utf-8?B?VjRMRnhuY05BUmppTDVYNEMzSkVkMmdPRFNjZDdXWkNpK3F3UTNEZjFqUnpG?=
 =?utf-8?B?cXhzSWR2SzV3ZWFYT3lkQkxibjQyWFBCc2ZjSVlwNzNQTTdUVlhEVTBtU1hR?=
 =?utf-8?B?WXB2eVIxQzNlNkk2R2JEaFZzM1ZDbVMxK3RUMVhKWUdjb2NyNmw0U3RuNW1E?=
 =?utf-8?B?bEJhNUlTeittSE5Pdk1pSjlZdU14SnVzZk5SdHBIZmpxM2JGN2R6eTIzNVps?=
 =?utf-8?B?K0U1MUJZOVBNWDJJUGtleW9yQ0VXT3pZYTZMV3pld1JTYXZrbkN6U01FU2lM?=
 =?utf-8?B?dXFhTUFSR2dyNXQ2bVJvTHBNTGpoMUlPRnlrRngwcWwrd1RlM001d3kvenNT?=
 =?utf-8?B?NzR6VEhPd2t6cVowUnZWT0lvRnZCM0N1TlhJaVhwWEw0ZTVNMzU2bENDNkpv?=
 =?utf-8?B?T3ZvWDAvMjc0TGJ0SWhFYk1aN1d1KzlOWGsxWEFlcGxGbVZyOHVFYTdOTjBa?=
 =?utf-8?Q?4v3qHq2o80Wmf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36EC786256C9404283D4BADE482719ED@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9f44b9-7725-4e77-b8cf-08d8de4fff98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 14:24:04.3317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvxGK+lOjH5koWzzfQ+S2tj793Yz36y7MirDfbHeKExe+/iRm23xQlUUVv9VzZIF0CYgh9xuCBPUpZibDRT1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4208
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030110
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030110
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 John Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDMsIDIwMjEsIGF0IDU6MTcgQU0sIERhbmllbCBQLiBCZXJyYW5nw6kgPGJl
cnJhbmdlQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBNYXIgMDMsIDIwMjEgYXQg
MDM6MDY6MzlQTSArMDgwMCwgWmVuZ2h1aSBZdSB3cm90ZToNCj4+IFF1b3RlIGRvY3MvZGV2ZWwv
c3R5bGUucnN0IChzZWN0aW9uICJBdXRvbWF0aWMgbWVtb3J5IGRlYWxsb2NhdGlvbiIpOg0KPj4g
DQo+PiAqIFZhcmlhYmxlcyBkZWNsYXJlZCB3aXRoIGdfYXV0byogTVVTVCBhbHdheXMgYmUgaW5p
dGlhbGl6ZWQsDQo+PiAgb3RoZXJ3aXNlIHRoZSBjbGVhbnVwIGZ1bmN0aW9uIHdpbGwgdXNlIHVu
aW5pdGlhbGl6ZWQgc3RhY2sgbWVtb3J5DQo+PiANCj4+IEluaXRpYWxpemUgQG5hbWUgcHJvcGVy
bHkgdG8gZ2V0IHJpZCBvZiB0aGUgY29tcGlsYXRpb24gZXJyb3I6DQo+PiANCj4+IC4uL2h3L3Jl
bW90ZS9wcm94eS5jOiBJbiBmdW5jdGlvbiAncGNpX3Byb3h5X2Rldl9yZWFsaXplJzoNCj4+IC91
c3IvaW5jbHVkZS9nbGliLTIuMC9nbGliL2dsaWItYXV0b2NsZWFudXBzLmg6Mjg6MzogZXJyb3I6
ICduYW1lJyBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJy
b3I9bWF5YmUtdW5pbml0aWFsaXplZF0NCj4+ICAgZ19mcmVlICgqcHApOw0KPj4gICBefn5+fn5+
fn5+fn4NCj4+IC4uL2h3L3JlbW90ZS9wcm94eS5jOjM1MDozMDogbm90ZTogJ25hbWUnIHdhcyBk
ZWNsYXJlZCBoZXJlDQo+PiAgICAgICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm5hbWU7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4NCj4gDQo+IFRoaXMgaXMgYSBiaXQgd2ll
cmQuICBUaGVyZSBzaG91bGQgb25seSBiZSByaXNrIG9mIHVuaW5pdGlhbGl6ZWQNCj4gdmFyaWFi
bGUgaWYgdGhlcmUgaXMgYSAncmV0dXJuJyBvciAnZ290bycgc3RhdGVtZW50IGJldHdlZW4gdGhl
DQo+IHZhcmlhYmxlIGRlY2xhcmF0aW9uIGFuZCBhbmQgaW5pdGlhbGl6YXRpb24sIHdoaWNoIGlz
IG5vdCB0aGUNCj4gY2FzZSBpbiBlaXRoZXIgc2NlbmFyaW8gaGVyZS4NCj4gDQo+IFdoYXQgT1Mg
ZGlzdHJvIGFuZCBjb21waWxlciArIHZlcnNpb24gYXJlIHlvdSBzZWVpbmcgdGhpcyB3aXRoID8N
Cj4gDQo+IEFsc28gd2Ugc2VlbSB0byBiZSBsYWNraW5nIGFueSBnaXRsYWIgQ0kgam9iIHRvIHRl
c3Qgd2l0aCB0aGUNCj4gbXVsdGlwcm9jZXNzIGZlYXR1cmUgZW5hYmxlZA0KDQpIaSBEYW5pZWws
DQoNCkNvbmNlcm5pbmcgZ2l0bGFiIENJLCBpdCBsb29rcyBsaWtlIHdlIGFyZSBydW5uaW5nIGFj
Y2VwdGFuY2UgdGVzdHMgYXMNCnBhcnQgb2YgaXQuICJhY2NlcHRhbmNlLXN5c3RlbS1mZWRvcmEi
IHJ1bnMgaXQgb24gZmVkb3JhLg0KDQpJcyBpdCBzdWZmaWNpZW50IHRvIGhhdmUgbXVsdGlwcm9j
ZXNzIHRlc3RzIGFzIHBhcnQgYWNjZXB0YW5jZSB0ZXN0cyBzdWl0ZQ0Kb3IgZG8geW91IHByZWZl
ciB0byBoYXZlIGEgc2VwYXJhdGUgdGVzdCBpbiBnaXRsYWIgQ0k/DQoNClRoYW5rIHlvdSENCuKA
lA0KSmFnDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IERhbmllbA0KPiAtLSANCj4gfDogaHR0cHM6Ly9i
ZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJl
cnJhbmdlIDp8DQo+IHw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAg
ICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KPiB8OiBodHRwczovL2VudGFuZ2xl
LXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2Ug
OnwNCj4gDQoNCg==


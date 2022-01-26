Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0D49C2EA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 06:06:38 +0100 (CET)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCaVx-0005lv-DC
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 00:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCaUb-0004hi-Iw
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:05:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCaUZ-0005IT-3b
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:05:13 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PMnKmu010038; 
 Wed, 26 Jan 2022 05:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=37K8Q93elXNlBwzgrgMsGA4teVJC7H/azB/te9hUwSM=;
 b=sIvvEjJrLGXbGEPTneds1PHOE6D7tXsHW0OCUqgAPRYp5q6FlPaPJHfLVn00S+Vd4WoC
 pal25pk9P/NyP6zHxKQXHhp9wptUcbi7qimC9DxSkAXgYOsVfOe3Zefbyxyl+tlnNONJ
 bkJ/9A3b1vmsTAmWcE88cr2YfoXq1ssB76Nybnj4gDgfyg/bxGIP7dERn1EmbJ8X7qDU
 vtYbbzQkWuaKrspYbmYT6dnPh8cUq7HkTyG3XicqF73k5QMWJ2cYKkMQ8YSc6iARKCTs
 o7sus1U5OFxbkChigrxou/LL6ummKQ3ETI8Km1M48J7pryicfOv542RpXkFhgxy8WTZp rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfn0bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 05:05:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20Q50mvx038735;
 Wed, 26 Jan 2022 05:05:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3020.oracle.com with ESMTP id 3dtax7rskb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 05:05:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckOsxi0DRu/HYEXMWyEsfuZEa3GIme42OPUz9yt62AjFT7ZxzSuYi+C9x4pG4TdGbQysWLQ1fblgwIWcinXbhvnZx9OxluU6jW/cpTkP7Amtd8EmSjyfuPQdUvP3/M4zuhCM60aBGq02YY22APoRZqk+LYMJVtH7wFRuWuHzVKPb9TbyXekd+UDByAq2tSMEPowfEAbPBdQbdBf4flq+QJ3TtlnTrZSs7bMqKSB+o5TityjNYJOIBXORiVwu2VvsSfzPpYN2KLE8Hmn/D8IWolGXkSmbvNloUAq5QDZ3reQB4QU06AI9+h0CNzQXTv88K47c0HbMnGzrHNCH0AUtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37K8Q93elXNlBwzgrgMsGA4teVJC7H/azB/te9hUwSM=;
 b=ClPocECLJrzDNIA3kOnHw4EfIoCAr/zik/YCkgXUe6OKagd5zVmPpHTyjnQ/gThVGuENnFKqt/KFilRfa5cbbVV4COdoGo4r36FekKELbhZD1+oxDePicbusIBj0PBUmGfrU02ZwwBfB83MQBLadQOrIU7o2mEoS2j1fNC0EeL+8UpuXkqTXEp76HhSCZ6fatl5YP3IfW0HV1bTzJVRTaXkkz8baXCidhVYwU59PL+ckuVMEKQvrTsmB2mzrEA2+sK8Y/gVazPDPyH1JyFG5Ipng/0EKDwzxi4OvDI8g930p9mrpJcmZDUdiLxWnuunRuEnKefIAezI56SrKruwnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37K8Q93elXNlBwzgrgMsGA4teVJC7H/azB/te9hUwSM=;
 b=wKS/WJDZSp6/LSbLpiyI+AMlrj3/NIgd2HvQGl3IA/MkEbdZCYJZVaB72sXdIXdaIpLzwI27uNM0umrOLhypg+d9c4tNNg4VchII9p8Fpkb4chcSXmE6YfZLRTtHTiSBapGZdlUieVUNWGuqtzM0NBi5d7R0GdPsbJS8JnSzDxE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3236.namprd10.prod.outlook.com (2603:10b6:408:c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 05:04:58 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 05:04:58 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 00/18] vfio-user server in QEMU
Thread-Topic: [PATCH v5 00/18] vfio-user server in QEMU
Thread-Index: AQHYDX1tLRTCMRJhE0OGkAi1448gB6xz7k+AgADbPIA=
Date: Wed, 26 Jan 2022 05:04:58 +0000
Message-ID: <19B94D9D-9D65-42BD-813F-1A8BB55AB07F@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <YfAekQfnC4VfSXtW@stefanha-x1.localdomain>
In-Reply-To: <YfAekQfnC4VfSXtW@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21840504-ed21-4d70-fd93-08d9e08966a7
x-ms-traffictypediagnostic: BN8PR10MB3236:EE_
x-microsoft-antispam-prvs: <BN8PR10MB32363F260413237EE18BD1E690209@BN8PR10MB3236.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RxFhhtA4EfoEt6WsnEfEwXRhqUuHnW53VR7StujV9PuqWkenZkvf1/+NQO8JZebSe2h72TozHl+BTlrzz3pVTHe67HU3QCx+irn+p1b2p1HdGkurbqvbEfuSnXMduTZiuJPlPqDEJB5W7jHhdg1o67Y3nW1RG7QqdymJupPSgxRpOgsnMDofeU78aVEeDvddLz7gBHmYEr11xvSoifG4XYxwM7Xuu8v+4f8Zr6ChZKV9pnh7fdk1YbCrbDNxXFPLVbtIvBlpxCAvdcZqSXRfvU3AExZ050LsxR4NPwV7GSO/ey+7SFvn1aAcHDcPWUFzV+86waz1wyKT0Aj/9bACdBBqW9ptstASUqxT3nsuEWfjoDLvRK47+PAn5cymf9+kKWeemSTsn176CUjftj/G47RdS9U4qyaMFXjzwMaUWnhFgl0aVrzXKWFDK9H31srlmnIE1iRknzEF5Gwsj/bI7IO8++LPXwR1G133/+o/vmFL3EA2r71TvP7FE5ZnzLRWKMgdFtMmPn0ejTzrHfRp8yJuQlVvfoPHOpY/0sqruV3Bs+ukQb/QB0qlK0fop2QXhnLohRAtDwvYcTvrmUKmf80x7USU9RjYsaycRT1VWQUisP4E4in+3hJEV2syopLMITx/3oUfx0Pn5fhaBo7fiqhwD8McZ0etmptnZTcoOvCSEVnVbVnJ2lUj/vD9J0cfaCSht9ZniCugN4Olwu357JJ/e7Lqdu+fOyKEqELGCpY1MAfbHjDWf6hy8d5er0nFuFb27SD4B2vtN0JC191hbPD78HTOzG0+kiBYVpcoPw8dFjgXFawmLX+olH9WVNsnJdPeEC/d+ZwsvKT4tpzFzZZFytktPgTnAti6nlhwJyk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(54906003)(316002)(6916009)(71200400001)(33656002)(6512007)(53546011)(508600001)(6506007)(38100700002)(186003)(7416002)(6486002)(36756003)(38070700005)(966005)(5660300002)(44832011)(86362001)(66476007)(66446008)(66946007)(2616005)(91956017)(76116006)(64756008)(2906002)(66556008)(8676002)(8936002)(4326008)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE1Ya0Q2eFpxTkl5REVCZTAzdjFKY1BxWDJKZ1pxY3QzQU1vQVAxVmdjZWR0?=
 =?utf-8?B?WTdWckdrdkNnR3ZDSUkvT3JpVjExa2tSaWtXUERRblgzbTFOTG95bmlCZU16?=
 =?utf-8?B?RGNtc2g5dUdwQU1yakl6c3owZkNrcHpTV084bndJRUQrbDNyTXRvbGoyU2Rq?=
 =?utf-8?B?Z0l3L3R1d0J4OVdyU2Ftbkl2Qk50Vk1QZUxEVUVRM3dTWmQxUHVKK3dMdEhn?=
 =?utf-8?B?dDBjRDdXS2d1MXRKYjVWemJBMjZmak1tcmNUR1crRGVxTnF2aXYxUkUyZEl1?=
 =?utf-8?B?U3VuVFFhK25TblZqZVpFOVlXb3FGT2tyVVpNVkVUT0xQL3pNdVYyVThjemdH?=
 =?utf-8?B?dnFKeHJOZUV6NXpJaTI4eHJkQjBhRlBGZndWNzBJYVhsbmo1bWhKUEU4d2hs?=
 =?utf-8?B?SGFpdzliSVZGZjJ2ZmtQVVMraTQwMHMra1FxaFJxWDNGb2h6Q09sc0Y3cU5Y?=
 =?utf-8?B?c3hubmRHbjNjRG1XWXVxT3BiVnpKTi9LUDRyUmQvdmhIWUt4bklLeFpSd2M5?=
 =?utf-8?B?Rm00dEl0aWlGb0NYSVEzbG1jazNsdXZlejVMT1RFSHJ2QUk0T2FJT2RHeGo1?=
 =?utf-8?B?bSt4K1VGcTltN1JHVHRBcmJ3Qm4xeFlMNHpsTzlsTGxWbTVSbSttNWN5MVZJ?=
 =?utf-8?B?VTBuWVlRUEpRZnUwZVFDd3BZWGpMZEx6ZWhCOHB2b0tjcTRNOC9KaFdtVWhZ?=
 =?utf-8?B?dVBpd2lKeXFxZ2N2RXpLUmlMRWVjcXY4aWNva2w3R1QwWTdOcktxeGwwZTM5?=
 =?utf-8?B?RXQzcEhsMWxLTnR0MHpTRDV2Q3JCT2dYdElIbTdMdWx1eXZMUStkZFdValk3?=
 =?utf-8?B?STVEY2JxRTl0OU5zakRwYmtzU09uUnhrY3l1MHNHQ0lXeG1pUUFxQjFHbFdE?=
 =?utf-8?B?YkFEUmNVZit5RnlTYWswUlpybzBraG1SdWVGNEJORHB5dkxNWXBFTjl6WVdY?=
 =?utf-8?B?Qi9NQkJxUjR4V2xGVkJxY1NJSFcvcG0razFTRllBcU51ZnJpNkFSU0w3Sm0w?=
 =?utf-8?B?UlNudkhiVmNCYVh3WFlnOWdjOWJNT3A4ZTBMeUtPbnQyUFV1dEE1Z0FCcDhn?=
 =?utf-8?B?Ky9IaWdJb29sTEM1VklmdW9Yb2NCZy9ZRmd1eVRKNzVsWGRZOUlqemZydDNN?=
 =?utf-8?B?cDdyMmtxaitvbmo0ZER6ajkrdGc3aWxGeWJWbEcxTHZjeWZDcDVJT0prWFVy?=
 =?utf-8?B?NDNTSXdFMXl3NXRoR2c0VFdiMzh0bG52a1RJZWpWUGExRHhQRjVZM2pxK3R2?=
 =?utf-8?B?Q09TSHhabWlPcG1sd2ZtNCszVVhBbkhvT0xRZ3JxQU9wRXFJZXRZK1VWL2I2?=
 =?utf-8?B?MDB4QmRPZFBPU0FzR2NKREV3eVMxdkhGTXlxOEJEQTZBTlFBaXlpbWpVUHRx?=
 =?utf-8?B?aHltcHA4ZWNQM0R2NCtCeHdNbmo2OGFTYkNrR0tzTTkzcWFLa1VLendiRCtr?=
 =?utf-8?B?UFd2VTZhbEs1MVJCV0N5MWFBL00wemtvdEZwTjN0QjFXTHZYZjBQTFlLcVVC?=
 =?utf-8?B?eW9kS1BoUnMrR3dsMWJDNHNuSnhDUHRPK053SldmTWlDNzg5Ykowd1lDamM5?=
 =?utf-8?B?dWdyOHpkdGJYNTRzNEJQUUhNRlNENWp0QnIrUDkyNkdFaFBwQkxRWEpnR2hU?=
 =?utf-8?B?a1MrNVhSZWF0Vnp6a1lOM2xSTm9DWWpYYVRkVCtML0VZY09PSjd1U2czb3dn?=
 =?utf-8?B?VUo3M01taFVNVWNycnZHNW0yalJNNCt5eFBobHNzSTgxUGxWTjR5YWdwM01u?=
 =?utf-8?B?WElIZndHQ25ubUR2WDY3YkdIdkxNc0tjN1JRdElOZy9DQk5UMUdWWTZSRzNk?=
 =?utf-8?B?RkYrOWZ5dFZxc1ZwTmdHWEg4dUxGenkyYzR6WHQybkJib2hrUE9yY1ZPRUdH?=
 =?utf-8?B?NmI2NDc4V0pUNXRmR2lxam84T05LMkhMVGxoQThtYnkzbDN6SlhxaDBsbGs1?=
 =?utf-8?B?KzQyN25LT0EwZjBUajAxY214Z3FONU81TzMvZ3pCVDhkTWFrTWRUWmVoUXIy?=
 =?utf-8?B?a3JJQ2lTeHFRSDU5Zi9iaTdoV0VIa1R4ZW5aY3gyUU10T1E4ZGtZT0NYSUUy?=
 =?utf-8?B?dVZxZ1pYdUsxeU5oeHJoUGo0M1pMVjJYVjFhOGE4OEsrR3Y1RGRzeEdlQnhv?=
 =?utf-8?B?aVpONkdHS2xmUy9kR0M2bUFiUU9OTlBvR0VHWjVOZVpSNVA0R2lYZ2JVRUVM?=
 =?utf-8?B?SS9MUjRUcXRpZ0hrWjR1TjN2U1VsWjZjTU0xa0IvZnFwT1FmWnA3dlhpaXNY?=
 =?utf-8?B?a3EwcS9xRUlOTEd3OWVrTk5RYlhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <676E83ABAD964F4FAF78098E29A1C950@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21840504-ed21-4d70-fd93-08d9e08966a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 05:04:58.5656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsO0F0Y+XWJCgVJ1SyfU2D5IzhcBB+RPlju47xOrrYNIse8iwLYfSxItA/bUYR92m40hcNkk/N/7bu9c2kRT4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3236
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260026
X-Proofpoint-GUID: NQH9w4xJlYM5rZMX8v_ePQMqZy7vD5TJ
X-Proofpoint-ORIG-GUID: NQH9w4xJlYM5rZMX8v_ePQMqZy7vD5TJ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCAxMTowMCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEphZywNCj4gVGhhbmtzIGZvciB0aGlz
IGxhdGVzdCByZXZpc2lvbi4gVGhlIGJpZ2dlc3Qgb3V0c3RhbmRpbmcgcXVlc3Rpb24gSSBoYXZl
DQo+IGlzIGFib3V0IHRoZSBpc29sYXRlZCBhZGRyZXNzIHNwYWNlcyBkZXNpZ24uDQoNClRoYW5r
IHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGUgcGF0Y2hlcywgU3RlZmFuIQ0K
DQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBuZWVkcyBhIFBDSUJ1cyB3aXRoIGl0cyBvd24gTWVt
b3J5IFNwYWNlLCBJL08gU3BhY2UsDQo+IGFuZCBpbnRlcnJ1cHRzLiBUaGF0IHdheSBhIHNpbmds
ZSBRRU1VIHByb2Nlc3MgY2FuIGhvc3QgdmZpby11c2VyDQo+IHNlcnZlcnMgdGhhdCBkaWZmZXJl
bnQgVk1zIGNvbm5lY3QgdG8uIFRoZXkgYWxsIG5lZWQgaXNvbGF0ZWQgYWRkcmVzcw0KPiBzcGFj
ZXMgc28gdGhhdCBtYXBwaW5nIGEgQkFSIGluIERldmljZSBBIGRvZXMgbm90IGNvbmZsaWN0IHdp
dGggbWFwcGluZw0KPiBhIEJBUiBpbiBEZXZpY2UgQi4NCj4gDQo+IFRoZSBjdXJyZW50IGFwcHJv
YWNoIGFkZHMgc3BlY2lhbCBjb2RlIHRvIGh3L3BjaS9wY2kuYyBzbyB0aGF0IGN1c3RvbQ0KPiBB
ZGRyZXNzU3BhY2UgY2FuIGJlIHNldCB1cC4gVGhlIGlzb2xhdGVkIFBDSUJ1cyBpcyBhbiBhdXRv
bWF0aWNhbGx5DQo+IGNyZWF0ZWQgUENJZSByb290IHBvcnQgdGhhdCdzIGEgY2hpbGQgb2YgdGhl
IG1hY2hpbmUncyBtYWluIFBDSSBidXMuIE9uDQo+IG9uZSBoYW5kIGl0J3MgbmVhdCBiZWNhdXNl
IFFFTVUncyBhc3N1bXB0aW9uIHRoYXQgdGhlcmUgaXMgb25seSBvbmUNCj4gcm9vdCBTeXNCdXMg
aXNuJ3QgdmlvbGF0ZWQuIE9uIHRoZSBvdGhlciBoYW5kIGl0IHNlZW1zIGxpa2UgYSBzcGVjaWFs
DQo+IGNhc2UgaGFjayBmb3IgUENJIGFuZCBJJ20gbm90IHN1cmUgaW4gd2hhdCBzZW5zZSB0aGVz
ZSBQQ0lCdXNzZXMgYXJlDQo+IHJlYWxseSBjaGlsZHJlbiBvZiB0aGUgbWFjaGluZSdzIG1haW4g
UENJIGJ1cyBzaW5jZSB0aGV5IGRvbid0IHNoYXJlIG9yDQo+IGludGVyYWN0IGluIGFueSB3YXku
DQoNCldlIGFyZSBkaXNjdXNzaW5nIHRoZSBhdXRvbWF0aWMgY3JlYXRpb24gcGFydCB5b3UganVz
dCBtZW50aW9uZWQgaW4NCnRoZSBmb2xsb3dpbmcgZW1haWw6DQpbUEFUQ0ggdjUgMDcvMThdIHZm
aW8tdXNlcjogc2V0IHFkZXYgYnVzIGNhbGxiYWNrcyBmb3IgcmVtb3RlIG1hY2hpbmUNCg0KSSBh
Z3JlZSB0aGF0IGF1dG9tYXRpYyBjcmVhdGlvbiBvZiBhIHBhcmVudCBidXMgaXMgbm90IGlkZWFs
IC0gd2UgY291bGQNCnNwZWNpZnkgdGhlIHBhcmVudCBidXMgYXMgYSBzZXBhcmF0ZSBvcHRpb24g
aW4gdGhlIGNvbW1hbmQtbGluZSBvcg0KUU1QLiBUaGlzIGNoYW5nZSB3b3VsZCBhdm9pZCBtb2Rp
ZmljYXRpb24gdG8gaHcvcGNpL3BjaS5jIC0gdGhlIG5ldw0KUENJIGJ1cyBjb3VsZCBiZSBjcmVh
dGVkIGlucGxhY2UgZHVyaW5nIGRldmljZSBjcmVhdGlvbi9ob3RwbHVnLg0KDQpUaGUgZm9sbG93
aW5nIGltYWdlIGdpdmVzIGFuIGlkZWEgb2YgdGhlIGJ1cy9kZXZpY2UgdG9wb2xvZ3kgaW4gdGhl
IHJlbW90ZQ0KbWFjaGluZSwgYXMgaW1wbGVtZW50ZWQgaW4gdGhlIGN1cnJlbnQgc2VyaWVzLiBF
YWNoIHNlY29uZGFyeSBidXMgYW5kDQppdHMgY2hpbGRyZW4gaGF2ZSBpc29sYXRlZCBtZW1vcnkg
YW5kIElPIHNwYWNlcy4NCmh0dHBzOi8vZ2l0bGFiLmNvbS9qcmFtYW4vcWVtdS8tL2NvbW1pdC8y
ZTJlYmYwMDQ4OTQwNzVhZDgwNDQ3MzliMGIxNmNlODc1MTE0YzRjDQoNCj4gDQo+IEFub3RoZXIg
YXBwcm9hY2ggdGhhdCBjYW1lIHRvIG1pbmQgaXMgdG8gYWxsb3cgbXVsdGlwbGUgcm9vdCBTeXNC
dXNzZXMuDQo+IEVhY2ggdmZpby11c2VyIHNlcnZlciB3b3VsZCBuZWVkIGl0cyBvd24gU3lzQnVz
IGFuZCBwdXQgYSByZWd1bGFyIFBDSQ0KPiBob3N0IG9udG8gdGhhdCBpc29sYXRlZCBTeXNCdXMg
d2l0aG91dCBtb2RpZnlpbmcgaHcvcGNpL3BjaS5jIHdpdGggYQ0KPiBzcGVjaWFsIGNhc2UuIFRo
ZSBkb3duc2lkZSB0byB0aGlzIGlzIHRoYXQgdmlvbGF0aW5nIHRoZSBzaW5nbGUgU3lzQnVzDQo+
IGFzc3VtcHRpb24gcHJvYmFibHkgYnJlYWtzIG1vbml0b3IgY29tbWFuZHMgdGhhdCByZWx5IG9u
DQo+IHFkZXZfZmluZF9yZWN1cnNpdmUoKSBhbmQgZnJpZW5kcy4gSXQgc2VlbXMgY2xlYW5lciB0
aGFuIGFkZGluZyBpc29sYXRlZA0KPiBhZGRyZXNzIHNwYWNlcyB0byBQQ0kgc3BlY2lmaWNhbGx5
LCBidXQgYWxzbyByYWlzZXMgdGhlIHF1ZXN0aW9uIGlmDQo+IG11bHRpcGxlIG1hY2hpbmUgaW5z
dGFuY2VzIGFyZSBuZWVkZWQgKHdoaWNoIHdvdWxkIHJhaXNlIGV2ZW4gbW9yZQ0KPiBxdWVzdGlv
bnMpLg0KDQpCYXNlZCBvbiBmdXJ0aGVyIGRpc2N1c3Npb24gd2l0aCBTdGVmYW4sIEkgZ290IHNv
bWUgY2xhcml0eS4gV2UgY291bGQgY29uc2lkZXIgb25lDQptb3JlIG9wdGlvbiBhcyB3ZWxsIC0g
c29tZXdoZXJlIGluLWJldHdlZW4gbXVsdGlwbGUgcm9vdCBTeXNCdXNlcyBhbmQgdGhlIHRvcG9s
b2d5DQpkaXNjdXNzZWQgYWJvdmUgKHdpdGggc2Vjb25kYXJ5IFBDSSBidXNlcykuIFdlIGNvdWxk
IGltcGxlbWVudCBhDQpUWVBFX1NZU19CVVNfREVWSUNFIHRoYXQgY3JlYXRlcyBhIHJvb3QgUENJ
IGJ1cyB3aXRoIGlzb2xhdGVkIG1lbW9yeSByYW5nZXMuDQpTb21ldGhpbmcgYWxvbmcgdGhlIGxp
bmVzIGluIHRoZSBmb2xsb3dpbmcgZGlhZ3JhbToNCmh0dHBzOi8vZ2l0bGFiLmNvbS9qcmFtYW4v
cWVtdS8tL2NvbW1pdC84MWY2YTk5ODI3OGEyYTc5NWJlMGRiN2FjZGViMWNhYTJkNjc0NGZiDQoN
CkFuIGV4YW1wbGUgc2V0IG9mIFFNUCBjb21tYW5kcyB0byBhdHRhY2ggUENJIGRldmljZXMgd291
bGQgYmU6DQpkZXZpY2VfYWRkIHBjaS1yb290LWJ1cyxpZD1yYjENCmRldmljZV9hZGQgPGRyaXZl
cj4saWQ9bXlkZXYsYnVzPXJiMQ0Kb2JqZWN0LWFkZCB4LXZmaW8tdXNlci1zZXJ2ZXIsZGV2aWNl
PW15ZGV2DQoNCndoZXJlIOKAmHBjaS1yb290LWJ1c+KAmSBpcyBhIFRZUEVfU1lTX0JVU19ERVZJ
Q0UgdGhhdCBjcmVhdGVzIGl0cyBvd24gcm9vdCBQQ0kgYnVzLg0KDQpJ4oCZbSB2ZXJ5IHNvcnJ5
IGlmIHRoZSBhYm92ZSB0d28gd2ViIGxpbmtzIGRpc3R1cmIgeW91ciByZXZpZXcgd29ya2Zsb3cu
DQoNCj4gDQo+IEkgd2FudGVkIHRvIHJhaXNlIHRoaXMgdG8gc2VlIGlmIFBldGVyLCBLZXZpbiwg
TWljaGFlbCwgYW5kIG90aGVycyBhcmUNCj4gaGFwcHkgd2l0aCB0aGUgY3VycmVudCBhcHByb2Fj
aCBvciBoYXZlIGlkZWFzIGZvciBhIGNsZWFuIHNvbHV0aW9uLg0KDQpMb29raW5nIGZvcndhcmQg
dG8geW91ciBjb21tZW50cy4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPiBTdGVmYW4N
Cg0K


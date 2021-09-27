Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF11418DA6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 04:26:56 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUgM3-00029j-Nt
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 22:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=490467f2f7=xuzhou.cheng@windriver.com>)
 id 1mUgKq-0001DR-TU; Sun, 26 Sep 2021 22:25:40 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:6340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=490467f2f7=xuzhou.cheng@windriver.com>)
 id 1mUgKl-0001cz-0b; Sun, 26 Sep 2021 22:25:38 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R2Loe5015454; 
 Mon, 27 Sep 2021 02:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mj0hbFukcIwLuYeSu5TD8gOm41HPHqvcKlDzNQzdICs=;
 b=HrUt6+rdT2liZ311OD/FQlflo+oUAUEL0O/pwrSuazy3DPKEuu+ExFZ/mgr7znOSZa5A
 iZrR3Puu/87GavWktMmhb8VGeeRGQoJt4NijD6uC9YiN2+WT1cOvS2rZ5cKifASoL9DG
 4qxDf6gvVuoa4mVj7Z9nVsWZFzm26ZPeCc+D7lHd9v/iiP8OfZUgDI+tgdgu3/CAPYdM
 7wmXeh96FpVljj479U3ufnfoE5+OfibMH3dzHHWYOAx0GmWYYYH4uafPGQFOFj4vDPWp
 G5pPqQ/lRV+07k+2u0ddTBmM/VkVZsHyuMXBFW8NuKS9ZBZpRUt/z16PldfFF9z9Jaxz 1A== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by mx0a-0064b401.pphosted.com with ESMTP id 3bahp4rf5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 02:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly82oFU5UcaXOKUF4vmcwFVdwZr4Zva6ghVHz9inRRXkbZ6Tc8GTOHuzG1rl9fK2ErMX28k6ETaTudSEB5q3yQ6nWb2XxEQQBU7clBbkPGIgQ0ZfZ5WuVw2cFosafE1ud+rH3CkWu5vGE+QsEnIvABl9ipyfRdQnSXUD7pWwpBYXbBx0YVgGv82TjbRFC5Y1UNb6rMnRjBBOyqEWngkM1qv4eyMhXspGATHJb1Wtn8bJEZVAaUqI911F61wmlF2fTzu5zIMmlFrk7GKaptW4XzL6HjeHAafRoyMDTBucXQRVYSld3QYXoLGmETEQB10+slkdPIamjnwD6zRK8U5lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=mj0hbFukcIwLuYeSu5TD8gOm41HPHqvcKlDzNQzdICs=;
 b=VquVyaBigwlzEBeMUn88HRfn0Lp6zgEg6WMKu0R/+lvnmw9Pu4rssppeegYlehGuKQ4g5TLf4OLDbkblIgeC57lBHYx5vRbNg+0wem0x6O+zkpq3Rahgx+VGhOOHuiI6RCCKzhpRloLc61OXM4suP/a6wc+DUOYkpaR58lpWc+HcrOH1w16ErOQYM5DNdJ/y3fwyXMYq0k/lkCwi6wFIx58czrHAr+txefEC+6oE8gsS4D4FeKAi49TyDakpxwtvJy9SgvabcnLz0it2awQeIlJrSkvHlRDYrdMbv2hwE1jnY12DdWhulZ3QjaJUWUclTPjpgBUlasmAtYgHtEHuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 by PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 02:25:17 +0000
Received: from PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40]) by PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 02:25:17 +0000
From: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Xuzhou
 Cheng <xchengl.cn@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Thread-Topic: [PATCH] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Thread-Index: AQHXsoJiultAoKS3u02Yg3x4QwMK3qu17oEAgAE5RZA=
Date: Mon, 27 Sep 2021 02:25:17 +0000
Message-ID: <PH0PR11MB52050A201057E8C27BCC96E397A79@PH0PR11MB5205.namprd11.prod.outlook.com>
References: <20210926025651.29456-1-xchengl.cn@gmail.com>
 <fa80416b-6382-e865-89a3-9289afdd75c8@amsat.org>
In-Reply-To: <fa80416b-6382-e865-89a3-9289afdd75c8@amsat.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af85db17-e5e8-4ea3-acc6-08d9815e0bcb
x-ms-traffictypediagnostic: PH0PR11MB5079:
x-microsoft-antispam-prvs: <PH0PR11MB5079875D093A188398FC02A697A79@PH0PR11MB5079.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aJ4/xQjkCWo7t9PZrMTBXhCcKP3sMCJTm0IAqOGFczqdT9aiCKbjjF886EGLUBBdfX2A1DnX+jbPJfAHIkn3GyLS31djXxbPffS41vAzW0v7khezVipaQj+GajmxJ3n9+LHnDa9d5/N4C2qIbbWu+g7P93y1rE0aoQrJrgk2YwLfz7WdHDlAPKRK6oACOukUKIuK5O67mkV8CYEOpvrNBdcTBibRpQM3/wg6rKz4EmT/PJPdWa6HANDAnQYszTYvsgfN83rrw6ifkN6gsvqwvw2aDGAt+zw1PaphqD1xSIZ1dQ/phxZYXQ3C/wBfErB06o53N5LFKgXkxMabkLAwAtXhOPc91VE68+RhSBss4Q77wjMal3v6Ksksp+okysN+3pLhgbUh9RmsbCR5yFGjnd/HTGjdA6Xf9ptAju/Zl8r5q37HeSdxLIB2ZAXXxtFhde6guR8cf+7idBliO5mtsgELowWn8FGLBUGCQo9e/U2Uy4bU4I4aW2jAz0a77bx9IpneabDH+jgk+Mp9z92CTfuk89LWdDIZ+ab/CHkSdQrCM2dEWqQIrRd2/STmJfayI9BbTE8LbFukXVEZwEVtwpoKrzTOjpXUnkjVzHPzgivdTwzW+X3OK/oyCHBdV8RyphFiW7LgL4Otce4rAoBccBCEiUDsxd90j9J+qq0u+GIbk1nrutSii0WLWvhq9K0pAXywSjwXHn1DIjDC01dVwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(8676002)(83380400001)(5660300002)(186003)(71200400001)(64756008)(53546011)(2906002)(7696005)(66946007)(66556008)(66476007)(55016002)(9686003)(66446008)(6506007)(26005)(316002)(508600001)(38100700002)(54906003)(52536014)(86362001)(122000001)(76116006)(110136005)(4326008)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VERtMEt0NUpTbWZMV1ptazFIdjdiQWZLcUxWeWdGS1RQMzFpZHNlTlhpSzhD?=
 =?utf-8?B?K3BxVjNWYlk5RmJBRllWbk1hRGl2SHRnMUszOGdkeGZweFJleDU5RHFRM2Vq?=
 =?utf-8?B?clU3RFRWSDF2SC9tSDc2dmFLalJqMHp6OXBUejNxREM5TnBxNk1EVnE4ZFkv?=
 =?utf-8?B?QncwTDNPcmlQR3pDQjB6NEpqeUZaUythKzJqUXZQOVJyOXcxTDRKNUNWQ3dn?=
 =?utf-8?B?K1ZBaDRwTjZ2Mk40QW5WMktkeVRFdEQwOWhYVkd2Q0FiN0RQSGVIOFlISFgx?=
 =?utf-8?B?VG9obEExSHJybEEwTmVCci90OE9qTm9CVWRldlUzd0VTandJNmlIUWs1V05i?=
 =?utf-8?B?M2lCUTUwRHQ5akxsbHcwdHdUWkF4OWhvUDM4YkJlUCszODhEV2xhQ0R5Mytv?=
 =?utf-8?B?RzFLU0c5UVRQTU4rRTFNNnhuNklpeUNFMXBjZG5NSzB0MWZrVUVKK1hvd2Vn?=
 =?utf-8?B?YlNHZlhXWGpJQWlJcXJBcU1ieENqejROWnc0V0xvSGNreTFWd3JlMDRzanRY?=
 =?utf-8?B?SkIxd1RxTHVuTnkrOTlXVGZkWXVRWUh2MHo5SkozSEs2akhJNnV1NGFBaVpl?=
 =?utf-8?B?N0lCdEcwWEN6UDJjNUZ6WFBNdU1PSDA4VndNREJ0dkU3amFVNFc0TnowMndX?=
 =?utf-8?B?MnVJUjZabWNzZVdacVN2dWlVRXRkaWNaanFvY2Q0R3pMV1d0OFFjWnV3NXRC?=
 =?utf-8?B?bzFsRUh6MHR5N3NmRTBQUkZTbVgyK2RqdkI3Q0UwR2hzaEJGTDRWTG1zS1ZR?=
 =?utf-8?B?VzltUDNNQUc3dEcraWNVNSs5OEJveG5YeGlld2h2L2wyUi9yV3UvdFE4MlM3?=
 =?utf-8?B?S3NUUlFqeGZMc1o3WHJ5OWoxVjQxL3dvMTJqS0QvdVpTUkJrNnhmUlJNU0tK?=
 =?utf-8?B?ay9Sdm1vQWZDRWNocGZyTHRLY1liRGVaaTlkNnFBQVpPTXZkQ1p1SkdsK1N2?=
 =?utf-8?B?SnJxSXhCRklLZXRNK3JSVm9lWFJ2VjFQb3M5aDI1K3g5RFdJcDlwOHJSa29l?=
 =?utf-8?B?eFdzTnU4Y1diNXJGTTNpd3lOcUlERExEZ1c0MC9ibmgvWUtYYmw4SlVmTjcw?=
 =?utf-8?B?MFdtaTh2ck9pODdYWUdTdU5vOWFCYm5VWS9adGJTOERiM0pMOFFyN1FYOFpn?=
 =?utf-8?B?NWttY3BMVXNsQTlFbTZEbG9HcXRvVUIybnlVYTZ3SjN4bURtYThaRUQzOEtx?=
 =?utf-8?B?dGN3Ym93TjlDOXpJYmNLYTNLaXdxbzBuY1NRU2FVYUhRNnp5NHVPVzJtOStr?=
 =?utf-8?B?TjRZcDhncUR0OW85Z0NCdzdXU0tPcFNZMENkdHRTUll2WS83djg3V1FUS0xM?=
 =?utf-8?B?bGJHY3JlTmRiU24zOE5DVWxRcFBzTzk4TnhTcEZ4RzJVcFRIMFFXUjVLcys5?=
 =?utf-8?B?Wi81UkczMnhWcUNHQlMwS3JnTHIreCtsSURRUVpkdmc0VFNHSWZjK3k2Y0pJ?=
 =?utf-8?B?aVBCV3hLeGhOQ09TcWdnRHJ3VEZFSWxCY3N1NGdvdU12dVZ6U3djblpxZTQ1?=
 =?utf-8?B?dFVXckZ6UzNIS1BiL3hQMFBpakV5SUI5RDZqT1FMdlU3ZU94WUJRaG9JNndP?=
 =?utf-8?B?a0c3c3oxUUNyejFJcXY1VGtGS0RzcXhqaUx6dEpSMjkzYWVNb2V1NG5lWGZY?=
 =?utf-8?B?MWxpT0lGeFp1dmZTVmd3K2tKalh0M0FCRjhEOFlBUWFHWExqclowekNaSHhl?=
 =?utf-8?B?K2gwK2NFNFFLMEFVZWorMnhuSXNEY0doTUllTldRSUdZZDlkMTdlSGJkalVN?=
 =?utf-8?Q?I9Y9zoIPQV/pVxdqRA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af85db17-e5e8-4ea3-acc6-08d9815e0bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 02:25:17.3157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOpa6T92Rhb0OfiTsKP74yXr/TgURG1vEyeCuAyyUvEnT68Hz8qJxfB2MwZoOCwZe0JPjTpv+BKF1cMWIIa8ysyUjUkLHLnwt+W51KQNA5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5079
X-Proofpoint-GUID: q272wU9AMJvuwzPvyYm8_0MJAW-b7-_T
X-Proofpoint-ORIG-GUID: q272wU9AMJvuwzPvyYm8_0MJAW-b7-_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-26_09,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270013
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=490467f2f7=xuzhou.cheng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "groeck7@gmail.com" <groeck7@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBPbiA5LzI2LzIxIDA0OjU2LCBYdXpob3UgQ2hlbmcgd3JvdGU6DQo+ID4gRnJvbTogWHV6aG91
IENoZW5nIDx4dXpob3UuY2hlbmdAd2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IFRoZSBMaW51eCBz
cGktaW14IGRyaXZlciBkb2VzIG5vdCB3b3JrIG9uIFFFTVUuIFRoZSByZWFzb24gaXMgdGhhdCB0
aGUgDQo+ID4gc3RhdGUgb2YgbTI1cDgwIGxvb3BzIGluIFNUQVRFX1JFQURJTkdfREFUQSBzdGF0
ZSBhZnRlciByZWNlaXZpbmcgUkRTUiANCj4gPiBjb21tYW5kLCB0aGUgbmV3IGNvbW1hbmQgaXMg
aWdub3JlZC4gQmVmb3JlIHNlbmRpbmcgYSBuZXcgY29tbWFuZCwgQ1MgDQo+ID4gbGluZSBzaG91
bGQgYmUgcHVsbGVkIGhpZ2ggdG8gbWFrZSB0aGUgc3RhdGUgb2YgbTI1cDgwIGJhY2sgdG8gSURM
RS4NCj4gPg0KPiA+IEN1cnJlbnRseSB0aGUgU1BJIGZsYXNoIENTIGxpbmUgaXMgY29ubmVjdGVk
IHRvIHRoZSBTUEkgY29udHJvbGxlciwgDQo+ID4gYnV0IG9uIHRoZSByZWFsIGJvYXJkLCBpdCdz
IGNvbm5lY3RlZCB0byBHUElPM18xOS4NCj4gDQo+IE1heWJlIHdvcnRoIG1lbnRpb25pbmcgdGhp
cyBtYXRjaGVzIHRoZSBib2FyZCBkdHM6DQo+IA0KPiBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRs
LXNhYnJlbGl0ZS5kdHNpOg0KPiANCj4gMzEwICZlY3NwaTEgew0KPiAzMTEgICAgIGNzLWdwaW9z
ID0gPCZncGlvMyAxOSBHUElPX0FDVElWRV9MT1c+Ow0KPiAzMTIgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+IDMxMyAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2Vjc3BpMT47DQo+
IDMxNCAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiAzMTUNCj4gMzE2ICAgICBmbGFzaDogbTI1cDgw
QDAgew0KPiAzMTcgICAgICAgICBjb21wYXRpYmxlID0gInNzdCxzc3QyNXZmMDE2YiIsICJqZWRl
YyxzcGktbm9yIjsNCj4gMzE4ICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDA+
Ow0KPiAzMTkgICAgICAgICByZWcgPSA8MD47DQo+IDMyMCAgICAgfTsNCj4gMzIxIH07DQoNClll
cywgaXQncyB3b3J0aHkuIEknbGwgc2VuZCB2MiB0byB1cGRhdGUgY29tbWl0IG1lc3NhZ2UuDQoN
Cj4gPiBTaG91bGQgY29ubmVjdCB0aGUgU1NJX0dQSU9fQ1MgdG8gR1BJTzNfMTkgd2hlbiBhZGRp
bmcgYSBzcGktbm9yIHRvDQo+ID4gc3BpMSBvbiBzYWJyZWxpdGUgbWFjaGluZS4NCj4gPg0KPiA+
IFZlcmlmaWVkIHRoaXMgcGF0Y2ggb24gTGludXggdjUuMTQuDQo+ID4NCj4gPiBMb2dzOg0KPiA+
ICAgIyBlY2hvICIwMTIzNDU2Nzg5OTg3NjU0MzIxMCIgPiB0ZXN0DQo+ID4gICAjIG10ZF9kZWJ1
ZyBlcmFzZSAvZGV2L210ZDAgMHgwIDB4MTAwMA0KPiA+ICAgRXJhc2VkIDQwOTYgYnl0ZXMgZnJv
bSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gNCj4gPiAgICMgbXRkX2RlYnVnIHdyaXRlIC9k
ZXYvbXRkYmxvY2swIDB4MCAyMCB0ZXN0DQo+ID4gICBDb3BpZWQgMjAgYnl0ZXMgZnJvbSB0ZXN0
IHRvIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaA0KPiA+ICAgIyBtdGRfZGVidWcgcmVhZCAv
ZGV2L210ZGJsb2NrMCAweDAgMjAgdGVzdF9vdXQNCj4gPiAgIENvcGllZCAyMCBieXRlcyBmcm9t
IGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaCB0byB0ZXN0X291dA0KPiA+ICAgIyBjYXQgdGVz
dF9vdXQNCj4gPiAgIDAxMjM0NTY3ODk5ODc2NTQzMjEwIw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWHV6aG91IENoZW5nIDx4dXpob3UuY2hlbmdAd2luZHJpdmVyLmNvbT4NCj4gPiBSZXBvcnRl
ZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiA+IFJldmlld2VkLWJ5
OiBCaW4gTWVuZyA8YmluLm1lbmdAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvYXJt
L3NhYnJlbGl0ZS5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9ody9hcm0vc2FicmVsaXRlLmMg
Yi9ody9hcm0vc2FicmVsaXRlLmMgaW5kZXggDQo+ID4gMjlmYzc3N2I2MS4uNTUzNjA4ZTU4MyAx
MDA2NDQNCj4gPiAtLS0gYS9ody9hcm0vc2FicmVsaXRlLmMNCj4gPiArKysgYi9ody9hcm0vc2Fi
cmVsaXRlLmMNCj4gPiBAQCAtODcsNyArODcsNyBAQCBzdGF0aWMgdm9pZCBzYWJyZWxpdGVfaW5p
dChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+ID4gICAgICAgICAgICAgICAgICBxZGV2X3JlYWxp
emVfYW5kX3VucmVmKGZsYXNoX2RldiwgQlVTKHNwaV9idXMpLCANCj4gPiAmZXJyb3JfZmF0YWwp
Ow0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICBjc19saW5lID0gcWRldl9nZXRfZ3Bpb19pbl9u
YW1lZChmbGFzaF9kZXYsIFNTSV9HUElPX0NTLCAwKTsNCj4gPiAtICAgICAgICAgICAgICAgIHN5
c2J1c19jb25uZWN0X2lycShTWVNfQlVTX0RFVklDRShzcGlfZGV2KSwgMSwgY3NfbGluZSk7DQo+
ID4gKyAgICAgICAgICAgICAgICBxZGV2X2Nvbm5lY3RfZ3Bpb19vdXQoREVWSUNFKCZzLT5ncGlv
WzJdKSwgMTksIA0KPiA+ICsgY3NfbGluZSk7DQo+ID4gICAgICAgICAgICAgIH0NCj4gPiAgICAg
ICAgICB9DQo+ID4gICAgICB9DQo+ID4NCj4gDQo+IFRoYW5rIGZvciB1c2luZyBhbiBvc2NpbGxv
c2NvcGUgdG8gdmVyaWZ5LCBpdCByZW1pbmRlZCBtZSBzb21lIFNEY2FyZCBkZWJ1Z2dpbmcgNCB5
ZWFycyBhZ28gPSkNCg0KSXQncyBmdW4gdG8gcGxheSBvc2NpbGxvc2NvcGUuICA6XikNCg==


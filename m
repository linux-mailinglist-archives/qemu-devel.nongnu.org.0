Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8052319DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:09:47 +0100 (CET)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXGd-0001q7-1F
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAXFE-0001BI-4C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:08:20 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAXFB-000263-GM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:08:19 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CC5cXH023031;
 Fri, 12 Feb 2021 12:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qQXmMSb1sKOV3mVq81rHi1Eto2/i326VzEdC4t4AEBE=;
 b=m85WVBPMh9Efx6+Fe4mwyn8O7qeiT8dmz6Co9BSk7EGJBDbO9PT9qDC7MIkZiMnHcgSL
 kg0UpFs62v2kbwjq54/g5/qVRALagPCMhf7Xs9Emjwhxd2GuBm18fdEFPkGZqbdI4YaR
 mqLEnPL7F+J/U17a7DMFlEoQbKubxfk7gFNiVzIU7UPB1hRQb8bq/eN9RivV1QodjJqw
 Q7jZ1lo5F+PQKxTzfc/zoNADs0SyTLOZqmDoRjXRF78qT/gEP32ZQyNMRSE9/yKYGUQV
 wdJEj3qaNLR6S5/e+if4sdn+ekADkrtb7JxdOuYHAMDbuEYJhiJqLMGm4QgGZhWP9sSO 5A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36m4uq1gmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 12:08:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CC67sA104888;
 Fri, 12 Feb 2021 12:08:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 36j4pswhw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 12:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWavGia0VpM6aMqncLNhkny/QGMau7SET770MGlEZRD6GCJAOfUv0PvI8/PG3QLZI3mnYILyxZ69F5ENRelkM9xFV8l2W6/WUs5MnoqRjTnYV/jIzUHfW/eWyEA3q4wwyuJQYMwdJeLthRYojL6n/CNngwhfDpmAkRIRUM65H1sDJefNQcb/0uG2ln4yiCCnZZTuL8MdyDLdHz1jwffNgZKL+UC/BxlOOdytHDM7pbGI4GSHbZBALraTGBXdTW4SG3VSyP4S0dr9m78HGOLcty83gYPhPEJ/qrcK3aZJRvJ+6HZpOu2jry22+dP7PzSvRdGB8fb5281NJ0yiGTwoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQXmMSb1sKOV3mVq81rHi1Eto2/i326VzEdC4t4AEBE=;
 b=SljRxhdqJRFSWrbFaBmWEW5qPr44nQJNHalycuh4Xkj+wWN1tqcDE7HT3FMxVgxoBbyZINMNnG4TW8R+pbpKTC6E16ZZc5F8+biCVz45aRlay++o9OioihsNQeCDLoFKFN7mTfK5yjApMq610xYyg9sVAfDu9QCG7db0gtnNF9dZ/gkjEEXMytjbn2lHCXPJ7SL3BB4lTXXoLuFAzRdXXpPGxQQ0Ksta7b7OZS7Pv11UfEx+o3+m2TxTBr8vXHq6Quwrk660QFPXiDMYRVA5ZrbLI1sXIqbqsjUOp99a/EaFJkMB5Q8FNGL/zPCEP4aGQ8AjwnbiwbzCSh0Mx390uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQXmMSb1sKOV3mVq81rHi1Eto2/i326VzEdC4t4AEBE=;
 b=zhQI4AcIe+newdcjJOwABobw7jw/hjnnE+gJD6fX84yyo1BfNJJNbcdyDhyH0z6r7DW5FBlhOSbN2uxuHNUE8JEUTg5ggjhAzWTvloBVNvjaitBYBSXzvLxWzrHqWRbaZZV4wx1gir0FwwddIpv9tuNaKKun7hj+wJGunvELc/Y=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4512.namprd10.prod.outlook.com (2603:10b6:a03:2dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 12 Feb
 2021 12:08:11 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3846.030; Fri, 12 Feb 2021
 12:08:11 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Thanos Makatos
 <thanos.makatos@nutanix.com>
Subject: libvfio-user library in QEMU
Thread-Topic: libvfio-user library in QEMU
Thread-Index: AQHXATe72T28FYqJBUW7RA7zLktHgw==
Date: Fri, 12 Feb 2021 12:08:11 +0000
Message-ID: <AA81A6EE-4CF6-435E-9FB3-7A560CA4D491@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:6511:c64d:8d07:2938]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a11af173-492a-4498-538d-08d8cf4ede36
x-ms-traffictypediagnostic: SJ0PR10MB4512:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR10MB4512D17D9C9289C9483DC24C908B9@SJ0PR10MB4512.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uihpzYTFMibmjn2KIl4vWB1cc+2ZU/0RjaA/Dcztsvr1XXHKUFdBrPGxsEE79Q1ej9+UGawagZZs01EKmL9WdJm0qhB2BsBrdBELD76Xb8gyYeFWWYnxM600J8j+K4YHkxXEObN83haJzFq/pkpOrHHjTtbG8wUwkliyZLPnD53QyQsSd1WXNDK0k2xPWDLRDdcsaiz1unTyC5fs5MiEyqkDMKArcnSBfgT/z1NSVcqmf/C9Q4P8/WN/JnmEDWso19gMZSxDzB5gVW+hNfuBe0ty+cecBdGMcVS8pHYnFu1FxeK5M6JRzY5SOUS6WDAqr0wDdt+aBkedky4rsVm3BpalUYx4fumui4MKpjof7BqlWCb9GB4+Bm/8iwpLjXnTWo5BinRjc8X8eg7bIed3TZ+sVtJW2Hxt590FZ5MJjgNoa+OXQmocAJ2SwHmHmif9G5kbLfWVQ/9jrJGyR8RNbGhMobAlJ43bJ7ubCf0990lEUSTdyfwGtcV2001DCzIJ9ZEZwSKwiGIcNUS50sDvi+Wust6b2cUKj5HclS8VWEkqtVNvH2s5BLKPVUvww4w9SzU1VubB+0Edz9HAPRpJ0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(6512007)(44832011)(4744005)(316002)(8936002)(71200400001)(2616005)(6486002)(110136005)(8676002)(54906003)(33656002)(6506007)(478600001)(4326008)(36756003)(66446008)(5660300002)(86362001)(76116006)(66946007)(64756008)(3480700007)(186003)(66556008)(2906002)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MlpsKzhxd0hRR1FNUjYyRW4rNlp6UFNSdVJBc0pZVTJSMUJOMFI2MTNhMmFm?=
 =?utf-8?B?MDdJQ1h3WDA1cGw3RnhmKzd4OUZmWlU5Wnc1cGJwQVR4VDZQOG5hTEtueExU?=
 =?utf-8?B?MDk1eGZGVENoWHhSTUlwNXVGWkFCWmxpdTZkb2o2a1FMajRkRmNxdE5vbHho?=
 =?utf-8?B?T0x5TU1xQjVDTUhYTHVkMkdtWTNnTytVMC9qdVQwa2c0WEpyRmVrR0Y1WlJs?=
 =?utf-8?B?U0FYaGNDRlZHc1VheDB6UE9XeER3RHV5aXFNTEptNkpUckJtNXBJbUpiU3Mw?=
 =?utf-8?B?TG8yUzIrL1IzZ3l3SUcwMzlabEZFY0pWKy9ENUNGaDRXRmNMN1gzUTRIZlhv?=
 =?utf-8?B?eEhIam10eWdKU3NGSUJEclp4KzFhSHBPV0hUeXZENmNESk1oOFVHQXBnNVFJ?=
 =?utf-8?B?OXFMRXFkT0o2Wm9POHBNallLbXdjdmg5QTR6MDJUTUpHbkJhWmpQRjFyYjNF?=
 =?utf-8?B?b1A4cmRNL1FqY1ZCckpIeTgzZlBCR2NzRXZNY1VJN3M2TEJlVzZBSWhSLzJo?=
 =?utf-8?B?emQyZWlIMzQ3eU4xRmppMGxRQ29QV0UwaGlreVBhV080Z3phejRWQUw1UUNN?=
 =?utf-8?B?dllhRkpvYjYzTkg5TkZsM2NpNDBTODhqRDE0VkxqNXNFeXhzS1F3SnlGUkwx?=
 =?utf-8?B?R0o0L2NXOHpWaUFGb1ZXZkU1U05KN0ZPMThjUXVPOUxEUDRXTDA5MmlVeVVJ?=
 =?utf-8?B?N3JTRjgwWHFodC9WcHFOZGJuQzkzYWhMZU44RkRSZkRyNXZ3dDBuOEh0MUI5?=
 =?utf-8?B?bVd4eElKMXVha2tmUFBmOGc4aUJQRi9kRk9rVC8wcEFhWEw3V2ErVGg3VXpF?=
 =?utf-8?B?ZTNNWS9URVhrM0h0NU8veUZCd3I2eWFQRFQzRVBnNitvQXgvbHZ0Wmd3a2ph?=
 =?utf-8?B?SDhZYjZtSVN2WTRiQUJCMnZ1UW1WbDVqc1hNcFpFQlczVFZseTlremNvMllq?=
 =?utf-8?B?M1lZYU1wbkVyZjNEN0ZDSXBWMWNHZWt6MWZxY1p6Z3FjNm1MSjFOcSt0ZDNT?=
 =?utf-8?B?OVp3RXhyc0FzNWpnMEprN3VTUml2S25oTk1wNDQySm9NUUpoOHRFN25qVWVN?=
 =?utf-8?B?b2dZZk9MYzNDVy9aOG5FT0VGRk8rWnJUUTZSRWNJanR2MnRsbjN6SWpmUCtz?=
 =?utf-8?B?U3pPdzgxWjFGQ1dQUDZlK242dTZnNk9GTmNKMzl3TTd4ZUdIMjMzbFovS21z?=
 =?utf-8?B?OXhqYUpRMHlyb0RsNzNjSG5VZE5FUVJLYXowNGJzNlczU1NEY1phSHhoa2Fs?=
 =?utf-8?B?SjBERkprdk5lV2I3eEt3WW50cnVUT21NcDUxS3FTMk0rUDBKeWNzcnJDZWtt?=
 =?utf-8?B?YjBPd1VKVkNZUHdFMDU2KzdaR05YaHNKb0d6V3Q0Rzg2dEVQa1JORFJHQ2ww?=
 =?utf-8?B?eDhNL3ZwUjBOVVBsNHpaYUsraEFUYnNPaGZOdTVYeUptUElaWHBvZlptWlFK?=
 =?utf-8?B?RGJ1TWtxOTcwYzRTcjcwUGc5MGlld2tFaG0vRmVmRW5lSTU3eUhDNzBMZDNj?=
 =?utf-8?B?b3Jid2VsNldEUDE3ZXpVdW1TSFJEQkVwdXVBMVM3d2ZoajB6YzhCZ3pkK3Bx?=
 =?utf-8?B?VjdQYjZENWhRVk4wY29zc3MrVTI4WW1XZ01FS3dQQ2tEYjY1d1NkUGppeTJa?=
 =?utf-8?B?TXUvODZpOTlKeWI2V1BrbXhtSGF4OURpbXJRUzBpT3E2THo3NVRKZXdSMzlK?=
 =?utf-8?B?TFMrYkZqZnhmMzA0K1pNQ2VTL3h6QjY2b29JUzJzVlVlanhzMzRIYXE0QnEr?=
 =?utf-8?B?UWJUR0Q2ajlQUCtXZmVYUy9VaGQwc29SdFk3dUxOOUpjZWdISCtXaC9oL2pz?=
 =?utf-8?B?dWdVKzlQWTVic1ZsZWh6UGRXUmlIQWJCQmw4TFVvdEV2eHFwWEdHcUIwQTlJ?=
 =?utf-8?B?SExCSzlxL29ocWYreWhEK1IvbUsrSUVzbHgzYUIwcVQxN1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71F1F5DD2972B44BC4653227E4C0480@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11af173-492a-4498-538d-08d8cf4ede36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 12:08:11.4436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RcZTB0Qmsn2PH35CzTZeF4TnTBt6nOBESnd9m8brPaNomo8gszfYFdrJO6fy7igJjVw8Vjh+7RqSRIHmuz0kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4512
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120097
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120097
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
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
 John Johnson <john.g.johnson@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Felipe Franciosi <felipe@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgU3RlZmFuLA0KDQpJZiB3ZSBoYXZlIHRvIHVzZSBsaWJ2ZmlvLXVzZXIgbGlicmFyeSBpbiBR
RU1VLCBjb3VsZCB3ZSBsaW5rIHRoZSBsaWJyYXJ5IHdpdGggdGhlIFFFTVUgYmluYXJ5IGJhc2Vk
IG9uIHNvbWUgY29uZmlnIG9wdGlvbnM/DQoNClNlY29uZGx5LCB0aGUgcmVtb3RlIHByb2Nlc3Mg
aW4gbXVsdGktcHJvY2VzcyBRRU1VIHVzZXMgdGhlIHNhbWUgUUVNVSBiaW5hcnkgZm9yIHRoZSBy
ZW1vdGUgcHJvY2VzcyBhcyB3ZWxsLiBJcyB0aGlzIE9LIHdpdGggbGlidmZpby11c2VyLCB0byBz
dGFydCB3aXRoPyBPciBkbyB5b3UgdGhpbmsgYSBzZXBhcmF0ZSBiaW5hcnkgaXMgcHJlZmVycmVk
IGZvciB0aGUgcmVtb3RlIHByb2Nlc3M/DQoNCkZyb20gcHJldmlvdXMgZGlzY3Vzc2lvbnMsIEkg
cmVjYWxsIHRoYXQgbGlidmZpby11c2VyIHdvdWxkIGJlIGdpdCBzdWJtb2R1bGUgaW4gUUVNVSBy
ZXBvLiBJcyB0aGlzIHN0aWxsIHRoZSBwcmVmZXJyZWQgYXBwcm9hY2g/DQoNClRoYW5rIHlvdSB2
ZXJ5IG11Y2ghDQrigJQNCkphZw==


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60053AAB6B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 07:52:13 +0200 (CEST)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltkwm-0006ql-Ij
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 01:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ltkvc-00067B-L9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:51:00 -0400
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214]:2686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ltkvZ-0003aL-ME
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623909059; x=1655445059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wyLh+lsx2uLaf6qumhrs59tCXTOv/MpEVuWQv+6sdxU=;
 b=PInqjtPrfqp2WMPJob9Xe5iIvVi8Nyk4aXW4iFX7kkY5uqWy6KxWyTNI
 KDMQc3eEdTmzvwSHPcRdkreCkl3Iv20dILm7RyBoa0y8c369AU3is80Zl
 YZgpBUTEbAc4KQlMINZVMbTEefsvFWI5H3ra6zg7xIQ/hiAEsaIhXtuII
 rYqidNGRyPBnuq5drF/d1vILzheMphLisydAKRL9XNHU168nXk6gEmYM/
 Q8D3aQVdm5Opwq0AAAgwrgFiTy6S8cgtc64c6290tOg0lOuEmi59hTShO
 IMmxIgwmxYXvnQm8LZVN6gfZ+ogrto9ZKFSJcwoQnICbDXutHik1M82YI A==;
IronPort-SDR: 9U3jMMB7ii/4eFuzxrob2b1hIMcs64r5xtQU+MEQDhOfEEZSQu2VbjRhdu5fdWY3rcEHB7jXD9
 vynlmo1iW7TLtgCX69KBKXD9o6cXfjAXdFtca7Bxx/r62Q1rlPnqznTgSBYA7ym0bp5VQnDGpg
 CJ7gCHuYakozGAzY8QWNnRwCC+SeIXd19jUjRSlRXDpj9q8Eo05qkKvjMwwLj4EnUUfWQGdcQM
 vjnHPY6vnmMC3z9MlatHmoyvuPhw6QFqz85+qILWkyS665/Wz0z7itwj6uUqAO0ihr5vmwYhQo
 LZM=
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="41197820"
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; d="scan'208";a="41197820"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 14:50:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDi05i+HccrObekCaBKxOTIyVNlHYI8HE0ThBnRKzu/AU+Wl2qHYIQqdw/vLKRe9k6CPNw83USyhhNA3Gyjf58GWZ7EuyUJ2uJ85f+aj6dJs069znhzT+fqxbmEuGm5dq+FflFVqlIKrA7NDk3IF+D3XT8vdMndWgrnIbNtMcPHrWkXE4KMUjoR4TKeW9xHn6lVvtK6yqAkfTbYRL2dGnkLIGRVG1UoOWNVYVk0P5iNnsaVv3rc8nmyQObMfnomOH2eOIRt3dxIL7mhrehteTmuzc6TLj8sANo7jIvmyavDBCM1f8kQIUhkpUPV59yadsNRFkwE/VPI6W1yCsolyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyLh+lsx2uLaf6qumhrs59tCXTOv/MpEVuWQv+6sdxU=;
 b=AA6BeC3Xlj8Qz/VIFGTQdaMlxcdTvH6aCxnSsy8wZsV0qcI1BeNmwyNoZNHdeKS5EXa1RTc5mddkFhd4wLZ3vDs5uoIFo648aSDfulh0SXLASdzXBDLv2j1l4PeJJpjoBwlnDOmw6VDcjLPFL/1A0yowGfrILNYO3YUERuMAHQGc1wJK7Hfb/FRb3n7kIOb22aTbkEyo6b91ViwMIXWjiPWbLvfNuDfCtic2/UMRs5S4wEjz7AL4uawj60O0Y3wAQaNB3xfQKT6cjmqF6DMoo69fk1GrPgQKVSMStXqtsKD9Co7cXMyNZb09Nf2PV1008LpS7WPNeo7akdpylYa62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyLh+lsx2uLaf6qumhrs59tCXTOv/MpEVuWQv+6sdxU=;
 b=caHxxkeRdx6sP537bAjJQGfEkTNC4VxA+HsUMGqBjQ1JO5zGa5I5tqy6Zssj7ELge6XAdAPwSyTUGiiVToMu9MYSa3zDgKKa3/JA3r3e1QCExJkAziSrTSafLlA8LndKQL2Guy1g3Q3dMWTJmfH0tXnf5odKsPeCJNJgh4nH0XE=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OSAPR01MB7231.jpnprd01.prod.outlook.com (2603:1096:604:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 05:50:46 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc45:4133:3e06:d1b0]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc45:4133:3e06:d1b0%9]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 05:50:46 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Lei Rao <lei.rao@intel.com>, "chen.zhang@intel.com"
 <chen.zhang@intel.com>, "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: Re: [PATCH 3/7] Fixed SVM hang when do failover before PVM crash
Thread-Topic: [PATCH 3/7] Fixed SVM hang when do failover before PVM crash
Thread-Index: AQHXYyQSMJnXhmGJrkaJ5kEuHdsmEqsXswwA
Date: Thu, 17 Jun 2021 05:50:46 +0000
Message-ID: <a02d1688-f398-193a-ce4f-b1f37f650a3d@fujitsu.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-4-git-send-email-lei.rao@intel.com>
In-Reply-To: <1623898035-18533-4-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e89f104-6fe0-4f4f-0d20-08d93153da70
x-ms-traffictypediagnostic: OSAPR01MB7231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB72317256524F70A7CAB7ABCBA50E9@OSAPR01MB7231.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5x+CReWHZ5oCjIRPdPEaB7ujgJx8cwbj22+YahTuHQUV7pKyZt49wrVmOKUXVBR8vkmooANLwKPECq4UvEAlrxU6FWHKbpo9xCfzFF71kK2al69TDutas3fkvdk11KvgndbmOS8li/AXtHkp4+t2IZLit6nkQ5ZgNxpaJnv5oCwvn5HkbDx5rN6YOULRnGzJ8dYEEoywLqDc2egfohPJ/6CICWtii7d3jRjRIxcW6zvdxEy9fG6QQC55QInmKs5x1ctu+OiofPA0XKQkS1/j8mAz21ocshfa5tMHPofVVxtCJ531IW0E2M15SRat/eVR17bcF/I9lPjMuSDu+LIFLTIiGPBbOTgON8xKzY7geW3qZN2SEiRPxDC1U2TkZBRScFVD68xFYwUdDsAvXM6/GXVj4Ri8rqN6D76U6s/8Vcm6wg7Kf87ySB6oCvOuJ4e0U9nlHsHQ+lwoVJvTtWpKBd7N4fSXapi2zyocHl/s4eV1r/rgJg6ur6qDqJwz6NYB2rEEMkdZjVt3A9dlf2sdyMGHrHD8fxqR+Lzm5PwIBYmQKOnXS0oFltoTbraWh86RDdpgFaFxMlxMeKy+eCpfFxUPU1QmLfcxlNmg7qllJmDA0f0Kxj1JycSYf3MAhC2mXHHucWY8W5iNkOPvNPfwcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(66556008)(66446008)(64756008)(66476007)(83380400001)(2616005)(71200400001)(31686004)(6486002)(316002)(8936002)(26005)(186003)(66946007)(5660300002)(85182001)(91956017)(76116006)(6512007)(122000001)(110136005)(8676002)(54906003)(4326008)(2906002)(53546011)(6506007)(478600001)(36756003)(38100700002)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG5LQlkzQ3BJUnBFeEN5d25BYkJyaWVVNVE1aVFLQWFLTUwwK29VZndOWWJt?=
 =?utf-8?B?ZWhjZEhlTEQrVjRjR2ZFc21BYlhRblJWczcvK0c1SkMxYkc3eHk0S05SQjll?=
 =?utf-8?B?ajh0Mk4vOHJTOW4yNVQvbDhMQXBZOEcxdFpFaHA0ZEs3TUd6b3Z6dzJzYmxC?=
 =?utf-8?B?NCtmb3dHQ09xSGUzUGdaa1BKTjM1VGtkYWduT3NFdForYUpFQmpqRmk0M0ty?=
 =?utf-8?B?Ymtqa1FrQjhIMjZGTFBzT3cxU3NBZU8zWWpUTzNvYnRMdll0WW42b25IbnNh?=
 =?utf-8?B?bFk5WmpOUGN0a0JGN0JNQy9EeVZGZ3pqMXlBS0lGbktBTUxsSFpJUHpBcWEv?=
 =?utf-8?B?TDJQeUxjTitvVC9iM0FQRmNsYUx4OXR0UWVlZm5HNmw0MVFHTG11Z3RHQk1T?=
 =?utf-8?B?eVpya1ZNT2dnc29mR2dacndLdDQ1cUtPUDMzRDU5SWNibnU2N2RISnlsL3NF?=
 =?utf-8?B?WC8wRzVEcElkbFNvdjRieGxqazM3c2FFcmJIbThGaGxHSU5tMXJRQ29kNTNr?=
 =?utf-8?B?T1dZQ090REtYaU9iQTZXL24vN1dYcis1Y29nY21meFFGcHlsZzhIZzRjUm9n?=
 =?utf-8?B?UWQzOVM5UTlBTXYwL0dpb0RhQ0FkZzIrQk1ieE5RMnVtMjhuN2htVUlmcHZ6?=
 =?utf-8?B?SXV0UERkU0NLa2xIZDNhNlZQang4UXQ2R2ZkcXZSWG5EbWQ0TXVFMDdzbjlH?=
 =?utf-8?B?czRRUUVSbmFoS1R5SFg4d2d1TzRhc2tlVjZYSEt4eUEzeGUxRkowY2F6N0Fv?=
 =?utf-8?B?VURNMHVtemVDQTJUcWc0bkJKZy94RGNXbElkTHNCREVaTGRRL0IvOU5QSldn?=
 =?utf-8?B?RGFacnIwOHh0QjNTdC9mNzYvc0Ryd2R3bXlvamhJdmxzSVVmdUtPS2xIQUZN?=
 =?utf-8?B?bldPbnIzVU5xREYyNG5WRE5KdG4yMVljaDhhS1dVZWVkdDhEMTFCOUt2alVv?=
 =?utf-8?B?YjJjUVpiMVUvZjNpL3RSWWw3VGNvSkdpMVlHdUh6Qm5zM0x1a3p4REl6OXZC?=
 =?utf-8?B?aEM5ZDhuUUtjaVhnVDBBNEN4em9vS2hQT3RLV1ZFMjJMUTMvc3JIZitQdXJm?=
 =?utf-8?B?ViswaWw3TGJoU0hkYXVxdUJUaEY5V3RrNEZVRlJSLzZ2eXZnQndxeUptZG1Y?=
 =?utf-8?B?TTdScVhhVy8yUGtuUkpPUEJnYWtaOHcwalJPelIyeVNaTGVnZFEyVDB5SWF2?=
 =?utf-8?B?dldLYXBERHdndm9JclFBQ05wN2J6RHRFbXpESFZzRTlFN3VySmxKVTFaWTdJ?=
 =?utf-8?B?ZW1LOEkyVXpSeXdLNE9xKzc5djIzREVYQWt2SU5CWW41Wm42RHBpRExYSHVG?=
 =?utf-8?B?SE1WMFl2VXVsbDdNRWRyZ3lpZ0Z3Ym82L1gveXZTTG9UTEZaM1dJVHR1a0wx?=
 =?utf-8?B?VTlyRm5ZOTJrbmpNZk5nMW5EZUtCWnFCRzE4SjJ1dkw5ZC9CeStBa0k1Rklu?=
 =?utf-8?B?M0lzVW4rVDVINTBmQUluWTB6QXdpcktHb1licUtYck11VjNKa1N6QUhRRWlR?=
 =?utf-8?B?OUNjVjl6a01mTldFMkNqOXhpc0VKVlA0Z0t1cUlUdFBNTzFFV2NIY1JXQ3N1?=
 =?utf-8?B?VktaaWEzMmRrRW1qT2kwaDRzMUtvNEJkZjJ0MFFMUnhvVlBJMXJnUHVjZVVa?=
 =?utf-8?B?UTNZVWZ4YjkrRlg1SkVRUlpOZGNaem5ibmZOeGdLMERDMHNNSjNaMnh6MXRL?=
 =?utf-8?B?ZVBvcTVoUXlhcnlXTTN2YkdCSHdiUHZ4SWgyMWlEdlpkZXF0akpGd1RuSThZ?=
 =?utf-8?Q?FFt0LRx4JRYFVJoQLYBgnchLk5suyxcGKKbLiWM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D03A84A8F78A0B45836ED766F3292752@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e89f104-6fe0-4f4f-0d20-08d93153da70
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 05:50:46.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxkvOdCB2Nicr5RtCi/dR2WuFZYeBg4H1fEbjdaXNGE088psv8kNJsYwXjR/Tt8IkFLIfVFFwGo2xaBQsGvgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7231
Received-SPF: pass client-ip=68.232.151.214;
 envelope-from=lizhijian@fujitsu.com; helo=esa4.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "like.xu.linux@gmail.com" <like.xu.linux@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDE3LzA2LzIwMjEgMTA6NDcsIExlaSBSYW8gd3JvdGU6DQo+IEZyb206ICJSYW8sIExl
aSIgPGxlaS5yYW9AaW50ZWwuY29tPg0KPg0KPiBUaGlzIHBhdGNoIGZpeGVkIGFzIGZvbGxvd3M6
DQo+ICAgICAgVGhyZWFkIDEgKFRocmVhZCAweDdmMzRlZTczOGQ4MCAoTFdQIDExMjEyKSk6DQo+
ICAgICAgIzAgX19wdGhyZWFkX2Nsb2Nram9pbl9leCAodGhyZWFkaWQ9MTM5ODQ3MTUyOTU3MTg0
LCB0aHJlYWRfcmV0dXJuPTB4N2YzMGIxZmViZjMwLCBjbG9ja2lkPTxvcHRpbWl6ZWQgb3V0Piwg
YWJzdGltZT08b3B0aW1pemVkIG91dD4sIGJsb2NrPTxvcHRpbWl6ZWQgb3V0PikgYXQgcHRocmVh
ZF9qb2luX2NvbW1vbi5jOjE0NQ0KPiAgICAgICMxIDB4MDAwMDU2MzQwMTk5OGUzNiBpbiBxZW11
X3RocmVhZF9qb2luICh0aHJlYWQ9MHg1NjM0MDJkNjY2MTApIGF0IHV0aWwvcWVtdS10aHJlYWQt
cG9zaXguYzo1ODcNCj4gICAgICAjMiAweDAwMDA1NjM0MDE3YTc5ZmEgaW4gcHJvY2Vzc19pbmNv
bWluZ19taWdyYXRpb25fY28gKG9wYXF1ZT0weDApIGF0IG1pZ3JhdGlvbi9taWdyYXRpb24uYzo1
MDINCj4gICAgICAjMyAweDAwMDA1NjM0MDE5YjU5YzkgaW4gY29yb3V0aW5lX3RyYW1wb2xpbmUg
KGkwPTYzMzk1NTA0LCBpMT0yMjA2OCkgYXQgdXRpbC9jb3JvdXRpbmUtdWNvbnRleHQuYzoxMTUN
Cj4gICAgICAjNCAweDAwMDA3ZjM0ZWY4NjA2NjAgaW4gPz8gKCkgYXQgLi4vc3lzZGVwcy91bml4
L3N5c3YvbGludXgveDg2XzY0L19fc3RhcnRfY29udGV4dC5TOjkxIGZyb20gL2xpYi94ODZfNjQt
bGludXgtZ251L2xpYmMuc28uNg0KPiAgICAgICM1IDB4MDAwMDdmMzBiMjFlZTczMCBpbiA/PyAo
KQ0KPiAgICAgICM2IDB4MDAwMDAwMDAwMDAwMDAwMCBpbiA/PyAoKQ0KPg0KPiAgICAgIFRocmVh
ZCAxMyAoVGhyZWFkIDB4N2YzMGIzZGZmNzAwIChMV1AgMTE3NDcpKToNCj4gICAgICAjMCAgX19s
bGxfbG9ja193YWl0IChmdXRleD1mdXRleEBlbnRyeT0weDU2MzQwMjE4ZmZhMCA8cWVtdV9nbG9i
YWxfbXV0ZXg+LCBwcml2YXRlPTApIGF0IGxvd2xldmVsbG9jay5jOjUyDQo+ICAgICAgIzEgIDB4
MDAwMDdmMzRlZmEwMDBhMyBpbiBfR0lfX3B0aHJlYWRfbXV0ZXhfbG9jayAobXV0ZXg9MHg1NjM0
MDIxOGZmYTAgPHFlbXVfZ2xvYmFsX211dGV4PikgYXQgLi4vbnB0bC9wdGhyZWFkX211dGV4X2xv
Y2suYzo4MA0KPiAgICAgICMyICAweDAwMDA1NjM0MDE5OTdmOTkgaW4gcWVtdV9tdXRleF9sb2Nr
X2ltcGwgKG11dGV4PTB4NTYzNDAyMThmZmEwIDxxZW11X2dsb2JhbF9tdXRleD4sIGZpbGU9MHg1
NjM0MDFiN2E4MGUgIm1pZ3JhdGlvbi9jb2xvLmMiLCBsaW5lPTgwNikgYXQgdXRpbC9xZW11LXRo
cmVhZC1wb3NpeC5jOjc4DQo+ICAgICAgIzMgIDB4MDAwMDU2MzQwMTQwNzE0NCBpbiBxZW11X211
dGV4X2xvY2tfaW90aHJlYWRfaW1wbCAoZmlsZT0weDU2MzQwMWI3YTgwZSAibWlncmF0aW9uL2Nv
bG8uYyIsIGxpbmU9ODA2KSBhdCAvaG9tZS93b3Jrc3BhY2UvY29sby1xZW11L2NwdXMuYzoxODk5
DQo+ICAgICAgIzQgIDB4MDAwMDU2MzQwMTdiYThlOCBpbiBjb2xvX3Byb2Nlc3NfaW5jb21pbmdf
dGhyZWFkIChvcGFxdWU9MHg1NjM0MDJkNjY0YzApIGF0IG1pZ3JhdGlvbi9jb2xvLmM6ODA2DQo+
ICAgICAgIzUgIDB4MDAwMDU2MzQwMTk5OGI3MiBpbiBxZW11X3RocmVhZF9zdGFydCAoYXJncz0w
eDU2MzQwMzlmODM3MCkgYXQgdXRpbC9xZW11LXRocmVhZC1wb3NpeC5jOjUxOQ0KPiAgICAgICM2
ICAweDAwMDA3ZjM0ZWY5ZmQ2MDkgaW4gc3RhcnRfdGhyZWFkIChhcmc9PG9wdGltaXplZCBvdXQ+
KSBhdCBwdGhyZWFkX2NyZWF0ZS5jOjQ3Nw0KPiAgICAgICM3ICAweDAwMDA3ZjM0ZWY5MjQyOTMg
aW4gY2xvbmUgKCkgYXQgLi4vc3lzZGVwcy91bml4L3N5c3YvbGludXgveDg2XzY0L2Nsb25lLlM6
OTUNCj4NCj4gICAgICBUaGUgUUVNVSBtYWluIHRocmVhZCBpcyBob2xkaW5nIHRoZSBsb2NrOg0K
PiAgICAgIChnZGIpIHAgcWVtdV9nbG9iYWxfbXV0ZXgNCj4gICAgICAkMSA9IHtsb2NrID0ge19k
YXRhID0ge2xvY2sgPSAyLCBfX2NvdW50ID0gMCwgX19vd25lciA9IDExMjEyLCBfX251c2VycyA9
IDksIF9fa2luZCA9IDAsIF9fc3BpbnMgPSAwLCBfX2VsaXNpb24gPSAwLCBfX2xpc3QgPSB7X3By
ZXYgPSAweDAsIF9fbmV4dCA9IDB4MH19LA0KPiAgICAgICBfX3NpemUgPSAiXDAwMlwwMDBcMDAw
XDAwMFwwMDBcMDAwXDAwMFwwMDBcMzE0K1wwMDBcMDAwXHQiLCAnXDAwMCcgPHJlcGVhdHMgMjYg
dGltZXM+LCBfX2FsaWduID0gMn0sIGZpbGUgPSAweDU2MzQwMWMwN2U0YiAidXRpbC9tYWluLWxv
b3AuYyIsIGxpbmUgPSAyNDAsDQo+ICAgICAgaW5pdGlhbGl6ZWQgPSB0cnVlfQ0KPg0KPiAgRnJv
bSB0aGUgY2FsbCB0cmFjZSwgd2UgY2FuIHNlZSBpdCBpcyBhIGRlYWRsb2NrIGJ1Zy4gYW5kIHRo
ZSBRRU1VIG1haW4gdGhyZWFkIGhvbGRzIHRoZSBnbG9iYWwgbXV0ZXggdG8gd2FpdCB1bnRpbCB0
aGUgQ09MTyB0aHJlYWQgZW5kcy4gYW5kIHRoZSBjb2xvIHRocmVhZA0KPiB3YW50cyB0byBhY3F1
aXJlIHRoZSBnbG9iYWwgbXV0ZXgsIHdoaWNoIHdpbGwgY2F1c2UgYSBkZWFkbG9jay4gU28sIHdl
IHNob3VsZCByZWxlYXNlIHRoZSBxZW11X2dsb2JhbF9tdXRleCBiZWZvcmUgd2FpdGluZyBjb2xv
IHRocmVhZCBlbmRzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgUmFvIDxsZWkucmFvQGludGVs
LmNvbT4NClJldmlld2VkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+
DQoNCg0KPiAtLS0NCj4gICBtaWdyYXRpb24vbWlncmF0aW9uLmMgfCAyICsrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL21p
Z3JhdGlvbi5jIGIvbWlncmF0aW9uL21pZ3JhdGlvbi5jDQo+IGluZGV4IGMyYzg0YzcuLjZkZWJi
OGIgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KPiArKysgYi9taWdyYXRp
b24vbWlncmF0aW9uLmMNCj4gQEAgLTU5Myw4ICs1OTMsMTAgQEAgc3RhdGljIHZvaWQgcHJvY2Vz
c19pbmNvbWluZ19taWdyYXRpb25fY28odm9pZCAqb3BhcXVlKQ0KPiAgICAgICAgICAgbWlzLT5o
YXZlX2NvbG9faW5jb21pbmdfdGhyZWFkID0gdHJ1ZTsNCj4gICAgICAgICAgIHFlbXVfY29yb3V0
aW5lX3lpZWxkKCk7DQo+ICAgDQo+ICsgICAgICAgIHFlbXVfbXV0ZXhfdW5sb2NrX2lvdGhyZWFk
KCk7DQo+ICAgICAgICAgICAvKiBXYWl0IGNoZWNrcG9pbnQgaW5jb21pbmcgdGhyZWFkIGV4aXQg
YmVmb3JlIGZyZWUgcmVzb3VyY2UgKi8NCj4gICAgICAgICAgIHFlbXVfdGhyZWFkX2pvaW4oJm1p
cy0+Y29sb19pbmNvbWluZ190aHJlYWQpOw0KPiArICAgICAgICBxZW11X211dGV4X2xvY2tfaW90
aHJlYWQoKTsNCj4gICAgICAgICAgIC8qIFdlIGhvbGQgdGhlIGdsb2JhbCBpb3RocmVhZCBsb2Nr
LCBzbyBpdCBpcyBzYWZlIGhlcmUgKi8NCj4gICAgICAgICAgIGNvbG9fcmVsZWFzZV9yYW1fY2Fj
aGUoKTsNCj4gICAgICAgfQ0K


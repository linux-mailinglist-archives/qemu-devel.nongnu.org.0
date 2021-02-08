Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4543143A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:23:03 +0100 (CET)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fry-00071l-O2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l9CGy-0002ka-U3; Mon, 08 Feb 2021 14:32:37 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l9CGq-0000uT-2b; Mon, 08 Feb 2021 14:32:35 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118JNqag096914;
 Mon, 8 Feb 2021 19:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=q3uJ05dQcmCKSC+C4unA/fcA462EpUbacjB5JmQlpc0=;
 b=oxXgAX9ebOAVlqIn+zPWYmvd0vXr3jhg/62UIa38OGf5UaLOOUGGB/49CFy0HMn/XCK+
 S48//g05p6QOH7kQkW/pxfHwqNclhIrMEIspcSWhkAPYJArmPGQqwAfi0NIWv/SjjIrJ
 NZ1frAvuZmhPo1n5iZciXaWDkmYGsBVbfCUWN9uaYcY9SB19tN2+MPulZbW/AJ4EdEqZ
 FThzPUsZa0IHA15MQWW9wG2FZ3bSPdzDBHKnSN/yGIaf06cWRxN0SxqGtYIc+8wuBf21
 UqViD7kPmB9Sq1ijhskn+4YhvSgGlkPdhonpnBPYbIAKcNANCvVuzZI2kc53VmkcjGyh Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36hgmad89a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 19:32:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118JOa3g154125;
 Mon, 8 Feb 2021 19:32:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
 by userp3020.oracle.com with ESMTP id 36j4vqb3jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 19:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfGSs9JenoUZ4uRRKLL1NjhPfIjb8bbkHzU4ERfiVAP4KejgYuaS7lbyPjqlBF31MMF8IMQIRH19HeUd8LeUtSDNMSCaPwc8XTlh6fcd9Kz6zcfZ62E2/vUuw5pfQnjZLHk41exSpB8JqvRWfC9fDHssg1X2w9oMirkvc9qiU+4VnZVRz17OPHIunBmLnjyO3jsO4jgypJSRu0wnwxUj5/nPbomTkTZY0T9kpXsr14uxBoOk3SWrBNMLWvGZaebc1vqd2xX8E9tCLzZcxH0l+5sr1buE0SYaRVP5ZIPaFKuu56SfjwXn0ThggBl+GJnjRrBjVGxUc2x3UmpqjwEtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3uJ05dQcmCKSC+C4unA/fcA462EpUbacjB5JmQlpc0=;
 b=EZJAQW0WtgiRzSFK2Ql0mNXuQq+a5oligNPFPBncEoCmHZj06fIhxJqE+y61DVKYIo2bgMdaFt1bKJ3CcmQoGUTgpPr64uJpHkDMYwed6J4DazNyACdbEyBbaTxCIbs8w2yKxmTW6QS8EEV0mUQqlC5bQxFWoJEHEWZsl+P+OlyTetl9L00XkBvyITyRdAQasepJAA2YYmyDUN2NKB3ESyNALfim6S8iug5ntofDfg9rYy1bfv72QCsIzZjkGrct54pix1s6tVf04n+hgDaZoV7ht8+XJ3tPeRbA7n7fRp59DGXB1yLDlWNGo1vQDn+aQlru+bHHhoJx2m67v8Y2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3uJ05dQcmCKSC+C4unA/fcA462EpUbacjB5JmQlpc0=;
 b=jvBHsh2t5cZbeq5EQkF3nuQ2to0PBSgDbGQ4grSZoowFevQtgs0B5erOnalypAm3uEFc/9k0osKQAD5NhSbLYjwJqkjYJCdIB4ruZQCxXfH+GbSuiqHbOfvlqOMIjvOQgsSq1aPkVUFDmiZFeX0+cA0C4M94d6q9cfbsquChWMo=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BY5PR10MB4354.namprd10.prod.outlook.com (2603:10b6:a03:20c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 8 Feb
 2021 19:32:08 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 19:32:08 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PULL v3 00/27] Block patches
Thread-Topic: [PULL v3 00/27] Block patches
Thread-Index: AQHW+95L6XC+x9ihZ0Kxh/hf9tcM4qpKK9KAgAEwYgCAAqVFgIAACfCAgACfBoA=
Date: Mon, 8 Feb 2021 19:32:08 +0000
Message-ID: <E45E85B2-F585-415F-B2FF-35A9C34855E8@oracle.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
 <20210208092723.GA18298@stefanha-x1.localdomain>
 <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
In-Reply-To: <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:49be:4450:cbed:f9f4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7fd65fc-b820-4ce9-35c2-08d8cc68397c
x-ms-traffictypediagnostic: BY5PR10MB4354:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR10MB4354DF5C977BA66BDF444F3B908F9@BY5PR10MB4354.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyX0vPWz5AouK98g9sAgcs2LUqLJ3TzVVBKQmKqufaGB43ZF3+vxlHgppg677PJ8I6GgmGmlSayV8eGQVDUObYrUvMcvIFJbC0+QfVJ8bn7lXlyg2wCzikYZ5FtOK5q6NJ8psCVM25wRsAetdLepbxZAwRCP1Ojhbr6Uf4yUwxDdlJmOqJpSOokBZBvTv5U32zYpeGYa61zLQ9YS7i8fGmvp5k62mAZ+GwJX7td9WI7SePXAyv3d9NGZLwLwsFyzejq+bi0vjcGnXzQ8+8rNcWbiZxN5oCoBvNSVXTy8OzcMcJfGMylLAaDmuorF/0L/61NoMv6U/CgsGPsYjbk+Xp2yfi0M+e4FubegQ0QDuEYNQg6BpzuZUIm+IYy4jQGViN1be1mwm0/hQOGJcGjzluTClq1W06JO8iwyDo7tE4XIRyb75Pw2QvYwaxlHUPmmZkSsUokzU6emaOcKQxF4cmGbYTmd6SFlhVmkZmt+N7LJz4a3fmJ83qQC0juwowdzooXGYz6MV1YTo6dp9vfr+VqeBqbGQ08tPv89QSmTWHqcvVq3xJM8GRB92E0ntcsn0PHguq/a7441lNEqgDH+g9kzbygSkgRapbVkMFjwimh7y8tyKiCli26S/oYYNLWnGfm5LDij4PaZ0meIJe6yqURpZmIhIhIK2X0wMU6VSPA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39860400002)(396003)(376002)(66946007)(64756008)(6506007)(2906002)(5660300002)(83380400001)(71200400001)(4326008)(6486002)(7416002)(44832011)(478600001)(6512007)(186003)(33656002)(8936002)(2616005)(66476007)(316002)(36756003)(8676002)(54906003)(53546011)(66556008)(86362001)(966005)(66446008)(76116006)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?d3dKa3Y3bGZzUGF2eGZKZGlveWs0c21VU1BlcGNBaDU4WEd4cEc0ZDNEM2lX?=
 =?utf-8?B?UTk1OWZac0lqSm90RGY1SjdseTNjMitpUVlPU05nK1Y0WUZiQjMxQ2FyOTUx?=
 =?utf-8?B?UzlnUUo2UXdmVCsyMTNvVms4MHM5MDJlT3JQQW81eHNjUjNsaUppWnFTNS85?=
 =?utf-8?B?c05hR21Qd2NJZFJrWkpuNm11NHJYb3dreEZTOUZGTTJLSzFnbDQzV3JhSllB?=
 =?utf-8?B?b01OdDlLRUlUdXgwSTl5VUlwRXJNK1Q4UGRtaVNGZE80NW1TTmNvaXpWSXh4?=
 =?utf-8?B?cmt1WlBSbmErMjg0MTdtcmVCbGZpd2Ruc01VMnNSaVY5K2ExazBvMExka0ZH?=
 =?utf-8?B?djg0b3B2dE5SZFcyL2ZWSll0NTJJK0szYWkvb3RSTjFna2JiN25YWk1nZHcx?=
 =?utf-8?B?MU1qUG1yMEVHKzBwajBYSzNZTDJ2Y284Q3YwL284aURUQUREc3duWXNOcWpk?=
 =?utf-8?B?OWRmK2NKLzUyWGVWOHdrM3dQdGh5NTZPOWwvVGZST2ZYRkdyOEQ4cTQ4enU0?=
 =?utf-8?B?cDZRSFlOMkp1UzFNNWwvNVR6Z2cyV0k1cXF2RzFVWUNuYXRDQU5adzBoZ3Rj?=
 =?utf-8?B?YW9GcjF2ZXJOeWpKTnliYytleitHL2wrMVNsTUsyTDVrd0RzcGVKVGhEc0FG?=
 =?utf-8?B?aGJ3T2FqOGZBQ2VOOHhONitwVVBoc3h3SlAwNTFaTGc3bFkydVNBU2l4bHBQ?=
 =?utf-8?B?aE1tRlhHMGFueUJCbXBjMXhiYjZ0VlB1THhPaFV5aURCMG5Nc0lXd2JLSS8w?=
 =?utf-8?B?aDlMemRnRks3TkF6RENJaUhVcWR5T1NqVlF1cGpIRWJzY2RtK0xaWFduYUFn?=
 =?utf-8?B?eVM0N2EyamlNNExRNFEyUjNMTS9xWnF1UzRWRnZFUEM4UzdmajdzVk1rNHZE?=
 =?utf-8?B?dG10cTNMMGh0SkVzL2lmWGVvTzVHOVdrYzNVSFBIcnk3WVprMGZHdGtmNUtL?=
 =?utf-8?B?U3FKMXZQTlpkZmNncjh0UVRuaXZBY0FleDJyWk96dU8yZ3EyRGFlYWNlbGla?=
 =?utf-8?B?SGhKaVpOMlNqdnkyOFlaZU05REVYTHRUVEtjMDZEVHM5RDBwUVBFeEdFOVU0?=
 =?utf-8?B?QXdydVJIbmlLSlpsakhrVjJ3VWQ2VkZNbHYxM3hEcTRhR0lMU1ZWTXh0TDR2?=
 =?utf-8?B?cmE1Q3ZxZFJQbFhTTy8xOE5mbHowcVJjZnpsdXJvMXdmZ3Z5cW1jaWMyU2Q4?=
 =?utf-8?B?ZEVUN01vVkIvTG8wYnF4YVloT3R6bExNb3FvSlM3dS9HbDlBZ3JtWm1WQkFy?=
 =?utf-8?B?MjJGeU9IWUFLS2xzbGVkWS9pZkd1WHo2V0hLVXFCTUZmYVZueWIrUmdYWDVp?=
 =?utf-8?B?VUV2MXhnVlFuekZPZzdCMmtKbTdXcG9RamRMbC9pUXltVGNoVG1SUDVKZWs5?=
 =?utf-8?B?cm5wU053d2NzK3VPR1cwUHFXM3RIZ2d0QmRPOVVFbUNVQnJCNmpJZ0ZKYlBo?=
 =?utf-8?B?dkRHOU9vdXQ3RE1qa2pETnZaUUV3cWhkM2NxQVBsM05TYU5xcFdFcHZLUnNt?=
 =?utf-8?B?QUJjcGlINHVLb0xzSCtURVg4cWp5eWdmLzRtcXpxMzNqMEs4RlRQRUJWMSty?=
 =?utf-8?B?bmNzUXYrMkFKd0ZmeVI1S29xZjQrM3UrKzhaYmFCUVdObExHUGRYenk0a0I0?=
 =?utf-8?B?VzBORXd1UXRzb0tWZTlKRHUweHRTbXppNVVFS2NSMlNiNnpJbEp3ejFsOExF?=
 =?utf-8?B?ekJCczNjRC84TGZpY25kbUticy9RYkh0ZUlRNWl4YU4yZG8xY1lXeW9rQ0Zh?=
 =?utf-8?B?ZFVPclBUYXRqYWdLbkRrT09qMlJLazlBa1lFc1Q0VFNHc081V3MwU3ljeW5D?=
 =?utf-8?B?UVZRTVhMV1RQU0NoSEpxVkM5eTVGc1VCTExVWW4yd1p6TWYwL3YxVW5yMFFI?=
 =?utf-8?B?RXpneFZhT25Lbm5sQTd3alBRMkxtZkVIbEZGSjJFSFhNR2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <273941A5A6B02A479D3FF25660750550@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fd65fc-b820-4ce9-35c2-08d8cc68397c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 19:32:08.4712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhQQrGDI5BlwhKO+9M+1++BMm2WvKny5URQ19MoWm/UB7M2t1qY1lmNNNdo4qlRfgEJOgJqVSnjJt2Z+Gkd9+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4354
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080116
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDgsIDIwMjEsIGF0IDU6MDIgQU0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyLzgvMjEgMTA6MjcgQU0sIFN0
ZWZhbiBIYWpub2N6aSB3cm90ZToNCj4+IE9uIFNhdCwgRmViIDA2LCAyMDIxIGF0IDA1OjAzOjIw
UE0gKzAwMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+Pj4gT24gRnJpLCA1IEZlYiAyMDIxIGF0
IDIyOjUzLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0K
Pj4+PiANCj4+Pj4gT24gRnJpLCA1IEZlYiAyMDIxIGF0IDE2OjQ1LCBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IGUyYzUwOTNjOTkzZWY2NDZlNGUyOGY3YWE3ODQyOTg1M2Jj
YzA2YWM6DQo+Pj4+PiANCj4+Pj4+ICBpb3Rlc3RzOiAzMDogZHJvcCBmcm9tIGF1dG8gZ3JvdXAg
KGFuZCBlZmZlY3RpdmVseSBmcm9tIG1ha2UgY2hlY2spICgyMDIxLTAyLTA1IDE1OjE2OjEzICsw
MDAwKQ0KPj4+Pj4gDQo+Pj4+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoNCj4+Pj4+IA0KPj4+Pj4gIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11LmdpdCB0
YWdzL2Jsb2NrLXB1bGwtcmVxdWVzdA0KPj4+Pj4gDQo+Pj4+PiBmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gYjA3MDExZjM3NWJkYTMzMTljZjcyZWVlN2NiMThkMzEwMDc4Mzg3YjoNCj4+
Pj4+IA0KPj4+Pj4gIGRvY3M6IGZpeCBQYXJhbGxlbHMgSW1hZ2UgImRpcnR5IGJpdG1hcCIgc2Vj
dGlvbiAoMjAyMS0wMi0wNSAxNjozNjozNiArMDAwMCkNCj4+Pj4+IA0KPj4+Pj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4+Pj4gUHVsbCByZXF1ZXN0DQo+Pj4+PiANCj4+Pj4+IHYzOg0KPj4+Pj4gKiBSZXBsYWNlIHsw
fSBhcnJheSBpbml0aWFsaXphdGlvbiB3aXRoIHt9IHRvIG1ha2UgY2xhbmcgaGFwcHkgW1BldGVy
XQ0KPj4+Pj4gDQo+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+IA0KPj4+PiANCj4+Pj4gRmFpbHMgJ21ha2Ug
Y2hlY2snIG9uIHMzOTB4IGhvc3Q6DQo+Pj4gDQo+Pj4gSSBnYXZlIHRoaXMgYSByZXJ1biB0byBj
aGVjayBpdCB3YXMgcmVwcm9kdWNpYmxlIChpdCBpcykgYW5kIHJlYWxpc2VkDQo+Pj4gSSBtaXNz
ZWQgd2hhdCBsb29rcyBsaWtlIGFuIGltcG9ydGFudCBsaW5lIGluIHRoZSBsb2cuIEFzIHVzdWFs
LA0KPj4+IHRyeWluZyB0byBkaXNlbnRhbmdsZSB3aGljaCBsaW5lcyBvZiBhIHBhcmFsbGVsIG1h
a2UgY2hlY2sgY29ycmVzcG9uZA0KPj4+IHRvIHRoZSBmYWlsdXJlIGlzIHByZXR0eSB0cmlja3ks
IGJ1dCB0aGUgbGluZXMNCj4+PiBUeXBlICdyZW1vdGUtcGNpaG9zdCcgaXMgbWlzc2luZyBpdHMg
cGFyZW50ICdwY2llLWhvc3QtYnJpZGdlJw0KPj4+IA0KPj4+IGFyZSBwcm9iYWJseSB0aGUgcHJv
eGltYXRlIGNhdXNlcyBvZiB0aGUgYXNzZXJ0aW9uIGZhaWx1cmVzLg0KPj4+IA0KPj4+IE1BTExP
Q19QRVJUVVJCXz0ke01BTExPQ19QRVJUVVJCXzotJCgoICR7UkFORE9NOi0wfSAlIDI1NSArIDEp
KX0NCj4+PiBRVEVTVF9RRU1VX0lNRz0uL3FlbXUtaW1nDQo+Pj4gR19URVNUX0RCVVNfREFFTU9O
PS9ob21lL3VidW50dS9xZW11L3Rlc3RzL2RidXMtdm1zdGF0ZS1kYWVtb24uc2gNCj4+PiBRVEVT
VF9RRU1VX0JJTkFSWT0uL3FlbXUtc3lzdGVtLXJ4IHRlc3RzL3F0ZXN0L3Fvcy10ZXN0IC0tdGFw
IC1rDQo+Pj4gUEFTUyA0NSBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1tZW1v
cnktc2l6ZS1zdW1tYXJ5DQo+Pj4gU0tJUA0KPj4+IE1BTExPQ19QRVJUVVJCXz0ke01BTExPQ19Q
RVJUVVJCXzotJCgoICR7UkFORE9NOi0wfSAlIDI1NSArIDEpKX0NCj4+PiBRVEVTVF9RRU1VX0lN
Rz0uL3FlbXUtaW1nDQo+Pj4gR19URVNUX0RCVVNfREFFTU9OPS9ob21lL3VidW50dS9xZW11L3Rl
c3RzL2RidXMtdm1zdGF0ZS1kYWVtb24uc2gNCj4+PiBRVEVTVF9RRU1VX0JJTkFSWT0uL3FlbXUt
c3lzdGVtLXMzOTB4IHRlc3RzL3F0ZXN0L3B4ZS10ZXN0IC0tdGFwIC1rDQo+Pj4gUEFTUyA0NiBx
dGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1tZW1vcnktZGV2aWNlcw0KPj4+IFR5
cGUgJ3JlbW90ZS1wY2lob3N0JyBpcyBtaXNzaW5nIGl0cyBwYXJlbnQgJ3BjaWUtaG9zdC1icmlk
Z2UnDQo+Pj4gUEFTUyA0NyBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1yZXBs
YXkNCj4+PiBQQVNTIDQ4IHF0ZXN0LXJ4L3FtcC1jbWQtdGVzdCAvcngvcW1wL3F1ZXJ5LXlhbmsN
Cj4+PiBQQVNTIDQ5IHF0ZXN0LXJ4L3FtcC1jbWQtdGVzdCAvcngvcW1wL3F1ZXJ5LW5hbWUNCj4+
PiBQQVNTIDUwIHF0ZXN0LXJ4L3FtcC1jbWQtdGVzdCAvcngvcW1wL3F1ZXJ5LWlvdGhyZWFkcw0K
Pj4+IFBBU1MgNTEgcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9yeC9xbXAvcXVlcnktZmRzZXRzDQo+
Pj4gUEFTUyA1MiBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1jb21tYW5kLWxp
bmUtb3B0aW9ucw0KPj4+IFBBU1MgNTMgcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9yeC9xbXAvcXVl
cnktYWNwaS1vc3BtLXN0YXR1cw0KPj4+IFBBU1MgNTQgcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9y
eC9xbXAvb2JqZWN0LWFkZC1mYWlsdXJlLW1vZGVzDQo+Pj4gTUFMTE9DX1BFUlRVUkJfPSR7TUFM
TE9DX1BFUlRVUkJfOi0kKCggJHtSQU5ET006LTB9ICUgMjU1ICsgMSkpfQ0KPj4+IFFURVNUX1FF
TVVfSU1HPS4vcWVtdS1pbWcNCj4+PiBHX1RFU1RfREJVU19EQUVNT049L2hvbWUvdWJ1bnR1L3Fl
bXUvdGVzdHMvZGJ1cy12bXN0YXRlLWRhZW1vbi5zaA0KPj4+IFFURVNUX1FFTVVfQklOQVJZPS4v
cWVtdS1zeXN0ZW0tczM5MHggdGVzdHMvcXRlc3QvdGVzdC1uZXRmaWx0ZXIgLS10YXANCj4+PiAt
aw0KPj4+IFR5cGUgJ3JlbW90ZS1wY2lob3N0JyBpcyBtaXNzaW5nIGl0cyBwYXJlbnQgJ3BjaWUt
aG9zdC1icmlkZ2UnDQo+Pj4gc29ja2V0X2FjY2VwdCBmYWlsZWQ6IFJlc291cmNlIHRlbXBvcmFy
aWx5IHVuYXZhaWxhYmxlDQo+Pj4gc29ja2V0X2FjY2VwdCBmYWlsZWQ6IFJlc291cmNlIHRlbXBv
cmFyaWx5IHVuYXZhaWxhYmxlDQo+Pj4gKioNCj4+PiBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9s
aWJxdGVzdC5jOjMwODpxdGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZToNCj4+PiBhc3Nl
cnRpb24gZmFpbGVkOiAocy0+ZmQgPj0gMCAmJiBzLT5xbXBfZmQgPj0gMCkNCj4+PiAqKg0KPj4+
IEVSUk9SOi4uLy4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6MzA4OnF0ZXN0X2luaXRfd2l0aG91
dF9xbXBfaGFuZHNoYWtlOg0KPj4+IGFzc2VydGlvbiBmYWlsZWQ6IChzLT5mZCA+PSAwICYmIHMt
PnFtcF9mZCA+PSAwKQ0KPj4+IC4uLy4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6MTgxOiBraWxs
X3FlbXUoKSBkZXRlY3RlZCBRRU1VIGRlYXRoIGZyb20NCj4+PiBzaWduYWwgNiAoQWJvcnRlZCkg
KGNvcmUgZHVtcGVkKQ0KPj4+IC4uLy4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6MTgxOiBraWxs
X3FlbXUoKSBkZXRlY3RlZCBRRU1VIGRlYXRoIGZyb20NCj4+PiBzaWduYWwgNiAoQWJvcnRlZCkg
KGNvcmUgZHVtcGVkKQ0KPj4+IEVSUk9SIHF0ZXN0LXMzOTB4L3B4ZS10ZXN0IC0gQmFpbCBvdXQh
DQo+Pj4gRVJST1I6Li4vLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzozMDg6cXRlc3RfaW5pdF93
aXRob3V0X3FtcF9oYW5kc2hha2U6DQo+Pj4gYXNzZXJ0aW9uIGZhaWxlZDogKHMtPmZkID49IDAg
JiYgcy0+cW1wX2ZkID49IDApDQo+Pj4gRVJST1IgcXRlc3QtczM5MHgvdGVzdC1uZXRmaWx0ZXIg
LSBCYWlsIG91dCENCj4+PiBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOjMwODpx
dGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZToNCj4+PiBhc3NlcnRpb24gZmFpbGVkOiAo
cy0+ZmQgPj0gMCAmJiBzLT5xbXBfZmQgPj0gMCkNCj4+PiBNYWtlZmlsZS5tdGVzdDozMTEzOiBy
ZWNpcGUgZm9yIHRhcmdldCAncnVuLXRlc3QtMzg3JyBmYWlsZWQNCj4+PiBtYWtlOiAqKiogW3J1
bi10ZXN0LTM4N10gRXJyb3IgMQ0KPj4+IG1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVk
IGpvYnMuLi4uDQo+Pj4gTWFrZWZpbGUubXRlc3Q6MzEyMTogcmVjaXBlIGZvciB0YXJnZXQgJ3J1
bi10ZXN0LTM4OCcgZmFpbGVkDQo+PiANCj4+IEhpIEVsZW5hIGFuZCBKYWcsDQo+PiBQbGVhc2Ug
dGFrZSBhIGxvb2sgYXQgdGhpcyBRT00gZmFpbHVyZS4gSSBndWVzcyByZW1vdGUtcGNpaG9zdCBp
cyBiZWluZw0KPj4gYnVpbHQgYnV0IHBjaWUtaG9zdC1icmlkZ2UgaXMgbWlzc2luZyBmcm9tIHRo
ZSBzMzkweC1zb2Z0bW11IHRhcmdldC4NCg0KSGkgQWxsLA0KDQpUaGFuayB5b3UgZm9yIGxldHRp
bmcgdXMga25vdyBhYm91dCB0aGlzIGJ1aWxkIGlzc3VlISBXZSBhcmUgd29ya2luZyBvbiByZXNv
bHZpbmcgaXQuDQoNCldlIHdvdWxkIGxpa2UgdG8gZW5zdXJlIHRoYXQgdGhlIG5leHQgdmVyc2lv
biB3ZSBzZW5kIGRvZXNu4oCZdCBjYXVzZSB0b28gbWFueQ0KcHJvYmxlbXMgbGlrZSB0aGlzLiBT
aG91bGQgdGhlIFRyYXZpcy9HaXRMYWIgQ0kgaGF2ZSBjYXVnaHQgdGhpcyBwcm9ibGVtPw0KDQpX
ZSByYW4gdGhlIGZvbGxvd2luZyB0ZXN0cyBiZWZvcmUgc2VuZGluZyB0aGUgcGF0Y2hlcyBvdXQg
Zm9yIHJldmlldzoNCi0g4oCcbWFrZSBkb2NrZXLigJ0NCi0gVHJhdmlzIENJICh3aWxsIHVzZSBH
aXRMYWIgZ29pbmcgZm9yd2FyZCkNCi0gVGVzdHMgaW4gdGhlIOKAnHRlc3RzL2FjY2VwdGFuY2Xi
gJ0gZm9sZGVyLg0KDQpJcyB0aGVyZSBhbnkgb3RoZXIgdGVzdHMgd2UgY291bGQgcnVuIGJlZm9y
ZSBzZW5kaW5nIHRoZSBuZXh0IHJldmlzaW9uPw0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KLS0N
CkphZw0KDQo+IA0KPiBGaXggc3VnZ2VzdGVkIGhlcmU6DQo+IGh0dHBzOi8vd3d3Lm1haWwtYXJj
aGl2ZS5jb20vcWVtdS1ibG9ja0Bub25nbnUub3JnL21zZzgwNTM2Lmh0bWwNCj4gDQo+IEJ1dCBi
ZXNpZGUgdGhlIGZpeCB3aGF0IHdvdWxkIGJlIGJldHRlciBpcyB0byByZXN0cmljdCB0aGlzIGZl
YXR1cmUNCj4gd2hlcmUgaXQgbWFrZXMgc2Vuc2UgKHdlIGFyZSBoYXZpbmcgaGFyZCB0aW1lIGJ1
aWxkaW5nL3Rlc3RpbmcgYWxsDQo+IGZlYXR1cmVzLCBiZXR0ZXIgZW5hYmxlIG5ldyBvbmVzIHdo
ZXJlIHRoZXkgYXJlIHVzZWQpLg0KPiANCj4gV291bGQgaXQgYmUgZW5vdWdoIHRvIGVuYWJsZSB0
aGlzIGZlYXR1cmUgb24gWDg2IGhvc3RzL3RhcmdldHMgZm9yDQo+IG1haW5zdHJlYW0gQ0k/DQo+
IA0KPiBUaGFua3MsDQo+IA0KPiBQaGlsLg0KPiANCg0K


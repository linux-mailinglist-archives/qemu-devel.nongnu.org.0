Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8D33153CA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:27:00 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Vqs-0002lG-Me
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l9VnV-0000SZ-Dj; Tue, 09 Feb 2021 11:23:30 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l9VnL-0003AF-LA; Tue, 09 Feb 2021 11:23:28 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119FebsT141660;
 Tue, 9 Feb 2021 16:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=jw8Wws/pcXTR1LfsXjzfOTwg6fuW25fitWTwE7VGuTk=;
 b=teDhHNMKWIiF3RvkVcRMiryyYStQtr6LWdKS3Rq13ZyRzRygX+5q0FoVf7QDxX/kr+/l
 75hLseAnMkpS+CxjoXPsuec9pZkLyQvkEuPbY5t2g70r3bi2SAhQC3AImQK7d8MStqpu
 CfMllzT8EmWMPWN/bbk8Ex827gdY/TT5QWh+1bTzGOjwu4UA6jSL5QwJxo6vr11q00jQ
 ZJjSN4K6QyuM2y04kQ7LWA2Ep01AyIofGtNarLLYrd7tb0PTaan1272gseio0mJdABkg
 nPhIVlYeZtMSzUDX89dsXi24njh8DjGRsko6wnEPD6i+oWm2Sb+w7ROqc9EKkISzTNwa qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 36hjhqr3u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 16:22:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119Fdu4P007700;
 Tue, 9 Feb 2021 16:22:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3030.oracle.com with ESMTP id 36j4pnww44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 16:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7uhXarn7Ex5u4AQajXNUdyC+ZQKAC1UtNoD9MwJRVvjJU0fbn0Zga8yjCW9Dew/1nFjAp50EjfRtnpOFC3cGv2H4zzU8Ll6AQAJfxbSTsExR+p7MRAY4KNelF7/SBwvUkDceL0LqqHGrWZqUKUKxmVSGR4DF3Hq/ZSXn0zvUTwq0+E/jkmHFr13lTz9bLMxY0ueoJegH9f44afgiNvMTW24fBPQdGZqzxs3RwDr3HLC1meVcKw8ipCk9P2RRlif6kC2k8q2i1XiuWtwBYaMEj7LfuGGG5aw2wjFcej58MgriomkUB4cnYrZU5zcgu2DQji4ikR58YaHO1qy+Z/ukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw8Wws/pcXTR1LfsXjzfOTwg6fuW25fitWTwE7VGuTk=;
 b=V7gWaTM5TKKRMUOnwHY+QggXtnYYgDgb3cyKqoef1vKWoO2kd8cJ5kefWc0Aqzbr0FDLeKKj6eg4koDESfDV3fyssJdRQU7iCpRzfLmK2URTm3iHFIUHgSYWopzWlg4bQlVBm8Qz5ZZupbXK4lVeoW2Md7/Kzp9MiItxO559NSi1PH5yBGhmUL16oqR1nD38v2cD6nqlS9WtFT35zMsIs5LX4KFKcPoe19ngXLGTeMq6U2OOoVnr2ZxgtiJR7n5+No7fjfC/1oh9bi0G60tGT+mayJZ6ELfpoeS4LngLo1fskKK7RSR0uUfQx7ybndnWbymVBfuboVBK7eVRkbJ5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw8Wws/pcXTR1LfsXjzfOTwg6fuW25fitWTwE7VGuTk=;
 b=yCZIh6dU3X41inv/CZpY8wpTsMrwxaDQew7gBT7lqW9TFNz9fLM8NOGoyOAxP0uKytCf9ScP8jGFHv0iGiErF+wZ2LKIkvyQCpFaHrMuGgB2GlQq8lX3cJwQhzEwPODlytmRcfNqiPgMkLlRjALd2aCUZVwAsfdDrzSsERc6m20=
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4445.namprd10.prod.outlook.com (2603:10b6:a03:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 16:22:55 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 16:22:55 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL v3 00/27] Block patches
Thread-Topic: [PULL v3 00/27] Block patches
Thread-Index: AQHW+95L6XC+x9ihZ0Kxh/hf9tcM4qpKK9KAgAEwYgCAAqVFgIAACfCAgACszQCAAKKfAIAArREA
Date: Tue, 9 Feb 2021 16:22:54 +0000
Message-ID: <1122A6BB-2BF4-4035-BBC2-9484FC2DCD81@oracle.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
 <20210208092723.GA18298@stefanha-x1.localdomain>
 <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
 <20210208202126.GA12348@stefanha-x1.localdomain>
 <dd37517e-abaf-2713-d78e-c6d1f64bac2e@redhat.com>
In-Reply-To: <dd37517e-abaf-2713-d78e-c6d1f64bac2e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:49be:4450:cbed:f9f4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 841e9ce5-513c-4f48-4feb-08d8cd16f4d1
x-ms-traffictypediagnostic: SJ0PR10MB4445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR10MB444587151C160E5B98D15105908E9@SJ0PR10MB4445.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5yq2s/dcb+yuesz8GT2nJmkAnheINsCOEaC/sOLyZkDC2lh+nNbNe8NdUqxVL4mWmG9UmjMY0wTcGafBN3ypymluBTGEd75LoJQiviodSjawexworz1oswNmz4C49/9QGuDq2y+dDHyrf3KtmhuLYLQxCGMwM1w/LyHxm3AAAUrOYJUlM4P/6B85zd76x6aVwdPaFZtwBnGgQBNMgjgholchugxIeCD9Xx6dOIdQx3cuD/SL+d8QQvhnASf+ak0wAmjJ3IU7W8NWVSNKomJbqGZZKsPPNPgy1tkNS+l9uzi+OD8r/aGuHdNEIUo6bjhSwlTvH4B2a6k426vqrWefvhxvYUl4MQ00U0d3LnZqrxvw9DMeiQRA4LAmT+Z+EC1MIdJJB0xemKGJmo5ts8Nanc3mYD3CxNbXqDi2z23x5xfsPzj82rlJBaEXINhCBH+IZwwScckECp2HnZwlCN3L5XUy2EbXz6zKn09U4pSVGOBsvUzG5jLCaKraPDwlWKmOE6fcJAGiiOw4IMpMeHnWhNIDUv9rkBzGLcoGAC44GztSxCDdImTPSKxg+MnRL871EJ+7Tr6ZkVaKm8ivGMs6eLQNGHe265ATjhQt5ZamQScTThAyXh65Z0DGCXwBXtZXQvlsu/fiCtg/SY/QnkQvBBvRQBHL3ouOYh9jQERgvlo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(6486002)(186003)(86362001)(966005)(36756003)(7416002)(83380400001)(2616005)(2906002)(4326008)(76116006)(33656002)(316002)(66556008)(64756008)(66446008)(66946007)(71200400001)(66476007)(6512007)(5660300002)(6916009)(53546011)(6506007)(8676002)(8936002)(478600001)(44832011)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MjRCRXhISGhLek5GUnk2NUxaYis1KzRSUEFUdmhJNE5QWjBRT0hKbVExYVpk?=
 =?utf-8?B?QWNQNXByYUFXMmIraFUzWTFQWFg5c0hDZU9jNDRFZmtGdDBsUmVVMmRtNXht?=
 =?utf-8?B?UTFhUk1rWllkUkUyWTdGOVBsUEVtOEJ2anpiKzVWamVvR1ZDUzc1Qmh3SUJD?=
 =?utf-8?B?SHdDc2NpSm1UWjFpV0ZWcHJ6TnBaUmM3RmhDeFlVUlI2Y3pwNkprbkMwNGs3?=
 =?utf-8?B?aHFqUTlrcE5RWTAzYi93QTJsYkZIbmFxcFVnSUNCMlZ0eEFwa2FIcTlhQS85?=
 =?utf-8?B?Mm9zWFNDWlpXMFEzWU9vbUIydXcyNitydDlsQnpHTFpKV0t1eXhlM0NMTXBn?=
 =?utf-8?B?bksvbU0xSG1SMzdlRWFyNUxUV0kxUWdLUElCVlQ2bXkyckM1cGtrR2pSWjJP?=
 =?utf-8?B?Q082bk5xVzlocGcxdjRWUkhzcEc4Y2toeXQwTXBwNGJqMytyd2k5ZzVJWno0?=
 =?utf-8?B?SWdWLzlHNGNHcG8zbS9tK0NFY1ZoeE5mbWZvYWRiS2oxR2tLWkZtL3gySnJk?=
 =?utf-8?B?b3gwbFVsZGc5eVVtcXVLSWRRbEpLaGxoTkhLdlN1VHZNeUJiSWRiZk11MmtC?=
 =?utf-8?B?Q2tLclZRVElRUzV0THRac0h5VFY1ZHhCVnZZK3pWalBCSW8vd3M0bmh3L3NE?=
 =?utf-8?B?a3FrSS8vbU5hQjhmdjQ4TkZFcm5pRWNqSThEdThRR29qVk5rekVzS2M1NlF4?=
 =?utf-8?B?dTNxY0U4TVpPYThnWG5TaUVlSFduVlVOdkk4Rm84djViZFNVNnFKVHFyek1V?=
 =?utf-8?B?Z3RRSmxUZVNtZjRvQkFQcXBWaThPVFF0SmZrVDZRVzdBSkdOV1RsYzgyMkZS?=
 =?utf-8?B?TC9paGNxcnFhWTJmVW14OFRMUnBiOHFialZjWEhZUUhqRmxtdSs2KzlEQXR4?=
 =?utf-8?B?TkllTGIyNWNXYUVSa2VKY24zVzl0NU9aTFI4bFFLNW5SK1dZam1RSU1mRGFa?=
 =?utf-8?B?bUFGSzlRV2c0dzdwOHMwZysrOXh4UjFteWRxZkp2SFEvQWZoUU5NZlBiWjdK?=
 =?utf-8?B?b0UwR0dMUDQyNVl6azlVRDY0M2dUSFlsQjk4Vk9WRk45N2JtcytkTUZ6bGl1?=
 =?utf-8?B?K25HamRzVXVScEZMS2dXaG1KZXdjWEJCeDRiclhrVWN4YzVpK0d5NVNrR0h4?=
 =?utf-8?B?dFBoSFp6QjRtWjFDZmFJSXNtdlYzWHFKL2pYSnlkTUhZZGhlUVNTcXhTT29X?=
 =?utf-8?B?SnBoVUpxWWp2bFE1aHM2VW90VExra1pTNzkrNEtMOXp1T0dLandQTFRJY2Nr?=
 =?utf-8?B?c01VN3ZEUXJJY2FvcjFyZWh5V3kxSkhwdDZlQXRmeDVubFM5QW1Oc21acmJM?=
 =?utf-8?B?aURDVlQxd3hwYmhaUnh4RmZOQmIyaVFMQjVoVlRobFpibm9zNUhUS0tJVS80?=
 =?utf-8?B?ZGg5dFJKWHV2UHlKQWVVOXdIWWlzbjFaSk15TW9YaFZTTUdiNDR4R2w2UDY2?=
 =?utf-8?B?aFNWWFFROG05ejYvZnZmVFIxTkdCSzZodzNBR2hzVXNtSm9uQTZ4ZG1TOVc2?=
 =?utf-8?B?dDk1WWRvMWJ3aVp4UjJqbDZIVGduQjljdDRxYklhT1JCemZDQis1K1l6MDZi?=
 =?utf-8?B?UGNSVWx4bXJRWVZlT0o2T01LT203QnBZQXhuK2ZQd0VJMWVRQVh6YlMrQWJY?=
 =?utf-8?B?ZUNwK092WEJJZXdkazZUbE45dzVVcXpNakFFR1AyNVhJbmduZ01jYVFPWDBj?=
 =?utf-8?B?SjRRODN1ODFwRy9GT2ZuNGpSN0ZMcDM4NHo2RjFjVktjaTRUeE1zekdEbDMz?=
 =?utf-8?B?dFBjWHVKbFlsTlUvNDRQYXQ2WXhTVXFBTjhQTG5RUUhjYkN6ejlzSEtYQklG?=
 =?utf-8?B?QnlWUC9qSFVPWmRBbFhRNWVTMFZiY1o0cVU5VkhMQVJHU2RWbFhwdTV3cDY3?=
 =?utf-8?B?ZEpINFZBVWFZYVRaaHhlRGx4cjJtb2ZEKzA0VnRZblIrZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFE5ECF722FB0545B57E487C51ED090D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841e9ce5-513c-4f48-4feb-08d8cd16f4d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 16:22:54.9200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxBE23ShXuTLPun/jQ+Obee6ZP2iC4FWP8bap5GFYfqTGwWPn0iM4CgWwISCTt4M8fNOFhR9P0hL0fArLWKzIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4445
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090081
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
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Denis V.
 Lunev" <den@openvz.org>, =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDksIDIwMjEsIGF0IDE6MDMgQU0sIFRob21hcyBIdXRoIDx0aHV0aEByZWRo
YXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDA4LzAyLzIwMjEgMjEuMjEsIFN0ZWZhbiBIYWpub2N6
aSB3cm90ZToNCj4+IE9uIE1vbiwgRmViIDA4LCAyMDIxIGF0IDExOjAyOjU3QU0gKzAxMDAsIFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+IE9uIDIvOC8yMSAxMDoyNyBBTSwgU3Rl
ZmFuIEhham5vY3ppIHdyb3RlOg0KPj4+PiBPbiBTYXQsIEZlYiAwNiwgMjAyMSBhdCAwNTowMzoy
MFBNICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0KPj4+Pj4gT24gRnJpLCA1IEZlYiAyMDIx
IGF0IDIyOjUzLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdyb3Rl
Og0KPj4+Pj4+IA0KPj4+Pj4+IE9uIEZyaSwgNSBGZWIgMjAyMSBhdCAxNjo0NSwgU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTJjNTA5M2M5OTNlZjY0NmU0ZTI4Zjdh
YTc4NDI5ODUzYmNjMDZhYzoNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICAgaW90ZXN0czogMzA6IGRyb3Ag
ZnJvbSBhdXRvIGdyb3VwIChhbmQgZWZmZWN0aXZlbHkgZnJvbSBtYWtlIGNoZWNrKSAoMjAyMS0w
Mi0wNSAxNToxNjoxMyArMDAwMCkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IGFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gICBodHRwczovL2dpdGxh
Yi5jb20vc3RlZmFuaGEvcWVtdS5naXQgdGFncy9ibG9jay1wdWxsLXJlcXVlc3QNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiMDcwMTFmMzc1YmRhMzMx
OWNmNzJlZWU3Y2IxOGQzMTAwNzgzODdiOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gICBkb2NzOiBmaXgg
UGFyYWxsZWxzIEltYWdlICJkaXJ0eSBiaXRtYXAiIHNlY3Rpb24gKDIwMjEtMDItMDUgMTY6MzY6
MzYgKzAwMDApDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4+IFB1bGwgcmVxdWVz
dA0KPj4+Pj4+PiANCj4+Pj4+Pj4gdjM6DQo+Pj4+Pj4+ICAqIFJlcGxhY2UgezB9IGFycmF5IGlu
aXRpYWxpemF0aW9uIHdpdGgge30gdG8gbWFrZSBjbGFuZyBoYXBweSBbUGV0ZXJdDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gRmFpbHMgJ21ha2Ug
Y2hlY2snIG9uIHMzOTB4IGhvc3Q6DQo+Pj4+PiANCj4+Pj4+IEkgZ2F2ZSB0aGlzIGEgcmVydW4g
dG8gY2hlY2sgaXQgd2FzIHJlcHJvZHVjaWJsZSAoaXQgaXMpIGFuZCByZWFsaXNlZA0KPj4+Pj4g
SSBtaXNzZWQgd2hhdCBsb29rcyBsaWtlIGFuIGltcG9ydGFudCBsaW5lIGluIHRoZSBsb2cuIEFz
IHVzdWFsLA0KPj4+Pj4gdHJ5aW5nIHRvIGRpc2VudGFuZ2xlIHdoaWNoIGxpbmVzIG9mIGEgcGFy
YWxsZWwgbWFrZSBjaGVjayBjb3JyZXNwb25kDQo+Pj4+PiB0byB0aGUgZmFpbHVyZSBpcyBwcmV0
dHkgdHJpY2t5LCBidXQgdGhlIGxpbmVzDQo+Pj4+PiAgVHlwZSAncmVtb3RlLXBjaWhvc3QnIGlz
IG1pc3NpbmcgaXRzIHBhcmVudCAncGNpZS1ob3N0LWJyaWRnZScNCj4+Pj4+IA0KPj4+Pj4gYXJl
IHByb2JhYmx5IHRoZSBwcm94aW1hdGUgY2F1c2VzIG9mIHRoZSBhc3NlcnRpb24gZmFpbHVyZXMu
DQo+Pj4+PiANCj4+Pj4+IE1BTExPQ19QRVJUVVJCXz0ke01BTExPQ19QRVJUVVJCXzotJCgoICR7
UkFORE9NOi0wfSAlIDI1NSArIDEpKX0NCj4+Pj4+IFFURVNUX1FFTVVfSU1HPS4vcWVtdS1pbWcN
Cj4+Pj4+IEdfVEVTVF9EQlVTX0RBRU1PTj0vaG9tZS91YnVudHUvcWVtdS90ZXN0cy9kYnVzLXZt
c3RhdGUtZGFlbW9uLnNoDQo+Pj4+PiBRVEVTVF9RRU1VX0JJTkFSWT0uL3FlbXUtc3lzdGVtLXJ4
IHRlc3RzL3F0ZXN0L3Fvcy10ZXN0IC0tdGFwIC1rDQo+Pj4+PiBQQVNTIDQ1IHF0ZXN0LXJ4L3Ft
cC1jbWQtdGVzdCAvcngvcW1wL3F1ZXJ5LW1lbW9yeS1zaXplLXN1bW1hcnkNCj4+Pj4+IFNLSVAN
Cj4+Pj4+IE1BTExPQ19QRVJUVVJCXz0ke01BTExPQ19QRVJUVVJCXzotJCgoICR7UkFORE9NOi0w
fSAlIDI1NSArIDEpKX0NCj4+Pj4+IFFURVNUX1FFTVVfSU1HPS4vcWVtdS1pbWcNCj4+Pj4+IEdf
VEVTVF9EQlVTX0RBRU1PTj0vaG9tZS91YnVudHUvcWVtdS90ZXN0cy9kYnVzLXZtc3RhdGUtZGFl
bW9uLnNoDQo+Pj4+PiBRVEVTVF9RRU1VX0JJTkFSWT0uL3FlbXUtc3lzdGVtLXMzOTB4IHRlc3Rz
L3F0ZXN0L3B4ZS10ZXN0IC0tdGFwIC1rDQo+Pj4+PiBQQVNTIDQ2IHF0ZXN0LXJ4L3FtcC1jbWQt
dGVzdCAvcngvcW1wL3F1ZXJ5LW1lbW9yeS1kZXZpY2VzDQo+Pj4+PiBUeXBlICdyZW1vdGUtcGNp
aG9zdCcgaXMgbWlzc2luZyBpdHMgcGFyZW50ICdwY2llLWhvc3QtYnJpZGdlJw0KPj4+Pj4gUEFT
UyA0NyBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1yZXBsYXkNCj4+Pj4+IFBB
U1MgNDggcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9yeC9xbXAvcXVlcnkteWFuaw0KPj4+Pj4gUEFT
UyA0OSBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1uYW1lDQo+Pj4+PiBQQVNT
IDUwIHF0ZXN0LXJ4L3FtcC1jbWQtdGVzdCAvcngvcW1wL3F1ZXJ5LWlvdGhyZWFkcw0KPj4+Pj4g
UEFTUyA1MSBxdGVzdC1yeC9xbXAtY21kLXRlc3QgL3J4L3FtcC9xdWVyeS1mZHNldHMNCj4+Pj4+
IFBBU1MgNTIgcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9yeC9xbXAvcXVlcnktY29tbWFuZC1saW5l
LW9wdGlvbnMNCj4+Pj4+IFBBU1MgNTMgcXRlc3QtcngvcW1wLWNtZC10ZXN0IC9yeC9xbXAvcXVl
cnktYWNwaS1vc3BtLXN0YXR1cw0KPj4+Pj4gUEFTUyA1NCBxdGVzdC1yeC9xbXAtY21kLXRlc3Qg
L3J4L3FtcC9vYmplY3QtYWRkLWZhaWx1cmUtbW9kZXMNCj4+Pj4+IE1BTExPQ19QRVJUVVJCXz0k
e01BTExPQ19QRVJUVVJCXzotJCgoICR7UkFORE9NOi0wfSAlIDI1NSArIDEpKX0NCj4+Pj4+IFFU
RVNUX1FFTVVfSU1HPS4vcWVtdS1pbWcNCj4+Pj4+IEdfVEVTVF9EQlVTX0RBRU1PTj0vaG9tZS91
YnVudHUvcWVtdS90ZXN0cy9kYnVzLXZtc3RhdGUtZGFlbW9uLnNoDQo+Pj4+PiBRVEVTVF9RRU1V
X0JJTkFSWT0uL3FlbXUtc3lzdGVtLXMzOTB4IHRlc3RzL3F0ZXN0L3Rlc3QtbmV0ZmlsdGVyIC0t
dGFwDQo+Pj4+PiAtaw0KPj4+Pj4gVHlwZSAncmVtb3RlLXBjaWhvc3QnIGlzIG1pc3NpbmcgaXRz
IHBhcmVudCAncGNpZS1ob3N0LWJyaWRnZScNCj4+Pj4+IHNvY2tldF9hY2NlcHQgZmFpbGVkOiBS
ZXNvdXJjZSB0ZW1wb3JhcmlseSB1bmF2YWlsYWJsZQ0KPj4+Pj4gc29ja2V0X2FjY2VwdCBmYWls
ZWQ6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVuYXZhaWxhYmxlDQo+Pj4+PiAqKg0KPj4+Pj4gRVJS
T1I6Li4vLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzozMDg6cXRlc3RfaW5pdF93aXRob3V0X3Ft
cF9oYW5kc2hha2U6DQo+Pj4+PiBhc3NlcnRpb24gZmFpbGVkOiAocy0+ZmQgPj0gMCAmJiBzLT5x
bXBfZmQgPj0gMCkNCj4+Pj4+ICoqDQo+Pj4+PiBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9saWJx
dGVzdC5jOjMwODpxdGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZToNCj4+Pj4+IGFzc2Vy
dGlvbiBmYWlsZWQ6IChzLT5mZCA+PSAwICYmIHMtPnFtcF9mZCA+PSAwKQ0KPj4+Pj4gLi4vLi4v
dGVzdHMvcXRlc3QvbGlicXRlc3QuYzoxODE6IGtpbGxfcWVtdSgpIGRldGVjdGVkIFFFTVUgZGVh
dGggZnJvbQ0KPj4+Pj4gc2lnbmFsIDYgKEFib3J0ZWQpIChjb3JlIGR1bXBlZCkNCj4+Pj4+IC4u
Ly4uL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmM6MTgxOiBraWxsX3FlbXUoKSBkZXRlY3RlZCBRRU1V
IGRlYXRoIGZyb20NCj4+Pj4+IHNpZ25hbCA2IChBYm9ydGVkKSAoY29yZSBkdW1wZWQpDQo+Pj4+
PiBFUlJPUiBxdGVzdC1zMzkweC9weGUtdGVzdCAtIEJhaWwgb3V0IQ0KPj4+Pj4gRVJST1I6Li4v
Li4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzozMDg6cXRlc3RfaW5pdF93aXRob3V0X3FtcF9oYW5k
c2hha2U6DQo+Pj4+PiBhc3NlcnRpb24gZmFpbGVkOiAocy0+ZmQgPj0gMCAmJiBzLT5xbXBfZmQg
Pj0gMCkNCj4+Pj4+IEVSUk9SIHF0ZXN0LXMzOTB4L3Rlc3QtbmV0ZmlsdGVyIC0gQmFpbCBvdXQh
DQo+Pj4+PiBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOjMwODpxdGVzdF9pbml0
X3dpdGhvdXRfcW1wX2hhbmRzaGFrZToNCj4+Pj4+IGFzc2VydGlvbiBmYWlsZWQ6IChzLT5mZCA+
PSAwICYmIHMtPnFtcF9mZCA+PSAwKQ0KPj4+Pj4gTWFrZWZpbGUubXRlc3Q6MzExMzogcmVjaXBl
IGZvciB0YXJnZXQgJ3J1bi10ZXN0LTM4NycgZmFpbGVkDQo+Pj4+PiBtYWtlOiAqKiogW3J1bi10
ZXN0LTM4N10gRXJyb3IgMQ0KPj4+Pj4gbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQg
am9icy4uLi4NCj4+Pj4+IE1ha2VmaWxlLm10ZXN0OjMxMjE6IHJlY2lwZSBmb3IgdGFyZ2V0ICdy
dW4tdGVzdC0zODgnIGZhaWxlZA0KPj4+PiANCj4+Pj4gSGkgRWxlbmEgYW5kIEphZywNCj4+Pj4g
UGxlYXNlIHRha2UgYSBsb29rIGF0IHRoaXMgUU9NIGZhaWx1cmUuIEkgZ3Vlc3MgcmVtb3RlLXBj
aWhvc3QgaXMgYmVpbmcNCj4+Pj4gYnVpbHQgYnV0IHBjaWUtaG9zdC1icmlkZ2UgaXMgbWlzc2lu
ZyBmcm9tIHRoZSBzMzkweC1zb2Z0bW11IHRhcmdldC4NCj4+PiANCj4+PiBGaXggc3VnZ2VzdGVk
IGhlcmU6DQo+Pj4gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWJsb2NrQG5vbmdu
dS5vcmcvbXNnODA1MzYuaHRtbA0KPj4+IA0KPj4+IEJ1dCBiZXNpZGUgdGhlIGZpeCB3aGF0IHdv
dWxkIGJlIGJldHRlciBpcyB0byByZXN0cmljdCB0aGlzIGZlYXR1cmUNCj4+PiB3aGVyZSBpdCBt
YWtlcyBzZW5zZSAod2UgYXJlIGhhdmluZyBoYXJkIHRpbWUgYnVpbGRpbmcvdGVzdGluZyBhbGwN
Cj4+PiBmZWF0dXJlcywgYmV0dGVyIGVuYWJsZSBuZXcgb25lcyB3aGVyZSB0aGV5IGFyZSB1c2Vk
KS4NCj4+PiANCj4+PiBXb3VsZCBpdCBiZSBlbm91Z2ggdG8gZW5hYmxlIHRoaXMgZmVhdHVyZSBv
biBYODYgaG9zdHMvdGFyZ2V0cyBmb3INCj4+PiBtYWluc3RyZWFtIENJPw0KPj4gVHJ5aW5nIHRv
IGNoZWNrIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHk6DQo+PiBJbnN0ZWFkIG9mIHdyaXRpbmcg
Y29uZmlndXJlL21lc29uIHJ1bGVzIHRoYXQgZW5hYmxlIHRoZSBmZWF0dXJlDQo+PiB3aGVuZXZl
ciB0aGUgZGVwZW5kZW5jaWVzIGFyZSBzYXRpc2ZpZWQgKEtWTSBhbmQgUENJKSwgZXhwbGljaXRs
eSBlbmFibGUNCj4+IGl0IG9uIHg4NiB0YXJnZXRzIG9ubHkuIFRoZSByYXRpb25hbGUgaXMgdGhh
dCBpdCdzIG5vdCBiZWluZyB1c2VkIGFuZA0KPj4gaGFzbid0IGJlZW4gdGVzdGVkIG9uIG5vbi14
ODYgdGFyZ2V0cywgc28gaXQncyBub3QgcmVhbGx5IHN1cHBvcnRlZA0KPj4gdGhlcmUgeWV0Lg0K
PiANCj4gSSBoYXZlbid0IGxvb2tlZCB2ZXJ5IGNsb3NlIGF0IHRoZSBwYXRjaGVzLCBidXQgaWYg
SSBnb3QgdGhhdCByaWdodCwgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGlzIGZlYXR1cmVzIGRlcGVu
ZHMgb24gdGhlIGF2YWlsYWJpbGl0eSBvZiBhIGNlcnRhaW4gUENJLWUgZGV2aWNlLiBTbyB0aGUg
ZWFzaWVzdCBzb2x1dGlvbiBpcyBtYXliZSB0byBhZGQgYSAiZGVwZW5kcyBvbiBQQ0lfRVhQUkVT
UyIgaW4gdGhlICJjb25maWcgTVVMVElQUk9DRVNTIiwgc2luY2UgdGhhdCBzd2l0Y2ggaXMgbm90
IGFjdGl2ZSBvbiBzMzkweC4NCg0KVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbiwgVGhvbWFz
IQ0KDQpJIGFncmVlIHRoYXQgYWRkaW5nIGEg4oCcZGVwZW5kcyBvbiBQQ0lfRVhQUkVTU+KAnSB0
byDigJxjb25maWcgTVVMVElQUk9DRVNT4oCdIHdvdWxkIHJlc29sdmUgdGhlIGJ1aWxkIGlzc3Vl
IG9uIHMzOTB4Lg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KLS0NCkphZw0KDQo+IA0KPiBUaG9t
YXMNCj4gDQoNCg==


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E236318F22
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:49:41 +0100 (CET)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEDs-0000W0-7F
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAECl-0007iU-Gm; Thu, 11 Feb 2021 10:48:31 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAECi-000701-Fl; Thu, 11 Feb 2021 10:48:30 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BFY2wO088641;
 Thu, 11 Feb 2021 15:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=x+b5SmiP9XUPmTzYQOkewM77flDfon1OcLQBSubxtU4=;
 b=vr5+Ia3dNKJi8dkcSFU2wKy3+FZuZ8Roymc8oqJgGtGwmTpeHWJafNIDTCaqPP4S25ly
 UznLTZaWiEXMkh70doKNQqXbASutp8x9wRQmLv10X8P1e5Xrw5g/9RK/ph3UF2OO2jZy
 LpwGU34DfPbsfWP6PnwUfRnZHfbsIOOMTxddoHzMIEcAvcmFCBKcQ7zs5KX8xK2e7/bZ
 PM248y4028TN1VD9a2kC5Fz1EoIj1cE0h6IzCaafw5t/V5S3M6FWhDvC9eWPbZCp1uyv
 +E/fXpoY/eIkQmHLYbjFOUxgWDSGr4G0xsp8Pc10enW5dLwONjCPVsqVhCS4temvP3il kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 36hkrn7x5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 15:48:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BFaKQ8019662;
 Thu, 11 Feb 2021 15:48:04 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by aserp3030.oracle.com with ESMTP id 36j4prqffm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 15:48:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYyiJ6eh05gn2qqEcFHftd0Lbsy1JdhKU0Du/Vtdi5I1CfWA+PCfwSRkOvUoimHMQUYsm9Hjcmd+CQxG1yVptCY14OikKbXBz04mVh/SKgm9YO1qUUewEucss71sZtMk32hKdaWCBDVG+4FmXqoxQv8jWzD+GBwDNaozAZpRWl0Xm8I4ndHXUhda7hHqd7kjuknKGe4Gcdem5fVAEIj22Qz6du6tqEF3khugVnvuTyuG8SxkFz4QiKZRc1fWUETeeYS9pIC9YUucAYMoJ7nMEKVOBbUlNASoVnMT7jnuFK+rrkZas3qyYIE3/ph9kK9ZOwU01E8IFL7SYh3Al7Mnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+b5SmiP9XUPmTzYQOkewM77flDfon1OcLQBSubxtU4=;
 b=kVuvrH5xC9QUGJ/vzglbMkH30Q88yYqJMAH/gkig1Zu+PghW3lSa31GlrCuwnTIPAn6Kn+GJc+IupX7L8HV7gNnv6axDMqHzYQeKihhxs69qVJFJstOOpLtK1Jqw5CNB3uQzyRyTeHRdb2BLcW20rT8t8wFuLJbdHPQICo3+bu6TwlTqSjpVGRjj0IZ041QmCCfgoHSUuWGljhTxxQHLqcJf4PpHKJVOZDsEYNl+w741SILgBXySK2rwhk7OFh/gvoPdESsYnhC3AMOrulkt/LO4Dp8m4Rb5nrrNNWIS+Eql5l25a/b/3HRDUVtY6mJu4eohN8f3wDNJ98eGr9/6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+b5SmiP9XUPmTzYQOkewM77flDfon1OcLQBSubxtU4=;
 b=Zo3l+5mSXvLK54WgPzLCI07KHQy3nP+iy2gK+jpLfcLMiGwOgSmuexy3+wg/uZEoQUkweJYgwi1uEszLlOoTbmXb9jAJ2wrTa5/I6otBr59lm2OBww6ZBUFhD907s4/SGqzJdQMDB97HmtNbuyNclt5weqjnlCDAQAFCVklNOos=
Received: from SN6PR10MB2749.namprd10.prod.outlook.com (2603:10b6:805:4b::15)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 15:48:02 +0000
Received: from SN6PR10MB2749.namprd10.prod.outlook.com
 ([fe80::e025:23ca:caa1:baca]) by SN6PR10MB2749.namprd10.prod.outlook.com
 ([fe80::e025:23ca:caa1:baca%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 15:48:02 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: Re: [PULL v4 14/27] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Thread-Topic: [PULL v4 14/27] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Thread-Index: AQHW/484rttaNq11P0OxwnMymnq7nKpTF7QAgAADY4CAAABZAA==
Date: Thu, 11 Feb 2021 15:48:02 +0000
Message-ID: <E7BA3F8E-E511-4593-858E-DB8B4C246A36@oracle.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
 <20210210092628.193785-15-stefanha@redhat.com>
 <7a12b897-3157-7a2b-115b-cb6b263b147d@redhat.com>
 <20210211154647.GK1302824@redhat.com>
In-Reply-To: <20210211154647.GK1302824@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:6511:c64d:8d07:2938]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d882dcd-b69a-46f0-a4ed-08d8cea46a52
x-ms-traffictypediagnostic: SA2PR10MB4716:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR10MB4716656F43A9D197B3136F7F908C9@SA2PR10MB4716.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0y7xLKsDQ0b1lbiBiq+iR1ciXje6A18QE5Afnt881hef99Ku4e58tW93AfT6FzSxuVDvZOXBuoIVn7x2se/nQRZ4jM/erNYHHb1qMROgeBy8R6VZPcjI2L/A41SDfyDM0ltV5W3kqog3Mf5RAAlBWLZQeDqtjbU33f9gyoy24I6SryB4WSCydK2/qJ3+cuh72LGhKVNUWy802fNTmtgSz/v8zTRempjrb70nPkJBuBqDDUavn78y3wAtjM9NdP1UIChXHKosNj7eBTA3ETgdJ2LD1jELQRPxelU5wSZLDz/D11XFQON0ZiqWCHGw8RnPqxfBAQ5jRrWQMU6YczH2bd5/OKfFGWc6m3E2bQCF54wAHXWtLqsuXqC0/InbANWGNPHW8j4/203Todu67MLg1mo6RLpodbMrkzKbPmLL17NOrRuO2v1D5aF3v9bksOGvKef2VvaCxHILA7nrC+A4J0DK/31QcQYehQ/Xvnp85S8/R27bjNG5WbgpOBPgL37vk7DLl1UENvvwxs49Z01/8qLClQryD/1xMtFlIc3OMun8jkjV0IfCZJBg5/KDn43ucpBnnckuTzcgVuD02BeMbVYvj6f7Cb5D7ezkGqQoXNEoWoZQ/Hbgp9wF9pKg0wi4bcTxpVCW7vlO1OEciyJBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2749.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(6916009)(33656002)(71200400001)(4326008)(8676002)(36756003)(6512007)(53546011)(6506007)(54906003)(44832011)(316002)(7416002)(8936002)(186003)(2906002)(83380400001)(6486002)(5660300002)(2616005)(966005)(66556008)(66446008)(478600001)(64756008)(66946007)(91956017)(76116006)(66476007)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YjR0TU40ZWJ1RFpBSFFhZTQ3WXNIVnI4MkFKbG1CcEE5cDZmVkNydWRtTmlV?=
 =?utf-8?B?bVVnWG9KTWNXVWtmbnhwWnJEUGhDVjdpdjV0YzBHbG80WGlGUkRrbzBhaEs4?=
 =?utf-8?B?eFlGdWtwTXdVU0tTSXdFZHNPaWJDZTNDNnRsVGI0MEp1RVNGNEdNTW12VmxX?=
 =?utf-8?B?VTZDYU43MEhoM1lzaUZFc2FJb3hWck5EMGRCdnRIYjc5NHZaOTcxZE5rWFB2?=
 =?utf-8?B?R1R2dVJFVWg2T29KZDF5di9tM0Vad1ZuaVJZbHFCeXMxOXREeHJTWWpubm10?=
 =?utf-8?B?eDRSelNqeGJoWEFuNzJ6ZnorVDdKeXMwQko4Y0JhY2srdkRQekZUWWYwdVNO?=
 =?utf-8?B?Z0VyLzFqRmp3UWRqM0FNcllIdFhWQ2p3U1NkbnZFVDViYkpqbGhqUzJEWjd1?=
 =?utf-8?B?YUhGMnVUZklkSUhvRm1Ra2JpUVdFVmgybWNZSmJ2am9uMGtQc3lSbDRRellV?=
 =?utf-8?B?dmlSaDA5ZHBrTE1EYUVRcC83Mmx0bHQzbERpWkFjaUJIM3VRSFQ5YldXTHNi?=
 =?utf-8?B?YUtZRGdqSG54dDR6SHEyOEVRV0kwN2xENmdmOEZpVHpxTUs2Um5PQzFsY00w?=
 =?utf-8?B?QXQzNHcrdTZhK05LUzlUSDRBYTAvdnd6YUtyUlBBYnFraDVBTGJSWUJXckRo?=
 =?utf-8?B?WlArSWc0YS9rdmtqejVYUFJ2eGxNbXdhZWRpaTdiTkNkb1Z5S2hmQWtCVlc5?=
 =?utf-8?B?eFhSZDRrdXRIQzgxZjV6RUU0VDJkZWlaWWxDZUVVUWl2RmZoT1NFQWNpazdv?=
 =?utf-8?B?MUp0a2txak93cmRkYkRwNnlQQWVybWtGZlhLN01TakdHUnZRL1pVT1R0bFZz?=
 =?utf-8?B?K2g0VFpJYkZRd1A4SVc4ZlRkQWdrT3JTSUVsWFlHRXVGRTdiTlN6SE9EZjBx?=
 =?utf-8?B?VUxZcU5SNm5xWWJEcXp3cDNPV0hQTEFrYkxWRkdRSE9QeVorTjJvNkhWbk13?=
 =?utf-8?B?S2cxNlJOTWFUN1NyTnMyRWFscDhXeEFlQ1RUeDJiOUlteTBHdHkzRHF6ZTkx?=
 =?utf-8?B?VlM3TDNFQTk4SzA1Mm1QWGEzZFN4QXRJb0V3bUVlY3p4eWxES1N3amZGWGlS?=
 =?utf-8?B?U1pqYkwrNm55UWg2TFpGY0FMVmc1bkdBTkROMzJUcUw2emN4dGZ2YUEvSnhK?=
 =?utf-8?B?REJ4ZFZ6SCtYU01KUGlGTHVzbkJDU0dQUFJmTGFKZE9zU2UxZkNnVUQ4VGVL?=
 =?utf-8?B?Vi9hWWNxbzBndkhIK2FLZUZOTDBkYzQ4THhYQlZYSDU3QUhhVEZ2V3VWcFRH?=
 =?utf-8?B?eXFPWG1nMnRienM3Znd2MDluTVdXeGNpMTdMMGt1WHowZ2NqdUMySWFKT0po?=
 =?utf-8?B?eDZVQXFiYXk5R3pxTlRhdzJvQ1pkTnB4bXpxZGxjY0hVZTZ1cGhZbjY4Qllo?=
 =?utf-8?B?MU1xWHVGRFovZVVPemxmd1pCc0wxTndTNmVTWStoS0pMZzVQOGNXOWVXdUQv?=
 =?utf-8?B?UHZZNjJVQzc3TWtkaTNtQ0VhWDJtK0J5RXM3UElaRTlYb3NKYVZ2eXZUcS94?=
 =?utf-8?B?SE5sUENLeDloZXdZTFQ0azRYeTJIeG1BZzdwUHltNG5lS2ppMUtkRHFQYUlZ?=
 =?utf-8?B?aUdtY3VXK2llK3U2Y1pQU1RsaFF4UXErYWx5SUdJNWVvbXRzQTJ1WWNIK1J0?=
 =?utf-8?B?T3N5WXdGQTNtb3ZOM3M5bStWenY3djQ0SnRiZGN0dE5Zd25nMVV1TG9ZYmkv?=
 =?utf-8?B?NXFCUE1EYzdDZUZEOWp5MU5adEhRdDZjOGVVU1YzcHEzYUVnR2ZnQzR4YVZo?=
 =?utf-8?B?bkpoQU5aQVp6RCt0SDlxc01BY3MzZUZrYUZuOEhhU0xLV0ZUNW0vbi9EbEpE?=
 =?utf-8?B?QnhiWDZXeWxCcWFDc2hhaXh0SndsQ2ZlL1dJRUFVaWdEWlpJSVp2eUpuRi82?=
 =?utf-8?Q?OGfr4kDvLpIQZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3344459031482340B787D556219979F4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d882dcd-b69a-46f0-a4ed-08d8cea46a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 15:48:02.5495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kRGe0heE58g8H3fYiILyLPc64FrqowJODQLKpSdBuWG+tbVrMRWMvum9Hy6RYabYN+Ty2hdFb6k/iFnFoGsbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110134
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110134
Received-SPF: pass client-ip=156.151.31.85; envelope-from=jag.raman@oracle.com;
 helo=userp2120.oracle.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDExLCAyMDIxLCBhdCAxMDo0NiBBTSwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8
YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIEZlYiAxMSwgMjAyMSBh
dCAwNDozNDo0MFBNICswMTAwLCBNYXggUmVpdHogd3JvdGU6DQo+PiBPbiAxMC4wMi4yMSAxMDoy
NiwgU3RlZmFuIEhham5vY3ppIHdyb3RlOg0KPj4+IEZyb206IEVsZW5hIFVmaW10c2V2YSA8ZWxl
bmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+Pj4gDQo+Pj4gQWRkcyBxaW9fY2hhbm5lbF9yZWFk
dl9mdWxsX2FsbF9lb2YoKSBhbmQgcWlvX2NoYW5uZWxfcmVhZHZfZnVsbF9hbGwoKQ0KPj4+IHRv
IHJlYWQgYm90aCBkYXRhIGFuZCBGRHMuIFJlZmFjdG9ycyBleGlzdGluZyBjb2RlIHRvIHVzZSB0
aGVzZSBoZWxwZXJzLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8
ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpv
aG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFn
YW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+IEFja2VkLWJ5OiBEYW5p
ZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPj4+IE1lc3NhZ2UtaWQ6IGIw
NTljNGNjMGZiNzQxZTc5NGQ2NDRjMTQ0Y2MyMTM3MmNhZDg3N2QuMTYxMTkzODMxOS5naXQuamFn
LnJhbWFuQG9yYWNsZS5jb20NCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+DQo+Pj4gLS0tDQo+Pj4gIGluY2x1ZGUvaW8vY2hhbm5lbC5oIHwg
IDUzICsrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gIGlvL2NoYW5uZWwuYyAgICAgICAgIHwg
MTAxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMzQgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+PiANCj4+
IFsuLi5dDQo+PiANCj4+PiBkaWZmIC0tZ2l0IGEvaW8vY2hhbm5lbC5jIGIvaW8vY2hhbm5lbC5j
DQo+Pj4gaW5kZXggMGQ0YjhiNTE2MC4uNDU1NTAyMWI2MiAxMDA2NDQNCj4+PiAtLS0gYS9pby9j
aGFubmVsLmMNCj4+PiArKysgYi9pby9jaGFubmVsLmMNCj4+IA0KPj4gWy4uLl0NCj4+IA0KPj4+
IEBAIC0xMzUsMjAgKzE5MywyMyBAQCBpbnQgcWlvX2NoYW5uZWxfcmVhZHZfYWxsX2VvZihRSU9D
aGFubmVsICppb2MsDQo+Pj4gICAgICByZXR1cm4gcmV0Ow0KPj4+ICB9DQo+Pj4gLWludCBxaW9f
Y2hhbm5lbF9yZWFkdl9hbGwoUUlPQ2hhbm5lbCAqaW9jLA0KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92LA0KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIHNpemVfdCBuaW92LA0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIEVy
cm9yICoqZXJycCkNCj4+PiAraW50IHFpb19jaGFubmVsX3JlYWR2X2Z1bGxfYWxsKFFJT0NoYW5u
ZWwgKmlvYywNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBpb3ZlYyAqaW92LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90
IG5pb3YsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKipmZHMsIHNp
emVfdCAqbmZkcywNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yICoq
ZXJycCkNCj4+PiAgew0KPj4+IC0gICAgaW50IHJldCA9IHFpb19jaGFubmVsX3JlYWR2X2FsbF9l
b2YoaW9jLCBpb3YsIG5pb3YsIGVycnApOw0KPj4+ICsgICAgaW50IHJldCA9IHFpb19jaGFubmVs
X3JlYWR2X2Z1bGxfYWxsX2VvZihpb2MsIGlvdiwgbmlvdiwgZmRzLCBuZmRzLCBlcnJwKTsNCj4+
PiAgICAgIGlmIChyZXQgPT0gMCkgew0KPj4+IC0gICAgICAgIHJldCA9IC0xOw0KPj4+IC0gICAg
ICAgIGVycm9yX3NldGcoZXJycCwNCj4+PiAtICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVk
IGVuZC1vZi1maWxlIGJlZm9yZSBhbGwgYnl0ZXMgd2VyZSByZWFkIik7DQo+Pj4gLSAgICB9IGVs
c2UgaWYgKHJldCA9PSAxKSB7DQo+Pj4gLSAgICAgICAgcmV0ID0gMDsNCj4+PiArICAgICAgICBl
cnJvcl9wcmVwZW5kKGVycnAsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAiVW5leHBlY3Rl
ZCBlbmQtb2YtZmlsZSBiZWZvcmUgYWxsIGRhdGEgd2VyZSByZWFkLiIpOw0KPj4+ICsgICAgICAg
IHJldHVybiAtMTsNCj4+IA0KPj4gVGhpcyBjaGFuZ2UgYnJlYWtzIGlvdGVzdCAwODMgKGkuZS4s
IGl0IHNlZ2ZhdWx0cyksIGJlY2F1c2UNCj4+IHFpb19jaGFubmVsX3JlYWR2X2Z1bGxfYWxsX2Vv
ZigpIGRvZXNu4oCZdCBzZXQgKmVycnAgd2hlbiBpdCByZXR1cm5zIDAsIHNvDQo+PiB0aGVyZSBp
cyBubyBlcnJvciB0byBwcmVwZW5kLg0KPiANCj4gT3BwcywgeWVzLCB0aGlzIG5lZWRzIHRvIGJl
IGVycm9yX3NldGcoKSBub3QgZXJyb3JfcHJlcGVuZCgpDQoNCkhpIE1heCAmIERhbmllbCwNCg0K
V2Ugd2lsbCBzZW5kIGEgcGF0Y2ggc2hvcnRseSB0byBhZGRyZXNzIHRoaXMgaXNzdWUuDQoNClRo
YW5rIHlvdSB2ZXJ5IG11Y2ghDQoNCj4gDQo+IA0KPiBSZWdhcmRzLA0KPiBEYW5pZWwNCj4gLS0g
DQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNr
ci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KPiB8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAg
ICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwNCj4gfDog
aHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3Jh
bS5jb20vZGJlcnJhbmdlIDp8DQo+IA0KDQo=


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DE32B89D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:30:10 +0100 (CET)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSVt-0006jb-Hx
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHSUo-0005sW-8Y
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:29:02 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lHSUm-0004wy-4f
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:29:02 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123EJbdD188761;
 Wed, 3 Mar 2021 14:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=U7R93/ApwbZl9H9oVXCAdy7kHrgPkyEZQDk/sHx81gw=;
 b=fqdBcc9ZdtF2gGNib266Jud5PI2hr87bTSlzSWMoAOtm3zWR9HnLnDiDsnv04UB9NLgl
 +7YFvsk0n/Vtl9xrLATHm5Ss4NCD3ArovT8kvtUlXh6+6dv52OriYgaqtshsCk+GCIpb
 CO8PZKILW9unIKNY5Qyp9Ykrcn8f5roL++SzqeH+Fp8jLAZ/bKM03T7LBX+M/mfoAekL
 /ikAt5CA8KOvGOQJb745YC4nRReeajF4Bmv4QLLIe93GaixbVo5XbEmHWlmZMHms7VYo
 b/DehyBGYlrmjHvBOalgdfldnWBWv3KTyxH7bLinMPmcRLo0S70hV1k3p9PEO4buSaGA yg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36yeqn3h27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 14:28:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123EQavA151258;
 Wed, 3 Mar 2021 14:28:44 GMT
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2050.outbound.protection.outlook.com [104.47.45.50])
 by userp3020.oracle.com with ESMTP id 36yyuthe3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 14:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHDKWHPlGwZsTdnrigtTumiBzwzULhTRW/8oU8rX0/jULA2vRBQ1tVHQOTf25F2RumBbylTidyX9VjUq9gv5JOZXrHXnF2jdmlys6LFhIKP2wNgwqhnx4SR/grsSkZnWgt1s1muJJQjd8QYI6QrFEgyldwthyFKjtB0JhXUxy37ec3Jah2G2aK6myxtohKfy1cjQq1Yg6bjjZKCKDXePSYwJEuK5Nb3I9wc+cXn7W3UKJnE4C0HPGo5JX4ZhcCflCBPRhMaLHUo0qVI+aY3vYOnqYnmTmgHwiJsSusurQBTL5tFe6uFvn3RLr2UoKddKGyDu1qB2p8GaSOxiV6NaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7R93/ApwbZl9H9oVXCAdy7kHrgPkyEZQDk/sHx81gw=;
 b=guLD4kyMIeZsIFadNytNkUVW3n8g7GEF0GyBK/VCN0JpQxmhiF6dDtMOeF5ZLIRr3yPp3SAQWT5TK/+3Gz5mVhFMkQdfbxMb7NrH3o1N8GwzuM+SwrYJQmNZDznpfxeQOUNkJiN6SYhVOy5NjsBm9mQmw6pwYC5jCWOgjuUpjARh+sddENM1qbK92Xyr6rdMdaWz+A3AQ9RrtkldUqazGxl+Val9bDF7VH6WSR3SwEWCT9anLBcyLyJ/WcUfiP7Hb5LKtyEwmB4chkI83tZx44rTt1wyZqFxtDr8943JjlMHkELJEDfhToWN23PQRR60wx364ON/gVZt2xTUk7BXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7R93/ApwbZl9H9oVXCAdy7kHrgPkyEZQDk/sHx81gw=;
 b=G4RUAynVhE7/D+W6OHEhVmooWKcLk+EYB/LPd7+hnsyLMPOw2NV8ZbU0E3mQfmed7b7+Dkt2B/peBoNpg/xbw3zWziYYv+fqX75z4rKmEzj8RQ4XjD49JrUT3FVikXUCKOFxaC9jREyBKhsNRprom9RZYBh0/neDubdWw/6HCuw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5139.namprd10.prod.outlook.com (2603:10b6:208:307::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 14:28:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::2949:9a66:35eb:b471%6]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 14:28:41 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Topic: [PATCH] multi-process: Initialize variables declared with g_auto*
Thread-Index: AQHXD/wRtkqMtsSwEEuAanyZjyyT1apyDPUAgABEy4CAAACsgIAAAJ+A
Date: Wed, 3 Mar 2021 14:28:41 +0000
Message-ID: <9EEE893D-B651-439F-9678-72BC8F7DD852@oracle.com>
References: <20210303070639.1430-1-yuzenghui@huawei.com>
 <YD9iTgCNgrsbzWfx@redhat.com>
 <245D5971-0F34-42BB-9C84-4039BEE255E1@oracle.com>
 <YD+ckxoEk6cB6AAc@redhat.com>
In-Reply-To: <YD+ckxoEk6cB6AAc@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:9dd:70b4:51fd:d8c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b12dff2-1674-475f-56ad-08d8de50a4d6
x-ms-traffictypediagnostic: BLAPR10MB5139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB513959904EB0904CF42931F490989@BLAPR10MB5139.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZlOW5RqLHi6h/s48Z9rkjfcKCOmUChT7S5WLO1kuT9OlKxyWeloJkma8xY+pzrPOnx0jkaoF0mH/V1VcoXFJ1rf+FJl1GpxmjrV19fDYp3JQNdacHaEhmdduaLcPlseVBi7vforsFBATmTo10GwKuRxnp80YbdbPmTnEUWJ9H3eCb020c1Z9eveQDf3l0FVJLiEodD3sTr5ls07/K7hSHUER8Wr9ahWCWo0LX321KBv8nYsO4raoQzBLnzrLfDwIV4FpCju7bx5B6qRbRjQ9JY9XMyYRMIbnvyoHO/DlRqt/Lp/n+7iAgCds1PmlX6ONH4bDsjTCpl5Z34YeWxUTrZRoF/nTFVOmgKye7UYJjmo9N/ZLkhKNvaMW70Z2t3UoHw8ecsaPKtI9mQAy0MTeUveLYOzLP3hF4xkOaNj1ovya98DqLrJ88la9/49VOH20+HDB5JqlYYi58cdEOZ+azqvF7DjibVa9xuz2qNU+VvCoIO+AVkVMu8LcqVnyC1n4jhw1DeQ9mwlAM5uvw0usuXOyBmnJf5rtfrr+s/pgbjRc+OOkcmfpQOznO3VoVClybZJ64/R5x55Vgnk+ddj2YAeL/YMzDJxhvVHxIRTkKg2TXYa9tAh1NpNTqWrPNRLcpp+dfk4op83XRsZ3dQ7oXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(39860400002)(136003)(6486002)(6506007)(36756003)(53546011)(44832011)(86362001)(478600001)(54906003)(186003)(8936002)(33656002)(316002)(83380400001)(966005)(2616005)(66446008)(64756008)(66946007)(71200400001)(76116006)(6916009)(4326008)(5660300002)(6512007)(91956017)(8676002)(2906002)(66556008)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzJPZmtHUjhOU0tRdzdCZ1FWQkF2cGpQeWRRczVRQ1JVZEtORzdZWDBKTVFx?=
 =?utf-8?B?SngxbDFITW1hWS9ZVjZwRHBwdDhWSldxZm1sRE1sSTZTMG83QVhqdXV6Lyta?=
 =?utf-8?B?N2JZUnVCTGhnWGlEUjUwWFhsRkd4NkdHTXpVZ0FuZGpsdjNnM1hsMHZmZG9V?=
 =?utf-8?B?ZVczelJhb2xseHFST2xIQXJtbEhoRWpqbDBCUDlwQVRlK0kweVpNZWN0akpR?=
 =?utf-8?B?eG1WejZWQkwvRnpUc1QwRXYxNGVpbW0xWlpkcUxRT0d4eEVyZm5SLzB0V3VX?=
 =?utf-8?B?RTlQNFpOOFpHdE5aZThXVE0zMUxtNTRBMHlFT013TkFLNzdxRlExZmNLRURO?=
 =?utf-8?B?QWxOUi8wOFBQbXVkNWtMN1JlTEU2Vy9xZmpkSGcyUlV1R3hkeWs5N3pkdlgz?=
 =?utf-8?B?Zm04NlpNcng0ZDE3d1Y0eVlwUVlWZWIrM0dxQkYralRxSzV0RjFqQU1PbmYr?=
 =?utf-8?B?U1k3MmZPajNHMHM1dmdKMVpRZWxJZWxWZVdvYS9LV0JtMUpOVllkd0RUd2dB?=
 =?utf-8?B?enIzaDBud1JwOXdVZWViVW1lbis0L3kzWnd3QXE3eE9VcFZ5NThCamtqTzdt?=
 =?utf-8?B?d2ZZZU9hT2ZmalBZdjcrbzdPdFZzQk54aURMUUVGQVFlc2tTWHhyVXhjcWk4?=
 =?utf-8?B?VVJXNUc2dUY3ZlJ4V2hXMWxzRU9ZamJYZzhOajIzNUdqMVJUTVVxMnNyVUxu?=
 =?utf-8?B?dlI1UStVdkwyUlQ3NTRad3YvSEVLQmIvQ0Ewb25iT2VXK0RFa1hvbDBuVmVB?=
 =?utf-8?B?RUUzMWVrOCtXTGN0NVZiSGprNlZvcWprbHNyVDYwZDFtclpZcFJLS0VSdlIy?=
 =?utf-8?B?N1cwb1dVNk4rQjMvbmFZMDdwVktLTjRiS3JTblRhV2VuMVF6WW54elpIa2tW?=
 =?utf-8?B?WlBYL1YyUDB0MnJ3MGE2bWtNcnEzTktLVnR4dC9PaW1KWWU5TktUYjZsWE12?=
 =?utf-8?B?NitYeUxjNVZ3WVB0c0tRdG5hUWU4N1hpOVhGN1VldG5tSS8vbU91WjhnaUpE?=
 =?utf-8?B?enJIK2R5RG0zSWVEdG5ZWW5CUEptTFZMc09NUW83YUhaRVNlbFhsS0cxTDhn?=
 =?utf-8?B?V1IwYnM5UVRqWEdmRVBlTVZqK0ZYRk1XUUFkdTV5NnF6Z2gvcTFnMHFpYlBo?=
 =?utf-8?B?TGdOMWZTdTFxeWxSWGU3K2h0aCt2eTJ0V1hZZWVKM2FjaTQ5VTlXOTNnYXhP?=
 =?utf-8?B?dklUVXFDcEp5TmdReUxaL1FEV1NXajFDU3RpLzd3SS9LWml6VTJnUlFrUVE1?=
 =?utf-8?B?ME85TisvaGsxbzZxNFlTQnFPQVBsem44c1lUVXpocDZPUmMzTnZQWWQyRWFm?=
 =?utf-8?B?OGJkMTZqTU1YeHQ4ZE0zNm5oaEQvcDh3RElXd2JjdTl0T0tqTW5nL1ZITUJj?=
 =?utf-8?B?Tm9GRGpUcFlRZU1wei8rRXIwb1Y3MXZXVGJFR0RCYnV4T05PQWtDdE8zeVdl?=
 =?utf-8?B?VkNaQjNEQ3ByaCtPLzhnM05QL21LTitEL3FmcEJpR0ZoaTgwUWpiclZIbnZ2?=
 =?utf-8?B?NVVFVlUveHd3TDJaV2JmaFpaV1J0UTJnVlpaNzNyVTZBUElkUkFGaG1XUGk0?=
 =?utf-8?B?YzdqSWVPdVpQNy8va1Q4OW8rS0tTY3BySEY4eWsyNGJneStwempHRjV4SElo?=
 =?utf-8?B?K2YxT3VWMXVrUGlXa3crUHhHUEFNZjg2cVRBNEs4Nlp4a2FIaVArYzgvSWoz?=
 =?utf-8?B?MVAwY1ZxSDZ6YkEzVnJvUHRaWnVmempKQVlvelZlYms5TytkQ3BwU2NJUkZz?=
 =?utf-8?B?Tld5bHhvTnhOdEQxMWlqS2lNdElNaUd2dTU5T1dGSjJaeHpVbWljUS9BNnoz?=
 =?utf-8?B?QU9vcDVNdzhpSEpVcmJISnkrU3IzMzA2SnY5T1N6SDdnamRaNXdjM2R1MXE1?=
 =?utf-8?Q?CzqLWkW52Qr0l?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21C19185CD212448C85869A775A39D0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b12dff2-1674-475f-56ad-08d8de50a4d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 14:28:41.6066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tmW3652GFw7phPkAbvwscKPhldUM46CVy220wo2EYl1OXIhMyTLOhfpaDb4LMw4WO1hll25J0m8VqzUy1VWWVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5139
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030111
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030110
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 John Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDMsIDIwMjEsIGF0IDk6MjYgQU0sIERhbmllbCBQLiBCZXJyYW5nw6kgPGJl
cnJhbmdlQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBNYXIgMDMsIDIwMjEgYXQg
MDI6MjQ6MDRQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBNYXIg
MywgMjAyMSwgYXQgNToxNyBBTSwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMDM6MDY6MzlQ
TSArMDgwMCwgWmVuZ2h1aSBZdSB3cm90ZToNCj4+Pj4gUXVvdGUgZG9jcy9kZXZlbC9zdHlsZS5y
c3QgKHNlY3Rpb24gIkF1dG9tYXRpYyBtZW1vcnkgZGVhbGxvY2F0aW9uIik6DQo+Pj4+IA0KPj4+
PiAqIFZhcmlhYmxlcyBkZWNsYXJlZCB3aXRoIGdfYXV0byogTVVTVCBhbHdheXMgYmUgaW5pdGlh
bGl6ZWQsDQo+Pj4+IG90aGVyd2lzZSB0aGUgY2xlYW51cCBmdW5jdGlvbiB3aWxsIHVzZSB1bmlu
aXRpYWxpemVkIHN0YWNrIG1lbW9yeQ0KPj4+PiANCj4+Pj4gSW5pdGlhbGl6ZSBAbmFtZSBwcm9w
ZXJseSB0byBnZXQgcmlkIG9mIHRoZSBjb21waWxhdGlvbiBlcnJvcjoNCj4+Pj4gDQo+Pj4+IC4u
L2h3L3JlbW90ZS9wcm94eS5jOiBJbiBmdW5jdGlvbiAncGNpX3Byb3h5X2Rldl9yZWFsaXplJzoN
Cj4+Pj4gL3Vzci9pbmNsdWRlL2dsaWItMi4wL2dsaWIvZ2xpYi1hdXRvY2xlYW51cHMuaDoyODoz
OiBlcnJvcjogJ25hbWUnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlv
biBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQ0KPj4+PiAgZ19mcmVlICgqcHApOw0KPj4+
PiAgXn5+fn5+fn5+fn5+DQo+Pj4+IC4uL2h3L3JlbW90ZS9wcm94eS5jOjM1MDozMDogbm90ZTog
J25hbWUnIHdhcyBkZWNsYXJlZCBoZXJlDQo+Pj4+ICAgICAgICAgICAgZ19hdXRvZnJlZSBjaGFy
ICpuYW1lOw0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fg0KPj4+IA0KPj4+
IFRoaXMgaXMgYSBiaXQgd2llcmQuICBUaGVyZSBzaG91bGQgb25seSBiZSByaXNrIG9mIHVuaW5p
dGlhbGl6ZWQNCj4+PiB2YXJpYWJsZSBpZiB0aGVyZSBpcyBhICdyZXR1cm4nIG9yICdnb3RvJyBz
dGF0ZW1lbnQgYmV0d2VlbiB0aGUNCj4+PiB2YXJpYWJsZSBkZWNsYXJhdGlvbiBhbmQgYW5kIGlu
aXRpYWxpemF0aW9uLCB3aGljaCBpcyBub3QgdGhlDQo+Pj4gY2FzZSBpbiBlaXRoZXIgc2NlbmFy
aW8gaGVyZS4NCj4+PiANCj4+PiBXaGF0IE9TIGRpc3RybyBhbmQgY29tcGlsZXIgKyB2ZXJzaW9u
IGFyZSB5b3Ugc2VlaW5nIHRoaXMgd2l0aCA/DQo+Pj4gDQo+Pj4gQWxzbyB3ZSBzZWVtIHRvIGJl
IGxhY2tpbmcgYW55IGdpdGxhYiBDSSBqb2IgdG8gdGVzdCB3aXRoIHRoZQ0KPj4+IG11bHRpcHJv
Y2VzcyBmZWF0dXJlIGVuYWJsZWQNCj4+IA0KPj4gSGkgRGFuaWVsLA0KPj4gDQo+PiBDb25jZXJu
aW5nIGdpdGxhYiBDSSwgaXQgbG9va3MgbGlrZSB3ZSBhcmUgcnVubmluZyBhY2NlcHRhbmNlIHRl
c3RzIGFzDQo+PiBwYXJ0IG9mIGl0LiAiYWNjZXB0YW5jZS1zeXN0ZW0tZmVkb3JhIiBydW5zIGl0
IG9uIGZlZG9yYS4NCj4+IA0KPj4gSXMgaXQgc3VmZmljaWVudCB0byBoYXZlIG11bHRpcHJvY2Vz
cyB0ZXN0cyBhcyBwYXJ0IGFjY2VwdGFuY2UgdGVzdHMgc3VpdGUNCj4+IG9yIGRvIHlvdSBwcmVm
ZXIgdG8gaGF2ZSBhIHNlcGFyYXRlIHRlc3QgaW4gZ2l0bGFiIENJPw0KPiANCj4gTm8gcHJvYmxl
bS4gaXQgaXMganVzdCBtZSBnZXR0aW5nIGNvbmZ1c2VkLiBJIHdhcyBsb29raW5nIGZvciBhIENJ
IGpvYg0KPiB3aXRoIC0tZW5hYmxlLW11bHRpcHJvY2Vzcywgbm90IHJlYWxpemluZyBpdCBpcyBl
bmFibGVkIGJ5IGRlZmF1bHQNCj4gb24gTGludXggaW4gY29uZmlndXJlDQoNClRoYW5rIHlvdSBm
b3IgY29uZmlybWluZyENCg0K4oCUDQpKYWcNCg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IERhbmll
bA0KPiAtLSANCj4gfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93
d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8DQo+IHw6IGh0dHBzOi8vbGlidmlydC5v
cmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6
fA0KPiB8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cu
aW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwNCj4gDQoNCg==


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C3387E40
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:10:48 +0200 (CEST)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3F1-00041F-2I
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lj3D5-0002hh-TZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:08:48 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:58126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lj3Cy-0006bm-SJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:08:47 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14IGwlxD142923;
 Tue, 18 May 2021 17:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ESo7WRzJ/IXRa0pvBATugZSsfFQhI2hkinHU/kbNqP0=;
 b=c/3jq6TifZZCH6S5pUtdXkPQyaSyabJpNsQ7FB1ZVZ95DcPD+sVlEpsrl7u6y83cqHSq
 Hb62h0ZmYaGKUyg7m7yfUgcmhBzIgNpkwRrwBL7xpiy4TixTs762jFOEhqJJBVxwJz+I
 iYzXGdeYekGXvDv1EvjQw17Q/fAoH+RSQ9ClopkjkqN5wjdmmK9KkXRXOCW13T4X3uMf
 vVf/22OxYU2q5Wub0a3GIG6v52+Es80Q8gPEDm3C+L9bg/OOGozvm+rBF0Aud4T6amdP
 2NUQIpND59Ed316+9gQ1OjrlvsRpfixCxvGftr56mOYP2YywTIUYcZ+DCgABWhlKoIeQ PQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38j68mf330-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:08:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14IH54dq108826;
 Tue, 18 May 2021 17:08:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 38meefdgve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIYNXcP1bobNWVTtrnYyGAC3iacx0WrRDH8ayHBmC0sUhIyWSLHtEF1x4QYW0nL3i+KEeUqngaH9T7cdGGD9qnztdZkja1wvo8Hw33AJ1VED6rgwgmoNPQWsnby8gB/14EGNTBAAnpZGXlQCVkUw8e8ml2Tju2PW1MeyJsmmR0UYB6HHNs8xVFzAW86+/VsBDOJi/wGDPxq+SMqj3ZwFWOEIVKS5ZZLHs+WxRr4+Z65oFB0ptWzoD+Egk/8RFfMRBgLkuHLD4j+fLmcI7g0h2WGVjVwti824tdK2nuXut5ovQ6+DeDDSKS0vaGPqIf+UKuGOO9Oaose4oPJ9l1Jr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESo7WRzJ/IXRa0pvBATugZSsfFQhI2hkinHU/kbNqP0=;
 b=i05tkDD/Lo+iwbxLCz0zcpWsLB0oLnFhvJSCD7WP8Jwt0Z6ZZuqr3GlYSsMDUIvl9zB7iauTo0EWEkr6wLerHId8OLAH02YUsTQMmoUuzp7l9akK38XS1XOWGo2tNh1N6ki6XUdOleAXSRdIcJ1oFIjfuJsHzVWTNb/GpVfPSlK2XtnHXyi1EOo+cE8IYxkxb2mL7QHQEBmK7OntkumPAoj4ivLeM299tdNpuw32S82JMVL4/GVM9FobB35a56NhYQt5A03vzoXdkmERqzp+du7BjUnQc5k0lzSTxbQg6Nn2d+1IoxS+ZSZvBH21ucZaVsBBZl4gShQpCsPq/Zl/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESo7WRzJ/IXRa0pvBATugZSsfFQhI2hkinHU/kbNqP0=;
 b=UK4Vg2+dgEfPih0MH8AP6ENRa8ZODn7wFtvq4V8BrUYXMzzxjbJLRK8iah8VygEXXMVv/00UDe6yOzINiCbw92Zx/HyOHNFJWJuZ/1SgXMJ0gX3zKgbgBagqpPLju3wXOAxlVUA5IOi2Wb0SgicLc/smumnqNT2XNHSvx8E701g=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1966.namprd10.prod.outlook.com (2603:10b6:300:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 17:08:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 17:08:31 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Topic: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Index: AQHW/l0fQlwSEv68gU2Ur30xmG3nWKqoOiqAgARyYeeAB3TagIAeR4s6gAAX9ACAFduLw4AAGw4AgAGaggg=
Date: Tue, 18 May 2021 17:08:31 +0000
Message-ID: <CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210503190734.12e4c1ac@redhat.com>
 <CO1PR10MB453130B44F61C9E82C431789972D9@CO1PR10MB4531.namprd10.prod.outlook.com>,
 <20210517183138.5a429692@redhat.com>
In-Reply-To: <20210517183138.5a429692@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7ecad77-0f1e-4bbb-95ec-08d91a1f9068
x-ms-traffictypediagnostic: MWHPR10MB1966:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1966A0FEFBB610E7E9AD7EA9972C9@MWHPR10MB1966.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTkrSSoDbMn3Jc/huiTTvi5ANf9/bWL3035oYNUhZL1V6yq/rAEhTMuAdee5vIWXCWhMyHbN44HVNiDeeLoEEAN+osB3sO/2ZmUx4itrCqzI5H5VaCVRhnWWJnCsIf4R5HmBeNcgysrxYdKj0FTKmjuJqJSdDoD9vQxunc6XA6NFRvAKUOshUQ2TxblHqSE539zcl5S/4IBtLqhnrs8wIrN45mPlOjdOpwmw0+QGNaS2t5BnrJDvEHhWtXGC3PxsBWJ4QhXYVFtsFRX3N8OhiDNbGavstI8v4gjdkq/ddLYxRohRdcPr4rj8InerqwmSQtg/ZthIzyF0WBaEnD66pYTU2xR7caq5fv+liuGRqPhNlaLZINlJfR6rk2ivTYqa1QaDlvNGreuXdfCwQRhNSlvtKjYlWrBWFew4SaetXK/+Or9sirY4hAi4l/SZZ1PlwGAX3lmANNIvckCs2+782dCyvr5yz3cymR8xPaiomYhd1Rdguj9d4IdV4VRxEyFyl2YmnNbTM+r403W3+f02f7ZyJ1n8+qjs1V9g8rzHFlGDgF0oJqt5GB77Y8GoTKKFEgL7jwGtRtg15GcruGUXjPCSnCO9TG1pFrMqnL16KxtOspLcjBgqoUugL1REfIevGw0kSn/6mnu5Wm0CChgc2KUZZLSBsXBBNy8YdGvWNJV80WanKS4W3AkcOKSGFDLC1C94/H7hF6aXvCWFZsWpz8VNhd2Zsa1Wv6XOXiNtSZM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(52536014)(6916009)(55016002)(316002)(64756008)(8676002)(66446008)(966005)(66556008)(30864003)(478600001)(76116006)(66476007)(9686003)(8936002)(4326008)(66946007)(7696005)(186003)(5660300002)(86362001)(54906003)(38100700002)(19627405001)(6506007)(2906002)(122000001)(53546011)(71200400001)(26005)(166002)(83380400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SUczrLliweWWdRyBThYowr1aEeBzQrcq5cjo37qGhmxK+FC/mLA46Qlv7dYT?=
 =?us-ascii?Q?m55y8eRON5vWLg/YG2WbGBNEvn9KZp0TC7J8XV26c9JROX750gV2mwTFu4s8?=
 =?us-ascii?Q?HHIZz5xcQyCocSj1DgyVhcxPpSxUpEXhFVcfDSx8Hd8ac7ohbpb5AmosOcYN?=
 =?us-ascii?Q?OPneqNKvMxXFzCZnzJVlvGXV0FihL9iE7EtmORfeBR7g2FKa3el4uWGnSufQ?=
 =?us-ascii?Q?roISEhA3Xvyc4qtJ6YnlglDfaHLd6HMtqCCiorOO5eDb3VwPUPRqqAIgj3JC?=
 =?us-ascii?Q?hJRAe0+7bQpUxalEvl+dYQL70sCXvpY7TySkoIp7QBPI1qOzGVnR75LfOlb0?=
 =?us-ascii?Q?GfDpASenZt/5QlRqwMjBZZWdKhVtcIp2neoZ4iwTM/NtoS4NaCAikTGYUN+4?=
 =?us-ascii?Q?aNh/rBfAAgCN4JZ9FT20+LNQD9wgoKD3mcxfrSJDplqYI9xZ9Yxx/vBX0Egu?=
 =?us-ascii?Q?yJIWjnUcDu6mAJdnLk6s+ohnk3DS4fRZts5zJdk6V2ReSDCauop4RWJaVvWg?=
 =?us-ascii?Q?U9cqSJY1mYXSVJzWJxl4VotG6ae1YS+s98FA/2+iS7jXiXQ6g75Dzh2XPktf?=
 =?us-ascii?Q?Q6BYM999FTUuA2aJDFD0uy7nboRDxehge82xPD+66gfb2288G1E52PAN08YA?=
 =?us-ascii?Q?2r5+Jtzc6AN15InVpi4Yv/KLzS0TS/Jiy7E/8ZwMegxu8q5BX2qqpw1gF16x?=
 =?us-ascii?Q?SNG7UR75iwS4BUhTNKdzhDKJ8DBTEDYJj1gnkXYGgcvAwaMZOerfeMxMxKeO?=
 =?us-ascii?Q?tVfr59i08w3Km69uqrMxr/fo30/UJICVXxQx9AC5JwUbzV9Apl+0ZpG7MBrR?=
 =?us-ascii?Q?TK8IQ/mqxNejURqDTRnCgMV5FFUw6q0SSsMPk325LTwd8s4ULjEVXbB26+Zr?=
 =?us-ascii?Q?9W2h2r7GynIPW5ZHEsGHsflWQ1QV3P0QwSPWmQxpiulE41bU4Oq1yKJRSPBC?=
 =?us-ascii?Q?IYngFeYYRqg5FafftdkK30ifWWRoonQRMx7deDQGqdiBTKDhJ8ISzq7TPKFt?=
 =?us-ascii?Q?aNdtIAigafsL9NmrTomXgVhbxYpa5nAnpjTKFvPEhx0lR6FqqAURJl9bU5lm?=
 =?us-ascii?Q?7WT1gY70WAhFU0KtOs71vrAexsRYdl/xgHjPxlbuYvJHLGnYM7zSxo2TRqJo?=
 =?us-ascii?Q?vkPg86wNT/b3rk+7asAh/qi01CWJbZy26q1XyuqZ2Rh7Q8ZC7TCc8ex4Voya?=
 =?us-ascii?Q?Lp/55RdEkF2GIRbU7fRyvF2DhFTg3KQZ8kla5pyXQLn5MwJNhsgp7Kv1JV5p?=
 =?us-ascii?Q?xtwQjhm0dxYb2LXXOxjwdBJzlw8mU49ag15wgHNrBbbWClipyyXVFkFeJFkO?=
 =?us-ascii?Q?Dbo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ecad77-0f1e-4bbb-95ec-08d91a1f9068
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 17:08:31.7482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okfuWLlqoFzQA4q/FNlwd6a+iZVdW09yt3EZYJ4Wa+P8Nf3XjQ0nHl6B4SlX5fBYnUyv2Z4Eh2eUhR3OJ8TcLw7fB3JKfhp6o9mfYIA3hzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1966
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105180118
X-Proofpoint-ORIG-GUID: T8Bkcj4Ro7fopVHiYfuvT97vuLV9l-1O
X-Proofpoint-GUID: T8Bkcj4Ro7fopVHiYfuvT97vuLV9l-1O
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180117
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Igor,
Thanks for the information. I am primarily interested in ensuring data pers=
istence in the case of #1.
As it stands so far, I have yet to observe any kind of write back into the =
backing file. Just to summarize,
what I've done thus far is:

in erst_realizefn():
...
    s->hostmem_obj =3D object_new(TYPE_MEMORY_BACKEND_FILE);
    object_property_set_str(s->hostmem_obj, "mem-path", (const char *)(TYPE=
_ACPI_ERST ".hostmem"), &error_fatal);
    object_property_set_int(s->hostmem_obj, "size", s->prop_size, &error_fa=
tal);
    user_creatable_complete(USER_CREATABLE(s->hostmem_obj), &error_fatal);
    s->hostmem =3D MEMORY_BACKEND(s->hostmem_obj);

and then in erst_update_backing_file(), which is called when records are cr=
eated/updated:

...
    if ((mr =3D host_memory_backend_get_memory(s->hostmem))) {
        uint8_t *p =3D (uint8_t *)memory_region_get_ram_ptr(mr);
        memcpy(p + offset, data, length);
        memory_region_msync(mr, 0, s->prop_size); /* for now, the whole thi=
ng */
}

I've instrumented this code, and I can see the records. I've instrumented m=
emory_region_msync() all the way down
to qemu_msync() and it makes it into that code. But the end result has alwa=
ys been the same, the backing file is
never updated.

I'm not really sure what else I need to do to get the hostmem contents to b=
e written back into the file.
Thanks,
eric


________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Monday, May 17, 2021 11:31 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.c=
om>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-deve=
l@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <=
boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redh=
at.com <jusual@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature

On Mon, 17 May 2021 15:01:02 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Hi Igor,
> I've been working to transition ERST to use the hostmem-file object as th=
e backing store, as requested.
>
> I have the backend-file object now in ERST, and I have a question for you=
. This hostmem-file initializes
> itself from a file, but in looking at the code, I do not see that it ever=
 writes back to the file!? Furthermore,
> I don't see a "flush" type method to force writeback of data in the objec=
t back to file?
>
> The original ERST code would flush/write to the backing file each record =
as it was created. I don't see
> any equivalent way of doing that with hostmem-file?

To force flush you can use memory_region_msync() on MemoryRegion that you g=
et from hostmem backend.
But question is what are you trying to achieve with sync
  1. data persistence in case of QEMU crash
  2. data persistence in case of host crash

for the former you do not need explicit sync as memory buffers should be fl=
ushed to disk by kernel
if you put backend on nvdimm, you should get 2 without sync as well (see pm=
em=3Don property)

just do not forget that sync is not free, so if #1 is acceptable I'd avoid =
explicit sync.


> Please point out where I am misunderstanding.
>
> Thanks,
> eric
>
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Monday, May 3, 2021 12:07 PM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat=
.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-de=
vel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky=
 <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@re=
dhat.com <jusual@redhat.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
>
> On Mon, 3 May 2021 15:49:28 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> > Igor,
> > I've rebased the original patches on to qemu-v6.0.0-rc4, and finally ha=
ve everything working as it previously did.
> > I've started now to work to incorporate the HostMemoryBackendFile; that=
 is progressing.
> > My question for you today is with regard to placing ERST device on PCI.=
 The PCI example provided is a template device, and while I do find that he=
lpful, I still do not understand how the ERST Actions, which contain GAS fo=
r describing the register accesses, would be patched/linked when a PCI bar =
is assigned. Or is there perhaps another way of obtaining the PCI BAR using=
 ACPI semantics?
>
> current order of initialization is,
>  0. QEMU builds initial ACPI tables (unpatched, mainly used to gauge tota=
l size of ACPI tables) and starts guest
>  1. guest firmware initializes PCI devices (including BARs)
>  2. guest reads ACPI tables from QEMU(via fwcfg)
>  2.1 reading ACPI tables traps into QEMU and QEMU rebuilds all ACPI table=
s (including ERST)
>       at this time one can get info from PCI devices (probably pci_get_ba=
r_addr() is what you are looking for)
>       that were initialized by firmware and build tables using address.
>       Maybe it will need dynamic tables patching but lets get to that onl=
y if rebuilding table won't be enough
>
>
>
> > Thanks,
> > eric
> >
> > ________________________________
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Wednesday, April 14, 2021 4:17 AM
> > To: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redh=
at.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-=
devel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovs=
ky <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@=
redhat.com <jusual@redhat.com>
> > Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> >
> > On Fri, 9 Apr 2021 15:54:47 +0000
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >
> > > Hi Igor,
> > > Thank you for reviewing. I've responded inline below.
> > > eric
> > >
> > > ________________________________
> > > From: Igor Mammedov <imammedo@redhat.com>
> > > Sent: Tuesday, April 6, 2021 2:31 PM
> > > To: Eric DeVolder <eric.devolder@oracle.com>
> > > Cc: mst@redhat.com <mst@redhat.com>; marcel.apfelbaum@gmail.com <marc=
el.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twi=
ddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; qemu=
-devel@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostrovsky=
@oracle.com>; kwilk@oracle.com <kwilk@oracle.com>
> > > Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> > >
> > > On Mon,  8 Feb 2021 15:57:55 -0500
> > > Eric DeVolder <eric.devolder@oracle.com> wrote:
> > >
> > > > This change implements the support for the ACPI ERST feature[1,2].
> > > >
> > > > The size of the ACPI ERST storage is declared via the QEMU
> > > > global parameter acpi-erst.size. The size can range from 64KiB
> > > > to to 64MiB. The default is 64KiB.
> > > >
> > > > The location of the ACPI ERST storage backing file is delared
> > > > via the QEMU global parameter acpi-erst.filename. The default
> > > > is acpi-erst.backing.
> > > >
> > > > [1] "Advanced Configuration and Power Interface Specification",
> > > >     version 6.2, May 2017.
> > > >     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> > > >
> > > > [2] "Unified Extensible Firmware Interface Specification",
> > > >     version 2.8, March 2019.
> > > >     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_fi=
nal.pdf
> > > >
> > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > >
> > > items 2/4/5 from v1 review still need to be addressed.
> > >
> > > >
> > > > 2. patch is too big to review, please split it up in smaller chunks=
.
> > > >
> > > > EJD: Done.
> > >
> > > (separating a header and a makefile rule doesn't make much sense)
> > >
> > > it should be split at least on part that implements device model and =
ACPI parts
> > >
> > > EJD: I'll rebase this patch set on qemu-6 and accommodate your sugges=
tions with how to split/organize the patch set.
> > >
> > > [...]
> > > >
> > > > 4. Maybe instead of SYSBUS device, implement it as a PCI device and
> > > >    use its BAR/control registers for pstore storage and control int=
erface.
> > > >    It could save you headache of picking address where to map it +
> > > >    it would take care of migration part automatically, as firmware
> > > >    would do it for you and then QEMU could pickup firmware programm=
ed
> > > >    address and put it into ERST table.
> > > > EJD: Thanks for the idea. For now I've left it as a SYSBUS device; =
we can revisit as needed.
> > >
> > > I would really prefer to see a PCI version (current way is just a hac=
k)
> > >
> > > EJD: I understand, I don't like the base address problem either. Is t=
here an example PCI device that gets its base address assigned during ACPI =
setup that I could reference and pattern this work after? I've been using S=
YSBUS as that most closely mimics the real hardware implementations I've st=
udied in order to produce this code.
> > > EJD: I thought my inexperience with authoring QEMU devices was the pr=
imary problem in establishing a solution for the base address. Otherwise, t=
his thing only needs a single 4KiB page (for the 2 registers + exchange buf=
fer) exposed.
> >
> > I don't recall if we merged example PCI device in QEMU, but someone wor=
ked on it before.
> > Google search yields following:
> >  https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a=
926f58328b9675fc98
> >
> >
> > > > 5. instead of dealing with file for storage directly, reuse hostmem=
 backend
> > > >    to provide it to for your device. ex: pc-dimm. i.e. split device
> > > >    on frontend and backend
> > > >
> > > > EJD: I had looked into that prior to posting v1. The entire ERST st=
orage is not memory mapped, just an exchange buffer. So the hostmem backend=
 is not suitable for this purpose.
> > >
> > > Is there a compelling reason why it can't be memory mapped?
> > >
> > > EJD: Well, this ERST device I've coded pretty much follows the ACPI E=
RST spec verbatim. As it stands today, the spec doesn't provide a way to re=
port the total size of the persistent storage behind the interface; you kno=
w when storage is full only when you receive an Out Of Storage error code u=
pon write. In a sense, that allows the size of the storage to vary greatly =
and be implemented in any way needed (ie actual hardware, this has tended t=
o be in the 64KiB range when it is carved out of system parallel flash memo=
ry, but some hardware uses serial flash as well). In virtual environments, =
it can be of any size, and we at Oracle have intentions of heavily utilizin=
g ACPI ERST to stuff all kinds of diagnostic information into it, thus want=
ing the storage to be very large. By not actually exposing/memory-mapping t=
he storage, the issue of where to drop it in the memory map goes away (yes =
a PCI BAR could solve this).
> > > EJD: But at the end of the day, could this storage be memory mapped? =
I suppose it could be, but then that rather circumvents the entire need for=
 the ACPI ERST interface to start with. Linux and Windows both already know=
 how to utilize ACPI ERST.
> >
> > Maybe I wasn't clear on it, I did not propose to map storage into guest=
.
> > Only use MemoryRegion provided by backend inside of your device.
> > This way you can drop all file related code from your patch,
> > and just work with read/store info from/to memory directly.
> >
> > [...]
> >
>


--_000_CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9CO1PR10MB4531namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Igor,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the information. I am primarily interested in ensuring data pers=
istence in the case of #1.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As it stands so far, I have yet to observe any kind of write back into the =
backing file. Just to summarize,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
what I've done thus far is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
in erst_realizefn():</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
...</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; s-&gt;hostmem_obj =3D object_new(TYPE_MEMORY_BACKEND_FILE);
<div>&nbsp; &nbsp; object_property_set_str(s-&gt;hostmem_obj, &quot;mem-pat=
h&quot;, (const char *)(TYPE_ACPI_ERST &quot;.hostmem&quot;), &amp;error_fa=
tal);</div>
&nbsp; &nbsp; object_property_set_int(s-&gt;hostmem_obj, &quot;size&quot;, =
s-&gt;prop_size, &amp;error_fatal);
<div>&nbsp; &nbsp; user_creatable_complete(USER_CREATABLE(s-&gt;hostmem_obj=
), &amp;error_fatal);</div>
<div>&nbsp; &nbsp; s-&gt;hostmem =3D MEMORY_BACKEND(s-&gt;hostmem_obj);</di=
v>
<div><br>
</div>
<div>and then in erst_update_backing_file(), which is called when records a=
re created/updated:</div>
<div><br>
</div>
<div>...</div>
<div>&nbsp; &nbsp; if ((mr =3D host_memory_backend_get_memory(s-&gt;hostmem=
))) {
<div>&nbsp; &nbsp; &nbsp; &nbsp; uint8_t *p =3D (uint8_t *)memory_region_ge=
t_ram_ptr(mr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; memcpy(p + offset, data, length);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; memory_region_msync(mr, 0, s-&gt;prop_size=
); /* for now, the whole thing */<br>
</div>
<div>}</div>
<div><br>
</div>
</div>
<div>I've instrumented this code, and I can see the records. I've instrumen=
ted memory_region_msync() all the way down</div>
<div>to qemu_msync() and it makes it into that code. But the end result has=
 always been the same, the backing file is</div>
<div>never updated.</div>
<div><br>
</div>
<div>I'm not really sure what else I need to do to get the hostmem contents=
 to be written back into the file.</div>
<div>Thanks,</div>
<div>eric</div>
<div><br>
</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;ima=
mmedo@redhat.com&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 11:31 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com =
&lt;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-de=
vel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonz=
ini@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;;
 rth@twiddle.net &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redh=
at.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 17 May 2021 15:01:02 +0000<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; Hi Igor,<br>
&gt; I've been working to transition ERST to use the hostmem-file object as=
 the backing store, as requested.<br>
&gt; <br>
&gt; I have the backend-file object now in ERST, and I have a question for =
you. This hostmem-file initializes<br>
&gt; itself from a file, but in looking at the code, I do not see that it e=
ver writes back to the file!? Furthermore,<br>
&gt; I don't see a &quot;flush&quot; type method to force writeback of data=
 in the object back to file?<br>
&gt; <br>
&gt; The original ERST code would flush/write to the backing file each reco=
rd as it was created. I don't see<br>
&gt; any equivalent way of doing that with hostmem-file?<br>
<br>
To force flush you can use memory_region_msync() on MemoryRegion that you g=
et from hostmem backend.<br>
But question is what are you trying to achieve with sync<br>
&nbsp; 1. data persistence in case of QEMU crash<br>
&nbsp; 2. data persistence in case of host crash<br>
<br>
for the former you do not need explicit sync as memory buffers should be fl=
ushed to disk by kernel<br>
if you put backend on nvdimm, you should get 2 without sync as well (see pm=
em=3Don property)<br>
<br>
just do not forget that sync is not free, so if #1 is acceptable I'd avoid =
explicit sync.<br>
<br>
<br>
&gt; Please point out where I am misunderstanding.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; eric<br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; Sent: Monday, May 3, 2021 12:07 PM<br>
&gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; Cc: ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com &l=
t;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-deve=
l@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonzin=
i@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; rth@t=
widdle.net
 &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redhat.com&gt;<br>
&gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature<b=
r>
&gt; <br>
&gt; On Mon, 3 May 2021 15:49:28 +0000<br>
&gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; Igor,<br>
&gt; &gt; I've rebased the original patches on to qemu-v6.0.0-rc4, and fina=
lly have everything working as it previously did.<br>
&gt; &gt; I've started now to work to incorporate the HostMemoryBackendFile=
; that is progressing.<br>
&gt; &gt; My question for you today is with regard to placing ERST device o=
n PCI. The PCI example provided is a template device, and while I do find t=
hat helpful, I still do not understand how the ERST Actions, which contain =
GAS for describing the register accesses,
 would be patched/linked when a PCI bar is assigned. Or is there perhaps an=
other way of obtaining the PCI BAR using ACPI semantics?&nbsp;
<br>
&gt; <br>
&gt; current order of initialization is,<br>
&gt;&nbsp; 0. QEMU builds initial ACPI tables (unpatched, mainly used to ga=
uge total size of ACPI tables) and starts guest<br>
&gt;&nbsp; 1. guest firmware initializes PCI devices (including BARs)<br>
&gt;&nbsp; 2. guest reads ACPI tables from QEMU(via fwcfg)<br>
&gt;&nbsp; 2.1 reading ACPI tables traps into QEMU and QEMU rebuilds all AC=
PI tables (including ERST)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; at this time one can get info from=
 PCI devices (probably pci_get_bar_addr() is what you are looking for)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; that were initialized by firmware =
and build tables using address.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe it will need dynamic tables =
patching but lets get to that only if rebuilding table won't be enough<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; Thanks,<br>
&gt; &gt; eric<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; &gt; Sent: Wednesday, April 14, 2021 4:17 AM<br>
&gt; &gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; &gt; Cc: ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.c=
om &lt;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu=
-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pb=
onzini@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;;
 rth@twiddle.net &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redh=
at.com&gt;<br>
&gt; &gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feat=
ure<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 9 Apr 2021 15:54:47 +0000<br>
&gt; &gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; &gt; Hi Igor,<br>
&gt; &gt; &gt; Thank you for reviewing. I've responded inline below.<br>
&gt; &gt; &gt; eric<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ________________________________<br>
&gt; &gt; &gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; &gt; &gt; Sent: Tuesday, April 6, 2021 2:31 PM<br>
&gt; &gt; &gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; &gt; &gt; Cc: mst@redhat.com &lt;mst@redhat.com&gt;; marcel.apfelbaum@=
gmail.com &lt;marcel.apfelbaum@gmail.com&gt;; pbonzini@redhat.com &lt;pbonz=
ini@redhat.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@redha=
t.com &lt;ehabkost@redhat.com&gt;; qemu-devel@nongnu.org &lt;qemu-devel@non=
gnu.org&gt;;
 Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle.com &lt;k=
wilk@oracle.com&gt;<br>
&gt; &gt; &gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST=
 feature<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon,&nbsp; 8 Feb 2021 15:57:55 -0500<br>
&gt; &gt; &gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; &gt; &gt;&nbsp; <br>
&gt; &gt; &gt; &gt; This change implements the support for the ACPI ERST fe=
ature[1,2].<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The size of the ACPI ERST storage is declared via the Q=
EMU<br>
&gt; &gt; &gt; &gt; global parameter acpi-erst.size. The size can range fro=
m 64KiB<br>
&gt; &gt; &gt; &gt; to to 64MiB. The default is 64KiB.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The location of the ACPI ERST storage backing file is d=
elared<br>
&gt; &gt; &gt; &gt; via the QEMU global parameter acpi-erst.filename. The d=
efault<br>
&gt; &gt; &gt; &gt; is acpi-erst.backing.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1] &quot;Advanced Configuration and Power Interface Sp=
ecification&quot;,<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 6.2, May 2017.<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.uefi.org=
/sites/default/files/resources/ACPI_6_2.pdf">
https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [2] &quot;Unified Extensible Firmware Interface Specifi=
cation&quot;,<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 2.8, March 2019.<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sit=
es/default/files/resources/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.c=
om&gt;&nbsp; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; items 2/4/5 from v1 review still need to be addressed.<br>
&gt; &gt; &gt;&nbsp; <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; 2. patch is too big to review, please split it up in sm=
aller chunks.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; EJD: Done.&nbsp; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; (separating a header and a makefile rule doesn't make much s=
ense)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; it should be split at least on part that implements device m=
odel and ACPI parts<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EJD: I'll rebase this patch set on qemu-6 and accommodate yo=
ur suggestions with how to split/organize the patch set.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [...]&nbsp; <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; 4. Maybe instead of SYSBUS device, implement it as a PC=
I device and<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; use its BAR/control registers for pst=
ore storage and control interface.<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; It could save you headache of picking=
 address where to map it +<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; it would take care of migration part =
automatically, as firmware<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; would do it for you and then QEMU cou=
ld pickup firmware programmed<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; address and put it into ERST table.<b=
r>
&gt; &gt; &gt; &gt; EJD: Thanks for the idea. For now I've left it as a SYS=
BUS device; we can revisit as needed.&nbsp;
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would really prefer to see a PCI version (current way is j=
ust a hack)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EJD: I understand, I don't like the base address problem eit=
her. Is there an example PCI device that gets its base address assigned dur=
ing ACPI setup that I could reference and pattern this work after? I've bee=
n using SYSBUS as that most closely mimics
 the real hardware implementations I've studied in order to produce this co=
de.<br>
&gt; &gt; &gt; EJD: I thought my inexperience with authoring QEMU devices w=
as the primary problem in establishing a solution for the base address. Oth=
erwise, this thing only needs a single 4KiB page (for the 2 registers + exc=
hange buffer) exposed.&nbsp;
<br>
&gt; &gt;<br>
&gt; &gt; I don't recall if we merged example PCI device in QEMU, but someo=
ne worked on it before.<br>
&gt; &gt; Google search yields following:<br>
&gt; &gt;&nbsp; <a href=3D"https://github.com/grandemk/qemu_devices/commit/=
ba8d38a858ba63ef4d419a926f58328b9675fc98">
https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a926f5=
8328b9675fc98</a><br>
&gt; &gt;<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; &gt; &gt; 5. instead of dealing with file for storage directly, r=
euse hostmem backend<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; to provide it to for your device. ex:=
 pc-dimm. i.e. split device<br>
&gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp; on frontend and backend<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; EJD: I had looked into that prior to posting v1. The en=
tire ERST storage is not memory mapped, just an exchange buffer. So the hos=
tmem backend is not suitable for this purpose.&nbsp;
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is there a compelling reason why it can't be memory mapped?<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EJD: Well, this ERST device I've coded pretty much follows t=
he ACPI ERST spec verbatim. As it stands today, the spec doesn't provide a =
way to report the total size of the persistent storage behind the interface=
; you know when storage is full only when
 you receive an Out Of Storage error code upon write. In a sense, that allo=
ws the size of the storage to vary greatly and be implemented in any way ne=
eded (ie actual hardware, this has tended to be in the 64KiB range when it =
is carved out of system parallel
 flash memory, but some hardware uses serial flash as well). In virtual env=
ironments, it can be of any size, and we at Oracle have intentions of heavi=
ly utilizing ACPI ERST to stuff all kinds of diagnostic information into it=
, thus wanting the storage to be
 very large. By not actually exposing/memory-mapping the storage, the issue=
 of where to drop it in the memory map goes away (yes a PCI BAR could solve=
 this).<br>
&gt; &gt; &gt; EJD: But at the end of the day, could this storage be memory=
 mapped? I suppose it could be, but then that rather circumvents the entire=
 need for the ACPI ERST interface to start with. Linux and Windows both alr=
eady know how to utilize ACPI ERST.&nbsp;
<br>
&gt; &gt;<br>
&gt; &gt; Maybe I wasn't clear on it, I did not propose to map storage into=
 guest.<br>
&gt; &gt; Only use MemoryRegion provided by backend inside of your device.<=
br>
&gt; &gt; This way you can drop all file related code from your patch,<br>
&gt; &gt; and just work with read/store info from/to memory directly.<br>
&gt; &gt;<br>
&gt; &gt; [...]<br>
&gt; &gt;&nbsp; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9CO1PR10MB4531namp_--


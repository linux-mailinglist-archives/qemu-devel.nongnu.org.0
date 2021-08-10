Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1263E5508
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:24:49 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDN44-0005ve-F5
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mDN3A-00050B-F5; Tue, 10 Aug 2021 04:23:52 -0400
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90]:18802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mDN37-0004ks-KB; Tue, 10 Aug 2021 04:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628583829; x=1660119829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NbWq9gFLOm0Wglm0Cf1zlp7Ji8hNam/OgVbqzW3UNKE=;
 b=lpdHLs5CxBxNOB4s/ZzXEY05lfRi22eN2P4SwAysg8E55EUvTOcGKycZ
 SrQp6xwc1CIajiyEvO3np91bfJGx+skFOt47sJhVFKT1Qg30BwCQK9uhg
 Mui+Lh1IWD3NSuVkNZ+jkNa/kzPIzuvUeKxoyChE3swi55w46fjFqGamA
 Ymkb70+3n4PATepFoLqdAhcdSQDR8CHgoMKpehVMWIR8oF3XjLHuecUOU
 0NfzMIc/DgpEEd+3fxrLz3OqUszz+pE72g5h6XaqIjG56W9GeA03nDNtv
 HYNLaZlXxvLSgUYXY+k+99XUkQ0C2t2DG1kgRIF660kJBL01nXivjbiTs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="36476864"
X-IronPort-AV: E=Sophos;i="5.84,309,1620658800"; d="scan'208";a="36476864"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 17:23:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khzgAKyP0bmUO1UPUh6CjkEfFYaHiB9londjvzWSVsEMHOU+qhDuT17xlGcfV8MmWdqKBrTshxE/VSdQrGzea69t8X3AIc2PdJrfMHF3tT3Fxv/Mjr0UH34VFG1HUMDSCWEmBqMNV7VcweePTOFOUj/M7I9tXxS2c1QDw3/Wu7ZGxtR+4Eezehl4FCilJd/wdDYTGZFd1OGSvtFu+pEBGxM3D5b0cqlfbJ7Q9e7Ew4hPQ6LRNDdHxzmsUeudm1wBi+nr9VpzFMkNo9D7DY+5VRc1xSVfoMKfciKpJiEjYr85ajIlqMjB6EiaGw3lwOADCGFN0Cmzj9wDWleOlbFBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cPRbAHTfaNKv5Ff0yAnIC8Y4fcqmcro6NtipEpGs8s=;
 b=Zf2tzoftYTTcI+Brpyg6nES364K3F6AF8PGb1K+twZ8aa7Q8KTb6XCqB1weY6tVTk5XJJYec5HugYhauUrdaFpNgzK4WRe8fTfm+AKK2ch07hWDbzkGPxeguOrJcqFLk0R0U5GcLxx2xmjsgB1531nP4zP//AFbm3DgFEinGbF12xElMamrZ5fSjqcsUpRx89Gwl+GqFkUe5O8O62e6VloZUXkNfibSu/4KC/Y7WLGl30qIMd1O9Y2SRX2kVj0vrDk0RyTCGuUwA2kq3eYfAHkA3L23uOBkoTBhbJzzu+FT/S4rm05Le6rHUVYwXQ/XoEJetUxtqi5KT6OAQYNJJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cPRbAHTfaNKv5Ff0yAnIC8Y4fcqmcro6NtipEpGs8s=;
 b=KgZiS9nGtrv8zLiB48BGPhYZVZRtt4EQumgJprnWabRe80KaCFVUegktK3AiW5D7NoyR3PrnduM87BjKXxIBy+pzgO83dDSdn4P8ziAU2pInHkX5hLlIUFHgqhcLwDUB4f37n3Lw91CTTmYR2wdsos6b6AOVGt7WMsT03sQ9TsY=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYBPR01MB5455.jpnprd01.prod.outlook.com (2603:1096:404:8026::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 10 Aug
 2021 08:23:41 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 08:23:40 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Thread-Index: AQHXicvRRXtwLvmObkuHxn+n0+8QAatkxVQAgAdndqA=
Date: Tue, 10 Aug 2021 08:23:39 +0000
Message-ID: <TYCPR01MB6160A85D5A15580645876DB9E9F79@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
 <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
 <20210805112432.mjrqizexwyammfm5@gator.home>
In-Reply-To: <20210805112432.mjrqizexwyammfm5@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9OTczZjhjYWMtNmQ2Ni00ODIxLTg2ZmUtNGQ1?=
 =?iso-2022-jp?B?N2ZhZDM1YjViO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMTBUMDQ6Mjg6MzhaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34ab145e-7b15-4825-5b89-08d95bd82882
x-ms-traffictypediagnostic: TYBPR01MB5455:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYBPR01MB54551CE4441914BCFBABB0E2E9F79@TYBPR01MB5455.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h/qJ0sGdAgWi5WYdz4FqRmYXjgx8ZvVDaPsJj/Gabz4qDJhL7y0HgCtqqO8lHb7G6aqSbAUgVmH6xupDIQpx7h8ISy0Hx3SZQ9GS0uANskQUdKHdrA8nSvIpiI/LsDIqS7mtm4GLtghJPddB+lhCN8cOQXO9g2hh/1EkR72LtXvcP/IC6kSw51FvVCwxoG9uzhiEFTKHmJPVVCyqoEoIUvRJ8lxctAmyDDhoQe2rap8i2Laqjroy6lX4jZeHBJ1wDlUqW5FNnUXy76sggGtqtpDy592yRTZXgQOltHQfjXpNqYpInvjgqjQrPrL6X0/qCvjcVL4ghrG1Ucj5FlTdZwG7C6PFoOXdUh9vPbNjKVgV92xf9E7mdUphOnJQsk4f7glIPCjhzDq/kNwowpCDdTbzsvMRiPkULPiiPx1ufjKTXF103rspNJTS/5hVYmYFFLLvMwHu32PhcyxkdwFyI6Xnq8ICFJ5ibi/vbK5IYjdvAqa3RyrkeXl0XxR8cPBSyL8lDA/SQ2n5FORzlP2rzik/CVeKrfBP2gpxTvwqg6QY/pOiDCMYYUgOB+fSnO5uk3tEZhApQE/hFr8xros/cPFUa/dzccMwu64TJt46YjisYihJtIaLfhxPfkQisjAzYVOyh+IIjSR1G0HPfbTXTRetaqqPaIN7PYssC/6Tk6nyrk+JEtZMvnvH2ipxY7PMm/gv614dOgTHCXLGyFdcRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(52536014)(55016002)(5660300002)(8676002)(186003)(478600001)(38070700005)(85182001)(26005)(122000001)(83380400001)(2906002)(86362001)(107886003)(71200400001)(33656002)(9686003)(6916009)(53546011)(316002)(6506007)(38100700002)(66946007)(8936002)(64756008)(7696005)(66476007)(66556008)(4326008)(66446008)(54906003)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?ak4xamxFaTJONkRlWmp3OEhMVGIybTMwRlk3Vm14bUpJUkZ2L2tEY2Na?=
 =?iso-2022-jp?B?b25mTmd2bVR6eFpKZWJxLzd6YjBMSWxWZG9NY1VnbzZEL29PYjhhVHpr?=
 =?iso-2022-jp?B?UnNnMmlFc2hkUWlsTkFJcHZkSzN6anhSWEZobk9mMGltWGlOcHEzS25z?=
 =?iso-2022-jp?B?OWZhQ2xUcVZsem1TV2l2OHdNN2ZRdFRRdEszS1V6eFpwWmtRdUZRQUVQ?=
 =?iso-2022-jp?B?Q3ZHZCtrUXNITmRMdWZYQitnLzlvK3VMOGdHTHFTc0xKbWVLbU9vWEUv?=
 =?iso-2022-jp?B?QVUzNm11c0ZSQklaS0VSamVTa1RNVTBYdVZJejVVdjVJcVRDSUF4RU14?=
 =?iso-2022-jp?B?aDQ5WENpZUlEeU1vbnQrU1c3bDFkUzZxYzk1bmphZm1nU0x6MFM2b1Av?=
 =?iso-2022-jp?B?N1RjS2lQUjNtVTZ5STVZeDZkbmtTcTQxaktVNXI0REpwZGpMWFN1cnh0?=
 =?iso-2022-jp?B?WkZCMUk3RlVFODRCWitucXN3UTlZeHFPNEgvajBINlNMaG5tSVdIVXky?=
 =?iso-2022-jp?B?MVJJbDFoMk1qVStpdFJBNWlHNUc1WWdPL1BEb3pBM3BnVkJUM2JZWlVp?=
 =?iso-2022-jp?B?SUpVdzlEemxQZUxLcWZRWW9HN3BKc2laNFlMR1orb1AxcHpMQWl1aXU2?=
 =?iso-2022-jp?B?dENQMk5McGtab1BmTDQwQ0VWT0d2eUVCTTkwZ0JQdW1qb0NkMndCWG1U?=
 =?iso-2022-jp?B?S0llM1NmTXdBcTMzUWNZSG1XWC9hUU9kZ2RJdkVCSFE2ZkNSQ3QyZlBj?=
 =?iso-2022-jp?B?amZLQlEwUTM0clBZUkh2aU5qTGZQa3p1V1NRMWl2RGpkNTRDenA2Mno1?=
 =?iso-2022-jp?B?NS9JaFJ2SWNLWHNIL0NWZzFkOWdEN25PUG1aMjRydzRET2x2OERaYnpN?=
 =?iso-2022-jp?B?dlIwMmRZa0FQdWNobFNIQ3YxUDRkUGZ2bUsyY3J3QmZrUU1MbFNKVHdC?=
 =?iso-2022-jp?B?c1ZmMVBkd2gxeHJHU3U1ZHE1SWR1Uk85UWJwUFlIZTZLYjY2L0kva2Zw?=
 =?iso-2022-jp?B?LzdqaHZHQzRZd3BueU5aTDVnYitmVVU2QStGWWpMeGQrUGNqeXJyZU5S?=
 =?iso-2022-jp?B?NUhzNkl6clByb3dLTE83MGRYM252WWIwa1JScjJKQVRLK1Y1OWlySXQr?=
 =?iso-2022-jp?B?Yis5SWtQUWRhTFZhYm1qRVVLdnd5RGRibzdxbmNaRGJRWk04S3ErWk4v?=
 =?iso-2022-jp?B?eTRzSkRudE5sbDlMbzFwTURmaGk1UktjcGdkSGdpWDBZQW1seXpTRWw5?=
 =?iso-2022-jp?B?aTZVOWQ4NlRDMzZXc1h2UFcyRUVRS1lVN0ovcmxSeTU2czlnS21HMzNJ?=
 =?iso-2022-jp?B?UG9tWUNsalVMeXR4TFUzcmxyOFlXSElrd0R5TU11eXVsaXFFZmVxb1lS?=
 =?iso-2022-jp?B?U3lhajAzeVRoNE10ZjBnbGdpVFg5dUYxREhaZTRoQTVWdllPUVA2UUN1?=
 =?iso-2022-jp?B?eTZhSGtEQ3hxKzRHU3RGM0dUbG41TW8zMFJoT0htV0pOR1pWejlSRHlG?=
 =?iso-2022-jp?B?OEcyYUdGNUt1Y3RqVHNjNUFLTjZ4dExjOW1HVTdFa2VLazRKMVdvcWtE?=
 =?iso-2022-jp?B?WmtKL09wODk5VEJLamNFc3J2S0pnc3AxLzg3UnBEQUE4UWZvV2xmd3E2?=
 =?iso-2022-jp?B?aGdPYXN2SFh0S2Z3eG8xQUxoVXF4eXh3OTNmOFBUSDRrRzhFcm41Nmlr?=
 =?iso-2022-jp?B?YytXRlpYYlUvaVhrKzdyZUpxMGRVc1lXcmRuSUszMklZdVBHenRXM3Fx?=
 =?iso-2022-jp?B?VHBvZmd0NW5iTU80Yit4UHZkRldrWWw0dzd4S2tMdWpiaWtud3FrV1N6?=
 =?iso-2022-jp?B?VWpHbXcyMHg2QmxpdGVTNjNFMmVoK1N2REVmb0RrTlRqaFE4ditDVFk4?=
 =?iso-2022-jp?B?UXNlTmcrZVpiSG51ODY4OVg1c1NVc3YrTFFEOURPRk9YZlhrUjVVSmts?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ab145e-7b15-4825-5b89-08d95bd82882
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 08:23:39.9355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FG1yo3OoMaJ4lzcJYiycb+34JRuoFT1aAYfT5Z+ZIhRgXCWcEydd5wp5B9SQDYlQPZLVSZrEXgFHLPBiy19lDqAzzwd9alLLtfdCn7Qzflo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5455
Received-SPF: pass client-ip=68.232.159.90;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa9.fujitsucc.c3s2.iphmx.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thanks for your comments.

Before reposting the fix patch series,
based on your comments and the v3 1/3 patch,
we have considered the following fixes.

If you have any comments on the fixes, please let us know.

---

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d5..84ebca731a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2145,6 +2145,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
 };

 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 612644941b..62dcb6a919 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -248,6 +248,21 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }

+static void a64fx_cpu_set_sve(ARMCPU *cpu)
+{
+    /* Suppport of A64FX's vector length are 128,256 and 512byte only */
+    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
+    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
+    set_bit(0, cpu->sve_vq_map); /* 128byte */
+    set_bit(0, cpu->sve_vq_init);
+    set_bit(1, cpu->sve_vq_map); /* 256byte */
+    set_bit(1, cpu->sve_vq_init);
+    set_bit(3, cpu->sve_vq_map); /* 512byte */
+    set_bit(3, cpu->sve_vq_init);
+    cpu->sve_max_vq =3D find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+
+}
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -448,6 +463,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)

     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq =3D max_vq;
+
+       if(arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
+        a64fx_cpu_set_sve(cpu);
+    }
 }

 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *na=
me,
@@ -852,6 +871,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     ARMCPU *cpu =3D ARM_CPU(obj);

     cpu->dtb_compatible =3D "arm,a64fx";
+    set_feature(&cpu->env, ARM_FEATURE_A64FX);
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
@@ -884,10 +904,6 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vpribits =3D 5;
     cpu->gic_vprebits =3D 5;
     /* TODO:  Add A64FX specific HPC extension registers */
-
-    aarch64_add_sve_properties(obj);
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_v=
q,
-                        cpu_max_set_sve_max_vq, NULL, NULL);
 }

 static const ARMCPUInfo aarch64_cpus[] =3D {

---

Best regards.


> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Thursday, August 5, 2021 8:25 PM
> To: Ishii, Shuuichirou <ishii.shuuichir@fujitsu.com>
> Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A6=
4FX
>=20
> On Thu, Aug 05, 2021 at 04:30:43PM +0900, Shuuichirou Ishii wrote:
> > Add a definition for the Fujitsu A64FX processor.
> >
> > The A64FX processor does not implement the AArch32 Execution state, so
> > there are no associated AArch32 Identification registers.
> >
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  target/arm/cpu64.c | 44
> ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > c690318a9b..612644941b 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -847,10 +847,54 @@ static void aarch64_max_initfn(Object *obj)
> >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> >
> > +static void aarch64_a64fx_initfn(Object *obj) {
> > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible =3D "arm,a64fx";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    cpu->midr =3D 0x461f0010;
> > +    cpu->revidr =3D 0x00000000;
> > +    cpu->ctr =3D 86668006;
> > +    cpu->reset_sctlr =3D 0x30000180;
> > +    cpu->isar.id_aa64pfr0 =3D   0x0000000101111111; /* No RAS Extensio=
ns
> */
> > +    cpu->isar.id_aa64pfr1 =3D 0x0000000000000000;
> > +    cpu->isar.id_aa64dfr0 =3D 0x0000000010305408;
> > +    cpu->isar.id_aa64dfr1 =3D 0x0000000000000000;
> > +    cpu->id_aa64afr0 =3D 0x0000000000000000;
> > +    cpu->id_aa64afr1 =3D 0x0000000000000000;
> > +    cpu->isar.id_aa64mmfr0 =3D 0x0000000000001122;
> > +    cpu->isar.id_aa64mmfr1 =3D 0x0000000011212100;
> > +    cpu->isar.id_aa64mmfr2 =3D 0x0000000000001011;
> > +    cpu->isar.id_aa64isar0 =3D 0x0000000010211120;
> > +    cpu->isar.id_aa64isar1 =3D 0x0000000000010001;
> > +    cpu->isar.id_aa64zfr0 =3D 0x0000000000000000;
> > +    cpu->clidr =3D 0x0000000080000023;
> > +    cpu->ccsidr[0] =3D 0x7007e01c; /* 64KB L1 dcache */
> > +    cpu->ccsidr[1] =3D 0x2007e01c; /* 64KB L1 icache */
> > +    cpu->ccsidr[2] =3D 0x70ffe07c; /* 8MB L2 cache */
> > +    cpu->dcz_blocksize =3D 6; /* 256 bytes */
> > +    cpu->gic_num_lrs =3D 4;
> > +    cpu->gic_vpribits =3D 5;
> > +    cpu->gic_vprebits =3D 5;
> > +    /* TODO:  Add A64FX specific HPC extension registers */
> > +
> > +    aarch64_add_sve_properties(obj);
> > +    object_property_add(obj, "sve-max-vq", "uint32",
> cpu_max_get_sve_max_vq,
> > +                        cpu_max_set_sve_max_vq, NULL, NULL);
>=20
> I'm not a huge fan of the sve-max-vq property since it's not a good idea =
to use it
> with KVM, because it's not explicit enough for migration[1]. I realize th=
e a64fx cpu
> type will likely never be used with KVM, but since sve-max-vq isn't neces=
sary[2],
> than I would avoid propagating it to another cpu type. Finally, if you wa=
nt the a64fx
> cpu model to represent the current a64fx cpu, then don't you want to expl=
icitly set
> the supported vector lengths[3] and deny the user the option to change th=
em? You
> could do that by directly setting the vq map and not adding the sve prope=
rties.
>=20
> [1] With KVM, sve-max-vq only tells you the maximum vq, but it won't tell=
 you that
> the host doesn't support non-power-of-2 vector lengths. So you don't get =
an
> explicit vector length list on the command line. Being explicit is the on=
ly safe way
> to migrate (see docs/system/arm/cpu-features.rst:"SVE CPU Property
> Recommendations").
>=20
> [2] If a shorthand is desired for specifying vector lengths, then just us=
e a single
> sve<N> property. For example, sve-max-vq=3D4 and sve512=3Don are identica=
l (but
> keep [1] in mind).
>=20
> [3] a64fx only support 128, 256, and 512 bit vector lengths, afaik.
>=20
> Thanks,
> drew
>=20
> > +}
> > +
> >  static const ARMCPUInfo aarch64_cpus[] =3D {
> >      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn }=
,
> >      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn }=
,
> >      { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn }=
,
> > +    { .name =3D "a64fx",              .initfn =3D aarch64_a64fx_initfn=
 },
> >      { .name =3D "max",                .initfn =3D aarch64_max_initfn }=
,
> >  };
> >
> > --
> > 2.27.0
> >
> >



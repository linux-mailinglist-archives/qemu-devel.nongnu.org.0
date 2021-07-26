Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A013D561D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:05:57 +0200 (CEST)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wYd-0007JL-NY
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7wXP-0006QX-5p; Mon, 26 Jul 2021 05:04:39 -0400
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214]:9110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7wXM-0008El-Sk; Mon, 26 Jul 2021 05:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627290277; x=1658826277;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xWPJ/jsRKk5iPnKASnl6woJptuRfTMcN/A3t3h6h0Tg=;
 b=gTUsDdRoaWQ4pQVcGfCRWKv8P14aI2N5KXKrEQnmBD9Cj/0etKVSf1ux
 1uoIsYfZ09on3mv5dxUoUYMMTSsi3s5VxMZVfLCCnsiuvDKxra2t97Uyl
 d7LQYGgXFwHwy/EifQRefiFoDJjYQ/t+k4Ri5ThM+BuJLBhw+19Y5SKs6
 xjG4KErVd9XmySunFkQZdtWMQlmGZa2nC6NEm2AFLSrcxRzfsuO48JLnk
 P1e6G8guX4lRd9uUQ2KGjM148azW4nmCBvm4MTToItNlIt6sqEWnXr5/N
 ETEjkxrzax5RM7q2lTZuI+Dtl38VvfA5Ji5PkiFtU2qU2IiUV/gBKsHgj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="43463869"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="43463869"
Received: from mail-pu1apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 18:04:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR89MuQF+fIytUkQWLxfRQwDg1bwhw/IQzJ9qZnCkC0pxwgVldc3T567Fe8hOQEMolbt2IWp1AzZkAaYL8ZfQJDITy8LZ3Umqho0YJ/I+8i08f77c2Zdczolk1qpIjzdMvSHQGuDLBqiLml1QrXnk3KzaJ6aR37r5eEJ6+8NHhQCOSs9GB3SKvudYhi1JtxSM4Mmi869ytPn+wd7lggSgIwrkLFkUgPFJvfND0Eks490xbXUx4LdWuexkQK1ycD2nOA7JJOM7x+rQ6HazUWjD4tiQTLJer+3WW8c9XAIjX6gvje63ZnHGJ2zUlRJwRVDosw9etmssAfFV77BVdJz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q27wQPbu5qqJu14jc39vXXD5SK0cT2lSFGK0hf9SnrI=;
 b=bBW00RB9VnMO0sqEDeVHvG+CrP8/0HU8+XtfbRxFCAr570P7x4AL2Djv6Vepx+SxwRnSaUDi1iFlmLixATSAJtdhAccF+N2B6JvoY5Bg0MwSbDEH0Deo+oyvCrqG7zVWraZe79gd6Ld8vdSiv7snJv5ob3rNRRVoVKnWYm/l/+54GcruUUVwejZ/21brIZw3ovshBqgbishVWHZLN8tCpjnmrYdVpekfh9VRKkhgb70IUOPAeU88xISIHZinB0Nln3FzTSDvz0opLxqg05iP1m/RSW2e+KRzrCIbJSToIb/Gz2YRxB+CVM7zgoysKgr4U7uZNnuFQ8qCeLnz1mqLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q27wQPbu5qqJu14jc39vXXD5SK0cT2lSFGK0hf9SnrI=;
 b=DFUlngHE/vbC4goUyX/uzuMUMN2QJW9CMg/MxwWb6K8bdP95XsoLPrbWI6AWwI+Cl2nms1NVSFoaoqolKKKkktKn0hMfw6bsHUMiWLttBOp79D8mGDeqVmcvgcB4Ez8gXKD45EpGRyB0P/8ybxCewKFTNlyCBjQzWdnELtXezCE=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB2186.jpnprd01.prod.outlook.com (2603:1096:404:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 09:04:29 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:04:29 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] This is a test mail
Thread-Topic: [PATCH v2] This is a test mail
Thread-Index: AQHXgfchhDu0sJ7xaEysUeLESXxCSqtU9nZw
Date: Mon, 26 Jul 2021 09:04:29 +0000
Message-ID: <TYCPR01MB61604B3029BFE77CB9F7C912E9E89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9OTZhYzIzOWUtMWEyYS00ZGVjLWEyZDctZjU5?=
 =?iso-2022-jp?B?ZjVlMjgxYjFmO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDctMjZUMDk6MDQ6MTFaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 054137c2-1ca4-49e1-5a08-08d950146038
x-ms-traffictypediagnostic: TY2PR01MB2186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB21869F4BF5725D60BD5AE022E9E89@TY2PR01MB2186.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+gOp+JeuYSPIl2rAfa2DS4eTc1RT/hf03nCcAD1UzocAq0JPnKZT+zCy4ITorsSBBUkRrgJ/syPWRq2O7suaOhQH15dCMgqmZ/Qa4y+zl5BJBPUeH+UdECL8PZrcr0rOrYnIE+FHkXhVdeVDbd6h0ys3VnM6lhDksqJeGJMHyL77nGEa55SvYL6F/v15sLB3is7C0+7gx+sGmCOPbGUTuY6PPj2wUzLXu2v8seMYVWyKn6JD46+VseFRPUTsy+8na1BJZyyOcnDlFhWfM08G9exu+6Nz7pshuVo0bxP51PogSrWhbUawJO9L5Wt41kbNzPAkDNgM9tSYNW13zCa/i5GsrNM6Si26v/QDApcnGzI/O81zzuHqTMUqS+qGLh9ow0gJg6UxSz3a5h6EokuMMYDUleoyyXrOklFwSwQB7X4U/ein/4YV3IknopvY9WRdXwT6+BEhDYaME/74lV8lWenDiJJ3rN81p2nyjosc1ri1ZxBdrwrsJZ4N1tCCZNdoM2csCVy11CNMtfzIx2YeHF9c+jwhG8KyfkLCbB9ECMHRVAoEokLIhb2MnIiqNQ2zWxObYSi9tE7NKcwRC+YwpXx40AvtDkb+lV02m0omtvtsW1uKM8C4FYX2AlD+VkGFn0GkdhagHQeGe+mFV19TMX+p4r7fRleRiD2UG/BNdNuzsCVUcy6Xz2IxunHkH0+YywSh1qL7mmigZDIPFmNVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(53546011)(316002)(110136005)(5660300002)(83380400001)(66556008)(2906002)(66946007)(26005)(66476007)(186003)(6506007)(55016002)(508600001)(33656002)(38100700002)(64756008)(86362001)(9686003)(122000001)(66446008)(76116006)(85182001)(8936002)(7696005)(4744005)(8676002)(450100002)(52536014)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?UTczRlN6MmpGRUZZUHpwUWM2ZEt6RGNEMlJLSHphc1N6Q1cvWGtiWURr?=
 =?iso-2022-jp?B?ZWFhakc1Q21TcTVLekxUM1dSQkdSekhCQ2JUa3BST0NZalVsMUU0dXlx?=
 =?iso-2022-jp?B?NkZGWnRQajErS2NOdzdvbnNHbVFBY3RIS0hoQnZGN0NEclZCTnU4RlVH?=
 =?iso-2022-jp?B?L0JhMWhSZjUzeEFmNkpreDdhU3h2NnZXL3dzNXFHTjExenFjK1d3QnRB?=
 =?iso-2022-jp?B?UlRKWHlES1kzTEgvY0pLbTVNN1JDKzRmV0JZWjE4ZjltUzVnN3hBeGVT?=
 =?iso-2022-jp?B?bmVHQ1hxR21QSU5SVlAwSy9nbnhnMTBpaFpXUVkyK2RtSDBaV0k3Wlky?=
 =?iso-2022-jp?B?Mi9YaVV1Sk4zYldjaThJR2tadDJsckxvWSs1VU9YYk52VndnMWo4RjRw?=
 =?iso-2022-jp?B?RTczekw2ZTBhMDdnSXRidVJvM20rOHdxdmxXSHhzWEtUL1EvZkhEYVo1?=
 =?iso-2022-jp?B?dG9paWx2QnpXY0lBVWVVRkVCaTN0MnJYYTlpV1RGVEIrZWlFQ2hmRVdk?=
 =?iso-2022-jp?B?WDZUZ2IybXpJY2U2YTBQN1Y3SEpLNjNhM3AwL1V2Y1FnbERyajExbThE?=
 =?iso-2022-jp?B?dGk5aksvbkJKU1B5TXEySy8rYlg2dkJrTmZNZkRjdFNIdlhQeC9BWWVH?=
 =?iso-2022-jp?B?azBEN3pGN2l0STFsQWVCeXVoM05BMUJ6QTF3M1Z1ck05ZFB1VU5FZkRD?=
 =?iso-2022-jp?B?K0cwTGVYZjM5WHRqUzlXdHdtek5BRmRYbk5EYUVPSHB0TEFzL0F3ME9U?=
 =?iso-2022-jp?B?UVREdythTThhQVdTNmZTUVNqMUZiL2tRdDZnRWRqM2hSMjdGS2UxcjFG?=
 =?iso-2022-jp?B?T3BKcEdmdzNiWVJrNGs2eHVHakFneHNrSXZpVkNuRjJnNThCYlZTZDZC?=
 =?iso-2022-jp?B?bTBaa1lrSkcxaXF0RlpYSkVac2NTbnEyVU45RENOTUE5UWFtS3RxRDJL?=
 =?iso-2022-jp?B?NFBBQmV5eVF2MllyZ0pneUlkbFlJL1l3SXE4NlVQSGVUaVlTbmdUajVB?=
 =?iso-2022-jp?B?YVFwMGNCM2hiMmxmVGtPYlc3NTR2dGxBMVFTMkc0WFRvVHIyenlDUkpL?=
 =?iso-2022-jp?B?QkxUNWltczV2djRGdVZSSDMraEJvU3pJSHIzL0RsWmF6V01MUlB4OTk2?=
 =?iso-2022-jp?B?bFNESHZYTVRxMkVOQmN3QjRWWVhGeEl5NWxIUG9mUDc0Z2dNQ2JMQU1G?=
 =?iso-2022-jp?B?SmZhOWFBN0xTRUM2cUFLRkd4UVltRXphR3U3Yk9veHFMK3Q4L3ArOVZE?=
 =?iso-2022-jp?B?NWZ6WVVRY1htOEw2RExSeWYrNU5JbUQrVFZKRkhqc2g4c1lqQWowa0lQ?=
 =?iso-2022-jp?B?U2p2aUxlQmV6eEtaSUhLVWcyTmJOdkJKdWpxTUFzVlJTT2Q0Z2lwNkxH?=
 =?iso-2022-jp?B?bit5a2crdk9mVGdwWCtQRXF5TDQ0NkxWTFdWMXdVU0krTWNLTlQrN0hJ?=
 =?iso-2022-jp?B?QzVOeWpkSUo4b2FDZGcyQWZQakhOZm8xenl3RXF3UFNieE5tKzVmdG45?=
 =?iso-2022-jp?B?OW0xdUNQOFV5MVdRdlhveG9hTGJhSHVEeW9KWlhoODZpVFVxTW0yYXFj?=
 =?iso-2022-jp?B?eXJ0U25BdUJnbmhyUlVBVTE0VXpRQlZDdDBPZU1SaW44ZDVyOXlKWlcw?=
 =?iso-2022-jp?B?Mm54bUUweGlKRHpLdTk4L1RVanhZTGMrT0JtYUw3QytIV256Yy9LUGsx?=
 =?iso-2022-jp?B?NlFpOHkveUZGQjN0d1lIeWRxMVpBd0h2ZzBidmkrZnFSZUd5aDFCWEpO?=
 =?iso-2022-jp?B?dlFiRkFiR1RZdStDREFHdkllWDhkcUE0T203U0lCNThBQkRJUS9hVG8x?=
 =?iso-2022-jp?B?a1dyM1QrKzN3cWlCQjRWelQ4c3VFZnJnZkk5dGJDclhHVWNPMnZGWE1X?=
 =?iso-2022-jp?B?TEpqcTFiTTNycEZiOTl0dk5pUFA0PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054137c2-1ca4-49e1-5a08-08d950146038
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 09:04:29.2255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RirbCzUajya9Pu83YwnY9SMZVcuXx1AwbmTEvkqwRpQTCxYVJJve8H60iRhxsr6f4ulHq0qONh6fEmbPLBz3oNoyOmHNsL/lrzV9gcFOMW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2186
Received-SPF: pass client-ip=68.232.151.214;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa4.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test reply.


> -----Original Message-----
> From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> Sent: Monday, July 26, 2021 5:21 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Subject: [PATCH v2] This is a test mail
>=20
> This is a test mail to check the behavior of my mail because it is not li=
sted in the
> ML of qemu-devel.
> I may send several test mails.
>=20
> I apologize and thank you for your patience.
>=20
> Shuuichirou Ishii (1):
>   Test mail v2.     This is a test mail to check the behavior of my mail
>     because it is not listed in the ML of qemu-devel.     I may send
>     several test mails. I apologize and thank you for your patience.
>=20
>  test-mail.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> --
> 1.8.3.1



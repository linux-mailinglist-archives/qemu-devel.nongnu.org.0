Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041E39FDF1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:42:54 +0200 (CEST)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfkb-0005JS-4Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfiP-0003Km-MJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:40:38 -0400
Received: from havoc.proulx.com ([96.88.95.61]:34232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfiM-0008Ju-LS
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:40:36 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id B76B45A4; Tue,  8 Jun 2021 11:40:33 -0600 (MDT)
Authentication-Results: havoc.proulx.com;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="tAcgfX27"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fujitsu.onmicrosoft.com
 header.i=@fujitsu.onmicrosoft.com header.b="VtDeNVw7"; 
 dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Tue, 8 Jun 2021 11:40:33 -0600
Resent-Message-ID: <20210608174033.GC21839@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1loiY3-00053w-6r; Thu, 03 Jun 2021 04:17:51 -0400
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:29684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1loiXy-0004oi-Pz; Thu, 03 Jun 2021 04:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622708267; x=1654244267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zRPS7LTD62fZlXCo/ZLqQxFynmuUqnteaLtHWIHkMlM=;
 b=tAcgfX27oyy6VUrxCYUkt2+V2HTLdElILEhktKAsS3Mpv5KnztLzfXa4
 orzS87a0oFkQOWVyIqfqRrWN90xDak9pp6foWtlYXyhiRa3P8kWxez303
 8YzCX4pkIqT15HVfHv0NUvrT52QfBl1YMunW4Sp5hJBGUB15V08UY4rxV
 bsgh+5MlA8HntbAb7hALjq8opWvSw1rb+8QHi1r9YRblvS6XDpaQn9PD2
 tkRDrSnJrlPIecxCO5MljnwGvHajbeFF+AIwjxgU+q/je4TddZOiRLmzT
 GmmKq5WzTdvg9cbeXKU0PqesJLopUsEr+ZOUtMhIZepvnVdnJ7LMUerTj g==;
IronPort-SDR: dpnYe2i9+i2VTlini5J18wyaryBoUcVeTpcEYcDqF4g8wPpGexqWc4vF3psY8+VdbIwCcZiPqp
 Yb02cvwf61OQaERzTKOxS4zW+9gsnU7ZCAocAT1Lcy1cH11XvF8YytfALP0xV4v4AKcc2a+1u+
 2U/fEfDYSiFj3xUGp1l8PHOM/9wFp2gh+hLbC6VWwsB/kDiGKmQHObok5gxeJ3DdjNI+31nKMF
 pBZsuwTEgt1JowvdfG633dIoSLS+zQNJfTzv2LzVo50ijnb31iLD+EjVKxGmDpPXRQIOhBusOf
 Uhk=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="32395721"
X-IronPort-AV: E=Sophos;i="5.83,244,1616425200"; d="scan'208";a="32395721"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 17:17:39 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgQkC8YabcuZ/gUuFuUqWkddgZZADbFPPB+PKnNfaGDKAV8Og0sxXM0sQBVi0HkVUIQO2dc9tF9InBGD4MH7QI7E6DKv/Ocd79718m5sUVTdxUUcawxL3BFk27ZN0B+UcJDbvWRa/A69KX+eusiYkmi9udKSiyUeCLmbCJkuZboy9+ozTBAa/acMwohidHROWJaHxmznOTlWnD4cpy/kdUDbSvLN6pR6wT5Rm1FFajbh+m5kesNuwkLJYx9qgBf7wGiRm9ah0fGHkU0veGEvPcC/D7zmoK59r3cuocfGsxyDUqiaEHZeOmiATe1GEl6RujTpPGWryweu3wXOov2ZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AujSOo/lmYYNUsXnxEpM+RLl0X32CZpLg4/tyq+kR8=;
 b=E8QGjgUZt8hEaHvZgqIcsBMiNs45q50zhVUbjyFCNYARt0Jrc+AMsMgRXc2sONgUuYBwrsVOWJN6gS3uzlpeWI5acufMFMvrbe7gn0yF0VxosdiFtZwOCls3SpJpT4dG4q0kAk43VCwoRdWIqdINnN7QT8A6/uiNy9aZAAbgIR+DGi8elcduDf0wT4djrb0KEOhwOIl2QyULIXqYEw8oEkeNQx30qwdo7zBlJtT1Gtg0mE0uBtrxg15JAf+dw3/Eovwkukgwf+qI1JVjlaHQJa2/mPzCOZVm0DRGcDpSgN9aBMptcSq1ZGqJ1YW81pdt6EOwxHa4MRsn/4v9FksKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AujSOo/lmYYNUsXnxEpM+RLl0X32CZpLg4/tyq+kR8=;
 b=VtDeNVw7RrJ+6SgLrAUh6Hd8mVXt6kf+RcmGdNLjjv+J77R8Y5lBZPFqMdoB68WGHZnvaAgeaSe9f9ICBHxiumfQkUgsylWq8KEsjqlJV2oGW/Q8bwCKzXqt3M40bqJM44G6GHmbgmV8Y2rAweAmb7VUrtXfCrcShoVHjwer92A=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYCPR01MB6835.jpnprd01.prod.outlook.com (2603:1096:400:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 3 Jun
 2021 08:17:36 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e%4]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 08:17:36 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Richard Henderson' <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: RE: [RFC] Adding the A64FX's HPC funtions.
Thread-Topic: [RFC] Adding the A64FX's HPC funtions.
Thread-Index: AddR72HvX+KHC7w5TWeyXhvxcP1CJAEsiw9gABYQM4AAOf27gAALWxOA
Date: Thu, 3 Jun 2021 08:17:36 +0000
Message-ID: <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
In-Reply-To: <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-03T00:27:12Z; 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=5b6463db-bd01-4943-989d-fb1b3566fd72;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae3cad97-b305-4b23-cac2-08d926680bcc
x-ms-traffictypediagnostic: TYCPR01MB6835:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB68356C3FB15C75A5DD8D4C9EE93C9@TYCPR01MB6835.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MjWg63z6touJaKMQIihESy97VEdVm2kIcMKS4l5vev3l5D9JOnyL0Ce9+Qh6K/1Eoo9zCGQbs60xEo1B9kZpxybDpuUzEJHzwaA2BIsQ3AHMmIeoiT09JcdjrWcdP45ZS0bNBFWMBdg5TwdFb5niGiTxb+1ontEjd+FtzuJJXajy4Moz2xy+igI+1buE8WP1Ro6QMXgidvz7JIzLt+DuxQ8jsekRmiluDnkFHWyFkLGXGtAaopnU7vhmyHLkM1xlHELPWAtdiQxVe2yJGFcR7PtViWsVtor5NvCa+faoVYJqWrDTI/qWuvZX+2oH0i13G2sUV+MB+BzBWygh9Z0joZJNPW+DIUUw6kPqPRAF9bT3Ol3gl+fvi+ZQ5pItb71w5XpoPK7wOVExHb6o4dpF274XEYk8ng1Qva/Rzwp2r/OuSUcFN6I4KUTJ0Yu7AvGfR84ui4OeDm3QR25hLCFvsJRIBR6NqIgNkW7rQHzsu0X5moZjUwFwH2sDgvL+m2QUlBXL87hUbKP7nod6FL7zDaAdEx51wI/gO4U5PXTXcfftN88lztjFsZtCmxlMbz98TVhbpIc3nh45dbOOzn39z4DlAtyx0cn4oRHpC5Eq9c4Kw/pDSbzTXkhW4z0uGmsUmOP8o3BvY2gPJDjSCHAyjc5oB3fO35ulP+pWXgSmh7f5CsPQfBPqusB3UoKc2uCft1s9E8JgBLJc8dx+C5irDjAigsK4HRwR1q+wRlhhdOheIZgF/BkGExVSD0JLOqkddysRmNOVqbev2xEvwSR3Qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(71200400001)(53546011)(83380400001)(6506007)(55016002)(5660300002)(38100700002)(54906003)(122000001)(186003)(85182001)(26005)(86362001)(107886003)(316002)(7696005)(110136005)(52536014)(966005)(8676002)(478600001)(9686003)(8936002)(66946007)(76116006)(64756008)(66476007)(66556008)(33656002)(4326008)(66446008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?S3RlemRLeWN4MkRBNEVtODlDR3Y1SjBBRXozL0t5S0tCNTAzckFSZDhj?=
 =?iso-2022-jp?B?Sm92KzZRbEptQ3RnNUl1ZVdDbEx6a3NxaWhSV2FJcFVjaG9uTkZrWFZT?=
 =?iso-2022-jp?B?UzZaaDFFM1Z5QWJJd2g0NkdDQnowbHM0SWxFazVmSS9GMCsyVUdVaXAy?=
 =?iso-2022-jp?B?dnZ3S0JpN2FMMUZBREdaZUM5ZkZXZitoajNpRlZzVlo2L0VnTnFIQUFh?=
 =?iso-2022-jp?B?VDZ0UktxSThhSXlUT01PNDhMaUhiSmY1TURVTU5qeUs4Qm9WdmNkdjBI?=
 =?iso-2022-jp?B?alQyOUk2ZlhRZ0xBS3FadmFJL3JSblUvNFN5UFpBWXpzRittdGFxRDhp?=
 =?iso-2022-jp?B?OWJzbUl5N3BxSWp2dkFsMndVM09aNUluSVh6ZW54aC9lZkVva24yTU1j?=
 =?iso-2022-jp?B?aStsNzNjc0FrQzNoYzhhekdVZDZObW9kaUxsckppcVNPZ3crTW1JV2M5?=
 =?iso-2022-jp?B?NmVPc1BDMjYzZXdieHNkODAvZlIwRU9ycWEzSXRzY05Qc3pMRU9BWkcz?=
 =?iso-2022-jp?B?Y3lLbmhxa0dUQlRQNVUzdDMvRXZNaFdqSDZwcVMrM3lPaVMybWkvV3h4?=
 =?iso-2022-jp?B?THpPd2lQZTI5eWp3RUszNHZ5VzNRNnJUM1d6YkUyZDhmbjdaNTdNM0FR?=
 =?iso-2022-jp?B?ZUt0Nkx5cGhEY3lNM0Q5ODlKZGk3bG9qZGswTExOV0FqUEpMSnIzOUpx?=
 =?iso-2022-jp?B?dThjdWxPYzZEL0JVTmg0VzVpa2ZMSUtsdUkwcW1uN25iZHkyUjhhQVVX?=
 =?iso-2022-jp?B?TDZXeXMrdWQ0MXk5K00xVEg3bFlDbmIra3N3WDR6RGdEZHdKUGVKMGxJ?=
 =?iso-2022-jp?B?RXlQNHRYZVlhNUVNa3BBRTgvUzJsMVFYSjlieVZSeFdXZXc2bkVZRHFr?=
 =?iso-2022-jp?B?RVhzWk53ODBOWmt0OTJIbGRRT25HQi8xYVRCbmdyekgrbmdtblVVU3o1?=
 =?iso-2022-jp?B?bzFHMmhSRVhoMnBYbXBxd1Z2TTB6ZStKVlhqK1psUXJjejVYZktESE1q?=
 =?iso-2022-jp?B?Q1FHdHpmU3J5a2JkdkViT0UycHpBbGNjVUpob2FwR05VYml1M3I3Vlli?=
 =?iso-2022-jp?B?QjZRTWptazZiVnFRT3Zyc0I1bUdXZ2REbFNJdVVSdENha3hBZXhiNnpp?=
 =?iso-2022-jp?B?WW1jbmtsUVdXT0NvYmwydjNScHE5VnlXcHpBYmtFY2hGR3BRdzM2ckp1?=
 =?iso-2022-jp?B?azZ0U2FrUFFqZDhQcy94d0w1K1F3TUxkRzgzWW0xeG9Cb1RSUnFvTEQx?=
 =?iso-2022-jp?B?S2paNWRPNCt0VjVRTk9jdFNzWk5qY016d3FFSWVQbWxqK09RcytRWTY1?=
 =?iso-2022-jp?B?Yit2TXYydW5GOTVRQnNSZ2FrVzFQUjhpcktaaE4rMHIxUWplNVNJM2dm?=
 =?iso-2022-jp?B?cHhoNmlKQVlIaFlFT3ptK2dmTkpJbFBXQXBJU1RybFlwZXN5SUE5cWVN?=
 =?iso-2022-jp?B?UEEvL2RtUnllMk9KM1FUNWEzMDMvSGs2QjZZOHZmbVFlZFhXWUVvZTJP?=
 =?iso-2022-jp?B?RjVFamYxUStWd3NjTWlJbURRVm10NWdVbWNydmg2MC9DdERKTTNQZk1u?=
 =?iso-2022-jp?B?TEk1b05Ub1gyRXNRVkxXdGhNeS9WMXVQeFhodTVEb1N4LzZCa0VmSlc5?=
 =?iso-2022-jp?B?Wmk0emRaTis4SFRBYTJIQTZ6M2RzcThVWEQ0Ty9weDliRDhjb2NXeUtU?=
 =?iso-2022-jp?B?TXdZamc4V0RFSGtBdk44c3lhYTM3amJSVGV4MG5ZaTMrb3h3dWI5U3pr?=
 =?iso-2022-jp?B?TTVDUTZJSkZnZ2x1M09OazlxOWpaWlVkdUU4eXVZbnYzL1NkdHlPaHJP?=
 =?iso-2022-jp?B?b1IrOUw3K0pMVTZBWWt4WXExY2QyRi9PUE92K1JYNzNzRDM3YlpucEw5?=
 =?iso-2022-jp?B?RTQyejBrK0hyajRCMFVRMW1pRTdHSDFpbjlqYXJqMnl0MDh2T3BLcU9U?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3cad97-b305-4b23-cac2-08d926680bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 08:17:36.5134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m66hNl5h4ONRM3kGr0uYyhJ1Q+Wak4sStFiti3KZI36qwR5sDKiIrQ6ocPcc3BGykhxt2MqXC7+jAbFJ3J+bWOoljRrB1UmpDwW7iggTSfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6835
Received-SPF: pass client-ip=216.71.158.65;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_action: no action
Received-SPF: pass client-ip=96.88.95.61; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HK_RANDOM_ENVFROM=0.998,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

Thank you for your comment.

> My first thought is that -cpu max can simply enable the extensions, witho=
ut
> extra flags.  The max cpu has all of the features that we can enable, and=
 as I
> see it this is just one more.

Let me confirm a few things about the above comment.
Does it mean that I don't need to explicitly enable individual extensions
such as a64fx-hpc-sec, a64fx-hpc-hwpf, and a64fx-hpc-hwb,
since all extensions can be enabled by specifying -cpu max?

> The microarchitectural document provided does not list all of the system
> register reset values for the A64FX, and I would be surprised if there we=
re an
> architectural id register that specified a non-standard extension like th=
is.
> Thus I would expect to add ARM_FEATURE_A64FX with which to enable these
> extensions in helper.c.

As you said,
some of the published specifications do not describe the reset values of th=
e registers.
I would like to implement this in QEMU by referring to a real machine with =
A64FX.

> I can certainly help you with this.

I am not familiar with this, and I apologize for any inconvenience this may=
 cause,
but I appreciate your cooperation.

Best regards.

> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Thursday, June 3, 2021 4:02 AM
> To: Peter Maydell <peter.maydell@linaro.org>; Ishii, Shuuichirou/=1B$B@P0=
f=1B(B =1B$B<~0lO:=1B(B
> <ishii.shuuichir@fujitsu.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [RFC] Adding the A64FX's HPC funtions.
>=20
> On 6/1/21 8:21 AM, Peter Maydell wrote:
> >>> I'm thinking of implementing A64FX HPC extension in qemu.
> >>> A64FX [1] is a CPU developed by Fujitsu that implements armv8+SVE.
> >>>
> >>> [1]
> >>>
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitec
> >>> ture
> >>> _Manual_en_1.4.pdf
> >>>
> >>> A64FX is a CPU developed for HPC (High Performance Computing), and
> >>> HPC extensions [2] are implemented to improve the performance of user
> programs.
> >>>
> >>> [2]
> >>>
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification
> >>> _HP
> >>> C_Extension_v1_EN.pdf
> >>>
> >>> The details of each function are described in [2], and the HPC
> >>> extensions include
> >>> 1) Tag address override
> >>> 2) Sector cache
> >>> 3) Hardware barrier
> >>> 4) Hardware prefetch assist
> >>> are implemented.
>=20
> Thanks for the pointers.  It looks to me that it'll be easy to implement =
these in
> qemu.  We'll need to implement the registers, so that the OS can read bac=
k the
> values, but we do not need to actually do anything with them.
>=20
> >>> 1) Is target/arm/helper.c enough to implement the register
> >>> (ARMCPRegInfo
> >>> structure) of HPC extension function of A64FX?
>=20
> Yes.
>=20
> >>> 2) Is it OK to specify the option to set the HPC extension of A64FX
> >>> as follows, for example?
> >>>
> >>> -M virt -cpu max,a64fx-hpc-sec=3Don (*sector cache function) -M virt
> >>> -cpu max,a64fx-hpc-hwpf=3Don (*hardware prefetvh assist function) -M
> >>> virt -cpu max,a64fx-hpc-hwb=3Don (*hardware barrier function)
> >>>
> >>> It is also possible to implement something like -cpu a64fx, but
> >>> since we don't know if we can implement it immediately, we assume
> >>> that we will use the -cpu max option first.
>=20
> My first thought is that -cpu max can simply enable the extensions, witho=
ut
> extra flags.  The max cpu has all of the features that we can enable, and=
 as I
> see it this is just one more.
>=20
> I would like to add -cpu a64fx at some point.  But as you say, that need =
not
> happen right away.
>=20
> >>> Since there is no example of A64FX function implemented in QEMU, we
> >>> would appreciate your comments before we post a patch.
>=20
> We endeavor to enable features by the architectural id registers when pos=
sible.
>   Thus the cpu_isar_feature() checks in helper.c.
>=20
> The microarchitectural document provided does not list all of the system
> register reset values for the A64FX, and I would be surprised if there we=
re an
> architectural id register that specified a non-standard extension like th=
is.
> Thus I would expect to add ARM_FEATURE_A64FX with which to enable these
> extensions in helper.c.
>=20
> I can certainly help you with this.
>=20
>=20
> r~



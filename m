Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C839FE15
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:45:02 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfmf-0000MA-1M
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfii-0003gj-Ek
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:40:56 -0400
Received: from havoc.proulx.com ([96.88.95.61]:34236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfig-0008Q3-CA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:40:55 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 201745B6; Tue,  8 Jun 2021 11:40:52 -0600 (MDT)
Authentication-Results: havoc.proulx.com;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="wWyr53RB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fujitsu.onmicrosoft.com
 header.i=@fujitsu.onmicrosoft.com header.b="JDNlfemZ"; 
 dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Tue, 8 Jun 2021 11:40:52 -0600
Resent-Message-ID: <20210608174052.GD21839@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1loj2Y-00061S-OO; Thu, 03 Jun 2021 04:49:22 -0400
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83]:12489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1loj2W-000828-95; Thu, 03 Jun 2021 04:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622710161; x=1654246161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7r3sx18qERbybc+mjuEO3SHD4cWIQ8rlq0VQbMMNRrI=;
 b=wWyr53RBFDUFORDZmpmNz92mfbvait1XJeugPDoWLAf5zlNofHYWm+Es
 TDBRWI6m85Wnn8Dtv7wbFlHm9DefE+/lAW30DjACTxx0GXBEtEiOJkNED
 91HG3zR6bpvmym//2VyHB2gWVim40SoeKyBJqbzDH8KmFPZ7voJi/IpZO
 j91r27s91WOP2/1oWpjSBRHzMxFX0elKF3EUgKOQgx3Y5Sfa3bsC5uKeS
 VK6zymJvbz9O+75GIFL14TGabbiyFX4uO0YWeG15mZOQq6t/rzH5FBCsg
 O5Zw/ItxCfeoIsdKq/3pbF5PfAY/EuD0bxIEDrAPRsEvlLMVp8LlGzr7h g==;
IronPort-SDR: BABaNIWlOWtYMvNdwWNa4XYo/nrSTw6Xagrm1hA6OBlhX5/PC12MwD1c8FurLpSoWdlNJpy09a
 OULAUPFRMIHggBtXhJt8a8tFyptk8HKQsNWdXN9q+/GBxAu2p+bbneeaKjrZhnPn2kY7xScAEb
 Jo/2Yfyhaeck6wRV+7hPxtq4vBdboUY3WLTmwUm3NzmU2idMYMaXuX7N2za4iFE27S32M0lLaB
 r8i7tNwqxsb/4Dlis31Sqe6/vxc5dikYUGD/oBj0BJuz7AL/+x7K6wJJng/chpYhL3G8+J2miZ
 gNc=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="32562484"
X-IronPort-AV: E=Sophos;i="5.83,244,1616425200"; d="scan'208";a="32562484"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 17:49:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRBBt3uEfwhKfXp2YbweZFxkNdWQEQa1CO3yRcEs4cgXsW2g+ToNxQdlA7DKx5yZQHAP1igUx9eGVVumOzzEeg5DAylamTD86NZ46LaV6OTtU0aDu90fxiSrAIQXZew2UGtJ9t84/ANj571kGkKFQSzimAqTg1p+u53sLTTUmO6PV80VUg49qeitBjK61cYPLYNN66tTNX6Vh6MflFjJXxZyorLyQTZzedoLm5GndErrOAGLziJgrmDnWfDe1pf505RrWBwmmxxAwe4WT0z11KLxp4dv8H/q/xf6agKPNjuubxDPmrN60SotxFXtSpqWPqVJCs65klKhQd2Fzr3aSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj4xu/zVBJggzyDPkyse5AuaXygkjR8T+C96eKdB96M=;
 b=LxwrB+6qyY5KrG/1ZnJUrnlyMSEkt441z5axfu03ODUOff6+l75AYhaAtDyLGo3qsaf0kz0LJTQLXfr6Wxv7Lizso/tcVSAFvA2stYj7bSZsOabs7Kk7zWTVNkG6+BSuwcP8CQ/LyXYpJHmk3mcPGEGhXAuxq7AHZrHIjTSSnUa/L+fm5VmKS87hd+6LZG4rhnYX/9fR1iYfc3f3A9r7m75/UZvCSL8CyqbSQvBnD9q9NAKD57nHTDAB4mqvQc1WULMFGNUiaLEwC4SqpD3vzeRIVHTPpqMDhv/BYUPXjAypFGN3WM+mZ/1GT9unr5tTPxMMfK0OEyDlDN1UAsKaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj4xu/zVBJggzyDPkyse5AuaXygkjR8T+C96eKdB96M=;
 b=JDNlfemZIqyYWUD9o/WtHs1wCL2+23oc30t03Evq4/2XlkWWt2e2qBwf5IR45OarfvhYbyzO3OZ32gKaPrih9SePqqpa99NPN8SRjvH5ooDZcwbYpN5bB+uTKZxvZhmh33Q14yjiyD0BLvasxcU0c5xca033O52iwexofMnpS8E=
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com (2603:1096:604:d7::14)
 by OSBPR01MB4935.jpnprd01.prod.outlook.com (2603:1096:604:7d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 08:49:13 +0000
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::e843:5aad:ac99:1195]) by OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::e843:5aad:ac99:1195%4]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 08:49:13 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: RE: [RFC] Adding the A64FX's HPC funtions.
Thread-Topic: [RFC] Adding the A64FX's HPC funtions.
Thread-Index: AddR72HvX+KHC7w5TWeyXhvxcP1CJAEsiw9gABYQM4AAOf27gAAAT2wAABvfooA=
Date: Thu, 3 Jun 2021 08:49:13 +0000
Message-ID: <OS3PR01MB61511B004E64F0FC09C22B9FE93C9@OS3PR01MB6151.jpnprd01.prod.outlook.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <CAFEAcA8-KXp204HD=LcUo8CHQX-ioCMzL8kaOyHTUP9KQz-TAA@mail.gmail.com>
In-Reply-To: <CAFEAcA8-KXp204HD=LcUo8CHQX-ioCMzL8kaOyHTUP9KQz-TAA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-03T08:29:03Z; 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=e624c60c-c6d0-43a5-8883-0d36570e50ae;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 230fe458-12be-4195-1fff-08d9266c7672
x-ms-traffictypediagnostic: OSBPR01MB4935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB4935A2EB6ED3DA079537821CE93C9@OSBPR01MB4935.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v/mG9FzuJP29OHeoTAL+ASxrByAEoJLpxSihixVtLgssYEp8ebKZhdxSuYw/yA1p3xABkhIAGnTZ/x/81akEpSd1v4cWeoBemBwtij6qi9x9HFOHWrFbZe2nlSjMmo8NO6GHZTY/XcFHnOF1r920l47AJA/9W3a2q+ENa5eBuFPz18giYhxcfYBuZJJ32DyDr/K/9Nb2Is+iPG2sX2CDqDj9lSOEAaNFLHT4hcCtRQMYGoxW8AOFONFbe72ngQQY+xtsJFrghQflBr0BMEsjYw89llvzUaQBzz8hjlHp3JAD6JmYHqxgdmM4Yoym8H6x/Fwxq02NGmL8tkUNM6nftfNKrzlipzJ4PV96LwsLoNSF4a1yrDEqJeOT0c8Mfsbw4tbclJfVNSvsH6oUV6P8FNy5dsGLtwNwA/UcnBBMAuTf1gp9bAS7Ixv9w1SVOOyaG9ePqtjnvzVfoImSFqnrlqtBuHFh5WY9TTtk0FahgVNzm7dEWCEu6XaqKHRMuIh2s2t77XaIynjTXF6mIQc3L7g6PvLz6QUBUcqq8fMHSs0OGk15I6dOTb12Z3RRaVuzQNZv7Z6hbD5zyK5xTU4g25kRxGkCjJ46BYFJ2TOyQmo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6151.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(8936002)(2906002)(186003)(478600001)(26005)(71200400001)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(8676002)(5660300002)(52536014)(4326008)(9686003)(86362001)(55016002)(33656002)(107886003)(316002)(110136005)(54906003)(38100700002)(122000001)(6506007)(53546011)(85182001)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?VTFQU093Q0duMC9jRWNzWGo2UWVUMXJnejlyQ3A2MUJFbDVPd0hQYnFz?=
 =?iso-2022-jp?B?d3VmRGsxMzBhVWNEeGVtd3VFRDU3RE1SUEdiMDdpUk9wUmFoQkJ6V2Nv?=
 =?iso-2022-jp?B?Uk1ReWRxOXJBRnRhenJhZXV4QU5kcW5odHNFOUpMdTRLbFdNTE01cEI3?=
 =?iso-2022-jp?B?TFhqQk9BTTJlRTlRZEd6SW9pZnpLQm1vd3JlamlKaXNyejRIY0d4WlN2?=
 =?iso-2022-jp?B?b0xUWWhWY2IvK2ZKdGNvejlnQjArbHF0N1RySlFjSWdTMWVMRzlPR3JG?=
 =?iso-2022-jp?B?ZE9jV0F2bTNmc2dVT2dnZWY3VWVtRG1NMTBTVGZRaUw3Kzh2bVpFZmtn?=
 =?iso-2022-jp?B?QTdubVQ1WDNXS3dmcnJCc1o2d2lEMTVKcVhRWnlTTVhiUmtkdytXRWJF?=
 =?iso-2022-jp?B?RnRRYkwvQytqdzAwcjRGVkRWL2lnOUo1K0k0SlNQdTRvZ0Z1UnBDMytO?=
 =?iso-2022-jp?B?eVp1UE03dTBBci9IclRTeGJ2dFhwYUVqMVJiL0swWTdYbktwUEN3VUZi?=
 =?iso-2022-jp?B?S0ZqSUQ5TnJ3cnA5a3VMb3BReDRqTFlFKzhFTWVOUnhwcDdodG5ERVdo?=
 =?iso-2022-jp?B?NFQ1N3NyelROUCsxUlRoVTRFL3podWpzSTVjcDhPUXZ0NnZCc1hKSVds?=
 =?iso-2022-jp?B?YmtNQkFSbHZ5WWJBN2ZnaCtQL1U4OVd6bDVZMVFtSXJEd3FsK1hiUXlj?=
 =?iso-2022-jp?B?YXFlTC9ySFJndEVkeis4ZVlZY3E4U2g1OXVpWXFENnI3OVYvUGZ6aWdD?=
 =?iso-2022-jp?B?bGlGbm1HaUc4QmM2VndxYWNWZS9wbkFHK01kTnlQQSt1MzlLaEhhZlR1?=
 =?iso-2022-jp?B?a1hwYlRDcnRTZElaQm1HQWpyQlQwNjNmd245di9NUHA3RUZDdnBBaVZS?=
 =?iso-2022-jp?B?dzdMMU5jVm1aS1N3aStBc2dxMjMwSVJTbFl4QjdhTEZjVTdoTWQyZVFZ?=
 =?iso-2022-jp?B?b1pzeXJPcHVxeVc3a2NmMmZ6c3VydFF4K3JIcHhpZVhnZXRCYTFEU0xX?=
 =?iso-2022-jp?B?cGZZSEF0dllpNngxTDRKTzB6Y1JEY1ZrOVBKMVhLNHROTUd5ZmxFV0Fz?=
 =?iso-2022-jp?B?TWtTOUZ2Z05ZT1pUZFlLRmVIR1lnR28wLzJNQy9pU0JsT250SHdUWXZo?=
 =?iso-2022-jp?B?Z285OHRnZGkrTnJFYS9aVnd0NmNJeHRYaFF5VThOQTBsM3RzaXpiaGl0?=
 =?iso-2022-jp?B?V1ViMHlXM25mZmhRVTZWSXdGNFg1YUZrV0YxVmtNdVptSWgwK2l5d2FE?=
 =?iso-2022-jp?B?MjV1bmRsRHRodWF6VEV1bk53aUx1Nk0rQmd4d2hVN0ZPS0hJMFkwOCsw?=
 =?iso-2022-jp?B?SXp6dGpzTE5wajVqK09kcmRKeTdnTUdtZWJZeTdBT1NIYk80N1NGQTZv?=
 =?iso-2022-jp?B?QTRqVk5EWW5qRGliaWdGMG9ERGc5RUdmQXBudnlCbVc2Q25kamt3c3Fv?=
 =?iso-2022-jp?B?czFPRHE3T2YzdEZncjgwcFRGOEJ0Z2Z0bVFVNXFmL3hwS3cxNXhVNkIx?=
 =?iso-2022-jp?B?NGs5QkNVUXRHLzBJZ3cyQzU2UXQ1dnEyNjk4VnhlQnZBblFJRURWQzRE?=
 =?iso-2022-jp?B?Ym4ySHRNN3NSWFB0V0g5ajhxRlBGZVpicWRMWGZjZkFBVXdTQUhUZHlQ?=
 =?iso-2022-jp?B?MjNyMk14RnJYMXowYmJkODJmcWtkOUl2UXRZQVM0YkN2MFhZYU0wRkt1?=
 =?iso-2022-jp?B?emNONmhUMjdPMkxZRWJPVG00TW1Tam5zcklZTmhiQ0FUZnFMYkRnU3Q2?=
 =?iso-2022-jp?B?V1A1NEFIbEMvK0ZYcktMYXl3K0ROUFNaK2U3ODJtRU44aFdPWDJFdnp2?=
 =?iso-2022-jp?B?ZDg4REJJckg4b01COFMxSWFqK1B2c2l1WTdHa0ZBU0FzSncyUk5zWXJH?=
 =?iso-2022-jp?B?NWJ3dzVmM1ZrNlNqeXNxSWZUV01xWXZHVjVCQ1EwQUFDL2g0WkdMV3dH?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6151.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230fe458-12be-4195-1fff-08d9266c7672
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 08:49:13.4433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfgK5Z6dNy0qjldhi8g4+3v03DnEVWcI0T/wpcqhklYb0HDPeVxOFvLDL9b74RfgtHif4QaiWPvpKf3ar3UXqrWBhsUd+s4ZDlEC0MA+dDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4935
Received-SPF: pass client-ip=68.232.159.83;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.fujitsucc.c3s2.iphmx.com
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

Hi, peter.

Thank you for your comment.

> I think it would be worth scoping out how much work the a64fx CPU would
> require (ie what else does it need beyond these extensions and whatever
> features we currently implement?). If that's not a lot of work it might b=
e simpler
> to just add it (possibly even add it but with one or two of its features =
as
> not-yet-implemented.)

I don't think it will take much effort if you just implement the A64FX exte=
nded function register.=20
As you pointed out, we are investigating the possibility of adding function=
 processing,=20
but in that case, we think it will take some time to verify, including the =
creation of test tools.=20

Also, as we proceed with the implementation of the "-cpu max" option as the=
 first step,=20
we expect to receive useful comments from the community.=20
If there are no problems, we would like to implement the -cpu max option in=
 the first step.
What do you think?

Best regards.

> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Thursday, June 3, 2021 4:11 AM
> To: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [RFC] Adding the A64FX's HPC funtions.
>=20
> On Wed, 2 Jun 2021 at 20:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> > On 6/1/21 8:21 AM, Peter Maydell wrote:
> > >>> 2) Is it OK to specify the option to set the HPC extension of
> > >>> A64FX as follows, for example?
> > >>>
> > >>> -M virt -cpu max,a64fx-hpc-sec=3Don (*sector cache function) -M vir=
t
> > >>> -cpu max,a64fx-hpc-hwpf=3Don (*hardware prefetvh assist function) -=
M
> > >>> virt -cpu max,a64fx-hpc-hwb=3Don (*hardware barrier function)
> > >>>
> > >>> It is also possible to implement something like -cpu a64fx, but
> > >>> since we don't know if we can implement it immediately, we assume
> > >>> that we will use the -cpu max option first.
> >
> > My first thought is that -cpu max can simply enable the extensions,
> > without extra flags.  The max cpu has all of the features that we can
> > enable, and as I see it this is just one more.
>=20
> I dunno, because it's not an architectural feature, it's an implementatio=
n
> feature. We can rely on architectural features not to step on each others=
'
> toes, but there's no guarantee that some other impdef feature might not c=
lash
> with these a64fx ones.
>=20
> Also, how does the guest OS typically detect the presence of these featur=
es? If
> it does it by looking for MIDR etc values that say "this is an A64FX" the=
n -cpu
> max won't trigger that.
>=20
> > I would like to add -cpu a64fx at some point.  But as you say, that
> > need not happen right away.
>=20
> I think it would be worth scoping out how much work the a64fx CPU would
> require (ie what else does it need beyond these extensions and whatever
> features we currently implement?). If that's not a lot of work it might b=
e simpler
> to just add it (possibly even add it but with one or two of its features =
as
> not-yet-implemented.)
>=20
> thanks
> -- PMM



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F23D1F9B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:02:02 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Teb-0004Zs-Qb
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m6Td6-0003Z8-15; Thu, 22 Jul 2021 04:00:28 -0400
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m6Td0-0005QA-3f; Thu, 22 Jul 2021 04:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626940822; x=1658476822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g/3wwSP/t6JGSmLgyXlxrQ2H/uWo3gpxGjxyDDKEAqw=;
 b=Uk+GyEshXhPBe1V6r4zF9Kpm/PV0iXbhPYfmDx/UJv0YI81xFUjRLITM
 4r1CK96vaofqKeCrAwqpBTT98qWIELRC4eZJhv4MUrHbgkVA2avxQhQBz
 Bb26CFU6DVg1B/QUWcmbZ9oKWlNvrvELK+SCfNsBa1Z7prj3eKwMAth0/
 +VZBV9TPkM7AyC4lJvVtbh4vJzhbG+w0KM12rmnnraCRhu9J+V1OeJeKP
 TBYTI0FAt45Ltfj2HYWBciqlDVh205laJ9ysbJBm6R3AVEqIU86q2qzrn
 yFF/KIR5ma4GBzypO1T0MQVgfxfakymb10MQ29Pz/xnIDC/avfWPy5Ajo Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="35344113"
X-IronPort-AV: E=Sophos;i="5.84,260,1620658800"; d="scan'208";a="35344113"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 17:00:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfSVDsyNUFvOJgNxTwXrUW288F5PdKyB0Qd/8UjDtjL+Fdy9c29J5pqFT1O81KqR54DAEdBf7ncfseNOMSzWaWfkK6c7Gaae3PaejFLU0Rcw/ntAH+MMa83g5k2GDyrqTKTVRfuVwCWUSrsH1eubD1yRCJ73B1V6KoE2ZOBSpkMf6tG1oH9jrm+bxloknXf7DjV9CFirfm51ZQCpkOvm2r9xdWGul7qjaj6YCMrYiKedWbYoV25GCHSJFMs2mdbOvCYnHGRYlqBmqhCYG6/ATA+LvV/RHIvtmpXUg9KvCW6iOW9GDPbh98iSSM0LcdRJxKcKpRCAlMjGJonx6c8Xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/3wwSP/t6JGSmLgyXlxrQ2H/uWo3gpxGjxyDDKEAqw=;
 b=hQ2RAF6pXtELNjgve9T92UMlo7GhC7m2rpntTEWxaiK6BHvhrroo3gTQ49M3+N6qdX6PLPMq317CGyOqwtEJiqjvuLJTHvFSnG3WneSJRtvogxWqOGfM3XRX72lL1/C4YMmnFxJ+Bf6LifwLzUF/xrMwzaYeTOYGxahPV5eXEVE8Xv9IWvRHrird3/tmBhTxkasJwqGu6yKy6nDaPdVcNe2/ICdP1nIiEKqP82UY2AzL48+th9OUZsSANOCsraWpK6PADc9ohAosQx/bcabpF4d7uJbF4IUei2sxbQ8UHF/k1w5u1oZMA8JqL2qrigRYr14lb0MOB+LxcLCkzrTW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/3wwSP/t6JGSmLgyXlxrQ2H/uWo3gpxGjxyDDKEAqw=;
 b=gBKEPzJk+bRaDuME7mZrPMi4z1DUpelw0ZJ61UlHPCDtQmiwKxfOmxhpUmqzUzCctUnxyLzoEUfp2mz+sJjeljdY4N1+tEAQoQEEHGHHiKDDxGAqJPdKsLJISHBRXJ6CVsgYD8y6BoVyXKOS3hWfZduWUgG3lTP8eHrV2lXbejc=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB2975.jpnprd01.prod.outlook.com (2603:1096:404:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Thu, 22 Jul
 2021 08:00:05 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 08:00:05 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: =?utf-8?B?J1BoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpJw==?= <philmd@redhat.com>,
 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH 0/4] Add support for Fujitsu A64FX processor
Thread-Topic: [PATCH 0/4] Add support for Fujitsu A64FX processor
Thread-Index: AQHXegM6kUAks0xQNk6Z/S3GC/IfSatKRPIAgAE22/CAAEPpgIAC6s6Q
Date: Thu, 22 Jul 2021 08:00:05 +0000
Message-ID: <TYCPR01MB6160181F2C9FCC79DB7F328AE9E49@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
 <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <324188bb-3837-318f-4542-1a1762bc6943@redhat.com>
In-Reply-To: <324188bb-3837-318f-4542-1a1762bc6943@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NDJhN2U2NDMtM2FlZi00YTgwLWFkZTktYzdmNmRiZWU0?=
 =?utf-8?B?NTFhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wNy0yMlQwNzo1Nzo1MVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01f30412-b094-4758-4ed5-08d94ce6b7b1
x-ms-traffictypediagnostic: TYAPR01MB2975:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2975731E9A76C12879AE3A86E9E49@TYAPR01MB2975.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TrUyK5WGx/noz/lk+MsrGShKL2Ul3SHEYre/J8Ao7fuZaxiRWYdHTiYYovLD+o9J9jmirBmHQaygD9m4/c/mzJQUFrC587pKGVGsiErCkzT+lWa90T4rbSrq+Ku3oQU3evGcY3i4xtsBJLNeEvZRIGBOkgnh7aiHycqCg10Xptn8peQ0PLMS4TZoc74nr89MtBZwLFl/arHeo5zokzo5p7vGutYmSNTDJYKhKxLgh8WFSnpOOEYyS8deq7EZdnbJ8lJOLuU2ol+IFhBzsFSQYknuIveJkFKlPSRoPt6aD+z1yMCp00HZikxVymjt+YhrATDsAzLLaxL0Ojcb6SYNIdziFbtggGa0PI3yvvyjyiSk6uCwAnTiiWag6B1VJbWguMVGr5fcYdBaf76E6t0vyr+Ygm06yX9Oyhz5OcNKwnMfMiFCDQ1WV82ZcW9s1oPw/bPwQlNMAKRY3XV67r5MQpLWnbstsq7NVTxLtfNfz0EHiPI0G2kPey3fryW9v3UfCZmG47I2HB3DvyefR3O9unDGD4Ng405qRMqR214reNUM5l3pKkYybGIyKhMg44sYJ0YQMDcRXeiEYjc4fJfo1iuiwwZxGwZKjulcwZ1n/7lxtJHjuuKoXmo5oZLHurGT7AZA+OfiYWGua7wUcWRf8EC0IPwVaG7QYewFLz6mTBVwTPjH0w1NA3XAowrRyzoQdhmBPoNeNsDX9TIKamMgOtF9x7JdPLDUxDhs0qTUr3O2sMooMrDSDcUrtfvK/2/sT4wHyg+j/pA5z9G6odvQ94wyBq1di+jYtBb+obLyPmc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(8936002)(4326008)(2906002)(53546011)(83380400001)(316002)(8676002)(5660300002)(6506007)(55016002)(7696005)(71200400001)(52536014)(186003)(26005)(107886003)(64756008)(66476007)(478600001)(66556008)(966005)(66946007)(33656002)(76116006)(54906003)(66446008)(122000001)(38100700002)(9686003)(85182001)(86362001)(110136005)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjJuZWgwUCtQZDhDUS9NZWZxQzRueFd5c2pRSXBQSVVadmZyQnVZenFUV216?=
 =?utf-8?B?RnkzVXFudE5XSE1kVyszTUl3N1dEMjRaR3l3eEdyT3NsVW1oYXlsYVBMMDh3?=
 =?utf-8?B?VlNJUGxxRTVOOENaU1JuOHlIVGkvYWE3THNsRnNaMUlqZy80VzRoR3A3Vy9R?=
 =?utf-8?B?Qko5QUd5UXM2TUY2R1ptNDFTMC9YZ0hzMUNnWU5lSWFTU000Z0VhMzg4c2M1?=
 =?utf-8?B?WitzU0JienVFYko0NTByeHd5eTBtZXhsaWJoRURER0JVeG5HV2F6Zyt6RDRL?=
 =?utf-8?B?UTVxT0MrRUxQa2NzSjZHa25vN1VtZWN4dXRTRTBhQ2duMERTenprUlhPNHNv?=
 =?utf-8?B?QjBoR0ZyUWZPL3VBdHpxakppN0g1TkZSNE9ERVFzNmxpcDQvSk00MDNzWjRs?=
 =?utf-8?B?dE1STjB3Zjl5QjZqL0c2UkRhL1poN3VNaFVRaFIveml3bGYxYk83WTl1NHdm?=
 =?utf-8?B?U2lqdmtyTUxkUFpuM3VkczRwaFpQckhZT2VwbXFtU3p3RmQ5dWpxaFIvaFg5?=
 =?utf-8?B?WlVhcStCdEdFSW9kUWs0Wk1jRUE2eDlGL2FtRTdHc0RJR2U5dEl2OGxNdDEz?=
 =?utf-8?B?dmJEZkM3dkZ1ZUMvbFErSkg1QXY3Z0FuWWY2WExwNFJQTGtveUZJZm1kempu?=
 =?utf-8?B?SE9nRXNKR1hDMWErQlcvUndrNVFSckZsWHdKTEJadTZBWGU4b1dUY1ZVNXNy?=
 =?utf-8?B?MXBOOEl3ZmlqaC93UXJqc2pLVkFaRjhYWUYwZHR2VGo4aXRJQjk4K0JObnBR?=
 =?utf-8?B?dEgxV2ZFTG1UejBNRlp4eUdKZ0hySWdUcVNkSVNOeVZDSHlmdVdxRzhCa3NX?=
 =?utf-8?B?dEdQZGlpdnptdC94K3pzbE05OWxHelFRSmwrMnBmUG9xVU1IQWsvck40QTUw?=
 =?utf-8?B?R1lIVG1QbEJvVDZwUVowRE90aDVZN3JwRVkvOU83eXVtMHROTmxiQjVoUXFZ?=
 =?utf-8?B?Q3I5VGkrSGY0WFNveTdlQjk2Qjd2ZzJXVEZNbWwzbXA3ZWhDUTlSS0Rzbnl2?=
 =?utf-8?B?aUV5SVB4ZjRFVnRsZVB5NHc2eXBrVXhqQTVXUW1FVStiT3V5U01FQ0VsSE5B?=
 =?utf-8?B?UUxGV0pMcEsxNHlwdmR6TlNrOFZYV1RYRm5OVFpKc2VIK00yZ0NHZmRYUjln?=
 =?utf-8?B?dGhWdDFXaFlXaGhaTXhQRURPa0FyWFRjbmE3NEFiMGVJalVWWDFzTDN2Qjdy?=
 =?utf-8?B?SEV1VFhteDV6bkUyOUxlOVh2bDd3Y3ZHbEdlYTBlWVdLcGE2K0lkU0hkT3NE?=
 =?utf-8?B?T2JyajA2aHp1T0krR1liL1BXdjBvSUxTTVhMV0dlZk5hSk9YTjJqczBxQS94?=
 =?utf-8?B?dStyOXJWTlc0YURZNWFyNC9kNUUva1VqV0IxN2FJb1VHVzA5R2xTYURJaDh3?=
 =?utf-8?B?M3ZYVlJ3enNRb2JpQ1ZISGFHUjg1VmUxV2ttMDRwTzdhYVlUUm53QWxxenA0?=
 =?utf-8?B?UTFrblF3V1RNd0tjOXFKRmtzS1BnSS82VDdHbWN0OTQ3ekxRMnNNT2lBSWZ1?=
 =?utf-8?B?N2RSZVRRRjFmWTZ4bkNzZFJxaG9zblBhVEg0NE5TMS8zaDA4c3NNSmFseUxk?=
 =?utf-8?B?T3lRMWVnN0JNVE5jMnN6VllLZGhZdEhIemREbkxJMkt6MUVtWHdOL1ByN0E5?=
 =?utf-8?B?V1FTRko5YkhxczdqN092OUhNS1JBTE1aa0ZBYVNZUTE0OXNtTHFWK0hGWVF4?=
 =?utf-8?B?K2RjOEhWeUwvd1k1S0lIb21idFpiRE82UkJLanloWnlUMnJTOWZjaVA0eW5y?=
 =?utf-8?Q?ZoFjIt7JgPMeCHeU+ByiPbty14T8BsUdmadrPhA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f30412-b094-4758-4ed5-08d94ce6b7b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 08:00:05.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwBxfUvssB/aD01bWU6AbPqo0m36JCZLRiP9/Br4LfZjvhYEgl0q7RUuE30n+RrWMOz28ztCGwBUTIDi9ls46QvQm1tlHAVQK7c+HMFNZUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2975
Received-SPF: pass client-ip=216.71.158.65;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksIFBoaWxpcHBlLg0KDQo+IE1lYW53aGlsZSB5b3UgY2FuIHNlbmQgeW91ciBzZXJpZXMgdmlh
IHNvdXJjZWh1dDogaHR0cHM6Ly9zci5odC8NCg0KVGhhbmsgeW91IGZvciBwcm92aWRpbmcgdXNl
ZnVsIGluZm9ybWF0aW9uLg0KV2Ugd2lsbCB1c2UgdGhlIGFib3ZlIHNpdGVzIGFzIG5lZWRlZC4N
Cg0KQmVzdCByZWdhcmRzLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSnVseSAyMCwgMjAyMSA4OjI1IFBNDQo+IFRvOiBJc2hpaSwgU2h1dWljaGlyb3Uv55+z
5LqVIOWRqOS4gOmDjiA8aXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPjsgJ1BldGVyIE1heWRl
bGwnDQo+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IENjOiBMYXVyZW50IFZpdmllciA8
bHZpdmllckByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+Ow0KPiBR
RU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IHFlbXUtYXJtDQo+IDxxZW11
LWFybUBub25nbnUub3JnPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAwLzRdIEFkZCBzdXBwb3J0IGZvciBGdWppdHN1IEE2NEZYIHBy
b2Nlc3Nvcg0KPiANCj4gSGkgSXNoaWksDQo+IA0KPiBPbiA3LzIwLzIxIDk6MzQgQU0sIGlzaGlp
LnNodXVpY2hpckBmdWppdHN1LmNvbSB3cm90ZToNCj4gPiBIaSwgcGV0ZXINCj4gPiBUaGFuayB5
b3UgZm9yIHlvdXIgY29tbWVudC4NCj4gPg0KPiA+PiBIaTsgaXQgbG9va3MgbGlrZSBzb21ldGhp
bmcgd2l0aCB5b3VyIG91dGdvaW5nIGVtYWlsIHNldHVwIHN0aWxsDQo+ID4+IGRpc2FncmVlcyB3
aXRoIFFFTVUncyBtYWlsaW5nIGxpc3Qgc2VydmVyIDotKCAgQXMgZmFyIGFzIEkgY2FuIHRlbGwN
Cj4gPj4gdGhlc2UgZW1haWxzIGRpZG4ndCBtYWtlIGl0IHRvIHRoZSBsaXN0LCBzbyBvbmx5IHBl
b3BsZSBvbiB0aGUNCj4gPj4gZGlyZWN0LWNjIGxpc3Qgd2lsbCBoYXZlIHNlZW4gdGhlbSA6LSgN
Cj4gPg0KPiA+IEFzIHlvdSBzYWlkLCBpdCBzZWVtcyB0aGF0IEkgYW0gbm90IGxpc3RlZCBpbiB0
aGUgbWFpbCBzZXJ2ZXIgYWdhaW4uDQo+ID4gV2hlbiBJIGNvbnRhY3RlZCB0aGUgc2VydmVyIGFk
bWluaXN0cmF0b3IgYmVmb3JlLCB0aGUgc2VydmVyDQo+ID4gYWRtaW5pc3RyYXRvciB0b29rIGNh
cmUgb2YgaXQgc28gdGhhdCBteSBlLW1haWwgYWRkcmVzcyB3b3VsZCBub3QgYmUNCj4gPiBqdWRn
ZWQgYXMgc3BhbSBtYWlsLCBidXQgSSBhbSBpbiB0aGUgcHJvY2VzcyBvZiBjb250YWN0aW5nIHRo
ZSBzZXJ2ZXINCj4gYWRtaW5pc3RyYXRvciBhZ2Fpbi4NCj4gDQo+IE1lYW53aGlsZSB5b3UgY2Fu
IHNlbmQgeW91ciBzZXJpZXMgdmlhIHNvdXJjZWh1dDogaHR0cHM6Ly9zci5odC8NCj4gDQo+ID4g
SWYgdGhlIG1haWwgc2VydmVyIGlzIGFibGUgdG8gbGlzdCBpdCBjb3JyZWN0bHksIHNob3VsZCB3
ZSByZXN1Ym1pdA0KPiA+IHRoZSBWMSBwYXRjaCBzZXJpZXMgdG8gbGlzdCBpdCBwcm9wZXJseT8N
Cj4gPiBPciwgc2luY2UgdGhlcmUgYXJlIHBhdGNoZXMgdGhhdCBoYXZlIGFscmVhZHkgYmVlbiBj
b21tZW50ZWQgb24sDQo+ID4gc2hvdWxkIEkgcG9zdCB0aGVtIGFzIGEgVjIgcGF0Y2ggc2VyaWVz
IHRoYXQgcmVmbGVjdHMgdGhvc2UgY29tbWVudHM/DQo+ID4NCj4gPiBCZXN0IHJlZ2FyZHMuDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUGV0ZXIgTWF5
ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIEp1bHkg
MTksIDIwMjEgOTo0OSBQTQ0KPiA+PiBUbzogSXNoaWksIFNodXVpY2hpcm91L+efs+S6lSDlkajk
uIDpg44gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT4NCj4gPj4gQ2M6IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXINCj4gPj4gPGx2aXZpZXJAcmVkaGF0
LmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWFybQ0KPiA+
PiA8cWVtdS1hcm1Abm9uZ251Lm9yZz47IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25n
bnUub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNF0gQWRkIHN1cHBvcnQgZm9yIEZ1
aml0c3UgQTY0RlggcHJvY2Vzc29yDQo+ID4+DQo+ID4+IE9uIEZyaSwgMTYgSnVsIDIwMjEgYXQg
MDY6MjcsIFNodXVpY2hpcm91IElzaGlpDQo+ID4+IDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5j
b20+IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEhlbGxvLCBldmVyeW9uZS4NCj4gPj4NCj4gPj4gSGk7
IGl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIHdpdGggeW91ciBvdXRnb2luZyBlbWFpbCBzZXR1cCBz
dGlsbA0KPiA+PiBkaXNhZ3JlZXMgd2l0aCBRRU1VJ3MgbWFpbGluZyBsaXN0IHNlcnZlciA6LSgg
IEFzIGZhciBhcyBJIGNhbiB0ZWxsDQo+ID4+IHRoZXNlIGVtYWlscyBkaWRuJ3QgbWFrZSBpdCB0
byB0aGUgbGlzdCwgc28gb25seSBwZW9wbGUgb24gdGhlDQo+ID4+IGRpcmVjdC1jYyBsaXN0IHdp
bGwgaGF2ZSBzZWVuIHRoZW0gOi0oDQo+ID4+DQo+ID4+IHRoYW5rcw0KPiA+PiAtLSBQTU0NCg0K


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C02687504
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNS2A-0000DI-D8; Thu, 02 Feb 2023 00:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS28-0000Cq-4y
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS23-0003iq-Vq
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i1rx023947; Thu, 2 Feb 2023 05:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gpL10F6l1RMKXAYM15Ft9ERzcpqrm41iaqZymJ0qcU4=;
 b=YeDGgG8MzDz+2oioU0WiZgrs+JZxPAJBmR6dBnL1RU3jTI4NQ2SMVcE3H/k4vILnPytn
 jbIkqCcs98oeHVppNOJafGjcei0pE66j/Ae8H7txtu30f+0CFlViYcUGWrBX1GsD+OCz
 58N3pzjtrM5bde3EEowYSHLZS8uG7XAh//Hu/bafwzqadtYtzipxcMHV9YsH9D/WsuwB
 Zoh5nAQ8LSVudf9IleWOgBOc3BWvC2Nq2NnAVY0CQo7Pc7VO0eRcGQXKs7Nliw/rW/dK
 4941gvIzEYh4Gm36UVTyCgmfSAEXGGzjs2eehwp6D3LbtnON5BK2zYWWl1Dkwq/M6lGH Rg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkd1tef6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:09 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3124uNIV003562; Thu, 2 Feb 2023 05:21:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5fn3ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi1KBX8SZEGoIFfnzOTuicegKymy77AC5QMTcuFxAelmAHhZjJYoV9pJkpMCSesx84IYcSTsDu/ft2mq+1DX9+Mb2zZmmmeBBR0dn57SonW5DA6WNgcEXm9yJWsJM08OQKPjTR6ydm5MRb6G44J49UBC00uKmPw+nb2aw0IhsoDwx2vpp3Y3w+mA0n1QkqYhcCUfRbcDdZJUqdR8bXb6N8T18mmWcJyUWPOh4Ru3Ftekbb8+wpMchxtok6PVGXTHgP8TOsHjgMenxZchMoJeqOWq8iItoNwJNpHDoXnIA0vb6jR72qVXedTPEUb1kKVJCH0s6siv7fk7Q5s4H73RnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpL10F6l1RMKXAYM15Ft9ERzcpqrm41iaqZymJ0qcU4=;
 b=S9ADYP2uDafGgLIc7JW0AUbaw7ARxE0x8/266xq/23NAXUhfhGkkGCfhyOsy9btialYSRdeHNngyHn9MwzUXbMSv8l5QE7ei0e5zjV+t8CxlqAbZysu1i+nVtYe0uMIV+1qR0Pwhj7nezh4jqonXXypAIPY11dDD9XuiJC/sazpN8AsCDw377USDp7/ahz9PEAINEcxL+lKaoIP0hYUWW9BRuQOIEtN8AR7Aec2j2bpEzRBb74/eHdCqSGk5KV9PJJ2Iat29iK36Amv6EB5t5sler+aVNMb9mzzI8gkqGTR5q9mlt04CHQ9/2DG2FCf793XFlq3HVHiWoPc+JiZ5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpL10F6l1RMKXAYM15Ft9ERzcpqrm41iaqZymJ0qcU4=;
 b=Bm0HPDLYYrYUXNZzwn/G6s+kNsZLQ+9+8M7FbN/yL3XRccAFu6TaIi6JEHzMkVSSmHg5i2/BQNUX7IjIiX7GPHDmwTEov4TDS+DJZvNPAhpu1lbtgD6Oathd6b8xKpzrJmser2NvKYEBCV69YKoyXnmkA9ewFjrNcTbwOJLD1XU=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 05:21:05 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730%3]) with mapi id 15.20.6043.016; Thu, 2 Feb 2023
 05:21:05 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 04/24] vfio-user: add region cache
Thread-Topic: [PATCH v1 04/24] vfio-user: add region cache
Thread-Index: AQHY86IVFy3csxTgO0mQOcUKxUO0Da5qVnaAgFFOkYA=
Date: Thu, 2 Feb 2023 05:21:05 +0000
Message-ID: <D0863589-7752-45B4-A023-93A1F8C47C88@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <9440b5c4c72085055eaa9cdb1f4671adb04d78a4.1667542066.git.john.g.johnson@oracle.com>
 <a311c0a1-4f08-4ed6-be8a-9cf9033afc26@linaro.org>
In-Reply-To: <a311c0a1-4f08-4ed6-be8a-9cf9033afc26@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CO1PR10MB4531:EE_
x-ms-office365-filtering-correlation-id: 695299cc-01d6-42a0-78ff-08db04dd48a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: totyUzkBPz2CcDyxBVTmJQF4sbXKejwUYmBD0dyovRxnaB9Gf2JXcfFSvam2Wr21zqicil0I4j75ikr4UXXj/m0dt43VPNty7q1nw0d4ekgYtTI3sE9237qMKcH0Ob8TV447scLgSoAs1DtpA7nj1aQyHpLpfsxmavDt2CMz1vpu7XQGwA3WGiUAKPJkKxU1Y3mPdnTBBdh8wEwrj/O5hLS3e+1dHz0andqd+J9kmKF6BPhQwO6KOPslntpoWiSvfYmzz3lBaZjek7mZSxZqOwx6QzaFjd78AjLQG0j1yIikyT+pbBRKp0kDpUpcpnH4r7VKzQ6N1MAeZpn8TItDs8laPr4WD9X91cFyTGFejR4eC8dq1itbmsf8cjCYVquQZl41jmaYHSui8TmaEOJz+jCwnKn78TOlqwJf62cyCivqoWQ4cWI5WphhL3C2RkImBJ8XODM5RkivMsDMI69V45SvVtT3U75ao8mTQIT+By7ESCk1pvljygd0ZVK28hfQLz2dtYyNymXmuIUKBavPnemHVc6CC1kh5IWm6TK5TLc8+wnUwQ4lCbHv17V3ZwusOq24q1g1swPfAP7+31Xa9W0dzonPePAEIyYAGi591aFi7a74BTuHxkaZBDELrY4RPZ8PlbHfBrtGbRIpj8Lq3Ngp92xcEp33lzBKBHh4YvIWBdhoCYiBqFkexrH00o0Xb13AusB23rqs4B7H+SUi2i40/KIuyk2rH7L8NaYEY7I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(36756003)(76116006)(66446008)(66556008)(66946007)(66476007)(38100700002)(4326008)(6916009)(64756008)(83380400001)(8676002)(122000001)(316002)(6506007)(53546011)(26005)(186003)(6512007)(33656002)(6486002)(5660300002)(478600001)(86362001)(41300700001)(38070700005)(2616005)(71200400001)(8936002)(66899018)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVpDcDBmRjFZSE1XYk9uaERjUGxQaXJFWjBZQVFUMnh2VU1FY2lTczhvZnFj?=
 =?utf-8?B?K3E1Z3dOVHZaTXMyNXVzazRncmVlQlV2K2NaamNic1orSkVPOVA3RGw0ZU5q?=
 =?utf-8?B?YWJXRkxIeFVmU3RPazVhYkNrQytLK3N4V2dIQUMxSTByemovNEVTNkVScW9p?=
 =?utf-8?B?elE1citBaHhlM2xxbWQ2OHZCK0dMSy9NMkc0QmtLYzIyY2JnbHJ4L2xWalJi?=
 =?utf-8?B?cHlpY29qQkMxc2paUWZBSWtkWUU3NWM4aUc3UVdWRjIrSFBiOWxnNWk1cmVq?=
 =?utf-8?B?RklYeWxjOVBnVEcrbEZ4YXY2QVBFeENQOEd0T2kwSlJOWXhjc3pLbURVMy9y?=
 =?utf-8?B?V3FNZWo0aDEvK3F2UHc5MnVta3d0Z2ZzemJvL2JsZ2NTOTZNL3dDT2JIZWpi?=
 =?utf-8?B?cm1EdEVsRVdHbzNYaCtBbEtQaTZvTEgvQlNXa1F1N1k1TTNmRC90Ynh4ZG45?=
 =?utf-8?B?K1ppbGZuZk9ucU5QcisvUlRHUFg0YTVLRlJXM1Avd1JQMk9EM0FYM3FBUlFi?=
 =?utf-8?B?T2VnOUptMWY1VGQwU0N5NEdPU2R4TisxRzBWQWdTZmI3SEd1N1FXanBleUlO?=
 =?utf-8?B?ZWgxTjREb21OdDM5OGR0Yncyc2g2WCs2WENIbU0yeHZDdTJjR2xwWHJuSzlG?=
 =?utf-8?B?RFFuNlZhWFNEVkt1RGNNc2s1RzFiN3BhSkxGSW9TNnVzMml2aG9Ea3hBQjVi?=
 =?utf-8?B?QnV6RlJ1OXY1aVdySXBPRllhT25aQWwyOHViTHlaZk5NL2s0QTBva1B4RS9o?=
 =?utf-8?B?YVlwSUhpYjB1eTNXYmhudnlKcVdLcmVxVjlvTnkwWEFZbkxIeHZMbXFCcTBt?=
 =?utf-8?B?YW8vbmRqZ0s1MUI0NlBlN3Q3VUYvTHlyNE9IclZkRlFTTThDQnVzVU5ueEpV?=
 =?utf-8?B?NXRzN3lNaXpHQm5CcGlmSktlUVhNM2ZUbFgyWmxBS3EzdlRXbU9HR1dFNHNk?=
 =?utf-8?B?c0Z0S1lQWGRWdDJHWUFBY3h5cGJSQ3VXTTRnVEpGY0p2dXgweGt0QndIV3Zi?=
 =?utf-8?B?cU5NMGlTM3JNdkZXMnllZzVHc0FXNW1mMzdlcVF3TEkwY0xRRi9jOVlLRmJp?=
 =?utf-8?B?a3Y5Z0IvS05jK216TXZsbXc5TW9SRkRjb1Z6bVYwd25YQW5Na0Q2T3A5Z3pD?=
 =?utf-8?B?a0hpcGRIZ3hHaHcxbXhPTUUwMktVTUVPWTNPaTdGbUdSalpTR2ZEang1QzVu?=
 =?utf-8?B?c1FxdU1OcEVGdWxIWk01cTNKUCtrYmpmQmw2TGZFYU9mOWNvbEVxU0l3WGZP?=
 =?utf-8?B?RzN3bThicklKUjZNRkF6dDNGeUFhU2FPWTU0YkxrNXB2NDE3cHlkNC9GSzcw?=
 =?utf-8?B?Ti9hejBGUy84STlSbVFCRTlhK0JtY3B0YlUveWZsMkxqVENqbzY3R21QVDV2?=
 =?utf-8?B?b0hMOUJmR0xRYUF4L09NRTBJQjE4b3dJalc5aS9xay92WVNONUk5SzFrK3Z3?=
 =?utf-8?B?bzBTMWpYOUVHVkdEa1Z3TzhKKzcxNHlBdm9oZmU2T0xvelRNdlRLUkpKeFBp?=
 =?utf-8?B?MERJUFJiYmRob0xYMUF0TW9zbXdPbTdGaVRiUUtFaEtiTUpZbTlKVS9Ddng2?=
 =?utf-8?B?b2RWY2ZEbXU4am44a3hIYXFmK09XYXduZ0pCK21kRE96V1FUNlA2ZElvSy81?=
 =?utf-8?B?UTVBU1VSaXBiSnI2UDdiZzFZQlUvcG42ZDY0RUhONjJNUjIzdS9heTM0Sy9O?=
 =?utf-8?B?OVA3S2R6ZzNudkdwVHhSU1l4bFI1cXcrY0Y1NU5adVJuZytleklFUFpETFB0?=
 =?utf-8?B?RU1vNEEzL2FkOGxrRzc5cDM1WFU2WGVodGg2QVUwbnRFZEZ6ZVA0SldnQ3pU?=
 =?utf-8?B?SE1nMVA3clBpazk4b3NRT1JZV25tS0Z0eGFqUU55SGozYzJzbG5VTXBZM1hw?=
 =?utf-8?B?Y1pienQ0Q0ZqT0U2dFdpL3F4VEhQR0MvbE43Y0hMRkNTbWIyTzdFbEcvZXRC?=
 =?utf-8?B?K2FseW1jaWpkM1hHUndaamFMYmlldEQ4WmF5RzV6N1ZVRDJTZDZzMFFMMFlP?=
 =?utf-8?B?K2ZvT2pvWXRaU2RZTXNaN0ZYU09GV0VoZE16QnRKQXZ6OXhydnhSZ2h0WDBm?=
 =?utf-8?B?OHhrSDF5c21YQjBrdjRTaWlCemR4eitnNHExYVNJdHQrakR6QzNkdjA1S0lz?=
 =?utf-8?B?VjZUK1Q1b29vajNEY2xKL2hSRTJOVDRNaG51Z2huWkZ0cEhsU25vQTV2Mmdr?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FFF8AC23AF64B47AD86DBA94C61F52E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rLRpD93JkRluzCXrUeUlBiUzJ5pwACO3oJi3TFnxZbNXvGrAWRRnlfGYQUcxO0xsOrm/ROPsw1xf56KWs3GHfZN/CCmNC6xGR/iQ49YWOqSQlxBjafAa2EgeH5nT1pNjehQ5fCgftpvRK35jFo3XcOLAfLqlFUe0ZRrlDSuESQ7vS8VlZW3KwBrIkNaVR+v55RJz/+ZQEy0RvIbjpU+ftUBm4mc8Q98icycKqaqTlwkDfJjakhkBk4adLR8xbQl7d5NOM1K6KwYhNyExXo5fJy0lNOAKTtde0IMyB6QZn/B5fVr/wBRlSZCUPHHLdTBpGBWPG6YSN7G0td9mJ4rvcYeLqUCJeio6wo3bqCJSVHtCj/thlKXFKl6s633HVLEM3MGnvIcYr544chPF8dgGlOVjlc8SYu3KVPE/Bv0ltSnV4/XFitJHMuGz2H1+mClXoa8ETHnlJCCIdptWAQKqPSjQgJJIA1s2uHPP3sj5qVGtdlpGOj60O74RB7xpGnpaEFHFO8IVFslzMyj4/khAOVePt9CRphzdgNRvD/vB/60WZ4gymF2UQiT3DGdpJK/MWiZORehJbVyBmr5SOmoinIfwRhP7EZCPRcaUAqtoArf58F2W9HRNeM9I7L+v7SR8NTZiLhKtGoUum60F+3MpkuL3Wagg2Pvu7fdZnnTgE2uS+LiC1Us16INGmIcNjeUU0+Ba4NmMZELIhr8ECxC0/IwLM9+ZJkrXZ5RAefrgKqPd7nqcBcTTNMn2rWsTcukpj6BX3xOGf9p81T36Dh6kpQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695299cc-01d6-42a0-78ff-08db04dd48a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 05:21:05.5988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyuJnai6HqTAcYVOOnpViv5xz/8+tmyHcRLPcQjtIiaJDwSn+aGmMFiOlmBuFb50F4AuX1/Wl3jTkiQ7+DwR7Y5jjrvTZH7kgjNUajmsiG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020048
X-Proofpoint-GUID: cRjFc73R3zahCEpniWd8mOwBQF9EJrDI
X-Proofpoint-ORIG-GUID: cRjFc73R3zahCEpniWd8mOwBQF9EJrDI
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gT24gRGVjIDEyLCAyMDIyLCBhdCAzOjQyIEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gOS8xMS8yMiAwMDoxMywgSm9o
biBKb2huc29uIHdyb3RlOg0KPj4gY2FjaGUgVkZJT19ERVZJQ0VfR0VUX1JFR0lPTl9JTkZPIHJl
c3VsdHMgdG8gcmVkdWNlDQo+PiBtZW1vcnkgYWxsb2MvZnJlZSBjeWNsZXMgYW5kIGFzIHByZXAg
d29yayBmb3IgdmZpby11c2VyDQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9o
bi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2
YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5h
dGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+ICBody92ZmlvL2Nj
dy5jICAgICAgICAgICAgICAgICB8ICA1IC0tLS0tDQo+PiAgaHcvdmZpby9jb21tb24uYyAgICAg
ICAgICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0K
Pj4gIGh3L3ZmaW8vaWdkLmMgICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4+ICBody92ZmlvL21pZ3JhdGlvbi5jICAgICAgICAgICB8ICAyIC0tDQo+PiAgaHcv
dmZpby9wY2ktcXVpcmtzLmMgICAgICAgICAgfCAxOSArKysrKy0tLS0tLS0tLS0tLS0tDQo+PiAg
aHcvdmZpby9wY2kuYyAgICAgICAgICAgICAgICAgfCAgOCAtLS0tLS0tLQ0KPj4gIGluY2x1ZGUv
aHcvdmZpby92ZmlvLWNvbW1vbi5oIHwgIDIgKysNCj4+ICA3IGZpbGVzIGNoYW5nZWQsIDUxIGlu
c2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQ0KPiANCj4gDQo+PiAgdm9pZCB2ZmlvX3B1dF9i
YXNlX2RldmljZShWRklPRGV2aWNlICp2YmFzZWRldikNCj4+ICB7DQo+PiArICAgIGlmICh2YmFz
ZWRldi0+cmVnaW9ucyAhPSBOVUxMKSB7DQo+PiArICAgICAgICBpbnQgaTsNCj4+ICsNCj4+ICsg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCB2YmFzZWRldi0+bnVtX3JlZ2lvbnM7IGkrKykgew0KPj4g
KyAgICAgICAgICAgIGdfZnJlZSh2YmFzZWRldi0+cmVnaW9uc1tpXSk7DQo+PiArICAgICAgICB9
DQo+PiArICAgICAgICBnX2ZyZWUodmJhc2VkZXYtPnJlZ2lvbnMpOw0KPj4gKyAgICAgICAgdmJh
c2VkZXYtPnJlZ2lvbnMgPSBOVUxMOw0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgIGlmICghdmJh
c2VkZXYtPmdyb3VwKSB7DQo+PiAgICAgICAgICByZXR1cm47DQo+PiAgICAgIH0NCj4+IEBAIC0y
NDMyLDYgKzI0NTEsMTcgQEAgaW50IHZmaW9fZ2V0X3JlZ2lvbl9pbmZvKFZGSU9EZXZpY2UgKnZi
YXNlZGV2LCBpbnQgaW5kZXgsDQo+PiAgew0KPj4gICAgICBzaXplX3QgYXJnc3ogPSBzaXplb2Yo
c3RydWN0IHZmaW9fcmVnaW9uX2luZm8pOw0KPj4gICsgICAgLyogY3JlYXRlIHJlZ2lvbiBjYWNo
ZSAqLw0KPj4gKyAgICBpZiAodmJhc2VkZXYtPnJlZ2lvbnMgPT0gTlVMTCkgew0KPj4gKyAgICAg
ICAgdmJhc2VkZXYtPnJlZ2lvbnMgPSBnX25ldzAoc3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZiYXNlZGV2LT5udW1fcmVn
aW9ucyk7DQo+PiArICAgIH0NCj4+ICsgICAgLyogY2hlY2sgY2FjaGUgKi8NCj4+ICsgICAgaWYg
KHZiYXNlZGV2LT5yZWdpb25zW2luZGV4XSAhPSBOVUxMKSB7DQo+PiArICAgICAgICAqaW5mbyA9
IHZiYXNlZGV2LT5yZWdpb25zW2luZGV4XTsNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKyAg
ICB9DQo+IA0KPiBXaGF0IGFib3V0IHNpbXBseSBhbGxvY2F0aW5nL3JlbGVhc2luZyBvbmNlIHJl
Z2lvbnNbXSBpbg0KPiB2ZmlvX2luc3RhbmNlX2luaXQgLyB2ZmlvX2luc3RhbmNlX2ZpbmFsaXpl
Pw0KDQoNCglJIHRoaW5rIHRoaXMgaXMgZG9uZSBhbHJlYWR5LCBleGNlcHQgd2l0aCBfcmVhbGl6
ZSBhbmQgX2luc3RhbmNlX2ZpbmFsaXplLg0KDQplLmcsLCB2ZmlvX3JlYWxpemUoKSAtPiB2Zmlv
X2dldF9kZXZpY2UoKSAtPiB2ZmlvX2dldF9hbGxfcmVnaW9ucyAgYWxsb2NhdGVzDQoNCmFuZA0K
DQp2ZmlvX2luc3RhbmNlX2ZpbmFsaXplIC0+IHZmaW9fcHV0X2RldmljZSAtPiB2ZmlvX3B1dF9i
YXNlX2RldmljZSAgZGVhbGxvY2F0ZXMNCg0KCQkJCQkJCQlKSg0KDQo=


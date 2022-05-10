Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE952212A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 18:25:10 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noSfd-0007LV-GT
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 12:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1noSb0-0003hW-Eq
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:20:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1noSav-000084-I6
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:20:21 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AFS3g8007656;
 Tue, 10 May 2022 16:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4/SP1lwHh6OnwD3Mq3w5Q0zLAXnSoeLs57KeN6zYa6c=;
 b=p8t3fY1wPyQgIkac/IZDzcR399RpZmx2m+7brRtQmOdVK7jp1wdYGCBNNR/1ViEmVw1T
 QuzEP4PWNXQZiP5x+2L6eVnisN2kt+xtVrp9VnvJFeYFdfbZzDhvmYPKP+q9yMEwWOY9
 p6EuAAulBPBsp83S5HEqRBASXeKelbl7RLicku0ha7g82s/f35IUMuSbPA7GEBJhxIZF
 31drC+jiBKI2qFGuoh9VH1hx7FXBlgYTk58Es19dXIK//Pj9wDhX9Y0NL7CM07S9cCp9
 LmMkfGyGT0ErKlRlYgx+kZhpMqeHVqnyyKVjxuf4grCRdTZD4pz5w7ThEHtDLodEMDwO SA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgn9q058-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 16:19:50 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24AG14p1016656; Tue, 10 May 2022 16:19:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fyg6dqh3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 16:19:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+ERYLqlZglCbXcvMUVfy24v9Dy0dQrZIofyz8jELY4dVlAXne8jfegnD72DLsAsON3uEo3lBABIWGs9F7xpH9HBSgriHM2oh5O86IaIf4RlKAyyh0nTclxqmdGe3z0RvOO/u4xFRCAmRx1V+gmcPNI5J0wVpC58xpOqCsuNSpoK7vjGNGWxh09yFBIkah5wEF9rT1xzY7OM8Kg2sKBPqBq0VyZDsouHWk0AMZlIxsyd35cMJsu1hzVRPJQlwLctGq70JcxEIzf9mRUArOEYn3LQoCycawiEZN3DGaeVmaiXVOd3ZAnM8ZRw1tDEkLf6kBXIVDHy1Z+JGtyvsJc6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/SP1lwHh6OnwD3Mq3w5Q0zLAXnSoeLs57KeN6zYa6c=;
 b=YMv64V6qJnJtP7Ublc3/F/oG1oFiF8r3abmO1Q/RaU9XLBearPRYrZuHlY3cV86y9Abz4tDRIU0xVTARyu9VOWMH0LgpqxaOUGc2I00/EvLitJ5T1NQUrdOAwAs64fpxVNzyM8t4v7I/geWT0b8+bN9CSyGmKhDK60vp2plRgv7KbqyDiote17EewpMNFCc6Mhy5kAT2noxB7LVPYIsEwpkwSRf/+HCPqVgK0/vwT8qso0Gl5aqVfgXN/GFqzxG1sq9kQI5CiMd7OnseAmpS5mCmhZb86Sq/zQsMzuWGB4qROOKHOSLSXjK9sBCSYMNYcMdH1MGAfvGbxFfGzvk7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/SP1lwHh6OnwD3Mq3w5Q0zLAXnSoeLs57KeN6zYa6c=;
 b=XEJG6dyuJ1h2WHnGoeac+ggZy2XO+YhbBitTgRkm675YVb24dq5XbbFbQ816XYN0nhINGR5VoLCjrCpRjzckNUMvFQa+et1bvjLiTDLz8wnSVq1rjs3gbTZJi4Q+AuAon/3cSxOXk2sxhF7qEk3VCynv/k9mRTyBHrt1NzRyzkw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA2PR10MB4426.namprd10.prod.outlook.com (2603:10b6:806:117::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 16:19:45 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 16:19:45 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 06/17] vfio-user: build library
Thread-Topic: [PATCH v9 06/17] vfio-user: build library
Thread-Index: AQHYXvh/L5A5BTPf7k6EnVwYeLQxCq0QbrOAgAAKdoCAB6rdgIAAMY0A
Date: Tue, 10 May 2022 16:19:45 +0000
Message-ID: <78D90B7F-A9AF-479D-BBF4-FB9CD7A1E5C4@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
 <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
 <CAFEAcA9fOH1=hseVHwsvsJujeiB6cXn6BFnxyp36vYnmjVsp0Q@mail.gmail.com>
 <YnpnD5Xzdobr+Vfw@redhat.com>
In-Reply-To: <YnpnD5Xzdobr+Vfw@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 961dbcf8-34a2-4c87-e33f-08da32a0e5b0
x-ms-traffictypediagnostic: SA2PR10MB4426:EE_
x-microsoft-antispam-prvs: <SA2PR10MB44264AE89EBFAA5D3BC826F790C99@SA2PR10MB4426.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2vqo2s5j/1nppeP5YXV1wGCabOIOf0QVtPhDK+cVJ7bbxdfZDpJ2rD2Z6B5ifjI8num5H2ki8msIaYMw7XcO6R4S9DJN+grzujARPFD6PeKTv9z6TSRgEM9TzOxIIajeV8pKnyy8S3vI1WGPSUHh9NoxGMs4c7gbJ2JEGQTtQ+JOR3zjq3dUS72SpWrltErJbsDlgdvno4SeL+xCdGye75umqQ6udxszBHTdRBccYUzsEapOgd7+6mB4i0yQ5OYcF6F7e62aI/U8x4GAFGok5c+bq2xJjbBRuPwWRsWo1q+5sjPtBL4rP47pHPPoJKwO9/qD7+Pq1AYySr8fq3xI4TtcsFcnHmHFPf23pcnUSVCnVCry6/ff5qSyq6Xw2+5X3K9jF3tdCofkxJL2dVVHSaNKXheTwotjTx294qCY03t3ozsFK3jxJpGiGyWYO6528NnkExUIIxxZn4x6F0aRgPih3ZLBkx/800g7FSa3wTa1QeBPxTyQSdm3cnaKzNiJnbiZLnx1CaxKa+h4P63MAPPuEZquAKuoouzfgtwseep3FGgE3ZMdbMM6cH7BbZRLACbsKDL52TRUC/l3tvpciS0Rj+0N+e1mFsn01pKxVarzUQ+B3iDUy2uG+p1XnDOMQeVLzS41PzxhyB9DsdWPEHJueVroJCAdrrB7dIWOJJxflMNzbNH6bnX/5RrSf3Y3A1n3GJNzf2MZ0YwpiPwwRTCKNb/XYXYpMFDoopdbyzVLVT5pfaiVxGlq8YLlk1YVh4t1yIaSa8ef09txUCSfTG1RDGAJLnQpM4+6G1+rDnx9XLx5BtrRfisHqqPOcJ7UpFB9nsfbYI4rgT2lb3Q7hmftOQ64s9O5y5TJP6Pi4l8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6512007)(107886003)(508600001)(71200400001)(6486002)(966005)(186003)(2616005)(86362001)(6506007)(2906002)(5660300002)(7416002)(53546011)(122000001)(316002)(36756003)(83380400001)(44832011)(91956017)(4326008)(6916009)(8676002)(64756008)(66476007)(66446008)(54906003)(66946007)(66556008)(76116006)(38070700005)(38100700002)(8936002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0RPSG5hNzZVT3N5QUZxNlJtRWZRMmxDYVM0UWV4QXo5UEozbExIUGNzRUQ0?=
 =?utf-8?B?d2RTVWk2cElXNVpORFFqblJnd2pkYXdhTktmdGhFWDQreitwaVllNUw0dFpM?=
 =?utf-8?B?dmZXWTRPRGloT1QzQTNWTUlCZGlmbWN6U1JkWVBTY3J5OTlKOWJTc2xzNWZa?=
 =?utf-8?B?bndpcC9KSmxlQmo3bFFZUDJJbHV4SlpKbUVxdGFhVGJBelgyL056RFNoZnRH?=
 =?utf-8?B?N3BiK1V5YzdGbnFxNmxZZlc0Um16bUlDcGs5ZHVWeGhNSkxxVHdNd3ZQSmpN?=
 =?utf-8?B?bm1Eb3hEQUE3MUJOTWIxRTREVUxKYndKRjc5KytQWS80MmRSb2ZQc3VTcFZT?=
 =?utf-8?B?TmhvU1BVMkJzTEpYbFRGT2NiRFJzMGF2OVRzamRyb0R4ajA3VS9CUUhPL29a?=
 =?utf-8?B?VGxNUHArak92MzlyWFZEL1pKcHhSdXo1a3YyMjVLK3lGSXNmbkR4UXFRRElD?=
 =?utf-8?B?akNqMHovQVVMTmk4eHh4YWhObVZnOFIxQmpZZEtrTHJOYTV2a2JhSDE3QnpP?=
 =?utf-8?B?NU9GeGgvdXlLOS9qZFBVRk1HOTBCakM4UFk1UUhzbEN6d1AzajVsTUd2OWo3?=
 =?utf-8?B?VDljYzBVcWlodVZkV2tjMFZnNDRVUnRMa0ZOc2lqblBpbXdGRkQrSW5Yc2lI?=
 =?utf-8?B?MzhuT0h1QmJUUFovVFc0Uzd1Y2pOUnpkbGdVTThFdWRkUmtCMzE4em0yNENS?=
 =?utf-8?B?S2JMclZFcHhTZjVnWEQzUEZnYnd5Sldjd1FOczVnMFFtKzNubWNUekJLVHUv?=
 =?utf-8?B?S014cVJ6MzNlS2JHY0ordzMrY1YyT3RtY1NMZWhGT1hQQTJkWmlxQlhRRDhR?=
 =?utf-8?B?bmR1TzJJbkZ4TlJJZS9weE0xWElzZ1ptcVpQdTlqOUdxYXc4MjViaG50MGs0?=
 =?utf-8?B?ck5RT0NoRE9hV0FMcHhEVTRkRW05aCt5R2FRRjQ0aVJMV1FZbnlIR2YydnN6?=
 =?utf-8?B?bk54WGdvYUJHS2liTUgzSTVHSWIwK0JSdGtHSEMwUHpGcjVmR3JKWVc2djgy?=
 =?utf-8?B?cE9TZ2hQaThWZE1NV2xOT1R0LzcwVHRLK1pTMXhyUXlEZmhRbzBrVkQxbFZU?=
 =?utf-8?B?N0tyZm9HUGZndjY4UmlXMCswb1Z2R0lsU3lERmpNb2U3NnFRTWVqdWd0OVBU?=
 =?utf-8?B?dWdaTzJGYnhvYTV5aU9kTDdUZlFuajNrMFhzcTJPREVucmJyeWFXT2tTdzBH?=
 =?utf-8?B?Qy91bzhHNlBNYk9Ud3BicnI4SVZuRE5RZUZDTXdmTU11QThqTGZxMWM2N2NF?=
 =?utf-8?B?Rll2eW80OEZqUEZOSlJ5a0xYcEVObUlLaWwrMkdiK29EemtCZHJSSmdqdzhT?=
 =?utf-8?B?MzAwRzVla3RQby9CcjBsUVIvRjJsWDhESXAxV1RpRHNBbWtHRWU4US9lNVdS?=
 =?utf-8?B?V1NyMnRVWkw2ZThuMWpHMTJlVHNrLzBrMGNiSVJPank2RnI0blBBNmNLSElv?=
 =?utf-8?B?cUxEbEJTdndCM1RsaCtJUXFLdU9taG9LNEhKODRwdXcreHBFSGJGY08rVFJZ?=
 =?utf-8?B?d0kwUWp5Q29QRXpCbW8wM0todHZ2eG14QmY2NExmdTlzUTR5T2d1LzZKN0E2?=
 =?utf-8?B?NXIxYlVjZHJXR0VJQmlIYTJLb282a2cyRjEzZXAxbTVndUIvRXNCbXlKRFNz?=
 =?utf-8?B?NkVkdllpTU1TUEk3a0VZRWpCWGd3UDhPbEgzazlYeW81R3owcnhKT1BnZ0xY?=
 =?utf-8?B?Y0hjb3c4N2xIcEJTbDM1MkVldkNEUld4c1ZlQy90eWthOFNQQUZBa3Q3ci9s?=
 =?utf-8?B?WXFkeEhRS0NPMHcxY1Y4WjRxL3ZRQ0Y4TVprd0N1YzJQNldMV2J1bEhnck95?=
 =?utf-8?B?bkdpOVJMbjlYOEx1OWgrWjlBY0VqWjluRUJZQTUvWUtTUHloTXg2Nll2bXBq?=
 =?utf-8?B?bkVIQTNteGc0Nk81WkVkYmNUQk9KSUVtU0tDZFpBV24zOFdOdk43UW9jdVZq?=
 =?utf-8?B?ZU9odkpKSFNHYVpwanhEcEtmN0I3UEJPREJVYld6Z2ZHbHdSVkNJZlYzYjRC?=
 =?utf-8?B?M2xxSTNpaWpFdk1JaCtBMzAzbUdadno3TkkzSkU3Y0ZIS1NpYkZNZm4vUVRE?=
 =?utf-8?B?YytSbUlvYTh3WTFtenh6MFFWVVZRaEFNcGljRTRHWlZOeUY1NFBHQkFBaFhZ?=
 =?utf-8?B?VWh1dXk1ZjBIOEw1YTBZUnBNVFh2dERGTlhUSDV2TWdSR0p2a1dyMjVSL0FK?=
 =?utf-8?B?QUFLL2hJb041OFRDU2NmTWlnQXlzdkM4RERYN0ptbExoZ1RIanZmTzlRSGdO?=
 =?utf-8?B?Y3ZaNzFyT0Q5TmhnYndzeFZCbUhaQVRZSkJsWStxLzlyZlNhZGZoOVZjS0dj?=
 =?utf-8?B?VVhVMHcyMGRhWFY5VVRvcDIvNE81dVNJUjBSNWV3dDZxV1NoQVVqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ECDCC08DB39134CA9E12BC79825DF6C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961dbcf8-34a2-4c87-e33f-08da32a0e5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 16:19:45.5765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MyfE1UYpGm81WUMzTCi5yg+s76gwZIaLu9HfA+68LeWQECzK5lfZNoelxuCMvBfw27R4GVmvGqexsXmuTueYsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4426
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-10_04:2022-05-09,
 2022-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=890
 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100071
X-Proofpoint-GUID: 1HSgAFeHmXW3bmFMAo9qCK6dz93hX5Wv
X-Proofpoint-ORIG-GUID: 1HSgAFeHmXW3bmFMAo9qCK6dz93hX5Wv
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDEwLCAyMDIyLCBhdCA5OjIyIEFNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgTWF5IDA1LCAyMDIyIGF0
IDA1OjE3OjAxUE0gKzAxMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+PiBPbiBUaHUsIDUgTWF5
IDIwMjIgYXQgMTY6NDQsIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMTA6MTY6NDdBTSAtMDQwMCwg
SmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4gVWJ1bnR1IDIwLjA0TFRTIGhhcyBDTWFrZSAz
LjE2LjM6DQo+Pj4gaHR0cHM6Ly9wYWNrYWdlcy51YnVudHUuY29tL2ZvY2FsL2NtYWtlDQo+Pj4g
DQo+Pj4gVGhhdCBkb2VzIG5vdCBtZWV0IHRoZSBtaW5pbXVtIHZlcnNpb24gcmVxdWlyZW1lbnQg
aW4gdGhpcyBwYXRjaCBzZXJpZXMNCj4+PiAoMy4xOS4wKS4NCj4+PiANCj4+PiBQbGVhc2UgcmUt
cnVuIGNvbnRhaW5lciBidWlsZCB0byBjaGVjayBpZiBVYnVudHUgYWN0dWFsbHkgd29ya3MuDQo+
Pj4gDQo+Pj4gSG9wZWZ1bGx5IGxpYnZmaW8tdXNlciB3aWxsIHN1cHBvcnQgbWVzb24gYW5kIENN
YWtlIGNhbiBiZSBkcm9wcGVkIGZyb20NCj4+PiB0aGlzIHBhdGNoIHNlcmllcy4NCj4+IA0KPj4g
WWVzLCBwbGVhc2UuIEkgcmVhbGx5IHN0cm9uZ2x5IGRvbid0IHdhbnQgUUVNVSB0byBhY3F1aXJl
DQo+PiBhIGRlcGVuZGVuY3kgb24geWV0IGFub3RoZXIgYnVpbGQgc3lzdGVtLg0KPiANCj4gQXMg
b2YgdG9kYXksIEpvaG4gaGFzIG1lcmdkIG15IGxpYnZmaW8tdXNlciBwdWxsIHJlcXVlc3QgdG8g
cmVwbGFjZQ0KPiBjbWFrZSB3aXRoIG1lc29uLCBzbyB3ZSdyZSBzb3J0ZWQgb24gdGhhdCBmcm9u
dCBub3cuIA0KDQpUaGF04oCZcyBhd2Vzb21lISBXaWxsIHNlbmQgcGF0Y2hlcyB0byByZXBsYWNl
IGNtYWtlIHdpdGggbWVzb24uDQoNCi0tDQpKYWcNCg0KPiANCj4gV2l0aCByZWdhcmRzLA0KPiBE
YW5pZWwNCj4gLS0gDQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBz
Oi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KPiB8OiBodHRwczovL2xpYnZp
cnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5j
b20gOnwNCj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8v
d3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8DQo+IA0KDQo=


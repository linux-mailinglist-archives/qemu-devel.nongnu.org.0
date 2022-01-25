Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70C49B7E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:46:21 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCO1U-0002iy-AN
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:46:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCMXT-0001vQ-Ub
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:11:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCMXM-0004So-MO
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:11:13 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PAxbAJ020683; 
 Tue, 25 Jan 2022 14:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=h9nTuYpDqjlgRIMRyvrAWrDqNBMjx/V46xljSufvrdA=;
 b=0V5I/Sz4i4Y78nxLukNx+mHxfQHD8ieBJFuDUp8FcAB9tfSCCaVul8cLxjTSfNpcoHFm
 rm8iAEixr+iyi9QUCmRkFCmdSJLXwu3KzfDrGJ44hxaBp49Fh3ygNmu038uJcyTb/w/J
 oCqbtzy4JepnmBunBdwMjt9kn3QRAmRGMIboRcOUTaspmHqDOy7tBtoyv5w60/P9ZIeD
 wZyuNtT/o3vMTxXvYtgmzqkys3mtHh3w9K2+TvBIMjTs7nObdtHB/jfjgSekUbS1SnoE
 cg5r7DOdXMgZgG86jCd2t6xIK4Zz36zFX6/+ymMMnUx3WKo8W6FTvPYsxg7rQZ1lljLs +Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dswh9ke8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:10:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PE5IdF179218;
 Tue, 25 Jan 2022 14:10:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3dr7yfwn31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp/Ri3k4fumfdEA9nCVDYIo+BTCAlUoC2O0NhuwBMs516Gm3K2k6ZX4UTvQ7XoaO6qCthLwMCmy2qeZXYCIRT2vgXZCNEbXnHtL97C1uWf9uIVSAwxUhd/xyFgZp2Z6DLi6ypsXttIAOGusNx4s8MJ0yuoYBu5uuvr8J2a41zxQPp+9SNz6M0lv0XKu56e+QF7akwfExLBJuTLIuAG798kYs26DkYG6nNy3Swkosbnl5VSWSX7pRfogwjUNIOv9+xMGjwBdUL7GxIVDx9HNJS/65/E3L1uM0+RoLAnfBzhfJL9r+SLXqmltwx17r7h5rBdRap9opxn0mZxhq7OZYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9nTuYpDqjlgRIMRyvrAWrDqNBMjx/V46xljSufvrdA=;
 b=Fp/uTKSmVi0tLOL9KDl9j1iMq4Wu25eLW2eM6UqTqJb6NKoPI4ySSI+sJoJvPTzR0wHw4OSl8Ob74tvHju/XInx+gIqh8ToM0ovCCDLtTiK/S45TsDJv+iWLC0HwCZxyq48UmWBUAo4IohUp4pqeNCE6PSXJEwwRmy7qPyYmgVxunpuNl1zp/LrJUJscJ0Dm8cJODoe5MpDftr0queDUqkvrO66hjameJNCoGy+XgNrMUbmBA7sbyJu4mMe18d7ZphLjxLQejZ7PBKafknmCBBpmQ38kp7XVWIxZQtnM8XgV8yk4KQA0C+ulEaKkob1SbFcaeowxcJUT4I1ous3fPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9nTuYpDqjlgRIMRyvrAWrDqNBMjx/V46xljSufvrdA=;
 b=zVWmVGM9ww31+y2P4xBYkC/SIq2b/EMaDvwXqH3gFtmxba+bnS1sL8ufQB0JXB/7fNq+3jSojwPQO9gKCxwoinEPDz2luz9L5dJVMCLU4BIxvlNg/1JXieGd9gat98kx7Y9npq0iDei70facSNJNiWNQBe6fD0RKLhzRzaNc3r4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH0PR10MB4680.namprd10.prod.outlook.com (2603:10b6:510:3e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 14:10:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 14:10:49 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 04/18] pci: create and free isolated PCI buses
Thread-Topic: [PATCH v5 04/18] pci: create and free isolated PCI buses
Thread-Index: AQHYDX12wj16Btimz0ay4VK3oT94XqxzkKOAgAA/FIA=
Date: Tue, 25 Jan 2022 14:10:49 +0000
Message-ID: <33456B8F-E85A-4C02-9511-4B86787A6D5F@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <566b2ccf8a7a5ce2ccb21f66c988a0feee83ee8f.1642626515.git.jag.raman@oracle.com>
 <Ye/P/dUQ1Ngz24kI@stefanha-x1.localdomain>
In-Reply-To: <Ye/P/dUQ1Ngz24kI@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd52ce7-794a-4cc1-dace-08d9e00c7d22
x-ms-traffictypediagnostic: PH0PR10MB4680:EE_
x-microsoft-antispam-prvs: <PH0PR10MB468093622A755F1096D51307905F9@PH0PR10MB4680.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTwJUXpZH0ut2djXiYuhjTOn73Os/5dO0bzKw0PKyuxtozLEgwjwmjhfHi75z2bc0wQF3+dEV58Q1DFbxou+UnukY9Y5f/nHnWIsuHBrRQWaZ6tmelu2NXjd2PGUNzihGkFe/JuCeNpkGMNGOGzknNh4nLEm/xsjUlGWnwvtC9siVmOMoC0WeVe7TPccAKNx/Pd1m0fIzQRg2FiPT4MOZku9gkCrxBGlZQ9SmFrhvBiuEdLEQgOt1o40lvyWLkZUr211JH+2E6nfO2GnIECNqASiz14PiHWmDSlh77dUpMwyFh4QgXnwg60aXqy3QsaNjjUhbm+FPboXPj911mkph1Ig9aC3O7lsukXzdJuV5l7AirxCIk1I7uxpRdY7ZrM7pA714va4fjYTql9YAnhZNBl/na0Idw/CpM9BgpbhunLKTNlHUKdDd8SJnPUs521XZE4AR89w6bPFajynO3qCU7GqxtGJoikkSzIcxnm314eRTHE5zRX1O6jk63J9msyGwQde8SsBUtZdxNAJAkCZ83h5iqD8qx2LV3SlSUUV9ThsoaIPg4GRNMKHNQkDgREcI3alvooouUL1xHHrxvtdPF/ug1ZXvCNq9BhHD5sVh7tranCuLDmn/KXI8xOg8wF9Fbty7YIMim+T5JXwcfST8YIZtCSDLk2ddqTS9kV+KcqxvL0UcwUuqGj9ov+Pdkw9ZJ71NMJK+lSnkGaO2Mz9wYsn9pbW5Z0BujTWd+5YvuLuJJJtBEGJ3Oac/5jtC5I1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66556008)(36756003)(2906002)(83380400001)(38070700005)(6486002)(91956017)(2616005)(38100700002)(86362001)(186003)(6512007)(44832011)(122000001)(66446008)(71200400001)(6916009)(54906003)(316002)(66946007)(64756008)(4326008)(8676002)(6506007)(53546011)(66476007)(508600001)(5660300002)(76116006)(33656002)(7416002)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUNnS3pZekFlcnlTcXlnM0NxSktOVTlUL3M0bXh2L3FKVGFzU2srQUJzMjhC?=
 =?utf-8?B?U3dsUU5jcnI3OHloU1haL2wzWExQUlN3dUlORVJYNHZoR2hlLzZGdnhLOVpG?=
 =?utf-8?B?dkx2cjVKUUtCODlyU3QxR2xKTHMrZXFCNFBJL21CYjgyRXZlaW5DTmp3TmhF?=
 =?utf-8?B?elduMEFqMTdFTkdGcFY3V1FER0tPRFNwUmgvUEZPREYrallJc05GTWxGWWQw?=
 =?utf-8?B?TnZCYVR0S0xTdU5CVmJjVWVRTHVjZWxvMDBnQUwzK2kxM1VKNkw4c250cExl?=
 =?utf-8?B?L0UrQTVaSmkyOEVaOGM0cTJvR25VMUZQMExnR0RYNzkzQzZyNHp1MXl6N01Z?=
 =?utf-8?B?NExkcXFPK1h4OTB0bEt6Q3NXWk4yeXpFam1EZjk4NTQycWp1RkhuMFovY3RG?=
 =?utf-8?B?MFBBV0lPaVdlNTlZOEFmUWxvZkxLSkxVeldKNU1LK1M0ayszVmtTNU5XYjFk?=
 =?utf-8?B?WGVTaHJpci9rQVpSZWFKT05DWFZ0azZuVksrbExMajJMMkVzRzZmTTM4dGJv?=
 =?utf-8?B?cGFqTE5HemVwK1NFanl5TVhhbTRURmx6eUJ4R0lreVg2TnBwemNCYW1ac1kx?=
 =?utf-8?B?OURvb0ExanBqaE8vY3lIYmZHS083OEFGZzdmcUJIdGp3azhjNUg1SWZBa1hm?=
 =?utf-8?B?NWpUS3RvbjBPQVFmTnE4dVU4QlNTeUYxRkZWVEYrbERjMWtwTGVKV3pkL0Ft?=
 =?utf-8?B?TlUrblhUOUJ0N0wrOXE0UDY5QVArL2x5YTUvT2FHTzg0Rm1tSTNEUkFOT3U1?=
 =?utf-8?B?bFFOLys0L2htQm92UzY3dzh2dXdxSEg5RHJBakZaaTNwUjFVUktsUTZGcVNN?=
 =?utf-8?B?MllCUDVmZloxTDBtc1RZR1lBOUF5R2ZUY0NoVGdRTHpyQ21jTUgvWmprTTNG?=
 =?utf-8?B?MFVqaDFjSmJ1UHpyY1dXS1lOTmordGRVKzN6Sm5kTGljOHI3SEcrWjZRMVdt?=
 =?utf-8?B?Wmo4cU81b3psRFlNWjRTMlNPWituSzRvQm10dUd1TmN0b09hTG9ZNnRYcE53?=
 =?utf-8?B?TVlkSWs4YjFURXp5YkdHZkYzdSsxU0RpM0lQRGw4OVY5cEtrT21qY3NSOFZC?=
 =?utf-8?B?OEorVTFneTRvUFg5cDYxMWo1a2I1bExvRWFqVU5YQkl4V1VJOUxTQ1FKY3Q1?=
 =?utf-8?B?Lys0bXVXcVEyWnpucklxcHRLYi8yQUF1RkFaejk3M0wySUlSQVFUL3U1ZEth?=
 =?utf-8?B?Z2hIejF0NURzNjdWSjNwaDJ1aEdnaE1aOSt4VHllVVJpaHNCWGJxaUJqTFZm?=
 =?utf-8?B?SUsxSCtPRUR4V3lZdFhwaXYvOFg3eXFpdWY5Mk1pQ0oyS2pxZGpiaHRRMnBa?=
 =?utf-8?B?SFVUdWNBT2xnSDlnN2RkcXpGUU9UWjVDakJac1RZbjJ0bk5UeVhEemdDNnlx?=
 =?utf-8?B?ZEw3UytvMEFua0ZsTTJmZy9JVDJ4TGVpZkZwdnVxSTZmRno3cThpR3kwR2gz?=
 =?utf-8?B?bU95bEs2UG5OVWUwN0kwTnlVa3BmWTB1Y0xZSytRZ1dYRnNZRWxUODRXUGNh?=
 =?utf-8?B?WlBNcC9JbmxicmVCWVNCLzdDM3RMUEl0aCt0L3RmY2ZoRCt6Zm9mU2E3NXdZ?=
 =?utf-8?B?azJQengvY0FFYzFLN0t6MWpvOWNHSUIyWFl2c0QvTk94VHF4Q2JzR2pyMkNP?=
 =?utf-8?B?MTdBaExFQXVXcVY3ZHAveXFYWTVJb2dlYzFIOEQ0RVJ4VCsrZnVvSGErcW1w?=
 =?utf-8?B?U0VuYndDRnZVaEZiaDlwaGM3c2JMU0FXMDN4a3hJQ3NmVTZ5OGlhYTNaOUE1?=
 =?utf-8?B?SWR6VzdtcXhUVkpNZDNhZzZaNEdEZHpWV0ZSS3F3MXhTUWtiY2MxTWFOckNK?=
 =?utf-8?B?b1ZBNDRmWnJRQUlDdjJPbXNvOHBmc1g5MkpXckpKVFFUYnVFbjRBL0Y3Kzk2?=
 =?utf-8?B?My8zeEdIYllUQmNhMzRIYXJrWWQvY2VsVEV1MWhzOVE1RWRHV202TWUwVWhH?=
 =?utf-8?B?UXBBaERSRkxINXc5MVJwbkZYUlE5MXBXNUJpbzlOMDRuQjJxSVVhTUluWTRL?=
 =?utf-8?B?SWRwM0JzbU9FemlQTU5tTThpZkR0ejV5RXIzajlncTFXdTFPd3JQMmsrcENk?=
 =?utf-8?B?bC8ySk1RL3pMWlZ6WUtLTTFEQS9vV1RQVG5lbUFuRExtdFFOd055QmFFMGhJ?=
 =?utf-8?B?bGhwN1NKZU9jNXo2d3lvRFhGL25kcERDUzI3amhJb0xEbGZSWkc5U3c3U0J4?=
 =?utf-8?B?VzB3TnpESko3VHNkSEZsSTFFLy96M3J0RDVaOTJMS2VHNGJETnRvNCtqS1pW?=
 =?utf-8?B?Uk03M2tSVHV1bktFbGdtYjIzL0p3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F710EAFD6A15A4E865BA59ADB868772@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd52ce7-794a-4cc1-dace-08d9e00c7d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 14:10:49.1895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI7e73PsjM80SbFmW4tUy/l0Za8sbCOkbBxKNffMhqTvR0MCzF4kM8UKXpHZhH3b+7t/Vg4/80l1AhGP7hxAGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4680
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250092
X-Proofpoint-ORIG-GUID: DdDudtV08vQ02FjCPpLH9q4qUUWgdalK
X-Proofpoint-GUID: DdDudtV08vQ02FjCPpLH9q4qUUWgdalK
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCA1OjI1IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6
NDE6NTNQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBBZGRzIHBjaV9pc29s
X2J1c19uZXcoKSBhbmQgcGNpX2lzb2xfYnVzX2ZyZWUoKSBmdW5jdGlvbnMgdG8gbWFuYWdlDQo+
PiBjcmVhdGlvbiBhbmQgZGVzdHJ1Y3Rpb24gb2YgaXNvbGF0ZWQgUENJIGJ1c2VzLiBBbHNvIGFk
ZHMgcWRldl9nZXRfYnVzDQo+PiBhbmQgcWRldl9wdXRfYnVzIGNhbGxiYWNrcyB0byBhbGxvdyB0
aGUgY2hvaWNlIG9mIHBhcmVudCBidXMuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVm
aW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
b2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4g
aW5jbHVkZS9ody9wY2kvcGNpLmggICB8ICAgNCArDQo+PiBpbmNsdWRlL2h3L3FkZXYtY29yZS5o
IHwgIDE2ICsrKysNCj4+IGh3L3BjaS9wY2kuYyAgICAgICAgICAgfCAxNjkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IHNvZnRtbXUvcWRldi1tb25pdG9yLmMg
fCAgMzkgKysrKysrKysrLQ0KPj4gNCBmaWxlcyBjaGFuZ2VkLCAyMjUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcGNpL3BjaS5o
IGIvaW5jbHVkZS9ody9wY2kvcGNpLmgNCj4+IGluZGV4IDliYjQ0NzJhYmMuLjhjMThmMTBkOWQg
MTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gKysrIGIvaW5jbHVkZS9o
dy9wY2kvcGNpLmgNCj4+IEBAIC00NTIsNiArNDUyLDEwIEBAIFBDSURldmljZSAqcGNpX25pY19p
bml0X25vZmFpbChOSUNJbmZvICpuZCwgUENJQnVzICpyb290YnVzLA0KPj4gDQo+PiBQQ0lEZXZp
Y2UgKnBjaV92Z2FfaW5pdChQQ0lCdXMgKmJ1cyk7DQo+PiANCj4+ICtQQ0lCdXMgKnBjaV9pc29s
X2J1c19uZXcoQnVzU3RhdGUgKnBhcmVudF9idXMsIGNvbnN0IGNoYXIgKm5ld19idXNfdHlwZSwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKTsNCj4+ICtib29sIHBj
aV9pc29sX2J1c19mcmVlKFBDSUJ1cyAqcGNpX2J1cywgRXJyb3IgKiplcnJwKTsNCj4+ICsNCj4+
IHN0YXRpYyBpbmxpbmUgUENJQnVzICpwY2lfZ2V0X2J1cyhjb25zdCBQQ0lEZXZpY2UgKmRldikN
Cj4+IHsNCj4+ICAgICByZXR1cm4gUENJX0JVUyhxZGV2X2dldF9wYXJlbnRfYnVzKERFVklDRShk
ZXYpKSk7DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9xZGV2LWNvcmUuaCBiL2luY2x1ZGUv
aHcvcWRldi1jb3JlLmgNCj4+IGluZGV4IDkyYzNkNjUyMDguLmVlZDI5ODMwNzIgMTAwNjQ0DQo+
PiAtLS0gYS9pbmNsdWRlL2h3L3FkZXYtY29yZS5oDQo+PiArKysgYi9pbmNsdWRlL2h3L3FkZXYt
Y29yZS5oDQo+PiBAQCAtNDE5LDYgKzQxOSwyMCBAQCB2b2lkIHFkZXZfc2ltcGxlX2RldmljZV91
bnBsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPj4gdm9pZCBxZGV2X21hY2hp
bmVfY3JlYXRpb25fZG9uZSh2b2lkKTsNCj4+IGJvb2wgcWRldl9tYWNoaW5lX21vZGlmaWVkKHZv
aWQpOw0KPj4gDQo+PiArLyoqDQo+PiArICogRmluZCBwYXJlbnQgYnVzIC0gdGhlc2UgY2FsbGJh
Y2tzIGFyZSB1c2VkIGR1cmluZyBkZXZpY2UgYWRkaXRpb24NCj4+ICsgKiBhbmQgZGVsZXRpb24u
DQo+PiArICoNCj4+ICsgKiBEdXJpbmcgYWRkaXRpb24sIGlmIG5vIHBhcmVudCBidXMgaXMgc3Bl
Y2lmaWVkIGluIHRoZSBvcHRpb25zLA0KPj4gKyAqIHRoZXNlIGNhbGxiYWNrcyBwcm92aWRlIGEg
d2F5IHRvIGZpZ3VyZSBpdCBvdXQgYmFzZWQgb24gdGhlDQo+PiArICogYnVzIHR5cGUuIElmIHRo
ZXNlIGNhbGxiYWNrcyBhcmUgbm90IGRlZmluZWQsIGRlZmF1bHRzIHRvDQo+PiArICogZmluZGlu
ZyB0aGUgcGFyZW50IGJ1cyBzdGFydGluZyBmcm9tIGRlZmF1bHQgc3lzdGVtIGJ1cw0KPj4gKyAq
Lw0KPj4gK3R5cGVkZWYgYm9vbCAoUURldkdldEJ1c0Z1bmMpKGNvbnN0IGNoYXIgKnR5cGUsIEJ1
c1N0YXRlICoqYnVzLCBFcnJvciAqKmVycnApOw0KPj4gK3R5cGVkZWYgYm9vbCAoUURldlB1dEJ1
c0Z1bmMpKEJ1c1N0YXRlICpidXMsIEVycm9yICoqZXJycCk7DQo+PiArYm9vbCBxZGV2X3NldF9i
dXNfY2JzKFFEZXZHZXRCdXNGdW5jICpnZXRfYnVzLCBRRGV2UHV0QnVzRnVuYyAqcHV0X2J1cywN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKTsNCj4gDQo+IFdoZXJlIGlz
IHRoaXMgdXNlZCwgaXQgZG9lc24ndCBzZWVtIHJlbGF0ZWQgdG8gcGNpX2lzb2xfYnVzX25ldygp
Pw0KDQpZZXMsIHRoaXMgaXMgbm8gZGlyZWN0bHkgcmVsYXRlZCB0byBwY2lfaXNvbF9idXNfbmV3
KCkgLSB3aWxsIG1vdmUgaXQgdG8gYSBzZXBhcmF0ZSBwYXRjaC4NCg0KPiANCj4+ICsNCj4+IC8q
Kg0KPj4gICogR3Bpb1BvbGFyaXR5OiBQb2xhcml0eSBvZiBhIEdQSU8gbGluZQ0KPj4gICoNCj4+
IEBAIC02OTEsNiArNzA1LDggQEAgQnVzU3RhdGUgKnFkZXZfZ2V0X3BhcmVudF9idXMoRGV2aWNl
U3RhdGUgKmRldik7DQo+PiAvKioqIEJVUyBBUEkuICoqKi8NCj4+IA0KPj4gRGV2aWNlU3RhdGUg
KnFkZXZfZmluZF9yZWN1cnNpdmUoQnVzU3RhdGUgKmJ1cywgY29uc3QgY2hhciAqaWQpOw0KPj4g
K0J1c1N0YXRlICpxYnVzX2ZpbmRfcmVjdXJzaXZlKEJ1c1N0YXRlICpidXMsIGNvbnN0IGNoYXIg
Km5hbWUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqYnVz
X3R5cGVuYW1lKTsNCj4+IA0KPj4gLyogUmV0dXJucyAwIHRvIHdhbGsgY2hpbGRyZW4sID4gMCB0
byBza2lwIHdhbGssIDwgMCB0byB0ZXJtaW5hdGUgd2Fsay4gKi8NCj4+IHR5cGVkZWYgaW50IChx
YnVzX3dhbGtlcmZuKShCdXNTdGF0ZSAqYnVzLCB2b2lkICpvcGFxdWUpOw0KPj4gZGlmZiAtLWdp
dCBhL2h3L3BjaS9wY2kuYyBiL2h3L3BjaS9wY2kuYw0KPj4gaW5kZXggZDVmMWM2YzQyMS4uNjNl
YzFlNDdiNSAxMDA2NDQNCj4+IC0tLSBhL2h3L3BjaS9wY2kuYw0KPj4gKysrIGIvaHcvcGNpL3Bj
aS5jDQo+PiBAQCAtNDkzLDYgKzQ5MywxNzUgQEAgdm9pZCBwY2lfcm9vdF9idXNfY2xlYW51cChQ
Q0lCdXMgKmJ1cykNCj4+ICAgICBxYnVzX3VucmVhbGl6ZShCVVMoYnVzKSk7DQo+PiB9DQo+PiAN
Cj4+ICtzdGF0aWMgdm9pZCBwY2lfYnVzX2ZyZWVfaXNvbF9tZW0oUENJQnVzICpwY2lfYnVzKQ0K
Pj4gK3sNCj4+ICsgICAgaWYgKHBjaV9idXMtPmFkZHJlc3Nfc3BhY2VfbWVtKSB7DQo+PiArICAg
ICAgICBtZW1vcnlfcmVnaW9uX3VucmVmKHBjaV9idXMtPmFkZHJlc3Nfc3BhY2VfbWVtKTsNCj4g
DQo+IG1lbW9yeV9yZWdpb25fdW5yZWYoKSBhbHJlYWR5IGRvZXMgYSBOVUxMIHBvaW50ZXIgY2hl
Y2sgc28gdGhlIGlmDQo+IHN0YXRlbWVudHMgaW4gdGhpcyBmdW5jdGlvbiBhcmVuJ3QgbmVlZGVk
Lg0KDQpHb3QgaXQsIHRoYW5rIHlvdSENCg0KPiANCj4+ICsgICAgICAgIHBjaV9idXMtPmFkZHJl
c3Nfc3BhY2VfbWVtID0gTlVMTDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAocGNpX2J1
cy0+aXNvbF9hc19tZW0pIHsNCj4+ICsgICAgICAgIGFkZHJlc3Nfc3BhY2VfZGVzdHJveShwY2lf
YnVzLT5pc29sX2FzX21lbSk7DQo+PiArICAgICAgICBwY2lfYnVzLT5pc29sX2FzX21lbSA9IE5V
TEw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKHBjaV9idXMtPmFkZHJlc3Nfc3BhY2Vf
aW8pIHsNCj4+ICsgICAgICAgIG1lbW9yeV9yZWdpb25fdW5yZWYocGNpX2J1cy0+YWRkcmVzc19z
cGFjZV9pbyk7DQo+PiArICAgICAgICBwY2lfYnVzLT5hZGRyZXNzX3NwYWNlX2lvID0gTlVMTDsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAocGNpX2J1cy0+aXNvbF9hc19pbykgew0KPj4g
KyAgICAgICAgYWRkcmVzc19zcGFjZV9kZXN0cm95KHBjaV9idXMtPmlzb2xfYXNfaW8pOw0KPj4g
KyAgICAgICAgcGNpX2J1cy0+aXNvbF9hc19pbyA9IE5VTEw7DQo+PiArICAgIH0NCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIHZvaWQgcGNpX2J1c19pbml0X2lzb2xfbWVtKFBDSUJ1cyAqcGNpX2J1
cywgdWludDMyX3QgdW5pcXVlX2lkKQ0KPj4gK3sNCj4+ICsgICAgZ19hdXRvZnJlZSBjaGFyICpt
ZW1fbXJfbmFtZSA9IE5VTEw7DQo+PiArICAgIGdfYXV0b2ZyZWUgY2hhciAqbWVtX2FzX25hbWUg
PSBOVUxMOw0KPj4gKyAgICBnX2F1dG9mcmVlIGNoYXIgKmlvX21yX25hbWUgPSBOVUxMOw0KPj4g
KyAgICBnX2F1dG9mcmVlIGNoYXIgKmlvX2FzX25hbWUgPSBOVUxMOw0KPj4gKw0KPj4gKyAgICBp
ZiAoIXBjaV9idXMpIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
KyAgICBtZW1fbXJfbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigibWVtLW1yLSV1IiwgdW5pcXVlX2lk
KTsNCj4+ICsgICAgbWVtX2FzX25hbWUgPSBnX3N0cmR1cF9wcmludGYoIm1lbS1hcy0ldSIsIHVu
aXF1ZV9pZCk7DQo+PiArICAgIGlvX21yX25hbWUgPSBnX3N0cmR1cF9wcmludGYoImlvLW1yLSV1
IiwgdW5pcXVlX2lkKTsNCj4+ICsgICAgaW9fYXNfbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiaW8t
YXMtJXUiLCB1bmlxdWVfaWQpOw0KPj4gKw0KPj4gKyAgICBwY2lfYnVzLT5hZGRyZXNzX3NwYWNl
X21lbSA9IGdfbWFsbG9jMChzaXplb2YoTWVtb3J5UmVnaW9uKSk7DQo+PiArICAgIHBjaV9idXMt
Pmlzb2xfYXNfbWVtID0gZ19tYWxsb2MwKHNpemVvZihBZGRyZXNzU3BhY2UpKTsNCj4+ICsgICAg
bWVtb3J5X3JlZ2lvbl9pbml0KHBjaV9idXMtPmFkZHJlc3Nfc3BhY2VfbWVtLCBOVUxMLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgbWVtX21yX25hbWUsIFVJTlQ2NF9NQVgpOw0KPj4gKyAg
ICBhZGRyZXNzX3NwYWNlX2luaXQocGNpX2J1cy0+aXNvbF9hc19tZW0sDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBwY2lfYnVzLT5hZGRyZXNzX3NwYWNlX21lbSwgbWVtX2FzX25hbWUpOw0K
Pj4gKw0KPj4gKyAgICBwY2lfYnVzLT5hZGRyZXNzX3NwYWNlX2lvID0gZ19tYWxsb2MwKHNpemVv
ZihNZW1vcnlSZWdpb24pKTsNCj4+ICsgICAgcGNpX2J1cy0+aXNvbF9hc19pbyA9IGdfbWFsbG9j
MChzaXplb2YoQWRkcmVzc1NwYWNlKSk7DQo+IA0KPiBXaGVyZSBhcmUgYWRkcmVzc19zcGFjZV9t
ZW0sIGlzb2xfYXNfbWVtLCBhZGRyZXNzX3NwYWNlX2lvLCBhbmQNCj4gaXNvbF9hc19pbyBmcmVl
ZD8gSSB0aGluayB0aGUgdW5yZWYgY2FsbHMgd29uJ3QgZnJlZSB0aGVtIGJlY2F1c2UgdGhlDQo+
IG9iamVjdHMgd2VyZSBjcmVhdGVkIHdpdGggb2JqZWN0X2luaXRpYWxpemUoKSBpbnN0ZWFkIG9m
IG9iamVjdF9uZXcoKS4NCg0KQWggT0sgZ290IGl0LCB0aGFuayB5b3UhIFdpbGwgZml4IGl0Lg0K
DQpJIHRoaW5rIHdlIGNvdWxkIHNldCB0aGUgb3duZXIgb2YgdGhlIHRoZSBtZW1vcnkgcmVnaW9u
cyB0byB0aGUgUENJIGJ1cywNCmFzIG9wcG9zZWQgdG8gTlVMTC4gV2UgY291bGQgYWxzbyBhZGQg
YW4g4oCYaW5zdGFuY2VfZmluYWxpemXigJkgZnVuY3Rpb24gdG8NClBDSSBidXMgd2hpY2ggd291
bGQgZnJlZSB0aGVtLg0KDQotLQ0KSmFn


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511150A7DB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:09:43 +0200 (CEST)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbFO-0005Fz-8Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhawN-0003UM-UE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:50:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhawK-00068G-FA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:50:03 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LHl30b025975; 
 Thu, 21 Apr 2022 17:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3plYY3UW5du2I6hmxo/4FwcGzWLFfVunICNjAfgyZzE=;
 b=ISOrn2KPS07NWQ0TcwhEXd5ibKe3kEmmMVnyXwtBqQ0dM1Y4sI+U3FYovtmsPqLy9+8g
 FHDxjjSoEQmZABeZRfPPAblmsgKZaYjWdnyp3j7x7KwuRZo7TnuYuLpeABRhlqbaaCo9
 dD7FNYYBIgdnXHqE76JW/LgBdl7Zj7sCuxUzr+fOfSUjwkaDlaTx7CX5F86U0QAdSbsa
 VI5dEo25WDUKbHGuBpDW+SmoAHAwG2zGsi00ObZ4mk8BTWjI6I01Zg+BRfPLuaaKSoMP
 2jlDmFeb55ehMqNoD9lCkpwOt92KkgyEVQbVrBDeWkP5mXxo87DUo3HzwJZwtoz4ORag Mw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffm7cvf1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 17:49:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23LHmoNc037441; Thu, 21 Apr 2022 17:49:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm89mp1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 17:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I70CaUi6DpW2JKPYUBofB3Yf1fz+E2SBIGSZtG8OGS+7MRvPHNth0eHQTgpPPQZhq4N8fkZIQT+aW1qFx5sTX6zpF20OUsltUh2UnXR58MjHKRMQ7jI4ONIwBSLXyC3a+VLnBNXEOc8zzDCgZOgt58EvCN6UEKDQYtWmMdqcrreH/jx5IEh6o+85huG8//NIXZsOjbVWzuHTyCEM9/MiTwv7WQsWbr030VKr6w82RIBZCsgedQLQpyF6ymmK4h9YK3v6GHfaiJiIQmXmtUAChd2Eg2URd4Xw05evgfVo+P9zqB31sdGH2uModvUl+KHKfPc6DOqECHXVNvk2Llf21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3plYY3UW5du2I6hmxo/4FwcGzWLFfVunICNjAfgyZzE=;
 b=MYbSr0vIu1bMk80+dPR1Ijn6FOWe7m5e33frATj2W72ESj1myCp3AXlRMBKJMCj9FKXh4M588PnJqTAylV9mf8vm6rCBFjh3X2qjtPxkDEM0JOUtWBxNfN4ySBhP/4hw5aRRV6BbKH6z7/x+DRjOalulyWVvfZ26WR4gMtadpybWCX43kxbP5wsrkGrlirI/Qi1j1oZgQwTu1uM0wW89PP30dKpwX39FfVLz1X+uEwaVZEiH7djUdwgblkNVWetKthtZiuE/TnPm8Y/xlWOImgv1L3L51BMTuP8o21SorFp5aqrwlgjMI+PSZzaDbJKp1ShObER7g5sBrda4l0OnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3plYY3UW5du2I6hmxo/4FwcGzWLFfVunICNjAfgyZzE=;
 b=Ysl46oaGFFou90jf9+6AN+KwvBIq6xVEmYc/Lcr/tHsOSn4cJlYiKAWMXcSmKUNdMrbFMkLvFSjFIhJ9xgZa+60lV/CY7wiU3AQIcrDslsBT4Ha/vyy0rkk5tDyC1zYnd2moi1Q38RAQEzkb9HqkXxipWEJXvspNT/Ow3Mzl0KE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB5919.namprd10.prod.outlook.com (2603:10b6:8:aa::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Thu, 21 Apr 2022 17:49:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 17:49:39 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 02/17] qdev: unplug blocker for devices
Thread-Topic: [PATCH v8 02/17] qdev: unplug blocker for devices
Thread-Index: AQHYVC5JrV9q9z74wUKuMqTzHen0oKz6d5I0gAAwaAA=
Date: Thu, 21 Apr 2022 17:49:39 +0000
Message-ID: <6BAFA4DE-0D88-40EC-92B6-6228460AB927@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
 <875yn2qydl.fsf@pond.sub.org>
In-Reply-To: <875yn2qydl.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee2af92c-1ec7-425d-5b2f-08da23bf4ed4
x-ms-traffictypediagnostic: DM4PR10MB5919:EE_
x-microsoft-antispam-prvs: <DM4PR10MB5919242F5F06CE3526DC584290F49@DM4PR10MB5919.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hSP22ezQHtPbg/tV41xmhxQgUtUKME+or9lE3uUHLOJNymf6qKTZmRXV6KiCblUPY/hbiIhNa/1wYRmFdf14YqtuKLxM3sH8jnZ2oc4ztUdjdqJF89giaREyeIMEL+rhFa+cs/hN3ocFZizJifj87Pp3hDwRiGbBFF6TK+17Jw2mACYKUOw9UiKp0pwA8bH9BCocGHp4UIEHgOS9N0wx6VOuGXqmkByRtNCYnxwHK/Z/Ct9iJwue0NtHtXMx/I5YVNrNwUPk0rv47qlwgBRsS6lCyD7Yv6jktwZi8eJdMj2PFlG9tzhPE7ayR+QVMKPfwgHMA0LklCL3VDbh9vPRaDa5c+5Tqb1dBSGJVY44TBTDjc5KdD3BP8pXcEFuY021VSMf5D2wN1apyj46/KlcyiEXtUaww3c3uw4nAJR8AkRd+SyFUJJGTYR/hfsp7NuqTAnk8eFd//EKLXKjRiW7VUBDSweEmNUKDpFEVjSBAdUV600EvLq8MMuR0uf7qCYYxKxeQlXwouM4cIov000EwdiWXjVLdqLCHYdkIY/T0LxaQWWdKRxFRXHo7nr7nmtSIcLtvmbeeSCtyQBZlz1d44+kxyZ7ZLtNByXMKeN1xug9kGeXNPtlLU0C+VUw/Mm3Uodm0pjUD9WTDDEDiqPcBYMpXyKuuNiCYqdCJA9Tp8zjLCcWgJd58HPFCHvm8kU5rzRB1+Qo0Iw7QAuO1yt33kxTguPEEW7758i6jcGkfOb3D9myK9SeuSAgkRQgQMtT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(36756003)(44832011)(6916009)(2906002)(7416002)(86362001)(83380400001)(38100700002)(316002)(38070700005)(71200400001)(6506007)(33656002)(8936002)(122000001)(26005)(5660300002)(6512007)(6486002)(66946007)(8676002)(66476007)(66556008)(66446008)(107886003)(64756008)(2616005)(53546011)(186003)(76116006)(508600001)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnpHVGFZMmNjU2NGQ2JBQ0FIZ09HQURNY2dYNnpORTc5MThuRTVQQ1Z4OEhj?=
 =?utf-8?B?ZEQ0Q2ZIZ2hnSFVFSnM0cWphcUZGVVF2eVdVTUtNZEREK00rUmlsckExNWtj?=
 =?utf-8?B?OXFvN1lQRXBUR3FPajBvR1lDaTNjVVdRSCt6WTRHd1o2OFNpMFJPcTJPRDNI?=
 =?utf-8?B?VTQ1OHlza25zRkdTdkdKZUFGdE91V1ZabnplaTVCeXlSRkVZVENEUFpIRjl0?=
 =?utf-8?B?bks2RXcvcDF0Vk94ci8zVWppeUw1aEh5VzJ3VmZGK3NkU2NxR1dxcFdFd1VM?=
 =?utf-8?B?ZHpmRmpVSjAvNUxtcjB4WThaczZDM3F0UkM3Y0N0ZEk0em9XUGYzL3BGYk15?=
 =?utf-8?B?NkNHQkJhQXd4b1dvaFl0T3k0a2xNSkUvMC8xRmhRcEgvZlR6UUp3Q25PakZW?=
 =?utf-8?B?dVl5Rm1VUVdMVkt1UlNiVHhLMHNFVjZxLzM0VHducjRFL3FDajl4Zno0ZVY2?=
 =?utf-8?B?U2YvbzBVcmcyNDNBMmF2TUF2cUlNMVdmcjhibU1mK2pmbkt6b0pRK3ZYcUFJ?=
 =?utf-8?B?NG5RNTJNNlF2cmJNRUdOT2dKYWllYUczZFREb1ZyQ29UQ1hYSWYvV1NiamFj?=
 =?utf-8?B?M0JqT2pYTHRuTktQTmpQdzF2c2tIZFVwU2YrYktFa2hwTlJoYUtKenlodEYr?=
 =?utf-8?B?SVplN0ZjM2dJM0tjZEYzcW9pdEg4UmxPOCs0TGIxRHVOc1FrMHo2NzMxaUJp?=
 =?utf-8?B?NVY0dUVIREMvdjJZVXdFZUVBVGl5UkZXQ2VmcEFxS0QzeGpOT1grRXdGaEFo?=
 =?utf-8?B?cE9ad1VtSGhKOGlZZ2VvbC9MQzJjSE9QWkZYdGpOYUYwMlZTTFJyTXA3bG1X?=
 =?utf-8?B?MDlVSmd6dU83bVU4SDlIL3VUWjdUb2xtZDRhMzRmcWtobm9pRUNaQ3FkcUU0?=
 =?utf-8?B?a0VPZm9Pdzd3TnB6RG1PSlJ0VitHS1ZSdkhuOGFMUDY2MThZbHpXK0k2bEFL?=
 =?utf-8?B?eWJmM2xQRGFjMjlzc0k3cUJPSVh0K0pLWURwQ1JJcS9GQjZUdkJDVnNtanpu?=
 =?utf-8?B?QVJBUHhBWWVQM21xZ2hYbkpHTitiSVA1MnZWTE5aVGVLZENPaVpMcDhXTG9J?=
 =?utf-8?B?VmdVMjhtaWZEaXhYZnd2NzZNNW5zTXVMdG9QRFYzT3pCNms4ZWRnTlk0eHlH?=
 =?utf-8?B?RlJqTXppem81cWNVaE1NV2JjL0x0K254VUlic1VQTG9WeDNJSWRac2tWdkhH?=
 =?utf-8?B?Tno5NjFWVU1wRHkvTDVlTjdWTE5QNDJJcVRRY0ZNaVVkOVRNMGwzK3VicXYv?=
 =?utf-8?B?YUF1ZDd2ZHEvNFdMa2dsNEhUWDJIVVBkT1Fsa0Z2UHVXSmR3dUV1RCtJUmJ4?=
 =?utf-8?B?Qno3SWdweDl3dXBhaXp2Y0RwV0hjVjRJNXBaSTNBTmZVMVVNTi9vaGZHTUdr?=
 =?utf-8?B?dkhYMEJOS2JIZDVDL0F0SysxQlB3MkxQdkpBUVdnS0NSVmtOZjkxTGo2aXJh?=
 =?utf-8?B?WlhZc0JUWk90ZDNKVmhIVDZLWHNFbWZyb1ovQlN0SFZyQ0gvR214S1N1eVlQ?=
 =?utf-8?B?djdrUkZpMjJ1K1VIYmlNK0Z3R1lRNFBXallWMEk2aEIvWlpsalhZdEJERDh2?=
 =?utf-8?B?ZWJZMFR3VW9mZUkvSEpGaHZBZldMZXo1NDQrQ1lGNG5QazEyYzNSbXNpTjQ1?=
 =?utf-8?B?eUx2TU0xYnpWVjdoUmgwZ1hMWmNzYWxNRjdGc09MYWhYMDlnL0JWZDJyOXJJ?=
 =?utf-8?B?ZlJlTEYyV3RiSS9YV1MyS0xWRHF5bi91dGhNdUJvMkh0N2VsQzJhNWJlOGM5?=
 =?utf-8?B?K3ZwMjZFZWZqV3RBU010ME1NQU5kazFvcGpieUVIK0Z3cSs0SGNmWnhGNGZh?=
 =?utf-8?B?M28yVTl2UVAwUE4xZHZOTjhCTnVKdldJOXpXdGMwWis0bjhHVDRmNlprT1NP?=
 =?utf-8?B?elVjeGdoODhkZlE1S05OL3RwNGNPa2lZL1BoM1dMMTFiNHJXMERnTWxUUlow?=
 =?utf-8?B?c01xVXJCTERhWmdXRkpkUUxLY3ZneHRmNFBJYm16QTV6d0x0cjFoL1oxZHA3?=
 =?utf-8?B?aHRhWlA5ckpqTWtxeDdWMHFCanJxWjJvM3BEUWp0QTQ4QUhsRklmTXVCOXZE?=
 =?utf-8?B?N3YvbTJqRTJmcHBNTERoRlZUUTJWREI2azl5MmVIWVlvNlR3dWt3SGdQMXRR?=
 =?utf-8?B?VmxmQ1hOR2dYRTU4ZmtFODRVWkovZjFpS2grVmUxNE9PWWQ1dGUzcytXMDhJ?=
 =?utf-8?B?aGZadFFOR1dVSU52dFdTWi9EcmZMWGRqdFR1TGFKSHYzL3Y3VmpSZmpTSjVZ?=
 =?utf-8?B?VG9sL1JiMzQwRHlLSVdwbkhrck1yaE1JSnd3aVprbWVybEpyczAwZGRQb2lj?=
 =?utf-8?B?K2ZLc21aYWtDUEtJeFN3Mk9SMDdxREtiSFNJenkyZ0N6R0paV2hxOU1Ia1oz?=
 =?utf-8?Q?NwBijQrEOLAb/p3Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C59B69DE0245D4390B22FA4C2CB9D32@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2af92c-1ec7-425d-5b2f-08da23bf4ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:49:39.4455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJik/+uvUsfJgoKGMSwu/HycozplcARDwDMiDOkGdETRDK9woChUPx0e4r8X+5JvQPGqsMUO/lGYXX2gw+ghvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5919
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-21_03:2022-04-21,
 2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210094
X-Proofpoint-GUID: SkNQxQCDlqXhJcwXI2Bhe6PUMWb807h7
X-Proofpoint-ORIG-GUID: SkNQxQCDlqXhJcwXI2Bhe6PUMWb807h7
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDIxLCAyMDIyLCBhdCAxMDo1NSBBTSwgTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFt
YW5Ab3JhY2xlLmNvbT4gd3JpdGVzOg0KPiANCj4+IEFkZCBibG9ja2VyIHRvIHByZXZlbnQgaG90
LXVucGx1ZyBvZiBkZXZpY2VzDQo+IA0KPiBXaHkgZG8geW91IG5lZWQgdGhpcz8gIEknbSBub3Qg
ZG91YnRpbmcgeW91IGRvLCBJIGp1c3Qgd2FudCB0byByZWFkIHlvdXINCj4gcmVhc29ucyBoZXJl
IDopDQoNCkhpIE1hcmt1cywgOikNCg0KVGhlIHgtdmZpby11c2VyLXNlcnZlciBkZXBlbmRzIG9u
IGFuIGF0dGFjaGVkIFBDSURldmljZS4gQXMgbG9uZyBhcyB4LXZmaW8tdXNlci1zZXJ2ZXINCmlz
IHVzZWQsIHdlIGRvbuKAmXQgd2FudCB0aGUgUENJRGV2aWNlIHRvIGJlIHVucGx1Z2dlZC4gVGhp
cyBibG9ja2VyIHByZXZlbnRzIGFuIHVzZXINCmZyb20gcmVtb3ZpbmcgUENJRGV2aWNlIHdoaWxl
IHRoZSB2ZmlvLXVzZXIgc2VydmVyIGlzIGluIHVzZS4NCg0KPiANCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4+IFNp
Z25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29t
Pg0KDQpJIHJlY2FsbCByZWNlaXZpbmcgYSDigJxSZXZpZXdlZC1ieeKAnSBmcm9tIFN0ZWZhbiBw
cmV2aW91c2x5Lg0KDQpJ4oCZbSB2ZXJ5IHNvcnJ5IEkgZGlkbuKAmXQgYWRkIHRoYXQgaGVyZS4g
SeKAmWxsIGdvIG92ZXIgYWxsIHRoZSBwYXRjaGVzIG9uY2UgYWdhaW4gdG8gY29uZmlybSB0aGF0
DQp0aGUg4oCcUmV2aWV3ZWQtYnnigJ0gc3RhdHVzIHJlZmxlY3RzIGFjY3VyYXRlbHkuDQoNCj4+
IC0tLQ0KPj4gaW5jbHVkZS9ody9xZGV2LWNvcmUuaCB8IDI5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiBody9jb3JlL3FkZXYuYyAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiBzb2Z0bW11L3FkZXYtbW9uaXRvci5jIHwgIDQgKysrKw0KPj4gMyBmaWxl
cyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2h3L3FkZXYtY29yZS5oIGIvaW5jbHVkZS9ody9xZGV2LWNvcmUuaA0KPj4gaW5kZXggOTJjM2Q2
NTIwOC4uMWI5ZmEyNWU1YyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvcWRldi1jb3JlLmgN
Cj4+ICsrKyBiL2luY2x1ZGUvaHcvcWRldi1jb3JlLmgNCj4+IEBAIC0xOTMsNiArMTkzLDcgQEAg
c3RydWN0IERldmljZVN0YXRlIHsNCj4+ICAgICBpbnQgaW5zdGFuY2VfaWRfYWxpYXM7DQo+PiAg
ICAgaW50IGFsaWFzX3JlcXVpcmVkX2Zvcl92ZXJzaW9uOw0KPj4gICAgIFJlc2V0dGFibGVTdGF0
ZSByZXNldDsNCj4+ICsgICAgR1NMaXN0ICp1bnBsdWdfYmxvY2tlcnM7DQo+PiB9Ow0KPj4gDQo+
PiBzdHJ1Y3QgRGV2aWNlTGlzdGVuZXIgew0KPj4gQEAgLTQxOSw2ICs0MjAsMzQgQEAgdm9pZCBx
ZGV2X3NpbXBsZV9kZXZpY2VfdW5wbHVnX2NiKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwN
Cj4+IHZvaWQgcWRldl9tYWNoaW5lX2NyZWF0aW9uX2RvbmUodm9pZCk7DQo+PiBib29sIHFkZXZf
bWFjaGluZV9tb2RpZmllZCh2b2lkKTsNCj4+IA0KPj4gKy8qDQo+PiArICogcWRldl9hZGRfdW5w
bHVnX2Jsb2NrZXI6IEFkZHMgYW4gdW5wbHVnIGJsb2NrZXIgdG8gYSBkZXZpY2UNCj4+ICsgKg0K
Pj4gKyAqIEBkZXY6IERldmljZSB0byBiZSBibG9ja2VkIGZyb20gdW5wbHVnDQo+PiArICogQHJl
YXNvbjogUmVhc29uIGZvciBibG9ja2luZw0KPj4gKyAqLw0KPj4gK3ZvaWQgcWRldl9hZGRfdW5w
bHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJlYXNvbik7DQo+PiArDQo+PiAr
LyoNCj4+ICsgKiBxZGV2X2RlbF91bnBsdWdfYmxvY2tlcjogUmVtb3ZlcyBhbiB1bnBsdWcgYmxv
Y2tlciBmcm9tIGEgZGV2aWNlDQo+PiArICoNCj4+ICsgKiBAZGV2OiBEZXZpY2UgdG8gYmUgdW5i
bG9ja2VkDQo+PiArICogQHJlYXNvbjogUG9pbnRlciB0byB0aGUgRXJyb3IgdXNlZCB3aXRoIHFk
ZXZfYWRkX3VucGx1Z19ibG9ja2VyLg0KPj4gKyAqICAgICAgICAgIFVzZWQgYXMgYSBoYW5kbGUg
dG8gbG9va3VwIHRoZSBibG9ja2VyIGZvciBkZWxldGlvbi4NCj4+ICsgKi8NCj4+ICt2b2lkIHFk
ZXZfZGVsX3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRlICpkZXYsIEVycm9yICpyZWFzb24pOw0K
Pj4gKw0KPj4gKy8qDQo+PiArICogcWRldl91bnBsdWdfYmxvY2tlZDogQ29uZmlybXMgaWYgYSBk
ZXZpY2UgaXMgYmxvY2tlZCBmcm9tIHVucGx1Zw0KPj4gKyAqDQo+PiArICogQGRldjogRGV2aWNl
IHRvIGJlIHRlc3RlZA0KPj4gKyAqIEByZWFzb246IFJldHVybnMgb25lIG9mIHRoZSByZWFzb25z
IHdoeSB0aGUgZGV2aWNlIGlzIGJsb2NrZWQsDQo+PiArICogICAgICAgICAgaWYgYW55DQo+PiAr
ICoNCj4+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIGRldmljZSBpcyBibG9ja2VkIGZyb20gdW5wbHVn
LCBmYWxzZSBvdGhlcndpc2UNCj4+ICsgKi8NCj4+ICtib29sIHFkZXZfdW5wbHVnX2Jsb2NrZWQo
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKTsNCj4+ICsNCj4+IC8qKg0KPj4gICogR3Bp
b1BvbGFyaXR5OiBQb2xhcml0eSBvZiBhIEdQSU8gbGluZQ0KPj4gICoNCj4+IGRpZmYgLS1naXQg
YS9ody9jb3JlL3FkZXYuYyBiL2h3L2NvcmUvcWRldi5jDQo+PiBpbmRleCA4NGYzMDE5NDQwLi4w
ODA2ZDhmY2FhIDEwMDY0NA0KPj4gLS0tIGEvaHcvY29yZS9xZGV2LmMNCj4+ICsrKyBiL2h3L2Nv
cmUvcWRldi5jDQo+PiBAQCAtNDY4LDYgKzQ2OCwyOCBAQCBjaGFyICpxZGV2X2dldF9kZXZfcGF0
aChEZXZpY2VTdGF0ZSAqZGV2KQ0KPj4gICAgIHJldHVybiBOVUxMOw0KPj4gfQ0KPj4gDQo+PiAr
dm9pZCBxZGV2X2FkZF91bnBsdWdfYmxvY2tlcihEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqcmVh
c29uKQ0KPj4gK3sNCj4+ICsgICAgZGV2LT51bnBsdWdfYmxvY2tlcnMgPSBnX3NsaXN0X3ByZXBl
bmQoZGV2LT51bnBsdWdfYmxvY2tlcnMsIHJlYXNvbik7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQg
cWRldl9kZWxfdW5wbHVnX2Jsb2NrZXIoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKnJlYXNvbikN
Cj4+ICt7DQo+PiArICAgIGRldi0+dW5wbHVnX2Jsb2NrZXJzID0gZ19zbGlzdF9yZW1vdmUoZGV2
LT51bnBsdWdfYmxvY2tlcnMsIHJlYXNvbik7DQo+PiArfQ0KPj4gKw0KPj4gK2Jvb2wgcWRldl91
bnBsdWdfYmxvY2tlZChEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiArew0KPj4g
KyAgICBFUlJQX0dVQVJEKCk7DQo+PiArDQo+PiArICAgIGlmIChkZXYtPnVucGx1Z19ibG9ja2Vy
cykgew0KPj4gKyAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGVycm9yX2NvcHkoZGV2LT51
bnBsdWdfYmxvY2tlcnMtPmRhdGEpKTsNCj4+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIHJldHVybiBmYWxzZTsNCj4+ICt9DQo+IA0KPiBUaGlzIGNpdGVz
IHRoZSBtb3N0IHJlY2VudGx5IGFkZGVkIGJsb2NrZXIgYXMgcmVhc29uLiAgWW91ciBmdW5jdGlv
bg0KPiBjb21tZW50IGNvdmVycyBpdDogIlJldHVybnMgb25lIG9mIHRoZSByZWFzb25zIi4gIE9r
YXkuDQoNCkkgY291bGQgY2hhbmdlIHRoZSBjb21tZW50IHRvIHNheSB0aGF0IGl0IHJldHVybnMg
dGhlIHJlY2VudGx5IGFkZGVkIHJlYXNvbi4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0K
Pj4gKw0KPj4gc3RhdGljIGJvb2wgZGV2aWNlX2dldF9yZWFsaXplZChPYmplY3QgKm9iaiwgRXJy
b3IgKiplcnJwKQ0KPj4gew0KPj4gICAgIERldmljZVN0YXRlICpkZXYgPSBERVZJQ0Uob2JqKTsN
Cj4+IEBAIC03MDQsNiArNzI2LDggQEAgc3RhdGljIHZvaWQgZGV2aWNlX2ZpbmFsaXplKE9iamVj
dCAqb2JqKQ0KPj4gDQo+PiAgICAgRGV2aWNlU3RhdGUgKmRldiA9IERFVklDRShvYmopOw0KPj4g
DQo+PiArICAgIGdfYXNzZXJ0KCFkZXYtPnVucGx1Z19ibG9ja2Vycyk7DQo+PiArDQo+PiAgICAg
UUxJU1RfRk9SRUFDSF9TQUZFKG5nbCwgJmRldi0+Z3Bpb3MsIG5vZGUsIG5leHQpIHsNCj4+ICAg
ICAgICAgUUxJU1RfUkVNT1ZFKG5nbCwgbm9kZSk7DQo+PiAgICAgICAgIHFlbXVfZnJlZV9pcnFz
KG5nbC0+aW4sIG5nbC0+bnVtX2luKTsNCj4+IGRpZmYgLS1naXQgYS9zb2Z0bW11L3FkZXYtbW9u
aXRvci5jIGIvc29mdG1tdS9xZGV2LW1vbml0b3IuYw0KPj4gaW5kZXggMTJmZTYwYzQ2Ny4uOWNm
ZDU5ZDE3YyAxMDA2NDQNCj4+IC0tLSBhL3NvZnRtbXUvcWRldi1tb25pdG9yLmMNCj4+ICsrKyBi
L3NvZnRtbXUvcWRldi1tb25pdG9yLmMNCj4+IEBAIC04OTgsNiArODk4LDEwIEBAIHZvaWQgcWRl
dl91bnBsdWcoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIEhvdHBsdWdI
YW5kbGVyQ2xhc3MgKmhkYzsNCj4+ICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4+IA0K
Pj4gKyAgICBpZiAocWRldl91bnBsdWdfYmxvY2tlZChkZXYsIGVycnApKSB7DQo+PiArICAgICAg
ICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICBpZiAoZGV2LT5wYXJlbnRfYnVzICYm
ICFxYnVzX2lzX2hvdHBsdWdnYWJsZShkZXYtPnBhcmVudF9idXMpKSB7DQo+PiAgICAgICAgIGVy
cm9yX3NldGcoZXJycCwgUUVSUl9CVVNfTk9fSE9UUExVRywgZGV2LT5wYXJlbnRfYnVzLT5uYW1l
KTsNCj4+ICAgICAgICAgcmV0dXJuOw0KPiANCg0K


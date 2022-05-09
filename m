Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8B51FB5E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:34:39 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1ew-000674-4U
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1216f8a52=roger.pau@citrix.com>)
 id 1no1V2-0006V3-Cy
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:24:24 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:1741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1216f8a52=roger.pau@citrix.com>)
 id 1no1Uz-0003lK-P6
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1652095461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a1Y3cAQS2t6zZFi8Z0xsPVz00QSCNCZX6hQtaxPLchs=;
 b=NcqWCvcrH3YdqpIWdwlxnpGyg7uT6Rw9PVfaEHT3WQxJRXKmLn5HT6R4
 eni6ve+cwf8AFZ4t+kYCY6DY4fVntzDuhDOyKf7Dv455E7+V9EXlzS0uh
 +QIIcd9kKRrapjfox2062u7piSgeJWBVSuxpDkMzW4/TAlxDtvjPDId/x 4=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 73361340
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CQom3asC+0hDRaIkDdf2Z2hywOfnVFxfMUV32f8akzHdYApBsoF/q
 tZmKTuCO/7YZGD3eIhza9nj8kgH68XWndVmSFZp+C08Qn9H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17V6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8yJ6rWxsgAViVGUAV+NOpGv7DcJnag5Jn7I03uKxMAwt1IJWRvZMgz3b8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IGmm5v2KiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3O/vRuuDSLpOB3+Oi8d96FJdiJfPdIrEuSn
 FPi1T3lXChPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jYEUsdUO/037keK0KW8yx+UA3VBQjNfZdgOssgwSjo3k
 FiTkLvU6SdHtbSUTTeW8e6SpDbrYCwNdzZdO2kDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhEGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:CEDAp6PZmBFKZMBcT13155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv4EvoxKhNNKWs2N
 60Q5iAtIs+OvP+PpgNc9vof6OMexzwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; d="scan'208";a="73361340"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 07:23:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDhtDFtvtCntXY50n+O6h0RqxcYerV8+MP2fn/i9reVVCjN9A4YkVr0TOQ/x8f0+L7ABvz5CcgDx/KTNm13p1J/upjnrcKYG2z4DEcrJgWCGK3W74MHGAW35HLktF39gkYjB+rDVQ0zajepqvlVHUhffi4CnY+kMIXpalopX/sR7QeGHI0ODNukVghnj/ZIctThaUtoW6gDQiN4mDdO+djpkPLRkn7l2kc3N2uZ6/j+x6dvAHTLSUiofQ2LNaOm3CxVUKPawMQ7xDTfB2Hsfz5cigD4zVIwwWoSFtFrJWqa88o28t96FW8/JKBwZxPZSYzQKAgOI5l6wGSQ4ZHdDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VffK7Rx0PzdI8/ZOYnCDg0VcwYzuxbAC5a3rXo9jS8E=;
 b=gWqszc9NQ7Yrj/8FH6R+ToefXaCEtAp/Dm6DiO3t1jb+mdfqXOiqyAPbhNeO1QkrpMsuOeLOMsYxOdsIsc+53p894UIVDuDHjQIye+tmA/yuhGeoKDWSOgVYfd3EkF5FMJREOCC5XkM841P5PYhfH4jZcxkPqYGAp4WSIES+RP5DhZIOmPcfkeZ4Dd789FBKn2refpNqizBeMsagJKvmnZD9IhzvRxSDmaqXMA/Z54tX/ffb8BWkc1ijUlbTf4lB/NDqxZFrTJbsqDi0qYGosaayy4XYT/Y/651eJc2NgjTo6Qd868xugZpNRxAsKn2WXTobzLN65DNBi48YPAWZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VffK7Rx0PzdI8/ZOYnCDg0VcwYzuxbAC5a3rXo9jS8E=;
 b=Ng0prWXpAcWdkOBhzVWIMyzGTMS+dV0OAsSj8oy51hCNMc+CACmD+a1bMwrIt4kFah65qj2sSevOx9ugwgM5LwTAed087OR5LKv5YVl88w34Nfmmmpdapvgdw3aCLXltE6twYEOwqufhI/YN4XOOE3X40gz0pG3bv3jES7LEWoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB2423.namprd03.prod.outlook.com (2603:10b6:903:37::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 11:23:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:23:48 +0000
Date: Mon, 9 May 2022 13:23:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Message-ID: <Ynj5wPrz4hEWJOA9@Air-de-Roger>
References: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
 <Ynje14BbzorbkvkD@Air-de-Roger>
 <PH0PR03MB63820BC5F37E040F37554E32F0C69@PH0PR03MB6382.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH0PR03MB63820BC5F37E040F37554E32F0C69@PH0PR03MB6382.namprd03.prod.outlook.com>
X-ClientProxiedBy: LO2P265CA0428.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8328b8b-73e2-45dc-619e-08da31ae6317
X-MS-TrafficTypeDiagnostic: CY4PR03MB2423:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB2423A8263BC17F0C44DFC7BD8FC69@CY4PR03MB2423.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TOxkwH3BFNDiGi7ZxhTZvDAfB/U5Q3Qdq+W21Qpklgtr8EVLF02unjkLmyrXScz9Ngzjnf3iNtr4ceG2VsKmu09RzmOm4LFMh+s5x3kc2t29WxeEtnv+JWp6/vdOW7I2cGOCsGIICB5MQ3bJh4ZWuSCcoz+ssQ4Jaz4x8sjkBMfHX8naQfhrlIT0oNcNBPJvux+FYJ1FtRb/6H2smHv79op9WRdMj8QKsWSVyI4jkC0F/jWRLBLVne3Yehyd+wR6Itz6LO6RRHh9Ri9uN1VypFz5aXPRLlSonDsfgnkaKCYi4iJEMhvNa9wozTrpYG1+FSMis/zdw66Opr6DSMnNhUguxjEL1XpnPtXcj43aVJFpQzZ4Slay26rR86vKb5VcjIbeqWmmmMyQCaAjenI9ME0ta6Xeu2a+GSIw8OpCGFQrg0dAcwJUiT7vhdLL7qlSrnpVdnV4NqTv+TVffeLgVJhM5Fq7/uBrcV1RbV8A1BxeHw6/BqApXU+3jKivjyNrXtOVqqKFxajSviLxQiB4yFS6gTtfXII5eotEqUNlqdKCf80gcEqJFL80GYRcQncnoeXhKRqeaG/G+PG2yOfGM6w6w+Xfcznc/aYfg1qDnziby6Zh96C2U//DQU6pe8tMrc44/fgw/q3Vaq4rH3K1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5608.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(6636002)(85182001)(83380400001)(82960400001)(33716001)(53546011)(8676002)(6862004)(4326008)(66476007)(66946007)(66556008)(54906003)(38100700002)(8936002)(6512007)(9686003)(6486002)(316002)(26005)(508600001)(2906002)(5660300002)(6506007)(186003)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGJ2Z0ZwQVJhMnl0UEcyNlIzTWdZOW1ueExkYlhkWXdReDM1OW1xRk5tMHho?=
 =?utf-8?B?bmVURWFsWG5VKzI0NERuZGJMdE5HRFBqc0NmdHY3NktuMUQ3YmhXVVA5WUJp?=
 =?utf-8?B?aWkvN1pSU2tROVlNd253aFdsRVdiRFJCcTc1L0hqcmZSeTltbE1DelJjYTUz?=
 =?utf-8?B?ZUkrb09XSTZKY0FJYll0WkN3VUtxNmtQS0VlRE5RWFF2UTJ0M2FZSEtqaHFr?=
 =?utf-8?B?eTVPOW9rOEJ3azQwUWhmc3NKOE1tSG1RVzdvNkF6YmdkR1hrWElzVm5xbDdY?=
 =?utf-8?B?eTZGMkdaZzhRbHB6V0dBOUdIZW03cTBNeVFxd1MzSThSaHIyekJYS3lNV2Vr?=
 =?utf-8?B?QUttRTBGZkR2ZGlHRkVzelRsSVZ3YWNVbGFlZXI2d2gwTkQyckNPeFFJTjVE?=
 =?utf-8?B?YW80Q0dYTEI3cDJDazEyZUxYd01JZDNxNWVjOFFmL0greWxqV1hQSm9KSmw5?=
 =?utf-8?B?dHVkdHlkOEpSWnpGSTJVLzFqOW5CR2FXc3hkOFNrcGh2YmR5L1BDaGZKeGhp?=
 =?utf-8?B?UjRGaTJkNmcwb2tZcmU1QlRIY2tFUVE5UjFxWFRxU01pWGpvYS9lY2QwaThP?=
 =?utf-8?B?Rzc2a3R3NFdrSWsyVnB2YjVwSmNpTDZPYmlPQUtRMmcvQm1Jc25aK3QxN3BQ?=
 =?utf-8?B?RFd1aG9CbE9oVEtqNzlKdVpmbUh5L0EzbERvd1VLU0NramZSUldDd2wxVFNV?=
 =?utf-8?B?bCtIMm5UTzRDNmMxbnJDNmdYdWtFbHUweVBlbXYzNVNya2t2MlpzR0pIMzBo?=
 =?utf-8?B?TTZ2Q0VXM29uK0hVcENhVW9kZUY5bnNZWW10eDZjSVlaWGNmcUZQVXpRYnds?=
 =?utf-8?B?dVhUbWI1YlcrdEVtWkNYNTJDYTRKWUJCVjBrNis0dG9YaFA5MzMrbHdQZldJ?=
 =?utf-8?B?WTNtYTllTWdmWlNMdVdELzBIUWlpNmw4R29wQXRKcjNrVSt4bXRWeU1Sb3Bl?=
 =?utf-8?B?YmtnYW9xNm1tOVM3L29MT2JSY0JlTUE5UjFRRmZDWlB2bGVjQ09hbXMrYklt?=
 =?utf-8?B?dHUrcVFNamVDOW0xdmpFK0E5NThQSnRRcnZFKzBGaUZUV0pxVDFQVnN4eGIy?=
 =?utf-8?B?d055ZWJmWEcwR0NQdlpqckdmV0xOMVRUUGpuS3M0VVhSQWVSRjhzUlY0R1c5?=
 =?utf-8?B?MFhqOTJHVTNmTjc5VkZFWmVCWW5mcHMrMUNoZlM1ZEgvY0ZWVk1HdnF2YTVy?=
 =?utf-8?B?ejRxalQyYkg5QVBZa0M2aWRubE12UlpmcDVhdTBjc2tUaUNhMDJkY0phOURr?=
 =?utf-8?B?TS9mcUZ3MmwzNW03WlpicGF6MVV1ZXBNTStRY0wvMitYa3Z5QkR0eVplMWYv?=
 =?utf-8?B?aFdJTDZDWVVOemNFNjU3SUpBTDRueTlxM3dFK09WRmpodG1lUDlsRFpNelNY?=
 =?utf-8?B?aXN0dXJXZFpjdEk2SnpQQUhERUJxSy9zcjZmQml4U2R6TUFGaERBZlBocmpD?=
 =?utf-8?B?NjQwKzdTSUZhSG1BdjhPQlB5TmlLOGIyNDk1aVFTRElTSXYrbjJydGlXRjBE?=
 =?utf-8?B?bDRlajJKajhFK05yRytGUWt4RlRZanhUY25yWXRtdmI5M2JOakpWRzBGaFBZ?=
 =?utf-8?B?VkNDbUVnSXBzTCt1QXlvTU1yaHpabGZjT2E1U3VUTlMyQU0zQk1pTFE4bTlm?=
 =?utf-8?B?TWQ5WE90WGZUcEZSdWxQaHJHSExXY05SYzN2TXlHZUdYbjhoWlV4c1RUOVkv?=
 =?utf-8?B?MXlaVUtidGY1NVhxQkpWZFZDb3hocUpyQldhRFEzU3QrWXpJOWJVaEloQUFV?=
 =?utf-8?B?OGpaald5Z25ZWjVVSFo4dForM28wMmhKcjhtVG1xdkxFTVRXZjJRdE84U2NL?=
 =?utf-8?B?WFZvRVRmUk5VOHRTWUxWTkV4ZzZ6WW1vQytua1djTU5tMU9vTGh0VHZHNEFR?=
 =?utf-8?B?NGtqM3FzRS9KQUdQQVgrVzBnTFg0TmR3bWFPaUN5NFdldG5WUnl1eForRXhE?=
 =?utf-8?B?em5WUWRzTGRqZ3hhaUd3M2FJaitlbVFHQXNaNW1HUVRXMXhjKzl1ejZ5a0Jv?=
 =?utf-8?B?WjNSOElPWjlxWVNrL0c1Wjd5RE1penNHZ3EyKzAwRVB6L1RQSGRRNG5KWmh0?=
 =?utf-8?B?ekF0OWdWRWI1cnY4ZEpNOEhxdDBzTWhOMDdWYUxHWDNIZDFJZ1djV1UzOWda?=
 =?utf-8?B?WmFML2RhNCsvM2ZXL2tFMy84eWpHdHhOQ2tYRm1xTUhDY1RLOVpCZjBnNllR?=
 =?utf-8?B?Rk9aUXltN1NTblYvUXlvZWNER20xUDdqV3NlWG5YNVVlcnRCS1hUR2x3bU5t?=
 =?utf-8?B?Y0pYUVBNRFV3T2J1elBBT1dEOEUyNnlnYjFFcnhVS3dMYjV4ZjJKbG9RNjBM?=
 =?utf-8?B?dHdrbUpjaDlHT0k1cjViSG5PNmxPYUpGN080QjJCc1VMTGpsYUxUZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8328b8b-73e2-45dc-619e-08da31ae6317
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 11:23:48.4924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRVydQ39htpoGiyWgi7E5aFew7BzGlqjJKR28qToYZQPGUSAcuk6OYHszrj7w4D52rfz6CfcuRnumi614tnLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2423
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=1216f8a52=roger.pau@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Mon, May 09, 2022 at 10:39:32AM +0000, Ross Lagerwall wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Monday, May 9, 2022 10:28 AM
> > To: Ross Lagerwall <ross.lagerwall@citrix.com>
> > Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> > Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones 
> >  
> > On Wed, Apr 27, 2022 at 05:38:12PM +0100, Ross Lagerwall via wrote:
> > > The BAR emulated register definition does not set emu_mask because it
> > > varies depending on bar_flag.  If emu_mask is not set, then the BAR is
> > > initialized based on the host value which causes the BAR to be initially
> > > mapped at whatever value the host device was using. Although it does
> > > eventually get mapped at the correct location, it causes unnecessary
> > > mapping/unmappings.
> > 
> > Would it be possible to just unset the memory decoding bit in the
> > command register if it's set?
> 
> I don't think that would be sufficient since AFAICT qemu does not read that
> bit so will still call into Xen to update memory mappings, etc.

Hm, but this seems wrong?  QEMU should not set memory mappings if the
memory decoding bit is unset.  While the bit will be set for the
underlying physical device, it shouldn't be set in the emulated
command register provided to the guest, and hence no mappings should
be established until that bit is set by the guest.

In the description you mention not using the host BAR positions, which
is fine, but you also need to prevent mappings from being created
until the guest has positioned the BARs and enabled the memory
decoding bit, or else you end up positioning the BARs wrongly has QEMU
has no knowledge of where should BARs reside.

Thanks, Roger.


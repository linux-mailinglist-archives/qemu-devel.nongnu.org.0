Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BF6ACE54
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGjK-00054z-Sp; Mon, 06 Mar 2023 14:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGjI-0004xR-7V
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:42:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGjG-0003Tw-6H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:42:39 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326IdjqH032418; Mon, 6 Mar 2023 19:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=AUOhIxZhhA7xcjBIuokIvX14peIA5ABs3pFuR95C8dA=;
 b=hN42ybRJu6k2cgj1yX/mchna1sLGmEW7nMBBIJBpW5dGtOThB9gholqN1B0K7Z6+Vy8g
 8BWQ7SkLHJsYT1RecabiwTlnfp+Ytj5Dt7zaViMb3fgmAEkWama7ftTnIVA/6bVXfhMU
 X0mjk4DH4efdGgUTn6tKStUjRVWmkT8u85oz19VhVafPOU25rBStUIjajw6k/ZBkad0J
 YWmCVoHlwMj2nrRaE7oBz1tpv92pJxpGXlv/c2LQyqdejDPN3x6Mhli6tAJwlEeu0eiW
 CHcsLyTELBRdjnOpiB73ikYqZSQiMyPEKkUv6yh+tqqe/wQIIia0qFiH96VBN+gtngst 2w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn904ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:42:36 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326HlR1r024351; Mon, 6 Mar 2023 19:42:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u056q8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU94wXFIJeTXDVfMa7i6Jv/fIGievYMUPCIbGIrLc9umMG9s3dRuUYs8WDJzR05cAtAoYW9yV0s9hvP1FsXapquZfgNY9IOElQL8fDvLo5LcdZ1z4uE4kzNYeNzLJKjUJbw9aFAIGUjpI8LxPA0yKXwF8PH56OvikoV5Y3y584xnPMapWB92ggMcMA+GEkda/a3xzk4l5x1ueYqggwR0+Uaz/mVRMznmo85b/v0q1Icxp63wyoNKoLdU9azGeyid4bCtnvO3WIOGsJ1A5TiuD4TdAaOuH3kCU5fsCN293iYXcF2ZA5JUQ3nFWfyGMnpKVY3lcdJV1d8yH1/HpxB72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUOhIxZhhA7xcjBIuokIvX14peIA5ABs3pFuR95C8dA=;
 b=CMefd1p81B6tviW32xX+4FG6s1Pizin82t+XBlydH3j2VSplYYn+naXQjj4iLS0MMkay5+z9JWxOQAB2WhUOF6l6dnZ07Vde7F1mBCSE8Nkfvnk51Z4xenuaot6NWrzO8darJ2kW7o0ld2rNwdtAQm5oZh9vwJMifEkp218BB9S/q+TSDdK9o+Wl//kccu9Te9FD4kc6RfQhY1xaC826moReXzB8+0zZsJ33GNPWN+6p8Q2MzfXKQU9c9aSbuktXabpsJrvo+ab2lWzlMcx944jnjPHNw1cF5joN+ZTr94h7+8HPCTBsDiEAyKUiQLasQKIAgtHUMetrZE8QVLv0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUOhIxZhhA7xcjBIuokIvX14peIA5ABs3pFuR95C8dA=;
 b=UVTT72Xj8P0NtI3Dmmtl6u6nWpnLBOambcL19ls4iJPwqPIGjGTW2mDHciaB8cGDQZE+//Hdd3dAG8mmAopNH4Plr2IlyVqn74QLgFVC5hm78OfMu+Reo+cUirUT2nlhejQPjqdVt8yTmvXf6hTEtjeleQPjDsYywva5RglAr2c=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB4818.namprd10.prod.outlook.com (2603:10b6:208:30e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:42:33 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 19:42:33 +0000
Message-ID: <5db61b0d-9c35-b668-01c4-7b05c3d899a3@oracle.com>
Date: Mon, 6 Mar 2023 19:42:25 +0000
Subject: Re: [PATCH v3 10/13] vfio/common: Add device dirty page bitmap sync
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-11-joao.m.martins@oracle.com>
 <20230306122249.5f9d9656.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306122249.5f9d9656.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BLAPR10MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7ecbee-b257-4739-ca13-08db1e7aeddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEvRkwxWmzF25D3FRf/vOuAMJmlonfzVzfbHowvzi/92kozcRvvgS93fC1h/D8APQhiZwF0Z36u5kgAKbbqRbnGXL/oDkj/uCtDDbC3Cjhkuad/6hKNKydWJn9UP0W+XYlF9AGhNDf/s6bf4cHiFGqHs7oqjMC2n7bDl72PbjC4aUDzHUCYqyTu7HglSLs+XifR5sfk5pg+iClqWGnoFFQybAoTBEUTXluuEJEclqBIqxl2xXYGroxVrq2VdFFusbcYYPogvF8esyETS76bgvwS0SRRJ1SMNWToYmbZBswoXj8Rkcakk3T/hvBlqZ9GJe9uT2e5xUonQM1qwiTO1Z3F/2V/DahKch1wSmHF9AQczwdlkqwK8Do3iMSdCJNl+acmhdgkCZ5k9NjvyqWHlK8DNKAmW6ggsR+aScvWOHhaNmjTcGnbXi/3Z7oYhnzBLZ1CE8NYfC1mxwEI/dWsgCNE8uGNu18mCuIQpKKiv8mTCoGAzrGgZwiQwLYXjdqoearNil1VnyZfXBcOvwEhYwaMqfngzRvxJf3Yq1zeZOjlyX4HnEVxmS34FS0TyxqmYtSLla5MHDWdAQCjgnr5rknaKIZ4QqoQVuW5Xm3WBd5axmHWuTVopTZNENDO37azh7623x+nrmRuW5qbsGEJvlarMbIErR8l19zlRu72Z/mzyDJqzfZP3XQ85HTmWoEo6huhr7DeRUkWyMx3Rw+bVLrmiWx8uJXNI2WOYue2KgFVlC6qqOsegMo7JfwjE4Y6SR3e77w+qoTSJazMT/MUPKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199018)(31686004)(66476007)(66946007)(8676002)(54906003)(6486002)(478600001)(66556008)(316002)(6916009)(5660300002)(41300700001)(4326008)(31696002)(86362001)(36756003)(6506007)(186003)(6512007)(6666004)(26005)(38100700002)(53546011)(83380400001)(2616005)(8936002)(2906002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZ2M016ajRzKzQ3VThDcS8wRks4T2s4OXgremZEeU14Tkx3UndOWHlHa3RG?=
 =?utf-8?B?QUM4WFJYUXRqUGZaMWx5RUw0RTM4M3BNbWpQMHk2QkZ2YjFwR3J5TkpJQ0xB?=
 =?utf-8?B?ZVhlbFNUYlJJL3hLc3lLa3RoS0FkVjZuSk9QczI1bUZLR0xJaUFJZVFLTG9T?=
 =?utf-8?B?VitVV3g4WG15aGQ2RDh1QjIzMzgzbjZaRlMwT2doZ1pVZ1AxbmUvZklYV25k?=
 =?utf-8?B?eWwydUFUc3M0NEREenVpNlVqQ2xmRno0cG9UbnVLM0lrNzY5eEJqbXc1aE1W?=
 =?utf-8?B?aDNIMTJteUZUU1N6aTRaclRvV21XOVhxOC9vTHB5ZlhDWFp5NnBiYkdTK1dF?=
 =?utf-8?B?MUprZlNzZU5CamVpVWZHYUlLZjlRTjJ2VUpETWRGeUpqR0xodlRCalIycFFl?=
 =?utf-8?B?cXo4UHEydDVWUk15VTA4czlWb3RMUy93YmdVTmRVTXZqM0ExbEUvODNldFhh?=
 =?utf-8?B?OVk5VW82b2RxaHJ6MUZkWDJBMzV5cTh6SXdGMUFDQWVqazE4dytBN1hsN0pM?=
 =?utf-8?B?ZGpxb09JdWNhMkJHVlo2OGp5V2o5MkwvbDVYbzFuNjI5M2VXSDNySlpJcWJ0?=
 =?utf-8?B?akJVY2tkNTkyTjFBTXBXVEpoK2xMOG1NeEVnSTR1Y0RBWFFTQjd4L1NqaDZ4?=
 =?utf-8?B?b0FSZ3dxcU52TGxYNVd2QXZtU24wQWp3bWozUy9KOUlPSVY3WG5Zejc0eU9H?=
 =?utf-8?B?b0ZGWmJHZm9tSXJ3WFAvWU52ZTJ2OHJGckhQeXgzamRtWjljTEZBdXY0YWtL?=
 =?utf-8?B?ZjFqWjhqNDR6SHFDZmg5T1VIK0M5YXU5S1NiWDNBUDhHaHhxZlgvblRhLzJs?=
 =?utf-8?B?Y0JiY01OYnVPc1hhL08zajVSWElDd3lEb2tkb0VQWGpOSXZYNWMrcE9SQnZ2?=
 =?utf-8?B?V1lZcFFqSTdWdm5xR0xYYVYxM2xqUDlOZVd4bC9Ib3RCckJyaUY1VmJ2UDBT?=
 =?utf-8?B?am84Zzg4NHNQZ3hVZHN3UDlOQUtvNEYxaHo5aHl1TXZBN01XU0c4QmkyY1FD?=
 =?utf-8?B?cW5JTGZtMUN0aWhNWjBjNUdSMWI0Y3JDK01zMGZkL1UyR0g4R0ZwbFRYaWV6?=
 =?utf-8?B?bTBrSWJaNWJmTHVpU0Z3Y3JGblAvZDNROUM4RGpvaUV0RDJncXh0UE40U0hk?=
 =?utf-8?B?WHMxWGREZXhvcXFrNWdTcGF6Z1FJREcxTlJkQ1gyU1RKZms1T1ZudkRISVdr?=
 =?utf-8?B?RnFxMzhZWkVhOFFoL1Y2anBDUnpvVUNXVmlkcU05THdzUy9NK3JLN2dRcERt?=
 =?utf-8?B?ZGUxc01zUEtURUFQVnY0M084c3ZlYXI3QkRjTVhvUG9WWloyQVI2cmJCQmFX?=
 =?utf-8?B?L01vYXpaRkVGOU5pLy8zamVVaytEaWJsZ3YyZitRL0xDQTc2WEtMU2p5L0tM?=
 =?utf-8?B?WlBXVFJwZitEZ0ZOdnVGaWNuUU44WmQwMHJIdGY4ZisrTm9LV3hHMTNRUk13?=
 =?utf-8?B?US9ENk1yUUx2Q1dlOGVpS241bXA3TE1GdW9CdFRxWDR1OWdmRWRZR0J3QXNF?=
 =?utf-8?B?OW9POGFEZFEyVkpqWVduVEZSRVJLV1lGeEJFY3V0SHJyY2h6ZlZSYklUcUtr?=
 =?utf-8?B?b1dBK3NUbThlWmIyMWJiVG1TRG50WExHRXR5NUwydzBRSVR0Q1pwMWJWZ2Rm?=
 =?utf-8?B?eE9WcnR3Y01rZTIvcGMwenRsSFF6NS95ekI5ZmxDdDBJVzBZSS9BYzk3anE1?=
 =?utf-8?B?SzRjWWRwc3NTRWxveElnbnUwa0ExTkM5Z0tSVk5pbE4rYjhDZ1pnOCtmaURn?=
 =?utf-8?B?U2I1ZWp4d0dRL2JtMC9qTHJOSXpPNFpzQk5kY1h2U0R5a0I4eFQ5UzAxaXpD?=
 =?utf-8?B?MjVxUHVSakJ4MFk0SUNUdmpuRW1xZ2tQVGhURGlidktpUWdsSmRvVko3bU9m?=
 =?utf-8?B?UVE4Z3IrbTMwMDltMndnSzU0T28zTU1WV1FFeUk1RFNHQm5XVjBSRG5JZGlG?=
 =?utf-8?B?Q0MxV2c5SEpoSytMT1JnbitwekJXOFIzSktjalBDbGN2MzBwNFJ2ZnNmZEhv?=
 =?utf-8?B?WFc3RXNmMy82VFNqYWJ2blNkWTRIZEZpblZZcjlNajgrT3lCdklBNGprOTJn?=
 =?utf-8?B?STdRendsZE83MVQyVzhyd2NMNk14TFZKT2ZVRDlDNUR3ZSt6aUdGRVZrL28v?=
 =?utf-8?B?endqdW9SK2pOU0ZSL3NFaThVajBSd3IvN1YzRmNiNzVZZVg4cGxrblBwNk0y?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9srEqG0hsYrCTvNG/Olgb/Vf+yeEwdfH8MTYBsL3r5JT2EmrKZGVtEhT/VsvOtHPEcKqslxs4Nn6Y4DRgshIzn9IM+5H5z3xG+IGPV81/8eeS3eivOVD7Sme4pLpc7pP1Ok1RJco+zwpL+WDxMluENTdobupomPGz0q5wWCqce9tr2ToPYgzWMQChh7whj8KZ3yFO0PpkaWDGywQUdDiw2FHdteTgQ/3fsb2xNhV3/uoCFHOEh9oRKqBfR2hAlHfHETcvlRN7YkVEYSSweSs+LCUrdQn/m2oI7briRrQ2mtahJFznENBYYY8VD49wjtG25w04fMtfxbKNEIkMrLJx8zzOPO4z/L4lLGPfwYZ4wMCakl/Bf1Ys+VAJjEKXsfThtk9gFgjNiU+dzx2gDvvIN7lqOov7WcSPSwLrOlw9+LZFMiTXL/2uSrx+EzcdXNnfPe45DJPH67emtkwpT54Qti8Qdo8yabjj/V16iMDkR3TOgJYu6f3wG9JFMN0NNPfqWgwJHgMcLx/PTEXL58JJzxFA1LQ9Plw8arLqVU/AmZv2mO4I0sEO5dWN3yVsTCJH+BgFntd2BWgf0zERVXQ48iqqR+BOGe3Uzy2gtGVhnmO/C0UBCe6Cgq0zCiizC0NbSObBZqLn9mWEi0XZ9gxYgMYK/JjKp5jEP8P2bBEyxqGBTLiM1eJ9Tox/dfd7ObdayhzkKd8cVuLBBTaWRuySqkr6sfVlDG91ZuDQnwRdF5H9pIXUEC5w6j/F7yt8b88agaqFReO81EVq4u1zYdnAU5/GPuZibm1tfTWM2K6whhehNU1hgk67NGf6xqLkTGR
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7ecbee-b257-4739-ca13-08db1e7aeddd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:42:33.0211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFRE7GtTSCaqtucpluz9InTxQzCvt+Q7rVB61emUN4XWshkRukwpLG+CK4QnmfY2y9kIoesNHPF31Kn55RAmDPNOlUORG9FLUnXlVuZ1zTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4818
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060171
X-Proofpoint-GUID: X2_uu1_WoTSEBIHp93t2OCouqrAY50Yd
X-Proofpoint-ORIG-GUID: X2_uu1_WoTSEBIHp93t2OCouqrAY50Yd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 06/03/2023 19:22, Alex Williamson wrote:
> On Sat,  4 Mar 2023 01:43:40 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Add device dirty page bitmap sync functionality. This uses the device
>> DMA logging uAPI to sync dirty page bitmap from the device.
>>
>> Device dirty page bitmap sync is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c | 88 +++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 79 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index b0c7d03279ab..5b8456975e97 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -342,6 +342,9 @@ static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
>>      return 0;
>>  }
>>  
>> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>> +                                 uint64_t size, ram_addr_t ram_addr);
>> +
>>  bool vfio_mig_active(void)
>>  {
>>      VFIOGroup *group;
>> @@ -565,10 +568,16 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          .iova = iova,
>>          .size = size,
>>      };
>> +    bool need_dirty_sync = false;
>> +    int ret;
>> +
>> +    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
>> +        if (!vfio_devices_all_device_dirty_tracking(container) &&
>> +            container->dirty_pages_supported) {
>> +            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> +        }
>>  
>> -    if (iotlb && container->dirty_pages_supported &&
>> -        vfio_devices_all_running_and_mig_active(container)) {
>> -        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> +        need_dirty_sync = true;
>>      }
>>  
>>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>> @@ -594,10 +603,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return -errno;
>>      }
>>  
>> -    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
>> -        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
>> -                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
>> -                                            DIRTY_CLIENTS_NOCODE);
>> +    if (need_dirty_sync) {
>> +        ret = vfio_get_dirty_bitmap(container, iova, size,
>> +                                    iotlb->translated_addr);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>      }
>>  
>>      return 0;
>> @@ -1579,6 +1590,58 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>>      }
>>  }
>>  
>> +static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
>> +                                          hwaddr size, void *bitmap)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                        sizeof(struct vfio_device_feature_dma_logging_report),
>> +                        sizeof(__aligned_u64))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>> +    struct vfio_device_feature_dma_logging_report *report =
>> +        (struct vfio_device_feature_dma_logging_report *)feature->data;
>> +
>> +    report->iova = iova;
>> +    report->length = size;
>> +    report->page_size = qemu_real_host_page_size();
>> +    report->bitmap = (__aligned_u64)bitmap;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags =
>> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
> 
> Nit, the series is inconsistent between initializing flags as above and
> as:
> 
>     feature->flags = VFIO_DEVICE_FEATURE_GET;
>     feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
> 
> My personal preference would be more like:
> 
>     feature->flags = VFIO_DEVICE_FEATURE_GET |
>                      VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
>

I'll switch the overall style to the latter.

> Thanks,
> Alex
> 
>> +
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        return -errno;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
>> +                                           VFIOBitmap *vbmap, hwaddr iova,
>> +                                           hwaddr size)
>> +{
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            ret = vfio_device_dma_logging_report(vbasedev, iova, size,
>> +                                                 vbmap->bitmap);
>> +            if (ret) {
>> +                error_report("%s: Failed to get DMA logging report, iova: "
>> +                             "0x%" HWADDR_PRIx ", size: 0x%" HWADDR_PRIx
>> +                             ", err: %d (%s)",
>> +                             vbasedev->name, iova, size, ret, strerror(-ret));
>> +
>> +                return ret;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>>                                     hwaddr iova, hwaddr size)
>>  {
>> @@ -1619,10 +1682,12 @@ static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>                                   uint64_t size, ram_addr_t ram_addr)
>>  {
>> +    bool all_device_dirty_tracking =
>> +        vfio_devices_all_device_dirty_tracking(container);
>>      VFIOBitmap vbmap;
>>      int ret;
>>  
>> -    if (!container->dirty_pages_supported) {
>> +    if (!container->dirty_pages_supported && !all_device_dirty_tracking) {
>>          cpu_physical_memory_set_dirty_range(ram_addr, size,
>>                                              tcg_enabled() ? DIRTY_CLIENTS_ALL :
>>                                              DIRTY_CLIENTS_NOCODE);
>> @@ -1634,7 +1699,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>          return -errno;
>>      }
>>  
>> -    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
>> +    if (all_device_dirty_tracking) {
>> +        ret = vfio_devices_query_dirty_bitmap(container, &vbmap, iova, size);
>> +    } else {
>> +        ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
>> +    }
>> +
>>      if (ret) {
>>          goto out;
>>      }
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD506AC378
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:38:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZByQ-00048v-UJ; Mon, 06 Mar 2023 09:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZByA-00044P-Np
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:37:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZBy8-0006P5-QI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:37:42 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Cwphm008345; Mon, 6 Mar 2023 14:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=I/UMM4PFpEzX2TsBtY1W5+YFaHP93JZCBzX1ipaHrL4=;
 b=jLSbtPRjy/npPhijedIZfhHcQF+Fk54kL1DYc5S+oOZliHP9arhrW4sEjF/qdt+S+32k
 wmXDHCVq5M5m0pp6/9TNiIvMwjBrcFQ9UtTpn4Kl7cDtFoxA1MF30rpWlBbQV3vOAx38
 4Kq1MOELuONopPffheS7+RpmGBAw3jRTZa3y5FKLJnvAR1gIf8h0HZBU7OUERs7cmFYa
 E9V0V7G/jWM0vppbLJhCZm12DHn9FvgI1EU2INpoRV+WFfc0KkzPgwj/iqYb1kHVjrHh
 LuTDOVXjKJbHGnLr78loDtR738g1MvXCT3pyb8NGImLhyTnkXIRhPr2EAgN8JFQ8QU32 2A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168k1d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 14:37:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326E6bIZ037535; Mon, 6 Mar 2023 14:37:38 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txd2k0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 14:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDcdeWiRP1yh87iMu7ha+5sk6GcbyhDC2IbCo3VoVl4K07K9smSc7zXIqUTG9SacS8weO/0GUA4tiuKH3pocgwm3s14Os3aBJ1PlnQaXpUY2sPrwVSD+hdzsPi2CSQeKA12MZtMo4Dr8pM6/McdEcA2BR3vjr12U+DXV2F/kXewhYm76h7KPFHLp7QE+yerujPHz9b9tCt1rrYCC2f7TnjOLIhtsnXJnK2L+W6ucZxK5W/uO3UiBN1eSehSzTOvATLGyOzuqy0A41niJy1VnBAWp9ltMIYbiDd26h2UilX9xJo3wDYSVZy0/FCbvrVhw4huQ2q8NjDb61vJh0OEnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/UMM4PFpEzX2TsBtY1W5+YFaHP93JZCBzX1ipaHrL4=;
 b=EDEZtutTQwtSXVczEDtlMrIwCdOIhmnWb/V2Sm77PhR2fmdSHUdJBN80zEd40JL/aISTPK0dYz6Dbmbe7FqAxPiQv4se7WNFK+91vDLPmy5g+TphSklvHAAtUKGGWacZLfx7QGU9wLkFh/1HHMElSn5HFRlPk5XfWlBFPnhDCgQE+tujwkSAPL071I7v8LycCbdLjIXKW+7MI6hLM7QXKM3/1vxXDN2IFsMfi6VHxedyzXJcqGeL43hX6nANX/GmAhnh94I+azEnSMPo4ImS+aUD40YyuHKHlIu3oZfycWIkWENw2/p5yDSUzB2z8zFLBsI16itq01BvsiZPsF/DnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/UMM4PFpEzX2TsBtY1W5+YFaHP93JZCBzX1ipaHrL4=;
 b=wFO9OuaZx4H2djjHV+Dqpsa4SqIGigP0u8i5AF24U5S44jbJ6oTTujWkoJIy1sPxp/ompO0mfHk+DCvn5kK+3r0IdyNtUGeANGOC2pHpD6fIiyREMQ4j8qRlCueubcmCfx5og7zKDdOf39ALOmCqIAMrHdGPU2ikw+LtVqvYuTY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5281.namprd10.prod.outlook.com (2603:10b6:208:30f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Mon, 6 Mar
 2023 14:37:36 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 14:37:36 +0000
Message-ID: <0e9b026a-1bbc-4970-a47d-e021a37222f8@oracle.com>
Date: Mon, 6 Mar 2023 14:37:30 +0000
Subject: Re: [PATCH v3 04/13] vfio/common: Add VFIOBitmap and alloc function
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-5-joao.m.martins@oracle.com>
 <b83fceb6-7d9b-1b04-dd60-38cd0ddf5c44@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <b83fceb6-7d9b-1b04-dd60-38cd0ddf5c44@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::6) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BLAPR10MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 18363d3f-0b76-4838-dac1-08db1e505432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jr0+pfrKpohvkAzYAhNsfZLHnlQQ+RdBiWkaMWgW01Sz4N0mA3S9U49NkQF1u7lLhkNI7Bg99nx8jSFK0tohWL3ZXdhNIjxEUSAdKqPEtC5Z/iL780le8Lwi50KPyII8PIfAHffU8ehzMJLZ1xQggn20UhC7hyi4eDStOJ+s7Obwpxh/PBtSUOSSjqhdN/6X+TCh9ofqrh02M+2Wu7EgsAb/4qojG7gLG9ZV3iGKGhweYxl+WjIF7xA2qkY5y2FPVYiIwuorxa2AGWuh92BXDARqiFrzfI8LSpF9VAZ8wLYPI6vmUo5vQec8u5Xwadt70GXf0oCPGCsAh86t6FAz5XER+BxdJ1j+7tfuVAmXjcrwKniuDEAou0mCkEvjnPM6TMNisyBffpC8d0k/9aURbt0qBeRQROFI+gZFDBc8fghMDFKMcS8essf5pltiBF3IXkvIx5TdMO+SiPicVCufW/Hm/FzH8YrbN33crmq+hNa3xbDjNw9BKw+RgIOhQdLzMp2O/sHYT3g3p7kxoGFgnl8cleMLXXfHTx+2ZPE41vegYCpwxGRYl5B63ZQiJEtUBS9rDsHV50TvAyAG31N9GFkFD5CXtT5Fbhmj3Frzguj+CSHU9t/Q2DFYKMiUwmEUyyAcx5xCPmrAVnQNpn+kYLmDXWMpk+hJIx1LW5h74D8fYdZrTo0iCg0xGn/F9ulfo7Vnr/uQJTwyy6Au0LgmHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199018)(31686004)(5660300002)(8936002)(66556008)(66476007)(66946007)(2906002)(8676002)(4326008)(54906003)(316002)(478600001)(36756003)(6666004)(26005)(6506007)(6486002)(53546011)(6512007)(2616005)(41300700001)(31696002)(86362001)(83380400001)(186003)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpZaStva2lnOEVraUJzYTY0dzdaMDJjOTR2MG1raVFrMC9PbXB4c2ZRRFNP?=
 =?utf-8?B?endHN3B4eGNrdTF4OFlpdHBzRDBQUEdlNmtGeGt3QjJiTWczNk1kR2pTTnpi?=
 =?utf-8?B?NHVoK1RXQnFIU0ZEN21xc1A2N3NqR2lJY2FsenFMZk0wOUNFMFpzNzNZVXZF?=
 =?utf-8?B?MGM4dE45eFAzSFFRdjZ2M2pJV3FpQWJmcWVsVGhZaVg1alRSTm4zUW1EVEVj?=
 =?utf-8?B?dWo2bFVoRGNRWkEvZ2pYeXc4WEI1Nk54Q1hZVTExRHNzeEFQSjBnY3d1OEh3?=
 =?utf-8?B?N3p1NTROeUU5SElUS1Naa2kyNEFzMGU2Ris1Vm1GK0dLT3dnOGxoam1USnFJ?=
 =?utf-8?B?cFhNYmtodWNlMWk4ekZnN1NDWlhCT3VJVVNCWFgxbU5LUUJkUDJ1RmpqRHZM?=
 =?utf-8?B?TkRaQlBJck5mdzQxM2YrdFpkZ3BiWERQc0JJbmRraUQvUkZlTzVtT1dYekJS?=
 =?utf-8?B?dVA3UytGVTZwV3dhRTZqYlFjTFE0alI4bHloOHhUTjFaeUNUZ3NldmN0aW9I?=
 =?utf-8?B?dTlrcUlXMDhJc25WU2M5d2RaL0VyTDZ2MUZHSThBdmNJUG45MVk1OVEvWGVx?=
 =?utf-8?B?ekJQMmtvWTdnZTV0dUxTK2ZjOHJaUXpua0VGc3ZaWk9vRTBmZU9KelFqZ1do?=
 =?utf-8?B?Uy9BS0pmQ0w4L2JIVHdFSVN6VzFMNkl0aWdVTklPaU1wSWJLQkJtVkEvWTZJ?=
 =?utf-8?B?elo3ejRHRlNPUThEVGQvcSt4WE94NFhTS2trV1ZsdEpja2VWdzBVLzF5dzN1?=
 =?utf-8?B?bGthTHFlbEpNcnpQcXQ0Ukk4K0NQaVZ2VGUyYlEzR3JtSnVqWlZkTnhEUU03?=
 =?utf-8?B?Y25FYlBPYis3a3pHMVdRVWhBeFI3RTF6WkNDelJMTStZdDFQUVdlQStUSjZu?=
 =?utf-8?B?a0JKMjlnZU9WQjlsZHY0OGtoQTVjK3dkbmR3c21SNFpnd1k3b2pjQ1dwbzd3?=
 =?utf-8?B?U2FBUDd1a043MnpMcitramRTd3QzdEt3blNQWlRYVXNuZ1ZNM3FRRW9yTFc3?=
 =?utf-8?B?cnF0Z2FZb2p5ZjVxQSsyNG9wSW5aRUJBM3hHZ2FLVVN2eEhzV2FHMEs1V3NG?=
 =?utf-8?B?bENsbTNDQTgzbkkwc3VXc0wzdGtMc25ERUU1UmlmaC9sT1ZJWG9tODN0cEZO?=
 =?utf-8?B?WWV1TURCMzliMTZaUU9sMTJaQ3Z5WGVMRnpWZXRoSlZVN1hlSmRGaG1WM2Z4?=
 =?utf-8?B?VjZuajFyOUpPRkpCMVB3WHh2R1Q5YThKZTE5WFV5K3BOVTNtdFJTTVV4OU1z?=
 =?utf-8?B?bFdQMGRDcndmTHZsQmJHVFZNRjRUSVVoS2s0a1IxcElJZnQwa0tNQklkSXhp?=
 =?utf-8?B?TnJqYVVja1dEZmN2MFlpTG02czJ3QU5Ob3dDK004aCt3b29nTDVUejJrTkMr?=
 =?utf-8?B?ZjZJc1V3QjNGS3pVQ0k2SVhLSytodXZPem93SlZyZUN5aDhVRnpwdkN5dU5W?=
 =?utf-8?B?cTZKYnBQTEVwT0VUdG9sZi9jNUc3M1ZVWit0alVGMEpxUHpTd3NvcDRWSlZr?=
 =?utf-8?B?bUt4cEVrZUdLQ1laOUh5V1hQSzcxSlkreUx4WlJaSG9WQ0p0T3NWcEFtblNM?=
 =?utf-8?B?am1oa1BLdHJMazYranpsZDQ1ODdsWElzSDdaMUs0YThkZklKdHRFTUVtdlNZ?=
 =?utf-8?B?cnpRdXJaQVVNbFdxSGdaZ21VdHN4QVpjOW1FWlBUdHNyTGZsYy8vKy9qYjdE?=
 =?utf-8?B?dHhReHFkQ3dKcVdWVkNqY2dBMWxpcmlWWFNsYStya25nS3NvcUV1TGdVbGVq?=
 =?utf-8?B?VmlqRXNaRVhjTW1RV1JGcUlaY1VYWVBKU0NVbEpZME42Sk52QXA4MXRqN293?=
 =?utf-8?B?YUNGWGtPNEZWQkV1K3pyMC8vc3kyeUtNYks2T2p2UjUzd2pJNWlrSUlLWHVp?=
 =?utf-8?B?VDhBeTNWOXRtM3BuckNvOEw2cGtxSDJ5Vk1JUUNyUkd4OTVITXg0dTRHWXYv?=
 =?utf-8?B?cXBDNVJ6OTVFTWxYanBpSStnWTluUmZhMGc4V3k1bVRXbFJ6VldjQVUvNVcw?=
 =?utf-8?B?bStYVTJ6emE4dVNubDFtT2NKUkxkT0F3enh2TEYrUWQySEJ4MWtDaE1oOWEv?=
 =?utf-8?B?MG14UXZWMllKYjNONnA4cjZTTUllUXU4Mk1sVjloYWlvMUtia3krREMvVHVD?=
 =?utf-8?B?TGV1OS9YWGpTMk42NjdtV09MV1M1NU1ZRG1aN3dpK2NYTWdwdTE0aVMrbXBu?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LMYxENEsIN29vTmtPWzEpT8Z7hYDMQ0u9TGZo7pVbNkrNJ751RozJVB/HZ7NA5HSm6cNarghLZcnuYZgDmIiyMzWJxkX1y/mXGJIaWxFAidcjlmUWK5qNLu1p5oz8WLWFd0JOk2DeP7YWvETbxuDkaRMGgpLctIs2VwpvU6e0kJRmNgcjda0n3Fia9SOpjzAp5zS0XH5w+Ja7djx6efWZDGc4rq03kyK5b9+W9bWv49Nme3H4uryXxHnibvWdKPR5Iv+66YZD/kIDHkrQKcvaMlV7fv2JGzNMscXonHB2WUY7ojokLpJqxAYKOwBI9tYoDWL+bxX4MMjggojyPBth5FW655tRSVuUZ8Kfjt2v4eLZfdGbVEGfQpRsClOYMjfTVPCaT8cszwjiqfMrkKM6m9PqIHf2NW4z0fUobz4QUvVHBnm4Xh5eJoQ0urDCKrfeEsOgdqjogu4jbic+FavbyYu10dvj0216sDrrdKzbVZEYlE571evPQ0plyrgEonFaUflt5i9nORxHdTBs4AIfMwSG+AjK9nKLTyvsNX6yoVza3HePE5MUPF1B34eZTeZHcycguP0kiykunfzrY4fJB/lzom+ycn+WTleqSuIFocS/OhBFba8I6Ps1zyjyZEJNSR5ZnyjgAYG4q6XW3+2xfTlZhcmYqWx+5IevlS9ShdZbun8A5KwLvkk0URcnXrhgSlMWTkls+b4F7hfDNGUD/DIRiZgka8UHtLEWJaWyYWixTIQ3koVmAc4Rw6mmPUutVIa9rM3T3zGl/9KxZr9ofQRd2CpMJihtLH7t/LdepqRC6J0I30rb5+JqRTNaqvi
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18363d3f-0b76-4838-dac1-08db1e505432
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 14:37:36.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAXL3i0XheT1jD9ahDLhRGRdZ8ZyfQ0Ikh5BaeqG/jkkvAG4RriDUUmZlSDw4TzjT5UiF400p1WncJdvyUI+Cjpa8fcU3puFVYzBBTRMM7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060128
X-Proofpoint-GUID: BUc9O9YrIpeURHyubPT9kAduN7xgiqpt
X-Proofpoint-ORIG-GUID: BUc9O9YrIpeURHyubPT9kAduN7xgiqpt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 06/03/2023 13:20, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> From: Avihai Horon <avihaih@nvidia.com>
>>
>> There are already two places where dirty page bitmap allocation and
>> calculations are done in open code. With device dirty page tracking
>> being added in next patches, there are going to be even more places.
>>
>> To avoid code duplication, introduce VFIOBitmap struct and corresponding
>> alloc function and use them where applicable.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> One minor comment, only in case you respin,
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 

Thanks!

>>   hw/vfio/common.c | 75 +++++++++++++++++++++++++++++-------------------
>>   1 file changed, 46 insertions(+), 29 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 4c801513136a..151e7f40b73d 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -320,6 +320,27 @@ const MemoryRegionOps vfio_region_ops = {
>>    * Device state interfaces
>>    */
>>   +typedef struct {
>> +    unsigned long *bitmap;
>> +    hwaddr size;
>> +    hwaddr pages;
>> +} VFIOBitmap;
>> +
>> +static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
>> +{
>> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                                         BITS_PER_BYTE;
>> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
>> +    if (!vbmap->bitmap) {
>> +        errno = ENOMEM;
>> +
>> +        return -errno;
> 
> vfio_bitmap_alloc() could simply return ENOMEM now.
> 
Gotcha.

>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   bool vfio_mig_active(void)
>>   {
>>       VFIOGroup *group;
>> @@ -468,9 +489,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>   {
>>       struct vfio_iommu_type1_dma_unmap *unmap;
>>       struct vfio_bitmap *bitmap;
>> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    VFIOBitmap vbmap;
>>       int ret;
>>   +    ret = vfio_bitmap_alloc(&vbmap, size);
>> +    if (ret) {
>> +        return -errno;
>> +    }
>> +
>>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>>         unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> @@ -484,35 +510,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>>        * to qemu_real_host_page_size.
>>        */
>> -
>>       bitmap->pgsize = qemu_real_host_page_size();
>> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                   BITS_PER_BYTE;
>> +    bitmap->size = vbmap.size;
>> +    bitmap->data = (__u64 *)vbmap.bitmap;
>>   -    if (bitmap->size > container->max_dirty_bitmap_size) {
>> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
>> -                     (uint64_t)bitmap->size);
>> +    if (vbmap.size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap.size);
>>           ret = -E2BIG;
>>           goto unmap_exit;
>>       }
>>   -    bitmap->data = g_try_malloc0(bitmap->size);
>> -    if (!bitmap->data) {
>> -        ret = -ENOMEM;
>> -        goto unmap_exit;
>> -    }
>> -
>>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>>       if (!ret) {
>> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
>> -                iotlb->translated_addr, pages);
>> +        cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap,
>> +                iotlb->translated_addr, vbmap.pages);
>>       } else {
>>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>>       }
>>   -    g_free(bitmap->data);
>>   unmap_exit:
>>       g_free(unmap);
>> +    g_free(vbmap.bitmap);
>> +
>>       return ret;
>>   }
>>   @@ -1329,7 +1348,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>   {
>>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>>       struct vfio_iommu_type1_dirty_bitmap_get *range;
>> -    uint64_t pages;
>> +    VFIOBitmap vbmap;
>>       int ret;
>>         if (!container->dirty_pages_supported) {
>> @@ -1339,6 +1358,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>           return 0;
>>       }
>>   +    ret = vfio_bitmap_alloc(&vbmap, size);
>> +    if (ret) {
>> +        return -errno;
>> +    }
>> +
>>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>>         dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
>> @@ -1353,15 +1377,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>        * to qemu_real_host_page_size.
>>        */
>>       range->bitmap.pgsize = qemu_real_host_page_size();
>> -
>> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
>> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                                         BITS_PER_BYTE;
>> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
>> -    if (!range->bitmap.data) {
>> -        ret = -ENOMEM;
>> -        goto err_out;
>> -    }
>> +    range->bitmap.size = vbmap.size;
>> +    range->bitmap.data = (__u64 *)vbmap.bitmap;
>>         ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>>       if (ret) {
>> @@ -1372,14 +1389,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>           goto err_out;
>>       }
>>   -    cpu_physical_memory_set_dirty_lebitmap((unsigned long
>> *)range->bitmap.data,
>> -                                            ram_addr, pages);
>> +    cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
>> +                                           vbmap.pages);
>>         trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>>                                   range->bitmap.size, ram_addr);
>>   err_out:
>> -    g_free(range->bitmap.data);
>>       g_free(dbitmap);
>> +    g_free(vbmap.bitmap);
>>         return ret;
>>   }
> 


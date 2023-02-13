Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F5693E82
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 07:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSgJ-0005lG-8L; Mon, 13 Feb 2023 01:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRSg6-0005ic-NZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:51:06 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRSg1-0006XS-Go
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:51:06 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D1iPDf026123; Mon, 13 Feb 2023 06:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=C5sA2RSFuEvG2Uj7rkojeC4qEgQEbNOrVFivAC1ufhA=;
 b=bZPCXuhOBE0OJBJTnWQYpyIQFKNoXBEe8TRMsnReEKDQzSuxADmQT5uF/9eLJcajVXkg
 4wWhrJ5pDE5h0QYJo3ZJ+MEJrgzl7adEnnXbp/UKgD2hWvWJxIlR9IGg1FqbuPxqRsW3
 chdg79F6F9jvAOw7euN9Ji6VkP/Hayy9JJVnWa20if0dDkgQb1DBdMp+DRw06gN4NYgw
 sWD7Rdho2xEnrawXPTWLG4st3jPxVhBFXlRz2025KsaAi1CH91gcSzaxcWesu71uwvlX
 j9FiNd4yJ0LM7EDO7aUz3RJrUat6yhugKS1mMJWKY0u83GkB1UehmBsSdDKUJbBklfDL Nw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m0t476-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 06:50:48 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31D6H5q0032641; Mon, 13 Feb 2023 06:50:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f3q0ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 06:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXOD6F9jPM3mT634zCIVH/NbvHXv8Bl9Ute5WhwEqHRshE5NqFYxyyyootKdeo/IhtEpGxEZ/ZlY34tsKCZg1z186Pqq4rDCEnVvcZWt4dS5G2gwiFRaA182Hrg8b8xkLXpnNxLSGRYTUiT/U6DbHoxKG/Ab8kyVG6oCsG5XqYNEmjyde0gDCDeCSbtDrK5DuO61K/Ge8PtXCyeZzKNbVKVD1wanaFcpiXSbEaBSE9C8V/p8Ej+V+JjKZDMKBx0bnkojbchwaBwZajx6Csu/d102dI16tj7aOkU62mFn8JP6TBuxMnoEvjfr4KXoQ2A1wyI0wbExewtPul3ndzqXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5sA2RSFuEvG2Uj7rkojeC4qEgQEbNOrVFivAC1ufhA=;
 b=EshQZYAclt5oVXYzYxdmy99WSoHSnT10A9ufULkmEvQlVJrSbSwb7BUvtIUjfvv1upUxxO+VsGGsO0Ar3WGOIXgjtjN1CJqqprNXM2KL1UHS/Czim/9c8Patw9O5LUYfRaWxbttZOfU5q1K9Od6z/8jx/cXbwrxEcpFv/xK+Lhf+uaofKwGJ4nZ7RYWuWkA8qlGuajYHPJ9DDDzaof6VcY7X4ccwMk80Ab3P0BVPHfhpSU++7jFW5y2ydzR4a40OFKgPyjmQP7kN3cU3JI7ojZ+KkZBw819tigEL++evDhMH4RHQ653STiaNSb57CPEPc8+uDhRXQcLcld38FEBNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5sA2RSFuEvG2Uj7rkojeC4qEgQEbNOrVFivAC1ufhA=;
 b=gzdhxIdPkKWSB4g1DxwaG/zRyFFQRC56CaD2VDqKa72OOM7D+4I5uAMDZFWrm3F72yJ150BoOdOfQXpLGRqLsXYA8ztBNto5xAxetH2WxoC2J07XLJOqrWtVKNRBSW5f+j7xTvMDy6dLSdDtJcfWSBm8+z1XkLYYDTznibCc3Qo=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by MN2PR10MB4272.namprd10.prod.outlook.com (2603:10b6:208:1dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 06:50:40 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 06:50:39 +0000
Message-ID: <2901fd82-5c0e-c830-5288-a72b8c08d628@oracle.com>
Date: Sun, 12 Feb 2023 22:50:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-8-eperezma@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230208094253.702672-8-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0128.namprd07.prod.outlook.com
 (2603:10b6:5:330::20) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|MN2PR10MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6db832-31c2-4092-3be9-08db0d8e9e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKP4tzeg73tJdE3zC3zt2bqXXiXJpM0hXXUKCha0gL1+5jsCr14y7NROAsC7z20KXMgIySys5apcXexQql3jD/bUV21824+a31cR6oqcGPVICm9AkqI6TXlO7nU2OkDK35MzYx2Mmgb5KFDeyt596UMnx4CWp5TXyKV22wPCWXtYzEVxayA9DIgNYuoksG+OWaTbcLuaWSuz8en9u8UTptEs3eRSkEqpylNggWbPRLlNOzvNq8t9z7DSmMzPO3m9pz0v+8neZAgOOzYC6cFdU1OXSlfr4ljxlKR2jMJViZaYlihsGnOGQi8OFLsJ7Q8/YHcIpEOwFIqPprO83wcuBg4ks5M2uO+SERmfi5GKAsBHka0LGttha5Hu/K9hrrd4MbVZcjgVAzNSXLsPzaPaPhy86IKuuVHwu0kjCCEjuBf9wWl9Px62xEclFXmLxA+bUkxxtBrDMDGEcCMbvkKnWGLL0DSbXkkXEdMu+8BgFf9+lYcE1GgF1FzsTihWAN1THxxgOIIAU23ClJqI8ne22njMHB7RPNTrQkhKqyE1/+kpXEs7WmKRRli9kwGuXj9XlkmloxYENPyy9gRJ23MuPpjEKuiPvBh9LsWMXNi++o2/bsfpOXe1/+tGc439B1pxm+0YwFui28h877bq2aVBdfqRCQ3tvnVkrDMSOugdlJAmr33CxseH5dMk2z5Rr1R3tCN0BuRNPgMDZoSbOfcxr8DPdSqSeKb/2trBQHE4lh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(38100700002)(86362001)(31696002)(36756003)(2906002)(41300700001)(66476007)(4326008)(8676002)(5660300002)(7416002)(8936002)(66556008)(36916002)(2616005)(66946007)(6512007)(6506007)(26005)(186003)(53546011)(83380400001)(66574015)(6666004)(54906003)(316002)(478600001)(6486002)(66899018)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk9nSlY5MUl2OEZFaUJTQWszTUxXekFLeGFJYS9QQmlaK2Z1L1ZwQm80WEE0?=
 =?utf-8?B?UDJSa1BsWVdnUDVoQmdVZWZGelRZaFpxNkJVUUU3SktOYzRpSXAwaU5GNStZ?=
 =?utf-8?B?d1hZZUNiV0dDRHViZmxlUFM5R3FIK3RWSlQ2eUZRMHY3cGhsRkoxU0Zta3lu?=
 =?utf-8?B?TjlYaUFoZ2V5SHlzdnJCVkM2cjV5UzFuWjY0WWpSNXF6eER6S1BDakNueHNy?=
 =?utf-8?B?aFdQOUtPTU5UWWIrQzhCU3dYNHJPTlIvbVcySVZveE92L1pYbktTSG9kR0gv?=
 =?utf-8?B?VFJZbkY4MWpIM1pyWG9QRmUyRXZ5UjVnUU9GN3dyNHBSM1J5YlVqSDJUWkRT?=
 =?utf-8?B?S1d5RUF0REVYRCtpbG56ZEFZdjFtNDNFbktyRm8rRlRnWmFQVDh1bDN1c0dS?=
 =?utf-8?B?dktaMG1ORE9ibGF6Zkh0eEZNMWxhSkt6eGpYMFNxcmVDaFUzSEdILzg5V1VH?=
 =?utf-8?B?dzRNdW50bkpVL1lXQm5SbGJZK2ppMjNkTStYdmVFbjduYjJFRVFFMm50ckxi?=
 =?utf-8?B?QytYS3FPdUkvc0kxQndCVzZleDBqVU1vWkM1bXdVTjJQTkRmZGtaczhYQkk1?=
 =?utf-8?B?ZjlFbVJ1RVI1dnFWTWdzSVl4MEJZSUZJMlAzSGlUbjgySURqOEJtOGZWYkk0?=
 =?utf-8?B?MlFGMTVEQ2hiRWdmQVg4SFMxUUxmd2dxOGtHM2krTDhxNW1oR2hwL1A2ZUxG?=
 =?utf-8?B?TVRvSERIQ3drTGNHZ1FGQ3lZK1hjWXFpWkhUZS9TMUNVZ242elg2bFdYSmtJ?=
 =?utf-8?B?Y3pQQmNvR0FmTEFlY1AweFVGSVRWRStFdzBpRTAyMDlaVWdHVGtkd2U4VGtw?=
 =?utf-8?B?QnFRbzhQV3RYdmE2UFRqZU9uQitKTW9zMlVrWjdsQnQ3dUZnSUdwbHpib0s4?=
 =?utf-8?B?bjM4ZHQzWklyUC9HdGtpUE9iamREVy9yRHJ3eXNFTTNDbkhLMFFsRHFKV2pC?=
 =?utf-8?B?UXFHcjJlSDlDREdZbVV0eHliQ2E4WG5CS2E0ZFMvcGxZWFhtSWl1SlU4ZEV3?=
 =?utf-8?B?dW0yMzE0ekxQeWYrSzljQm1RYXRzeUpTR0tQbXcxSzdhOGExMG5WbG8xajZt?=
 =?utf-8?B?OVJuNmFJT0hwTG5ENWNrNjVmKzNmNys0K1pFZUtRajJYWjBRSDQ1Nm5zQ1ln?=
 =?utf-8?B?cGZPM2Fpam1PMDl0MFVJOVBZcm1DTjBMK0NXOHJkaDQ3YyswYkhZbVJ3ajRU?=
 =?utf-8?B?TmdlWE5xOFZmK0R4QTh5Y1VWRTlYbFdpeDNGMFRkdERDZmlKb0FDWDNwa2ph?=
 =?utf-8?B?VW9IWHVRY2pSdDlPZkZhRTdGK25sMzJRVkY5aUhQd2RzVXU5NXhWeU9yaCsx?=
 =?utf-8?B?dGhZZHdHaE5Da2tzajVyU0ZBd3lsL0lwcUJ0dy9Jc1dHM2xUMk5VQlpFZUJ4?=
 =?utf-8?B?Y3pvSC9JT2p2a2htbWJDUjRqNkhuRkVxa21tL3VHZTllcG96MXZ5K3JEQnU1?=
 =?utf-8?B?YzY1ZERMbWVSRStQZ2RvZW1QTFduTzFOS1FBaGdweHlqTFFWdHBDellZUi85?=
 =?utf-8?B?Tk1JZVhhYWJ0WWJRRkRrTHVDcmhBaXFoMXhSYjhKZVZuQ2hzdVowb0xFdWtk?=
 =?utf-8?B?VzBKT0RacVlIME1yTWRuMlVtdVBoT3BOWUtOWHFuekpWSDNjcTg2NVF6RGg2?=
 =?utf-8?B?NVRDS2hFYXZWRW1XOTh5UDhISHVSY1Q3RHoyMitVZzAxTnVuZmowand5dGx1?=
 =?utf-8?B?b3Z3NGh4eEhuQTVNVVkvempZOE5VTHh1bzBPblVzVC9oK21BbFhLQ3lhRnFa?=
 =?utf-8?B?ZzhSbkplMkZlTUx1dGpIdlJHVHFUYk9lVDQwRnpWcUtDTlVPODlxQWl4MjE3?=
 =?utf-8?B?SHVDVkRqaDZ1WWU5clJYR05RUTA4cFNBTHZOdWlnV0pOV2lnNXV2R2N1MVQx?=
 =?utf-8?B?SGxTMWlJV2QwUG52R1ZMSi9xc21iZit2Y0cyOVhnVjRjZWxXeDRjYzVwWEo5?=
 =?utf-8?B?aXYwa0g2UHJmbmJMVWgvTUpNbmtsNXM5SmFIYU9KUTJYVldwNTB2MFV0VUtZ?=
 =?utf-8?B?Zm1SSmdoRjNHaytuOTJ5cVYxdlB0aWVaM2ZjMkUzU2hpeEh4WHdocnEzY1hh?=
 =?utf-8?B?YnNkTjlxQlpCcWVZb0k4cU1Ram9GTFBOcmVSQmJxVXI5OXNQYW1ObVFzc1JV?=
 =?utf-8?Q?1Vlc2i7pOnbY1qzoSq0jFR7/V?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?RHZZNldaQ1I2M3NjRHBHcFFSWEE3bTJjVkNZbXhXZTBvdkhmbllhdW1kb1NL?=
 =?utf-8?B?dmFZdkxEMzVaUGJaN3ZqK3doUlQ3U1VEM2ljUVZIMENNaEczUDNOYmxOTkVW?=
 =?utf-8?B?ei93Zy9NVi9zSEdaRXg0Tm9ZcVRFQ25JMUk1WC8vbkhYeG1QYVpQSUhUeWRw?=
 =?utf-8?B?bENPWW5YREEvVWRHQXA5MXc1SE9MSnR5VG5zQzNSVFhvSHpkWFZiZ3VyYVln?=
 =?utf-8?B?YWZNdWloclBFLzdzamJnRUxoeFBEazUxVk1WUHNDVE52Wk5BbXRTbDhXVzlz?=
 =?utf-8?B?dE5ncTUyTVV2eG43Q2ZNZVlrMWZMRStjdmtRcGlEalQwQVlGS2VlQmJiNHBW?=
 =?utf-8?B?RkxINDdhZHZVMEJleUl1L2t1U0RENXkxSjV0ajZha3hUT2pYN1hVV3NURkE5?=
 =?utf-8?B?RnpsYVVzWC9KaExIaHhjbkQwMGVReHhTRmZ0OGcxNW9PRVRydGxCZDk4Umhx?=
 =?utf-8?B?VU5PZzRNV29SZW5ZVGVraHl0UU40VHU1REhPMjlodk9USktOVEJ5ZzFZVzdF?=
 =?utf-8?B?dFJHUlM3dDVTenFpdDBZVW1USDF3L0t0NG5sejM1bHQ3Si81R3BDY1pCYjFP?=
 =?utf-8?B?TTNXckV5YnlqMWwwKzhrOW5zdTFuYkN1aXBuajFpYTVYS2R1VnAzT3FseEtZ?=
 =?utf-8?B?NmVCT2VCUEVPczdUREszUzR6YkdEV2lObU1jM29wRloyVGQySTJSMndWZDRR?=
 =?utf-8?B?UjFyMmthaVE5dDR2c01oY205QzNEZVVhaWc5WWhvL29WdnlYMkZjdHJUWVVS?=
 =?utf-8?B?RVRBNjUrT2c4ekhJazEwVVdFMFlHK3pRUXJFeFJxb0pRU3R1Z1ByeE1zUUwy?=
 =?utf-8?B?bCtLTzIyVmtMaUlxd1NLK3pJSlg5N2h0QURheW5IamFJcmZxZW1qQVU4OUhW?=
 =?utf-8?B?clNZRjVKUmJYdDFXSld4MldXQS9UUmF3NnQvaEt3Qk1GcUZxaExRSDQwc3Vr?=
 =?utf-8?B?aGN2N1JQZ2t4UXFtZ0lyclNEaHY0WlV5ZEV3SE5XbzBTcDh1MXZTUGlVWnpz?=
 =?utf-8?B?c0JReWFITExDVHVXNUJ3SVZqYjFIYllwb3haNDNBMitLM01QMDRiQXdXK0NW?=
 =?utf-8?B?UXlDUXNyekFxaHFmWVE4TGUydHJEckRiQTlJdnp2dU5FaTg4ZlVxeURtZVpP?=
 =?utf-8?B?Wk05ZS8zdmNJM0dpWVRsYll5Sk9OQ2QvdDBPcEJsNitOK05lV0pacnhWNm02?=
 =?utf-8?B?NW1XUUVlWEpsL0grQWtJZmRvSlJ6NjlRem0yeGgvSFI5MVA0eDlCVXBORXM4?=
 =?utf-8?B?VEV5b0l3UlJUQ3BNeWFaWVAyYWd6NUh3T0JOWjFycUF3eHUyb2VaNzR2QzQv?=
 =?utf-8?B?aGZ4ZU5GWW1iMC9ueDlxUGluVWwvTUhFMGc1bGk1OWdXUlFhSGcwSFA2WFBS?=
 =?utf-8?Q?/hW9M7v6bQOANv1kdqyV6oFNTtJrRUX4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6db832-31c2-4092-3be9-08db0d8e9e65
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 06:50:39.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehK1mzbDZSvmrgc8borYA5jvDTLrz8/Kj1ubATlhcWT8o90dYifjYSfRte2i8InzYCBMEQJSHLvY+F546SUY5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130060
X-Proofpoint-GUID: 0ePJpfaHVuym7S2bIC6jZtOhJRW_KPER
X-Proofpoint-ORIG-GUID: 0ePJpfaHVuym7S2bIC6jZtOhJRW_KPER
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2/8/2023 1:42 AM, Eugenio Pérez wrote:
> This allows net to restart the device backend to configure SVQ on it.
>
> Ideally, these changes should not be net specific. However, the vdpa net
> backend is the one with enough knowledge to configure everything because
> of some reasons:
> * Queues might need to be shadowed or not depending on its kind (control
>    vs data).
> * Queues need to share the same map translations (iova tree).
>
> Because of that it is cleaner to restart the whole net backend and
> configure again as expected, similar to how vhost-kernel moves between
> userspace and passthrough.
>
> If more kinds of devices need dynamic switching to SVQ we can create a
> callback struct like VhostOps and move most of the code there.
> VhostOps cannot be reused since all vdpa backend share them, and to
> personalize just for networking would be too heavy.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3:
> * Add TODO to use the resume operation in the future.
> * Use migration_in_setup and migration_has_failed instead of a
>    complicated switch case.
> ---
>   net/vhost-vdpa.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index dd686b4514..bca13f97fd 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -26,12 +26,14 @@
>   #include <err.h>
>   #include "standard-headers/linux/virtio_net.h"
>   #include "monitor/monitor.h"
> +#include "migration/misc.h"
>   #include "hw/virtio/vhost.h"
>   
>   /* Todo:need to add the multiqueue support here */
>   typedef struct VhostVDPAState {
>       NetClientState nc;
>       struct vhost_vdpa vhost_vdpa;
> +    Notifier migration_state;
>       VHostNetState *vhost_net;
>   
>       /* Control commands shadow buffers */
> @@ -241,10 +243,79 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>       return DO_UPCAST(VhostVDPAState, nc, nc0);
>   }
>   
> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
> +{
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +    VirtIONet *n;
> +    VirtIODevice *vdev;
> +    int data_queue_pairs, cvq, r;
> +    NetClientState *peer;
> +
> +    /* We are only called on the first data vqs and only if x-svq is not set */
> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
> +        return;
> +    }
> +
> +    vdev = v->dev->vdev;
> +    n = VIRTIO_NET(vdev);
> +    if (!n->vhost_started) {
> +        return;
What if vhost gets started after migration is started, will svq still be 
(dynamically) enabled during vhost_dev_start()? I don't see relevant 
code to deal with it?

> +    }
> +
> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +                                  n->max_ncs - n->max_queue_pairs : 0;
> +    /*
> +     * TODO: vhost_net_stop does suspend, get_base and reset. We can be smarter
> +     * in the future and resume the device if read-only operations between
> +     * suspend and reset goes wrong.
> +     */
> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +
> +    peer = s->nc.peer;
> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
> +        VhostVDPAState *vdpa_state;
> +        NetClientState *nc;
> +
> +        if (i < data_queue_pairs) {
> +            nc = qemu_get_peer(peer, i);
> +        } else {
> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
> +        }
> +
> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
> +        vdpa_state->vhost_vdpa.shadow_data = enable;
Don't get why shadow_data is set on cvq's vhost_vdpa? This may result in 
address space collision: data vq's iova getting improperly allocated on 
cvq's address space in vhost_vdpa_listener_region_{add,del}(). Noted 
currently there's an issue where guest VM's memory listener registration 
is always hooked to the last vq, which could be on the cvq in a 
different iova address space VHOST_VDPA_NET_CVQ_ASID.

Thanks,
-Siwei

> +
> +        if (i < data_queue_pairs) {
> +            /* Do not override CVQ shadow_vqs_enabled */
> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
> +        }
> +    }
> +
> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +    if (unlikely(r < 0)) {
> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
> +    }
> +}
> +
> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *migration = data;
> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
> +                                     migration_state);
> +
> +    if (migration_in_setup(migration)) {
> +        vhost_vdpa_net_log_global_enable(s, true);
> +    } else if (migration_has_failed(migration)) {
> +        vhost_vdpa_net_log_global_enable(s, false);
> +    }
> +}
> +
>   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>   {
>       struct vhost_vdpa *v = &s->vhost_vdpa;
>   
> +    add_migration_state_change_notifier(&s->migration_state);
>       if (v->shadow_vqs_enabled) {
>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>                                              v->iova_range.last);
> @@ -278,6 +349,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>   
>       assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>   
> +    if (s->vhost_vdpa.index == 0) {
> +        remove_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>       dev = s->vhost_vdpa.dev;
>       if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> @@ -741,6 +816,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
>       s->always_svq = svq;
> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_range = iova_range;
>       s->vhost_vdpa.shadow_data = svq;



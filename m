Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639836872AB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 02:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNxq-0000HE-Vq; Wed, 01 Feb 2023 20:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNNxi-0000CU-UE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:00:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNNxg-0002eM-FD
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:00:26 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311LDwXF011691; Thu, 2 Feb 2023 01:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gBqXg82VcKzGOt9n2i9Sea1licUep71RXC3vDH8TAi8=;
 b=n+IMUQ8wqgFGPPg8H7myoBfj7Aa2zFdQ1rYhqZGG6bjEWR4ZXuumRAvQlwjf0PXp9loy
 PxicXvMTqC3xTFSam5e6GRjA6bW0Yv3OV8NrfGuh2X90aJhafUZmTPt6Cs1IJF3mgP55
 Tj0s1wudsjcW7OF8y0QGF8VJjJlptpRAZ48mvajiA2lGm3o4YkxxFvI4xeKpVwWdyRin
 jiKUKY58wFx8AMuk5UKtEYnZcCQGvhz9iKUOMLMlt5prKrMyBVDYiro7EgJSWHawg2MW
 t7eCEchhiEzYbK86FU4lCOSyYVcm71d790OsXHTbaCIpsGCi+lzsZhPzyitaT/7zyEue Kw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkfe25gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 01:00:11 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 311NUfAS013093; Thu, 2 Feb 2023 01:00:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5ewh3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 01:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beJt9Mra/gmRnnwX6ExT3gmA4RUlvxqZbzoDbVlSGSAlefwpVM0q+F2rGSeG4xnaL9MthsuruuggmoxAvq4E7M/sfRz+rELbwFMe2EjD3AnyZl2T+Cps864pXBRODOPfyZztWwwPMSMJfPvTV8Gd9yAlP9IG3lOTlOfCz+i0qEwZ5Q8KjAxbezOwIhM8F7xMrSfgiTA4pss+/lsiyd9bbQGjz4QleoVwwqtZHpvLmVcxnqkqz5C/wbm0pzYmtKTcEkgmxC5Y9AOCkto3ylmlXs/FY46qKAROHnzoMXg3e2jrAqza+O2jhC95EszChpckbT2hUHpi+OJ2KM7RcuxdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBqXg82VcKzGOt9n2i9Sea1licUep71RXC3vDH8TAi8=;
 b=MNsCveQJFI+9XGX3y7DQUlLeevCCG87CChbuPGDNRV8hCCe7TR1SUemkMdd/hyWX+ywzg+zIouMWlGyOsMmu2B0W2984FbhpEY7+zzqJxx3UXj3cb/OdBveGjL6CLowU0a72bZyhDkHcxkVrwtr/QMNd7FYk6oykZk6dkQ1mVmipEtoplJH1SBBj4kv6qIC3pcBIR3iaabmo1j4rF3b+GCIDe/z3ERjRVIXW6wYUTFUR0RAxCl8kKR2x/xsP2LjIos7ExFr0jmFjhhA2a24SH5I2Jy4OxwQL1PHl2YVP0A5KDjaSaPFTSobvDoiNc1DTDTR5a9ApiJYgkKqdrr38gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBqXg82VcKzGOt9n2i9Sea1licUep71RXC3vDH8TAi8=;
 b=ess5YyBAooNvewLiREeWnBNXrAS3Pwl9Sjlqe7oPc4gG6HrOc+mU7MtWtXO+xQ2fHVUqOeUxZfvjAkkzikEXwFjLawh/oVPCSaTUaVpMiKST9BVmMD9HlG4UPCN80U4E9LUFT/8T+gmu9w4m8Y+BecdEsTqqCmpSa4/kWHjDwKU=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CO6PR10MB5553.namprd10.prod.outlook.com (2603:10b6:303:140::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.17; Thu, 2 Feb
 2023 01:00:07 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 01:00:07 +0000
Message-ID: <17ca79ae-7cda-3d1e-4935-d783ecbe992e@oracle.com>
Date: Wed, 1 Feb 2023 17:00:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 00/13] Dinamycally switch to vhost shadow virtqueues at
 vdpa net migration
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CO6PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d880ad8-aca0-4f02-fde7-08db04b8d363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6fjMEqyshn1gZOy35LqPBnPq//qwP+Gh2w0z8LSFbPevFGWV9GX3qEr2cq3xhf7SVrMifngx5NAPR/OAJYUL1U6ERnnStpblzePKyyANDE3GBx/wQ5OprIu5AGyDD4rQ14jeg17XWF+MH2v5kX+F9uIcldX7P5JrmLbMiq0lYhMT01IIi8lmwmtal7ZsxOVUSnXD3i/vmEq53g+h6dtjnbax7Rc7Bkw5LLv8tZyb5kgveZ4c2dP4OsfWXAKDjIxTg/xo/frKhZX0IdHaW+PonD4ImW6++ohjrUOTcVnVV65LCdJ4zc+J6nDclK03M2IyZWJVOfeHAXWdD1fUyiIWlWlGq+5DTKocCgJQEwBRwHtCvPmqP1ha6JtNg8pqRmXeOcyEWLjO3xits0ZedT786zqzlKIDE9DP3z4Y+ZUGVU+StyeE1v9LUIxflvaQbfbDrgdWqWuqiA17jLkwYhndM4EjdAu6heu3I8jimeamcVwG1HYqfJPaoNri9FX9JGecjcCQ8j2nW0FIoP9GkYPJNtftgQF5A8LMQcAaBcP/PPtodbtrg1nXQcM5kmfzm8ppNjYyOeO1BmOzCZD+C1kbsJFqDICCE4aPvieZjz9Kz6FqnGMhMlHuCuWDiRMfFKEnCMn38Bcs9+7X5LHytUcaVK2BmWtgDutz1s1tAEKnWxHxYyOY/qcBpuL17o0y8BZ9+Sk76hYut3yQ2JKpQiuLSgh3MRKPwQTjNCOf5Qc6Vk3QSiOeL4xQuNwysJYe2PKBEtdsaapEDIX5rUC+5LLRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199018)(966005)(478600001)(26005)(6486002)(36916002)(38100700002)(66574015)(31696002)(86362001)(186003)(36756003)(6512007)(6506007)(53546011)(6666004)(83380400001)(2616005)(8676002)(66556008)(66476007)(66946007)(316002)(66899018)(7416002)(54906003)(5660300002)(8936002)(41300700001)(31686004)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWswQTROWnpwUDlwNkRNS0NuODRndlVINFZGQ21VbGFTREZGUU8vS0hkOHVO?=
 =?utf-8?B?dFBBR0hmNVRPOUdxU0VPanNWT01xR3RiZjZIT0VjV3crc2l5N3lOeWpJeE9o?=
 =?utf-8?B?dTBUL0xzeUtRbzMvS1lEdkN1a2hIOTRWYmxhWG9FSldoa0JBTUh4QjVPcTRS?=
 =?utf-8?B?NzN6OWVwUnprcVR4dUIxeloxanByZ0VITzJraHFLS1VyMG5Eb05sSGdrZWJv?=
 =?utf-8?B?WkdGY1RzZGNKM3o3ZVFJMGFFa3BtOWJieG83cm1ITjh1Rk13WlpFejMyRGNO?=
 =?utf-8?B?cWtzL0VSOXBZbkJxbEtBSE1XMkIyQUN0eUNwbkxVbGJndlhTUS8rMTRGMm01?=
 =?utf-8?B?MmlzVVFiekx6VjFNWjZnMDMyelZTQjVvYTJVQ2c0eWhlMkFXc3ovNytqL0Jr?=
 =?utf-8?B?cGU3aThvam5vTTZBR0VwZC9XZkFTeEtqdVN2cFJwckNEWE1pRUFWRFN1empx?=
 =?utf-8?B?bXpPMmxTUkFlQ1ZIQ0pmRDRReFZkaWFyL3JXOEp1QW9UNHNSZkpQT2FwZXFv?=
 =?utf-8?B?N0tRdnF1bjYxbWF5WFVud1d4Y3dXSVNnUXpkb0ZBcnIyM0NzWVQwT1FWNzBV?=
 =?utf-8?B?dldabmZ4WjBnRHd3ZmpqL0hSNDRrSHJCNjcvWEh3Zkd0S1JPb0EyV21Lc3Ay?=
 =?utf-8?B?R1BuSjNCYlZuUnJFOVVmdkF0d2tsUmxJdXROSTk0b1lUVkovY1FLK24vOTZM?=
 =?utf-8?B?YW1tM0FNeWt1RURFRHlKQjU3QzREa2lRbUZobVY1c0czK1RFZm1pWHFBTnBH?=
 =?utf-8?B?ZGF3bEFPT29EdGpLTS9PUnNIemVZWWhZdVNNeEliRUNYOHFMb3ViN0c2K0FS?=
 =?utf-8?B?UUVXUnZPUFJDS0lldGN1R3BoUE01eEthWitEUFJmYzRjNnE3QklidWZ2dWVF?=
 =?utf-8?B?K1VhNHJlTlJTWWZvdzc4ZEV4a0ZtclFZQ2E5VUFsMURva20xZjdlNUN1RURU?=
 =?utf-8?B?ZmtyYytvUlJEUm93RU1VN3piNjVublR5R3k2bDhQbUtmdzVDVWN4R29mVy9h?=
 =?utf-8?B?dnB2eEorK3h1dWwzVmx6MFBVTEJhUXFCdDBCY0NPZUQ0MitscUlGeHVhZ05a?=
 =?utf-8?B?ZDZzdHlySHVtcEErdys1ay83bGE3WXIxeEtWQ1ZNZEtWSlFwYXdVN2t0SllP?=
 =?utf-8?B?T2JzeDRib2hJTUJaV3lFekw5RmZ3amtPcUhiSmJMTDgxSVErZktwQXRQamNq?=
 =?utf-8?B?cWJqTnRNQ3NFOXJUWnRCNjFYcjFqK0FoSGJ6WERhRTAvNUg2WU44SUE0Y0pV?=
 =?utf-8?B?QVliV1RzRmdTUU1RUkpRR3pCRDlnS0pkYm5nSkFyS0MwY1hVYyt6em9lSS9r?=
 =?utf-8?B?ODFvY2hmNWtSeXVxT2xCZWRvWGFEWjhPZkl0VG9BQ3huQnZHYXRsVG9zSEdo?=
 =?utf-8?B?aUxWQVJNVzZ6dysrZTZoNllzSVVaa0lUUC9tdlZVUGxyU2xWQ0dkZERmbkQ1?=
 =?utf-8?B?OUp0WWtLWmNkKy9BamtZeC9jdDVzUkZ5ZDdQYmxSdi9IcTdmeitoYmlUbnFD?=
 =?utf-8?B?VEwzcUs0K3Z1N1JQTXdiSTJFbEo2aDNNOWRJaERyWlJPTkVDanNMbkhtWkt2?=
 =?utf-8?B?RUxzNHRSMm9nSS9vOUJueEQwc3RDeGpmU1ZrY3c5MCtYNVJvOHovQlI0dXA3?=
 =?utf-8?B?ZE5peE5BQWxxM2Jwb3lhTUx3WnJhQ1BYV0ZqeEhOSXRWL1F2SkZDN2FDeFl6?=
 =?utf-8?B?bFg2VTZjcmVTN29tMXBvKzlkbUpLMEFsRWMwZzQwdFZkUjEwWldXWk5zNEt1?=
 =?utf-8?B?OFk0dVhlQXAxR2dEeW00RDdBVDBnZmZGQmRXTFUxUG5kUEUzYTNEbzJua3Np?=
 =?utf-8?B?MXVoeHFhS01zSE5QV0s0MEVhdWJEY2FqN3dPamF4QStPbW1uSFBkU3V2VWJj?=
 =?utf-8?B?eXBGd2xDTm9YOFJYT2g4aTVNOXM4eVlVOXJYc1dZTmNiZHBNRk0vNG5Nelo4?=
 =?utf-8?B?Q3hJZkZabC9ML29vNXkzSjBFUk1SK3BjMkZBQVdnYUxGTTBEUExtZ2o5MHFO?=
 =?utf-8?B?TXF5NlhpTmlWL3VzV0NHemJLTmJXQnRZMlA2bTdVOGE3cXZLbnQwd1p1VlBE?=
 =?utf-8?B?b1RaSUV6eElkL0lJa2dKQWluUFpzSHZtb0lnUHR0ZTVKRjF1a1BPU1lqWmdB?=
 =?utf-8?Q?DbmAeUephGbPweIeIHxvndVzI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NFVMYW1Oeitxa1h1YWJIYktsQVRpUHVWQmhqa2RMcUVKMUcrdHdWNDEyaE1Z?=
 =?utf-8?B?dnk1blI1TVdPOWJVYkliQUlCbDg0U2RWSlAyNlNlRE9FOUFCQTl6WGFxTXdv?=
 =?utf-8?B?VlFwMU96WkJVYStBNElPOU95VlNTbTg0ZFd4YllwTDVnaWNlcWtuYks3QmdR?=
 =?utf-8?B?WjlLamRHN2tIV2xzSk10eVhvSFhKVllTUlBiYXhKTmkveCtOQkF2aXQvb0lD?=
 =?utf-8?B?ZHN6Q0loVW0rOXRQYUM2cFFCWTR4aUZPejg2ZVYxN3JiVG4rYlBFejg1UFNv?=
 =?utf-8?B?Um1lOGRQSnRLeFdvYUlJbnlWOVY2R1d4NHhhbW1lWExYNlV6amN6cXRNZzI3?=
 =?utf-8?B?Wkw1eVV5QjdWc1ZudGFicis3TjRUNTNzMzZUMkxwV2lNSlFYU1VZbGdXQ1Ar?=
 =?utf-8?B?UUszNkoyckVYNTV4QlROdDVBZm1iZytScjNyeXZkRU0zdE95UlZ6UGswSmlF?=
 =?utf-8?B?OXp3SC9xL2JPMDhDQTZ6eHgyMmlHVmlZaklhSXo5ZjlVRHgrVExsL1EzcG9S?=
 =?utf-8?B?MUNQaHJhY3ZJdGtMWjJsYXhBTEJESUwzZmZ3N1J4b0h1a2hER2F0K2JmbW5U?=
 =?utf-8?B?WUJweXptVXdnVjM1S1J0WWZFT0VwMktqVzk5U1k0TURPZkdXWGdJQnpDdnI3?=
 =?utf-8?B?TUJZbm9jVTk2Z3BOYTlQTXBjWWtSNHVWRTQwSER6bWV0NXBvYk5tdHZFWGZu?=
 =?utf-8?B?QkRQck1WUWFhdWxFSlljSXJtdTFpNHlNSVU4UHg4dklDWXhYTForc2ZoWis2?=
 =?utf-8?B?d2VFSU4zd2Jpa2xxTm84TVpwTmxGNk42YzJzSlhyYlFta3NwbzI1Zktmejh5?=
 =?utf-8?B?SmdsMlhSVVozSmN6VkdFQTdsUThSRmtpdHhCbEZPQlo2NUpXZGtpc1luaFZ2?=
 =?utf-8?B?MWI2UnFIQ0lqK21yTVJoRkJWdFpJbDNWQ2dTMS9vQVZia2M2SStCcEU0Vktk?=
 =?utf-8?B?QVVYVFVVcXU3K2xyam5VNmNYNS9FWkdWejBxN1k5ZXFkaGxlUnNaaDZNVFJw?=
 =?utf-8?B?UFgwSE5YQ3JWZlZ4ZmVieDFTV0lJUHpuNUY4eHV0cXlsbDFZdTFIKzZjMUhx?=
 =?utf-8?B?V3MyS01Lc1E0ZVBSK0ppYUJBV1YxdkJEaUdpaG96ZWg1bTVLdjFtc0lac1p4?=
 =?utf-8?B?L3ZQZmNNQ1BQTjAvMGtLUHl3dHJERkh3MXJIVnFEbFhKdXMzRnkvYy9nTEoy?=
 =?utf-8?B?YW42NWRrdktwVExidXMzU0NoM3d3TVB3NjFFSzlHbm5Ya1FHRU00dyt0R0tx?=
 =?utf-8?B?dTM1OUtSRVhsME5GbW0weGNucUJGTU1TeFdYNVA4bWZmSG1Mdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d880ad8-aca0-4f02-fde7-08db04b8d363
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:00:07.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuB5gBcrlZxEPHRin6blj4Hntpv6ja1tf0/JOyAFCvvarxwWI3H2ZGZ2j0Kb9SBlmCNFAIxX52lCjnShCqxE5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5553
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020008
X-Proofpoint-GUID: ffqk07tnZzTBzVDiStL_wjuEJIgM2Xp0
X-Proofpoint-ORIG-GUID: ffqk07tnZzTBzVDiStL_wjuEJIgM2Xp0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 1/12/2023 9:24 AM, Eugenio Pérez wrote:
> It's possible to migrate vdpa net devices if they are shadowed from the
>
> start.  But to always shadow the dataplane is effectively break its host
>
> passthrough, so its not convenient in vDPA scenarios.
>
>
>
> This series enables dynamically switching to shadow mode only at
>
> migration time.  This allow full data virtqueues passthrough all the
>
> time qemu is not migrating.
>
>
>
> Successfully tested with vdpa_sim_net (but it needs some patches, I
>
> will send them soon) and qemu emulated device with vp_vdpa with
>
> some restrictions:
>
> * No CVQ.
>
> * VIRTIO_RING_F_STATE patches.
What are these patches (I'm not sure I follow VIRTIO_RING_F_STATE, is it 
a new feature that other vdpa driver would need for live migration)?

-Siwei

>
> * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
>
>    DPDK.
>
>
>
> Comments are welcome, especially in the patcheswith RFC in the message.
>
>
>
> v2:
>
> - Use a migration listener instead of a memory listener to know when
>
>    the migration starts.
>
> - Add stuff not picked with ASID patches, like enable rings after
>
>    driver_ok
>
> - Add rewinding on the migration src, not in dst
>
> - v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.html
>
>
>
> Eugenio Pérez (13):
>
>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
>
>    vdpa net: move iova tree creation from init to start
>
>    vdpa: copy cvq shadow_data from data vqs, not from x-svq
>
>    vdpa: rewind at get_base, not set_base
>
>    vdpa net: add migration blocker if cannot migrate cvq
>
>    vhost: delay set_vring_ready after DRIVER_OK
>
>    vdpa: delay set_vring_ready after DRIVER_OK
>
>    vdpa: Negotiate _F_SUSPEND feature
>
>    vdpa: add feature_log parameter to vhost_vdpa
>
>    vdpa net: allow VHOST_F_LOG_ALL
>
>    vdpa: add vdpa net migration state notifier
>
>    vdpa: preemptive kick at enable
>
>    vdpa: Conditionally expose _F_LOG in vhost_net devices
>
>
>
>   include/hw/virtio/vhost-backend.h |   4 +
>
>   include/hw/virtio/vhost-vdpa.h    |   1 +
>
>   hw/net/vhost_net.c                |  25 ++-
>
>   hw/virtio/vhost-vdpa.c            |  64 +++++---
>
>   hw/virtio/vhost.c                 |   3 +
>
>   net/vhost-vdpa.c                  | 247 +++++++++++++++++++++++++-----
>
>   6 files changed, 278 insertions(+), 66 deletions(-)
>
>
>



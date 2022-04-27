Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7C511394
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:37:49 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdBE-0007St-GM
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd3z-0004xP-Tx
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd3w-0005cf-Nq
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:19 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R4kOEm025802;
 Wed, 27 Apr 2022 08:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=04IYN66LBDQsTtrhgzzpCjgJ6zQTGWL1G9q75BRSrIk=;
 b=FswmxK2GADEamFjSzjMJnbTB+WpV/rv4XTALslMd9664M1RvJXt44TVaVkvp7041I7Px
 cvDlDmlgtI7fz4Lfwu46UCoVkQ58PFAUK80wbYuAaGtTpnAFKHVmDhVgl/VVO6U25tHg
 GuNT5kXxPh5kaOYeESVOs05ZaJNpZGqHMRqpUZH69qT+lUS5mblcNJGXKOocEh4efFPR
 cEdphOupaHFL4Rgkbz5cxSojlyz4p+uznqlA8hquRqphjEFM1b5oG8FllF9FRR30Niwd
 wJzdD1kKJQpCyuiAwBqZ2hSW9ZvP0igojCwgq9sHMtB6fvWT9R59Fo4wrkyrTpWxOk2U Tw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb1mrcka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8AZQ1011595; Wed, 27 Apr 2022 08:30:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykf02n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPKTwYqkC2nWc2rX9ecsdqJvyicxOgwPLPRD0TX99Gw5Ygwej/KmxnSkgEGukqVnOZSEkflw18gzOhCrYX903nq2u7Sg6kfOnlYX1OuJ2/Xo47mikOezMMl7FoHiR38BHPpoFqLWaNCUa02QA7jzSWVTk2YfqBWrMzcvTop/5LQNde2zWVYHsyu6gkZKXwmhpVdTYolkdiQ9BxGPWrVHhieIIX2sXOn9F8G80yDmhfDNCjKs+nbRROhx3PUeLj7NbUvHcpaY8+Uyb1n6FZNVKzl9VoXhUqZTbe1bVDoMzLUz3L06dI3AgoVmVZMQw+oN67tqGK5Og81mLVkTqWeXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04IYN66LBDQsTtrhgzzpCjgJ6zQTGWL1G9q75BRSrIk=;
 b=C28XRazyrCY26hbGlyRSNgCBT821AWo5bmk1mnAIFBBCWecERV0bacZtKDVhrLpbjpIa6aoLyJpj/OecVk/c8Fy/tuoe0E/u1Izf3RQByvb3EECreRkIWlUrT4jG22eV6coRRTTTXPh8Rj7Yc4sMjyxknUA+NPYNauVmaT0TBWj0ODWG53RIjc9ECVAkHbccu6gNvWk7Vf3qv+4sNwvi0i5dqFpPaQgUaw6Gb+1pcOgZ6B50j+CkVeVqtZhoRu2B4210j0ed0Y3lGCpOLvavgvf13mNXSnj4r+RqoYsWmGhn9psiFPLZMU3TV6pRp4k6FvgBzovi/IjdkheABXXrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04IYN66LBDQsTtrhgzzpCjgJ6zQTGWL1G9q75BRSrIk=;
 b=bAaKjb3nfEGbMVfXX7zEIaEjNEQiNZu6sQ+ItowdRaKhyN3l+uvs0pgwTdrJg+Tnmxj3ZrzaYpN9xFbY7g+kJphDOLhyWj3TVA3ZysccTuLrZODqQV7liaX0ho01pfVOI5D2zSyaGUwOuzC53tOWEy9OWvo8hmx7TwTw/PuGTUk=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:01 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:01 +0000
Message-ID: <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
Date: Wed, 27 Apr 2022 01:29:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df151b45-502f-4932-1d04-08da28281f0b
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB2007E000A2C44D166ACFDCB6B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qsqF7cv9ivu62CapZhCjZz16ZQEAy09ZOKMc2YI2Af9iy0zehlLbbEjfIEpUREVucAUf+i9TLVMQv4hkV5cEnoSMctql+yd7i9Xsfo6knpdrNGxys5yt+BZ49scMMRkhxkkz++wScySLFS2FYMBh4DWcPPV0q+fmfL95jh+9ny2iJ66Wl8W9sJ07ITkyA8xch2j1PJYFf4F5rWTQiIoKxQc4nw2TVsOS8zT8fEl+KBd+tHzD7SnilYP/xlVmL5u52eEqwXWRfFFaNAb90LC1LaIzPjC7BmEgsMG45myPTFbeme2ZIcVJqn3wDxU1tjalqLrqptdMyqDkD8hjh8xRXjgo2Mc2JxQ9kHPINTwJGV1v1av5jsCKm0U64i3augtngtYY+H/a4Jbu8xgtq+N3q9FAmHgyZe0JJQJSAwGUPcLqzcKHsEdHgbVy3ey1Y9Zu6Tr9e1sWomj8/XQeonMecVwA9xWaY5ZWtlR5SRXALmtDAWj6KMIaZ7t6KTM7fJ4vCMUTjwchNJMvtD6BzAXkoqAyT9dyniXnJQNuQDt/VasNfT8N074wvG61ASFLoa6H116NDCX0vY6+99+8zPW7eL2xNe+HZ6z+g/vivGR6eiMnmlBqOqOXoufiOn/8Nr5m6avfTeFPEgx6iVDLsOJjIttNSQG3OfGXkD4pmGu9z7bpVIYy5ijeX475XHoVfNbxHJcyVKr8MzcSFpGZJ9Zo3Clo0h16AIRNYhPmFLhaJ1YllNfcTN/wfNrhcoeALHY6mrE26LMGq6co9OpBDH1EceLZ8aD+kOvAN0ShutyaI40xcP4E/OklrWC7DmjXdJBN3LIW30nxIkzdee98ygu9emX7uNL3o2D2gosjAoyzhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(36756003)(2906002)(316002)(508600001)(38100700002)(31686004)(36916002)(4326008)(53546011)(66574015)(6666004)(6506007)(6512007)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(86362001)(5660300002)(31696002)(8936002)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFRK1ZvM3M4ODJRWVhWdkFIMkxTVXJCb1FySzRRVlVtMW90bGd1OWlnQ01r?=
 =?utf-8?B?QnlueUVlKzAvZDdvNi9mTlVlK2tMUnhzaXNESWZFTWprWkMxd1crQTNINXcw?=
 =?utf-8?B?T2lQSjFLQmcrWU5LTGRUQkZLT2k4bFA3bEhDd09HM295K0VmK2ZpbW5OK0pM?=
 =?utf-8?B?dUxhRjd4QlJUSkFsbDg2ZUp5bnU4dEhWeTViczMvNUljbHFTUjlmencxZzND?=
 =?utf-8?B?SU4vSklqUnNsRHdRazZvdW5YdC9rck95ZHkwZFpQTUJnSVpaUXhqV3VkcDJH?=
 =?utf-8?B?QkVKNThGb0hob3Fxd3ZCdkhvVm54R3NENDVjT2hNeTBod1lXNERoYlp0bXBM?=
 =?utf-8?B?MWYwdU4vNTdUcE1rem9jZlBSdWRjaW1pTGxSWktqVGlVMWN6ci9UQUtzQ3FH?=
 =?utf-8?B?MHZvQlplZ2xYaVV1ajdUamxBWlFvbG8vMmF0aUR5Q0EvM1BNUWxoem4zM1dy?=
 =?utf-8?B?bVdqSzh6dHZONUc3OElpdTJFTWFYekxNVlJGTitQYW56bDhFNjVOSTNnVFBK?=
 =?utf-8?B?aWt0K2plL3QzbVROSXJyeXJxUlpDTHI1RDV4OHZEWEdLSlRsTktKRVg1Vytn?=
 =?utf-8?B?QXA0OTZPbDNwY1pPMzhVRUs3eHJsR1gxSDNHQ1B4T3NJNFdoODAzSjBBblo2?=
 =?utf-8?B?dW9sWDlIMnhtNFlQaitEbDkzUGV2M2t1SlduU2tBeTZrUE1ySjRKeGtLaGpq?=
 =?utf-8?B?dHY3Q0ZpRmVIMklLTnUzQkMwdTV5bktuZE94NXRiMGRGWjFta0pWY3VxaXlk?=
 =?utf-8?B?R0w2THBMVkdlK1VzWWNURmY5ZGl0azZpMzBwck1XTytsaGRkZ01USktrZ3l3?=
 =?utf-8?B?RnpiWW9tYitqbCtoQXpuc1NYM1BacldzZjdBN1MwVExFeGNRRmw3M0NNNGxD?=
 =?utf-8?B?Q0V3T3ppYi9WZ014b0o0VlJVZytKVFFCaFdxZ0Y1T1I3SlgxR3RtenFOaTJQ?=
 =?utf-8?B?SUdjbkZVWFBFL3lndUJQakpkTHNEekEvYjUzNHZ6eWdHTjQ1RVdZVEFDRHVL?=
 =?utf-8?B?T2tHMXhlb0huRjExeTZmbmFkRmhiWGZsbVh0MmwvUW0rY1RnNGdqaHJ3WmRS?=
 =?utf-8?B?akxuUGE3bkxkblYrT2lETGliZ2NWRmRHejRDaEpZcU9HRHk5aThlYWlRNmxn?=
 =?utf-8?B?L2N1dGFMYjh1VE5qbyt0VVh1dmEwNnNodzlVUExXVVcvZEtXUzgxOStnaE1Y?=
 =?utf-8?B?dDV4dmcrTVpnNHREK2RvVzdLZEpNeVREcXpsSUF5VVpMUUR3b2pjSngveDFv?=
 =?utf-8?B?cTBVdTVCMFJDMkZqS1B5VHlGSHRhTENwM2tNVTY0Sm9YcjZNK1pwNUpPODJE?=
 =?utf-8?B?OW9Fb2QyZUNVTExDeG1OeFV0ZnpyL0FsWk1VZVd2OXYvL3ZaRm0vYlVqVXFL?=
 =?utf-8?B?YUE5NUkzd1d5eFByenhGbENYY1lTbzZpWGhIck50RTBNdGQ4cy96WVhBYklF?=
 =?utf-8?B?T3pCalBFMGxLd1R4YW1ZU3lrUjdOaWVBdWtjcWhLUjRORHFybDVFcEovcFRt?=
 =?utf-8?B?MzFSQi9sOHhSMS9mZ2g2dVhaQzlmc1VJWXYzU0dwUUwzcmFhNjZBWThsbWlB?=
 =?utf-8?B?MVIwRmpZMTdSc3dmbGNIY1M1eE5mNVF3S0RNYkFPOVd6WCtuZ0VxM3lqQyt5?=
 =?utf-8?B?bVFxM3pXSC9UcXNVY0E3c2g1a0QrT25Bd1ZLQzA3NEpMYkFHWHVvYUF1NDhl?=
 =?utf-8?B?aXdPcHh6YXE3RGNOV29ZenFuS1F2UkhabXRFa2NrajdzWEF2MlNUaDIxekNV?=
 =?utf-8?B?SzNUUmJiM0RIU2VOK2l5Z1hMb1VocVpNWUxGRmxPREVnZXJmZnhVRTVTSjBq?=
 =?utf-8?B?dFhFMy9MWHl4am5HTmszeDl4SFJleHZyWnVSaDVLVnN4cXQ1NmVqeTZNMTgr?=
 =?utf-8?B?MWVQazlmMmYxWElPNmxBYlZsRzhJcnV0TEMzSXdBeFhySEVMSk5RZjVEaldo?=
 =?utf-8?B?ei96VmdLdFpHMGhmcTIxY2ZhZzduL2ZKTE5veGVJZFc0S0gxVkpwT21qQ1dC?=
 =?utf-8?B?YVR4Vk9ZeFdKZVhIOXR0TEY4VVNkUjNBUlAvejIyRlkvT0dNQ2hBeng0SU1P?=
 =?utf-8?B?WWh0eGNQckdQcFhQaS90anMrTFdsMVFJQWJwRTNaUGRic25SZ0JZeXRtUG5y?=
 =?utf-8?B?dWxxWERLVGVpRnUzQi9vSDZEWCtFeHJzbnFVNk85aWdTZE1ldFh3dFlWZzBX?=
 =?utf-8?B?QXFmTk9jYnhaVkdxV3YxcUZ1RklCakZaeSt2RVk0OUVqM3VpNG90cXlSUzBH?=
 =?utf-8?B?Vy9uWU85WWtDMXhXM2xYTUpqRzNQWTBtZG0wZlJlR1NubHpvdWxBSExqRkR2?=
 =?utf-8?B?M3gwSEpoOFo0VHJzaVVNaUo5ZWJueGlWekNaWnM2YkFyZHhCbU5xQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df151b45-502f-4932-1d04-08da28281f0b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:01.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBD6HOpXpkCQdAB1X0s2BdpzBPRhi8cmT6cYr2Fevw6+OSRpSNwFhwUWWVk/fdAIdXKgXit6dTU20yVyXdgcqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270055
X-Proofpoint-GUID: GroiSpfq7sQuHCCw5jg-_mvVVlhBFuSS
X-Proofpoint-ORIG-GUID: GroiSpfq7sQuHCCw5jg-_mvVVlhBFuSS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: eperezma@redhat.com, eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/26/2022 9:28 PM, Jason Wang wrote:
>
> 在 2022/3/30 14:33, Si-Wei Liu 写道:
>> Hi,
>>
>> This patch series attempt to fix a few issues in vhost-vdpa 
>> multiqueue functionality.
>>
>> Patch #1 is the formal submission for RFC patch in:
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$ 
>>
>> Patch #2 and #3 were taken from a previous patchset posted on 
>> qemu-devel:
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/20211117192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$ 
>>
>> albeit abandoned, two patches in that set turn out to be useful for 
>> patch #4, which is to fix a QEMU crash due to race condition.
>>
>> Patch #5 through #7 are obviously small bug fixes. Please find the 
>> description of each in the commit log.
>>
>> Thanks,
>> -Siwei
>
>
> Hi Si Wei:
>
> I think we need another version of this series?
Hi Jason,

Apologies for the long delay. I was in the middle of reworking the patch 
"virtio: don't read pending event on host notifier if disabled", but 
found out that it would need quite some code change for the userspace 
fallback handler to work properly (for the queue no. change case 
specifically). I have to drop it from the series and posted it later on 
when ready. Will post a v2 with relevant patches removed.

Regards,
-Siwei

>
> Thanks
>
>
>>
>> ---
>>
>> Eugenio Pérez (2):
>>    virtio-net: Fix indentation
>>    virtio-net: Only enable userland vq if using tap backend
>>
>> Si-Wei Liu (5):
>>    virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
>>    virtio: don't read pending event on host notifier if disabled
>>    vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
>>    vhost-net: fix improper cleanup in vhost_net_start
>>    vhost-vdpa: backend feature should set only once
>>
>>   hw/net/vhost_net.c         |  4 +++-
>>   hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
>>   hw/virtio/vhost-vdpa.c     |  2 +-
>>   hw/virtio/virtio-bus.c     |  3 ++-
>>   hw/virtio/virtio.c         | 21 +++++++++++++--------
>>   include/hw/virtio/virtio.h |  2 ++
>>   net/vhost-vdpa.c           |  4 +++-
>>   7 files changed, 45 insertions(+), 16 deletions(-)
>>
>



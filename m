Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8556910B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:49:27 +0200 (CEST)
Received: from localhost ([::1]:34546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o999T-0001cf-1W
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o996w-0007kg-41
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:46:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o996s-0005z9-AN
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:46:49 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266GQb5p010481;
 Wed, 6 Jul 2022 17:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=OQAm4MmPXkRx2D1lhKOXHjzkCc4KBbEunp0erX1clEU=;
 b=GBO4k7sHHAi/t+OBJlGSU9h+LdyMP4f+u9/AU4ruRLwVR6j7Pd936u0kzXn9L3zjuIIu
 O7xFBde55tquyMjKxZjAQlSY4fh+hKwoppzymWig0FFyb/fAnEwthZi21KFKSlk6ChNQ
 pSlcBOj1ZAbJ1tuEZLp8o5I2RvxkgRHe70J2Xrht8pc6ffRM8wATU2WXtBaWWGOFU8Zn
 77gxYjD8L/RjAw2PLeyUl2uYdGB68x6Ih4VjMfSFOWXtvXAwyosqBtC9uyEyaF0pGI/i
 O2ZQ39QcYrAddfK1jByo3UsmEjFV2YSblwxo/w6yVKVrd7lP+BwHuhVTPxZZOQRbK1zl sA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyaqs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266Hdq3D026708; Wed, 6 Jul 2022 17:46:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4udervsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoLJN0gk+/SFSlVdnPS8c/+NoEYwfLhWgnUBxRyFc5rFLxolTFRYy5cQ5qQ/le8n1BRRD1n4RR1AyGEjiqypDog3yf9/2LXSjQsAnX5pRkzSCnuI+LcclVgd48/UGmumsmxku0PvOS+Q/sAv9dHZ1Seb68o/CfvQWxsLZEJOlyA7yqBWSZ5C/y0Sc3HPmR0L1EwGBvIdyfLNJqwhE+nnZqcm5tkCkxDD8XAqi1jewFrksfvoQQaNLHP40JOOM/PQndzT+wBi1jrchcGd1wnIoiDGNHKpO7Trfbd28dGp9t4GTREmxjtWkbp1PurBv1ZGkZcWQxTzfcGsNSJWVVl4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQAm4MmPXkRx2D1lhKOXHjzkCc4KBbEunp0erX1clEU=;
 b=i99bGIRHf+B35GDBOnkPxuIpouNXVnvW4x9xrHt0Ecyk4606zbMOh6HdvqZpN9AFTckbu9WyDc229HsfhZ0zeSqcvdZ3ZxpbXvSKjJTVYdBgVvIo1ZB74mgqfbBLIWWJxmvBYAVWIQW6MnBdWjfafeyt5+7sMdJASffbBMTdX+yXZ/GLk1pPVZyHXs8qdGxzztvpMAR4H2eNc19Mb5TVxXpMDjqIjuQ40NN4tW1Co3x/MUkiBvvZRYvYvvpTbCXwlvgtgVIAvLYrwRkKWONpEDgQ0dNk2YmNE85vIMeCzeYYWT4uI3SBENIKaOPtVeDLRZMxJnmcY9YIpeUyUOR32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQAm4MmPXkRx2D1lhKOXHjzkCc4KBbEunp0erX1clEU=;
 b=j+RWb6M2XVCgp1GggEmKJcnnbySDcek9T/mE4YmoxKHhAIRgILD1XYx6HmId9d+jN7M828zLg0ZDx48yW9Py/wsL4eT0hvak1m0A2e2gihcWUV4pFmHz2laRdNtyO2hovE7q5uCVq5JLSnjNsQW+cYTXRNGjpg3ZRJxr5WJ0W2U=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SN6PR10MB2671.namprd10.prod.outlook.com (2603:10b6:805:46::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 17:46:12 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 17:46:12 +0000
Message-ID: <39edddb1-5c2c-355e-69b4-1cfaf365c229@oracle.com>
Date: Wed, 6 Jul 2022 13:46:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 28/39] vfio-pci: cpr part 2 (msi)
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-29-git-send-email-steven.sistare@oracle.com>
 <20220629141913.0a6ad118.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220629141913.0a6ad118.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 583081bf-dbcb-4aa3-f09c-08da5f776a7d
X-MS-TrafficTypeDiagnostic: SN6PR10MB2671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IVMZeqYtOicS7gSsMIyEM+yhwqmi3JPzXSR0KB9TnyE2uy6lFWiyEzX3VxlyNfXKm5Co0vnt3RNDiU8yukYlvWPAjaLdSYugJCe5VK8SbQVarVNgx1HyUfacFflLxIUVsg87TkS1+x2AmnWjg2LhmAY8Pyfagwg9+1RYxBRxhgT+fu2yDncHpPL/d+I1ZhPhHzCXv2v+Ekr5WhLyiiTeshT98gCIrhE3htdFyBuSkP+DV86quAZnKzAiigStCce8vcNw3SUCew9cEcV1VD97Zk6wuKpmxMGwRFupenLlZ9gv4C2e7/vjb5MoxaalRM4sXUs924sglFauXD5TP6LRIigj6C0+iiyjzf15jfdkAsy/YFrJP+OACQ8n69e2DvLMpQB4Xi6k+OwbuAdeYTTU0QApunBksw2W+EZkCsB3MOu2gYT9H9lEUO8aeXWesf3gHEUwl+rnFu1AF+1fI0pwIeYb0MPnB+S3iMb3VUvylSyuSJ0qnN1zJqdgmIxp9IGH3YY76W1MNT7IGMXItW4DDorxakX+o99HvkRNkblrKVez7z30gftyLVWINAJ+mm/DZElk+a1l/254qk10UVBImXfTffdQcqbLZ2tP+VAszsUZy6PgjWuaJZPd2Y1fwu7Zg2rMM4tjZ5YqCB2P6QKKiONNbMrH7nlU7NQnb/MwiH2M5j6yLT6yhS2ml8hw35XZAfzDCN/EdVc9GRLIpPMcVfEsihsJyZZROsdmmMdYjuNjv4EL4qQAvnyb2An/WGE/jHWy5Ex9eNFTpzmmcrVvvby2WH9wRrKsRnwEPmCSMRgeIK7PBTJfK8CZQ2HxOP28gtTRcBIBpP0H4D87SL9OIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(346002)(136003)(366004)(2616005)(6512007)(7416002)(86362001)(44832011)(8936002)(38100700002)(54906003)(6916009)(26005)(31696002)(31686004)(83380400001)(36756003)(41300700001)(2906002)(66476007)(53546011)(8676002)(66556008)(66946007)(5660300002)(6666004)(6486002)(316002)(478600001)(36916002)(6506007)(4326008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3E2RC9la0FBU0FUSWtkWDlXQUN1YzYzbFkySWdGY0lMd092T3FjOWxUaUtZ?=
 =?utf-8?B?N2p3bGFhVHNhYXFYUmRxWmdkSmZQQmo0cHNvdFdYeUNGcENLdjFQVzRGeGtp?=
 =?utf-8?B?UjRTM0EzUFlVeGFPS3dKejd0R3pGQjdqNy8zeDhlckhaeWRIbDJOVllTUDJj?=
 =?utf-8?B?WWVWNzltQ2RucWVBa2ZoMi9zbXNNUFdrNnlEZWp5MXQ1WmgvTXVQcENraXBB?=
 =?utf-8?B?eW1Pb3BqckJIOU9MQ3BXYmlvci82RCt1Q0pBT3UvV2d1Z0oraWhUT0g4L1Br?=
 =?utf-8?B?bzdlditwSzJIRTRvakNkNW5NRTFWMFpSQnFFT055L0E5TS9sUjYrRzlQWVdv?=
 =?utf-8?B?QXJvWHlyU1VCUzNWWk45Q2Y0aDViM2d0NTAyc3BzTWJDWnpQeWRwUU51SlpB?=
 =?utf-8?B?aFNrQU1zNlJKV3FmZjJ4QjdiaXlOTFVBNERuTkNxaEpoeHJEZ0Y5UXpocUxi?=
 =?utf-8?B?OEM5TzZjTmdaQ1RmUU93R2JIbHMralVBNnNZZXk4emFySmgzQy9sTzlCVkVT?=
 =?utf-8?B?SDJMc3FRa3RTekFxejloeGhWaS9XMEVzSFQxZUNNR3RGdWJ5dG8zTWdDb2U4?=
 =?utf-8?B?M2JTWlNpdk5yajRyRUM1QjkyKzZjSC8veGVjZU0reUUxL1lndmVCd3c1eWM2?=
 =?utf-8?B?SWJXUzhkZ2JOVEZMeGpNb1A4eUhGWkhRWnlSNnAzZk12ditCOUFyVExaNEl4?=
 =?utf-8?B?SmV4c3NVa1JxbDdhRDZsRjB4TEpNTU9PeVBrRG56Mkt1TGl1Q0UxUSs2Y0lr?=
 =?utf-8?B?RStQYzJ4Z3IwUUk0eU5kc2xmTzhOZC9HUmZHdlI1NmVMSXVuMk13YW5ncHVW?=
 =?utf-8?B?VDR4UW9KbU5zZmM5QW1oZWkrRTZZbnlleGpSbmV4Sy8vbzJ6U2JxSUUwWS81?=
 =?utf-8?B?dmQrTHZ0VDdZSjgwSi9nL1VrcU1jL00yTWxBamlwUjh0VFZXbHFiTThTTjZL?=
 =?utf-8?B?bUZDUnBVa2tvSFBYMk40MFh0ejZMeXdjdUVuT2lwbEZnbmtFbGtOdDBKUnZK?=
 =?utf-8?B?UG9hUkpqdTRRVmZvVCtSekFKd1dSakhlVGsrOG1aSEJEV0NINUxYTVhuaTFD?=
 =?utf-8?B?czVvYzlmR0FFRHJlOVZ6Vmh0SUxkYlpwbnNraDFlaEZ4VFR6WW5yNnZrSjcy?=
 =?utf-8?B?ZmJ0eDlXenFBK0FmcW1WNU54c1NSeVc1Z2g5Q3c1NWxBSWVoNWNPbzQyNkg1?=
 =?utf-8?B?N1hxVXd1REV0UW1NS2FET2ZvbE9UUFJzRzhJaXRKMythVDRxeGdQek1HNEZx?=
 =?utf-8?B?TkVTM0FBb091ZUlqOHRDalVyL1J3N21EZmxJb0JlN3VMTFRHYXRmemowRzVU?=
 =?utf-8?B?VGtsOVBXc2JPS1V6Q1VJYlNOR1RrMHdiNklhQWNsZGR1ODVYZlN2VmE4ZlN0?=
 =?utf-8?B?dGVPWlN0TUJ3VEE2OEdFQUd0SS9LcURSWUxZcGJZZlJ4OW05bDRhaGlIYlFq?=
 =?utf-8?B?T1lIc2VuWWZhdEhNS0pTejJKcm1rekF1blVnQUdFSnliNnQ5T0hva3lPQnV5?=
 =?utf-8?B?VmdCRGxIZVZhTksydHZlUnZRb01sUFZsUjBXR1AydUkvRUwxWmdBdFhnUGYw?=
 =?utf-8?B?blZoMGlSdCtEZERtK2JRR3psVU1yY3NFV1NCVkF5ckVyVmNXbDdScHFvWXQv?=
 =?utf-8?B?dWtNQVg1Q1hYZU5qNk1pbGMyRnlDWmJXSVk2elZzL3hJamhyOWcvWlhCY0hL?=
 =?utf-8?B?eDhobTI3bVJaeHJ5eStVbXI4TzE5TW9hazRZOWd2djkxOWhZbFlITDlvUTBO?=
 =?utf-8?B?dGxiTkFOSi9wWWI2SjNWU0JaMXdaQnl6aFg3V0FCSm0xdkozZ3h4eDZFcDN0?=
 =?utf-8?B?YlBGaFUwZnorUXpQVHYwUC94ZjdmZkZ4Vno5d1VCbE13d0NvdTNXZEhYYlZa?=
 =?utf-8?B?disvcXJITWdSVjJVTU12SGRtdHI3MmhrWlR6N3ZrUEFPOG9Cb2J2VzdaenQy?=
 =?utf-8?B?S08vd2dUVW1BZS9JMFY3dWVJK1JOdzZMZnBtYzJwcExNZTBJWWZwSnMwaVRo?=
 =?utf-8?B?WWIwS3FYVHJmQnBxcDZtZ0pBOWZ6UkhnNlVhVld3MmtEVEhjQzBHeFg5Y0VU?=
 =?utf-8?B?Q2hsYi82aEFpSEFYYVhhTTVNempNWm5lQWk3eTdPQVQ0d3hqNUs1NmFGNXdm?=
 =?utf-8?B?eGw1MUorT2cveGNwK0dyWDEzZTViVmRyUmFyRVNsVTBUeEkvSVY5MU1ReDl0?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583081bf-dbcb-4aa3-f09c-08da5f776a7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:46:12.1231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxcoFLBc5x9bLK8EC9H9ks8zWbYbXzNxwTlI3clIkIU4HPwU+1mUDDJP3CCdKiZYpcx5quU1W7SgcyMNd4IG6v6KdDoBc8FVD7/dkzmGQ1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2671
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_09:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060071
X-Proofpoint-GUID: kxRFqzf04TTIrwaMsAMk0thdEUlfL6Hs
X-Proofpoint-ORIG-GUID: kxRFqzf04TTIrwaMsAMk0thdEUlfL6Hs
Received-SPF: permerror client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/29/2022 4:19 PM, Alex Williamson wrote:
> On Wed, 15 Jun 2022 07:52:15 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Finish cpr for vfio-pci MSI/MSI-X devices by preserving eventfd's and
>> vector state.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/pci.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 121 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 237231b..2fd7121 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -53,17 +53,53 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
>>  static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
>>  
>> +#define EVENT_FD_NAME(vdev, name)   \
>> +    g_strdup_printf("%s_%s", (vdev)->vbasedev.name, (name))
>> +
>> +static int save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
>> +                         EventNotifier *ev)
>> +{
>> +    int fd = event_notifier_get_fd(ev);
>> +
>> +    if (fd >= 0) {
>> +        Error *err;
>> +        g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
>> +
>> +        if (cpr_resave_fd(fdname, nr, fd, &err)) {
>> +            error_report_err(err);
>> +            return 1;
> 
> 
> Preferably -1, but the caller doesn't actually test the return value
> anyway :-\

Per my previous email, I suggest that cpr_resave_fd return void, and hence
save_event_fd becomes void as well.

>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
>> +{
>> +    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
>> +    int fd = cpr_find_fd(fdname, nr);
>> +    return fd;
> 
> 
>     return cpr_find_fd(EVENT_FD_NAME(vdev, name), nr);

That leaks EVENT_FD_NAME, produced by g_strdup_printf, but I can reduce it to:
    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
    return cpr_find_fd(fdname, nr);

>> +}
>> +
>> +static void delete_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
>> +{
>> +    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
>> +    cpr_delete_fd(fdname, nr);
> 
> 
>     cpr_delete_fd(EVENT_FD_NAME(vdev, name), nr);

Ditto.

>> +}
>> +
>>  /* Create new or reuse existing eventfd */
>>  static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
>>                                const char *name, int nr)
>>  {
>> -    int fd = -1;   /* placeholder until a subsequent patch */
>>      int ret = 0;
>> +    int fd = load_event_fd(vdev, name, nr);
>>  
>>      if (fd >= 0) {
>>          event_notifier_init_fd(e, fd);
>>      } else {
>>          ret = event_notifier_init(e, 0);
>> +        if (!ret) {
>> +            save_event_fd(vdev, name, nr, e);
> 
> 
> Return value not tested.  The function generates an error report if it
> fails, but it doesn't seem that actually blocks a cpr attempt.  Do we
> just wind up with that error report as a breadcrumb to why cpr breaks
> with a missing fd down the road?

Thanks, that is a bug, it should have been:
    ret = save_event_fd(vdev, name, nr, e)
... but per the previous comment save_event_fd becomes void.

>> +        }
>>      }
>>      return ret;
>>  }
>> @@ -71,6 +107,7 @@ static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
>>  static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
>>                                    const char *name, int nr)
>>  {
>> +    delete_event_fd(vdev, name, nr);
>>      event_notifier_cleanup(e);
>>  }
>>  
>> @@ -511,6 +548,15 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>      VFIOMSIVector *vector;
>>      int ret;
>>  
>> +    /*
>> +     * Ignore the callback from msix_set_vector_notifiers during resume.
>> +     * The necessary subset of these actions is called from vfio_claim_vectors
>> +     * during post load.
>> +     */
>> +    if (vdev->vbasedev.reused) {
>> +        return 0;
>> +    }
>> +
>>      trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
>>  
>>      vector = &vdev->msi_vectors[nr];
>> @@ -2784,6 +2830,11 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
>>      fd = event_notifier_get_fd(&vdev->err_notifier);
>>      qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
>>  
>> +    /* Do not alter irq_signaling during vfio_realize for cpr */
>> +    if (vdev->vbasedev.reused) {
>> +        return;
>> +    }
>> +
>>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_ERR_IRQ_INDEX, 0,
>>                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
>>          error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>> @@ -2849,6 +2900,12 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>>      fd = event_notifier_get_fd(&vdev->req_notifier);
>>      qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
>>  
>> +    /* Do not alter irq_signaling during vfio_realize for cpr */
>> +    if (vdev->vbasedev.reused) {
>> +        vdev->req_enabled = true;
>> +        return;
>> +    }
> 
> vfio_notifier_init() transparently gets the old fd or creates a new
> one, how do we know which has occurred to know that this eventfd is
> already configured?

The caller can check the reused flag, which is set iff an old fd exists.
I could pass reused to vfio_notifier_init to assert that, but in some cases
I would need to pass a reused flag down through several functions to reach
vfio_notifier_init, which just seems ugly.

> Don't we also have the same issue relative to vdev->pci_aer for the
> error handler?

Same answer:
    vfio_register_err_notifier()
        vfio_notifier_init();
        if (vdev->vbasedev.reused)
            return;
        vfio_set_irq_signaling() ...

>> +
>>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_REQ_IRQ_INDEX, 0,
>>                             VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
>>          error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>> @@ -3357,6 +3414,43 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
>> +{
>> +    int i, fd;
>> +    bool pending = false;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +
>> +    vdev->nr_vectors = nr_vectors;
>> +    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
>> +    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
>> +
>> +    for (i = 0; i < nr_vectors; i++) {
>> +        VFIOMSIVector *vector = &vdev->msi_vectors[i];
>> +
>> +        fd = load_event_fd(vdev, "interrupt", i);
>> +        if (fd >= 0) {
>> +            vfio_vector_init(vdev, i);
>> +            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
>> +        }
>> +
>> +        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
>> +            vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
>> +            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
>> +            kvm_irqchip_commit_route_changes(&vfio_route_change);
>> +            vfio_connect_kvm_msi_virq(vector, i);
> 
> 
> Shouldn't we take advantage of the batching support here?

OK, will do.

>> +        }
> 
> How do we debug if one of the above fails that shouldn't have failed?
> Should we have an assert or change this to a non-void return if we
> cannot setup an interrupt that we think is configured?

The path above ending with qemu_set_fd_handler always succeeds, because:

    fd = load_event_fd(vdev, "interrupt", i);
    if (fd >= 0) {
        vfio_vector_init(vdev, i)
            vfio_notifier_init(..., "interrupt", i)
                int fd = load_event_fd(vdev, name, i);
                if (fd >= 0) {
                    event_notifier_init_fd(e, fd);      <-- void, never fails

In the kvm_interrupt clause, only vfio_connect_kvm_msi_virq() can fail.  But, it
returns void, and other callers also assume it succeeds.  Good enough, or do
you want to do better here?

>> +
>> +        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
>> +            set_bit(i, vdev->msix->pending);
>> +            pending = true;
>> +        }
>> +    }
>> +
>> +    if (msix) {
>> +        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
>> +    }
>> +}
>> +
>>  /*
>>   * The kernel may change non-emulated config bits.  Exclude them from the
>>   * changed-bits check in get_pci_config_device.
>> @@ -3375,6 +3469,29 @@ static int vfio_pci_pre_load(void *opaque)
>>      return 0;
>>  }
>>  
>> +static int vfio_pci_post_load(void *opaque, int version_id)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int nr_vectors;
>> +
>> +    if (msix_enabled(pdev)) {
>> +        msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>> +                                   vfio_msix_vector_release, NULL);
>> +        nr_vectors = vdev->msix->entries;
> 
> Maybe this is why we're not generating an error above, we don't know
> which vectors are configured other than if they have a saved eventfd,
> where we don't test whether we were able to actually save the fd.
> Thanks,
> 
> Alex
> 
> 
>> +        vfio_claim_vectors(vdev, nr_vectors, true);
>> +
>> +    } else if (msi_enabled(pdev)) {
>> +        nr_vectors = msi_nr_vectors_allocated(pdev);
>> +        vfio_claim_vectors(vdev, nr_vectors, false);
>> +
>> +    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>> +        assert(0);      /* completed in a subsequent patch */
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static bool vfio_pci_needed(void *opaque)
>>  {
>>      return cpr_get_mode() == CPR_MODE_RESTART;
>> @@ -3387,8 +3504,11 @@ static const VMStateDescription vfio_pci_vmstate = {
>>      .minimum_version_id = 0,
>>      .priority = MIG_PRI_VFIO_PCI,       /* must load before container */
>>      .pre_load = vfio_pci_pre_load,
>> +    .post_load = vfio_pci_post_load,
>>      .needed = vfio_pci_needed,
>>      .fields = (VMStateField[]) {
>> +        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
>> +        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
>>          VMSTATE_END_OF_LIST()
>>      }
>>  };
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E904CC24D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:07:55 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnze-00029Z-Ct
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoQ-000765-KR
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoO-0005ho-Ki
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:18 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223Exckb028857; 
 Thu, 3 Mar 2022 15:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=DxvLk/TJwIN6sJjSRWG3+f6vfRiyMtAXtRjI+iNrOQo=;
 b=PAiAc5yXVKSZcwujcPlZSevhGl9Ai0Hq3PvXt58r49bIDZm211mfh5p+DyKXrtyBnEJk
 XIJVDH9z+A5jkCgsfu68XZwlA8PtnwQyizyuGhGQZqoiV+kMfsxnwlYRBoiAmBvfVuEp
 o9tg0fsCG5sV7Zk2NZOLVAGFim6kK1+Gof+fhR2f6/qfvo9ETTBuKMFBxfgqC6NgbYLk
 H88Yyse6AE3l3A6QDzyIFypANORNjP1QJaI6yiGDZwgD3tz8b56mW7Po2eJnxkXPXhC3
 aPHpY5n9+zRqTdN8VCqfP407AqhaXUt6aSQSw4XMJd3BDAQhBM6CuWe0khOK+NtQJcDj KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh14c19j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Fu5DN079003;
 Thu, 3 Mar 2022 15:56:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by userp3030.oracle.com with ESMTP id 3ef9b3pt8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvIGHO962Wo3V/4oToVUXdQn3cmPr30WarLprCC+LjKtzRoRhPOsdfVXc4rUwhZhwrndT6qHWhsdbKQy96+rwuyWMc4NBg4zA3FAYQ4eRv5jsYH+0m4fFVpGraDjHCTFMIBWEfumt9LRkf6/QztRK8VRU/G9udlxg0SteoJYCEtmdQQ85xJoRJlKsjQ+GHvvgDW6eF7hkpWmFHtcYaLjBT1IhSWPV3gUnDuItk/rEGdoy9pefE0b8bZnvLy613nsAZ1cfPfrQ8K6D2v3DNQ3NVeKHa8gYSQxMH63BcINIztxHAqgHBiCjr1e87L7JRLzHaqACOiQs4YxtS9xU1htlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxvLk/TJwIN6sJjSRWG3+f6vfRiyMtAXtRjI+iNrOQo=;
 b=DRqzbZTGaloeKPaSyIsppzp67ibVi27H7mC8wipXMjxaH9mh7Gs0b6y42PjTDPFDD/2ABJyCu6jeC3U8ckymxdXuY8ZhX9YL736WplUn+QEJSx14mh76ES2U90mYek8GeZGKy1hSDjS6P0/MZee1jC9F0Coc/UWYSi4pgpgLwSZE5rEa47nje0akNmXQVXKQM8jjCKntfJGiMCXu+zQeec8kzs5l5lJ+W+QvFHHQ2+uHu7AvP7VAo6olnOFKuX5bc2SIQHHVune2222ZL7td/YDsPHGXa2IXjBK/En8gsGHu5r8df7qfVCOhNM/SdxeZtCRJLSkL2ANYEsXFM3JpIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxvLk/TJwIN6sJjSRWG3+f6vfRiyMtAXtRjI+iNrOQo=;
 b=xkIiWryBfTOFh1NSXJauF7K3OawgzR0ldDHLu5YEWaxZev9/cwSrAOhOfmo3GM7COu2txindao6DbEuphHSywdjvNmct6xbqD+fjlFYCgl+insbImJzvPZA1Q3/DgFQgbowduCYZx03YI+6eIwKdung1gscjdeUWLi+aDH5EG7U=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM5PR1001MB2234.namprd10.prod.outlook.com (2603:10b6:4:2c::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:56:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:56:02 +0000
Message-ID: <70c3f8b4-444c-fa83-37a3-80f38d14f2b9@oracle.com>
Date: Thu, 3 Mar 2022 10:55:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 04/29] migration: simplify savevm
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-5-git-send-email-steven.sistare@oracle.com>
 <YhfNi9gPdmDcdTLK@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YhfNi9gPdmDcdTLK@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670b2a26-f018-43ed-cfd8-08d9fd2e5135
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB223460204802C2D70EB26A6DF9049@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqZROUvfrBCuBFdxl8YTihHELBy8coeYMZaK5JkJD8W9E5Tjwx/QLlwvvdkqnwH4eFODAadSPEQ5b8hRSLC0SY4Zm7muAduMKpZ9RA9X+5vlbDFoOyTAKojakQp27v0u8KdcD+HBX9+Z/v4s1+8N5oW90EGx4jLc/AqjNkfNC92WYxqyA3/0gdPeVRpCiSAJhdDG7t3twpSKCe12FPUNZ8ILhPN1qK1TEzSznKR2ouO+8RkHPD5fGGQ6N4rLdZGWfeBfEaEm2E2M/IHLIUYMhr+IOR43YuKJFToesWYx7ylXbpB7xqGWhm4vNvwplhSf3sky829Qr2jirNEcImT15xa1BAmqWUkM9gEELyjQvHbJ67OJxXb5BsMrb4PmYOscDeV6wSUWmporwzE6MFM2ozhGIg3JTB/UDuBDi+xW554UbyhotYyMNIs2tmF2fbmXs4ETvu4n/htmThr4ZfmVWS2jOw+FzlQVRDFNG8BVsqpsTU5SjoREL2s9Rq/cBs3WWBpl5nSzBkvA9ZG392NDhnpmzdVwZTW0fJ21/u6HHOSYAnIoUh/86f+C83P/EiNgcLkbQ/CewQ0Sg400gaq0OrBdkOwPEi4QPL4mrkFlRe5CFlbgmPO8O+QrUHcGlcSt0g/pm6FLn0Q22iKfkOz0/7kudSxLPzVqpD3d+SM41JQHec+QcWSH366uZSM0rx8Nx2E9pwHLWxwczb09eObbOoOyArqG3VTx5dC2e/bnsuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(186003)(508600001)(26005)(2616005)(31696002)(7416002)(8936002)(5660300002)(86362001)(44832011)(66946007)(8676002)(66556008)(66476007)(54906003)(38100700002)(4326008)(31686004)(6666004)(6512007)(83380400001)(2906002)(6506007)(53546011)(316002)(36916002)(6916009)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bytwellUS3laMS9HNnF1WGZscVAyeUxnbnI5N0JrczhCTUpWeTFvWEpWMzh5?=
 =?utf-8?B?bElhc2dwdGtnd1RXeVJFM1RaWkR0YXREQSs3S1EvRnkwRXJINUdGdk1CQzA4?=
 =?utf-8?B?aFIvZjVJQklkQmdxWUo2MC9wUUVKclQ0TFFVWnIvK1hWdVRwMGEyWTVYb0pL?=
 =?utf-8?B?ME83SWJBUFN4aGFkVHVhbDZ1NnRtWVE0dStLOEJ0RWVCVWNteDJTSWVrMDlk?=
 =?utf-8?B?SzhYTWxJQnRBT2VIeDhEU3pZN1VaQWdyMnR0RmkwbFQybU1nSU9qR1hvTEU4?=
 =?utf-8?B?VkdZRXdFcXBwT044TmJBNEo4czJrUnBaS0lzVmQ0Z3daTUNiZkhZNDJYeGdr?=
 =?utf-8?B?ZEdUQ1pCVjZVYWFDM1FkZ3puaEw3Y3VUZ3B6Q2xuS29ySDBoSmVqZmppKzZQ?=
 =?utf-8?B?YTV1amdFZFZkSFN2cDF2UUlXajBqWis2eWsvTXBvODF2bFRUVlhURDdSZ2lE?=
 =?utf-8?B?Z2ZYbnZBMk1hSXRHWjlxWGdkMjhWbGhqb1hpbHh5TlNUa3BMVm9kZ3R6VytR?=
 =?utf-8?B?V0hONS9zWmpQLys4c0QwL3dZcUJPczhIdEtQanhYZld4MlJNc0V0Z2p0OUxQ?=
 =?utf-8?B?ZXJLSldSRWpvdVpEREh6S0FRS29QS3JkMm43SFltSWNmZUVYUmdzcUdmVFl2?=
 =?utf-8?B?MXpWUGZkSlJpZk90VDlLMm1tVmI0SkM0RlZMWjVVVi9yYnVCdlMzMUFtYytV?=
 =?utf-8?B?WmwwZWNEVFJ5VXhKM1dwQ09hdnpOMy9PR241ckh6ZDFYSzVNVi84dU1MQVJn?=
 =?utf-8?B?WmFPU3cwdW1rSnNVZHdBUFE2YUdHb1doaVY1K1VqdDJqZDhGSEdlRmtTSkJP?=
 =?utf-8?B?eUtvYW1pdFI3S2twSTlnbWhUTVY4S2VYQUdObkovb09pbEplSHdIaEpBSm9E?=
 =?utf-8?B?ODV1WFJTRnR0OHRBM3h5cG53QXNqZ2l3c0RXc216SjM2SmNkbGp3aDZaOUpz?=
 =?utf-8?B?VWprKzZEMFU3eVlrVGJsRzRtZVlvMXozQytQdGxtZ2tFQkM0ajZRdThTeUxz?=
 =?utf-8?B?V3RPUWUyQzZGd1JpOFFmeHY3NjNTbVZ2bzlJWmNkNlAyYVNkaW5OQTVheXRS?=
 =?utf-8?B?RWZaa25pUUd3cGtUTjFPV0o0bkQ2b3dRaHB0aDhyblpnakg4MmQ0QS91Ly92?=
 =?utf-8?B?VFdEZUtpQTkvMFRqOUVNb1JteG5TRTRjcVdZY3gxNVArN2wwcUllb2Q2RkVP?=
 =?utf-8?B?WXlYMytpdUMvQWUxakd5d01TUFZoL1RwR1BLTm9NUXdSbUJDUi9ubzNpZWtP?=
 =?utf-8?B?SHE5SXQwaWJ3V1h1TllLalVqRUhZUS9mSjd2RU5OREhtSjJuamIxTFZRSytq?=
 =?utf-8?B?RzY2RHBYcEt0a0RuYUZGaVkySCtwNnBLcUZyWStxWW1OMjZzaGJ0L3FVNkF4?=
 =?utf-8?B?K1ZlT012REJ2UXp4R0gxWUpESDM5bHdXVUFnQ3RkTnJsTDkrTFZnTXNYWlAz?=
 =?utf-8?B?R3Z2WXBHeGlJV0xpa1JMOHc5SE5vR0tpVTUzYWFaOGNCTkd1NkE4dWdSSkli?=
 =?utf-8?B?NTRtQ0FYTElqRGJFcFlqb0I0U3F2b3VyRGxOVWFxV24yK09pTm1yVGpSaDJ3?=
 =?utf-8?B?SXNGU3FHU2k0QlBjVEZzR1RMS2tnNXd1NU9MSmsxTE10T0dkYkpSTTFKSTAv?=
 =?utf-8?B?NDhTQ2IxUDRlbzN1TTRtN0pIcmFnbzFJS0gybTRIVmp0NmNyZm1PVWllNXdJ?=
 =?utf-8?B?dU93anJXT2M5d1NIYW9KdjVNYWV0L3VOR2ZUcXZ1dXR3QjkxNUVORGRWcmdT?=
 =?utf-8?B?Vk9yY1RJZTB5V0VEVU16d3M4cWdIdmdsUCtNSWIrSFBKTVFqY2xHYnBsWGhR?=
 =?utf-8?B?NzE0cmFIbUVzb0R4RFFHYmQrMkZtM0N5dzhta1NuNWgwTzRZTFRwTmxxR3NW?=
 =?utf-8?B?RkRwOWlFTWhPQVo3TFhSMDkrUENQR2FLZmZDaldNRzEvNzVMUXVEbXBlVXRn?=
 =?utf-8?B?TjJGVlJ4TjhqMU9uMnJUdWpaVDBacTlobm5yeWdqeUkyaXcyTU9VVmNINW5X?=
 =?utf-8?B?ZU9zNk1rNzVNcngyVDNHTjF1cjJva0ZYM0lhaFhHNkwvaFMxcS9ZdkJaczJ1?=
 =?utf-8?B?bkxva1hEZnhCcTlRb1lJcTFtNEpJdTBVRGxSaHJnZ29SNlo1bEM2encvUHps?=
 =?utf-8?B?cC9KZ3ZGWkN3Rkdnak81UUFnZDV0YUJOc1BtT3hnV2F3QTRiNFBOSHNnakpi?=
 =?utf-8?B?ZmxwVU1ydTJGMVlwR0N1cE9VVXBzWHN4Y0RwRWJmM1FzdVNyWlI2MWhSZzl3?=
 =?utf-8?B?WmprYnhmMDVHcXFHWEQ5YVZVc2dRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670b2a26-f018-43ed-cfd8-08d9fd2e5135
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:56:02.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KgDRuRZPRs7IOUl1geOTDy2De7prKJWHgM9/X5gjZWxbdjYYcPljVkFpeBxm061/20zhf911BkCzFK8iSEZTTLfMwJNQXENhnCXF2CjM4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030077
X-Proofpoint-GUID: ew22GczAItsyM2KbnJIO_t521ip2tpaV
X-Proofpoint-ORIG-GUID: ew22GczAItsyM2KbnJIO_t521ip2tpaV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 1:25 PM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> Use qemu_file_open to simplify a few functions in savevm.c.
>> No functional change.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> So I think this is mostly OK, but a couple of minor tidyups below;
> so with the tidies and the renames from the previous patch:
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Cool, thanks.

>> ---
>>  migration/savevm.c | 21 +++++++--------------
>>  1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 0bef031..c71d525 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2910,8 +2910,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>>  void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>>                                  Error **errp)
>>  {
>> +    const char *ioc_name = "migration-xen-save-state";
>> +    int flags = O_WRONLY | O_CREAT | O_TRUNC;
> 
> I don't see why to take these (or the matching ones in load) as separate
> variables; just keep them as is, and be parameters.

Will do.

- Steve

>>      QEMUFile *f;
>> -    QIOChannelFile *ioc;
>>      int saved_vm_running;
>>      int ret;
>>  
>> @@ -2925,14 +2926,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>>      vm_stop(RUN_STATE_SAVE_VM);
>>      global_state_store_running();
>>  
>> -    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
>> -                                    0660, errp);
>> -    if (!ioc) {
>> +    f = qemu_file_open(filename, flags, 0660, ioc_name, errp);
>> +    if (!f) {
>>          goto the_end;
>>      }
>> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
>> -    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
>> -    object_unref(OBJECT(ioc));
>>      ret = qemu_save_device_state(f);
>>      if (ret < 0 || qemu_fclose(f) < 0) {
>>          error_setg(errp, QERR_IO_ERROR);
>> @@ -2960,8 +2957,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>>  
>>  void qmp_xen_load_devices_state(const char *filename, Error **errp)
>>  {
>> +    const char *ioc_name = "migration-xen-load-state";
>>      QEMUFile *f;
>> -    QIOChannelFile *ioc;
>>      int ret;
>>  
>>      /* Guest must be paused before loading the device state; the RAM state
>> @@ -2973,14 +2970,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
>>      }
>>      vm_stop(RUN_STATE_RESTORE_VM);
>>  
>> -    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
>> -    if (!ioc) {
>> +    f = qemu_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
>> +    if (!f) {
>>          return;
>>      }
>> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
>> -    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
>> -    object_unref(OBJECT(ioc));
>> -
>>      ret = qemu_loadvm_state(f);
>>      qemu_fclose(f);
>>      if (ret < 0) {
>> -- 
>> 1.8.3.1
>>
>>


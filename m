Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5704EFD86
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 02:51:41 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naRzQ-0004KH-7e
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 20:51:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naRwJ-0002qH-Ja
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 20:48:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naRwG-0004bf-OZ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 20:48:26 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231JrSUl026804; 
 Sat, 2 Apr 2022 00:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vLgoGr2rJyeqDr46Z/EYMOlvAXZL8wTjJsWIpcq5RmY=;
 b=OB7gHHWC/jIWoPazpw1fa+L3TXjMkvp6Rfre9sElEcveXy5ElwhWYRPYL1J8wlLT0dDT
 r+lI7DyW5I10EBRLNtfvZtsSU8eZoJmUHiVt2d5KkLDVav8amkQ3whhG3+12Qm6cFIHr
 5yyHi7cVyKTPLXUUQ0SolygTmwrYs3OuFbhWv29FVfMDBce94jGGrJ7AUJR9qTSstD0H
 wR5UyoHasDfNUhVHGxx0Z+X4ZL0LH4pElj8gAC/oj4JBVH1PbV00wevqtVSh6lAymwr8
 Lqrg5eD8bH1Ed4lIG3yBQjorR1LBV7PXDNP8CGygperVZp28zPxZADK7DHvyzjA8vbk5 8g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqbfxxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Apr 2022 00:48:18 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2320kTab004166; Sat, 2 Apr 2022 00:48:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s99gakj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Apr 2022 00:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5XekY/e9gOSBKtRvI443xJTM/YTkEfN9vs67EgagLrPEcvTRlYnFd3lHS4LCzBZFMrrfAWkLUhYoZ/6R+7ZvEXkHvgDbTpInf9VnWzIizRhntzx/F3l/v4DjNhkZrCTDkuZT8APsBjI5iWZz+YdPvvgdFmprcmFuHqKcareNkCAHWY4xFY+gZ/Xl1O/iN8JkeAkZpqy6hzOvj5fpTvg/WIVV7zTBS3TSNWqLTFCf1PbQqIkUPOIVjo5xaNC12+sfuNbRlgPiukio9ajOhgWJQnz2jvZuK27ZQu1dWFteT5+D1FstBiUL1t29ScBQZ2sVDLLsmOU21dHm2tqUVCZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLgoGr2rJyeqDr46Z/EYMOlvAXZL8wTjJsWIpcq5RmY=;
 b=X3Z9U4dBsOcOaB51aEWeWh+ma5e8NnrNxJvRVuXVcRrW71+cFNVNvrZGpwOApXC1EBoVomdYEev1nm49nNMjE0xUD/gpLey25L+S1lFiJtgxxzF6gB9V6owV59PeONW/jOPyfrgDO+VJ0mR7FLaY89IlyrREtsjNGHyIdXlj3Qu+Y7stNz4knpapQFQxTOnxyVm1XjH+AU0yvMaCqiDrSNFucl4LZoQi2WstR2QByLrAxHJ0W5tcXpHCjI1rwNj9MkVgfaAIBi5ksNji89ilkRbrmp1e9BGrt5fYt0L7nFBTSO4rCAClwXGsF5aAqQM7X/JXQ1c7r2XzMsaVz5BlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLgoGr2rJyeqDr46Z/EYMOlvAXZL8wTjJsWIpcq5RmY=;
 b=oxkXDaiJrxKz8VbCxYDVarX7UOpbOyP+qNq7rNAYfWhIrVaMYKIKUCw4Pwchl+0mAXHHbzGOVIvGl+zrwX5RVO3r9VicioeWPPdPBBwF23b1NCC08P8+WBYNmhj5khmPHwDVOdnXkOC3PZ18WEDACE6PHUma1zVvA+cWlSMWscs=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB4364.namprd10.prod.outlook.com (2603:10b6:5:223::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Sat, 2 Apr
 2022 00:48:15 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Sat, 2 Apr 2022
 00:48:15 +0000
Message-ID: <7118cf9e-992a-baa7-1eb1-4e527f81d61a@oracle.com>
Date: Fri, 1 Apr 2022 17:48:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] vhost: add vhost_dev_reset()
Content-Language: en-US
To: Michael Qiu <qiudayu@archeros.com>, jasowang@redhat.com, mst@redhat.com
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-3-git-send-email-qiudayu@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1648811173-15293-3-git-send-email-qiudayu@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8cd8281-c8d6-4437-b5cb-08da14427872
X-MS-TrafficTypeDiagnostic: DM6PR10MB4364:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4364C254193593DA453CACC5B1E39@DM6PR10MB4364.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFbE/g82nkr8SQT24YgQo733IfITBKUAzmvAzPUG7gdskFS/zBhgYKVCSkKO08NFTptUhYd3Z5MUFuNssGFGdFt7Ei6bBKo7vucgw7/mNgevYq8CguBoT3H1s4t/l+b1IrAdEMOdmG/3HXp86ZR3x3HYOSbHQktdZx+5N2iLqPBu+KVxqM+k9qFkz8r35PC1mkWzIWvNFIkD/E7nVl7QuklGdsIdNxswNu6magsUvxg13MvmARFv3tvFdlHlyqeCpKAYuCKL+SNvJk+L315l5ISHqrBXO16Xt7OuDuJkUqeo8moeuPe9jPBw7qCHVOYZNOpqIf0qsgmCB5gKuvC0/rIEyNAJ7clYZbQfWf2LtOfjGMt42Sk95RGaQTGTAdyjR+tSf5EpaU+7QLDkUIMkDXhr3JiKI0MrMs5CODAmI2HQwvBrvvEc1CzduZGiMH37/KBmAwZ1LSefohTf4C2vdSMOeXePpRtdVAIDJYny8xecLBDu1DMaP/xQKmytD/TBHx1uB+AqIqLu19rM0zDaaVJ4smcBOQAA/Qa0zruz7D8PK8XhFyaDwzsZXe+nUXOLW2zHHNmobZkw2j8977id4B9GwzlaqVQlW/QnWN0BduCUne94/IJmMnMNHZmFdActuIp0qknRe4CwLJ7Ya3kWgZkPdkK5mMQ0/62/zAX6mNmdN/lRsNoonFMnY1Ij4Dr3Q7gu4YSvF4ACsq89nNlJvClC+hceh1bLE0ozX5eKjKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(2616005)(53546011)(2906002)(6506007)(31686004)(5660300002)(8936002)(36756003)(66556008)(6486002)(86362001)(508600001)(8676002)(66476007)(66946007)(4326008)(31696002)(6666004)(26005)(186003)(316002)(36916002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmQ1U2ZBeGJ2d05nUk1PcEhJOGNoaTJxdEZheXNxekhUQ1BtODBMSTZiZG9x?=
 =?utf-8?B?WklnT2xBU08zSDhESHVMck5QbHVxalVoY1pVMHNwVG8rUU5aTkRTMDl4dDhC?=
 =?utf-8?B?d3lkdnk1aTc2aTNpQUV1Y3hyWUIvR3luRlBkZlpTKzdPb3BHT3JKMHVvZmFs?=
 =?utf-8?B?MXFvdDhIS1RBVTRqdzlhVUtNWFB5U3ZaY0lxeGlpZ1RBK3FmV3cwanVEUzZH?=
 =?utf-8?B?cUsyUXZSRXdnWGx0dHM0OTNuSlNGSVo4dXVCZy92UXN1ZlZNTlBwVUJYTExU?=
 =?utf-8?B?VVd0U0hKSXFqNzNvaDZ5cElCL1RLTS9COTdJZHlGeDJQVEF4c00wU3I2d01o?=
 =?utf-8?B?NitEckNoci9VeEREUEN5cGdkTWJIMGEyRWhzSy9BSjluWWwyVTh6cndxeVNH?=
 =?utf-8?B?L2VKNEZXNGlPVmw2eG15Q2xBdlZKRmxkVUtjUGw1QXdNZDEvN2ZVeDJmdzk4?=
 =?utf-8?B?MjFYb1F0dGgzaDRmdTRrWEloQmxGME8zeG1EeFRQeC9SNjRneGVuckFXbDAy?=
 =?utf-8?B?ZkZuRlZ6TFJhb3NTbkVnMDNob3ZsemxYN01qdnJlRjNjUTJGK0FqR0ZEN2E1?=
 =?utf-8?B?QXJXWWJXblRPa09SRUtOMXpsWk10ODRjZE1KL0pBUTBoanVlTHU1KzVXTGU5?=
 =?utf-8?B?VnA1Y1puRG1ZSXJycGFSSE5Yd3NQOERsWGV4RWhGMURGN1RVbFVvR3UxeFBD?=
 =?utf-8?B?dnVRc3dDY3RxT0NpajE1eWJHK2Yzeks5WXJaTXlWVXhWL3dTd3hoeHl2eVVZ?=
 =?utf-8?B?WHpLQlBxUlEwZnArOVZtckZKVWRMU0dFU1NaMU9nN0oxK0kyU1AwZUFFTG9I?=
 =?utf-8?B?dndPcnhYc1hVUWdlTTF3eTVUOFM2Q2JQTmtvaGpvdHhCTlFLV1Zxb1ZWYi9B?=
 =?utf-8?B?dEcvaWJnMU5JNzdDeUI5dUhqdElsd1FjeUNCZUVBa3N4TEROaW9EZG52Qzly?=
 =?utf-8?B?V0JEUzQyRktERE5DZm1PL3Y3K0F3RCthMTFhaXM3MzE1NEk0UzVxYzV3VmlC?=
 =?utf-8?B?dHFFbmJwWTBqYzRXNlkyeTZwa2FNRG52YlYxVlVqZmFEKzlteER0VXY1dmlu?=
 =?utf-8?B?Ti9CS0NFa2tsUUNHQjkxSnl0YTZZK2d3UDZTaGQ4emN6VlNoT3pjVHhCSmVr?=
 =?utf-8?B?ZXZNSVFxZE5iak51aU9GMWQ0QjI3YURhNmNRN29CK2ZDVkZHTmV2a25IYWJ3?=
 =?utf-8?B?NFlTTzFQalkyU0UvZkJPSkZDdlZGblpwdEVtd2Rpd3hJakh0UDc4SnpNcGdV?=
 =?utf-8?B?Rm1rcmMwNzNuVGdSR2tJQnlYdCtETXR4dkNRMC8wTUlXR1dHZDMwV0FuTUhx?=
 =?utf-8?B?MEppRUFUZHNaMEpJcElQQnU3cG5JMFdVQUNVV2ZIUmhQTTV2dy93Qy9lTHNl?=
 =?utf-8?B?ZjhHTi9OZk5RdWZrYnhzNmRWcjNCS3lod3lHa3FUMkZSa3ozZnE0VlFjRWtw?=
 =?utf-8?B?U3BhN3VRV0FFalJyc3UrRlB6dXpDcGt3QUVvcThLRE9YMWNyd0FvOStHdVJI?=
 =?utf-8?B?ZzByemlzTU5Va0tXRkw2TU85M3JWaDRKQ3NWdk01d0Nxb1VIUC9xaWNpaFo3?=
 =?utf-8?B?ZHdNSXpXbHRWL0RjRUIwYTlCN002SytmeWU3QzVWVkYzOHorVUlCZEFSSkEr?=
 =?utf-8?B?Zmc0N0ROOUgzY1ZYNDlSakdHQU5hTXZaek8rUGZjVTBmUXlEdVlXYnJoTEo5?=
 =?utf-8?B?dDJJT1RmQ2lWbHIva0FkSmhtT0JOT0xXb1NaS1JCR2tudEkwcDk0NjlYb1hm?=
 =?utf-8?B?OGZ0clh0aHZUSDgxd09qOEFMRlJzdTRzTnhLZjVUdTY0M1VXZ2NwcHRhRllU?=
 =?utf-8?B?SGY5UDRuS1dFU0VLVzRSRXZkRzZ3ZEU1QzZ0TkZid1pHcXJhS2paL3ZEU3lV?=
 =?utf-8?B?S3JsUFM2V0x1eWhqV1lZaGNCZDl3S1ROTk45d3FUWmlEeWlKMmlEVUkvV2Iv?=
 =?utf-8?B?cjBCSE5rM3l5YjdoaGNCRk9CeUNSYXgwZC9ZU2llSDh2WnJFbHNBT28vbC91?=
 =?utf-8?B?K0N6Rm5qOXgyckJKNHdwamZ3VmtrYkorTWZDSkZJQ05oUWdWVmJ1WWZ3NTNj?=
 =?utf-8?B?ZnZkNGhHZllIRUU4bmZ5WTBiaHU3UEQxSDYyT2RMNHBEWnk2Q2xlb3pnWFg1?=
 =?utf-8?B?UGhPall4SnhadWNGUzNiQTFNU3l0b2R1c2VTMk1jQzFjNGppWEN1WEVSWjlQ?=
 =?utf-8?B?TFVmZmNvOCt6bTFsN2dJS3g4emNTcVVhb3A1SnBqNU1yWWhVZk5KWHpFcVdH?=
 =?utf-8?B?NEs5aHVCSHhzbFI2MkZWZUpXLzlSZ0FCSW9lQlBrT0wwZ2gzY08xUDN0SDd2?=
 =?utf-8?B?VWZ5Y0xvN1FUQ1dXc2V6d3d1SXh3MU4zdG84K1kvQkN3ajl6Z0ZsNzBSR1lp?=
 =?utf-8?Q?81vEcBgbU6ctdLt4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cd8281-c8d6-4437-b5cb-08da14427872
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 00:48:15.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rApo3Hfo/hTGFxvfqF8Ew4P9JsUAwX04x2r660Z71nhvkkB/S4sIsxrODAqP3CQmLraQKf2jB4xTgNfT5AOVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4364
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_08:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204020002
X-Proofpoint-GUID: K0lhL_8vJTlftsboxp6BQwySJ-votJAN
X-Proofpoint-ORIG-GUID: K0lhL_8vJTlftsboxp6BQwySJ-votJAN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2022 4:06 AM, Michael Qiu wrote:
> Not all vhost-user backends support ops->vhost_reset_device(). Instead
> of adding backend check and call backend ops directly, it's better to
> implement a function in vhost framework, so that it could hide vhost_ops
> details.
>
> SIgned-off-by: Michael Qiu <qiudayu@archeros.com>
> ---
>   hw/virtio/vhost.c         | 14 ++++++++++++++
>   include/hw/virtio/vhost.h |  1 +
>   2 files changed, 15 insertions(+)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index b643f42..26667ae 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1854,3 +1854,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   
>       return -ENOSYS;
>   }
> +
> +int vhost_dev_reset(struct vhost_dev *hdev)
Maybe vhost_user_scsi_reset() can call this function instead?

-Siwei
> +{
> +    int ret = 0;
> +
> +    /* should only be called after backend is connected */
> +    assert(hdev->vhost_ops);
> +
> +    if (hdev->vhost_ops->vhost_reset_device) {
> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
> +    }
> +
> +    return ret;
> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 58a73e7..b8b7c20 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>   void vhost_dev_cleanup(struct vhost_dev *hdev);
>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +int vhost_dev_reset(struct vhost_dev *hdev);
>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   



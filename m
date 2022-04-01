Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715B4EE59C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 03:15:22 +0200 (CEST)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na5si-00077M-Lv
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 21:15:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na5q6-0005tH-14
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 21:12:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na5q1-0000eU-Qj
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 21:12:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22VNTNxp027098; 
 Fri, 1 Apr 2022 01:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8Z8OJQlt+xq0Iox9a3aP/anI1L5gWEdddZYx22MzcDo=;
 b=rcRgJr3H0p+cKhqcVWw6TW8iFOLknCo9Pzkj8ZyImPAdOxDKREgBviKBuXYxVWjxm+Pr
 GYchekzWcC7ErHNCPK3L+p1qA1O71cweo00ymW7oYEho6LI0Cu2qnHDM9rSw9XCyBF7W
 FVyVhcvnn2Bly12LeZYtM+kKZBBKzyJJzULGUaWf22+pHoAbIbQhs7F8Lj6aCWgdTmUe
 hz1cbhcKIO0md8KVp9HVEozZyOfDDAVQsaOGh6Wv4FuZC3Lt7pC2xVI92WPa0UvXNV+h
 9ggGw+C66yUgzRO2wDcm0XDh91WGCZ7cPjHD6+MBapg6qVFQ0pwg105AE++16xH9LhQE sg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cwenf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 01:12:21 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23116dJ0034593; Fri, 1 Apr 2022 01:12:20 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s95b8w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 01:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIE2oaxzex1x5GKcOrKIZyv/eTlJmWcleGoIP+PwPmf8YZ/whaUQ8zIcex3QzI+FxSwEFE/h67yGkG5i0+kPkg+yBIp2WImtzhTyrLiwVDg2icsHBCo+zymiOLpKS+AlagDRSo4/BTJXbySVqRA1nwSFr1qcltfQbIWDWG4PxTS25gDyDd2wytj6W2+QHbzLWktYaLfLsrlyVoWCf64fn80V4ttEKz4hH4Z2H59pvw/MlfKnBb8LybmoK8+pgwoZsoRkoPB0A0wweYdJ886aGz/VYazRcHXr8B/TQhEZyOq9iJiHiw3qdt69RV4EthfdhBYBAhGuY8Mu4S66Qv1nRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z8OJQlt+xq0Iox9a3aP/anI1L5gWEdddZYx22MzcDo=;
 b=MMiycx9o3Lag+RZfHEAP0Ax1+2GcqszyF/F8uBGseBIRnkDrVFauo9zTMjahmrPJ89xxqBR+pu0+C5edKoGHUBBXWq51N4gZq/FgE9AMUUpmktcybcugi/4cTspEB9ZqUomsDLsA5JRQp+nMmcCha7pUkuMHhoM4ndRz1q0s9ry5xBBV/LRCsriROGhdvzhhkX7reDtbnru3XDyensL5Ud4z9CZ8JDBx5zxBQyUpWEQvGf8bpP33qrg5XO0uSGco2HKvlxibFEGw0TffY2RyHN8senNXumsKqXpZ/ev9xYUAupqrvghznYf/W9EGAvgBEvveCR2481YXn8Suk68I9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z8OJQlt+xq0Iox9a3aP/anI1L5gWEdddZYx22MzcDo=;
 b=eJH/KkJBXaS0hNpOoRvwVDEknHiTH+f2YEs9lrsNyThOXOcWNJokurFqYWDNtxmk08fI+lTbaFWi9YPx62trAGD/oAXnlKMgbnef+scWH8D8PvtG9UcXDmb+58CU09VqGL7AxN6OtQ8TkLxBNnSA+jyJgtae0leNUuVtX5XBAwU=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BN8PR10MB3681.namprd10.prod.outlook.com (2603:10b6:408:bd::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 01:12:18 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 01:12:18 +0000
Message-ID: <0055bb0b-6c24-9a25-83f2-08ea2b3fe0e6@oracle.com>
Date: Thu, 31 Mar 2022 18:12:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
Content-Language: en-US
To: qiudayu@archeros.com, jasowang@redhat.com, mst@redhat.com
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8f22c79-ff0f-4e5a-b4a5-08da137caa1d
X-MS-TrafficTypeDiagnostic: BN8PR10MB3681:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3681A6CBCEFFB302F823C91AB1E09@BN8PR10MB3681.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvVmCGOTack6gmaYzic77D3fSJ67Es1hDOHbi2gGAVDJ92wDxhSdB9GH8Np38DI051e4iid4ThGIgIDOdGjSv0gb+yegJC5UkZBdG2HbuOu2JwlqE+tDgMPCB9yeMilVF/Dd4+DTku5rBUggNClrlkxd34IUc+AJitOzW6G0hzdkpUOBjNdcFqgEV6K04C1vZQbJzta5EDwA3c6JFr4WhzeweUe4H+J1+IEUkuNI2cyBRzwXiSN4PojsR6abo5qr8bor/hmqttgzE0HfDItcQjF0fgwYuvhpM4cOy6q/FeaQphFuaWxUQG2jFY2XlOyoVy/rAzQ4Tesa1ADRT439wuWna5spK4ziy9PHi5PxCysJ1j1vjsfWjMtgl85/2BkraDRJJWNRVZ7CzZ/+zwJA4ij8lD3t5xA6Z4huIjmyRvLHzfym6t01QoHk3/Vwu6gC2AwPFGykpVFEcXDoP6d2YPbEmWZDjKAEbDL+RzrSF64hU5SBHvt/Q2MpAmBL3QW8p39yKg5llnd1Qb0roPz43a01dv857I7ZKFCDeeHIcJ9ZWv4x8mOv8iwAWpJ0bEG1p5JxaHizAufA+TwAB0P+/guzTD41E18xc152zVqQgLOQxT+uK2wGhIiOAo30pMyCnm69E3MF+KOabvi4/hBgE/Pwicfyar6OLUDIjUT6TFej4DRT2E7apCpnecQDeUk5kDobOfuEWoYK60s2IH3L5XbCUmomEGwRZIpJg4/jcH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(31696002)(86362001)(36756003)(2906002)(83380400001)(31686004)(38100700002)(186003)(2616005)(6486002)(53546011)(6506007)(5660300002)(26005)(8936002)(4326008)(66556008)(66476007)(8676002)(508600001)(66946007)(6666004)(316002)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME00dWlTUWV0OUVmaENxU09Vd295elNDUk1WcEovUDRPNFhLSWRKOUIyRU9G?=
 =?utf-8?B?MjRCdUFPOWJuQkdIengxWVJKODJtR1dVL1BkWEFBM1AwOHlTTjdtVHU0Wno4?=
 =?utf-8?B?NzBIQmRkYXYwZW9oQTN5WjhCdmpMV1NnVHlkaE5lQkRlMFRTUThvbVRRLzIw?=
 =?utf-8?B?L3NuVFhUZDNEVG5EWUhtS2ZtdXNkL1B1bTdSaXAyay9aOGJ2MFVtcEt5ZVFn?=
 =?utf-8?B?SFduVTJHb1NLc2FyOVZCWmFyMHRrOUg5QzRLcnBVNzZlL0FDbWRmdkhNUUIy?=
 =?utf-8?B?UldBOS8rVjBzMXhncUZmLzF0K0l3WHA3bm5lckU4Q1JsTitYWFc3cXdVZlBo?=
 =?utf-8?B?eDU3TlNDK09ib2wxMUExWVNvMWUzb1hYU2VERnlwWmdxT1BOSmNCV0hIcmpI?=
 =?utf-8?B?Mm1pTENOVHhkYVhMWjJIUXhUMUNRTThvQXRla0IzTCtEd1B2Qm5Nb0ZheEQy?=
 =?utf-8?B?RWlzamYrZ1diRWFVWTVHTXpaT0VkSDgrUGQyQjBCbnRkb3lHd1BmcGkvWmdK?=
 =?utf-8?B?VDlJNjIzTDhORDg0TzRlck5oNnY4ZHpCZ0xKYlpDcURXbndFd0ZwOXAwVS9B?=
 =?utf-8?B?VjJwN3pxci9NS3N3ZVY0c0JGcktQcTRGUnNUVHZ4QmFFRTNHV1MvYXp0MGUx?=
 =?utf-8?B?a2puNTRSNzhrS0NhZy9DZURyVnpwT3B6RTU2STN6V2pmZ2U1UHZubDZ6UUdz?=
 =?utf-8?B?SnNST1lRVDNZOWdxSStjVU9CMDFYRE9QQjlucjFheVNNMnlmd0daWDlQWHNn?=
 =?utf-8?B?STlCeVAvVkp4bndtblVqNGpuQ0xkYmdzNFhSdmo1M2YrV2JGWjQxSjNZNE0w?=
 =?utf-8?B?cUFRejJYWW5vT0tuTGFCQjBJQXdwV3dTNHRhS2ljMGFCbm9KWExVWEdBWDF2?=
 =?utf-8?B?bkFQOXVZenRjMjVOQkg2S1FiSTI5MHZBUnY4ZzQ5Rm95b2JGaWNCOExDYUNG?=
 =?utf-8?B?YWI0TEU5dElzTGVKamxkUlAzenkvWkVlRWtaMmZ5cEdQVVVTQmhLd1p4MHlJ?=
 =?utf-8?B?R1cyellka01SZ1Y3bWVNdS96ejJVeU1uNHlOcHg2VS9CVWEzbnJlRDloRFd1?=
 =?utf-8?B?Z00rbnJ1Ykx1YUx1bzdnNWVXR3BISmRnTTB3KzYvYjVrKzhmakFlNlpPUXJ1?=
 =?utf-8?B?ZTQ3cXQ1emRpeVRNckEwNVY2NVRmTTVjQnpmTXBpMFhmbGw3c2dRMlBlNnNv?=
 =?utf-8?B?QW1Na1VObld4anZVVFkxWkMya3pMcmtpNStLcW4ycVVLdkpxdTFNN2FlOXA3?=
 =?utf-8?B?MjZtVXhzNnB4V1NKUEdKUW1ML3lHMExvVEw0QU9rUldpanlXOVJDOGJVNGIx?=
 =?utf-8?B?NnFXM28vVjZqb2JKZXFOMWF5RlZzT1AvbjRSMGoxQ1dCZStLMU9NazdtYXlO?=
 =?utf-8?B?ZGI1eFJkdGxlWjFaajlzRDJQdys0VnZ6QmVXMDc4N3JSdUV4azNxSGRtd3JH?=
 =?utf-8?B?ZmtRamlHZEdIOFYydGFzYjNXR1R5MTVrSXdWVEZkQlc1NG4rMlNMNHlLcWpW?=
 =?utf-8?B?NmlUTXZNUjZQcW1rbjNWUVliWGxJVDA5cUVSOFpYTnNmN1U2amhTcXQyMjBh?=
 =?utf-8?B?MENUS3J3RTFYRG84OTNtVDNRUjQxWThmcllSWjZOUEtLYW5raUNheTU1THdU?=
 =?utf-8?B?R3Vhb3JGSTBEakNHMWpDaEV5dEMxNXE4azFBcE9IRHB3TXFTdjFPdktyTUN2?=
 =?utf-8?B?MWREZ0JsdEV2dmlhQUtuUVF2eTlwZ0dJdnJSN0diQWtiRURmbHd4T0pZUDFO?=
 =?utf-8?B?bFFSK2FYaDRvc1Exd2V1U2JVNWFBUk5JOWxzZUI5cnNtRUlVWHBBTU1ldWNs?=
 =?utf-8?B?N0JDNWd5Znc3ZDJPeGRhOENpTWVPWVpxK3JRV05zeDUrWVRidWIrWVZNTnYz?=
 =?utf-8?B?dlJJMUU1YkU3WFZZNWw2M2ttOTlTaTNnRlArWlFnNmtJTmtJMDIxT0hjazF2?=
 =?utf-8?B?WUdlS29UY21tQmxKc0F2bUg4dE9laVNmZWlJYlRSYnBkUkpmakgwSC9HRk1v?=
 =?utf-8?B?b0xWN2hlL1dYdDZ1UXVEd3l1SjlFdTFVSjZ0MENYZ2xLL3JhOTlyQkd5VTJt?=
 =?utf-8?B?cFVFUTFxT2tVcWQvNThxN1Z6SnQ3NkpHY3daUDFWVzJqWEtDNXFuZU96YStJ?=
 =?utf-8?B?ZmNCanhoaXZQbEEzYkRpZ0tERkVlMm5iaVg4L2dWVjBKdlFkUHV5dTZ4OWlN?=
 =?utf-8?B?QmMzTldNVEt3b2syYVlSMnBJUHpCUC9pL0F2U080NCtmQkxHU05zcm00L0Ev?=
 =?utf-8?B?VVoyZStiTjRlQmMxZFV5RWozUjg1QjE4OURQWjVVRWVXSGNQZUhXamJGTkZT?=
 =?utf-8?B?OW5mbzJPQ0pGVXRqTExxQjFVQXhrNkNPalpMRmxhQUJtUlo3R0pFZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f22c79-ff0f-4e5a-b4a5-08da137caa1d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 01:12:18.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDJ7kIout2oVU96z6c7uRdECT8SuNi54aI7PlnQwwtdopUj/nW+GjhP+NcdlZgHv/K7dZ/4yY5dYULoWlho8aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3681
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-31_06:2022-03-30,
 2022-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010003
X-Proofpoint-GUID: Y5BAg_GmQkDQDBsBx5dvpKLG-Rqv8XxP
X-Proofpoint-ORIG-GUID: Y5BAg_GmQkDQDBsBx5dvpKLG-Rqv8XxP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 3/31/2022 2:25 AM, qiudayu@archeros.com wrote:
> From: Michael Qiu <qiudayu@archeros.com>
>
> Currently, when VM poweroff, it will trigger vdpa
> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
> queue pair and one control queue, triggered 3 times), this
> leads to below issue:
>
> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>
> This because in vhost_net_stop(), it will stop all vhost device bind to
> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
> , then stop the queue: vhost_virtqueue_stop().
>
> In vhost_dev_stop(), it resets the device, which clear some flags
> in low level driver, and in next loop(stop other vhost backends),
> qemu try to stop the queue corresponding to the vhost backend,
>   the driver finds that the VQ is invalied, this is the root cause.
>
> To solve the issue, vdpa should set vring unready, and
> remove reset ops in device stop: vhost_dev_start(hdev, false).
>
> and implement a new function vhost_dev_reset, only reset backend
> device after all vhost(per-queue) stoped.
>
> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
> v3 --> v2:
>      Call vhost_dev_reset() at the end of vhost_net_stop().
>
>      Since the vDPA device need re-add the status bit
>      VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>      simply, add them inside vhost_vdpa_reset_device, and
>      the only way calling vhost_vdpa_reset_device is in
>      vhost_net_stop(), so it keeps the same behavior as before.
>
> v2 --> v1:
>     Implement a new function vhost_dev_reset,
>     reset the backend kernel device at last.
> ---
>   hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>   hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>   hw/virtio/vhost.c         | 15 ++++++++++++++-
>   include/hw/virtio/vhost.h |  1 +
>   4 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2..422c9bf 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>       int total_notifiers = data_queue_pairs * 2 + cvq;
>       VirtIONet *n = VIRTIO_NET(dev);
>       int nvhosts = data_queue_pairs + cvq;
> -    struct vhost_net *net;
> +    struct vhost_net *net = NULL;
>       int r, e, i, index_end = data_queue_pairs * 2;
>       NetClientState *peer;
>   
> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>   err_start:
>       while (--i >= 0) {
>           peer = qemu_get_peer(ncs , i);
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        net = get_vhost_net(peer);
> +
> +        vhost_net_stop_one(net, dev);
>       }
> +
> +    /* We only reset backend vdpa device */
> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
I would reset the device anyway regardless the first vhost_dev. Some 
ioctl calls may have well changed device state in vhost_dev_start() that 
has no way to get back than reset.

> +        vhost_dev_reset(&net->dev);
I would move this to the end as it's more sensible to reset the device 
after guest notifier is disabled.
> +    }
> +
>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>       if (e < 0) {
>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>       VirtIONet *n = VIRTIO_NET(dev);
>       NetClientState *peer;
> +    struct vhost_net *net = NULL;
>       int total_notifiers = data_queue_pairs * 2 + cvq;
>       int nvhosts = data_queue_pairs + cvq;
>       int i, r;
> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>           } else {
>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>           }
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        net = get_vhost_net(peer);
> +
> +        vhost_net_stop_one(net, dev);
> +    }
> +
> +    /* We only reset backend vdpa device */
> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
Yikes, I think it needs some code refactoring here without having to 
check VHOST_BACKEND_TYPE_VDPA explicitly. Historically the 
.vhost_reset_device() op was misnamed: it was initially meant for 
RESET_OWNER but never got used. Could you add a new .vhost_reset_owner() 
op to VhostOps (via another patch) and rename properly, e.g. from 
vhost_kernel_reset_device() to vhost_kernel_reset_owner()? For 
vhost_user_reset_device(), you can safely factor out the 
VHOST_USER_RESET_OWNER case to a new vhost_user_reset_owner() function, 
and only reset the device in vhost_user_reset_device() depending on the 
VHOST_USER_PROTOCOL_F_RESET_DEVICE protocol feature.

With this change, vhost_reset_device will be effectively a no-op on 
vhost_kernel (NULL) and vhost_user (only applicable to vhost-user-scsi 
backend which supports VHOST_USER_PROTOCOL_F_RESET_DEVICE).
> +        vhost_dev_reset(&net->dev);
I would move this to the end as it's more sensible to reset the device 
after guest notifier is disabled.

>       }
>   
>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..3ef0199 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>   
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>       trace_vhost_vdpa_reset_device(dev, status);
> +
> +    /* Add back this status, so that the device could work next time*/
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                               VIRTIO_CONFIG_S_DRIVER);
> +
Hmmm, this might not be the ideal place, but I'm fine to leave it as-is. 
It would need some more future work in code refactoring for e.g. live 
migration and error recovery.

Thanks,
-Siwei

>       return ret;
>   }
>   
> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>       return idx;
>   }
>   
> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>   {
>       int i;
>       trace_vhost_vdpa_set_vring_ready(dev);
>       for (i = 0; i < dev->nvqs; ++i) {
>           struct vhost_vring_state state = {
>               .index = dev->vq_index + i,
> -            .num = 1,
> +            .num = ready,
>           };
>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>       }
> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           if (unlikely(!ok)) {
>               return -1;
>           }
> -        vhost_vdpa_set_vring_ready(dev);
> +        vhost_vdpa_set_vring_ready(dev, 1);
>       } else {
> +        vhost_vdpa_set_vring_ready(dev, 0);
>           ok = vhost_vdpa_svqs_stop(dev);
>           if (unlikely(!ok)) {
>               return -1;
> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           memory_listener_register(&v->listener, &address_space_memory);
>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> -        vhost_vdpa_reset_device(dev);
> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                                   VIRTIO_CONFIG_S_DRIVER);
>           memory_listener_unregister(&v->listener);
>   
>           return 0;
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index b643f42..7e0cdb6 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1820,7 +1820,6 @@ fail_features:
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>   {
>       int i;
> -
>       /* should only be called after backend is connected */
>       assert(hdev->vhost_ops);
>   
> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   
>       return -ENOSYS;
>   }
> +
> +int vhost_dev_reset(struct vhost_dev *hdev)
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



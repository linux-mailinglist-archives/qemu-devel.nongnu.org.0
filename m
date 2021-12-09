Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B146F2A6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:59:45 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNho-0000VL-5i
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNfV-0006vn-3r
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:57:21 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNfS-0002oR-U4
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:57:20 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9Hnenk010821; 
 Thu, 9 Dec 2021 17:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vbALgdsIQ/SHADyI+uL/dwMEVP30M96GyE+FNu79oUQ=;
 b=wiDrqLDMnFk6j0l266Iu+tiebwaX7pyS5PynU1o0hFEEBxJALo0b+udFZWLSAyqg7vnk
 6sY7nohKhqZP1yfkLEBfESm7hGz3uBGjSrJQq0GI4snzi+W9OTZhv9bhXNi0+Ogyjx3h
 J2SHorHKlLPLV1+OSN9C8T54xWwe4KWb5BCBVM9Rce/u7iTJTAlagD8H9dN0SMMFLQQ0
 +rfWkcegPbTnOax7SMomD+CnBGUrgCwg0sj55zhIFOBwGzGibDZb6sZwkowGUGKWeupQ
 JpxcyOj38c1wRNnwF3FwcPC09Bapzp4RhX/sGQ0HUxJbizl69NW8ZYJVl0+fwW5VjK9G rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctua7kqax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:57:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HqD5n018515;
 Thu, 9 Dec 2021 17:57:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3cr0584wtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:57:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7a+3hGmW8DSBopNd9WRLHCjV7+G+jLedqQ1adIk/tXyMSQuxd70WRveuxqWOb6YK8iuTZWRUztTsmaY1Bj2Q1iEjCEwRbcMzYao1QZGoFBZlGa/Z0nAnBVckr0blpvsc+HjeMfmWLICOHuCepOV3ostI+NzgrzYATtabqZgRpT+YtqKOonbTM9W9bkXI0mI5sD/9Od5xYDiZt0exseEIVK5WE9OBx7zCKAjZANuiCInxSFABf3WV6u+bJqHAyNsCjY2h1Le2O+1CTTa+Y+BYgVr8YA2scMQjr9kBEFLCOPY2A3YinRxY7LnOwQ8yZUrZOwQ9kKMGueiQPMeUbaXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbALgdsIQ/SHADyI+uL/dwMEVP30M96GyE+FNu79oUQ=;
 b=YAzAohtDSAy7fRrYBh/W2uCaRca/mX3kyl2+TFZmktPaTU19d11VHzoqA9vwC3eAbof1DtYML/ZciOL1NycHOhd6x9elCPPxQTg/NAV5Tb2HlDa/wV8X5mmCVVDOhPDfw3/rk+WKi2BaJLcGZ23lzlQ1//d3SG64U8UGJ1ZCZH9rQto4nRImiagM428rgj123SdTujUtHGDoTmH7/nxpuHJzvv8VKz0oXx9LDud4lYDAqRsTig2J0FD5lXypLiL9uADiyIjUUBtWuCG45koYToCsrlvur2II79xZpCf9L7wnROIFFvJy/WgdX3L7GEsZ7tp+Z8+Sri1wi2aALB9Fcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbALgdsIQ/SHADyI+uL/dwMEVP30M96GyE+FNu79oUQ=;
 b=xyK6+fdv1m6QUZSVlAcufM/l31h8c3nXP5D9cjwEwo8YNRnI5CzpQvmmDIwNwEqwSOoHGglq9LNgveX0hbmA9/ZRRGPOlxmfWcrAqeBAgcPwqU6Mi7qrR3r0hCFFbxU5HERzkOI6tqOpE22NNTPck0QND3DaseCYlfEWuOjEz1Y=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2349.namprd10.prod.outlook.com (2603:10b6:301:30::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 17:57:11 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:57:11 +0000
Message-ID: <b9a20f7d-5455-2fff-b46d-925af949f87e@oracle.com>
Date: Thu, 9 Dec 2021 11:57:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
 <af8dc304-ec4d-8c0f-696a-b00a72bd1764@oracle.com>
 <CAARzgwzud45gtxMW-gnUmMcLeumQt9Zv=CVOKcxs=vSRO-RLWQ@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwzud45gtxMW-gnUmMcLeumQt9Zv=CVOKcxs=vSRO-RLWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22 via Frontend
 Transport; Thu, 9 Dec 2021 17:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6989f568-7c4b-4005-500e-08d9bb3d5373
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2349:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23490607209EB249831F43B197709@MWHPR1001MB2349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNwk0YZWydgq3+9VzTCuy69y6jSv198EAL5xI/NrG8Oet1teTYPI/3dE3Rew83dNXVezovgHURugkpyzegpkC7pTX7p1AMXIdK+LpiRlw6VY7pnIA7v5qnkU+YYzD3IFySRuv9rJdvGau8pmicd1hJ4fx/bgRaIcZj5CtfaFk4Q+txAinhO46OpQapfjxdz6WbBacr4mSmJ6ue87SU/vexpOlsmRsgNKbbzm/Bn3JSzz0PUfjhSwy2j5qRAl1Pfh+a5AAmak5wlwqwZvo11oI6am+3qkKne8ac5aQ4875wbnJySw5Vu70DD4+chzH64rrV5/Z7kuk9awoPlw3lW5b+0loRD346UHR6Dlga1Kz2kVV01qjWBHMI9PFNFy24cxhY8aWKykElDVgv8P7ODV8JfP/HHHkLeMfysdm4YQe1ZuNr9x6rmqUY6Rbv5VhosbYm9xdhrfi9nZzhlKpFMv1UYJVuCDM/8U9nCkd2yEcDvfBaRNW5mia+y8Tk6zgvyxRDVVD4mwO6mmNI0WbrbY7GiV0PbNFFSrQ1dxlgMjwV0GCBaAfyCUncLPDLS7ki72fVtXC1LQurBwCvTFVurnjYY3UHKOsZh1fOwWFvGD8tgMw41LJrRrDAAbLUauOe6VPYro0E74a8H8xOBhNaG4BbE9ht1hxv3fmX9OLYzr3OmEgEgjQur0rXQXdaTg6PzM2cWb50TJmWdeJ0cIaq76Qqo68zZmXDkYHkdzAuvHZHfmXuOPchK1h4yEaE1fCZEO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(4744005)(5660300002)(86362001)(2616005)(38100700002)(6486002)(66946007)(36756003)(508600001)(316002)(186003)(6916009)(83380400001)(8676002)(66476007)(31686004)(4326008)(2906002)(66556008)(53546011)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHp1TEhKZCtCeTVZaDZRcXFWZXBkR21wUkY2eFVSckdZcmpiZ2dyRGJDYU1p?=
 =?utf-8?B?bS9YVUYxdFV4SHF6dVlGQjlDb3NIRXVUd0JVRWZQNE9PL25wclRMY0RXM2x2?=
 =?utf-8?B?d0x0bThHdnExV2hURUhHYkNUNTJzeVUrM3RITWFwbk44VitQL09oR2RGQTBh?=
 =?utf-8?B?eFhSdXgwLy96QlRkMEkwNEFCM045czFTdDA2Slo3MHBtQWtOS3d5TXJkNzBU?=
 =?utf-8?B?bVpRK0FKamtCck94d3labCtIT3NLWkYrdVh4akhxQW5pZ1R3ODdDT2UwSDBm?=
 =?utf-8?B?dDZJempIbmJuSTVRcTlDTDFWMWJBNGJLamNLa09lSnRvVzF5RW9Jb0gyTTB6?=
 =?utf-8?B?VDA3am1BZ2NmenlHMjJPWEdONkkxN3hSTlZubno0STMvbTZsWDdhWWNWc2R5?=
 =?utf-8?B?YlFGMlZQZlFaZkdGMmVUbTI2ejAwdmJtS2xpSVhNNWZVaVBOSkdyOVJJbE1a?=
 =?utf-8?B?ZFBsL1JPSWFLNE1QK2U2WlcxWFkwR3ZJSks0ZnNMbGpXMGlIM1N2OVVtRmxD?=
 =?utf-8?B?dGF3ZzV1STNacHZDWVdjbEpXZUZCM1ZEb1dPZVRsLzE2cjJJWlVDQWtlNzhy?=
 =?utf-8?B?eTd2ajZXMlFnVVdDY1NvRjVOZUJwMjVGdUMwYTgzKzNuKzZlb0JUM2kzWm9x?=
 =?utf-8?B?S0dacG5rZ2U4dExFM04vMzhKZnk0WENoUzRxUDRyOTZ1RVBZdGVpbjJhM081?=
 =?utf-8?B?cTZTcGEzNWVBNUZFMzdKY1FUclNFMjlLTWFzVzZyUEhKQmxWYjY1SUlhSDBq?=
 =?utf-8?B?ZlJBYWtUbFZpM2p2UTl2UkxOVEkxR2pmSWR2ZHN0bG5GT0t5TTlIcjg0WElM?=
 =?utf-8?B?TWxYN1J1ZmljOHBxOWEyK2pPT1RpRU50WmNTRUhtYm1ndlB5T3lhWWlMZXdN?=
 =?utf-8?B?dTZpbEhkeXp6bVhJSzA2Vk9Oa0xlYlB4S1B2alVVYXpYWUJuL1IzNko2VFdN?=
 =?utf-8?B?bm8xV2dqODdCR0I5cHJCVXRIRk95Vk53RUVBWEtuQjIvKzlCUERzS2JSU3F2?=
 =?utf-8?B?dUlYeUNsczVlamNYMzlWNGdrNyt2Y2VISHZPWCtwOWdlQ01pQ0R5MVRzVGli?=
 =?utf-8?B?UnJZaCtZOGRVM1UwS25uYklEMzJDOUFUOWVLZ3F1K2RBYU9PVnJUU01rcDdF?=
 =?utf-8?B?ejdSbGVwWUFCa0FtbXpGckZJTU1ZTDBad1V1NmFieExJalpQMnMxMGl2V2oy?=
 =?utf-8?B?Qk01Z0o5NjZnZVFWZmpPUndHVFhaLzNPRHUwSEhXamFzKzdrUis1eGJxTklq?=
 =?utf-8?B?R09yREFNNVRIbFlqL014QmFMaGZzSm11NzFxYTF4ZTUyZFJBcDVtNE1HRXVy?=
 =?utf-8?B?NUpPdzBYS1dvUklpSFYxT0ZzcVBlOHpJMnB4WWsxN3dMcmJWNEFMdUhGQ1dh?=
 =?utf-8?B?ZUpiSXdBSThVL0dzNmhtVjR6ZmhDcVNncy9ySHB5dFh4bVlyWEdIb2NuTFFz?=
 =?utf-8?B?QU85YW5ibFNSN2xUTUlxTjdMRDI2RzBZTlpNK1VhRFoxM0I0Zm1yWWcwWjNJ?=
 =?utf-8?B?SnlPVHdidDloMXo3R0Vic2NUY1BhK1JIalo0VUNVUWNTcUdYc0VJb1ZaUTQx?=
 =?utf-8?B?VVVaTXFTSWo2cHFMdFVuZE5GZHRKOTlNVms1bDIvSXpBNVF2R2s2bENoYnZx?=
 =?utf-8?B?SVdTcDNVQXJybjdUS1VYdnN3SzVidTVYbUJFOURqZEcvMUdYb0tMWmEycElp?=
 =?utf-8?B?dkNCZHBwd3poNTQ0Mk5MSEpvV1lKbkhZN1crWHZZbWFXUGZzNnpUWnVzYnY0?=
 =?utf-8?B?bWhMZVp3L3NFWGE1L2pyRmg1SVlQN1RYd0FSNDlmc2RiOXhlSytCRHA1bTRP?=
 =?utf-8?B?OEp4OWRNS1VhUWZZZTlwQmpuWlkxZnpsL2FFS2J3RURsNDFGZGUydU9GYjN6?=
 =?utf-8?B?cmFsQkE2V0V1bUpzb3NZRVRlYXVKS0d0MTljdmRvZGVZSld0RFdaRzhzT2VG?=
 =?utf-8?B?OE53eWdIcndOTmVHYlFFd0QxR0NJbGtrN1EyUnhveThJQ29KTW5CdU03NlMr?=
 =?utf-8?B?c2Zld0ZOaDIrOXd6d1htbk9ibEZYeU9KaXBERkFsU2ZWSjl0MzhNSmRScFNk?=
 =?utf-8?B?STZhMDA4WXpvM0VhNllFR25JSjVJMXNhY2JDUDc5TzJ6TmdOSlp1T1pyN0Rs?=
 =?utf-8?B?ZU9zUzhibi9EMUh3MzQ4VG1oVUFzTURjV2xWMDVmbEJNZFhSUjNWbitxR1Y0?=
 =?utf-8?B?VS9GYXJaWTVxS1NackpEMzh1Z0wraEdtcnNEV3VGSzlKNDU4ZExScmsrejZG?=
 =?utf-8?B?S2FhaVFsSzd5d2thODdDQXhpWmV6N1RjUHF6TDFsYVRuRWcxNWRjVm5hVnhp?=
 =?utf-8?Q?SnXg2n4SXphIp7rzf9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6989f568-7c4b-4005-500e-08d9bb3d5373
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:57:11.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78JNUHsRoVr8JNZ9E9z0zKe5tAoC5Roh/nRm1F2vCNoBZAsYb/Dj4W7IVC68poZirZfeTo2XnXO1rELXdoNlDN+eEAY/8xJ60fv8qz9CWl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2349
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-ORIG-GUID: d3jSzBb8esmt1k06bEVL8JnvkOOn2QoY
X-Proofpoint-GUID: d3jSzBb8esmt1k06bEVL8JnvkOOn2QoY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/9/21 00:31, Ani Sinha wrote:
> On Wed, Dec 8, 2021 at 10:08 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>>
>>
>> On 12/6/21 02:14, Ani Sinha wrote:
>>> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>
>>>> This implements a PCI device for ACPI ERST. This implements the
>>>> non-NVRAM "mode" of operation for ERST as it is supported by
>>>> Linux and Windows.
>>>
>>> OK sent some more comments. It will take another pass for me to fully
>>> review this.
>>>
>>
>> Hi Ani, thank you for reviewing. I have incorporated your feedback thus far.
>> I have v10 ready to go but not sure if your review of v9 is completed yet?
> 
> I completed scanning this patch. Don't hold your breath. I review
> things when I find gaps in other work and can't promise timely
> reviews.
> You can send a v10 once you have addressed my last set of comments.
> 

Thanks Ani! I understand on the reviews. I have incorporated all feedback and posted v10.

Thank you!
eric


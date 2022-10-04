Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F75F4B26
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:49:26 +0200 (CEST)
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpn3-0007F1-QU
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofpRg-0000Ep-Vp
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:27:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofpRb-00071i-Mz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:27:20 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294LO7VZ028516;
 Tue, 4 Oct 2022 21:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=+L64pw0pbRB4qsM1ivZ71yIvM/uIW433fBMzra9LUc8=;
 b=Q86Rggy4VSJwoz4SH9t3/WI/9IVtWpccWnnzRIqTskJ5e1jrYOhUtxnmHuJEo4uWg5+v
 /P5KspAHBeOJ1KUG2DMXPOk9AjBJ5VP2ehzinXgesad1MbNlfefan6nxqlZIgQJgYszA
 6ohxdeIXNJhXuDKVvJ1fOKJ5AkagDQ4DU8x5k3uBg1MquP5CE6wu/3MnqU9mwERE4n1y
 2bD4HTxjro1kgtNLfidOOd8SVigBnH/Zt+kGfWmtBmYfSF7mPQ2lQEUeIGw8k01P+ESA
 UuPeSP41meGAWopi82xBTt3XgAat+MmP2IgdcZpjKeao0Fq7FWnzMW2JJougz0sngMu6 Bw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxdea7ubr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 21:27:10 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 294Jmjo5033933; Tue, 4 Oct 2022 21:27:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc04mhvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 21:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMF6bFvELiqEJu18BI05yZL23v7e+8kmgoekM7il72w1oiF5dHjhcgNZQJtIef7t6E/tnZTveB8M9l44ASvdYxFJYjHiPKYLN0IOLZoLVejP+Rzns/XtuH+GCp2GsyRFjRu7oZ+w5ktKSYb8qF9RPnNScrKWVIHjAje8wziQHbPCaxsSsdPXMj6x3wG8MXCHTN+xJgozDuzFj3Wk/fhJAx1I3ukeHz4n0NKh1qZtBNDuuYD1lRi/5rcnI0LsaX2rSnFrca5LpQM+0mM38xM5Msk9Bu77l5FC0TlpRkBYQdX2SujmMBw6gPCWLgvzINUv6CrGzrZdOLB9v6ZOBj6SIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L64pw0pbRB4qsM1ivZ71yIvM/uIW433fBMzra9LUc8=;
 b=YriIZJNwJlK/bugCow10OlUjQgNCDs5Onh1HZBj7AT6f969pFnDyIybziHOl9IF0NA5KYx/ItQwProExKKZb4yGSb0AoTCgrmDVbGW3mC9KhDPshvX0iNu9jhxtex2y9kjyJavuWwgqHI9qGGWHjo9t94HXkK+HVisYAnalgOF/6KWvjvQWB0k9ulmzrY8m3J5YzO+TnYw/w5/tVaxN0rdR/IkPnNr2q75ey7Dqd2z/sPdwILEZbLOroUexYsCg2Oy/bqr3LDeHOktWEuAtzSgjGpXGEyQ641GUPNXWCRXCAmutgknwcBhTD+1gaJEuQmPss7DvZYq73bS02MBhhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L64pw0pbRB4qsM1ivZ71yIvM/uIW433fBMzra9LUc8=;
 b=nACByrRCD3I8JfGXGfEJ/xxIoJs4VDG0yHmaj/Qkt7Ejaih/yfM5HkmOuG5PliW8rmgdKKVIVZXx753gZDmRw3uokD3U3hk/1arwsM2nAJwd2lexIak7UD1ShK7x9lOam+iSGAs4RGtg90n6ySrH2iB08arMDPBxWwu16WhSUjM=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 21:27:05 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 21:27:05 +0000
Content-Type: multipart/alternative;
 boundary="------------J4yNZsXLiAjmD2y7RMYRKQC4"
Message-ID: <45132fcf-6377-7b84-dc99-44dfa2404df3@oracle.com>
Date: Tue, 4 Oct 2022 14:27:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, eblake@redhat.com, armbru@redhat.com
References: <1664913523-3287-1-git-send-email-si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1664913523-3287-1-git-send-email-si-wei.liu@oracle.com>
X-ClientProxiedBy: SA1PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::17) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b9a5ef-40cc-4ad9-73a2-08daa64f2f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4h5vA5xrEO2va/W2/tGXV+veqhjilnKhdjXoHyp/cgdFTLDuYuvLiluZth2zmhwjkyxCh5KYPqVSlxz6xRbYS2h1DKa78iycyuVac7bF4FI5QH7naRoAE+FBrq8w5LjV2uJ2XoVV2k4JjxhfIcbyWtZH11Dkt/cyd/qlLcHZ/J6vKA57JlvF2wvx+m02VBKv0hubD3NWQFv3Li/kyNUSEyXlgTBKdpKFzx251PROirbYLuMSrTtFYGcVNhsu2cvGBug5jw1r4ZGvdeFPwfzBOHnVllt057jFIuA1fOSUfXuAMpkFx5tlMs08iMPSnjmLzLCM+sUddqCqC5AdD/JbwtYtDAb3tCJTMpNSKWTBjhqta6d1LQY+mxj0PfHQEUU2GnUPaqX+JBOFMiLo9qEhaxIDGsxccZ6nUdr6A4dco86Z3sxmaxQ5mzDojV6hIz8uABG1E6sUkEqLEfUm2H06rD0i1JfjbB788THFVcRoiB82JSio8ZRqu1nJfOyG/8ZzoZjJWQjDVSm5QV4jIQIcvuj26wPew85s5/h7JhjG7L0gP/+MgPbG/csAcSnnPlzDNLPDv8SBIaCw72aHN6di+XajFDBfiRb32q5qcdNqCNff+nxa8r0Jm/d2nJDsJ6T4hErc8tV8KjNHKCg+IFcLqd58x+LQU2BoYzcGliT5GiBDRRktc0PT203/AGT4S3O4YtLx1bedzs4YpqzmKz+F5JxrCu8Z285TaaZER01S53CaKWyZ4+7BsW053H7I3/e0/F8Oi65CPyXdJqTx9BC7thnmOoQ6E/iPnaRnT6vUDo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199015)(86362001)(8936002)(2906002)(5660300002)(41300700001)(33964004)(36916002)(53546011)(186003)(38100700002)(66946007)(316002)(66476007)(66556008)(4326008)(8676002)(6916009)(31696002)(6486002)(478600001)(6506007)(83380400001)(31686004)(6666004)(6512007)(26005)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmQwM3VtWXUyV281clJrV0ozTjRBazVNempCSjBsc2JGcnZ2RDVKeDh0dUUx?=
 =?utf-8?B?c2JBTHRZRzhmdVpSckVySnFhTkdIQ1dzOUlvZUZzYjNNcVpQVmV5L08yYkpq?=
 =?utf-8?B?WHBYcFpPWWhkRHpKN2xCaDQwbDV3WFJRZGRkVEVtRU1RYmIzRkFlYlBYZllZ?=
 =?utf-8?B?VktIZENDQ1FlWXU1bURKMTBqUzVyWjhhNXlMMnFPeTVFYXdLZ2orWGJ6bHpp?=
 =?utf-8?B?UnZLbHB4MEc4ZXllajRFaEVkbS8yOVlRbDNlbUtXZy83dWkvSVVYNmorVHBu?=
 =?utf-8?B?ZFNxUk1sRzlnSkVOT2ttYk5mblV4MlRRTjZ6TVRRNmppWWZzRFpXa01VVVdD?=
 =?utf-8?B?ejZGNlNtNHFWejYzZFlUdmdKdTRHUW9aeDJjNS9ENWJid2RrdEZCU3ZFbkFW?=
 =?utf-8?B?Y3hwalM0d0h2SnIzYXRGd05DUkxrRzJNM1hZM1RZMi8ranNsb0JrZklyQnNn?=
 =?utf-8?B?dTk0TW1Ua2orOExqVGVSOXZaY0wraXVsNS9DcUdJa1I0VmE3aEZGai8wWTVD?=
 =?utf-8?B?UytXYzVxVGFKUnFEWU95aURrT0ZNd2xKRG9GekdvNUJ5YkR3R2M4MzdQbzdw?=
 =?utf-8?B?ZGZtNGhOWTY4dGJYdGI0dXF4TWIwVVB4YTY1V09TdjZIODE0aWtBZ1RzRUlp?=
 =?utf-8?B?UUxSbGFiVEFKUFNGUThmbHpYTDk0alhQMFNyeWFKSEEwTUZuOXdUTDU4c2o5?=
 =?utf-8?B?ZFdadTd3cGpzL2V4VmRhTVhZOHovN3ZxZEE0cmxiMDVHdnBqTmY2elJ2c3dW?=
 =?utf-8?B?L0paUm5hVDY4bkhNQXk0WHBwSU1YMW4yZkNPcXFFS2d6ekhJMjVVd3VUOUxX?=
 =?utf-8?B?a1pMM2RtSFBDOU9DRTBCalN5TmlobDJ6aVNVdmxWUi92RU5OWkhHQVpjVTE5?=
 =?utf-8?B?aFliN2lEMDcvREwveVkxUG9jbXF5UFM2VmtTb0NMZ0lGTXVNSmdQREJKUkZF?=
 =?utf-8?B?eE1uZTlobkN4bUpJbU5DNVlDa01kSjU2OVFMUVNlUlZYcmFYVWlPR3RubXoz?=
 =?utf-8?B?Q0FaaFRaY3FSRUM3eDd4S08wRS9EUVNhNHg4dkFhd0ozVk9FbU9OdlErd2Rp?=
 =?utf-8?B?RzZWYTJkblczMDV5djNDZ3BZM2dHNG9TbTFuVVhHWDgzRElXbEJPbEtxTHJr?=
 =?utf-8?B?V2RLQ2JPOVBlL2trSjl0N0xidHdGQ0hNOEdHaW5TNjlNRlFnZkJyVFloTDQz?=
 =?utf-8?B?eC8zUG9henJNNmpmTWNrdGZtd1A4am1ja2xMRm12RlVZcTBDdUdmVTZtV2N4?=
 =?utf-8?B?cjVmVHBmRnhOeHZZY0ozaGdpSVhBK1FlRVZWZHQxQUNzRU9NTkV0Z2ZRcEF4?=
 =?utf-8?B?eE1oVTR1OWl0YXU0K1RMN3phYzMyd2NhTEhDOG5sYURFb0J4Q0xGaGgvVjZI?=
 =?utf-8?B?NU9YR3hhY0FhcDRvTWQxOVZ3WW9KWldOa2VCei9wMFZhTTFhdThvRGlaZHN1?=
 =?utf-8?B?engwejlzL2hTMEc3cmlJUytkbjhBTmdxSVkwYWVXSDc5WS9DRzNJbkFCT3Fk?=
 =?utf-8?B?b01Ld0tVcHRlWDh1Z3d5ZndOanIybGtTcXIyMk5mbEhOTiswRng1dERyYWlP?=
 =?utf-8?B?dW5lSzZ0UDFQcmxGa1hmMzVzME82RU92eDN4R3lEdUwwRDNnYUZVYTZJcWtQ?=
 =?utf-8?B?NnhrWStDcE04azA0bG4vSW9YM3RlRGdyMUFZM0E1V1gvcEhTZUNtSWpCdUxY?=
 =?utf-8?B?eTVxWjIyMHQyRFZzOUwzbmxtbmNtT1E1L1hXQzJnaDhPbi9ZOEVaYUFRQ2lF?=
 =?utf-8?B?amxpZmpzUitPZmI3Sy9xc0VpV3Y1di9pVm5rK3RIZXhkZnRBL1oxSFVPODd1?=
 =?utf-8?B?QXlYUzJudVc1Z2lvbjIxS1FJWFB2QWxQT2JIWnE2VGw4SUdqSXhoUnVMeEtj?=
 =?utf-8?B?QUN3RDJFVFpvck5ybVQzbFF2WXp5bjl6U0NBdCtyOTBhN3J2TVM5aW9RZUY1?=
 =?utf-8?B?cG9iTWN0QTZGa3ZLWUhwbzQ3RzJnMzY0MC9lYWJZRGZ4SlZraUdrbGVRRWhh?=
 =?utf-8?B?VVQyQTZqNEZFVkpCVTFLenlXTU9ReDJ2R1pXQU9BQnpPSEhqelhMMThsZU12?=
 =?utf-8?B?Uk1UWnA2Yjk1d0xqYTg5alkwVEF1WVlEWndPV24wajBKNk5paXdkSEJiWlJD?=
 =?utf-8?Q?mjXU+8emOst8g9O5yp7iQq9fD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iZFBJCzmq8rAACAmggXpRe+baZCI0Gb08K7btbD3YmtZMRqQSJ7EWWxLpUJJ9PlyQk9W/EACK9Pe6MJLZ118YMIz/jGUZiZ8A2iVJrJC1A2qWbMB2xQM9AovVtUFKLpYQbknTzI5rZktgKRRRmb0RO70n0Kr/qyxbUb0HTcug976D1+ArEm25iAWjQLoop6175WhvjZgfhu6+DkJPlUh7QUX2f9FzfXo6zbCqcQZuVUAkXfESsX4lRx1Th9s9Oc1xD03gOdX0Oa1qNeMc1uCzPIYGCAqJQCKEnoTGbFLvW/JBVgwg9z11ADFrU6YaBQFpocLeDw/4qy6aKEINexzLUq/LS8juheLk3ock3e1tFyhR5lnyWkIIWuTWvLWOyqqOlZ0ZFg2wYnvNju6FXWrEtiggK/DV2xXeLz4gW4AUTPFvloGItkN8SaBKlGedbgxUK7DbpZHCjYI0l9HxicwVrP2ww3BYuObRqHWicsM/Pnqep/QB1jXzvayzD3pXUiQoA47m5w0nQ2QQW2pRDW/F30QlGVVxTQ+VKCwlYoAPiKIlkujz1OiXxmm2cxmKziEWth0w4d9dnd50pr3VqDqAt4mIXWtwDzoGG5kipbLNDidQ0uKLgnZCaYd1g+sN42BVhPhyf3kVWZvhaSijAGhrGtbiFFRYKDSRvjVYdPnF1LCDtRdQp8+eRqyMFL8+BCz06/T4n/Yw5HP+DvwAEbmAD6SM9DHPXdguRx1T6BxEd2BgPccPsjFNkkZzpVMkPdDydojTL/RZS4cRMiudOEhWZW48pAsnVpeHgaptF2pTV455LtyxB1igbU/0kAYgN+kXvTQlm/hRkEeLChs0+o+ww==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b9a5ef-40cc-4ad9-73a2-08daa64f2f63
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:27:05.6824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHhqB49LVAUqCDy8pc0Tk6cLuRovgT5i2g8jLMYpIoUd4nG5PZyC4622MDhtJd2LmjlPMc0CjUTdWmoztKy4TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040138
X-Proofpoint-GUID: 5j9QJmu3yreJBQ7Towq1pD8EUojRMnGy
X-Proofpoint-ORIG-GUID: 5j9QJmu3yreJBQ7Towq1pD8EUojRMnGy
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------J4yNZsXLiAjmD2y7RMYRKQC4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies, please disregard this email. Wrong target audience it was 
sent to, although the content of patch is correct. For those who want to 
review the patch, please reply to this thread:

Message-Id: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>

Thanks,
-Siwei

On 10/4/2022 12:58 PM, Si-Wei Liu wrote:
> The citing commit has incorrect code in vhost_vdpa_receive() that returns
> zero instead of full packet size to the caller. This renders pending packets
> unable to be freed so then get clogged in the tx queue forever. When device
> is being reset later on, below assertion failure ensues:
>
> 0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
> 1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
> 2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
> 3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
> 4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=<optimized out>) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
> 5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
> 6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
> 7  0x000055b8f71f1620 in virtio_pci_reset (qdev=<optimized out>) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
> 8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=<optimized out>, addr=<optimized out>, value=<optimized out>,
>     size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at /usr/src/debug/qemu/memory.c:483
> 9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
>     access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x55b8f6fafc20 <memory_region_write_accessor>,
>     mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
> 10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=<optimized out>,
>     attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
> 11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
>     attrs@entry=..., buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=len@entry=1, addr1=20, l=1,
>     mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
> 12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
>     buf=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=1) at /usr/src/debug/qemu/exec.c:3306
> 13 0x000055b8f6f674cb in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>,
>     len=<optimized out>) at /usr/src/debug/qemu/exec.c:3396
> 14 0x000055b8f6f67575 in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=...,
>     buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=<optimized out>, is_write=<optimized out>)
>     at /usr/src/debug/qemu/exec.c:3406
> 15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
> 16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
> 17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
> 18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
> 19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6
>
> Make vhost_vdpa_receive() return the size passed in as is, so that the
> caller qemu_deliver_packet_iov() would eventually propagate it back to
> virtio_net_flush_tx() to release pending packets from the async_tx queue.
> Which corresponds to the drop path where qemu_sendv_packet_async() returns
> non-zero in virtio_net_flush_tx().
>
> Fixes: 846a1e85da64 ("vdpa: Add dummy receive callback")
> Cc: Eugenio Perez Martin<eperezma@redhat.com>
> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
> ---
>   net/vhost-vdpa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd0..182b3a1 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
>   static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>                                     size_t size)
>   {
> -    return 0;
> +    return size;
>   }
>   
>   static NetClientInfo net_vhost_vdpa_info = {

--------------J4yNZsXLiAjmD2y7RMYRKQC4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <font face="monospace">Apologies, please disregard this email. Wrong
      target audience it was sent to, although the content of patch is
      correct. For those who want to review the patch, please reply to
      this thread:<br>
      <br>
      Message-Id:
      <a class="moz-txt-link-rfc2396E" href="mailto:1664913563-3351-1-git-send-email-si-wei.liu@oracle.com">&lt;1664913563-3351-1-git-send-email-si-wei.liu@oracle.com&gt;</a><br>
      <br>
      Thanks,<br>
      -Siwei<br>
    </font><br>
    <div class="moz-cite-prefix">On 10/4/2022 12:58 PM, Si-Wei Liu
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1664913523-3287-1-git-send-email-si-wei.liu@oracle.com">
      <pre class="moz-quote-pre" wrap="">The citing commit has incorrect code in vhost_vdpa_receive() that returns
zero instead of full packet size to the caller. This renders pending packets
unable to be freed so then get clogged in the tx queue forever. When device
is being reset later on, below assertion failure ensues:

0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=&lt;optimized out&gt;) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
7  0x000055b8f71f1620 in virtio_pci_reset (qdev=&lt;optimized out&gt;) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, value=&lt;optimized out&gt;,
   size=&lt;optimized out&gt;, shift=&lt;optimized out&gt;, mask=&lt;optimized out&gt;, attrs=...) at /usr/src/debug/qemu/memory.c:483
9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
   access_size_min=&lt;optimized out&gt;, access_size_max=&lt;optimized out&gt;, access_fn=0x55b8f6fafc20 &lt;memory_region_write_accessor&gt;,
   mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=&lt;optimized out&gt;,
   attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=len@entry=1, addr1=20, l=1,
   mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
   buf=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=1) at /usr/src/debug/qemu/exec.c:3306
13 0x000055b8f6f674cb in address_space_write (as=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, attrs=..., buf=&lt;optimized out&gt;,
   len=&lt;optimized out&gt;) at /usr/src/debug/qemu/exec.c:3396
14 0x000055b8f6f67575 in address_space_rw (as=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, attrs=..., attrs@entry=...,
   buf=buf@entry=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=&lt;optimized out&gt;, is_write=&lt;optimized out&gt;)
   at /usr/src/debug/qemu/exec.c:3406
15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6

Make vhost_vdpa_receive() return the size passed in as is, so that the
caller qemu_deliver_packet_iov() would eventually propagate it back to
virtio_net_flush_tx() to release pending packets from the async_tx queue.
Which corresponds to the drop path where qemu_sendv_packet_async() returns
non-zero in virtio_net_flush_tx().

Fixes: 846a1e85da64 (&quot;vdpa: Add dummy receive callback&quot;)
Cc: Eugenio Perez Martin <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>
Signed-off-by: Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd0..182b3a1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
 static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
                                   size_t size)
 {
-    return 0;
+    return size;
 }
 
 static NetClientInfo net_vhost_vdpa_info = {
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------J4yNZsXLiAjmD2y7RMYRKQC4--


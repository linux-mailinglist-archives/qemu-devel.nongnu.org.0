Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1174CC215
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:03 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnsz-0006Gl-QG
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:01:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPno2-0005oK-3x
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnz-0005da-IH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:53 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223F64Tj007662; 
 Thu, 3 Mar 2022 15:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2MvBhC9+VhtcD9snnmJDjn4UO+tHOGALHackguNJWcA=;
 b=TDoXK4SaaaB2C3Wjcv/qL9ZuccIgwycCQydlumndWtZGR6KjmXi8CSrrqEjpaegXbD43
 FOxTZcwjA6MBQhebDwne0rQqdVNG6xeBZOoREPB+OkVZCuq1TzKw8K7pBgjlIJV5b2FT
 zyT6U9ASW2io27WBOonDgY+pTw91PCvBlv1bSRZniOEoMjNkYyvohzS+2W2SDcPhTKJV
 WpoVwvY/BndMfBlIFPkEGPLgn4o5HNkHCQAKWmNNJdbYsFozpvdhCJjPoYn4rsASkTED
 ekvd9lTLhwCWAnlZRzA8onaZY4A+ThS+INPFN0sersOiBUeC9Fe1b5DO0z7PPCpte1AV ZQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15aryum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223FtR25133979;
 Thu, 3 Mar 2022 15:55:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3020.oracle.com with ESMTP id 3efdnsws2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy23IYJNHnzWS1vuplQ9Mv/npb8drrRZGjabVxymIJTdZHPjDgIumlp3R7y1epuDufPf818R4N4bHPj5egIP8HQTFp+m9nMYljMoD4mgKwDbI2pPuy71q+14GRrklb1aysMCH4tdkwkucBkd36wy1UgsLeiZgh5VKsUGioCao8ImPqAtBh5zYjWQCtfJG0HG2hiPk3IFw8AlEDmb3SbNxNet1oEm7GnoAfOsyHKmXvOxThJwPBh6lXsNvYdUHDRITYy+RVcX0H+HA3YGfhEfo3dio1I0fea7MxAW6NJ7pljxYbpm/iNZFOYfXQY0SfaJHLy1PKPiC68XuChdPdmVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MvBhC9+VhtcD9snnmJDjn4UO+tHOGALHackguNJWcA=;
 b=ECYdywUsUAOTe4BW0PiB2I2vmQ7rwOmUrGp4kUlmO/L+oXUL1JBNW25C1lhw/CS/qKoFQ3LZsDTjvXZYBVjs2Flx9RXQ9ezIZhNL6Ms3tV39J+gTNwJsHXEpa4DhSX6YykamMGY7vMGFT1dBUeQd5KzO0wjZTQwLNBSdptzR6qt+/PP86RbnL5A5u7650FZXf7k4qgi6qejFsGjVHK/tbfe7zUPWaxuq0yjDMCG6wVbLVzaDXK10hBgIjG0unjEF4MIvlHqfT6fA/0XBCMohVwwvXKjRLVnOhKRj7yw8QvtKfDZIMm8Mxq+GsuAe1i0UXsUj0KEruTHvO5FbWMY4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MvBhC9+VhtcD9snnmJDjn4UO+tHOGALHackguNJWcA=;
 b=m/GCqwoYF9QlvjH01tIW6wtcekB/fPHc1I2P1lg1ow452a1GSvVCe3bBoCrVNwNLB40E08B7gQaIaPaV6TEBBzSziMBPCRNN+vioy1lcS8Funrwj08YAd+CF/pyiyAprhdEwA6lNYIYudKZw3AtfDsCCyXAUAefLo7SQkdB5pC8=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM5PR1001MB2234.namprd10.prod.outlook.com (2603:10b6:4:2c::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:55:42 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:55:42 +0000
Message-ID: <4d55c906-48cd-e399-f5dd-5baa3d9debc0@oracle.com>
Date: Thu, 3 Mar 2022 10:55:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 02/29] migration: fix populate_vfio_info
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
 <CAFEAcA9OvfUdKrVtisL3hd-WqimimNPfgKpQDm-sFNOSnPOZZw@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFEAcA9OvfUdKrVtisL3hd-WqimimNPfgKpQDm-sFNOSnPOZZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0011.namprd02.prod.outlook.com
 (2603:10b6:803:2b::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 556a7eb6-b53f-4ebe-02d3-08d9fd2e4511
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB22341549F5E687DC6EA99326F9049@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLwrVxgZkWQ5mK1Q2yYnByC+wp6EGWeLVDKV8EwWchnoloAatnmWaT1f4BODHdjITdgUlgm4/94QNPnc4H4TE6F0J+AD43K9caUfRHjx+Cr2qSh2BZQr+OLXzqXEoV2FMQ2L3la/wJscgjTaxATY+CpZ6CxRyaFbut3uQFBSroWgMOBNlGOs8LjvAjMAHqtb//Wyz9XPdxvAD0dzBbr7MTDzrtHd2ewnstfprmfF0UdR5a8QsqWlhxMv3tuads2573bSIOgrV6nV4VErVowjcDQmGRTRu9A7wBlcO6HCgm4SvEf743QT6yHAi9FSYv+fIAwNZSNFtJGaoFwaNaf0Yq5+GD/+dU2OyLr7jaUsCCB0CaD3FxQucBO8vs6lky7FZ2VYVkdx0skAzJoq4I2QlzVResMv3aMQxOw8W+6TUZW4MzCmhXQ6cRIX9Lcwgo7At0lD7STitQMEZx04sgyfVIBF3Tcji8tNkHJ2jHnV1Ujc2X3OX7v9SaUMkIcnWfFwa7Qa51e9B8eFjJlaWen/9BZ3/C8G1KesYZwunIleuYh1Aa1rIDY7U7MG8qs1zXa4L+LwNq4sJ8mGkbTU0LQnr4S1L9bPnQ1AWP37nNioOTlzpVIJu/mUztnIIWEhRqdoRo3hp+GDx6OCpVSY0mJuB28xUHUU9gZdm4savRkxCcjziX0Nx50NDL4jOK9JEujrmYcD5E9sR9GZfjS47Jxhnv4udFDQPCIx1bKcEtXENFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(186003)(508600001)(26005)(2616005)(31696002)(7416002)(8936002)(5660300002)(86362001)(44832011)(66946007)(8676002)(66556008)(66476007)(54906003)(38100700002)(4326008)(31686004)(6666004)(6512007)(83380400001)(2906002)(6506007)(53546011)(316002)(36916002)(6916009)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elVXM1RkdWkybUhCZkNKMGdHUzJkTnRBWUxNTExCM09oUU1vZEVDQXJNSGFD?=
 =?utf-8?B?ZUR1UjBjVGJOOTFsekZrTGU5ZFhMdGxrc3YvZEhCQWRFSlk3dHBMaUt1U2VF?=
 =?utf-8?B?Zjk4QUNDV1FHYW5HZnJHVkM0SjdSWTZJL2JlS1dZUklSTld1RW96N3JwOTcx?=
 =?utf-8?B?MHJXZjh2NTJYRmxZMmdxRll5dVpXNjY2amx6RHhrRHdLZnQzS2RNWEQ5dmtF?=
 =?utf-8?B?MTVHdFZnREhxRlR5UWd6TkFieVU2R1c2MHp5aDFJMjZCVFpLdnE3ZXBmY3kr?=
 =?utf-8?B?c0REZGY1d2o0Y0thYXovMVloSWtwcSt5cUVTQUhZRkRkUEh6ZWk3dTVSMDZt?=
 =?utf-8?B?Nzg3enVNNmh5V2ZiU2ZCUlFpNnp1dk04cWU5bFd3NTEyZDlJNTMwSGMyNkRz?=
 =?utf-8?B?RmU2SG5ENEx2SVFVRFFIOGgxL0k4Ny94Uzhkbm5VWEhnZjB2aXplQ1J0SzRn?=
 =?utf-8?B?dERRNUQ2V1pMSUtZeUdwNmFmZFZzQzhNNVFlRjFxaElORXFOd1FOcHhyUUoy?=
 =?utf-8?B?UUVMZHQwTERNMzF4QzZhb1daZFRORUdiQUxmY3ZJdDNTZVUybDRrSzhKditW?=
 =?utf-8?B?MWRLMkw0aGR2Q29say9pRmIvdEFJTE1rUWU2RXhDdUtKaTkzUlFFbUhDanlt?=
 =?utf-8?B?Qnpzc1R3NW9jOWxQRnhpRlROVzZxOWlsU1dmd1hLNlN3dW1XU1pTZEhtY0Rq?=
 =?utf-8?B?VjlmTnRQZ0RtazM3cUIrRHBLS3pSMFFjb0Q1bXJ3Y1lXbm9SaHlHWDU4c0lx?=
 =?utf-8?B?SFdzY1N4bkxiUEgyS3gvUVFQaURGYnZ3MUtKU1JXa1U0VFhNNmo2SXpnVHJt?=
 =?utf-8?B?UUZEbDRFRWdLZmVQOEZaalhlcnU1ZHVPaG5XNTJBL1cwK0hMdk5qWm9mZ1Jx?=
 =?utf-8?B?bGo0NzNxYXllSkd0UThOWitOa2Y0SC9hbVlzZHFLWlE2ZDBiQW9QekhhVGhy?=
 =?utf-8?B?NkVURlFPbWplaEFPcVkyZTA1MXJZTXdoTHh4YjlSbitTclVFdFNVNEVVemsr?=
 =?utf-8?B?clFaNGoyQ2htS1FUSFI1TnRDT0czNFVrWGxZQmNCQkgwZEJrcVd1allnWlpv?=
 =?utf-8?B?dWdWUmxFK1FqMkx2RDBzQ1ZqY2NHcUtIWFB1em5FSHhMSkluY0wzaEt5eVhq?=
 =?utf-8?B?MEtBTmNnNGM5Kzd6bm1sRHBhR3NHV1NvRklKTER1V201UFFRS2NLRHZxZkNG?=
 =?utf-8?B?Z2poUlBkci95My8xQzlRSlF6REJqejZHQncyK3EvZzJZWDl3T3NHeVpZSjc2?=
 =?utf-8?B?TDVzVE92VVNVdTFiNU9PdHRCYVhXM1ZVT0k1SEFJMTFncUI4dWlRQkRNNzky?=
 =?utf-8?B?Y09CWlArSldXOFZRNTZjVkZoQ0ZXMXNGSlIrbFdMTHhvVzgrd2NabCtXN055?=
 =?utf-8?B?WDZJRDVHZzhtUDBYTHU1OXhKRFBQYlNLWE1nSXZLN3VoMFRhQndJcG4rM0Vy?=
 =?utf-8?B?TlNJSGRlZ3RSRTFTcnBrY3doTU1LWGpxVElnUWhRWW9pQ3NZOVpMaFgwYkh6?=
 =?utf-8?B?UWxHT1hmM2lnaU1pOCtHSEMxODRFemNDV1lLcU5zT3dZdHhRUThpNHJndzU0?=
 =?utf-8?B?dEwremR5d1hoWXdjeVF5N3poTjAwdG1hSDU5TG1TcGhsdDlEbVpvb3B0c2dI?=
 =?utf-8?B?emczM05ORm9kd2JwT0cvMmkraWFrRytrZThZYkg5aWRLU0VoSzZQK3ZjZ29l?=
 =?utf-8?B?L1BSNWNpTk92MWMrQlNZL0IrdXl5SGlFZFV2T2hyR25tM1lGeGF3TmpLSThi?=
 =?utf-8?B?Wlo5NU5jS0VDSUMvQklNMFNUbGtCdnNTcFd6VG9ROGN3QjU3ekJ5TFdGMlM3?=
 =?utf-8?B?NUxSVkdRVHIvTWhHaWJ0dmwwRksrOVQyeDIvWFR0NWV0akcvckFMTG1RSlAw?=
 =?utf-8?B?WENnRFQwL0pzYy9wSlZMTmNhS25UcW5RaXJZeGdvT1g0c2ZWZkI4RDlBNEZ5?=
 =?utf-8?B?RFhEVlJ2N2Q0MGNSelc2OTdONkNqNElIdHA1YnRIVmZuOENwTlliUTlNTlEz?=
 =?utf-8?B?LytLcUlzdjl5N0ZXVDNnbW9vWldpTzlNMGJFTTFOeGxlQWJhYmFnQkk3c1pD?=
 =?utf-8?B?Z2FTT0dSMVd1WGJ2WEd0b0cyZURHc3lVcExRYStZeGo4TkFWMUt3RTBDYU1W?=
 =?utf-8?B?M0wwTEhOTkxBQjVwWFM0RjhFeW15eXRHakxQVUNVRDRMcTJJTHJTNjVWOEVr?=
 =?utf-8?B?M25yT0VDRXI3U1ZRTEx2K3FQeFpvSWw3UlhKWVpPZDRPaHRZdGh6ekx0UGda?=
 =?utf-8?B?aFBUQjBrZkJZSmEyQWpsdHhzcWNBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556a7eb6-b53f-4ebe-02d3-08d9fd2e4511
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:55:41.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bdt3i7c7mOUzn7ArWGO1J8ttDXdwJ6USZoS2sB/blFiLVg6+prfy9y5m9Ey8gWv/cYGVPHcwxO5Ysqf49mbtNExaX2uRSY0vqcNG6yz0xcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203030077
X-Proofpoint-ORIG-GUID: Pd9Q1-nyJckWFawGT0F5sVu4flkSa0Pi
X-Proofpoint-GUID: Pd9Q1-nyJckWFawGT0F5sVu4flkSa0Pi
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 1:42 PM, Peter Maydell wrote:
> On Wed, 22 Dec 2021 at 19:45, Steve Sistare <steven.sistare@oracle.com> wrote:
>>
>> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
>> CONFIG_VFIO.
> 
> The commit message says "include CONFIG_DEVICES"...
> 
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  migration/target.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/target.c b/migration/target.c
>> index 907ebf0..4390bf0 100644
>> --- a/migration/target.c
>> +++ b/migration/target.c
>> @@ -8,18 +8,22 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/qapi-types-migration.h"
>>  #include "migration.h"
>> +#include CONFIG_DEVICES
> 
> ...and the code change does do that, but...
> 
>>
>>  #ifdef CONFIG_VFIO
>> +
>>  #include "hw/vfio/vfio-common.h"
>> -#endif
>>
>>  void populate_vfio_info(MigrationInfo *info)
>>  {
>> -#ifdef CONFIG_VFIO
>>      if (vfio_mig_active()) {
>>          info->has_vfio = true;
>>          info->vfio = g_malloc0(sizeof(*info->vfio));
>>          info->vfio->transferred = vfio_mig_bytes_transferred();
>>      }
>> -#endif
>>  }
>> +#else
>> +
>> +void populate_vfio_info(MigrationInfo *info) {}
>> +
>> +#endif /* CONFIG_VFIO */
> 
> ...it also seems to be making a no-change-of-behaviour rewrite
> of the rest of the file. Is there a reason I'm missing for doing
> that ?
> 
> thanks
> -- PMM

I'll change the commit message to explain:

    Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
    CONFIG_VFIO, and refactor so only one ifdef is needed when new functions
    are added in a later patch. 
  
The later patch is "vfio-pci: cpr part 1 (fd and dma)"

- Steve


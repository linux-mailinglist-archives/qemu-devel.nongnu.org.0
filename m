Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A74A8B82
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:23:37 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFglc-0006nt-JO
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:23:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFgbc-0000Q0-G3
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:13:16 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFgbX-0003OI-Ri
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:13:14 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213HTDUP011870; 
 Thu, 3 Feb 2022 18:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/597d2D5+rrNbqpOEty6ooILwamVLG3UwPJYdXsJ/HU=;
 b=eX9M5zUKbm4FnJm1V1Nwyi+/H8rSeZzS93q5QQvgvttqzkNOjvaikJzDm8IYzgFW8PKy
 x23RR+7ThxVgA2vZU4btFS7fj6XRSA7lnWZbL2/r9FR5VhZCkwYtQdpNkwHctQ92u4/k
 7YyyCVZi4v7JDjsA2k8PyYY46ITNnoElDqIW6V2M/TPmKd/97FVcxauW9mhIVdchUnDj
 dcU06NzxZg1DUykkTKi+HzvZLmjg7z9ebfBjR9++ZYHcb7z87m/2/h3fYK1Jb929wmME
 ZufGFdv3STnFaNXPRaP0rhBBp55AXeHLH5z9Db+eH/vkZkaP2wWYTKMkxW84CRIFuAnT XQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e0hevrjvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:13:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 213IBmwi074057;
 Thu, 3 Feb 2022 18:13:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by aserp3030.oracle.com with ESMTP id 3dvumm2pd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpyG34bvrI2UHd3LS1kEh3P51F9ZUELD3kxcgM+22Ry5vC8d7xkvUpdNINDo58PJoCcmYKfXyVlRyVZCa7dVEDpF+N4DFAfxRn2hgWWoKMDjIUmcK3LlMM9O7RsCiv/2Pv5OhemS0aRUqDqCGp4+rSu7G9zfkwPjhyTRRKbUvgw2K86xH9YjHePsz1us+/MyzfX8/hjC6gomUDlALqYEhfXj61xOjRsYnkFXLnHRfQIJZSJDY+qbc3TarXPwC+gIgvnaZLjbg7dLXi7pzUVsLSKXbRHvZm2WQD/hiLtw1lylOtNAA6/xYY7VRjp0Da1DudxwQZ0hhXWBLrh07TMn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/597d2D5+rrNbqpOEty6ooILwamVLG3UwPJYdXsJ/HU=;
 b=B4xcSbiSszfGKhDKhh5dHhJkUNX7O29GB8c1/quupHaATelN2n0i9mpRWx57xatsspRfs3WsxGaa8Y2LVKV2mdqaArIOfx27zUXsa8xplZLAPEu1ORlwBGoqq3wEhdK5XDUzJ3TTBAkcVOpoaRiUph89s28NUPQoe2yvfuW/gouqztOInyqfKJACKfAGoQrd46y08zo0TB5/fdkJK0t8k7vfZjSakkyh2AiCdW+97FM/bWYW3UvtNtEmay0tUr6p0v3mz+eEtY5NG8UMH4eVQF2OHG/wJL1NVIZwWI1QAFaNpLtmYzjajpPEuXm8qVTkXhl+X1v90H0UvoevrSShFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/597d2D5+rrNbqpOEty6ooILwamVLG3UwPJYdXsJ/HU=;
 b=hJSc3WcxbNqUNUW+rGsMkpwvQfpBayb3/iQQuJ01Z6JCWCKuUNd4j/RvOC+WVkWWq08Wk+WzNGwP2olCAFPLg6nOFQruZi6dUoKWPh2uA/i+uSMVEEuV1LYnFRCsXbN/o2wPNg9B0iFlqH+T+PDVfaWMdP3LP6nRvYhx2xbe++A=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by MWHPR10MB1663.namprd10.prod.outlook.com (2603:10b6:301:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 18:13:00 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 18:12:59 +0000
Content-Type: multipart/alternative;
 boundary="------------PZGlwj8QRAcCjAFpM0Y7MBiH"
Message-ID: <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
Date: Thu, 3 Feb 2022 12:12:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <YfkiyiK+jfrdbVcY@redhat.com>
X-ClientProxiedBy: SN4PR0201CA0011.namprd02.prod.outlook.com
 (2603:10b6:803:2b::21) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9973196-3811-4e77-65e6-08d9e740cfa8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1663:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB166388799B9C90B7F78682B9F9289@MWHPR10MB1663.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9FEZq8gpZ1TcHFpTpgZArBVPUzbUElkAxb1cYI9YyIX+KznDD4TE+Xeeq6gY4JKNVMugdsrW0FPGbND+BAa9XEJqnkvVJYr/YqzCn04fkKqOuHz4G3ZerLabkoPUzvlHZerFMaalZ9gbFBqRXshRrH3Vaj8cV+l4RD33Aty/8HGEhnncgv0ghEEqwVqkJSJNMzrgKZAu+HGOJ6QCsSzo4PjFTfjBYlRyCMaTkSRLWeYf/4DHQM3uPjzSocovWrNvu7YghY4Zr0QmZrZzW7Q4Yj5dywkEgNrWb0lszIwdePXQcYjvHWbxJI2jODT8AdZp+2UVHBpROXaViWm7StHOGh7jfFkMdYz2kwD9X151F8Ogq1ICmJBI+sjJvsGwZVflWHl0m/XOYkz57KBrhqU63Ygiv0OS17jXD6UNQ5n0+9s5+8Wx2xTCpqFnopsca/Kk2y0n5V0qnZOE/BM1u6EFcPFXUo14SC8qjc75K2WuZgXckiPjLxNEDz44mRj6rO1CF9ta2OKrJ2eKLu9RW4+bvqrQnH4iAVHwI+C+5EZf12fV8Kq3HBsBzZqLoiqnpWVb0Ieo81CHIVTLt12jZ4n9YnWPb77iPcNwVJPo/KL9R0ku7rZVppJdWhJ7db6skFRb0LtUit6yicQQgsJfoJKl7AW9PAWZkhQcabe15MsXiou71XWbGVDsVdrK8QO9K5L6VrWmnVI8fM30XnRZzLD0TtRKABxFIDUI5V38hCmJYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(6486002)(508600001)(6512007)(53546011)(8936002)(8676002)(33964004)(31686004)(4326008)(36756003)(316002)(66556008)(66476007)(66946007)(6916009)(31696002)(44832011)(86362001)(2906002)(2616005)(26005)(186003)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTR4MUYvMks2ZlhuQ25lSVFGdjFTNHV0cDBpZHNhMEVPdEkzQ2FRVmNOelps?=
 =?utf-8?B?ekNzWFVyTmRxS2crckVOYTFPODAyM1pydGwyWXdPNVlOekRCUmp2aE14dkRv?=
 =?utf-8?B?ZG9OVXlIMy9tZHI5dlNBQXl4dk9ySjJTWWNiS1VraUxzSVdpUE1RNHJtMERF?=
 =?utf-8?B?NHFkSWZ0bGcrVkNxMXZDM3JUOWJkT2ZLMmRic1FxTjRLRnY5U3lqR3NZRWcy?=
 =?utf-8?B?TU9xemNXVG1PblJFR2dYN01sV0hydDRVTy80SlY3T0N5S3Vuc09oYTVxcGVs?=
 =?utf-8?B?YVpHT2lweUI2dXVXQVNRU0FJRWhBV2JNaDlnamdYdWlDbVExeHc3TGhpTXJk?=
 =?utf-8?B?elhKZVBmMm1GSUowUkJ5Wk95QWR1eGovRFJpTnA0dUgydkFXZDVndC9qR0RU?=
 =?utf-8?B?WUt1YkRIdTlGMFJwZHZoQ015dVBDa2VrNG1JZkxKeUk5UkJFWmVDdUN1eEti?=
 =?utf-8?B?eUtUTWZnR01HZFV5Z09GWnBLRjF4bzFFTVhWZ2ZKUHVXRUNHOWVnckRtRTBG?=
 =?utf-8?B?QU5RNDNDTnV1cmZveEQyUXRMODI2b3ZyR0dJcWltOFNhTm9BbWVLRTNJaGtQ?=
 =?utf-8?B?SEF0M0duaVYwdGpwNGNJSHJjM2N2VTRpQjNLYXJFSjlKeGgwL2xkdTc5aE1t?=
 =?utf-8?B?WFF0U2dYZzR2bmlUTkFic2VlTzZOV2tLeWpQNzBTNnpBRU1WNFNPc2QyUnBU?=
 =?utf-8?B?Z2x4UzVvRjdia2oxNytXQkQvWGJOUVlIV0xKN1VDei8wMUxIbjlIaS9hL3Y3?=
 =?utf-8?B?Q2VWZFFqQWZvR0E3TEptSm1VcDJKY2wwM0x4TUExd1V4d0p4T0x1bE9wQk8r?=
 =?utf-8?B?OUxobTBoZjVNQVRySFljQzd5SmdYenAwNWNHUWljTnRlZmczZ205aVJqdEpD?=
 =?utf-8?B?TTRoWmxrUW1RYXJzRG81eUt3L2xIMWsvd1RnTjhjeVRKSkg1bWpuQkluTUZO?=
 =?utf-8?B?TVl2enN6eXJ4UFRraVJRRHVNRkRtRnJ2TkQ4WlVuZkpiOHhBb0hjd1c3SC9n?=
 =?utf-8?B?ODdjNkxPd3pHQndTR1VBdndYTjRyU0kxc01iSnorcEY4R3Y0K0VKNlU0S3VO?=
 =?utf-8?B?aXNFTFAxZENpSzg3YmZJV2lYWUtGZ3NDLzlTNjBucU5YVEpBMTZhSk1pNjF3?=
 =?utf-8?B?R3Nqa2l1WUpxYXZUYXg4aVpld2MwTlNmUXY1WEtkd3BGbGMxTUJOdzdVeXZw?=
 =?utf-8?B?Q0JQWjZrUmF3Uk9lak1NajlTV1IrR2p0RWpjN3BhYWw0YkVMd29MTUNhbzdI?=
 =?utf-8?B?N2pPMGF6N0RjY2VPMXFvM3piSkZYQVJrM3pqd0hnMktNRmo5cHVUdElKMHhW?=
 =?utf-8?B?b0RxSUJtYzE4NVlRSzhaWFc0Z2xRRm4zOUVHZ0loNGhjNXRxSC9zeUgrcVRo?=
 =?utf-8?B?VWprVFlrVXRKVGNTWnJLWUp5RTFKZWxZUnZweWp2b0VSNk5DbEF0UEIzNnpw?=
 =?utf-8?B?dlBCWlZDUVBBRVkvd0cyRmhXUE5FOWs3NU5Ma3FWVVF5d01ialRDRnh2bFJu?=
 =?utf-8?B?dmJWcCtHeHNMSitxcTlYYy9hR1VDY2ZEdW80NHNENXZ3RFlYVlkwbHdCaS9K?=
 =?utf-8?B?RURHdll1bHplSWt4SUlnRHhvTTA2eVBIMmo5T1R6Ti9uK0I5cmJFU0VHa2FB?=
 =?utf-8?B?ZGJQNTBpZk55MkdCdERabnZ1dmU4RkhnZ2ZxM24yZ240QU1lRWViRXdteFhQ?=
 =?utf-8?B?YiswenREUGNiMTkrRXNyWVNlamhxV2lTaVJQMzRaRDFPckR6bDJOWmhiZTlT?=
 =?utf-8?B?bDErZ2hqRlVhV3p6YlZ3RDJaRHN5bHFqenZ0dk1vS0UzcGJnWmFqckljR1Ja?=
 =?utf-8?B?Tk5SU3FGVCtGY3lkN0VyRDQvNHZGRGRxZGtIZTNlQWI1eStwVkNwdzdRRXEw?=
 =?utf-8?B?NjRSV0dZbnJzMnAwY2JqMlBVaVZhdTBCcXhQRzF0ZjVYaTdKMFY1NkVkOUp0?=
 =?utf-8?B?ckkxU0NlYmlocWlnWi9yaWJHR2w4cEZWbVEwSkphYXJhWnJlRmdaU2FxNUJs?=
 =?utf-8?B?b3NIVzYxVnhOQjJIbEFDWUM2ZHNtcXl6dFA2eHorSzE1ZTR0NDRhMTFZUHFl?=
 =?utf-8?B?WUVhLys1cDZZTC8wSkVrbXFseFc0end6SkpmNmR2Mkg2MGo2dUdwb1ROZnQ2?=
 =?utf-8?B?SGpDazQ3RjgxRW1aQTNrQndBejFpbzRZMkhCV2lJRXpGVDRwdFBmSGVKaUlk?=
 =?utf-8?Q?M/FQfAcHWquU/HicKAhStfA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9973196-3811-4e77-65e6-08d9e740cfa8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 18:12:59.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi8OjXf4iVqtFR4NonaNOK7qXoKgMT04fe6lJ3gGBfN4cIfE0tgp0/3Clx9ZGb/fBHenTrGb3YFMjHDLjBcAzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1663
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10247
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030111
X-Proofpoint-GUID: A7FtCb3Xul_AsJa7km-W5pKjXtrAg04f
X-Proofpoint-ORIG-GUID: A7FtCb3Xul_AsJa7km-W5pKjXtrAg04f
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------PZGlwj8QRAcCjAFpM0Y7MBiH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Daniel,

On 2/1/2022 6:08 AM, Daniel P. Berrangé wrote:
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum' : 'StatType',
>> +  'data' : [ 'cumulative', 'instant', 'peak',
>> +             'linear-hist', 'log-hist', 'unknown' ] }
> IMHO 'unknown' shouldn't exist at all.
>

I added the 'unknown' member here (and in other enums) to handle situations 
where QEMU is behind KVM in terms of enumerating the various stat types, units, 
etc. I feel this will be a semi-common scenario (old QEMU on a new kernel) and 
with 'unknown', QEMU can at least display the raw data.

That said, I happy skip 'unknown' entries if you think that's better.

Thanks/regards,
-Mark

--------------PZGlwj8QRAcCjAFpM0Y7MBiH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Thanks Daniel,<br>
    <br>
    <div class="moz-cite-prefix">On 2/1/2022 6:08 AM, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YfkiyiK+jfrdbVcY@redhat.com">
      <blockquote type="cite" style="color: #ffffff;">
        <pre class="moz-quote-pre" wrap="">+#
+# Since: 7.0
+##
+{ 'enum' : 'StatType',
+  'data' : [ 'cumulative', 'instant', 'peak',
+             'linear-hist', 'log-hist', 'unknown' ] }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">IMHO 'unknown' shouldn't exist at all.

</pre>
    </blockquote>
    <br>
    I added the 'unknown' member here (and in other enums) to handle
    situations where QEMU is behind KVM in terms of enumerating the
    various stat types, units, etc. I feel this will be a semi-common
    scenario (old QEMU on a new kernel) and with 'unknown', QEMU can at
    least display the raw data.<br>
    <br>
    That said, I happy skip 'unknown' entries if you think that's
    better.<br>
    <br>
    Thanks/regards,<br>
    -Mark<br>
    <br>
  </body>
</html>

--------------PZGlwj8QRAcCjAFpM0Y7MBiH--


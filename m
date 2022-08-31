Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C725A8762
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:15:47 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTU7m-0003WT-6q
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTTy9-000647-Im; Wed, 31 Aug 2022 16:05:55 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTTy5-00024A-Va; Wed, 31 Aug 2022 16:05:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VHiYCo026519;
 Wed, 31 Aug 2022 20:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=dBZgJqtzY/IFHjLJ0ws/IJHneuP0dZLg1HBdNMzNR7M=;
 b=re+YwzIM+zdYry2mgciEwwwZlgA9pZx1YxlEuZVFQWpIFoymvUZOlRcqnOPN2u37FBy/
 ywzeW8CJCl+PrS5lie4+MzkkAF68jhFFchEBKyWVsGpWHKDdE5z6ED1ENOi2br7b6RmW
 ExLuvy0tzkd6MeE8nBYpXloX2xhNEuM++B1yuu2JOpciKDLRQIS+/wF1a+ejeEXZJddd
 03Vxbu1SItUTLNKtm0DwDGsmv/ugrsf7yZhYBa0YGJIxBZYVaObArfx5Cj6+vEnD3xiW
 H96srbPledxK9v0XvSw+soG1aH/0bbRdyriNUQN3mmYjUD/SsLJuHsUaM/8vdjMH8NuF 5A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79pc2009-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Aug 2022 20:05:40 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27VJx93h031346; Wed, 31 Aug 2022 20:05:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q5qcwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Aug 2022 20:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICpmp/Yxut+nubvwf0n8KTcqmXDBt1cDVlrbPZB2nFrJzbMJ5WlaIhEFfPQeCHJT/ACfaA68sDr8/HhsJvweEzl5gekFRq4xsKp4gp7xPMBVc9XMCcky0tK+J+erluVb0XWKOUvMIV3AmZxDbAVp7tX0HP/TGjRL3H73CrPyNQ+WTOmJjAfc/lILozBl7J3AZoNNGtBA3+vSbRvch7OitLddTkwBSzrH4fLWGB8STg1EAU6zt4BK9DcjIEls+bUSRM8tbkiKsK5O+ZezyeXMULIGIvYPae76mBtKaAOhFj3Mu1XHdLmxPOg6x4+ZVmmBCvdrhd0HCshp7/dLegk1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBZgJqtzY/IFHjLJ0ws/IJHneuP0dZLg1HBdNMzNR7M=;
 b=Jx4Hj1AxbEMac1xlFirJYvmZQLs8NK8LGr0oa9Cec5FZTx8GnhFbq7d5fKi8+9PxxBnhOnolrsUsUj2S1MZk2OT/GSKmex/hIQREKtQ3TNHdHJS5wmlb6RVYAIHOgG4vSjQIxz0pgvzZYDEqx0lgNgW0lE0K5z5ygt8XwF0jXzOtvT18a3TYZkDUpK4iMxtxh5erdhcLt+ccAFHLnz+vynZ4/7FQcAgBq49BGJ09K4Hv/MEGEzHUC1XBJzKtfHmcoufwCWY2p+VUMyj3kFSZVJVa+Gx1Z6cq7TzBrE4AKpsyG4AEfPlaASUhaxpy2HagxdjnRf4rYVwOrXRswAOxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBZgJqtzY/IFHjLJ0ws/IJHneuP0dZLg1HBdNMzNR7M=;
 b=VXTpn3wbp0y6OyPOglUqfrYvqoRScwXlE9z6KDJgVL5kG9eWp+WTaqobSkceF6WJgi7px6kQF/5foghmBhUd6U3dohzclVuFtUiVD8sv91kK7oKvQa/lqR58qw7O61YSP7QdhWOhumxJ2mwsHzBTZD0m49hYxyIMMbbEdLO+W2w=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by DM6PR10MB4235.namprd10.prod.outlook.com (2603:10b6:5:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 20:05:38 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 20:05:38 +0000
Subject: Re: [PATCH v2 1/1] monitor/hmp: print trace as option in help for log
 command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, dgilbert@redhat.com,
 joe.jin@oracle.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20220829170316.3053-1-dongli.zhang@oracle.com>
 <87mtbmhu0o.fsf@pond.sub.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <774cddc6-d2d6-a936-0beb-249d3e5877c2@oracle.com>
Date: Wed, 31 Aug 2022 13:05:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <87mtbmhu0o.fsf@pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:805:66::25) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ec99f9e-56ea-4385-b47f-08da8b8c2c0e
X-MS-TrafficTypeDiagnostic: DM6PR10MB4235:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+kwlNUhoao4bT9WseKr1ozPweN6ifap5Sry/SIkUkv1hoRdUXXIu7dwmSR3oqRMa7JiNOmFO0MjypgfmFY9444HqZYvXhkRGpSD+husLfm4j7jNXx2j15FZHv48xXNQQI7DSXoA97udMdfvmQJlFUuaRvfgWjGgl5DGyqtNlZ0FvP2JfkQzYOp2sS3TefZXSpIvnQsJlTsL85k46QplUV+v7dRvOPsoOTDJRNTxyN1B3kCaHZYdmhU5v3HhjFpX2Ly9m8KtYYDsQ0aiO2SoMBZZGh/3rovKe3aJD6+jhC2qEPDI5udXIYTnHDpEMShxEqhNvODyXp4nLSi6JU5foYQREA2BLiMSw+tjpInt+YwSRc7LIbgQ5KwO5dr7yq0tpkoiE+UQDDPkV1YMpr8GAWUgfJxcLwosn7DC+VPnzphll0EyDZEAmHnL6iUW8bX19Lcp/kqdOTfT4xwwvOy7XU+f6bOGtYfLR5MjqOGowPjjgmi6947/AQTD/jd7B1CDyHLhGFsqdexcoZummT6djVjcAs+eKm4lB70bJyTagtetYjoBpJPtl3amzWr0PYVR5U+yG5i+axx4/dQ3WZVEc8vYTkbigRocd5BFHELAK6WT4VfETA7jvt1ZQ3TvcGKK3w4zmExxsjCWg95b4MuLiuRWYWcDWQudqeLDntr8VjRqsUzrW/dCZsfLXUJq5plu2u6QDv1zyjqIZ/nhfFWq6xlTPZYbdr2Nq5cSLjeMgkgQXX9iUWNzSpybgFFw8Bh7d/zpmuAu5RLelHmKcVVHD5WQT3OxOwJ5jgzO9k6r5VA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(376002)(39860400002)(346002)(66556008)(66946007)(4326008)(66476007)(6916009)(316002)(31696002)(6486002)(8676002)(86362001)(8936002)(5660300002)(478600001)(31686004)(36756003)(41300700001)(6506007)(53546011)(6512007)(2616005)(6666004)(38100700002)(2906002)(44832011)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1Y5eSszOFluNVBtM3ZoNWpDMDRiQzByR2owbXBGQUdQRGFQQ0ZPVXJjVm9C?=
 =?utf-8?B?M1JHN0pvdjI4MEpydVI3V2piR29PZmpHWWdlcm1XSWJCM1NKTGREdmVKV1dz?=
 =?utf-8?B?MkZuMDA5SHdMckoxUlkweG94L08xdWdEbElzRThYdnQ1RlVrMlVNdjVBN3Bv?=
 =?utf-8?B?eXErblJKcGROVmlGN3NkckRpazgreVVDQmVGVWNFTVp5UVhzcEhMYmtMVS9P?=
 =?utf-8?B?cXZIVVl5cTZVVkFOMW1pSkVqaTlzQUdCZzlSQXRvelFCN0hKeXQrRHg4THpl?=
 =?utf-8?B?M0JhQXBxbGpCRTRNKzl5WHhpSVRHYTBZYmRBVjcyYWVKSDBtWXBZb2ZxRzBo?=
 =?utf-8?B?MDFPbGN1dndZdjUvVGo4dTB5ZHB4WXNXdGpCVjJQRXQ4eGxFMmhVbE8zRStF?=
 =?utf-8?B?ZFg4dGtYRUhzMEZLNFUwU3hEMjBVeXVPUDViM2Ricnk1MmxOTHlWVlZQK1JQ?=
 =?utf-8?B?S3VkbkpGRWtBM1E2djB4bWJTa1hPNHpDbkV0UU5LdFBteUduNS9ObTdUS0lO?=
 =?utf-8?B?d1hseTBibnJVZ3QyU2pjNWl4TzBVSEIrZG9PVlJ4ZmxtM1RQcVg3QzdRdVBX?=
 =?utf-8?B?R1doelJ5MXhhRmd4Z2hMRXNXbW9jTGJUbDRpenR0eXZkTm9yYVA2aDg3RFpt?=
 =?utf-8?B?Zk1ZN3hPUStqbkNRM2xjc2Jrd1NvOERaRkxBOTJ3SWpGRXl5RzlBUEk4bWE3?=
 =?utf-8?B?bzZ4WXRmS1FMZ3J4emxQQmRLRCttMGowRnpLaVVBdHI4b2FoczFWWXozS1lv?=
 =?utf-8?B?VzZLUCsxcDBzam5YNVJka0laa1BCeEhVRzZMdmpmOERieXNEek9mRFNIUHNo?=
 =?utf-8?B?ZEJNZ0NwdC96Rnpma21MV09WWnpWd3pKcFlCZXkwSUVBNEJvUllyMHNaSnlm?=
 =?utf-8?B?ekhpaUNSVGJsY0YxQXNiUkNYUDB3cGNOZ0wyZHN6c2JPU3cyUnBqN05VTm1Z?=
 =?utf-8?B?RXhGOVNjT3RaNm9KdGJBNlRzbUozSWlHWVQ4YUhoc2ZxLzdwZWxUcXlWdUZz?=
 =?utf-8?B?Q3JzUXVPNGF5WEVNNUJWWCtxdFpmd0RMZ3Z1TkVCM1poMWdJZlFVQVo1MHRF?=
 =?utf-8?B?RjFtWVVFYTdvRm5ITDJHYjB5cS9hOFc4NW5FWXRKZnJKNkVQL0pQc1dnNXpx?=
 =?utf-8?B?UlJJajdDTHlhNmpPaXE5Smd2ci8zT1VZaUpiNVJVUTlqb3BkSEo2R1QrK0Q1?=
 =?utf-8?B?ZWgzRGQ4bTE4UzM3SXBybHdzNUdkMkFCS29TL0lNT3h3N3pOSmFGMkloaXNa?=
 =?utf-8?B?Q0w1OUt1b2k4MTBKUEJ6M1NKRnZvWlpGelBLVzlqcWZtSloweVdWVFFSOXVO?=
 =?utf-8?B?SkxRUU1NL0JtanA1U00yd3pGVTRaVVd3M3luZ3FROWtwNGhzU29mNHNlSFBT?=
 =?utf-8?B?YVk1THFoWFJsYU0zanRaNG05ZEo0akpwT1pob00xSWtYeVQ4UVZFUmpZSGc2?=
 =?utf-8?B?cks2NzJaaHpPOWlFQ250ZHFabjBzcTVlNWVvQlVXQzNzWm5MOXF1ZHBkQXNV?=
 =?utf-8?B?WjQycW9RYUY4Q1c1RW04RkhKZUdoSkFNRHViRitxOVpaVFVRc1dTdTNPYUkz?=
 =?utf-8?B?R09vN044MjZpZnY3cnN1bjAwQWx1c3JlMnQzaEZ3T3FRRmlCN2NQRlRoaGJa?=
 =?utf-8?B?b3JRbk9NaWZyV21xbXVhbXI4RExoSElVRnJNQlhpTkxySTRBbGlZdFF5N2R6?=
 =?utf-8?B?QUhMZE51dk5PaHNkREZGKy9aNzhrTGJLOEhueFlaOXdlbEY2YVREYUlVSXo5?=
 =?utf-8?B?NjJyYm90ZVJHTzhxZ0lNck1oWVF6RXVJQVR6ZDYwb1Y3dElGaS9GSzBPcDBL?=
 =?utf-8?B?SGt2UUhJWHlNZENvRWFsNzZHbzhvVlRSR3BHdVZYUWpxTXZzUllZN0FDOGhz?=
 =?utf-8?B?Y1VtbzY4UEFOY01jckJBdFovNkE2U0ljY1BKWXMzcll6QXI1NGdzaVJFSUl2?=
 =?utf-8?B?ellsdk5xR1E2SE5xMXJXN08wVzEwOEd6QTQvVkNOdk5HbVMvU2FjSFlRdzJh?=
 =?utf-8?B?VWloZnN6QU5CN1FhM0tsR0l3STZoN1lHczViSDlubWxvVXF4RDJlWlhlUVRH?=
 =?utf-8?B?bGVHYmUxUGlkeFZvM3plMm1CYjNndGtwY3NkVDA2aUhZaXhQYzNMcEtYTXZZ?=
 =?utf-8?B?aVBza25mSnVQU1Boend6SWVwZDl4eGNxc204TGFENm1ZZmgyNHlDQTErUk9y?=
 =?utf-8?Q?bhIF0vy0jd29SCDgn8gzByo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec99f9e-56ea-4385-b47f-08da8b8c2c0e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 20:05:37.9377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vakuWQM0vS1rWXWr0QzzNHK0zlp05Q4HUfw5upkQHJFM0vVW60+z7iEuiHV6G9vIXzxWfHoRJTQ75p8uqRGNsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4235
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310097
X-Proofpoint-ORIG-GUID: oiB1JrSvNt6KQijQRU3_c0YfpPe18gpe
X-Proofpoint-GUID: oiB1JrSvNt6KQijQRU3_c0YfpPe18gpe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Hi Markus,

On 8/30/22 4:04 AM, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> The below is printed when printing help information in qemu-system-x86_64
>> command line, and when CONFIG_TRACE_LOG is enabled:
>>
>> $ qemu-system-x86_64 -d help
>> ... ...
>> trace:PATTERN   enable trace events
>>
>> Use "-d trace:help" to get a list of trace events.
>>
>> However, they are not printed in hmp "help log" command.
> 
> This leaves me guessing what exactly the patch tries to do.

I will clarify in the commit message.

> 
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>> Changed since v1:
>> - change format for "none" as well.
>>
>>  monitor/hmp.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/monitor/hmp.c b/monitor/hmp.c
>> index 15ca047..467fc84 100644
>> --- a/monitor/hmp.c
>> +++ b/monitor/hmp.c
>> @@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
>>          if (!strcmp(name, "log")) {
>>              const QEMULogItem *item;
>>              monitor_printf(mon, "Log items (comma separated):\n");
>> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
>> +            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
>>              for (item = qemu_log_items; item->mask != 0; item++) {
>> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
>> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>>              }
>> +#ifdef CONFIG_TRACE_LOG
>> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
>> +            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
>> +                                "trace events.\n\n");
> 
> Aha: it fixes help to show "log trace:PATTERN".  Was that forgotten in
> Paolo's commit c84ea00dc2 'log: add "-d trace:PATTERN"'?

I will add the Fixes tag.

> 
> "info trace-events", hmmm... it shows trace events and their state.
> "log trace:help" also lists them, less their state, and in opposite
> order.  Why do we need both?

I will print "log trace:help" in the help output.

> 
> What about showing them in alphabetical order?

The order is following how they are defined in the qemu_log_items[] array. To
re-order them in the array may introduce more conflicts when backporting a
util/log patch to QEMU old version.

Please let me know if you prefer to re-order. Otherwise, I prefer to avoid that.

Thank you very much for the suggestions!

Dongli Zhang

> 
>> +#endif
>>              return;
>>          }
> 


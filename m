Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF9C486D65
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:50:56 +0100 (CET)
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5baw-0001Tc-QK
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5bYy-0007Fh-8A
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:48:52 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5bYv-00073X-Fp
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:48:51 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206KfXd2029118; 
 Thu, 6 Jan 2022 22:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=n7FmcB4xnUAvILpHtwo6yDt7XIBxfqLmUJYwEzS+ecE=;
 b=b9PulmK4/qtiqN7cKM5jqf0bMydcq/3nvnX/CqpzdgmxuS4JC6pzJXPXWPICh5cahCeD
 KhRsBn8QlXGjvXD4tFuHxV4X/0X1uQeJ3c/9B5xhQ/h5wNb8CA+j+/31kgLL1EdypQ2n
 cqtWdCUmzB27Z/LioITCp24rzG5jTEhc4ZrLm1ocPL6h0g2TquDOSbSYd28CGenfgLlD
 9W8lgpKkOt3YqRxRk1INzoJf83MnmRxrXMdxp2HSomFb76TMYGDTJ+TmIXCfTdL8r15t
 kyyBT3UqlACgrC2sUP06YwgOvl8IJL1du1VCJu8AptgTXi7dGjX5tJ5fGjhTU+BdTdNs pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3de4va0q8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 22:48:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 206MflvZ074641;
 Thu, 6 Jan 2022 22:48:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by aserp3020.oracle.com with ESMTP id 3de4vvdje1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 22:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyZ06umRa2X5vxMhsr3v0YtOBK/iQedK70jIea7Aqmkz8x3nddWGniBeIVGHkcH58MJ3qh87IJ7zyw7A4UGslvVzO56psUm4N0kfg05SNyejRu/mw+wLoTZifMvIJz0hH8hrT9BcPU7o6vYc+cdsUCwqlYnHkmr25NRhBUHQfthttLwKFVg7nlgysnHiRV1EXy1y6522QF3jNhOChdgoOmYAQqeKx/WEOyKXAWJu77Hcl8Iwu1PpHb9lfRAJ4AOj55UDdG5YgozMGwt50dOdDxnU2ylMuwuyxgmIDxWcSFGvtCTfpY7nqhPXBf04FMLrJHsHjIU1Rw9am0kIntvZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7FmcB4xnUAvILpHtwo6yDt7XIBxfqLmUJYwEzS+ecE=;
 b=AVgEhw+rXzr76+YQMhtqZqWHAlwivNS6v93O+lNM0viYPdKRDlfAbb2cUAbMqcE1Pv3N/uexVrjxgKfEBUawM3Z3/AlCDTP6VMN+PbuGxpz098MizLdtVdC+ku5HDwExLu8pjqs70mSre1rnnQpVx3hhiNjNOLdGV79V9ikGL1ekHOriSgo1oQ5xYzX5262ebZbNpemLTx1Gjyf/1h8I+isQuRTjmgwTmXmVbQrmf5gqSi2J0JhY4Zt0BReNFR57Q9IbtAqX9Xc3OtzXrPlTWWkPFuhSAZ46gbufyCibefcpeST1q/l3R+6BSndH0dP0YgBSNFBozgL1eFwKt+izhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7FmcB4xnUAvILpHtwo6yDt7XIBxfqLmUJYwEzS+ecE=;
 b=E5LJIbmhYmH73po5pvM8eukH7mJn+dTwavZ5zjyHVZvo8Y8F9cchYu4tAmt1XeuIdxf5B+B7bUJxLMN6SeyJ89vriGIHU5QjD6EWJjedVrQGMHiVOGGdSGMBnvpy3iARQG98IjFCiPGOHp19kpxiyNz87GqHxhBEhfPVYLxH1Mw=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3623.namprd10.prod.outlook.com (2603:10b6:a03:11b::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 22:48:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 22:48:32 +0000
Message-ID: <145d70f9-94a5-6693-83cd-02169ee46a8d@oracle.com>
Date: Thu, 6 Jan 2022 17:48:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 17/29] pci: export functions for cpr
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
 <20211222180611-mutt-send-email-mst@kernel.org>
 <02a093fe-b2be-2ecb-7ef7-a95c54443894@oracle.com>
 <20220105151427-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220105151427-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0033.namprd11.prod.outlook.com
 (2603:10b6:806:d0::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2d181cb-6205-40b6-5d6a-08d9d166aa4a
X-MS-TrafficTypeDiagnostic: BYAPR10MB3623:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3623FD8656EC835971554123F94C9@BYAPR10MB3623.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAx77b4WHYhjZ6tmBedyLqLU5MN39W1tW2/VKpZffTmeqN8s2Iq2QAo07jNgtHkm9d30pDIWL+NaGqDXk1uhAiYmKWypxH5zz52KGgfagvyqSJ5Qp9c1XKOwUvIk9f9m8y/Gu6hahhPan2HDFuNmWd2emws4S6lvM63ojUDuJyeAGk9mEe7js0CBQx08pWMXTdguQ1/ESKbZJzvN+HOjm9Wfl/kjMnzTCp91bxdO7nQh0mc/zjLJq+3E1G50YQefQ5IVG3jeuhzN+3ybPeyN3cx96gcStxYcBOB/GLJy7N0m90h0gAlI1IFkahR3ACfkbpGRW7+5/SffouZnsOW58jpydlILHQlAY4KYxv/hnHeMxk3xGtrGPWDkLhjJAGA0W4Pel9jXskRY0vk/MTRPxAF5SwpQzk+VOIjFR4faAeInZxPiMc7KtDX3nhWMZZMVESTyADoq3GSk3OXusz+sqh7PH04OeKQMr8bPtoDVo1PCqVJbgNxMIF/EE9qVeYvB94rKK7OPJ2RopHV6SMUxD3SzJYurjSenarg+lgsDq4Lj9sGBIDvJIOrCVGL5PTpJ5RbdnvCFdaRPU5uNBavmOX28AX5ZbDRGevk+S/Rlh9KI+aHkZdNyJSR4akhh9vpkS3904VgWvbryPAI7wLXnnIHmCvx2kNt1leGJ3UPnuQ+79NzfkiwZhzsl+E4CM98zui9H480MQgFoJJLqMdIzr/XVDS0Jt/wdNRZA0V7AjpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(6512007)(6506007)(53546011)(44832011)(4326008)(316002)(6486002)(6666004)(2906002)(107886003)(2616005)(186003)(31696002)(54906003)(86362001)(36916002)(66556008)(66946007)(66476007)(6916009)(508600001)(7416002)(36756003)(5660300002)(31686004)(8676002)(8936002)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytpNUJGd3FON05Ja1dGZVpiRmtQbFBQY3ArQVZsdUxxWVlaL3NtVTJaMVBa?=
 =?utf-8?B?ZGdJZUhtdlorUEpDVHFpMTRmL3h1WlJ0dkp0V0hDUVp6b3BVWGFreGtyUkdk?=
 =?utf-8?B?UzBwM2RzS2luek04V3BwV2FZRnFwdnh4d2FHTzZ2TWZsSks5cWRRTkw2VmlL?=
 =?utf-8?B?ZjU5WXlQOGxyUTlxeWl4djFOMHZIUE0yRzhSTGVmQzh0dU54cE41MC9HOFl5?=
 =?utf-8?B?Qkl1azlPclhINHdPZUM4dVR6NTRJbkl6YnRuT2NyMTREVVkwRGtvQnNKSFNz?=
 =?utf-8?B?SzZIY25PRGR2Z3VUSEF1dDhIbFRqZVBLT2NlaFowUFpIc09wTjEzNlJjWEJ0?=
 =?utf-8?B?SysvaGliMkU5TG5Fc3Q1SzVlN1dRdUt2M2xPcWoxK005ZjJteElkT0NwUnpO?=
 =?utf-8?B?SHcwRjd1bGJxVUZrNkhyU2dOdFVJVG9FT2s4ZVIxYmo4YVRiV0hMVFJTZmxW?=
 =?utf-8?B?YktPWmpqQng5dVpUM2dEczY3L2FpRVZ3MGgyQUdldTd3OWhPSUcwU3VrY2c0?=
 =?utf-8?B?bGtNbUI2cVVXTWNQTmNSOGNRNXQxcktkN0dGMjJieThFZUdUL21mVnBXOTJQ?=
 =?utf-8?B?UjVRZ0ZQczRYeXU4R3JsYVdJYkp3ZGJmeVVtM1V3MWN3ZUJRQmQzckxBc1VF?=
 =?utf-8?B?ai9DSXBOK1hHTjNEZUdDUDFmeVZsSzBTNjJON3VTNEdGVmZoTjZGZ0JLcTV5?=
 =?utf-8?B?R0xNVk1JL0g5TWNCTFl3V3ZIcEkyMHdXM2kyT2E5RzU4OTBzVTJXRHRzRjFL?=
 =?utf-8?B?OXU1YTJkQzQ2THZ2NDVza1p4WEdFVCsvOU9UZlVja0xEb3JpTTdYcy83Qk1U?=
 =?utf-8?B?SW5GamFlYmxJRmxzNkM5Q0pSU2N4OGlCREd0OXpac3ltVUpiOGFyWFBWaUZi?=
 =?utf-8?B?aDJCQmZHRHNNbnhkb3pxeWdvOGJyc1l4MDZvbHV0M1V4S1FDSWFMK3hGMVIx?=
 =?utf-8?B?QmM2dy84WTNMVjZUY1Zab3AvcnhJQ0ZRNjhhTUlpa05nam50T3hhMm1peExu?=
 =?utf-8?B?RDhMK2FQUi9XcnpVQ3g0d0NVMDlCLzVVaVlEYy93TkZVWUVYZ0o3bUpBVkRt?=
 =?utf-8?B?RDRYNTEvLy9GS1R1RktWYUNMNWlUVG1heWwrNnNJTHVmSUhnSzZudExxNzRh?=
 =?utf-8?B?cGVlMG1jTnFpYUxkM3dpdGY3SkcySmwzMXE0RUJ0T3RsRVQ0MHBZVVNDTmRj?=
 =?utf-8?B?SjBHYVB6ZmVYb3BDVW1TSjJYaEtHOEVKbXdSeU5VOFVqTzBDRkNYUEJXd1pH?=
 =?utf-8?B?WlZCT0d4V3BCNUFvdmRvTUxCeE5tNkdUandxM094M2VkYzVxaURsaVZUY2ZQ?=
 =?utf-8?B?UExIdDA5YkV5R3NlWWdBQUFja3M1VjF5bmlVdFF3UDhWVnk4dkxKYmdGNGdn?=
 =?utf-8?B?OHc3SHRrU3VpSUJ2VTVBd2pyM3AzdktSeU0rSHI3ZlB2dzJvL0JsZkVDWlpN?=
 =?utf-8?B?UzQ2QU9Xb0V3ZVFSVHpHNGQ4UUpIOTd5YS96eTFQZFZSb3Jwb3JJdmlud0ta?=
 =?utf-8?B?cUlhcFQ4cHZvRmVMam03S08rRXlFWVBFeDg0WDZrMUhmeGNTTFRWNkhHdEI0?=
 =?utf-8?B?RlE1Q2djOFRFbmNYU1pvUWsxY2JwMlZENnRuZUFSeldTUlZJNWpOMzMvOEVY?=
 =?utf-8?B?RUk1bFZqdHh3RmczcjVFQnRveUUrZEZWVU1CRTFvdlcvd2s5K0E2bGRpcUpo?=
 =?utf-8?B?bDFCRkM2K0g4cjB1NVVUWFN1ZVZBbjRLVFoyKyt4czZHS29yemYzN2ZKWEc0?=
 =?utf-8?B?UzBNcnEyVkJjTXFJR0JURE5IR1BRUmVUOGI2aVh4T3dCcm0zbWxzT0RRMGVk?=
 =?utf-8?B?T3E2b3IxaStUUHpYdTFaQitwd0oyTldpQnh2NmtNeitZVEZ3RHN4MHoxVW9k?=
 =?utf-8?B?QXR6SW5mNFkxMi9CekFJRWpBUW5Oay8vT2ZRaWVhRTVYb09rdGJDNFBYVmR0?=
 =?utf-8?B?YU1sUUZ3U09hU20vT2xnMWxFNjh0Q2NHU0hiOEZaRXIxdWMyRVJoTTlEYUNB?=
 =?utf-8?B?WHRGb0NZd1cySzlJaE9OUk1STURXTm90Vm50ZHNOOW1xM0JHK1dPYkoraERr?=
 =?utf-8?B?N1lXSE5mcEVxT2Zwd09UYlN1UVh6amwwZEc2SXZmZ2YxeGczTlErK1hJT1E2?=
 =?utf-8?B?aW9MeitKTWlNbVA4S0c0cW1PeWVldzBkRjk1cmNib1VZVzdFSnBjU1Vid1hk?=
 =?utf-8?B?akUvQkJJdVJJZkV1RDlPYVZNSW83SjI4R1poMWJhM016Tzc3T0NqcXUyV0ky?=
 =?utf-8?B?azM3Nm5GRFZOOVdwOVlVZmp1d3pRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d181cb-6205-40b6-5d6a-08d9d166aa4a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 22:48:32.5224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viqbjpVC7B8uT4YFQPLGmVC7STlJAy1LSIYFpwRO69Ek1yuHJ2FLQrX3bfVrgJQpBHRhE0bhgNfRCJ+cHS5NK8mnpMYLR5eCN0drrKTFJJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3623
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10219
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060138
X-Proofpoint-ORIG-GUID: _jF4-xYsLDEg-wYwQlLHhwtmk-FQ3eX8
X-Proofpoint-GUID: _jF4-xYsLDEg-wYwQlLHhwtmk-FQ3eX8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/2022 3:16 PM, Michael S. Tsirkin wrote:
> On Wed, Jan 05, 2022 at 12:22:25PM -0500, Steven Sistare wrote:
>> On 12/22/2021 6:07 PM, Michael S. Tsirkin wrote:
>>> On Wed, Dec 22, 2021 at 11:05:22AM -0800, Steve Sistare wrote:
>>>> Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
>>>> for use by cpr.  No functional change.
>>>>
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>
>>> With things like that, I prefer when the API is exported
>>> together with the patch that uses it.
>>> This was I can see why we are exporting these APIs.
>>> Esp wrt pci_update_mappings, it's designed as an
>>> internal API.
>>
>> Hi Michael, thanks very much for reviewing these patches.
>>
>> Serendipitously, I stopped calling pci_update_mappings from vfio code earlier
>> in the series.  I will revert its scope.
>>
>> I would prefer to keep this patch separate from the use of these functions in
>> "vfio-pci cpr part 2 msi", to make the latter smaller and easier to understand.
>> How about if I say more in this commit message? :
>>
>>   Export msix_is_pending and msix_init_vector_notifiers for use in vfio cpr.
>>   Both are needed in the vfio-pci post-load function during cpr-load.
>>   msix_is_pending is checked to enable the PBA memory region.
>>   msix_init_vector_notifiers is called to register notifier callbacks, without
>>   the other side effects of msix_set_vector_notifiers.
>>
>> - Steve
> 
> Well the reason the side effects are there is to avoid losing events,
> no? I'd like to figure out a bit better why we don't need them,

Currently I do not call vfio_msix_vector_do_use during resume, but
instead execute a subset of its actions in vfio_claim_vectors, which is
defined in vfio-cpr: cpr part 2.

> and when should users call msix_init_vector_notifiers versus
> msix_set_vector_notifiers.

If I call msix_set_vector_notifiers, it calls the use notifier
vfio_msix_vector_use, which calls vfio_msix_vector_do_use.  The latter
gets confused and breaks the vectors because vector-related fields are
only partially initialized.  The details are unimportant, because --

Instead of adding msix_init_vector_notifiers, I will call
msix_set_vector_notifiers, but bail from vfio_msix_vector_do_use if resuming.
Tested and works.

Thus this patch becomes simply "pci: export msix_is_pending".  I can keep it,
or fold it into "vfio-pci: cpr part 2 (msi)".  Your call.

- Steve

>>>> ---
>>>>  hw/pci/msix.c         | 20 ++++++++++++++------
>>>>  hw/pci/pci.c          |  3 +--
>>>>  include/hw/pci/msix.h |  5 +++++
>>>>  include/hw/pci/pci.h  |  1 +
>>>>  4 files changed, 21 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>>>> index ae9331c..73f4259 100644
>>>> --- a/hw/pci/msix.c
>>>> +++ b/hw/pci/msix.c
>>>> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
>>>>      return dev->msix_pba + vector / 8;
>>>>  }
>>>>  
>>>> -static int msix_is_pending(PCIDevice *dev, int vector)
>>>> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
>>>>  {
>>>>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
>>>>  }
>>>> @@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
>>>>      dev->msix_vector_release_notifier(dev, vector);
>>>>  }
>>>>  
>>>> +void msix_init_vector_notifiers(PCIDevice *dev,
>>>> +                                MSIVectorUseNotifier use_notifier,
>>>> +                                MSIVectorReleaseNotifier release_notifier,
>>>> +                                MSIVectorPollNotifier poll_notifier)
>>>> +{
>>>> +    assert(use_notifier && release_notifier);
>>>> +    dev->msix_vector_use_notifier = use_notifier;
>>>> +    dev->msix_vector_release_notifier = release_notifier;
>>>> +    dev->msix_vector_poll_notifier = poll_notifier;
>>>> +}
>>>> +
>>>>  int msix_set_vector_notifiers(PCIDevice *dev,
>>>>                                MSIVectorUseNotifier use_notifier,
>>>>                                MSIVectorReleaseNotifier release_notifier,
>>>> @@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>>>>  {
>>>>      int vector, ret;
>>>>  
>>>> -    assert(use_notifier && release_notifier);
>>>> -
>>>> -    dev->msix_vector_use_notifier = use_notifier;
>>>> -    dev->msix_vector_release_notifier = release_notifier;
>>>> -    dev->msix_vector_poll_notifier = poll_notifier;
>>>> +    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
>>>> +                               poll_notifier);
>>>>  
>>>>      if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>>>>          (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>> index e5993c1..0fd21e1 100644
>>>> --- a/hw/pci/pci.c
>>>> +++ b/hw/pci/pci.c
>>>> @@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
>>>>  };
>>>>  
>>>>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>>>> -static void pci_update_mappings(PCIDevice *d);
>>>>  static void pci_irq_handler(void *opaque, int irq_num, int level);
>>>>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
>>>>  static void pci_del_option_rom(PCIDevice *pdev);
>>>> @@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
>>>>      return new_addr;
>>>>  }
>>>>  
>>>> -static void pci_update_mappings(PCIDevice *d)
>>>> +void pci_update_mappings(PCIDevice *d)
>>>>  {
>>>>      PCIIORegion *r;
>>>>      int i;
>>>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>>>> index 4c4a60c..46606cf 100644
>>>> --- a/include/hw/pci/msix.h
>>>> +++ b/include/hw/pci/msix.h
>>>> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
>>>>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>>>>  void msix_set_pending(PCIDevice *dev, unsigned vector);
>>>>  void msix_clr_pending(PCIDevice *dev, int vector);
>>>> +int msix_is_pending(PCIDevice *dev, unsigned vector);
>>>>  
>>>>  int msix_vector_use(PCIDevice *dev, unsigned vector);
>>>>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
>>>> @@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
>>>>  
>>>>  void msix_reset(PCIDevice *dev);
>>>>  
>>>> +void msix_init_vector_notifiers(PCIDevice *dev,
>>>> +                                MSIVectorUseNotifier use_notifier,
>>>> +                                MSIVectorReleaseNotifier release_notifier,
>>>> +                                MSIVectorPollNotifier poll_notifier);
>>>>  int msix_set_vector_notifiers(PCIDevice *dev,
>>>>                                MSIVectorUseNotifier use_notifier,
>>>>                                MSIVectorReleaseNotifier release_notifier,
>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>>>> index e7cdf2d..cc63dd4 100644
>>>> --- a/include/hw/pci/pci.h
>>>> +++ b/include/hw/pci/pci.h
>>>> @@ -910,5 +910,6 @@ extern const VMStateDescription vmstate_pci_device;
>>>>  
>>>>  MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
>>>>  void pci_set_power(PCIDevice *pci_dev, bool state);
>>>> +void pci_update_mappings(PCIDevice *d);
>>>>  
>>>>  #endif
>>>> -- 
>>>> 1.8.3.1
>>>
> 


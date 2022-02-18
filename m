Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA104BBA40
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 14:43:40 +0100 (CET)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL3Xv-000439-DX
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 08:43:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nL3Rj-0001ib-OU
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:37:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nL3RU-0002Ag-F1
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:37:15 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IDTlln020918; 
 Fri, 18 Feb 2022 13:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BDzk60fMTZIMgVDpYFkVazJLUtZ5I7EM+VH80RR06Ns=;
 b=NlmskvAbwb90ti+On/ymMdubVMH+sJXDksAI84PecYKJM4g58fy37z6mvWSD//O8Tm/m
 racCCdSLTf3fHFAvjUms0v84g7Q4keh0xb6ks29AXsDglxL3BSoRxuUUBQag+Stj/1gO
 yXA0Vp4K2R2M5nClJiW0cFJ30oLh7aSq2FGYH4GSiWOay4NGD9o9OtWEvH9D/gttiSWH
 t3TTpSEQWFeu5mIvTRM9bj3Na1gf7ycnYV+X0zdV7xsK9Yme79v+Fcb023wwipufsX8w
 Nl3FuAO7GyTXZcjZThXsJGDo/nsGFtTURTul6pRHbM3VPQA5YrA4zMrrlJTqeEQN0dTG ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nr99nmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 13:36:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21IDVKjO133848;
 Fri, 18 Feb 2022 13:36:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3030.oracle.com with ESMTP id 3e8nm12q9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 13:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7CqhlfgRxIMg4vEq1IJ8BR6rrCTG/9dLVTIwxRJ7snlQ2U3FzdLGfqUCsTstgNbLQTAZm2X0qda2YOMWuNldgK4odvsr5AZtcHqmWPJKy0Cc6m0SMn9re43+I+lon6VCilOuUypbd7oCY3qtRHONGde0XdPr+GM03RbVbCwsMv+jPXBjtuEr4TUHLUvTlb5VVEJEHnIWP/9E16Y+ZljY12hZaFxD+f+o4CytkU3uVteEGs4QZdccEYzsybJSVsO5vgqDCrgqebcG4vMi9V8KrN7VWzzKIRsFymbkwRvbFSiSKFLukkckXNHrsjdWt+0sOS6H0d+XxGom+FqDX4Kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDzk60fMTZIMgVDpYFkVazJLUtZ5I7EM+VH80RR06Ns=;
 b=W6Qh+tvo1Q4g2RHRq837qGhV8b3yECBjAZ94p+CHF9z0EM7aN1W1guZEkv0YMrVK48KzUQ95LK/pDssyfuRTwZ71qpcsrsgT2m3R+41UDCLi5UFihFPrD16cp/Mkn6RAZgQU2ltZZzTy2RvMkEZKMNmRgWfGPk8fK5/GkGkzWFs8nRpO59FUdPFqRZwyxx1Q/wGNq6guqhxs+Mr/NngH3Ak0pvm6/iNvg/N3kvbqmpfq04ob8WctRvdIiMTMVTuKUFVnB5gHIvxA8IgSv8S2w/vl0Qy+oizoPIp5Wmh6pycFZWjdiFLDKbfXcrF2VRausxCVTP/NZ4qAEMSpO7CzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDzk60fMTZIMgVDpYFkVazJLUtZ5I7EM+VH80RR06Ns=;
 b=Yju1h6PH5AnJmPvOAlR/1jBhFkF+8UK+63CELFJZ+6S7fcKVmNp+sTmoNhDypSb5AqOAuFFmjCixdxzFe/HiSawdbjMYCz0O41hc7d8tg+QYOjXHpMA8yVEfUQPzNHXyH7NcOq166M6R7/9Nso4w4cpCnSsqAqwKiwXzQ6tUG60=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by CY4PR1001MB2200.namprd10.prod.outlook.com (2603:10b6:910:3f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Fri, 18 Feb
 2022 13:36:36 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::8d9d:e838:c56a:4fbf]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::8d9d:e838:c56a:4fbf%5]) with mapi id 15.20.4995.017; Fri, 18 Feb 2022
 13:36:36 +0000
Message-ID: <d180e1bd-e9a3-9935-28fb-0b260ffed0ac@oracle.com>
Date: Fri, 18 Feb 2022 08:36:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 00/29] Live Update
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <fcdf8dc1-4b71-1bf1-9e57-a372679c3de2@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <fcdf8dc1-4b71-1bf1-9e57-a372679c3de2@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92b46e0-e627-43a8-a76a-08d9f2e3af1b
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2200:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB22004B7A2F44E07BA4162911F9379@CY4PR1001MB2200.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enqXkK4isSn3j/rK3gInzIdtpAeiU/HeOeE8KZdrgprrALiQq+NDEgoQmbCvKW6akICmzhhdw95jy7izySQGhfnRtq0Xx7GonG4CrbFd4KMV/8HzVNcXsSCQGOjLUGea/W5eszR8yoilQAsPI9yho/afmRUGQq9etw1Mb1oImcuEiRnh42QqKiOgEWOdclp6Ki6Uq4haFCmf+GHT4YSi3sSBZprACMcBivkljTGm3uiRjXxeTDQpY3VyeK1UC+T1hsCUzcBiwJTVAX+Yc6Hc64jureZDp6kQHnGd/RatZcCXky7WH9NVZvoJlNPb1lF2FkXDR1yXFgjwFhxIdD+YVXs/kZL7itM5O6LteR1uqOZ11/b+gOl+YkWhfXJSNz8lvDLfo2Bc+qxizuHD7K+Ma7YKNfhPLUqqRd+Jpfnds3tQ2WZC72aeiBUiUdivdnvBp8X1AW6uC7Ij23WAI1lQktc4NalMZjDWU/XmFs/Rdoh/LZiGFIK9gxLUqnEYLh5VjxvaSRl0YjLUTMmjvmVSdIlgIduh39mK2cG1PPitwS1wXb1Snwuv2NQgDut+egPwePP9OKQh4aJQ/OXwIseLzHMpiGSbns+2rQrHgU4Mji82THawVx/oSj9yz6NFyaNB5PL26mufd/jSeNAMonzf181rRqfR4Y1IhNuEKksEi+YVThHVVzIKuPQ4liwR/EN+Ol+BzFO4N9fg5yHEVlCalHXWVSkvB1zKU7YwfErzRaZD4NlorS/OT5++qE2SWblWWjjB6ykA2pDOaGrYdAjxYG9/oQ2ksXKybKGnMM2Q0XJHhJEXac88wF4pKj512ite2pBWp0QL46rMpcSaoYY64rjXrpTr74TBqcaUh3rcYlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(54906003)(66556008)(316002)(66476007)(6512007)(83380400001)(6916009)(66946007)(8676002)(4326008)(30864003)(26005)(6506007)(508600001)(186003)(38100700002)(15650500001)(36916002)(5660300002)(6666004)(36756003)(44832011)(2906002)(53546011)(86362001)(31686004)(8936002)(31696002)(7416002)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWwyV2UwYkEwWFBOb0VjRjl6NnNOSTNqZ3RPKzlQNkx3T2MwRkxTMDZKOHVw?=
 =?utf-8?B?WmRacStxZkJpcWZLRi9pWmVoWUlQVm9CRUhaRzQ1aGl3K1NxdGZXRDVsaEVu?=
 =?utf-8?B?Z3ZFRnk5Q092cXFVVy95T1g1SEN4K0V3NlUyYm1sWHlMbHNOS3A4WGNGbVls?=
 =?utf-8?B?K09DVlQ4N3pQNHAzQXlSUzNqdERJc2M4NHRpUjJVVmJnZFd0S2RnUURWRCs5?=
 =?utf-8?B?cnd5Q0hKY0FjWjJta1NTNCt3NCtiWEVocFN1UjZyb3Nqa1hXMmg0UXhBREIv?=
 =?utf-8?B?RDR3L3VZeG1jY0QxUE0wSlJKZ3BSU3cwWUFXYVhqRmdFT2Z0ZXNXbHgrU2Nl?=
 =?utf-8?B?UGlyWFdGZWxFZURNNWVNQVJiUlhYZTNnTTFWVGhuUXEyM2U0c1YrYzIvVDFF?=
 =?utf-8?B?bVJxL2JWdFdmOFplL2hVTUpVaDlEZ3NiQUJYTVhHV3FoNFhIaEE3YUc0TGd6?=
 =?utf-8?B?dEFjeWhKd3l0ekJEYXJqVHJjMC9PeHlTd1BjU0lQT3RMNHdGVnJQaUJuekhl?=
 =?utf-8?B?NkhFY3NCZ1ErYW03M3Z0Vk9RWTl3UmR6bXM3bFVkZFNra29jSXN5YVg5UU42?=
 =?utf-8?B?YXFtdk1DUDI2M0hBazVGV3RYYzVzSGdURy93NERCRkE4MXVlUThIUVFLTEpw?=
 =?utf-8?B?UVR3SHNBbDEwQ2VUOUNLYmFOck53dUlTV1BWL1pPVTJtL3c1ckh1RFAyc2FI?=
 =?utf-8?B?alFDVmd1TDYvNFlkVVBoRlRVeFB1TFZWMFVtZWtqUGxXLzI0eHI0U1lrUmpG?=
 =?utf-8?B?bE5Jbm9IdGMwNnU3OXZnVlJvK2xNZ1VsMzlHVVowTUZWSC8wWkk4RE5Vc1hN?=
 =?utf-8?B?ZC9kbWsxRVB2VHpZcTlvZk9ZM3p6aCtUNG5zejJmWVIzT2tPVW1EZ2Q2TDFM?=
 =?utf-8?B?STBCYmlqYzg0WHBlMy9vRVJPWkVFRk1XUWhPblRvTHlSMUpkeXRIUVBxWTFY?=
 =?utf-8?B?dHNuY2EvRHhBaWlUcHo1OXhkZDZHWVlGT2dneGNnQ0YzdFJMNUh0eDVkYThG?=
 =?utf-8?B?Y21mRnZ5U25BbUdUdFE1Ykg3TTBBK2lrNUFITUdJUUtZUlhRd3dSNnVmRTJU?=
 =?utf-8?B?VjlkUTEzSTBTZnlvVjFDMVVucWRtUll1cXljeUtMeWRMT2xtcjhwUnIxTG00?=
 =?utf-8?B?SVh6akZYdmZGQ0VqekxOc3JzN1EraXpueEYzM0huOWpMeFZIc0dFQTFtRWdx?=
 =?utf-8?B?bW9leUZ5VTNaV2lZbFgvaUFpem5xT0d5TmpuNzhoV2FXWE92RFVZMXVXUVlm?=
 =?utf-8?B?SnZtVG5MRXNQckNFODdmd2FIN3ZhVlYzdUZwdS9tbTN0TDZtblVHNG9Ld1hh?=
 =?utf-8?B?czhxbDk4RzU0NnBrd2hoUGlnTmZ5UzlmZU1rR3ZQRWowUW1DS0FQNTZLYzJT?=
 =?utf-8?B?MXVrV2h1NjJkVElmbE93MEJ3VzRSbEIwRWZuaEQvc0FkTURaZ0I5aGpPVld4?=
 =?utf-8?B?S2h5cUgvRkhkazJaVGpWZGxGWGNZOE9DMFByVkRiWE5NYUpyWGloVy9DN0R4?=
 =?utf-8?B?VmR0bFRxTW9DaG5mclJBall3OUg0TjZ6QjFSUUdHdGxYYUpjQURsdDUvTnFm?=
 =?utf-8?B?akJCOXZpNzAveVZnL2hwUTZQL2dnRnR0MEFvVWxkQ25NUUZFRmtiWTE0a0g3?=
 =?utf-8?B?akJ6cE9NYVgyWXZsT0sxU1NXaWhpTm9FdXNsUkVZeTdxQWdPUnE2WnMxWElP?=
 =?utf-8?B?eDBoaEY0bjRTY0trYmxweGhxRWxXODlxdnUzZ0gwWVpMK3d3S0tDV2tiakw5?=
 =?utf-8?B?dzc5SVdOTkNINFRKTVpDT253RTM1ZFhKUWFDNUpzYmdqbWhYUlZsbC9FVS8v?=
 =?utf-8?B?b29tWFdLVWkrdFZPeEdjZ09vVUJMTjZjcHI4dmF1M25jNFU2WWFBNjQ5WUJt?=
 =?utf-8?B?Sk1EdW1EdTl6NWhEZm8ycUsxYWM4YnpadmVreWIydHNFU2hDeGF0dlE3RDJy?=
 =?utf-8?B?QWpXZ04xMUdZWGs1WGRiNTVZU3JPdFZtRmlpcTA2a1hQWU14Wnp2NzlRQkh2?=
 =?utf-8?B?SGp1Nm5CSmp5SCt5dXd5Um04SzNkekpoeWVBalN5NTNYYUZJUFRWZDFVWFo5?=
 =?utf-8?B?djFnUDJURVdXQ0VLWTJGdkZ2V1JXMXFqK1pKUlhtYytXVjVSYkNldnVDdDJ3?=
 =?utf-8?B?eWVia1c3anVZenB0M1ZVOER0UlFhRDlyVm9WeUNaTFZxV1NSNFJ4ZFBpT2No?=
 =?utf-8?B?NS9WeFJOV0FCUHVnazBzdDdZVEJaRjI0dlM1N2VCazk2RUxSYkpFMXZTRjhN?=
 =?utf-8?B?SHVIRjNOTUp0aTUvZ3p3SzRWbXN3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92b46e0-e627-43a8-a76a-08d9f2e3af1b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 13:36:36.2240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: si33yEQ/sqPzxkgGF3eyZXicifFviI6kh5S/U4jvoBIutZv/qQlSypqTtHsXBNdqz9pfasGA8dXZCN62zL5HwQYiYfC7AL4YhBC2AMlZQ3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2200
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180087
X-Proofpoint-GUID: FrDn-NyLTJ6osNPy9Kf3tVtUVHLgGcaR
X-Proofpoint-ORIG-GUID: FrDn-NyLTJ6osNPy9Kf3tVtUVHLgGcaR
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please? - Steve

On 1/7/2022 1:45 PM, Steven Sistare wrote:
> Hi Dave,
>   It has been a long time since we chatted about this series.  The vfio
> patches have been updated with feedback from Alex and are close to being 
> final (I think).  Could you take another look at the patches that you care 
> about?  To refresh your memory, you last reviewed V3 of the series, and I 
> made significant changes to address your comments.  The cover letter lists 
> the changes in V4, V5, V6, and V7.
> 
> Best wishes for the new year,
> - Steve
> 
> On 12/22/2021 2:05 PM, Steve Sistare wrote:
>> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
>> These save and restore VM state, with minimal guest pause time, so that
>> qemu may be updated to a new version in between.
>>
>> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
>> any type of guest image and block device, but the caller must not modify
>> guest block devices between cpr-save and cpr-load.  It supports two modes:
>> reboot and restart.
>>
>> In reboot mode, the caller invokes cpr-save and then terminates qemu.
>> The caller may then update the host kernel and system software and reboot.
>> The caller resumes the guest by running qemu with the same arguments as the
>> original process and invoking cpr-load.  To use this mode, guest ram must be
>> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
>> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
>>
>> The reboot mode supports vfio devices if the caller first suspends the
>> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>> guest drivers' suspend methods flush outstanding requests and re-initialize
>> the devices, and thus there is no device state to save and restore.
>>
>> Restart mode preserves the guest VM across a restart of the qemu process.
>> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
>> which directly exec's the new qemu binary.  The arguments must include -S
>> so new qemu starts in a paused state and waits for the cpr-load command.
>> The restart mode supports vfio devices by preserving the vfio container,
>> group, device, and event descriptors across the qemu re-exec, and by
>> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
>> and integrated in Linux kernel 5.12.
>>
>> To use the restart mode, qemu must be started with the memfd-alloc option,
>> which allocates guest ram using memfd_create.  The memfd's are saved to
>> the environment and kept open across exec, after which they are found from
>> the environment and re-mmap'd.  Hence guest ram is preserved in place,
>> albeit with new virtual addresses in the qemu process.
>>
>> The caller resumes the guest by invoking cpr-load, which loads state from
>> the file. If the VM was running at cpr-save time, then VM execution resumes.
>> If the VM was suspended at cpr-save time (reboot mode), then the caller must
>> issue a system_wakeup command to resume.
>>
>> The first patches add reboot mode:
>>   - memory: qemu_check_ram_volatile
>>   - migration: fix populate_vfio_info
>>   - migration: qemu file wrappers
>>   - migration: simplify savevm
>>   - vl: start on wakeup request
>>   - cpr: reboot mode
>>   - cpr: reboot HMP interfaces
>>
>> The next patches add restart mode:
>>   - memory: flat section iterator
>>   - oslib: qemu_clear_cloexec
>>   - machine: memfd-alloc option
>>   - qapi: list utility functions
>>   - vl: helper to request re-exec
>>   - cpr: preserve extra state
>>   - cpr: restart mode
>>   - cpr: restart HMP interfaces
>>   - hostmem-memfd: cpr for memory-backend-memfd
>>
>> The next patches add vfio support for restart mode:
>>   - pci: export functions for cpr
>>   - vfio-pci: refactor for cpr
>>   - vfio-pci: cpr part 1 (fd and dma)
>>   - vfio-pci: cpr part 2 (msi)
>>   - vfio-pci: cpr part 3 (intx)
>>   - vfio-pci: recover from unmap-all-vaddr failure
>>
>> The next patches preserve various descriptor-based backend devices across
>> cprexec:
>>   - loader: suppress rom_reset during cpr
>>   - vhost: reset vhost devices for cpr
>>   - chardev: cpr framework
>>   - chardev: cpr for simple devices
>>   - chardev: cpr for pty
>>   - chardev: cpr for sockets
>>   - cpr: only-cpr-capable option
>>
>> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
>> restart mode.  The software update is performed while the guest is
>> running to minimize downtime.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-x86_64 ...                        |
>> QEMU 4.2.0 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update qemu
>> (qemu) cpr-save /tmp/qemu.sav restart           |
>> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: paused (prelaunch)                   |
>> (qemu) cpr-load /tmp/qemu.sav                   |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>>
>> Here is an example of updating the host kernel using reboot mode.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update kernel-uek
>> (qemu) cpr-save /tmp/qemu.sav reboot            |
>> (qemu) quit                                     |
>>                                                 |
>> # systemctl kexec                               |
>> kexec_core: Starting new kernel                 |
>> ...                                             |
>>                                                 |
>> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...            |
>> (qemu) info status                              |
>> VM status: paused (prelaunch)                   |
>> (qemu) cpr-load /tmp/qemu.sav                   |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>> Changes from V1 to V2:
>>   - revert vmstate infrastructure changes
>>   - refactor cpr functions into new files
>>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>>     preserve memory.
>>   - add framework to filter chardev's that support cpr
>>   - save and restore vfio eventfd's
>>   - modify cprinfo QMP interface
>>   - incorporate misc review feedback
>>   - remove unrelated and unneeded patches
>>   - refactor all patches into a shorter and easier to review series
>>
>> Changes from V2 to V3:
>>   - rebase to qemu 6.0.0
>>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>>   - change memfd-alloc to a machine option
>>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>>   - close monitor socket during cpr
>>   - fix a few unreported bugs
>>   - support memory-backend-memfd
>>
>> Changes from V3 to V4:
>>   - split reboot mode into separate patches
>>   - add cprexec command
>>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>>   - add more checks for vfio and cpr compatibility, and recover after errors
>>   - save vfio pci config in vmstate
>>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>>   - use qemu_strtol
>>   - change 6.0 references to 6.1
>>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>>   - distribute MAINTAINERS additions to each patch
>>
>> Changes from V4 to V5:
>>   - rebase to master
>>
>> Changes from V5 to V6:
>>   vfio:
>>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>>   - delete unmap.size warning
>>   - fix phys_config memory leak
>>   - add INTX support
>>   - add vfio_named_notifier_init() helper
>>   Other:
>>   - 6.1 -> 6.2
>>   - rename file -> filename in qapi
>>   - delete cprinfo.  qapi introspection serves the same purpose.
>>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>>   - improve documentation in qapi/cpr.json
>>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>>     qemu_ram_foreach_block
>>   - rename handle -> opaque
>>   - use ERRP_GUARD
>>   - use g_autoptr and g_autofree, and glib allocation functions
>>   - conform to error conventions for bool and int function return values
>>     and function names.
>>   - remove word "error" in error messages
>>   - rename as_flat_walk and its callback, and add comments.
>>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>>   - rename close-on-cpr -> reopen-on-cpr
>>   - add strList utility functions
>>   - factor out start on wakeup request to a separate patch
>>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>>   - conditionally compile for CONFIG_VFIO
>>
>> Changes from V6 to V7:
>>   vfio:
>>   - convert all event fd's to named event fd's with the same lifecycle and
>>     delete vfio_pci_pre_save
>>   - use vfio listener callback for updating vaddr and
>>     defer listener registration
>>   - update vaddr in vfio_dma_map
>>   - simplify iommu_type derivation
>>   - refactor recovery from unmap-all-vaddr failure to a separate patch
>>   - add vfio_pci_pre_load to handle non-emulated config bits
>>   - do not call VFIO_GROUP_SET_CONTAINER if reused
>>   - add comments for vfio cpr
>>   Other:
>>   - suppress rom_reset during cpr
>>   - more robust management of cpr mode
>>   - delete chardev fd's iff !reopen_on_cpr
>>
>> Steve Sistare (26):
>>   memory: qemu_check_ram_volatile
>>   migration: fix populate_vfio_info
>>   migration: qemu file wrappers
>>   migration: simplify savevm
>>   vl: start on wakeup request
>>   cpr: reboot mode
>>   memory: flat section iterator
>>   oslib: qemu_clear_cloexec
>>   machine: memfd-alloc option
>>   qapi: list utility functions
>>   vl: helper to request re-exec
>>   cpr: preserve extra state
>>   cpr: restart mode
>>   cpr: restart HMP interfaces
>>   hostmem-memfd: cpr for memory-backend-memfd
>>   pci: export functions for cpr
>>   vfio-pci: refactor for cpr
>>   vfio-pci: cpr part 1 (fd and dma)
>>   vfio-pci: cpr part 2 (msi)
>>   vfio-pci: cpr part 3 (intx)
>>   vfio-pci: recover from unmap-all-vaddr failure
>>   loader: suppress rom_reset during cpr
>>   chardev: cpr framework
>>   chardev: cpr for simple devices
>>   chardev: cpr for pty
>>   cpr: only-cpr-capable option
>>
>> Mark Kanda, Steve Sistare (3):
>>   cpr: reboot HMP interfaces
>>   vhost: reset vhost devices for cpr
>>   chardev: cpr for sockets
>>
>>  MAINTAINERS                   |  12 ++
>>  backends/hostmem-memfd.c      |  21 +--
>>  chardev/char-mux.c            |   1 +
>>  chardev/char-null.c           |   1 +
>>  chardev/char-pty.c            |  16 +-
>>  chardev/char-serial.c         |   1 +
>>  chardev/char-socket.c         |  39 +++++
>>  chardev/char-stdio.c          |   8 +
>>  chardev/char.c                |  45 +++++-
>>  gdbstub.c                     |   1 +
>>  hmp-commands.hx               |  50 ++++++
>>  hw/core/loader.c              |   4 +-
>>  hw/core/machine.c             |  19 +++
>>  hw/pci/msix.c                 |  20 ++-
>>  hw/pci/pci.c                  |  13 +-
>>  hw/vfio/common.c              | 184 ++++++++++++++++++---
>>  hw/vfio/cpr.c                 | 129 +++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 | 368 +++++++++++++++++++++++++++++++++++++-----
>>  hw/vfio/trace-events          |   1 +
>>  hw/virtio/vhost.c             |  11 ++
>>  include/chardev/char.h        |   6 +
>>  include/exec/memory.h         |  39 +++++
>>  include/hw/boards.h           |   1 +
>>  include/hw/pci/msix.h         |   5 +
>>  include/hw/pci/pci.h          |   2 +
>>  include/hw/vfio/vfio-common.h |  10 ++
>>  include/hw/virtio/vhost.h     |   1 +
>>  include/migration/cpr.h       |  31 ++++
>>  include/monitor/hmp.h         |   3 +
>>  include/qapi/util.h           |  28 ++++
>>  include/qemu/osdep.h          |   1 +
>>  include/sysemu/runstate.h     |   2 +
>>  include/sysemu/sysemu.h       |   1 +
>>  migration/cpr-state.c         | 228 ++++++++++++++++++++++++++
>>  migration/cpr.c               | 167 +++++++++++++++++++
>>  migration/meson.build         |   2 +
>>  migration/migration.c         |   5 +
>>  migration/qemu-file-channel.c |  36 +++++
>>  migration/qemu-file-channel.h |   6 +
>>  migration/savevm.c            |  21 +--
>>  migration/target.c            |  24 ++-
>>  migration/trace-events        |   5 +
>>  monitor/hmp-cmds.c            |  68 ++++----
>>  monitor/hmp.c                 |   3 +
>>  monitor/qmp.c                 |   3 +
>>  qapi/char.json                |   7 +-
>>  qapi/cpr.json                 |  76 +++++++++
>>  qapi/meson.build              |   1 +
>>  qapi/qapi-schema.json         |   1 +
>>  qapi/qapi-util.c              |  37 +++++
>>  qemu-options.hx               |  40 ++++-
>>  softmmu/globals.c             |   1 +
>>  softmmu/memory.c              |  46 ++++++
>>  softmmu/physmem.c             |  55 +++++--
>>  softmmu/runstate.c            |  38 ++++-
>>  softmmu/vl.c                  |  18 ++-
>>  stubs/cpr-state.c             |  15 ++
>>  stubs/cpr.c                   |   3 +
>>  stubs/meson.build             |   2 +
>>  trace-events                  |   1 +
>>  util/oslib-posix.c            |   9 ++
>>  util/oslib-win32.c            |   4 +
>>  util/qemu-config.c            |   4 +
>>  64 files changed, 1852 insertions(+), 149 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>  create mode 100644 include/migration/cpr.h
>>  create mode 100644 migration/cpr-state.c
>>  create mode 100644 migration/cpr.c
>>  create mode 100644 qapi/cpr.json
>>  create mode 100644 stubs/cpr-state.c
>>  create mode 100644 stubs/cpr.c
>>


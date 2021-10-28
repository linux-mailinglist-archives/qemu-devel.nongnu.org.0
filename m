Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E243DC96
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 09:59:23 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0Jm-0008Cf-3X
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 03:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mg0Hf-0006qf-Pz; Thu, 28 Oct 2021 03:57:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mg0Hc-0007BE-1V; Thu, 28 Oct 2021 03:57:11 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S7M6ap023387; 
 Thu, 28 Oct 2021 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=xoKpXFzkYegSE51Dx6AoWFWCtIgW5TS/EVxoS2/KfVk=;
 b=FyekbzWRHquuLTB5pPBnR3J+vRLyG1rYvfoWDEtT61YLcMW9QkqBAga4NNBUibVmNxNg
 ENl0HmyIwdv31DnH/ai7h5eZCcsN5Sl/BtUmLnE5b3ex3XuJb9fhyQK5CFB4GxAwiSbq
 DgPiymUlUbVXhNTcwtQ4BoWeV1SpOZUazsoBx2BvGZDdmZzhM/Ml3WL0estF9YWbzMqW
 6EPsKoYFlda1Lh3h5hGGKGs6kxbtDfAQuIH07NbZ3hphsVUH3ePs5Ol4fPZdohL2qm0c
 DP16gfytPSIVpCuR3qA7sZ2pzFExgGkHoUZ7WVhEbIKoIMzXYZR4vmFZYPLxBe6EeRZo eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byhqr929s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 07:56:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19S7pJq7105537;
 Thu, 28 Oct 2021 07:56:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3030.oracle.com with ESMTP id 3bx4gb4n5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 07:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mid+BQ3nPTz/AWD/CX4IzmF71VEr6CtJstmstw9LKNvvvVrHOSe6EXztu93WQmipeygdKMhMjOco9xnTAnF0WHCQsuZobZwA6JiG4hbWs1f+GUzOjxNfruE5GD/I9eUVOrz4eHtoY9pccYSWyXpSSPlmHcs/dVdzd1uM4DqRcoB3raF4TaeO/l2zc1be1RNduHN3hWdUh5Vse/WscrwyUFCo3LgKRWU11AZjN6H03y5q3XyMdhMDQ/Q0P1efXSsvzAJ/pdef8EV7dF3+PFBem2jOGifzvpFnsJyKByOsTDXHbZExozWV/3pIE7O7x4wkjSMsJiDWK4PvXQLYwy1MgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoKpXFzkYegSE51Dx6AoWFWCtIgW5TS/EVxoS2/KfVk=;
 b=YP+5/ETDve7R0/ChXtxd7MtLol1eLcSA5im7iYfSuwVVM+NuPEsxmtGRaI54NIV16qpVY/kaXvkLWGai04M4nW/LCffBnirccI5kbqoygHqXuOdlyhVQ75LEvu0MweInVfPExO2iGHPnlMCyAFY4fVPOAXt/LQLhjT3MOJNS1DqIjB266juim/kta4XJJ9IYG43Y8k4ajlnmKzH4vDQCVdH31iFxvYu5Fj+/jWAR3FPuM3uhdTh2ARyrtxKM8I8QyxJLVXdB7PhUtfbpbnW2eYbPomwz1MCQGs+Uj6P4sxlLyIJJ7MWWPRwNS0kEyNjmPlhErv0a66xQVEhLgMt/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoKpXFzkYegSE51Dx6AoWFWCtIgW5TS/EVxoS2/KfVk=;
 b=nhWSf6XcP/xjsP8PI6mRKJubghRQ52IxyTo30GLsI/2xPPhRyTDSP2Fzire0+ja8an6m51A/8VJ5yVef3bKfzH7bg0bZnx6ksP+2e+AWUcWjAEsA+GZUXDs3bCnA8L07PHYKRpHLcmvrHPk+4X9w4Qs2b5jQwgOjBw7uk9clQwM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Thu, 28 Oct
 2021 07:56:44 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 07:56:44 +0000
Content-Type: multipart/alternative;
 boundary="------------Zj3Rxjct0p0y2kdM8YKZyFD0"
Message-ID: <06347f30-203c-2dad-77d7-5d3dccdd8b3f@oracle.com>
Date: Thu, 28 Oct 2021 03:56:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 5/8] qmp: decode feature & status bits in virtio-status
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
 <00c6f307-4bcc-d9f7-3abb-bde6615eadcd@redhat.com>
 <cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com>
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.230.93] (209.17.40.47) by
 BY3PR10CA0025.namprd10.prod.outlook.com (2603:10b6:a03:255::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Thu, 28 Oct 2021 07:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d98d7d0a-9de6-4c15-0839-08d999e87bb2
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4664570AB42464E6AAE1338DE8869@PH0PR10MB4664.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1VefXyBZpJdrVRuSTtJ+jIoJ40kWf/x45oL7XoQAQv3v0MwrQYIYuKD2+ruDTbqRvjw/WYm5NmwdalZNj9P+kRM61xDECZU5eRGK/EuhXYw++pyPj8DXpo8edivyur9qF48W4v5cQB/VqZzHzDnI6YBUS/Ow0nNIVx8mhvwKRIUQXdt1O7GP239sJv7T/oCAF9ZFIL7wGGl1LSBF2P4T6GKSGL48ul4j3IrlIEuXiEFmhqqp59EgS8thOlfNSkurIond5VsRXEei12c9UMB1f4JSOXRNQ7IU1C+mQMaOwUKoiPN59a+VsI7WEQc1VxdddFKw5uOQ2mqlTVTSywk4peMb1ccggZqLz7K3D/CXZY0nHZN7TKEvjcwOm/F4CdjGhsNLhlC/tLEz4/foq4210RlShKs2iLfHWwiBTVnu0E4tJcDIukLxm+UNdKYreZ4mwpw95HybvUMgF7b1UPo3pVPkeeNgKSBIJJiE8U+Qe42wOGOp3xkCwNAQbzz2EHS8KJZ9AuYQCCY4sYYMr5I5C6w94LL08DDTLq6wBq8KlM0R1FJm7m4SDkv16pvuJ6vXVDPCqQjM0bflxvG8721TZbSrT7Epcl1HqHJ61ifHOXrw7WANnTDUXGY3qgHA57Qywjma8kedVakrUkBRRPXYcGd+rQOiB7NYM9ixlEGI58BNeu1CC+a6JIJCOuZPwHraKtvVWobsoT6rIRDFGQomEGVON7Sw8A3mkbUiN5SKUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(31686004)(38100700002)(956004)(2616005)(2906002)(316002)(44832011)(16576012)(31696002)(110136005)(36756003)(7416002)(66946007)(186003)(8676002)(66556008)(26005)(66476007)(5660300002)(508600001)(6486002)(86362001)(53546011)(33964004)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHVWTXJWc3kyOVBnUGdXbmdNSDFMTWE1UmE4M1BHb2huMk43cGVaTlVoRUpX?=
 =?utf-8?B?NnZ4KzNTU0xSK2tPS2l2L1dFL2NQdTJKUDFMM3NnZXRPTmc3V0tGcnRpdGpC?=
 =?utf-8?B?L0dXbHkyNGRsekRIcE1XaExwZCtYTjA0UG5yL0p3ZU8wWW85SHlaK1pDYk92?=
 =?utf-8?B?OTlJdk8xa2pjUGg2T3NqMHQ0cTBxekt4aWV6Q3cyMHg2WWtlaWZLSlQvYm9t?=
 =?utf-8?B?NFJ4T28wU2xhc0NKQUpSY1Z0N1EwRVhKQ0xLbVZxQkZsNzhuVkhmTmdqRS9r?=
 =?utf-8?B?b1lFcTJSVmYyMFJYRFRVTFlBdGU4MlpDbjg2cGhBVGRMYW54RnZBQU5ra0lm?=
 =?utf-8?B?SlJ0Z2czN1lnbjlZUmlHR2ZJM3hpYkZqUlo2WDNFbmgyT2hMK28yTm14dDIr?=
 =?utf-8?B?WmF3WDRhWmVDQkd2YkdONDlRYyszN2wxTk5JVkx2RFk1ZitnTWdrVlo1NVhC?=
 =?utf-8?B?Y2FzTGhqKzZiZmZZLzNrRVJDTW5sa2NsZS9qVGdaTlV2Vi9VeitZQmxvMjFa?=
 =?utf-8?B?dXZrSHhFSmc3blVJMmpCK2FNaDhEOGltcU9zSTNLcTZOa2FvVFlmbkNSdVNu?=
 =?utf-8?B?K3l1ay93a0xFUE9RK3F5UnNybVdmc1VBNmJKdFFNOEJQeXZBS2JRdjNZQ2Rn?=
 =?utf-8?B?N0lSS1h5Y3hQTWhCdE52aWF3UFdia3hxWklMK2hLS00rSUlZK0YyWGR1ZGdt?=
 =?utf-8?B?RkVvcTJhTE1UL01LOHprUXprK3JFTjQxWnl3bk9ZTE84ciszbHkwcE8rOUJW?=
 =?utf-8?B?cEpVVG1rTjdMZTBwZitlSDhXdnZ2bmpiWHJFMzFMeTJKbENhK0JVNmlpMTBV?=
 =?utf-8?B?Z0JJcEdTenFqUHhkaXFBUEswTllxVnV2blg4WUNnQVF1clBqVE9mbzg2WHZx?=
 =?utf-8?B?Y1YyTEI1WjcxejVrRFpRYkthV1JsUS9QZndDekNJSytPY0p4Uy93Nkx5b3cz?=
 =?utf-8?B?OTJyZ3dlVFZnRnp1YzVXb0VVR2xqOUFneVIrZUsyZit4ckNTWEdEejAzVFJu?=
 =?utf-8?B?VTNML1VvYWhJRW96V3RiUUZEOUxyaitkM1F5cmpqRkNuZnJmRHNva3pRTnJU?=
 =?utf-8?B?cytYTGZmU0JIeG8xM0JNb1FySm44aXNxUU5ZTlJzNGh6NGdZNS8xSVk1dGNl?=
 =?utf-8?B?aTRTNTFTbjgxeWdSekxZMG5mWkRlbEp2WjdYcVpBdHJhREhWQjJoMnFmZHdP?=
 =?utf-8?B?bmVCRkJteVRMQ0JLV3NzUE0ydjAySjlCS1krelFLV3dqYVBFNjhmOGpUUFNp?=
 =?utf-8?B?d0gvOU1EWEZ5WkVVdDZUckJKb29SU3Z4eHNqa09ib2lvRXhRRTljbmhaTzBG?=
 =?utf-8?B?MXo3ck1IcW5hcE5ERFVHYUovU2VWSjFBODRrZklaZE5sbnFrWTJ2UzVlWnBW?=
 =?utf-8?B?TXYvZXovWTcvZUk2QkVZMnZ5ZjhpanRsUXl2ZkMxK1lpa1dZMUIxNUhnY1lm?=
 =?utf-8?B?UVBCTmhTdFdVdFFvT3orNUhtd0M4bU5XRUE1Y1BheXF5elA3UnJoMzljM3I0?=
 =?utf-8?B?Q2VPUTZMYmNvQW02ZFBIc0YvakYyL2lHRldWejVQaWZFbWVGbXhwM0xxRFVl?=
 =?utf-8?B?Wmw3SndDcnlZdzJLZ2JmV3VvMXEwOUh3Y01ZTklrOVRCUGZvQmZpNXhBU0p3?=
 =?utf-8?B?YUw2S1Mvdk5wSndQR1AwVzFFM1JvL2J0a2VYaTBkdE04VHgzdjVRUXRJdFlL?=
 =?utf-8?B?ZU5KNHFTMTlURTd0bVhVTjE1dGxkSVZCZ2ZnM2VIRDRSSFZkcmpFR01HMGVs?=
 =?utf-8?B?d2lFUkxlU200ZUlzNGF1SmcraS9lVzVGR0RLcGdPbVExYTc1MzYzcGp5dEtK?=
 =?utf-8?B?OGRrajdQVC9ldzJ5aVZzWDlZR2p5Rno3dWpoZGlkSWd1eFNKUWExTTFmd0FK?=
 =?utf-8?B?cXBoQTcwZ2dRVXllTEcrL0MveEtmM2JFbTl4aVI3WlVybm9OVFNnTDd4bjJF?=
 =?utf-8?B?MHYrWUNSbnY4RlE4S3JYQkliK1kya3Y5c0dZSlgyclN0VndLc254elNZNkhm?=
 =?utf-8?B?QnoxOEQ0Qk1XWmpTZU52aWJtTzlKQlJiMzhkUWZqalRiSERHZ2RjVmlpb3Zu?=
 =?utf-8?B?bThKUUxGbUIzb01ybmxPSWx4Z3Q3V2Q3T1F3eVc1aWwvdzBmSGw5TEk2cnVE?=
 =?utf-8?B?aUlvSDRqQXZiNXBpQXZ1TzlPQVhtNTh4SjlNc0w4TjZMaldDcG4wWGkycDNq?=
 =?utf-8?Q?ejd6UTTTNlSOuME9OnqHx/s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98d7d0a-9de6-4c15-0839-08d999e87bb2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 07:56:43.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2QYC8Owrxb1Dggj3h8utxWGI4Lk7TrdUBc+T6S6Tt0nSGG6+qy6zznQAhDgflTOtvqKW12duF1AiuPqPDfK9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4664
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280040
X-Proofpoint-GUID: I1whtRJsBV8Yqrpzqrnnmk7wWuYel1-i
X-Proofpoint-ORIG-GUID: I1whtRJsBV8Yqrpzqrnnmk7wWuYel1-i
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, thuth@redhat.com, mathieu.poirier@linaro.org,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 qemu_oss@crudebyte.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, arei.gonglei@huawei.com, kraxel@redhat.com,
 stefanha@redhat.com, michael.roth@amd.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, boris.ostrovsky@oracle.com,
 raphael.norwitz@nutanix.com, eblake@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------Zj3Rxjct0p0y2kdM8YKZyFD0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/21 08:18, Laurent Vivier wrote:
> On 27/10/2021 13:59, David Hildenbrand wrote:
>> On 27.10.21 13:41, Jonah Palmer wrote:
>>> From: Laurent Vivier <lvivier@redhat.com>
>>>
>>> Display feature names instead of bitmaps for host, guest, and
>>> backend for VirtIODevice.
>>>
>>> Display status names instead of bitmaps for VirtIODevice.
>>>
>>> Display feature names instead of bitmaps for backend, protocol,
>>> acked, and features (hdev->features) for vhost devices.
>>>
>>> Decode features according to device type. Decode status
>>> according to configuration status bitmap (config_status_map).
>>> Decode vhost user protocol features according to vhost user
>>> protocol bitmap (vhost_user_protocol_map).
>>>
>>> Transport features are on the first line. Undecoded bits
>>> (if any) are stored in a separate field. Vhost device field
>>> wont show if there's no vhost active for a given VirtIODevice.
>>>
>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>> ---
>>>   hw/block/virtio-blk.c          |  28 ++
>>>   hw/char/virtio-serial-bus.c    |  11 +
>>>   hw/display/virtio-gpu-base.c   |  18 +-
>>>   hw/input/virtio-input.c        |  11 +-
>>>   hw/net/virtio-net.c            |  47 ++++
>>>   hw/scsi/virtio-scsi.c          |  17 ++
>>>   hw/virtio/vhost-user-fs.c      |  10 +
>>>   hw/virtio/vhost-vsock-common.c |  10 +
>>>   hw/virtio/virtio-balloon.c     |  14 +
>>>   hw/virtio/virtio-crypto.c      |  10 +
>>>   hw/virtio/virtio-iommu.c       |  14 +
>>>   hw/virtio/virtio.c             | 273 ++++++++++++++++++-
>>>   include/hw/virtio/vhost.h      |   3 +
>>>   include/hw/virtio/virtio.h     |  17 ++
>>>   qapi/virtio.json               | 577 
>>> ++++++++++++++++++++++++++++++++++++++---
>>
>> Any particular reason we're not handling virtio-mem?
>>
>> (there is only a single feature bit so far, a second one to be
>> introduced soon)
>>
>
> I think this is because the v1 of the series has been written in March 
> 2020 and it has not been update when virtio-mem has been added (June 
> 2020).
>
> Thanks,
> Laurent

Oops, I think I just might've missed this device. I can add in support for virtio-mem
in the next revision!

Jonah

>
>
--------------Zj3Rxjct0p0y2kdM8YKZyFD0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 10/27/21 08:18, Laurent Vivier
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com">On
      27/10/2021 13:59, David Hildenbrand wrote:
      <br>
      <blockquote type="cite">On 27.10.21 13:41, Jonah Palmer wrote:
        <br>
        <blockquote type="cite">From: Laurent Vivier
          <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
          <br>
          <br>
          Display feature names instead of bitmaps for host, guest, and
          <br>
          backend for VirtIODevice.
          <br>
          <br>
          Display status names instead of bitmaps for VirtIODevice.
          <br>
          <br>
          Display feature names instead of bitmaps for backend,
          protocol,
          <br>
          acked, and features (hdev-&gt;features) for vhost devices.
          <br>
          <br>
          Decode features according to device type. Decode status
          <br>
          according to configuration status bitmap (config_status_map).
          <br>
          Decode vhost user protocol features according to vhost user
          <br>
          protocol bitmap (vhost_user_protocol_map).
          <br>
          <br>
          Transport features are on the first line. Undecoded bits
          <br>
          (if any) are stored in a separate field. Vhost device field
          <br>
          wont show if there's no vhost active for a given VirtIODevice.
          <br>
          <br>
          Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; hw/block/virtio-blk.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 28 ++
          <br>
          &nbsp; hw/char/virtio-serial-bus.c&nbsp;&nbsp;&nbsp; |&nbsp; 11 +
          <br>
          &nbsp; hw/display/virtio-gpu-base.c&nbsp;&nbsp; |&nbsp; 18 +-
          <br>
          &nbsp; hw/input/virtio-input.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +-
          <br>
          &nbsp; hw/net/virtio-net.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 47 ++++
          <br>
          &nbsp; hw/scsi/virtio-scsi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 17 ++
          <br>
          &nbsp; hw/virtio/vhost-user-fs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +
          <br>
          &nbsp; hw/virtio/vhost-vsock-common.c |&nbsp; 10 +
          <br>
          &nbsp; hw/virtio/virtio-balloon.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +
          <br>
          &nbsp; hw/virtio/virtio-crypto.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +
          <br>
          &nbsp; hw/virtio/virtio-iommu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +
          <br>
          &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 273 ++++++++++++++++++-
          <br>
          &nbsp; include/hw/virtio/vhost.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
          <br>
          &nbsp; include/hw/virtio/virtio.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 17 ++
          <br>
          &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 577
          ++++++++++++++++++++++++++++++++++++++---
          <br>
        </blockquote>
        <br>
        Any particular reason we're not handling virtio-mem?
        <br>
        <br>
        (there is only a single feature bit so far, a second one to be
        <br>
        introduced soon)
        <br>
        <br>
      </blockquote>
      <br>
      I think this is because the v1 of the series has been written in
      March 2020 and it has not been update when virtio-mem has been
      added (June 2020).
      <br>
      <br>
      Thanks,
      <br>
      Laurent
      <br>
    </blockquote>
    <pre>Oops, I think I just might've missed this device. I can add in support for virtio-mem
in the next revision!

Jonah
</pre>
    <blockquote type="cite" cite="mid:cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com">
      <br>
      <br>
    </blockquote>
  </body>
</html>
--------------Zj3Rxjct0p0y2kdM8YKZyFD0--


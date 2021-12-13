Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433AE473692
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:29:45 +0100 (CET)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwstD-0003oe-TM
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:29:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwsqr-0001kX-Kz
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:27:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwsqo-0001OQ-Dv
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:27:17 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDL6otP021570; 
 Mon, 13 Dec 2021 21:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Vscjtzsz0LpIwC0EnSOeRt974ot8KtRQOVgnK+D2A+s=;
 b=jCCw9txqUr6jJrawhvMX76HQRpUJgU5GUoP6BTTLU1Ib55CnOyznmisQ1gueLfM9sMu8
 6g/dq8M8bB64z/rfgkFyzT1Gay57NCFfE79cyHaVXbIoPgA/3G+MfE5RrmBAg+gZxfPB
 Yh0kjf9mnYe0wBWvtEYU/fVVPpWqILUsXMjNWzNDClHN6/2JDujIc4atJUC5mjciMrFd
 6y6kVMEEXEN3rTwnVv6pmk0rkuJkDMRgAKrF+zNlhxWnecvs67b2DpHoja2dBEVzpYwc
 1Yirv6DKazAmGWGhfO/9Hi983Od7JFxY6OH6B7Fzw515B3oLaul+fhEpcEULWTcR0D3C tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3uk9ywn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:27:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BDLFWFo102113;
 Mon, 13 Dec 2021 21:27:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 3cvh3w5cc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNSND3wxIltScdvyGF3FGev20/u6HO9I9tR6BfSfrv7vlO3uHxVOFzjXnpwmV15MqL1L/QqmKwMcESOXH4XRNat58/wak6nbE/SZUlFZNLA/AqAK1sSlFMguGHqrBtC+g8hlBQG3ZXudqII4uiyuPI4SkkW8qUrbMyI+GHJ01cz7VsuwAF4tF4g3eOnwHD00a3KmKE9kZ5pK86KLDCi7eCeBK5v37y/FRluXsthujqLQbwKWw2yvINRK64EkceQDDVDTTp7FbY/q+buJBnhuNzpEaUk9+0hwWYb6qHwjeml//7KOSxc7NhMmZqV4VRY0b1q2GxbngBX2FXnTxP2whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vscjtzsz0LpIwC0EnSOeRt974ot8KtRQOVgnK+D2A+s=;
 b=jEff7lkaLOujmqLtEYpq7af6ISjSv17xWA+oIWBzrVebOem/foJTVclG8IWDqehY3f+XdOIRk56Ns1YAYJa+BMhGtmmtfdxXHrgemQES8ykluQ7uVXLfMKh3duabxyJNJEyeOYEE6jDQGvBs0t4TVvYoz1wOvp5qiQTOuToqAoSzs/VE7SrooiVHqKqepcU/UyW+6L/6WekOHm3J5RfltsB+sbMFJvAU4mS9fNUQQdNXKgkjsN/AbevFUr8112pAiy25BwWg6/mbvBriFhcJGI8q+yWjLI1sM/P14qCYdz8t/ats9ceoWXv0VkOIjhIV9lvTWPJYCTOHDhZIlk+XyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vscjtzsz0LpIwC0EnSOeRt974ot8KtRQOVgnK+D2A+s=;
 b=hvZpIO1LeI4vVOrKwzqehGDns3tAAoNeIU3jipGRWVuFwleGyYmTVMrr7DOmJLrX4Wxe3LeIkPwSMAn+LhnEGgdwOH+o4O/7fL4H0qEUvTMnZP5OdNqZr2d4295J66f1EOhSli8W9cUtLFceekuQJ3jf1WcJV3ujpk9Te6pbFNw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1805.namprd10.prod.outlook.com (2603:10b6:300:112::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 21:27:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 21:27:00 +0000
Message-ID: <45a36fcb-d778-e077-a1ac-522d75e79af8@oracle.com>
Date: Mon, 13 Dec 2021 15:26:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwxqBfk4jSdH7EDzUHjVPBr7DiLkKSeq7grvFOX_AX3hgQ@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwxqBfk4jSdH7EDzUHjVPBr7DiLkKSeq7grvFOX_AX3hgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0034.namprd11.prod.outlook.com
 (2603:10b6:806:d0::9) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 707875c4-fcab-436a-639d-08d9be7f4c2a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1805:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1805D4B060D073369624458B97749@MWHPR10MB1805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8KiGUBTT7Xoq+CpAZV3MlJ4gPAwAAvtdykrx1QtyjfjfwqcUcXpQBI13dqLm487nkOSem/lG2/uo3Ij7RHSJvSWCdZXJWqVoTU/9EBHItHV3DfadWq8/r0EmLvKU1/QFp7bjPUTq8XTK7K8XtjHoqjwqLbGLalq2HdAPqq7wSp1gJdvvcpLSgYc/O3ick5TAZDO5h3fQ6p+lgD2Ab9VfA6+ObImta/tjfPXUuVnjQGiVQKaWYi5C72neaSEyIAN7Xi2K0jK7LxD4xA8cN5oShlWeHvFEKlgNXgHaiHMh1LwiL3t4LqW644HXMNBUNvH3tR8L9bPzsE2oLYa9dT2KLlWdNKKaFOs0+BbF3f3eMcImMjhasJoSvAIAl4F2P5b6jDGI4jaoYCNWjXrO5+ZP7G8GzKH+Z8SI4/7yddcSBJAsIL670x1wzQuKfb0uHyAGM6ADOsJ8LvmZ6qsI+Eo8hfFcOlcDnQhgeV4JWEGCBmO1Z6IEybcuct4jHSJguE2vmNfHnG0Aa3vpWK3/3CqDoUc0J1O+lMfmr9vm2ZlHNiTrDYXzSGC3l3joKSs6U2VrzmfK//QXsk6i65w/otiSUQpc+vTxUc55V6Bt/1CtqLMbcF8gBWS7JwLXCorNUtOD3gY+rFSkwyQtJXy1L/5iYhylRYmCIAny7Ne4fLfvJCTsfTSz9ic3uAsQdEkqA7rltb3bsyp11lQ6Nkm1bSORIb0xWXGntDFid7K35YjL4BYby0ac4Sd3K77iMNCP6gt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(8936002)(86362001)(316002)(31686004)(6506007)(53546011)(5660300002)(8676002)(6512007)(38100700002)(186003)(2906002)(6666004)(6486002)(508600001)(2616005)(31696002)(66946007)(66476007)(66556008)(6916009)(30864003)(83380400001)(107886003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0Y2V3pRdk1ha1B4LzdXWEdaNEdCc3I5Q1NUS0pjZUpNWVRIRzgycXVxa0cy?=
 =?utf-8?B?c0F1bzJoYUtQZ3c5Q0tnVmx5ZGxqalk5TTNSQm5GcFEzaWZ5Uy9LNXFXSXlQ?=
 =?utf-8?B?SWpyYzFnYTg1bm5RSGprVmk1c3IzdFBSeEFWeS9JM2ZZUm5rYTlnRnVDWlNr?=
 =?utf-8?B?ek02RXp3WkIzVXZKczc0azN6bytVQVQvZFBQTzJ6SUZadmd6MTBqME05UDhL?=
 =?utf-8?B?QTl1bFJoZklHT0xQb2dVMWVWSWxQY1RGRVo0MXZRNVZjM1A5REd0OU9tcjg2?=
 =?utf-8?B?SWVsZGFaYWhPNzJ6alBRd3A1Q1FteWh0UnhpYzMrRWR5L0xMTStSb0g4bEp3?=
 =?utf-8?B?NmxBeGdsTFhSbDR6S3FEbUlNaEVzOFlHRWlQUm95azVqN0lTVDc1TW9kMnpE?=
 =?utf-8?B?WmJmclVKWllkZ0RQQjkveDNXcTBncHQwbXZTVEFPdFJkcW50MGp4cHdNMVla?=
 =?utf-8?B?MzA3RVdUR2tVaEt0SVY1TmFzaUhKcGhGbXFXcE9HU3pMbDlpK25UODZ3VlhU?=
 =?utf-8?B?UWJ6K256LzUxaXRpT29kVU1NOXpIQmh5ZUF6YjB5Mmhod0xIM1FqSDA5NXRK?=
 =?utf-8?B?TE8zM1ZPVWlVOGk3LzVGTHpzWUJCQ3c2K3htOGhuK3B2K2lxdjNpeU1vQ25J?=
 =?utf-8?B?OWR0S1Z0UHRHd3JCN1lxZU5IT3ZES2JUL1A0dUp6eVVXYys3NTZJbTMxQUJ5?=
 =?utf-8?B?aThWb0RpMkNOMWdoN2hRNGdac2NVb0lzVERSZ3l1NWR2UVdmeUU4Vkt6OWQ5?=
 =?utf-8?B?TDUxckhJd3Y1K1doVHQ0b0hBQTA5em1tUUNwb2NoZnp4WjVpQStMOHYyZVhZ?=
 =?utf-8?B?b2JXc3pCQkZaQnFjKzhRVEdpVFhibnN0cnFQU1R3Z3h1QUh6bmJsKzdPaDln?=
 =?utf-8?B?c0szbndSdGpJNTFYUUk0NXBrM245N2hZY1RzTjlCaGgvc2ZBZDdIZDA4Wmxh?=
 =?utf-8?B?Vm5oSVlWMnVXRXYreFB5TlFxbDYwSjRHcUF1b25TNmFNU0VRWXRTcld4NDli?=
 =?utf-8?B?dGlGYVpYTWlvK202QldXR2pDZGZ3N01OUXNDM2RjTmFsNDNwOE5SQjBVekJw?=
 =?utf-8?B?ZjNuVWk0aWNZbE0rbEE0M25xak1oVXNteUJVeUZMN3NKL2JtUnBWRlhwTTEy?=
 =?utf-8?B?Sis0bUJiWXFBbDJJVmFPVG40UVRQTElvQWVWSkZacE84azkzYjQ0bC9LMlow?=
 =?utf-8?B?NGJta2w4TXpQYXRDWVhXOTVHK0NBSEh4a3Y0S2k1TkRreHZIMFBOT0Rwd0Ev?=
 =?utf-8?B?MDlwQU5oWCt0SWJsZ1lyQ0F4TXFaM2c5SDhReXNIMDRVVVJDb2lzNlg5Zk55?=
 =?utf-8?B?TTVjWmNLSjFaVjdSZVlVZWFuRmdaUnpLaFdDQk5QSDkxd1MybllWV1Rqemtj?=
 =?utf-8?B?VE9ncVZtOFZQaTJHeXNmRzFUT3dQeVY2MjVBMnV2WDgxTFdFMFd5Vnh2NHE0?=
 =?utf-8?B?NmdyWVAzVC9WN1YwR2JNZzcrcGp4TWF5c1BmNTlQcGxWN3V2ajR1WXpBV3dQ?=
 =?utf-8?B?UGVyQW9SODg2Z0MwdXp6dmRiMytTNXBreGZjZ0JISmVWcFg5dmhkbFZMRTln?=
 =?utf-8?B?bnlZeklkZ1I3dm5mRmlVVDNBK3RhSy8vMTdoMGpUSjcxV05rL1RwMVdzSlJ2?=
 =?utf-8?B?TnVvWkNXbS81RStYQVEweVFXWGhJQ3ZNcEhNRTYzNUc0c0hWdlJ5ckJFMHNq?=
 =?utf-8?B?eUF0SExyWnlCc1ZsQXFrVEdtRzlmNzNpektzYkFsT3RnbVFEZzd0cnlTZC80?=
 =?utf-8?B?blRxcjRnN21Mb0FEeURrRXhlSlEwMzl1RHl2RnVpbVgzeFZ0ZVd2UWNCVGEw?=
 =?utf-8?B?eVA0MGVlcGZJc1ozYm1nb2N2ZkZmdWR1NFMyalI1MlRMZzF6c0ZPYkZwbzgw?=
 =?utf-8?B?bmtPa1dyRWhpbW0vUGVEWklad1hIdTJnd2NCbWYxcHkrLzFqWk5WY3lRcEFl?=
 =?utf-8?B?T2duSDJBdHV0dWdnc08rQk1hOVloTVFnVTNqeFpVaDNmOTIzdXR1aE5oNmZ3?=
 =?utf-8?B?NkF5WDVudGhSN2RNNmxRcXEwVHJoNHAyUDc2T1VVaXJlZWpaNVVRK1pKSWc4?=
 =?utf-8?B?M2dKMkRncUZiblNJWDhiK3FJV0x0SVdtTzV2K1BZMFRyWWw1KzQ2cGdKT2VI?=
 =?utf-8?B?cDgvTTA3Z0JkbHpCblFTWGpmenRuT0kxV1Q2T1RwSDdYUXJWZ2NQclRxN0dI?=
 =?utf-8?B?SGcxUzVLaHdNc0FHL2ZuSjUxQTRNZzA5OE85aXBRVnFjc1llMGwvK2hraHp6?=
 =?utf-8?B?MFpldU1nTEFKL3hQSytuTndMcGZpdDFZYXdMa1pyUmV5RFAyRG90RFBNeEY1?=
 =?utf-8?Q?EhNywU1Xc56a4fpDGA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707875c4-fcab-436a-639d-08d9be7f4c2a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 21:26:59.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEm0MrTmHeMuFFmLtDNfTrTrVawPWf4IHr9zVr6VjFdOnGOUA4/udW1CLdAWebE+0APFEwVd72yEEgxytFJDzQ6kfV6BOGXDfO3nmqSDkwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1805
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10197
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112130126
X-Proofpoint-GUID: uM8YiSNqlOsGbbreeZ0a0siK_hJvKBdW
X-Proofpoint-ORIG-GUID: uM8YiSNqlOsGbbreeZ0a0siK_hJvKBdW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi Ani,
inline response below.
Eric

On 12/12/21 07:43, Ani Sinha wrote:
> .
> 
> On Thu, Dec 9, 2021 at 11:28 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
> 
> This patch starts in the middle of pci device code addition, between
> erst_reg_ops and erst_post_load. I do not like this :(

Below you suggest moving the contents of this patch to the bottom of erst.c.
Before I do that, consider moving the contents to the top of the file instead, I believe that would 
address the concerns cited here, and it would allow for the last line of the file to be the 
type_init(), like other files.

I'll move it, just let me know if top or bottom.
Thanks!
eric


> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 241 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index 81f5435..753425a 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
> 
> I prefer these definitions to come at the top of the file along with
> other definitions.
> 
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
> 
> This function and buiild_erst() can come at the end of erst.c. They go
> together and are doing a common but different operation from the
> operations of the pci device - building the erst table. Hence, ther
> code should be separate from pci device code. A new file would be an
> overkill at this state IMHO but in the future if erst table generation
> code gains more weight, it can be split into two files.
> 
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value,
>> +    uint64_t mask)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    switch (register_bit_width) {
>> +    case 8:
>> +        gas.access_width = 1;
>> +        break;
>> +    case 16:
>> +        gas.access_width = 2;
>> +        break;
>> +    case 32:
>> +        gas.access_width = 3;
>> +        break;
>> +    case 64:
>> +        gas.access_width = 4;
>> +        break;
>> +    default:
>> +        gas.access_width = 0;
>> +        break;
>> +    }
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    build_append_int_noprefix(table_data, mask   , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
>> +    pcibus_t bar0, bar1;
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
>> +    trace_acpi_erst_pci_bar_1(bar1);
>> +
>> +#define MASK8  0x00000000000000FFUL
>> +#define MASK16 0x000000000000FFFFUL
>> +#define MASK32 0x00000000FFFFFFFFUL
>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER_VALUE , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>>   /*******************************************************************/
>>   /*******************************************************************/
>>   static int erst_post_load(void *opaque, int version_id)
>> --
>> 1.8.3.1
>>


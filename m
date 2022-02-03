Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617854A8C68
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:27:47 +0100 (CET)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhli-00044J-Da
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFhDo-0004DB-97
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:52:44 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFhDe-0003vp-To
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:52:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213HTBju011613; 
 Thu, 3 Feb 2022 18:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=PoP5LDannTxSDVuBRQtmiGtD4KToAfTzd3fyTQ7sOQk=;
 b=1DSSnSqKsdrkAy3YyrWXy3N0nXg2cQXvlk5yOjQeexkYSmvpvtoCp8d4EezyMI7vOtoc
 FLKovg8nQ/BLcz3rEVTDAxpPw3ikvayrFWX0PiUaEotFf7NM5R9pzVDreyqTZy/BqgJt
 CrIBWFnOvG04xBB5ljNvcMTa1zBwL7Qw38Am7l8Fn2XTYCAWXHQKBlPJ8OqSdvQLauhG
 xZzv7+5R8MfskvOko/fKxbipXIspRU+4LjyQRyGt4BlJPQXEOMYK4U9Sp5L5iQYgA9z7
 3QZtXy0OX3KDpUpC0SbQOE9Qz6oZkRr/ubfBDbAHqQl+I/4Tp9D5xDiuwT+MdHLQsqZL 6Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e0het8p2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:52:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 213IpIds010986;
 Thu, 3 Feb 2022 18:52:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3dvwday15j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew8MSf+4aMDEq+Ji7QdBWOMElsy1iaWZ8FL7D6beVOC9bwHNkf75jNrETAitwLiNxXUGIt92U6ljCofPvEDJvxIJTlUoX7WP+zIf8FltpmO7Yh7zPcv7yeULpADddWtjRrmkWvhd7A8nwPUYCBg1hDvHDVwCkdH45q8uzzzsJmRSCGkSRvmD6Y8l/Mrsx/gJm1EdRZx9RzooeLCkFg1jET9WYvwY6dpa8wB8o4yueYUoWB7hwYzAXYNPbdfF6pY0sSk7sHuNnfVpgBkdXMfn6L44kY7u6FwrdGYf03kSGO7QyFwlTqsAczgoKUwwZ7c75wSdyRVubiCDYaJfh4Ultw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoP5LDannTxSDVuBRQtmiGtD4KToAfTzd3fyTQ7sOQk=;
 b=fwroE9ABlhfoYCAol8J2flA1XYyfyBAbB8Z93YDX3Xl/UJsBZr+4mfRUqQr1GteKiqMdBGl3qgmqQwyLqZ3gsczHP+BSv5eDdvj6EkXy8A5f8SFPTQwOj1dP4pp4usgM1r5bvEj3IIBEahKHbOra4yyan3lMdLAJYL9HvgPDU2dOJdZnXT1NEgUkaKziOCHryNttgmyLW/zF4LK/9Em3ob+ylJcWg4i/39PZKPBaRx2n07DHVi6juAXDINhHMKCnJm7DSeMvOlEs/QUj/LNg6FbFk8qFRAvbvRV/d1GZ27Ax48B7lOh2A+Yq0geaZ1U9Wp7Wg0+67zCMeCCyP8ngDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoP5LDannTxSDVuBRQtmiGtD4KToAfTzd3fyTQ7sOQk=;
 b=AfMstxG6eMeCzqxi4u3ZZy450hgOxeKkHmUXhPbxKRLxJ1WHFQf/Uz93VTt2/ORCnQhpYgvKa484drUqVSzDOldb9/1kTheJ5iJIBmKlIBpPCG2Mohl4zPV+QziKZ49JtrxuYfO21ASL/U1ubFUamVsp0J84XPM/I+SPwBHDWus=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DS7PR10MB5358.namprd10.prod.outlook.com (2603:10b6:5:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 18:52:15 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 18:52:15 +0000
Content-Type: multipart/alternative;
 boundary="------------U0fGocUs1Jr9PoFDO7iQVrg0"
Message-ID: <995d4558-5a80-9ede-38ca-3d81c82013a5@oracle.com>
Date: Thu, 3 Feb 2022 12:52:13 -0600
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
X-ClientProxiedBy: SA9PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:806:6e::18) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9424f62d-69fd-4dd4-8ffd-08d9e7464b7b
X-MS-TrafficTypeDiagnostic: DS7PR10MB5358:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5358805D759FB0C3636A39C4F9289@DS7PR10MB5358.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JckBECtHet6IhqBUfw0PRgXwqRMu16HDkwYPwwAU5vHPXt39J7WDvYdhNLjMEvMPzu/D/EH2uwXLXLA4lTpQxxn82SW2uMoe+dKApcgUEGcKPU7ABDyFhurY6R5wS/EcY+p2jC1Mr7vovW7q/v4vUD6aTC+6AT6sWTogbNab7YTAAbAPWhY+NtfcROtpl4R9T6JNoFtpF5FNuJDCNFTcNL3AUCA15l2nJ3LpvKbwqA34nVpI6OELnXYI29TTdw1g7qjGU1wCSmdyubz4wrgC9ow2BLvBrCtfNEeuCiviOyoENLZluIe4Ej+/iEy3JosCHBxtIfG912gM5vbDhD8QIS2QpA3Lu2neJDn10/W87jYJWEMuz1uOa+lo+dqx6NolFMuNnTv0rzCPHGt+GsDalqjrnWKMMaFkVrpVy8QLsQEPYIZJMIBSji77oSqxpBh64Zidq4tPiJ5i33wgvImBqKaeJwMWzNJHJQJpYFMbNU+CvpRJYyoqIdaVnAv/P6ZICJ3hWuLBYJYyvo6ADDP1QQm+VG/j1f1KcbpFc19oLfg2gt5inG3EZrC+LTt0FoBX1PflIVlADZcgWa3u8UPHD6IbqlibfirPBDd3kU7XAah/XYMK/J7E2ckQpldJN0pbjFblQUs9GfRmYyoQXxX3bgKy4jOTAwoFA7Fs/XGp6jDpx4+Nqi449l26oxP9j8BZ+gNCj405jFIWBBvHpMyjh4H3/FaLw4otAIcR0kvKUe3d5oNUVWq6OByZJXRGJWfbYpfUugMRlFHi8Vhd5dL5xGlyZfuuX+Qx99vv7kGrIwJvxgjKd7VvFfyhy3gq58vemZHyQrqlcs8Z6dM7PnwABg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(5660300002)(66946007)(6916009)(8676002)(36756003)(8936002)(4326008)(53546011)(6506007)(33964004)(6512007)(31696002)(316002)(26005)(86362001)(186003)(2616005)(44832011)(2906002)(38100700002)(6486002)(966005)(166002)(31686004)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBkaGhYQVM2Rk5UWWhZUFptNzlzL1g0REdkUzRwMUh4NE9lLzRBaWtFc0p3?=
 =?utf-8?B?RXI3WmFSejZYWUc3TEE3YlFnSFluOHByQWhHWTFkR0d6cGVzNjlpRWdzQ2VV?=
 =?utf-8?B?NFpKRUQ0eW8rVDdHR0xWV1lZSzI1eGlOV0R2b2p3Wnp6VE5LMDJ6Y1RLN3B4?=
 =?utf-8?B?Y1pRUGo1ZGx5OEFGYXJZNlZxNnpIWWtxWWliR2N2TVJOUWNEWEhKU2hWTEdF?=
 =?utf-8?B?MlRhOCtzTnFnUlhzeDV5bEl4eGJ4MnZKQWZmRXNwd2ZaRE8zSjJ4MGNjMDBi?=
 =?utf-8?B?ait0ckZ6NlEzYmt6Y0N0SUxsanRzamN2Z1l4SzJxcU9uQUExTjlXdXhoaU5N?=
 =?utf-8?B?czFPNXV1VndxczF4dkRlc0RWaTBKUWxGWk1aQzdRYjBRaTBTV3RkWm9Vdi9m?=
 =?utf-8?B?aDljeEF0bkw1b242NjdaOHExVHpiOTFDU1BuSWVLVlZIdGJMNmhaQWRJYXlY?=
 =?utf-8?B?UG1hVHRHYmlobFMzQ1BRSnorNnRWWHZIV3RJdHE3d0cvTUswRDN4R25Ob0VY?=
 =?utf-8?B?VkpKT0wrOCtMOGtMR1ZQcUN1SkhybXpZTGZNSlpWQlpKTEM1TmlJZU9HTENl?=
 =?utf-8?B?anM5TGt0Uk4wZDI0aGwrSmtYL2EyRDRXaEQ0VTdzZm1mTHlOZFg2aUN2cno4?=
 =?utf-8?B?eFN1MzBQcVFvSWpKK05kbDdVb1NVQTY4VVlEb25QZllMZ2dnaVViSnQzT2J6?=
 =?utf-8?B?emw4SklkRVRZTjdad1p3Q3NhKzdQeGZuUEJUaldMbTFCbi9Nbm9LRDh1OVFo?=
 =?utf-8?B?cTJXcHdITXdqQWFNMERoYTBWVjlUOCtDMGYyZVFic3paNzdwRk9UV05OYW9O?=
 =?utf-8?B?NFVpVFl3ci85OHpZOG80bVRVNnRkRjE2aVlpdTl4QkNlaGd6K0ZUUUZLcllH?=
 =?utf-8?B?aFlrYXIxUnhidW51UERMbzhKYWxXdkE3UE93RDFGOEkrc0FCZ1JQMStnUHJx?=
 =?utf-8?B?emxKSWdiSlJhVXVFdSsrM2lnNHU0WndLazE4c29QdWNVUjRxdE4yQUJVNlRH?=
 =?utf-8?B?Y1p2cUhDWlo3WmordDkvS0R2bEYzZkxVQmpkVzlJYktnZ0d6UjFieG5yNjBD?=
 =?utf-8?B?MDE2TzVwczhyQlVrRExzTW5tNDNJcG56UDJlbGV3b0w3YkRFcHZKcENxd1Js?=
 =?utf-8?B?aU9zVG1KcUpZRTRMK3RFRVdkb3NjcDZLMjE5OUd5OEx0QU9UMUVBUHhxUEV3?=
 =?utf-8?B?THdNbTk1LzhQdjMrUGNmbmgxZmVOcHF0YXMvN21valV4aEVWTmsxWnZTR3hh?=
 =?utf-8?B?S01qRVF0UXIvdmQrNXBocFZwaU15bTFCV0M3MjN5SUZhWXFueGxsbHZGNG9M?=
 =?utf-8?B?R2t4bDFVODdibVF3Qml0UUt6QkdFTWQxSkU4SWR6cnJEdmtyNzdxeThyNm1r?=
 =?utf-8?B?R0J5MWlYalAxRWtEb1RsbFVMS1pmOXA5N1FhZnNrbXVsM3R5aElncUJRZzF3?=
 =?utf-8?B?djFTdXlrSytHYWYvK1JnTzJrbHFNSEJ4T2k5aVEyS3BpL1RtZlhrQ3h1UE1k?=
 =?utf-8?B?Ym9YZE9aVGg2TS94RXVuSmFGaTVoSjRaalg3blNBMGpZemNWc0xob3hJQXds?=
 =?utf-8?B?UW1LQkpOODE4UUloNmxJb3FjcE1uSzJLck82UW1MRS80b1FLSk5TTEJIeVov?=
 =?utf-8?B?MFpGeGI0dnpKT0s2RWlPNTdwT25oUUs5T0Rzbklnd1BrMlkvUEd1aDUrMmpW?=
 =?utf-8?B?R0NLZkZRWDFTTk5rdDR5MUZFdlpYUkt3WTFyR2g1aTArakJtcFJ3L0xxcUNj?=
 =?utf-8?B?aVAxazg3NVVVMjZ4WmQxc0pNUE1rZFJrWGZ1a2t2cGNwR3VtQjlmREY1bVIr?=
 =?utf-8?B?VnRBYkE1SnR0NlZQYVh2dlBNUnVKVmlGaUNMRTkrcTFrSGZNazJQZjZlc3pS?=
 =?utf-8?B?aC85TjdJN1luUjUrM0xTQit2bnRid2Q0R3FBaDRWZ2gyZ2pkMVVqUXM0d3p1?=
 =?utf-8?B?dmg0VWxwQmpLT3NENlBlRWxFZllwQXNIR2o2dlh6NHFWSzFQNlhjQTBSc2FX?=
 =?utf-8?B?SWxwNWNXT1VZTDhGK1pYaWJBZHE5QXFKaEx5REcxL25tUGJHQ3RKeEdMMlBC?=
 =?utf-8?B?SXlneWZ1a05PY3p1VTBCQ2JGcFNyS24zcTdwMHBlNElpMldwSEozb2Mvbmdu?=
 =?utf-8?B?WnBKZHFianlGQjV4aFVXdVQxYVdXV2pMUktKVW92c2liV2dzWTVLZUhxVkNH?=
 =?utf-8?Q?LCTFHmtQ0Tsiuu7w3zhkp6U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9424f62d-69fd-4dd4-8ffd-08d9e7464b7b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 18:52:15.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUdovDcgG5wX85yrKXnUll5wmavNeHsTxU3K2vXtW7Y/6toEq+WK5zdOO5B6pGVpyPNLNpIHHAF55ZH+hdSvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5358
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10247
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030114
X-Proofpoint-ORIG-GUID: OKilO0fMTsOaGWby11DUNSVabC4O7GQb
X-Proofpoint-GUID: OKilO0fMTsOaGWby11DUNSVabC4O7GQb
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

--------------U0fGocUs1Jr9PoFDO7iQVrg0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/1/2022 6:08 AM, Daniel P. Berrangé wrote:
>> +##
>> +# @StatsResults:
>> +#
>> +# Target specific results.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'union': 'StatsResults',
>> +  'base': { 'target': 'StatsTarget' },
>> +  'discriminator': 'target',
>> +  'data': { 'vcpu': 'VCPUStatsResults',
>> +            'vm': 'VMStatsResults' } }
> I feel we can simplify this all down somewhat, eliminating levels
> of redundant nesting
>
> { 'struct': 'StatsResultsEntry',
>    'data': { '*kvm': [ 'Stats' ] } }
>
> { 'struct': 'StatsResultsVCPUEntry',
>    'base': 'StatsResultsEntry',
>    'data': 'path': 'str' } }
>
> { 'struct': 'StatsResults',
>    'data': {
>        '*vcpus': ['StatsResultsVCPUEntry'],
>        '*vm': 'StatsResultsEntry'
>    }
> }
>
>

I'm happy to make this change, but I would like Paolo to comment as he had 
suggested the StatsResults layout [1].

Thanks Daniel/Paolo,
-Mark

[1] https://lore.kernel.org/all/ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com/
--------------U0fGocUs1Jr9PoFDO7iQVrg0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 2/1/2022 6:08 AM, Daniel P. Berrangé wrote:<br>
    <blockquote type="cite" cite="mid:YfkiyiK+jfrdbVcY@redhat.com">
      <blockquote type="cite" style="color: #ffffff;">
        <pre class="moz-quote-pre" wrap="">+##
+# @StatsResults:
+#
+# Target specific results.
+#
+# Since: 7.0
+##
+{ 'union': 'StatsResults',
+  'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'VCPUStatsResults',
+            'vm': 'VMStatsResults' } }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I feel we can simplify this all down somewhat, eliminating levels
of redundant nesting

{ 'struct': 'StatsResultsEntry',
  'data': { '*kvm': [ 'Stats' ] } }

{ 'struct': 'StatsResultsVCPUEntry',
  'base': 'StatsResultsEntry',
  'data': 'path': 'str' } }

{ 'struct': 'StatsResults',
  'data': {
      '*vcpus': ['StatsResultsVCPUEntry'],
      '*vm': 'StatsResultsEntry'
  }
}


</pre>
    </blockquote>
    <br>
    I'm happy to make this change, but I would like Paolo to comment as
    he had suggested the StatsResults layout [1].<br>
    <br>
    Thanks Daniel/Paolo,<br>
    -Mark<br>
    <br>
    [1]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com/">https://lore.kernel.org/all/ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com/</a><br>
  </body>
</html>

--------------U0fGocUs1Jr9PoFDO7iQVrg0--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7551D06A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:58:02 +0200 (CEST)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq2T-0006rY-A5
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004sm-An
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzP-0004RH-Mb
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:53 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245MEZ2Y026114;
 Fri, 6 May 2022 04:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=dLX8BN2lrT5onf49HSoR/BD4a0vQFc3g/nDfJ0MQXuKMhvECYwF66y7hBPccrOsEgw+5
 B73sWRQnyw8M90gWpy+kYUU3FBB01Kkk58eqYmmpYwXq1u5AiPT4KfBu9ZLZBSxrEVOV
 4Vi+sY83P6DDPf/f+6+9vKl5d05h/OafRgXqUQ+WaAFb1D2cUsx44v7a6sntQm4cnyHC
 c+ysjG1phF5CH9jtI/5ny29R2b2xGpOPBmW5gmuywy7mFKJF6Pf6ftttIaMFD+1iyz+P
 xohpEy5lXt8t9c4vgRZRDuFYfnLdB4wCgMc9Ue80dclZAsT9k96unXRZJUzwA7FtqTwP Fg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhccuc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:49 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464pPLI039454; Fri, 6 May 2022 04:54:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7wn3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy+mv8uRcZ1APXOYLyqQ79lfNKRC8kpag9xlPutfCS0clhdwWroj8tQsGjijWjublN8ox8HUaIznUpIRAGWrOvXBp4SPf1QRcSKbDBdppp0U8cJTExZbupZVxFSnrzA69cA/eUbls9Av9amUtZ7D62cZi21Qe/ChX1k5MJ0sPSttuIT3u28g+sB1an3AhVXyxpPOKdM3FbM5+XjNqP8aMsJSB0i5GJ42YqvJs3CHG7UM1hFT0YigYw03bMVMHHTzD8ZudrBaQhTKiabpQCmiXKmfw9RQNuNJ2R83yxqEB3Vq+NkxHR5d6vgIrjFOPq4t40WvYXlm5Hl4djTdHl+Trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=c25oBdX+1GyLSUqJOea/BQl1MAdy7tup8ju3sDZGfZaDK/ZPLuBvveQ55mUVrLsX7FBcOWIsW+iHl5b04b04MuyT/CY5VK6YsD2zn1nn8zmI1Wgv1rJJo6iUE6usDR5/XzwLQdCZnCor5NLfNUGL3CFHhghh0bSIN0pljxb4HEypzwoX7TUXr2J0/776M3jakv44bErkG5t+124SKOun4mYf+WJojQLlhqeG+0pFvfxgjQAoF7rrFX8Zb0bvF7UVq0sCGXNT/c3yUvYaEzxiJWV/MSXJ33SJiKtSWWxseR1SigBG6bKoUd2C2J8kh4qUf+d4aYeZ11DYsTcrS5UyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=SwgxxRo4aqkT/cQOXHj7sxPG24Zs+Q0zZMbRHY/VQebQCSSBjUhpF+1eekkPnY26eRoURyxgcAZPnN7sMLfuXShbP/2sh8qKsfMK5aZLXTARWtc6vaqeDE7aQiaGsJh4AeWd8Rg47tHr4PfdwV2K89XPFQJNBVxlfy6sD0wVPI4=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:46 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:46 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 5/6] vhost-vdpa: backend feature should set only once
Date: Thu,  5 May 2022 21:54:33 -0700
Message-Id: <1651812874-31967-6-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4a808eb-34df-41dd-0123-08da2f1c8aa4
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1416BBE167389B63D373B455B1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KU0IqFuKRwVl2IF7aCiR8WcJQ1MuVN41Ql1mCIBxxVO4zIVqGvnuI7Av9do7IXFmvafmLPmgggMEwRij80mXA2FWnSqqDtb2gXKA8douW2k9LgE+X7b+opUFF7xX8O6QV7ZB+7RhqrgNKdyCzoDvSj9fl+7iiSyK94sC7AFEK+vv8DCeS49sQwcOdSR8Il1dKOT0n4s9YnHnYUd/6CoP+nDU61n19YyX4uQq9A3ShMMG2gUrZKWvjJrr5irtClsb0VZotrfUkYDRfKmKwf5vzinN8hp+W8lGXNCBjGx1/ETXgFURQY3WIv7Gg7bBQrlCSKsOTqJ1RoAQelnNthCuKwl8/BFaAPMPw19CX3mPAjGpFviRd2gjPxodZ6HcyMUdvZQCnSEkceHegrYErS1v9JPadLIhf7EKVbP720/eZ/bpi7WMYxFGMU610TgePnHibJfu4SLbVfeIyujJ368IqCr27zkENqVUivEOi74kRRN5d4Wxyh45DnZNHIffztlfnJwX8ETF08lPMHVDKqGWuPIS3GYg6fljRmOFBVUmHuaHO/c2+nVMHfz5tTapWFTk5lckEZJmo1Wop0fFNpi+lKZS3XJXw//Vc5PoG+whXxtcZoQmy4i2l2gdSC5n7F6HU77wnVmu0gUyuVBl1tqo5TUjr+fh6Rj0r+qIEcNZ498rZa8Lb4tHEMwQkRhCBvf4PD/fME9aZ0QA3ouMXnD/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(66574015)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFLU2xWS2FLdFYrL3gzNkY5VE9iamVORzQ0SmZyZS9lMWoySlV5S0ZYOE5n?=
 =?utf-8?B?OWZldXVBZ2hWRUxzRXJXL1JmMEc5Z3kxdlhmWVlRaEpNS3RCYnh5Vlk2OFpV?=
 =?utf-8?B?UXQ0anV4Q0s5VFRyeTYvZkx5OUtRRVVjRXZGbVRHeGo4SG1YZmc0dzNoanB5?=
 =?utf-8?B?QTFBWlRBU1gvVEUxWS93c0kvN2VPZnhmRXdKeWtwazI4a3ord1U5SEFJeHd4?=
 =?utf-8?B?bTZ4N0dzcWY4N01NOUxOUFBtbFNBVkNjY2VMK2RtdjNDMVl2akZxV1AreVND?=
 =?utf-8?B?UE9EWDJaaktlNTFxSTh6TzNLOU0wVng5R21ibkFaUkI2S2lJS1FNbkZZdlFE?=
 =?utf-8?B?d20xeHZUSmlmay9HYTF0aFZCbjYwTnZ0dGRnQS9TNFFRckxJWm1kNGlIdjRt?=
 =?utf-8?B?S291eldiVTNGc0VIbEJLaW4wMzRhMjFITVA4UHk3aUlIN0ZJV09OOVM1amNV?=
 =?utf-8?B?eDR6Y1V5ejZSU0N2MkxxaXFEbXhXTnpVUlErc2NuVXpRT1pzeU5HdmlmZ3Ay?=
 =?utf-8?B?UUpKL2lQTHY2dmg1ME9sOHZmdWIva05OY2FlYWpNalpmYnM1UVc2R2EvZVFa?=
 =?utf-8?B?R1FlU3BQK0FjMFhJRlJWd1JtUk02SXlsNGJEZ0dBZkpJOUFIODg2c0NEZHBG?=
 =?utf-8?B?UWU3Y3poTWdRSG01d2dySWx4N0dEaThPS05BWlRYeGxQVUl3UVlpNnZxT2tV?=
 =?utf-8?B?ZVVtdVVmR20vZExpK3pVc1VTNTFTamxDY3ZCak03UnhMRGwvVTgwZ3REM2Vi?=
 =?utf-8?B?NVVrWk81Wi9LalJId0s3bnN5NG1IWGlmaU80UG5acG8xZlBpVHZqeVI4b2dZ?=
 =?utf-8?B?RjdrQ0tRUUhRQSs4MG9USloyNmkrMjJSRnh6eGtLM2FNaU4rYy9nZXppeGpV?=
 =?utf-8?B?MVpaMXI0UktvWi9RQ215MEZXaWIvSkVQMXdGM1JVM2c0OFhHeG5WZXZKQnBH?=
 =?utf-8?B?Zlp6WExvaFZxaytVazVvWlh4SHNJaVpJVDdXVVh1UzVhQzE0c1oxRlhIbnZZ?=
 =?utf-8?B?cGtTdDhuc1JGcW1mdkpQalV2UDN1VmV2VUxGTUxkK3NqRWFyQklzVkp3cFFQ?=
 =?utf-8?B?Qm9PZlRLenFPVUlQRFplbmo4WVlVdVFySkNTYjJ1Y3JmQUJ0UkFrMnFYZGV0?=
 =?utf-8?B?eVJtNU5zV29Fb2haa3REdE5LQlV0RElKQXRxV0FqKy9vWEszUElUMFJocEtV?=
 =?utf-8?B?eC9GNjFCdWcwVC8zMk15ZW9wcW9MT2xmU3VUK25VWW9TSzNOc1pmbkdDMnB4?=
 =?utf-8?B?OFJ5dm1LakhxeWJPTnBlanlFU2k4eFlpTE1EQWdUZEUxc0RqSEFUTThtYXR0?=
 =?utf-8?B?eFpwR0FwRUxvcEprZ0VaMTg4TVFCazlxUlJiR2dCTEZXTi83bElEOVZwMWE4?=
 =?utf-8?B?OW9nZjlvYlJFTVZyM2p0R2ZsejNjcUtmcm1RUW5vTmlIRitTRG9UZ2RSdmNa?=
 =?utf-8?B?cXRjZGFFM0EwdTN0WFVPL2tSNE9XY3JYZ2JNb2hQNnhkZzFRSHBKVTkxTTFy?=
 =?utf-8?B?YVlyQ1d2TzQ0SUxOWWlXLy9BNitkZkY0N0ZhY1ZqeU1ucFZ2U201QkZOWGVw?=
 =?utf-8?B?eVNKSzRocnF0bXlvTC9kYXEwUFBEeDU2UGwvbzk1eEhaM04xQ01HL2U1ZU9L?=
 =?utf-8?B?aEUyZ1FxR0xwYlVlSmMzLytSTm15NkhQVHIwMUd1cmlqVXliQ2NFYkV1MWhZ?=
 =?utf-8?B?U2pGYVNnanREL1BQdXE2alBPb3V2c3lUU2RaT29QY0RIak9DK0FXUmUyWTEy?=
 =?utf-8?B?eUVlWEUwcU9hZW96dW1jL1ZLajdNbTNGQ2NRUjQxMnBKNjFWclcwTlFVaWx3?=
 =?utf-8?B?TUlWbEduNWhBRlVSRlhpcWNVeXNyQmUvQnIraEVDYmhQeFVjc1RONkFad3Rv?=
 =?utf-8?B?eGdyVWNzVzJqeDNvaDB1QnU3WE14WHNiTkhZd3QxeG5FN08zUjNPNGhJdlBr?=
 =?utf-8?B?Qjd0VzNsZk1FZHdSS1FiVHR3b2d4SnJDOXM2RGxiT2h0UVUwNkd6UG14V2do?=
 =?utf-8?B?QnY3OUh0cFNJY01GQmlBL1h6ZSswUXovYkNZYmhEaGtELzdQckFoUWJocGNu?=
 =?utf-8?B?ZC9xZ04yYktuR2VGeGM2U0FpZ0JDQmxINXVFTE80V3hlM0VUYXdrd0g3OGJZ?=
 =?utf-8?B?UU9VTGloT0pRd04zT2lYNmhXSFBnRWJMT1ZobVNCcVJsRW56UVZQSWJQb25V?=
 =?utf-8?B?QWxvZFUvV3hwTU4rbURmTkVqOFhCTzVZUE9YandnWk43WXBYQ0d5T3Y0M1RJ?=
 =?utf-8?B?Q3h4b29sbER6Z043T2lQb0xIcmxZWHgvYXRkaXNKdG82akVIYzkxT1VZRXNP?=
 =?utf-8?B?TElFbDdUcHdQQzc2S3VKcFQ2VU14NXdxemVCVHBOZWNzemNNSlJPTFFSZE5V?=
 =?utf-8?Q?5t8U0s+b2vYh/SHs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a808eb-34df-41dd-0123-08da2f1c8aa4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:46.0440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOyktMlor/AJmqGrPBWa1e8A2KZwnf87cStzvQydr5iTKKMRiqnzL+Ii+i5/7lHfpK66mZrhLu4nllL0NjDXgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060023
X-Proofpoint-GUID: Z4pZBVZFvryjJaLPeliXNxEC6mJfNYU8
X-Proofpoint-ORIG-GUID: Z4pZBVZFvryjJaLPeliXNxEC6mJfNYU8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost_vdpa_one_time_request() branch in
vhost_vdpa_set_backend_cap() incorrectly sends down
ioctls on vhost_dev with non-zero index. This may
end up with multiple VHOST_SET_BACKEND_FEATURES
ioctl calls sent down on the vhost-vdpa fd that is
shared between all these vhost_dev's.

To fix it, send down ioctl only once via the first
vhost_dev with index 0. For more readibility of
code, vhost_vdpa_one_time_request() is renamed to
vhost_vdpa_first_dev() with polarity flipped.
This call is only applicable to the request that
performs operation before setting up queues, and
usually at the beginning of operation. Document
the requirement for it in place.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8adf7c0..fd1268e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -366,11 +366,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
                                     v->iova_range.last);
 }
 
-static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+/*
+ * The use of this function is for requests that only need to be
+ * applied once. Typically such request occurs at the beginning 
+ * of operation, and before setting up queues. It should not be
+ * used for request that performs operation until all queues are
+ * set, which would need to check dev->vq_index_end instead.
+ */
+static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    return v->index != 0;
+    return v->index == 0;
 }
 
 static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
@@ -451,7 +458,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 
     vhost_vdpa_get_iova_range(v);
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -594,7 +601,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -623,7 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     struct vhost_vdpa *v = dev->opaque;
     int ret;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -665,7 +672,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (vhost_vdpa_first_dev(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
@@ -1118,7 +1125,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
     struct vhost_vdpa *v = dev->opaque;
-    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
+    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -1240,7 +1247,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
-- 
1.8.3.1



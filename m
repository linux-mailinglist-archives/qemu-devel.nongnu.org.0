Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6644C507C61
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:04:44 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngvxj-0003Nr-6R
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvwd-0002XP-L4
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:03:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvwa-00069Y-AF
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:03:34 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHVvG5019815; 
 Tue, 19 Apr 2022 20:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=QA8CDNtqsi2Kj1CND27v27ykqUInHgLR1Y11TMdJEyU=;
 b=ucJgYOxVcVGLEHMoinJO0UtszJBvqK9BFiM/TN5HmXYqYFn0okIJVMZxQUvvIKbzBvsA
 5kVkjlFFWIxKL16Jy7RzuKV/0lKh6t0EmLrrjLR2oDqrdpxaotkdjyP1uV3to0qdEKUO
 0ovmPsrCCAq1gnb5uhIp+Zso3VTAWrdXotss80bwlOFpbd6YqCoC7KCFfXoPvpp9zbcl
 ZkVIHmWNx3cNWajUzjkr4lMkRgocKxWsQvkIdGyMUW8b06xCmYIgOlLQFEvqjBkGpb7u
 1qx+9/tlFjJlPKj2vHTcuNVYRbs/7x/avms3B4Mq5Trj7pIpKH1hOBAH0QA4F8B2xIsy wg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1793e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:02 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZqfS016962; Tue, 19 Apr 2022 20:45:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88spma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6jtYhV4gNMQZMts1147VN/ODrWbJMXpbFL+s+HhHXIPhioU1jSaSSKHuxrjJ10gfDXZoHVrIg+iJOfxTwlmdT+8ZXVt9WwYwX3I1ZBnCUKu3zcmyV7LcSXE3jhZ8Dr3qVt/d5l1V0sutsPDNXzVhhu+8uDWoYu4gW8R9qzu9dC7AF3jmnTaeuYg1DAz/Yluf6GCnyiLCZXaGyC6goEF6jkP5uZbA0unNANY5noUk5VfhSGLOXKFP0sEyo25S4AZjPOy2mzTQNgpFCXu1F0g2u3q5SPqif0pJoLvZ/tEHPvPNCSVZQT1GR2a+NE4kvc7v8q2ziP5Nj7sQ/oPPb+Z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA8CDNtqsi2Kj1CND27v27ykqUInHgLR1Y11TMdJEyU=;
 b=VmZ3lBqxPqAO043936HsmXAt7c0jb+EIVCTf6jUdxWW4gDQvkIZFgKHmsQvFnPSjxALoII+944wGAkETBUTsdO6t8fENmp7kAt/Js7sBlooHzufDdEFhoG8nfi3AWbaDqAuqp6yxib4Hm3po49I74TJylmTWP9wv71dU2aIRZ5xRr4nE9fNp0nXge6sVyb3NZHxLVHDbZ9YeJZDQKXYsX4utjj1GH19yFALQ3WFkAo1oFWzbY+MwTcTdHvbWUeHO1XrBminvFwPMdJRXfQBLpw3aPq/NNElWFR5cgxP5AifbUbER8yUrxRV3TtDo91B5RFW/6BU1MqoX8Fw5WK+AQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA8CDNtqsi2Kj1CND27v27ykqUInHgLR1Y11TMdJEyU=;
 b=DpNZ8KrEu71nGhyDjAi7lz3QrwtkVOXCOfTf0eQy/tlp/mbfaeXx6Rgh2oJz6TeYQhTipG2MY9Jfs4TKOixTuDaYxrWd2Ht4h/NBcJLNVPSbeyEq1QFKNxEroJ7A4kG669epUrtHMEj7eQTqPBl7A8ELVGOTKMSeOsJStbH2mDE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:58 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:58 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/17] vfio-user: define vfio-user-server object
Date: Tue, 19 Apr 2022 16:44:12 -0400
Message-Id: <0ed6764870ae871ce03409f45c8e7dbe3bb31ba0.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75638c87-6b87-4b1c-bcfb-08da224577af
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32909A7CCCB41EEB9377799890F29@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITuHwpUbYYZcwG6GbfSKLkWDOC8LzoT2nuZKglVZ+nZFYhD6IMXhEqEHl+Kl8RKMAMC+h4FOnXXG5GRWG9Hwc3CgMgpOKswYbIe+tYTfoch3RuuA9yr3NriSXZCcT4/aQfW00Oy9N2v2rpXzD/+MAGT3K1R1b+nJd5wYpJ6ntQC5Ob7KW53IVzibc1ZTUT42qVtAm0VGkGAqxHCINmbXLqn8RfSk+BOtUeyqRkhnY+uXhNAWj6j3cU+461tI5iPyWEvZGwA/QIw+rOvunqamUWSwr+S2kgRt65Sp2Fn6eSOl9ZH7CqVpDgSIOQMt9LyHl5w66YNjD5vK4WbNe+MbXXXfvTve7YVLcI6gRlwHxYmhhqXX7oBYmVDGtZ2TFsd3TIp5x6n06FoVzU+qzNqt9BWullBeNI+UufoGS08T293lVuvRQc4vIUwVA6OkmrvbiJJp0z0u6VGZ2eDe6/YTeIwDiahAOdXmozIDD5DpzkL+N+MzV7j2gRRBRSw+ivNdYSy0aJm11iuhw10J72kKDIjxCNTJ0Jk2oRcv8JfYKNmHw3VbnBuS3nu9zPM6nn4szUTkzyLPnCVcJzWN3/nNZrxhYkuAt4Vz/yzqSo78/ZpoTSrlCjCM8Vlt0RXbXkxJdOPWoOb9dh9gKg7cBn6rqV6RcBsUt2qIRrHQrPq3/AjxugSw37QglBURCZuLKJwgyHw3C3FZGF0HVhmIMqq/8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(8936002)(186003)(83380400001)(38100700002)(7416002)(6916009)(2616005)(107886003)(6486002)(36756003)(66946007)(8676002)(66476007)(66556008)(4326008)(52116002)(30864003)(6512007)(86362001)(508600001)(38350700002)(5660300002)(26005)(316002)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTBXSGRPVk1ZRzFodjdnNndkSnZBaHBYMnNMUis0V2Y2MnF0N0dhN3NvRkNT?=
 =?utf-8?B?ckt6WjhBSGVPWHhtTEM2c1MvWG1GUkhQeGNNU3N0am9mL2gvRGdkckh0SFFL?=
 =?utf-8?B?NjdOSXV4Z3hUcUQrdlZTU3ZiSEtuc2pnd1dnUkJjNzNpeXA1WVZuajgvekwr?=
 =?utf-8?B?SzRtSlpZSnVURWJEMEJMM0JpZ1FWdHJndE80MGxzRTVUY3JiMFZYaTUwcnZJ?=
 =?utf-8?B?TTdlT0F2TVhKb3F2SEEzZ3pPMTNtdVNNM2lsbEsyQTF5L21oaTNUZnc0TVY5?=
 =?utf-8?B?RFFJbVRNR0Izd1RtTXpnZWZ3RGpkK3E1ODVCTXJRNE1OSDU1cmFJSkJhcEVm?=
 =?utf-8?B?TWNOSTRpak5XL3hxTG0yRDJ5TEprT0RnR2ZsMDU3UHVFT0Uza1VJK01SSnBC?=
 =?utf-8?B?M3lnU1dpdjBHdG1nTXJ5SGRyd1l5WUNNVlpKMjZ5ZlpucFY5M3R1M21UM3A0?=
 =?utf-8?B?ajVoYUcySXUvbUxlRk9oV1F6MjhSUjZPRGRGckliZC84NFRRUHpocGwwblBT?=
 =?utf-8?B?VXcydEJMc2JDZVE4STlBZ1BYK3g5ZkFrQ3RGR0lybGYyb0hNekN4TlZodlBQ?=
 =?utf-8?B?QitKZFVYVkI3bklvZmRHaDRicTNncVFVWUUycFdXcWNRZnlwQ3lWM2tVWko2?=
 =?utf-8?B?Nmh6dy8rcldkYjgxZUYvQ2Y2U3JudGpwM01ma21HMTBXQlFCcWZyTHljQm1n?=
 =?utf-8?B?dXFqQ1hkcC9lWlVvVXdVVVBSRGEyTDlXMU9PWk41R3V5ZWVoWjlXczJJb2l2?=
 =?utf-8?B?MnozZDIrSmxVZGdBTWViMTVMVnVnS1NXQ3hmUXNzQVdiOUhTNXcvWXRYYlZo?=
 =?utf-8?B?bHoveFR5bXExU3Y0eXNGT3MzSkRXV2wyWTNhSHRDS3ZkVldLdDZwUGlMSm9x?=
 =?utf-8?B?SWFySmMxcnJnVS95MWJxcWROczVFYURYcVFLOVA0dHpqZ1lPcWR4VHJZS0dD?=
 =?utf-8?B?ak42NGgyZktJQUR6NzI2VUIzMmhxdnpWclRYb3h3aTIxdk5hZW1uWkpGN3BJ?=
 =?utf-8?B?VGI2ODU4L2M2Z3JiclB4alBNNG1UVjJ6WThhalNVdnNFaTVBaG1yUGFlbnA0?=
 =?utf-8?B?RVpxL1hRRlRiNjZlampEVE92dWRKbGMxVDB5UmpNZkJjdno4QUxYZXpjSEZo?=
 =?utf-8?B?S2Rsa1ZYN0N2Z0dXL3phMXhQUWltWFFHZHlmME9uM1hUeWprdk1jZmQ0N0kz?=
 =?utf-8?B?VmtZcS9xMUlUWFlFZ0h0MnVTQzdOYW83Y254bDJQSlMydXNLRk5RZ21vaFNY?=
 =?utf-8?B?bGY4Um1oV0NTNUVoY01ONHQxclE2UU1GbEpHaDlaYkt1ejZZTUxFci9NM0p6?=
 =?utf-8?B?VU9oSXBPZm4ycy81UWhSR0w4TTVzQmx5L1Q3ZzluVS9NSTdQSGRHc2lXRFdY?=
 =?utf-8?B?ZGpGQ0c0M1Z1QkVaR2o2bU1HcmRLUUsxQmlpL2IxSEd3eWhOM0JwbWdTZVEw?=
 =?utf-8?B?MmVQSTFGMFJuYkxHK085bnVnSVpZaS9LWXJYVERuL1gwNTUwOUliRDhiclJX?=
 =?utf-8?B?Ti9kR0tvZWUva25URHlDT3FPRm1qZ3V0eEhMNU5VUytyajY2cDdiZEJlZElF?=
 =?utf-8?B?UVB0cjQvdEUzTkxNaHVLYm5oUy9YQm9udW8ySWJjZTRZV1QvcWNJMTNtYTM0?=
 =?utf-8?B?WW5vLy9YK3hPbWNGYzBzRDlLejJEZ1BxS3h5c2FRazN0cTNvQjBGTTFqSHRY?=
 =?utf-8?B?eGlBa21lTTNxaTJMYkRrMFZobm9qWWhUdWIxUXNnbmJhakE1RTZybnJLL1Q5?=
 =?utf-8?B?ZG9pSkZ0bThZNzFrUUlyNFM2b2o3dCtmSG1nTjY0YkRIOHRQazd2eFgyZnow?=
 =?utf-8?B?Nzd6NDlFUXNQaXNPKzNQdGtoQ1grbXlzWnVWMWJyS2JleExZT1EwdE10SEJV?=
 =?utf-8?B?MmNCK2YvZE9YODRMM0JSVnpWN0JBZ3RocE1CY3ZaMHFDcklXcURMRGJvMVJV?=
 =?utf-8?B?TGpoWENlVS83YmRpbjlMcndrUGFYT2VqTmtEc0R4NGJSSHVueVlGSVFwNlJZ?=
 =?utf-8?B?MjdZRWlNNlVzbHVMRFRlMHFlRHpnRUtYS0ZWVHlzS01PUyttdkVScnBHNWJ5?=
 =?utf-8?B?QnFTMTYxdEVRQ01kMVJSY05HZW9mWWdKOWlyN2JITDY5UTBnNFNmV3Jiemgx?=
 =?utf-8?B?K0xjalFQNmwvd21zZzArR2lLRjJpMEdjR0FqYTNMYWVuRGtPcFMvWm85aVJi?=
 =?utf-8?B?c2dyUnNZYWk1ZjNxWmxjbm1VTVFzdmJtYUdMVnlJMGVBSS9TeVVUUzEzMXpF?=
 =?utf-8?B?VFBnanZMU3c3NnVDU3ZVWW9ES0VDcFN5OFlkSTRRTVFraDM4OFNsVjdDODAr?=
 =?utf-8?B?QlpreEw4VVE5d0NiTi92NldoSHRXQWFqZ0tEblR5Ym5RMlUrVGk5QT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75638c87-6b87-4b1c-bcfb-08da224577af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:58.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knpFZUS8vCrvSvU+PXuDD2W4mDfB8JuN4KGb47tPuP0C3rnCy1wHeIeDYeTkG7MPIf9R8SDkyfNLs8bR8FVijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: 4R4mcWBjELf4Yzyg28ugpDFpMEnPqIAj
X-Proofpoint-GUID: 4R4mcWBjELf4Yzyg28ugpDFpMEnPqIAj
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   2 +
 hw/remote/machine.c         |  27 +++++
 hw/remote/vfio-user-obj.c   | 211 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 263 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..e7b1758a11 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -703,6 +703,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfiouser library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -842,7 +856,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -905,7 +920,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 8d0fa98d33..ac32fda387 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -24,6 +24,8 @@ struct RemoteMachineState {
     RemoteIOHubState iohub;
 
     bool vfio_user;
+
+    bool auto_shutdown;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a9a75e170f..ed91659794 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -78,6 +78,28 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
     s->vfio_user = value;
 }
 
+static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->auto_shutdown;
+}
+
+static void remote_machine_set_auto_shutdown(Object *obj, bool value,
+                                             Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = value;
+}
+
+static void remote_machine_instance_init(Object *obj)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = true;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -91,12 +113,17 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
                                    remote_machine_set_vfio_user);
+
+    object_class_property_add_bool(oc, "auto-shutdown",
+                                   remote_machine_get_auto_shutdown,
+                                   remote_machine_set_auto_shutdown);
 }
 
 static const TypeInfo remote_machine = {
     .name = TYPE_REMOTE_MACHINE,
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
+    .instance_init = remote_machine_instance_init,
     .class_init = remote_machine_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..c4d59b4d9d
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,211 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on,auto-shutdown=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
+    {                                                                     \
+        if (vfu_object_auto_shutdown()) {                                 \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
+        } else {                                                          \
+            error_report((fmt), ## __VA_ARGS__);                          \
+        }                                                                 \
+    }                                                                     \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static bool vfu_object_auto_shutdown(void)
+{
+    bool auto_shutdown = true;
+    Error *local_err = NULL;
+
+    if (!current_machine) {
+        return auto_shutdown;
+    }
+
+    auto_shutdown = object_property_get_bool(OBJECT(current_machine),
+                                             "auto-shutdown",
+                                             &local_err);
+
+    /*
+     * local_err would be set if no such property exists - safe to ignore.
+     * Unlikely scenario as auto-shutdown is always defined for
+     * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
+     * TYPE_REMOTE_MACHINE
+     */
+    if (local_err) {
+        auto_shutdown = true;
+        error_free(local_err);
+    }
+
+    return auto_shutdown;
+}
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && vfu_object_auto_shutdown()) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index dca81a2d22..37afdecc61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3598,6 +3598,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1



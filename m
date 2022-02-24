Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842E4C343E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:59:01 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIOK-0002FI-2J
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNIL0-0007PV-6a
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:55:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNIKu-000420-IJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:55:32 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OFduWC027379; 
 Thu, 24 Feb 2022 17:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9FrN+G2d0upeVngYU12+N0/worJ1on1ohcCI4BZ9/qo=;
 b=ENaMj4eJBz+WdAw7tdgQjiiy6W+bWbP2B5TEiGQ77fxWiCZa1DrqoAeqAZs8wewV6PO1
 pgmZbi7buYzMaQ1VeKUIk8orQ0FOk+Q4Nf4hc15LWjaBxrmUYAWQ/8t2tiRdTOKwnVEr
 jodKDaeqIEhTHbNxMQnrDRxCoB9NjyUaUpkS7vhCCCRCh4PQNDILBm9WqhmQI4ifPWxm
 NDaT/h0WKO4QvV+hnJD3setmHd6h+JVxr9m1UXXqgosu90AAbnbkSw4h6hi0LnUtI2Ze
 rSvQlvdjFZvv0Nm4JnxItBIZ4JAW4fnT2scila3slVECu6hfc5ka3yeTi30LTF6NW+p6 jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar7qyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 17:55:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OHt9O0125849;
 Thu, 24 Feb 2022 17:55:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by userp3030.oracle.com with ESMTP id 3eannxukwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 17:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4VpYADhCjQKTL/Z3Gb5KGKV9hP9I7TIqz6ZODp4PyAxhq6jNmGmeEu0/jLnUAJrnrtfm+Ywf8/Iyy6oPafo/7//kLIZgz3+rz9L7m8LMyCnnVgd1C78yqt91jBx/S8yQwZmIquCIFlnTpe1gG9uqauUA2NBAicQracvbacPLZAKBfZr3IYDhp5gCk774TEekXSkjq2Y5tLWGi5ubFYe2Nji1LpavDaEW7sdaXH5gzM6BQWy0wamlP4G9iCHPA3S4cZJgnGPmUwt8oaG0LA4mBVSOWUg7AVUEPTrO1qbc3w3Ye51TBQKltMnW6+YMgV9ieabOxOwn3S/7P1+AQEV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FrN+G2d0upeVngYU12+N0/worJ1on1ohcCI4BZ9/qo=;
 b=cA1CaWqMufWP7csLM78ATtWFX+Hens2tZz6QMTZcBnPPwxPgR9RqNq2HptKH8Pm1fnSx/eWNlJ3b40/7mojv/AhhHzNTr7Vz63V8d+y0k/m2E2Eo2mRzzEoT/SwJxid6VUhzmpXQGL+zW0IF127sfaNYdx+ePUHPM+niJ1p7ZpdzE+h6LEDIIXqITzad9COoL/obbwOGNEOgr8cB5eKh5fghd3ksyex2KhvJJ4NjIxFV9FzUccuTZO8TqeBvhiGNli85Dr7uPe5X38tdawwxbENHIUzjPbllk6J+K8mHEqSNUGyYzWppOErxD7dobDEB64t47+nSeKu9bM2VJtihBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FrN+G2d0upeVngYU12+N0/worJ1on1ohcCI4BZ9/qo=;
 b=wQQeG72ytmm96wngArYeck8s0omqavUgTYeCrtmL1XBlmlJMhPIqSitiRAmmc951lECcDYW8KlLL4IL5Buve+gJZ1USEJtBcdFAC3dEAb21UNuyPsvdXmxj2vHYjYK+WbM0FVaqWV1bO1rM4+q/UjRZPCoAJFEwJjaC3GlaUjH4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY4PR10MB1606.namprd10.prod.outlook.com (2603:10b6:910:b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 17:55:07 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 17:55:07 +0000
Message-ID: <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
Date: Thu, 24 Feb 2022 17:54:58 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224122146-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0121.eurprd07.prod.outlook.com
 (2603:10a6:207:7::31) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9b9778f-db94-4c4f-b5f7-08d9f7becb40
X-MS-TrafficTypeDiagnostic: CY4PR10MB1606:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1606731A560EBF3982469502BB3D9@CY4PR10MB1606.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRSQo4j/WJnfOlYgR7QAeikoK+9pg17fp1FtWOeBXytDmlBYZrvR+neVkA7oRVD9lnpJNUeBPREjb7zG/hmqjHV3uE3hgtqiPBQZpzxc4sjd8kfwL1mtaIlMPu1/Yq935LthI0Q2JP1nuo5eBL1WRdUQoivr8YfBg0UYD5z3WksiFuXV3HLzFCwsFb//4koLiSVwRZYuhhekR83/Srs1A4myICh401wmHWF6TnMYh4WTjGcrxknbJ3hQgZjRLQftNyPaC5kpA57bKK5+iA0tCQCF3P0T334+WMZPaYJgXZw5OvG+VwrbCV/Lvet2fSD5ZAYBP08og7VRYPw6YAOCFyzkgGXVZGwxm64Gw1/XCOIF8kQsBLjfCnunAlOh1JPAyjaBGbne7c7t/cjV6Sb3PxcoVNRL0t/hN2zT9JaAOBi+CWEmW331kHyzMqARv7YcU052r1XcXb9EeUKRV4/FDtZVst5CjXk+et9HDUlfiZCCcuFtIuZaGi9g9F1PvbO22W08YBzKggV1MGdBBDe87PE6io5zIzINBG//ycEB+FHPE0Git+icikPfrZeerKvHbnjvVtJ/S+O/Se+rGesMuSdhgPJrMzD134dUkKlfgzd/0owYzEwCl5mwwrxw+4f0NWJVfUSFo82DLkZ6SPEuetf05AmnINWOxBLPyGtQ4k620+2x5TgTFJFe/zsoAZ5SZWwh5oktImD1zceXIlLYRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(83380400001)(2616005)(6666004)(26005)(186003)(53546011)(6506007)(6512007)(31696002)(5660300002)(31686004)(54906003)(36756003)(2906002)(7416002)(6916009)(86362001)(66946007)(66556008)(66476007)(8676002)(4326008)(8936002)(38100700002)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1cwZGk2eDFSSHpEL2gvMmxiclVxcmtHNGkzQ3pxcEtGZ1hteHliVEY5dDYy?=
 =?utf-8?B?Ump3MndncmV4bExhMGtkd1lOTzQ1Y3V3WHVjMktsN0N2Zlk5QmMxYXVwUkFI?=
 =?utf-8?B?VDl0Ukx4cHdJbkNwcUtkTWZBMURvOEdtWno4T3BRL2hvWnpBRDd2QjJvbHhB?=
 =?utf-8?B?blFOOG9RTWJBUDdFb2p0dnFMdXJMbmY2TWxqNW9GRnpUMElrdmJoYmRJblBs?=
 =?utf-8?B?RG4wKzFCQVdsZUV0S2JzS0pVbXFneUo3Mk52NUI2MFoxZTNwZnBNVndwR0d3?=
 =?utf-8?B?dVhnZFh5K0RsbGN0SkdTVGVFbDBFcjVENzJPeWhTOEFpUWl0NlZkVFF0TzZS?=
 =?utf-8?B?ZlNPQ1h3d0NZdzJsbllhQ0FSMU9yUlpPSUtkMk1wNGZMWUpHZ2Q3SlVibmJO?=
 =?utf-8?B?NTloVVBGQTRXbzJXR0QxRnFzeVNKOFlBczVyeXJmdThuVjVQMlZSOE52WXdH?=
 =?utf-8?B?YllWaUNkbFFYWHNza2gvMU9yYTJ0RDhOTGc4a01CcmNBV0w5OWFjbHBONndT?=
 =?utf-8?B?TDAwMndaRzlkbzlMUWIxdWE5Vm5vTEdPamRWeWNsRWJZK05UVDNUaEFmTTg1?=
 =?utf-8?B?aExPUFV6Uk9LY0RZbGNIeFJJNVFPRlNuRW94bWF1cW02STVocjFxRUlkV3Qz?=
 =?utf-8?B?Zmx5ZnowMDRZVmp0Uys1aXVmVmJJWTA3UUV1Q29qNE92RjFSUUhFM3AzYncx?=
 =?utf-8?B?dkF0TUppTU1MUjBKV3JCWVhCcE8vNWx2TXRLTExSZnJGNTZUdFBCUExLZlNS?=
 =?utf-8?B?cGFPbmxEaE80cGF6N29OUTMwU09XenFVT3hXRG95UkFFeU5QSmlkbnpobGN2?=
 =?utf-8?B?Sys2Mk56MlNjU3VnejdvSHJNZjJubmdPU3JQazBQWmdrMXlFWGRQSFhRZVlC?=
 =?utf-8?B?a2RrcFlmUHZRekNFNzZWdnNyckZ5QXZMU0VBT013dzIvdUw4S0JUSzMxeExO?=
 =?utf-8?B?dCs5Mmg3dUd3MmxHUVYxTE9FUENKa2pxYjZXc2VPWG9EM2k3ZWNEb1F0SXhu?=
 =?utf-8?B?T1ZobEs1bG03T01SYWtvM0w2SXZtK0J2T09hTUFqTXdKMHJNYWd1QU05QlJE?=
 =?utf-8?B?ZE9RWWlKTzJwWUNqQ0trYTE2aUFkdVdscGhrY2QxNDd6VmlNbnVvZkxrWDZ4?=
 =?utf-8?B?UU5zem9tTEZwU3p0VC90UGdidnNLZzFuaElvQXJFUEI0T0NLK1pWa3RyK3Vy?=
 =?utf-8?B?VUFaV3U5THNRUnloZlRwRm9wWUJ1QmdORWV2bjdkY1VrZE5qcmRjRzd5czZO?=
 =?utf-8?B?QzVjeWN3RVVGVmZmNHlpVm1QUlhtSWRGenMzZ2V5ck1HK2pvWUVXdFVFeVZQ?=
 =?utf-8?B?YlpYSDR5WTdmWXlTdGVMSlppRU5RdU5rMUx2NEFzNmFZbVVESU5aY0ZXVGhj?=
 =?utf-8?B?Mm02OU5XaHZUbmdHYkdLdnVzUHdka1RXNE5DZFpzQkY4cHV1aUkzMW5EOUtt?=
 =?utf-8?B?NWRtUU5lQzIxZWJJazVZNTIrZ0d6YUs2MnJSd2JKZjVqQWs0THlnSWhxQnVL?=
 =?utf-8?B?cTdZRkJYekltRDVHRjVxM3lZRzZiOVNXWENtYk12VGM3SStvWXQrRHFTNWZ2?=
 =?utf-8?B?Ym1Td0RwZ0x2VjhVU0NybnlzbExJRzdSWlB4M0U1aVNKOUJuN2g5LzUwMFFU?=
 =?utf-8?B?Y3pJYVRIQTI1OFM3QXJIemlxVkwzVWsxbGtWMVBzOHlUUWt3STZHRDl2bTQz?=
 =?utf-8?B?S3FRRCs5bHBDRHB3N1BuSjhrMUZRODB1aHZweTJMMVovbnI4YVZEMWM4WkJN?=
 =?utf-8?B?K041cmNFZjlmam8rclk2bXFDTk5NK0dHYmh5SjdMWFRKRUFHQXlBRlplQjcw?=
 =?utf-8?B?RG50ajY3ZVdodHRGNTQvMEFCSHdIRmNMUUNBOEdIczlOeTNQZ2pQOVhrNmt4?=
 =?utf-8?B?Qm1uTTdTemljUXRTanlFWjhteTdpdzNWWUFnMXU1Vld5cE5XU1o1ZEVubGgz?=
 =?utf-8?B?Yjd2aFl2VjdweUczZUlML0pYT0QvZDgxeFdWZWg2SlBWQWlhc2xVNEg3TWVz?=
 =?utf-8?B?VHBWSFFBN0RBNWpKTTMzZHZseE9waVVNQnlEZDVoQ3QranljQ1MwdzNFaGZm?=
 =?utf-8?B?NzZMTjhLWktOOU1KZ3VGeXhjbThCNmVGUjRHUkxKd2Y4VHFWL2pHZGF4L2xw?=
 =?utf-8?B?bldCZGIwS1cvNjFSOVQycEhGKzIybVZEYVh0ejd5M0RMSSt2eXVaYmdXRjVy?=
 =?utf-8?B?cy9QdzdjTmc2VTh2VkY4YklIWi90RUREWU1QRUJWaEJlVjJ6dzdzWFl6L0Ur?=
 =?utf-8?Q?kBE7YwdOp/pZRyTF5K9s7RYW6nKXKG3rvwu8ZkWBSQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b9778f-db94-4c4f-b5f7-08d9f7becb40
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:55:07.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 490UC7gElfnm1NrhoITb+ATacMJPudpso3jQQDSd3Vv2p/t/cciP2FFAK5Q1oDJoXLuufKiXM76dKDemf277sgKPTKDEKMPUdswyqkq3yx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1606
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240101
X-Proofpoint-GUID: oLyJMIgpqMSjfUFbUXNKROT7ku2XeIOL
X-Proofpoint-ORIG-GUID: oLyJMIgpqMSjfUFbUXNKROT7ku2XeIOL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 17:23, Michael S. Tsirkin wrote:
> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
>> On 2/23/22 23:35, Joao Martins wrote:
>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>> +                                          uint64_t pci_hole64_size)
>>>>> +{
>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>> +    uint32_t eax, vendor[3];
>>>>> +
>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>> +        return;
>>>>> +    }
>>>>
>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>> It's really about what we present to the guest though,
>>>> isn't it?
>>>
>>> It was the easier catch all to use cpuid without going into
>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>> for systems with an IOMMU present.
>>>
>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>
>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>> even worth checking the range exists in:
>>>
>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>
>>> (Also that sysfs ABI is >= 4.11 only)
>>
>> Here's what I have staged in local tree, to address your comment.
>>
>> Naturally the first chunk is what's affected by this patch the rest is a
>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>> all the tests and what not.
>>
>> I am not entirely sure this is the right place to put such a helper, open
>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>> of the file's style.
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index a9be5d33a291..2ea4430d5dcc 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>                                            uint64_t pci_hole64_size)
>>  {
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>> -    uint32_t eax, vendor[3];
>>
>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>> -    if (!IS_AMD_VENDOR(vendor)) {
>> +    if (!qemu_amd_iommu_is_present()) {
>>          return;
>>      }
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 7bcce3bceb0f..eb4ea071ecec 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
>>   */
>>  size_t qemu_get_host_physmem(void);
>>
>> +/**
>> + * qemu_amd_iommu_is_present:
>> + *
>> + * Operating system agnostic way of querying if an AMD IOMMU
>> + * is present.
>> + *
>> + */
>> +bool qemu_amd_iommu_is_present(void);
>> +
>>  /*
>>   * Toggle write/execute on the pages marked MAP_JIT
>>   * for the current thread.
>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>> index f2be7321c59f..54cef21217c4 100644
>> --- a/util/oslib-posix.c
>> +++ b/util/oslib-posix.c
>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
>>  #endif
>>      return 0;
>>  }
>> +
>> +bool qemu_amd_iommu_is_present(void)
>> +{
>> +    bool found = false;
>> +#ifdef CONFIG_LINUX
>> +    struct dirent *entry;
>> +    char *path;
>> +    DIR *dir;
>> +
>> +    path = g_strdup_printf("/sys/class/iommu");
>> +    dir = opendir(path);
>> +    if (!dir) {
>> +        g_free(path);
>> +        return found;
>> +    }
>> +
>> +    do {
>> +            entry = readdir(dir);
>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
>> +                found = true;
>> +                break;
>> +            }
>> +    } while (entry);
>> +
>> +    g_free(path);
>> +    closedir(dir);
>> +#endif
>> +    return found;
>> +}
> 
> why are we checking whether an AMD IOMMU is present
> on the host? 
> Isn't what we care about whether it's
> present in the VM? What we are reserving after all
> is a range of GPAs, not actual host PA's ...
> 
Right.

But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
and so we need to not map that portion of address space entirely
and use some other portion of the GPA-space. This has to
do with host IOMMU which is where the DMA mapping of guest PA takes
place. So, if you do not have an host IOMMU, you can't
service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
don't need this problem.

Whether one uses a guest IOMMU or not does not affect the result,
it would be more of a case of mimicking real hardware not fixing
the issue of this series.


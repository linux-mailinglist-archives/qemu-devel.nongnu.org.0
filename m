Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020E4AD518
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:37:31 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMwD-0000I2-U4
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:37:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpp-0001uD-Vv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpk-0001vX-Sw
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186sIuw007544; 
 Tue, 8 Feb 2022 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iBM/s0NYQU/Tz6e/qw94tUQAQt2gq4sv8WKe7gDuVmI=;
 b=jGJPpJpJDXh84w0Bi0ukzGY4roJwDyq1Mi0BaSMdQczecIyb1RzYZwgPgvo2ZXf6Ic6t
 lP5RYIe76qpMlUXu83KDVRD7mUhSiriqZfv6I6vi/D0hew4kg/9r4LUk4zL73Rrh0STq
 R8yj2BGhb/VAiK7cmNDXOjqKSwBzj2wSAZCh540HEfcN4OevCAH2ivmYVhCMxAoa5mHc
 xtEzHJiuedSIFCuEwOqBq2/H+4ATSK69frXvC6xuRUX7HN29OiZxAZ61GDFPl05e3uAd
 /50OH99kAztNe/u4bTt9Ak4snkrWgdL0KSXowbIuNVeEnlKg/qni4JJNo0vCVwL/oMZj Ow== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368tsxcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYs093365;
 Tue, 8 Feb 2022 07:22:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJHnTlRD49C2fh5ICrZiLYjwCGfo7rikrv+a3C5XaybxPRDCRHeiKDD9fFd64aVuZ0qwBNfuwj8o19eZ1IqhhBpTn22OylEq9CSgnLPjS/YJZpP0wiaIwgxqqmW4HWnwhTJodLD5fW1PAuFxkqJE3Fhau1446h4qAHavUQxJj1/R38Aggxt44a5cH3FDSzxYNgi4RY4UixvKqVJQr9LqO96C03K4NdvF/bQLfR4kD56cGHmSnc/N3YPLACsdayruKvmlEbaQ1ON8AlKqVd4grMPP10H2utaXd5NHH/qPSYtoa6RksKhSvFQxCGW/7I8x2yMuAmckos984hJ0LHrX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBM/s0NYQU/Tz6e/qw94tUQAQt2gq4sv8WKe7gDuVmI=;
 b=kCVGb2+vRRyNqR/lEgL/iB9a8GnipDkMsN56ll8uHb0sE3NRCCwg43nJtQrx50bsS/nOmkN4Q4UfnuA8xCJQI8eyVpqvTWn85ZOGKIgFEUz/MKUoA+1JrDt8xcthn/unISdx+PmiblHwRrfPcjnGYw/xM4VEteTvArzvL3qX+6dF06i4mSnstvptZxfY96ycffLGBXAhDyC8E5LSR1uhZn6d+A40KyXJvyjoqdploBfCtUJajqkSfebpA/sS/A+gfwoTd7wwqRcjy6uFOLEmkRpNtBrgmYG1DMbCwPBuiLGxWITF83GUY5mD+eVuh7ZLSAZ24iRVCxSJzSJghKMZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBM/s0NYQU/Tz6e/qw94tUQAQt2gq4sv8WKe7gDuVmI=;
 b=CIZcGrutAYAyue7hMHYQuH3lfnfc2SlftZsgbMu20Jc3rhrqbkCDES7L7hbfNUursJhCnSSjLqUS/cd5npn+WjYzYQ09zeDQ7gAio4kHz/SlXmb58lbgx/eGhTCWSIulBETEg3Fz+1YIZJN/D9x/BD0dlOPWaiyLef9QZMKO3Y4=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:33 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:33 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
Date: Mon,  7 Feb 2022 23:22:18 -0800
Message-Id: <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d7f8f36-ad9e-4112-7632-08d9ead3c609
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB560888266AD431D55E08D3688C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuDSssitUMg2fZGT8BeDIhoH3FM208SqsffF54fN+1Vik7Pcna11YHvrtOlKz2LmVuUByRXkRTDW2Qg3o2CTe4903bmab9hEaPEN5eR+rNvT8NIh38IPPU+SYZBjIt60vfEt82HwfWzZPbn7d2nt6CXKuXP8BWAZtEI7nn3WRfDwm1gZ+QwBVQGTfz7XFFZo9NhQp8b4UOAVr7pBQWPVPSfZ6MoNiNQvXlnY2mDIddgtRF/heAxX8AXbz8svgNJW/XOPzW2vAlY++hiviDoaFXstl7c+LYvGvYa2XQ/RpQzo7BpFYFnzOII1YuHQEjnyBfwNcB2P4soFS6zYtCrGtgAEd5O0uuFuKo5oV7dk6EDNQkHlN8twuaEAFZRVfxyYJ3iMWfU9YTzvqJJHcVF/OENmTzRaXtDQ2iqMF5xA3D78D/gR1WiETlfh9GtkmMwTaq3CkqbB7XscKcHIhyJ6YhJp6A47co57eNfAACV/tnJ1EMcaihOcPxpmxXvpTs21WMRc2pGag5Tupm137ODTw+mSHEuHDVKkfyNTY0JcZS+uJoHllxiDShAi+2bIUzZelN2gDvUIRSHEEb2a+ImG9Jyp0s4JGl/kvv1Sd20O7Lh37melW2fUK6yC7rhOyfIV6omigzLEKULc1hedaxgNCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(30864003)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtwSDhnSktkMTc5VEV1QVhIZElNQmw0MkhoL20yNm1MWlZkMVZTRVRtVUFD?=
 =?utf-8?B?M2xpMThCWGxUUSt1RDdKZEJnTHZybk5EMElYMnljTnFVdVowaElOL0NIRXdN?=
 =?utf-8?B?Z2RDVEJCOTVObzQwdW5pdkJUelBHMDJmL1dHai8za0M4MEJXR3lRZHhUb09I?=
 =?utf-8?B?R3Z3eWUwQUVjcGFUYUUyK2QwRWs1TXkxNkJtZHFMQXJVK0phQkVnb0Jhancy?=
 =?utf-8?B?c0VrTDF5b0l0bEEvODBMK0FBczRaQURHTy9jeUN4cS9ZTHpWVmdFTGtwT3pN?=
 =?utf-8?B?L2NxbnRqdGxTYU81OTBRbGl1OVBuVjBDNnh0YTVRdi9oZVVxVXYwMW5wZHFx?=
 =?utf-8?B?R3pHaUs3QTVRWVlSN3JkTVNtY1c3UXd3UjIwT0gwV3J0Q1JvRlZnNmFIbyta?=
 =?utf-8?B?ZG1oMUdDMVU2dFNkSDZLNEtpWEtTcUIzakpwb3ZXMkQvUmtsZCtCcE01dC9h?=
 =?utf-8?B?QVdCanhoK0FLZEs1NFFBdkV4c3VoQk1RUGxOTFl6ZENpbks3amxzYlBPUDgr?=
 =?utf-8?B?TzU3S3pZVCtKR29ySFRXeFNobG13Q2FadDVpbUNmTHhTNGRkWC9oRjZoRkgx?=
 =?utf-8?B?RU11dmQ3M3VTRDF1ODVoNFA1Z29maDBsamdhOExTYThTQTNISmpWaEZjWG8x?=
 =?utf-8?B?SHlwZmF5MENQM1c5b0dEN3BBc2FaZHdMZ25XTXJJVzZ6d0NHQ0tRVDVQTWlC?=
 =?utf-8?B?eEh4OFRRb3BFTklJNTdkZDVVQVRRTm03aTZXR2xubkRkMUJZSGlobWV1YlpT?=
 =?utf-8?B?eUtGcUZvMnBLU3JNVEsxeW1jL2l0NFFvdkhsS3RvOUhPR2lReVhOdi9FdjJN?=
 =?utf-8?B?K3pBdFZJMmZVbHZ4V2NyTXRvdnc4akRCRXJsVjJ0aTRjcFBYZi9QaXVEVTNW?=
 =?utf-8?B?QXRvOWpRaHJSRWNGUUtodDkzKzVoVWkwMHdNYkU5MjFXaVVrUzF6YzV1aHJ6?=
 =?utf-8?B?SXFianFUbllxQ0lpZFArdml1V1EvTnJyYnQrZjE0R2NSMlNzRlI1b2JBL1U1?=
 =?utf-8?B?eG1iekkzZTFjNGRPSlRERy9YR0l2Ykt3aWJQUTA1V05TRi9Gck5mcjBzS0V0?=
 =?utf-8?B?MlFVUUlZd2pMdmVrcjNaWlJZZ3BhS1l3c3UwMzRYbnVpK3hWZjRTNUVZcVRC?=
 =?utf-8?B?ZzNrRFJ1aEVtQ3BPa2lRNFVDL3E2c2d3d3BjOGpBSW5HN2JlQXNhNGhsSUFL?=
 =?utf-8?B?aGxrOFlLZG04ZHExY1B3VVphRkdCMHQzOUp4bzF0SGx2Um0zWFR4TXNHbkFa?=
 =?utf-8?B?c3gwRzcvQ1hqL1NJRU8vbmZLYUpjYzdNSXdsYkhrWXdPaXcwMkcxVjBIajdU?=
 =?utf-8?B?SkQ2bWpYWVRlbU1hejdtY1VVWlp6WW9lYk04eW1jYytjVkJsRFZsZFo1cEU0?=
 =?utf-8?B?TnNWcmticXRkUjNtN1JOWUNCcVgzTmxTenM2VnMvam1JaVVpOUJGYXZHMzV4?=
 =?utf-8?B?c3pHNUhsWkhZdmJOeDlUK29jZ0dJQzVTVTlLOU1TdFJ4UTR0Mnl0RVc1N0tE?=
 =?utf-8?B?ZGV5Q3ovWXJ3Z3IzRE5MSGh2V0hKaCt3SnBIclFLUGt1Uk5tanY0VzFrOVNl?=
 =?utf-8?B?cm01Q3VUS3pIWjlkdlI2Z1IyNXlKb3FWN29oclB5YWM2NmlSS1NjSG1tbjJT?=
 =?utf-8?B?bWo3YlpadjVoS0VjNENtMkZKanhJYnl3T1JTSzhucldBdlZFbDVGOEFudXVE?=
 =?utf-8?B?Y0J0cEp6Zk9GV3Z5SVV4eW1NeUNjQkFydVUySTBETWs0NjRJL3pINzN4MzlU?=
 =?utf-8?B?Z3hRYmJIN25qd25pbUhGZkpCYzA1SENubTJLWUVhaHByV0VGRDE5YjVCQlJN?=
 =?utf-8?B?ZUZlZmloWXVBRW5SbE05eFBEb0dDSUprRXlRSWNmRFhWeUdFSC9MdzNrYXM1?=
 =?utf-8?B?aTJRbEVqTHdNeG0ydEw3WWo2aFZ6M1pGb1JDTFBqdTgwM05OY25YTlFoZHE4?=
 =?utf-8?B?akFFWmJ5MmdzR2F6WHE2L21mcjZQWUNOYUtDREt5Y2NrWDZTWStremJMcTRV?=
 =?utf-8?B?MmhFcFpnaWVRNnJqanRnWDRnakE3QUFUMnVjNXkvT1grRy9OVjJlZ3lMSC8y?=
 =?utf-8?B?eTg2d0trNVMyV2g1Vk95Mm10aHkrcmxnWGVRejRBVGc5Q1hWL2VNU250c2pE?=
 =?utf-8?B?b3NTMEJmdzJOQmNEemJxM3VjVEJ0WkI2ajBsME1WenJoelpONCtZSWt0d2xS?=
 =?utf-8?B?R0RGckNpNm5yUU0ySUFPa09NV3paeVV4R0x5Yys0SUhudk1XdCs0NXFDUUF1?=
 =?utf-8?B?TXVFRXR2Q2Y0cVI5enJWME1aUG5vdTNzc3pjWUNQMys5ejJROUd5eVhtU1NN?=
 =?utf-8?B?aUJ1cElnQ3N2eGl2TFRDRjdJOU1uUHRtYXVVN3RMd09aSUthd0lxZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7f8f36-ad9e-4112-7632-08d9ead3c609
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:33.2862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlTexBSAn6oNJKjgrqvAPPMROjEQeunDKBYPpGgFm+c/y/tWRTXmeBOKWMRKetBF2gtzskoRJZkyo4Hlpe1defGFBBEuDvKzrvaf8b8++hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: Yg0mxHAGpBvuAm2XZuQvRy4tuL2CoUCr
X-Proofpoint-GUID: Yg0mxHAGpBvuAm2XZuQvRy4tuL2CoUCr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 meson.build                    |  15 ++-
 qapi/qom.json                  |  32 +++++-
 include/hw/remote/ioregionfd.h |  40 +++++++
 hw/remote/ioregionfd.c         | 196 +++++++++++++++++++++++++++++++++
 Kconfig.host                   |   3 +
 MAINTAINERS                    |   2 +
 hw/remote/Kconfig              |   4 +
 hw/remote/meson.build          |   1 +
 meson_options.txt              |   2 +
 scripts/meson-buildoptions.sh  |   3 +
 10 files changed, 294 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/remote/ioregionfd.h
 create mode 100644 hw/remote/ioregionfd.c

diff --git a/meson.build b/meson.build
index 96de1a6ef9..6483e754bd 100644
--- a/meson.build
+++ b/meson.build
@@ -258,6 +258,17 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+# TODO: drop this limitation
+if not multiprocess_allowed and not get_option('ioregionfd').disabled()
+  error('To enable ioregiofd support, enable mutliprocess option.')
+endif
+ioregionfd_allowed = multiprocess_allowed and not get_option('ioregionfd').disabled()
+if ioregionfd_allowed
+    config_host += { 'CONFIG_IOREGIONFD': 'y' }
+else
+    config_host += { 'CONFIG_IOREGIONFD': 'n' }
+endif
+
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
 util = cc.find_library('util', required: false)
@@ -1837,7 +1848,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (ioregionfd_allowed ? ['CONFIG_IOREGIONFD=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -3315,6 +3327,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'ioregionfd support': ioregionfd_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..439fb94c93 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -689,6 +689,29 @@
         'data': { 'chardev': 'str',
                   '*log': 'str' } }
 
+##
+# @IORegionFDObjectProperties:
+#
+# Describes ioregionfd for the device
+#
+# @devid: the id of the device to be associated with the ioregionfd
+#
+# @iofd: File descriptor
+#
+# @bar: BAR number to use with ioregionfd
+#
+# @start: offset from the BAR start address of ioregionfd
+#
+# @size: size of the ioregionfd
+##
+# Since: 2.9
+{ 'struct': 'IORegionFDObjectProperties',
+  'data': { 'devid': 'str',
+            'iofd': 'str',
+            'bar': 'int',
+            '*start': 'int',
+            '*size':'int' } }
+
 ##
 # @RemoteObjectProperties:
 #
@@ -842,8 +865,10 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
-  ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name' :'ioregionfd-object',
+      'if': 'CONFIG_IOREGIONFD' }
+ ] }
 
 ##
 # @ObjectOptions:
@@ -905,7 +930,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'ioregionfd-object':          'IORegionFDObjectProperties'
   } }
 
 ##
diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionfd.h
new file mode 100644
index 0000000000..c8a8b32ee0
--- /dev/null
+++ b/include/hw/remote/ioregionfd.h
@@ -0,0 +1,40 @@
+/*
+ * Ioregionfd headers
+ *
+ * Copyright © 2018, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef IOREGIONFD_H
+#define IOREGIONFD_H
+
+#define PCI_BARS_NR 6
+
+typedef struct {
+    uint64_t val;
+    bool memory;
+} IORegionFDOp;
+
+typedef struct {
+    int fd;
+    char *devid;
+    uint32_t bar;
+    uint32_t start;
+    uint32_t size;
+    bool memory;
+} IORegionFD;
+
+struct IORegionFDObject {
+    /* private */
+    Object parent;
+
+    IORegionFD ioregfd;
+    QTAILQ_ENTRY(IORegionFDObject) next;
+};
+
+typedef struct IORegionFDObject IORegionFDObject;
+
+#endif /* IOREGIONFD_H */
diff --git a/hw/remote/ioregionfd.c b/hw/remote/ioregionfd.c
new file mode 100644
index 0000000000..ae95f702a6
--- /dev/null
+++ b/hw/remote/ioregionfd.c
@@ -0,0 +1,196 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/kvm.h"
+#include "linux/kvm.h"
+
+#include "exec/memory.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qom/object_interfaces.h"
+#include "exec/confidential-guest-support.h"
+#include "io/channel.h"
+#include "qemu/sockets.h"
+#include "qemu/cutils.h"
+#include "io/channel-socket.h"
+#include "monitor/monitor.h"
+#include "hw/remote/ioregionfd.h"
+#include "hw/pci/pci.h"
+#include "qapi/qapi-visit-qom.h"
+#include "hw/remote/remote.h"
+
+#define TYPE_IOREGIONFD_OBJECT "ioregionfd-object"
+OBJECT_DECLARE_TYPE(IORegionFDObject, IORegionFDObjectClass, IOREGIONFD_OBJECT)
+
+struct IORegionFDObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_ioregfds;
+    unsigned int max_ioregfds;
+};
+
+static void ioregionfd_object_init(Object *obj)
+{
+    IORegionFDObjectClass *k = IOREGIONFD_OBJECT_GET_CLASS(obj);
+
+    if (k->nr_ioregfds >= k->max_ioregfds) {
+        error_report("Reached max number of ioregions: %u", k->max_ioregfds);
+        return;
+    }
+}
+
+static void ioregionfd_object_set_fd(Object *obj, const char *str,
+                                     Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+    int fd = -1;
+
+    fd = monitor_fd_param(monitor_cur(), str, errp);
+    if (fd == -1) {
+        error_prepend(errp, "Could not parse ioregionfd fd %s:", str);
+        return;
+    }
+    o->ioregfd.fd = fd;
+}
+
+static void ioregionfd_object_set_devid(Object *obj, const char *str,
+                                        Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+
+    g_free(o->ioregfd.devid);
+
+    o->ioregfd.devid = g_strdup(str);
+}
+
+static char *ioregionfd_object_get_devid(Object *obj, Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+
+    return g_strdup(o->ioregfd.devid);
+}
+
+static void ioregionfd_object_set_bar(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value > PCI_BARS_NR) {
+        error_setg(errp, "BAR number cannot be larger than %d", PCI_BARS_NR);
+        return;
+    }
+
+    o->ioregfd.bar = value;
+}
+
+static void ioregionfd_object_set_start(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value < 0) {
+        error_setg(errp, "BAR start %"PRId64" must be > 0", value);
+        return;
+    }
+
+    if (value > UINT32_MAX) {
+        error_setg(errp, "BAR start %"PRId64" is too big", value);
+        o->ioregfd.start = 0;
+        return;
+    }
+
+    o->ioregfd.start = value;
+}
+
+static void ioregionfd_object_set_size(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value < 0) {
+        error_setg(errp, "Invalid BAR size %"PRId64, value);
+        return;
+    }
+
+    if (value > UINT32_MAX) {
+        error_setg(errp, "BAR size %"PRId64" is too big", value);
+        o->ioregfd.size = 0;
+        return;
+    }
+
+
+    o->ioregfd.size = value;
+}
+
+static void ioregionfd_object_class_init(ObjectClass *klass, void *data)
+{
+    IORegionFDObjectClass *k = IOREGIONFD_OBJECT_CLASS(klass);
+
+    k->nr_ioregfds = 0;
+    k->max_ioregfds = 1;
+
+    object_class_property_add_str(klass, "devid", ioregionfd_object_get_devid,
+                                  ioregionfd_object_set_devid);
+    object_class_property_add_str(klass, "iofd", NULL,
+                                  ioregionfd_object_set_fd);
+    object_class_property_add(klass, "bar", "uint32", NULL,
+                              ioregionfd_object_set_bar, NULL, NULL);
+    object_class_property_add(klass, "start", "uint64", NULL,
+                              ioregionfd_object_set_start, NULL, NULL);
+    object_class_property_add(klass, "size", "uint64", NULL,
+                              ioregionfd_object_set_size, NULL, NULL);
+}
+
+/* Assume that Object user released all allocated structures. */
+static void ioregionfd_object_finalize(Object *obj)
+{
+    IORegionFDObject *o = IOREGIONFD_OBJECT(obj);
+    g_free(o->ioregfd.devid);
+}
+
+static const TypeInfo ioregionfd_object_info = {
+    .name = TYPE_IOREGIONFD_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(IORegionFDObject),
+    .instance_init = ioregionfd_object_init,
+    .instance_finalize = ioregionfd_object_finalize,
+    .class_size = sizeof(IORegionFDObjectClass),
+    .class_init = ioregionfd_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&ioregionfd_object_info);
+}
+
+type_init(register_types);
diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..af01b75770 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -45,3 +45,6 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config IOREGIONFD
+    bool
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c60a29760..d29fa8a7de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3454,6 +3454,8 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: include/hw/remote/remote.h
+F: include/hw/remote/ioregionfd.h
+F: hw/remote/ioregionfd.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..caff3427e7 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+config IOREGIONFD
+    bool
+    default n
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..b190c520c4 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+specific_ss.add(when: 'CONFIG_IOREGIONFD', if_true: files('ioregionfd.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
diff --git a/meson_options.txt b/meson_options.txt
index e392323732..52b338c1b8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -66,6 +66,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('ioregionfd', type: 'feature', value: 'auto',
+       description: 'Fast-path IO/MMIO support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 7a17ff4218..1cbd2984f5 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -98,6 +98,7 @@ meson_options_help() {
   printf "%s\n" '                  Xen PCI passthrough support'
   printf "%s\n" '  xkbcommon       xkbcommon support'
   printf "%s\n" '  zstd            zstd compression support'
+  printf "%s\n" '  ioregionfd      ioregionfd support'
 }
 _meson_option_parse() {
   case $1 in
@@ -270,6 +271,8 @@ _meson_option_parse() {
     --disable-xkbcommon) printf "%s" -Dxkbcommon=disabled ;;
     --enable-zstd) printf "%s" -Dzstd=enabled ;;
     --disable-zstd) printf "%s" -Dzstd=disabled ;;
+    --enable-ioregionfd) printf "%s" -Dioregionfd=enabled ;;
+    --disable-ioregionfd) printf "%s" -Dioregionfd=disabled ;;
     *) return 1 ;;
   esac
 }
-- 
2.25.1



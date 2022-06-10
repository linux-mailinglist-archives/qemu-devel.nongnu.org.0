Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE4546DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:58:27 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkm3-0001cM-0D
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf0-0000BY-DP
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkev-0000PR-ET
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhufb021488;
 Fri, 10 Jun 2022 19:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tYZgsr9yL+X1AZdVUWueMJDrqbokKMijg5WzTSCrlFo=;
 b=hZMLtrkk6d8mFrpoo8TxDtjbTTMTZ+pSuJkiu4WXDhJowmdtqX8aWwLYQpLbTiFs9w3y
 DzUFNVeduSI+dURpfXjSP/GMk74240ummGYbiSz2SAoYsyZfHQiBKE1oL4FzXSTMjCqF
 4il8Rm8JBA2dBRimHgIQnAOqG+CIquGQaD67Z5ZFNJOfctnPINlcyksvHISk8Lv8ve+N
 d+AguwNltsieJ16Cnv6/6Hx42HaXXGCNdIlq+tBJ9NrF8GzninC1PQGz4dJsl/Z2t7pV
 lSW8BAJUnlBuK565Gad6F6cyWJAAL1dhRSQW9qXsoG8HZAhh/pLQBaB1/jKL5ZzrouJs fg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexem0uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJk8m3018455; Fri, 10 Jun 2022 19:51:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwu6cuu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv8l1RIcVshGCFwWv1ZsXto+QVZMkzLcN5yTJ6ubYFfaMEPcX9qM3497drRPmeC7XajMSzkgKESqCfS750FDjwqB7Rax+pg1vg+MTGe2/5VGqTDVTMKM/xxY5eNIWM6OBS6dM5oLxPsY90ygsXykKyqAYjXWzriKtxE4VwcECHpget/aeXa3zUsR7e/g3fdVley5lMlUNQiWz0HrrKNwyMnoR4UGm4zAlaS0CoOxt0o4sALSaKRn5IozjHOAuTlHhUcHMFzJDdH0SGT39F3yDas5oVsQukzfr3rc8K8WCe4ZTICUS0WtOoWcD/KTc+TeAJspNUtjz+sEq+KK7Sb5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYZgsr9yL+X1AZdVUWueMJDrqbokKMijg5WzTSCrlFo=;
 b=iTFKIdQ1fyCBnzTKHE3ovcHWOPPaAfXjxy7uI1JTr7tOfeW6Pt5MfLmIN5QmvG05etY4XiFNhYGZDx5/xw4kH7zGRTMd9YZvMIAaKprRY3oeloWU4hasO6FhCIMBgarclSfKH72kKqnya1I9TtZPLt83A3R72jCIn/lovQyhXUjoWfZ44FMVf19HJtQoTyK6B2pETorELM0KhNl98oeAyZVWXMJHSJKMlQz5j+b4e6N18F5FWFWXOwDFZH6ULxM3iyDui1EpyYKS0i55rWBBExVQ4Z8WleVy8tJpWb4jl1bZZVcD72Eiexbg0HW4gljpFv56rzp3xG5KJVGyLYxPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYZgsr9yL+X1AZdVUWueMJDrqbokKMijg5WzTSCrlFo=;
 b=HD42WOnWDloAzBICP5V71ad8due8C+o+OYABUQNt/QxiS6n76sh7wDkgXONmVOurO8mewbSEMrxbiGHHZlPhNm6tYsGRXatPRbD9frXbMsJGZpeq1Kjgj7JZDKDS6ApZDzg+K+s8FGjoeH31aT7YDYw2YLbhXiIJ4nPy7i2IyjU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:50:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 05/14] vfio-user: define vfio-user-server object
Date: Fri, 10 Jun 2022 15:50:32 -0400
Message-Id: <47a665da9676a1ad676933e2d1c187ce3b54b308.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc185c3d-bdf0-4e3f-fcd8-08da4b1a8a8f
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915570BD175B4B19134597C90A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cllZQBRYl8ri7NVmIt2kHTRhbjX9l8O0Fl2RkaXXAMhUbXSeoq0rPGkK8f2jyAXPKp0Klm3F3+VfnJmN1e4+Mrvk12YP4NNkD2t+8sGzts4ioMpHBdUvI2XyqiDjz+VeT5SzqR5mL/lNL4Hk/cWO/lhDm4Wuku01+lQ6RB9n0gOv1eqIMEH44EKRxT5wqTDpKEXjd6bQKn2yV950+Ud5WrIdxtPaCOYRtS+e+ye1tLU60CfLrIUhR+8Ca464sKPWa6oKc8qzvVzTfo8GJlXLMhWbFgWBkhms8yHrCD/7q4yGYUvmdDzLulnHUX/+TJh/OsrAGj/DJWq1EOfWuAFiLVUNdUErC5LJKllhb4pphXOiNiSX5NhVmNbG4Zb5J9dS+HJ2jbeTjX1CDSn8pkcYIykzp5xAJmK9Mjq1fYtcCXUiVTpHS2fehHFi5vMWxeApKnt3gfckB0o8DQCjLa2MFKqK9JusniTD10ZTJL1ziq2ipIenD/aiQyJHncAfx6LEpR3/jSPjkywgXx1L77oA6OFtCLywc7mPnW8hK/0jicSsfeMm8cElOtUpQJfJEsUJRQwjaHTnQqWej7zxXTR8i50F0rNhLJFFaoRbCsjgV0siHT16uPQaoYgiYD1xtwggPJNFuAUbxqtILPIQh/GCt9b3uG7zmTBXX5jq2ZMA0StkblyedFWQx6/+6eXFT9E4DMEQFTkvw7UrgE+TdVsNfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(30864003)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RZTkk0R2NMWUhkclRteHR0Z3dDTnNqeDhjaE1KWUxSR2hYNTZ1a1YvT01s?=
 =?utf-8?B?OWJFdnpvaXZFRkNReXhKVms4UkNHMlVYbUROY1RIZ1hyQlppbHhaK0V0MTdB?=
 =?utf-8?B?QTZaRmNvUFZmOWNEMndyRExHNnVoNng0dWtCSzVqMzJqWm9lalNQTXJFRXJm?=
 =?utf-8?B?QnprMXZxRmJpWEh3MTlWL1JXRUhGb3JLSUZjQkhEd09HZmVVTzRVOG9GWFQr?=
 =?utf-8?B?TldVcFNZd1RMY2RwNVBWVnpzQXZQUUE5TGtjeDRpUHQ2aEF4OElVSjZMTHVN?=
 =?utf-8?B?YUt1Slc5Q1Y4YUh3YnRhOTZFak1mejNoemZXckRCMkFLSk0vUXJhbFp0V1Bx?=
 =?utf-8?B?d3k4VEg1WUNBWEYxT2wySHRyc2dZblgzUEk4MkxQQ0Y2aDhrZW0vNnhiNG5u?=
 =?utf-8?B?VW9IWUY3eUF0UFE4R0Y3VkJ2Z1A0UEdDZGlJM0ZwbDkwcld1Ulh2c3d3NHc3?=
 =?utf-8?B?S01zR3F0Sy9tQ3FBbEdKaWNEamh1bkcrOTdheWZpYnFsS1p3ZzFob04zS0RL?=
 =?utf-8?B?c0g1bUdmM25IR2pxYVFkRE9kdEpaU1pXTnR3SnBLMXlWYUl3N0o3T0NSeERN?=
 =?utf-8?B?QU5HdUNJcWtiV0dCQ1VidUZSUTl3bzlHRk0ra2ZWc0NMcDhSNmE0MDNFajlx?=
 =?utf-8?B?TFArL09nS2U5MUNzTXVZeVFwNmlEaXVIVWhNaW05UlNnMW9KcG5EeXgvMGRM?=
 =?utf-8?B?SWk4WmxhUU00bU1aQ3ZZZC84SWZPMExCSkVBYTlJT1oyQjc2dWlHMStxVVUw?=
 =?utf-8?B?YlFHbW9JeGk3Y3o3MFdzdmdva2h3Q3dEeGpncHhWZzRvVmpUOXFvNGZ1dk1G?=
 =?utf-8?B?TEdDTkZsVW1mcFhqVlJOUWMzc2d5TmEydW96eW1TZ05Xeld6T0ZrQUwxcGhE?=
 =?utf-8?B?a3RPZmk4VTc5RTBGeDdGVEhxZGtaUTlxODFUeDR2QW0xSnlUS2dBa0xPbGN3?=
 =?utf-8?B?NHRLdDIvTUF3SlRPczZ3T2pobDhsVko4ZkpRSzRoYTM5RDh5c3RpdEY0UTNz?=
 =?utf-8?B?UzgrT0RLTXJ1K2FITXdnemF4bmRBRlg2eE5kaDR2d0dqSllSRkI1Y3U1SVN4?=
 =?utf-8?B?aXVEaTZIVkt2RzNvRXRkT3ZNV1JXcldrblJSeTRJeDVENTBZUUFDZ1FxN1J6?=
 =?utf-8?B?eXNqcEZkclNQUnFLaGJ1ZnZJOWJmNVljcTcreFlnUHQwOEtwNTNlREg5WnBj?=
 =?utf-8?B?dUFxZzZjWk5wRXY4bGRrK3FwT0I1TmxZRDNUUDBZVmlrVThlQlpxOFU3ZCtP?=
 =?utf-8?B?T1paZ1pqSGFxUTE3U2NMVEZhS2Q3ZWhXcVNlQTQ4T2g5QkhncDJ2T05iY1NV?=
 =?utf-8?B?RnB1YkxiUW5EQTZmbFdBWHV0WEE1ck1aVTA3ZStOWXc0allpanpSclFIdUxZ?=
 =?utf-8?B?YU9kOUJ6azlTWFZTWDF6SVczK3p1c2VYdVV5anVmdGp4UHlGbkQxbGJHY1Zp?=
 =?utf-8?B?TGZXVFZRRmxiYXdCSzc4WWVwQ2RyU25JU2w1QVBYQ2ZVRTBKbzAvOWFSNVM0?=
 =?utf-8?B?MFg2ZG5WaTFlQmx4d0dMVkYxRHYrUzNPZC9BVWZxNjJ1RGtjb0lBRDFDVG1w?=
 =?utf-8?B?bEhZSzF1dWdwcFQ3bzROdTZ2eUoweFh1ZDZSWmVQaWVFR1RrYnhRRlJZc2g2?=
 =?utf-8?B?OXlaQ1Y5Vy9uVlljVkZSLytzeEZpUlVyb2l3L0FlRXp5ZG5wMVVuZXVEWXdi?=
 =?utf-8?B?T0gxY3EvNDJxN3poY1FNVFlZUFovVXl2eWNYcjZZbDdDaUxTSUY5TmRTdU8x?=
 =?utf-8?B?M2RyS09RTmgzUyswcThROWlURllCM3hHOUkyaVZadk10YXFMUnZGcWx0WmhS?=
 =?utf-8?B?Y3dyMk1mSVdUYklTL3M0aGNGUXhyWWxtNDhQbzBVZmxYNzRpa2RKd2JHNjR1?=
 =?utf-8?B?SG9DbHllaldscmRNUUl1eFUwaXdjMUhRWUhsUGdNWDNpZi92NEM2U1lUaTlD?=
 =?utf-8?B?d2hId3BRWk5qaVJ4cCt3K3JXSnJoSktyNjg2dTI2bXFMVmJ3Q1U0ZlNOVEo2?=
 =?utf-8?B?aTVpd0FnSGZtWWJYZWo3SmlBVi9RUklRdEtjWnNXOUJLdjRQRnQ1MWNteEtr?=
 =?utf-8?B?OXRldzNJOFBrdS9PdFE4ZXVFU3JTakRaeWd0NHlnTFpCeGtmcWplRnpsVlU3?=
 =?utf-8?B?ZmEwdHU2TzVUSDhhTzRXNHlpZWJUMW40V212Vk9nKzN0aGJkWVpZRDlCU0x1?=
 =?utf-8?B?TVdqUncxdVZteGtmZlFJYmRmRjgyYkFnZDBUNFFkN3NBd1YrMkFrZHNrVEFi?=
 =?utf-8?B?aGxUd3U2VHhhOHpMYnVVUUgwYWNIajhjOHlZWGxEdHlVRUdDdUhwWHpJVGZk?=
 =?utf-8?B?T1M0dENQeDR4bFFyZVZud2dVM1V3UmV4U1NMR0dGUjZDTm04L1VSUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc185c3d-bdf0-4e3f-fcd8-08da4b1a8a8f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:59.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4g8ubWekkS3bo+ICXlzC3s7KRlDwoa8uo+5iUcGGUfGP8SvaQzQQ5DnSX4TZBMz/lj62DJ4vUKKaFgdc5NLSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100076
X-Proofpoint-GUID: 4H_wF6J8gEr27VWbHmvp3EH5qUEx8XrW
X-Proofpoint-ORIG-GUID: 4H_wF6J8gEr27VWbHmvp3EH5qUEx8XrW
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   2 +
 hw/remote/machine.c         |  27 +++++
 hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 262 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 6a653c6636..80dd419b39 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -734,6 +734,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfio-user library
+#
+# @device: the ID of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -874,7 +888,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -938,7 +953,8 @@
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
index 9f3cdc55c3..4d008ed721 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -77,6 +77,28 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
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
@@ -90,12 +112,17 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
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
index 0000000000..bc49adcc27
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,210 @@
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
index ef8f227fbb..3518833711 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3632,6 +3632,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7da83350c8..0eb5a0f375 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
 
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



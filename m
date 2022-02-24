Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1EE4C3618
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:47:44 +0100 (CET)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNK5X-0004fe-Dk
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNK2l-0002r7-S5
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:44:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNK2h-0005ga-4a
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:44:49 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OJiBSj029932; 
 Thu, 24 Feb 2022 19:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=FuW933i8NpYv37Xcjua59CG3F0nu9bs4j84LA+3kTNo=;
 b=rL9pH5Ss7Dbf+gQKftgXHfro48vKBG+XbyeIlyqyGXMEPZa91fQF4FCZOue+DWjplifX
 QXW+IHw4mn02bTY31L9Br/bI1IRsNK4llnkXrLQ865xBGbBO7KKJ2MYVuWwzovMkbZS5
 YHnBaH1ELNEcFVZDW2jQ5BbfRdzFaeCZLTXAoDpQ+ETLJ3bo8UXhgI2iVMCt6CUlZ/tX
 inizAMm5CjnBSV817EfZVP5jBkOii/gBxgKyelgVoZ7J+pkwSwQLLNv1WZDV7HEETIR8
 iUZYfIOu574/2CXgfZk7ZUk5hJMh3vmM/zIvp0shpAyVoQ+5dIU1WGJcNrxMfsnHJayj Yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar803h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 19:44:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OJas31165276;
 Thu, 24 Feb 2022 19:44:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by aserp3020.oracle.com with ESMTP id 3eb4841gxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 19:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY+Rdsn7ZKAXHLOQ9CfxRlgfq9iEUQUnNUWrJ59YMXUhbAfyueZiCAv9mLzA8CtlyqtfgHi2yGL+OipVJ2LqwoXaSIFW7Q90DaVo82JUp9uzdNizi80DR7r7dN0WAEUPNoQzmr1eI0+loc+MHJOTMVPvbyL9kdts0IMgJw+ed0/IiSup/CaC+z6S2b5sIxFtOfXsGLYUKjIFFqGiK5oY3btNuuZmpKniqWxrZI3+y/0ve5dKGo64BW38maONBVE7/GxArI5x8xFaxmkn0Efsg6dtgfc97F3/dhuogZLj3o2ob4EzMYaB+Wvw/AsIDxMmYF4jmOrvPIWhFn8FjlngTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuW933i8NpYv37Xcjua59CG3F0nu9bs4j84LA+3kTNo=;
 b=V0Hvp7VhWQ9KhZBUQ6/GHV2TSevTCQmgI4NzDaX4NOCPt8XZe9iaiMja2FY9e3v5PKyII5pOyWNjbtOm+5sbQpzqQtAa2+aa4+ztlimOZvrJYKaIPgFymuZ+NXzeCMclZmElwPV2CD4e3gQRzBX1YlqMOo1q6tzh1TN8ixCEXfEisf49hOk9Mqw95GxuX6sH+n0HhzYSPmUKWYTy82tkQqilxckTyQkP+3j9h1tyqHcsQqlDC1L7IFAdljfQrBi9FfZpiSparEDUimv63gN2vc2KMFzT9Psbj8QC+TE5TpqW2B9Vmk8r/y+d1wAhYhpYkW7hp7JRbJT/8WJH7FIv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuW933i8NpYv37Xcjua59CG3F0nu9bs4j84LA+3kTNo=;
 b=gPrZXppIsR0cACfUqN6/tKoP7wE9bOKg0ExeW/rvZrCGUVtL9Qp5TXsf6cr6NF41cdXOyPgKrHy0CZBA1k1HNsmqrZnoXylB+DYhBO5hPV2YVHvLBfVsfzvcnMCxFRwQFZWbnDiKQfuFUhmzLxDjVO6nikYzW+EScpfMPn2T4J4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH0PR10MB5019.namprd10.prod.outlook.com (2603:10b6:610:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 19:44:36 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 19:44:36 +0000
Message-ID: <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
Date: Thu, 24 Feb 2022 19:44:26 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224131607-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0050.eurprd03.prod.outlook.com (2603:10a6:208::27)
 To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e0646b-c6cf-41c4-86b8-08d9f7ce1617
X-MS-TrafficTypeDiagnostic: CH0PR10MB5019:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB50194D606F5F3EA2F118F8B9BB3D9@CH0PR10MB5019.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJisc7GHfjb/JBcXRSbWCP9OZzGSH2CV+NFfRlvtQiLK7X7AKM1A06J2uvPBKpSXB2Hzv4glq5td4BdN5dvCccomwRX1ppYlzDDTCVVMv/sCpPW4DgVS+QNavW/f1TnMM/wTzDNN0vyaQEDJyogtbk7tECM9kAkRYbL+gAfDjMOKv1JpdScApNnRlkXye44yLk/WH72NYbeVFOV46X2MyJx/LHsblUPhvjGggEGLD2tYxnJ7uq+GQN8F6MSFR5hivJ5Y6tXsQxb5zaQ6FRZZJfCdPgG9p/qRugJOrKMg9w9C3u5lmCv7rsBm5WHlH+DRD6Z4Fswozwazpu1b8w0ztir1dHJbfLLe06R6NvyE+VtNZ0DnGZ3V46fDZPhszdl0q9bBy6Io/HgJf7JuWxCsc68tuc4KyhN7c5tWU4bmUbUreToaJFOr6IZWina3eNgNq3JyXjj+IEzbMkyXo3Ew2pZY+a/ns5ytBsCjW08l6aIkjtgdzWBqtmFVLxNnAaAaquzgklHAC8RjxQ/s4TAEC58uQMz+QBlP2M8c/NnVdzd2GTSLdXKt8e95jD9ML92hmxmBPjVAnCPc7b9tam+Yhr8+UGHEne+8mJJrVYR1mVP5cKfnfISzAX1iOs+hxreKMqcZhYiz4s6KnL3UG8p0SNxJlvF3NUEKfO1YuA4K+nHG2fDVhkwcgs4agG6v8gi/O5Wjv35g+ClXdI4pReh5Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2616005)(66476007)(66946007)(316002)(6916009)(54906003)(186003)(38100700002)(31686004)(4326008)(8676002)(86362001)(66556008)(36756003)(6512007)(31696002)(5660300002)(508600001)(6666004)(2906002)(8936002)(6486002)(83380400001)(6506007)(7416002)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlFbjdHS1VKS3VJUkNIejE3VUxTVnkwYkRwWTFkU0RqQnVlS2FHSll3U1Q5?=
 =?utf-8?B?cUdlUFhaNkk0WlhjbWhmQ1dibExZTEZVbTJWU253a0ZjOU5rdFFrS29BZmJO?=
 =?utf-8?B?NDNDRHZHYmZPWGNhM1VFQzhORUJwcFpBVFJQZVVESmJZSXZVdlhiYndDbGY3?=
 =?utf-8?B?M0JFblVSREZ2UGhERXA3ODh1U2hHTG1TNldDcDJGdXRDOUY5RXYvNTFkUzRL?=
 =?utf-8?B?cktJeUNac2ZWK0NGSjZJa3FLZkdJbUs1SjRFcllXNWhxdW51eWkwTnNMVUFl?=
 =?utf-8?B?WUI2ZWxVa0ZlaHN5VEIybVdza0JkTUwvWkRabTc4UjI0Vjl3VUkraml0SXZy?=
 =?utf-8?B?SGNGYjMwckwvUmJjcHlJeWdZSXNUajNsY0YrRFF6VHgzNlNWN0o4cGtUM1pI?=
 =?utf-8?B?SVZrU2xpZUhNaTg0cXYvNy8xVzRCemhlWHkwZTRCYmRKZThPc0QvbTY4eWZX?=
 =?utf-8?B?L0FlRTR5WkptT0RSNm1BVzF0WmFKaUJZcWVObmpuUzd3Z0U0dDQ1OW1lNWh5?=
 =?utf-8?B?K0lob0twamtDZnBYbmNnRmYzVlpMLzVWanlSVlNJMzdhbUR1WEVXT0hDZlcr?=
 =?utf-8?B?dDZyV3dpa1VRRDU5dVA3ZlpJaUc4TjBTc2x5SllYUm5TZFlCSjNPMGxnaTJT?=
 =?utf-8?B?dWJXTnhBOWNXY0FaSktLcWZmL0JRUlpSMjRPZURrbFZLVTdaSG9DRklkM0Fw?=
 =?utf-8?B?c1NXbzJLTU9HbFBZaWVlVVF6SXE2djV3Smk5V0dtYTFtQldYT2dSemNpUlp0?=
 =?utf-8?B?YXNrSzVTak9hSHZyUy9ub3JIR1Z2Nit3Tmd3Ulo4N3pRR1YzN0RIUDByenFQ?=
 =?utf-8?B?MUtJRTBJVlZvSGt2UHVIRHNjbDhRQnk3NHI4VlpSZlhOZFA2dXB5bzYyekFq?=
 =?utf-8?B?VVJOZXlWbHEwWFVRVXd4VjBnbUtURExUNjlLTDhDVlIvMjJHRFk2eU90RWdL?=
 =?utf-8?B?WWZTc0dxWFBnQ0p4SlVhSFNoSWc1VmlqQ1RUeGgvbyt0dWF5Ry9lZ2ZSWklR?=
 =?utf-8?B?eS9PNmE2L1E1emVGaUkzQjFKVEtrbHA2V2M4SXMycnRLM3AzTmd0QXd6anZH?=
 =?utf-8?B?REN3Tkl5eFY4OVprRjdYR1dNWmtKVE9VaCtiRWNBcEJrMlJIaVZFOUpTWXc1?=
 =?utf-8?B?enlJdTQzR2ZuZ01udnV3Z1YzZ1lOMkd6bFZMc2RhV1pMVVVySWVoSS82YnBI?=
 =?utf-8?B?T0w2VkhoV1JpMWN2cW1vUElyWjRsOUtwdmhNakRyMGUxQVA1MXRIVXRBcXZI?=
 =?utf-8?B?U1lUaVRMR1NjWFhaa2N2bTZ0ZEwvM0x5L2V0dHdJYks3SmFXZHJGVmRxWWhP?=
 =?utf-8?B?OTR1NTZYbWozdTBZSTZQMnNJbTZXMUpObG9kQnp6RUR4Z00xYkk1dklBeHNJ?=
 =?utf-8?B?OTBiMGpQcmpJUW16THdnTCs1V3dSeXRoMEd3UEVtRTZ2Q09LQVBLN1A1cGlp?=
 =?utf-8?B?cWVSOHRyQ09YUHNlYWFxdTN4SVdNaXJlck43OW9XQ1l4cDZlNUZqUStoNk5O?=
 =?utf-8?B?ZFd4T3JvUHhPakJ0dUpiQUFubUltTkY4SUN1SnUrR0lveHViOUZXTjJpZzMv?=
 =?utf-8?B?RzhvRHpyRkd5K09HNUg4MXl3Q25CWXl0ZSs4QTN3ZVVydG9wQnk5NHBBZy9w?=
 =?utf-8?B?Q2xZRDUrT2Jwd1k2S0JWSzM1bGZKVHBVL2xiNVdoK045U21sRHpraFlwaldI?=
 =?utf-8?B?UGJ6bTBhY3c4Ky9EMjhKMG9ic0VxZkE5TjFPZllYbGlwM2VQN0hEYVhMTkRJ?=
 =?utf-8?B?UGdiRmphU2w2T0JicnE2TWFvN1NteDR3bzZ6NlNvd2Mya2F3S3ZFTisyeFht?=
 =?utf-8?B?QTFCYmh3U3Y1dXk2SWl1b0VaM1NRSFFPOE0vd0ZvamQvTTE3aDdhamRvOGVm?=
 =?utf-8?B?K3ZJaTRQaVJlN1pvRFNOZ3dkZVVvY25jaGEveFBVdHRQL2NVUitiNSsvWTk4?=
 =?utf-8?B?MmNuU0hLcnR6U1l1ODFsVHdPZWtDMmJOSGhUWU9BZEZldVBlZ2cwUjVDOFhy?=
 =?utf-8?B?TVhHVmJoRXJkYzBqUzlrcFh5QjlrbTY3bG94bjB0bmNEc3dCUUk4eVBkUkxD?=
 =?utf-8?B?b0RPUHVpenZTV0owb2w1TitWLysvaUFESlV3MkZLT2dkRTF4ZTE0eFMwQ1Vv?=
 =?utf-8?B?L1ptRzZBNVNUcGExdzdvL0did3F1ZnhMVWdPcmIvdUFqbHZoZUhyZFYraW82?=
 =?utf-8?B?THNUelN4eTR5V0pBRU1IY1pJdXBNUlVTQU9SbzQzTW9wVmNOMmYvRG4rN2xq?=
 =?utf-8?B?THZkYXRraHU0TDdWMzhGMzQxSkV3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e0646b-c6cf-41c4-86b8-08d9f7ce1617
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:44:36.1692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjOZ66h65vJt4YlDybSKzCR1pE5/fgvNX6F7USKXYk/ww7d2kea4W2aRPFWsC7b/ovWBNss3Uma9mEK8qLe6RuZEQH7iloWI7idSW4yHI+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5019
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240109
X-Proofpoint-GUID: PwwpiLjilxwZiKXjINDTtDg7GgG-sVYX
X-Proofpoint-ORIG-GUID: PwwpiLjilxwZiKXjINDTtDg7GgG-sVYX
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 18:30, Michael S. Tsirkin wrote:
> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
>> On 2/24/22 17:23, Michael S. Tsirkin wrote:
>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
>>>> On 2/23/22 23:35, Joao Martins wrote:
>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>> +                                          uint64_t pci_hole64_size)
>>>>>>> +{
>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>> +
>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>
>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>>>> It's really about what we present to the guest though,
>>>>>> isn't it?
>>>>>
>>>>> It was the easier catch all to use cpuid without going into
>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>>>> for systems with an IOMMU present.
>>>>>
>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>>>
>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>>>> even worth checking the range exists in:
>>>>>
>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>>>
>>>>> (Also that sysfs ABI is >= 4.11 only)
>>>>
>>>> Here's what I have staged in local tree, to address your comment.
>>>>
>>>> Naturally the first chunk is what's affected by this patch the rest is a
>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>>>> all the tests and what not.
>>>>
>>>> I am not entirely sure this is the right place to put such a helper, open
>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>>>> of the file's style.
>>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index a9be5d33a291..2ea4430d5dcc 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>                                            uint64_t pci_hole64_size)
>>>>  {
>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>> -    uint32_t eax, vendor[3];
>>>>
>>>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>> -    if (!IS_AMD_VENDOR(vendor)) {
>>>> +    if (!qemu_amd_iommu_is_present()) {
>>>>          return;
>>>>      }
>>>>
>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>> index 7bcce3bceb0f..eb4ea071ecec 100644
>>>> --- a/include/qemu/osdep.h
>>>> +++ b/include/qemu/osdep.h
>>>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
>>>>   */
>>>>  size_t qemu_get_host_physmem(void);
>>>>
>>>> +/**
>>>> + * qemu_amd_iommu_is_present:
>>>> + *
>>>> + * Operating system agnostic way of querying if an AMD IOMMU
>>>> + * is present.
>>>> + *
>>>> + */
>>>> +bool qemu_amd_iommu_is_present(void);
>>>> +
>>>>  /*
>>>>   * Toggle write/execute on the pages marked MAP_JIT
>>>>   * for the current thread.
>>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>>>> index f2be7321c59f..54cef21217c4 100644
>>>> --- a/util/oslib-posix.c
>>>> +++ b/util/oslib-posix.c
>>>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
>>>>  #endif
>>>>      return 0;
>>>>  }
>>>> +
>>>> +bool qemu_amd_iommu_is_present(void)
>>>> +{
>>>> +    bool found = false;
>>>> +#ifdef CONFIG_LINUX
>>>> +    struct dirent *entry;
>>>> +    char *path;
>>>> +    DIR *dir;
>>>> +
>>>> +    path = g_strdup_printf("/sys/class/iommu");
>>>> +    dir = opendir(path);
>>>> +    if (!dir) {
>>>> +        g_free(path);
>>>> +        return found;
>>>> +    }
>>>> +
>>>> +    do {
>>>> +            entry = readdir(dir);
>>>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
>>>> +                found = true;
>>>> +                break;
>>>> +            }
>>>> +    } while (entry);
>>>> +
>>>> +    g_free(path);
>>>> +    closedir(dir);
>>>> +#endif
>>>> +    return found;
>>>> +}
>>>
>>> why are we checking whether an AMD IOMMU is present
>>> on the host? 
>>> Isn't what we care about whether it's
>>> present in the VM? What we are reserving after all
>>> is a range of GPAs, not actual host PA's ...
>>>
>> Right.
>>
>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
>> and so we need to not map that portion of address space entirely
>> and use some other portion of the GPA-space. This has to
>> do with host IOMMU which is where the DMA mapping of guest PA takes
>> place. So, if you do not have an host IOMMU, you can't
>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
>> don't need this problem.
>>
>> Whether one uses a guest IOMMU or not does not affect the result,
>> it would be more of a case of mimicking real hardware not fixing
>> the issue of this series.
> 
> 
> Hmm okay ... my first reaction was to say let's put it under VFIO then.
> And ideally move the logic reporting reserved ranges there too.
> However, I think vdpa has the same issue too.
> CC Jason for an opinion.

It does have the same problem.

This is not specific to VFIO, it's to anything that uses the iommu. It's
just that VFIO doesn't let you shoot in the foot :)

vDPA would need to validate iova ranges as well to prevent mapping on
reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
map request is within a valid iova range"). Now you could argue that
it's an IOMMU core problem, maybe.

But I this as a separate problem,
because regardless of said validation, your guest provisioning
is still going to fail for guests with >=1010G of max GPA and even if
it doesn't fail you shouldn't be letting it DMA map those in the first
place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
from IOMMU if DMA is attempted over the first megabyte of that 1T hole).

> Also, some concerns
> - I think this changes memory layout for working VMs not using VFIO.
>   Better preserve the old layout for old machine types?
> 
Oh definitely, and I do that in this series. See the last commit, and
in the past it was also a machine-property exposed to userspace.
Otherwise I would be breaking (badly) compat/migration.

I would like to emphasize that these memory layout changes are *exclusive* and
*only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
It's not every guest, but a fairly limited subset of big-memory guests that
are not the norm.

Albeit the phys-bits property errors might gives us a bit more trouble, so
it might help being more conservative.

> - You mention the phys bits issue very briefly, and it's pretty
>   concerning.  Do we maybe want to also disable the work around if phys
>   bits is too small? 

We are doing that here (well, v4), as suggested by Igor. Note that in this series
it's a warning, but v4 I have it as an error and with the 32-bit issues that
I found through qtest.

I share the same concern as you over making this an error because of compatibility.
Perhaps, we could go back to the previous version and turn back into a warning and
additionally even disabling the relocation all together. Or if desired even
depending on a machine-property to enable it.

> Also, we'd need to test a bunch of old
>   guests to see what happens. Which guests were tested? 
> 
Do you envision that old guests would run (or care) into this sort of 1TB config? Mainly
testing more modern guests on Linux (>= 4.14) over this last set of versions, and in the
past Windows 2012+. Let me be extra extra pedantic on this part for the next submission
(and report back if something odd happens).


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E86E6A56
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:59:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poog2-0002BF-Li; Tue, 18 Apr 2023 12:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1poofs-00021F-58; Tue, 18 Apr 2023 12:59:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooff-0008OD-A9; Tue, 18 Apr 2023 12:59:23 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IEwvZ6016680; Tue, 18 Apr 2023 16:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=haEcCyjGYt4akW4jhqv+dUp1CjLdsBTDANQfR4Z7bq4=;
 b=DjmVScOV4aF88yAtMjD3RFDkgERl2zIlR5jG8JqriNcEd1pOEZ5xDEYa0bBCmiIx1N9E
 iUJ2IHsmdcJnopmVHICwggNbDU2MK/s/ceZBJ4kKLhxPBZLX6x/LurZoR3H68LDKYLom
 tQ4e8c4/JJ5/JMaG6JnTxR2Lf195MQh8b/ktJFKABodGXOJSRbDyOblYa0GN11T9I6hf
 bXKoDv9NCYgm9NPVZ+hBUkyrgrF8bu8vTy5MOHBO1aslm1/War0pcLY06MYbdmjLpRYt
 kIaMKlF3bilWX71Y5Y8XheLAIKfB9wmFVKDTQPY5vdxKmn8AbYgVltRHA2NWwvCoOWCr ug== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjq4693d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:59:07 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFWNqo011369; Tue, 18 Apr 2023 16:59:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc5hg9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:59:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx7i4eGRz9f2zQm2jVEFrdecww60msE0YG0bmMvh0K9i/BJUhgGshV0L/62V4Ug2tmtbQQsW4KdcA5418skq4XtArlA7BPi8wJNeLTAlRELZ5Xq1i6uvxjLULANL3qSgV2a/Wx3RRlLhBhFqepxscBb55FcErXD0k8q8VFORk0kr3emvAfeNjEZn5tfqIx/hsFsbUPFFpSFJpfjflNGKcRqLoDs8c3g0d92kdl3r5z63XHxRXudck9rZBRmUsIuHL+yzT6RqNsgF279ALEseKw8gpZ66vXbyQ5OHC7LoRhTNttcTPoSS4Ai0Cny8xEkvBAPTrSUVsUL86S/mO7dyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haEcCyjGYt4akW4jhqv+dUp1CjLdsBTDANQfR4Z7bq4=;
 b=mV1HfYby0gDAyikBSCyFTDrmfDiNJzw4KUXFE1uLZOmfx/6Xvv7vQOgTQWfJ1XC2b407qF954RTD6eL+J2CL+4NRMpWrwdoms5WGUaqGgQHRDNW4G8PwskETteFQUQmhCVc0QglAOCVjHKtMojVIdvR0HdR0K5w+bdHnDMwuAG46KHS9hBvKfp5xKjaOv+tWCYU7VUvkSIdsm2HEYD2KSHZMgMofbAfa38u9HjXzhFNloqzEM6lghg214xHvWuK8Ev5fASyqPVPjghvQSsbtmG6556clzKgrnAHTI8kFSXa4l7J9b9cNelwv8lLZjilKMpwxPs7lsC7oXpn+9F/Plg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haEcCyjGYt4akW4jhqv+dUp1CjLdsBTDANQfR4Z7bq4=;
 b=Qp8PXbmhUtonLEIrqduvZw7jE01LJZZzJ8vhJDe2SZxb1n/hE81bqQ0//1+o6Nw1gcBwD5XWVkQsPpceMocExU25bI6KDMauph5DNRwcGbR9Qj4g4QMJWmq0rv6cTVr6BGZ5cKQSDIMXZql0OlxXU2G9hSumlev1dBZlGId7NwU=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 16:59:03 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:59:03 +0000
Message-ID: <63de0d34-9273-9a46-da2b-5a52c2388f52@oracle.com>
Date: Tue, 18 Apr 2023 11:58:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230411180049.7566b9aa@imammedo.users.ipa.redhat.com>
 <20230412095836.199539a3@imammedo.users.ipa.redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230412095836.199539a3@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0105.eurprd05.prod.outlook.com
 (2603:10a6:207:1::31) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|MN2PR10MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 91309dbb-d1ab-41a0-bf54-08db402e36aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/4TQjqz4H+w/ZXH4bLYWrL7lEOmlqwXKrvafrRyp9F9JGHxla9PXhMyR6jwvKxwRLijtG5pyImxSFkFqLvjiVSVTJn2wI19bIByoMJNrSEUD0diukSN2nBdbJwunCBpEzPMSUKxy0JfZHJOHltLfSGVgKXYTK0v+sx23z74Ua9hzycd7f5Nvam23B5EE8uLluCfA3FmCIqhOxUbsyIUJBRttCNFH+qi6hgy5bxtHzUInEWbq/9s7FnAYNLMm3h7AzHxiUmTfXrzeCN/DMpeXQCnyLH1ejrSci+v+h622GnVTjzsUSeXo5qBt0t4zVVtBVEZWD23PeCfqAD+0/VbmYuutTScOo2ENMQ1/K+yPFelk0lRAfngPt7uuni4mKzkwjnMPCF7ZLHpEKkeuA7xKGvnazlQchwvwZrOev5AbRRSFyM3xx2kffJH/GKRyRzkdctDAaykEwzRCZQJxZhPLpFp75j+x/Gfc77Ux5VtDXxovSOCFe9+bt+yWpRqNQfrQaJU3m1rCo3d4WlC8xChFWGcvmI7QoulZiCrkize4BSgU17KVE7H95lXF+DcjkYddV9u2JXYYnE3AnMUQb+MYuCrMRE4LhLMzNnNK4z+cKlOAKsfJtWmWM7b7j3DcrihKr3O9BaAEiTFC37KyagbBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(31686004)(66899021)(6916009)(4326008)(316002)(66946007)(66556008)(66476007)(186003)(53546011)(6506007)(107886003)(6512007)(38100700002)(2616005)(83380400001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6486002)(6666004)(36756003)(86362001)(31696002)(7416002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWh5Yjd0bFVEOS85MWRLUGVQYThMdFY1clZGUTRQRjdXbjJQMklrVWM1R09W?=
 =?utf-8?B?c1F4SXJuWmRweTl1aTNvRmxxVnFuSW05L1JMSEdnYzlvb2p1eTdlNkh1OVhj?=
 =?utf-8?B?MVBtRCs5MWRGd3huT3BGWlRaK21PcWlNVkdpYTFrTGhpbXhneC9xTmpTWG9k?=
 =?utf-8?B?T01VVEYwbjd0dU1IaFZqaG5XN01vcDRHb1Fic2IvNUNYY2ErUk0vNDcrbk9V?=
 =?utf-8?B?MUVFU2l2QTdwK2tlZDFna2tLcGc1YStpOFA5cy85N2hTN0lUS0NOKzF6aWUw?=
 =?utf-8?B?STRGT2EyNm9RMithRGJHZzd6L0ZlRDhBUnpUWUJrNGxBZXNzZkhwSVMxdU10?=
 =?utf-8?B?QTZndmc1V3ZuS0liR1Q2WWlFQitYQTVNS1ZMYXlQZWY1K0RJZ2xBa1dTOWxj?=
 =?utf-8?B?c3kwaHkxMGhHWnRmT255N203eUxPRTVGY3JKZXBDTkc1RFdhc3grVWtRNmMz?=
 =?utf-8?B?MkVNRjVhT1BCL09QMzRQaWg1YjJheFRaRnlBcUovclY4OThnVkdYamM0L2lx?=
 =?utf-8?B?M1VwY01KalJMZk5IeVM1TlpCWTlzMm1xdFk4OW92Q0FVTGVzNENYeXB3aUJD?=
 =?utf-8?B?QzFOZG9NRUZNdzE4UnA3K3RqWTNUbjUycWc5dU11blNMTERpaVBrWEFuNzhY?=
 =?utf-8?B?RGlZUUtxcnE4bitLb096SHE0d2R1am0zbDd4cEFrZWtFbjRXd20zdExsSERK?=
 =?utf-8?B?ei9HSjFZa0lrTWxrcG9WZ1pxK25KbWJKczF6RTF0MVJoZFJRVWd1SmRNSjJ2?=
 =?utf-8?B?K2h4cmdxVk5RbXVrL215azNSVTd6bXNTRG82ekRSWVZseHFyZm1UK0lCMExu?=
 =?utf-8?B?US9mTnd1VlNkTVM4Q3B0bTVibTdBVnE3VG4wS0NEVHRDSHNSRkVVbmJJQmxR?=
 =?utf-8?B?dTFmZXRPVk9mREhkVStubmN6SDRRaENETk9OK3BicU5HcUZXZkx2QkZhUmE1?=
 =?utf-8?B?S2VVaUJ4YVZLK1JSRUNOVENDOFlHVHJ4WnFqbmlGNS9xR09GUk1La1AvanRX?=
 =?utf-8?B?NmlkbzVGN1M2QmlFdWxuS1lPYzAwaFFrT2tkam5BSVpmM0hQU0YzRnYvR1FV?=
 =?utf-8?B?UW9laDZEcXVJV0FEbkdYYjFabTZjNEFPWGVmZ1V5b0RERmV2WUp4NWpBNHhB?=
 =?utf-8?B?RzhTcUFsOG43L1R1enJLZDNXcExxSk1zK1A2V1hhczlhbEJDamdyWTBoUWNY?=
 =?utf-8?B?Qm9RNENCTWYycmFmVnhvR2dmUCtxRTdXcUoxUXQ4QlNyRW5rQmRYMzV0eGZW?=
 =?utf-8?B?SVM0VGErTVk2ZWJ2cUQ2V1g0TnFCUWo3MkIrdmU2R29qZVpCK1F0VmEwWGtl?=
 =?utf-8?B?K3QrVkRhTWZNY2drdU42YzFMcU8yWFVNZThmbDVZd3cxU0ZKRWloRENuMWQw?=
 =?utf-8?B?RGNwYk1vbmROQitpdWxoUjk4eTAxWmFvZ3ByODVjbmkzY3R3RXNDSW0wcTlr?=
 =?utf-8?B?U1Y2TFVET2Z5L3RzN0oybkRJb3YyK09ueDNUM29NMG9LTlhncFlvZ1NjRHF5?=
 =?utf-8?B?SjVSYmt2ekNXV3lqYmpEL250V0VGczIxQWl5eUhYSlRnMzZnVWlnZW13eHRh?=
 =?utf-8?B?blF6Y21hYUM1U3JzSDk1K0V2TEtPS3N0NFFIOE0yWW1EY3NKV0hDL3JDMlhn?=
 =?utf-8?B?TFRRZDA3SytsSWJvdmd5dVFPREhRb09BYU1nQTVvQVczN01oU2haakVVNjVw?=
 =?utf-8?B?TWFaS2xoV3BqRmM5dGk0K1FPL3VwWWN5M2g3ck5Fc29TQVlpdyttOC81ZTdM?=
 =?utf-8?B?UDRZeDMwd1Q3SXJybmhqNUE1dFBBUzl0T0xRRTJtbHBUSHdIWGJvK1Nqc2xt?=
 =?utf-8?B?Q2x1NTRMaVppbzZLS0ZqSElxRmFGcFREQ3pRYW9Qd3Rsb3ZvZUE4Z2dJdE1x?=
 =?utf-8?B?ZkViaTU4dkxZMHVWc3gwVzNMUTFiQ05LQllYYWJSbThXZUl1cVRIQnhkNXNT?=
 =?utf-8?B?T0QwUVdHRjFvTnRmRlpSVk12bGxxU3J1Tkx1TnlCZTdFblBHWFc5ODZqMEdu?=
 =?utf-8?B?VTJwSzJqdXc3Szk0ZDJ4S0xBczVDMk1maFo1OElmMUhkcndYaGIrZ1p4Z1Bq?=
 =?utf-8?B?bjltaFFsYjQ2MmJzeEtYWTJDWmRIN1BRNW5wK1hDcjA1Z3dXeHYzNGRTSlU4?=
 =?utf-8?B?QzRMK2M4QStVRFF3cG0zT1lBVjhWVkU4Qld0NUZnNk1qOUxWSGJteTFzZDdm?=
 =?utf-8?Q?II7rypJl8VcuIrk3D2m2msQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: K1H6DiCtqeV2d5zq2PDsUFnN030/I0qFuu6tx9ODFcQ+NMk8h/FMaVJ/+AMgZ+nlRf/zxU3in6x3KKbWtIOmVnkYkrgWbNPvQmtHHqLa8EzQLqKQTi0KwrQbH9gKICcBcPrgGfZdoc9MSj+eCU7Lc+adV7Pze0iSUFg72006Tcq1e3HbS/lpN7h9igr0HbulEEkDKz3edWZI1FgxEk7ZUy7aJbRC7a7OMCfXgi2/IpDWCYX5xIf/UvsK5VB7ZFxqa8tNha7y4ofardJmzxqjBsOtOhuvY1/B3wzklFgu5ocy9apetw9QYCMBX4vhAJHKjj+M7oVm+NJniHodyZSPXCBy9CXm5reZ1BgGxmh4LPSxoakUHc6DS7sU31lqFdWDmKInPxMOyrUmdo9vgDU9y/4OpwxZlGTcwWVV5vwK5Df2/dRiNuKJLkzAlB1+W0VO2J8RJLJfAawjaDqBzA3KAn/GZktzPOxSJkGeqHU4M9DfC9PYZPIw5GC0swpDNuDoPimkbbEI13GoeQb3EmJZc9M2pZ/OQgg4My+U+kGJmSVaPp7CuH5lruadqfq8aWNasnqmh8IKM+tkuq983HesGzkvxpIK2YI9Xt/OD/b5RPtlFxygUU1QepDkzFVWkYuWArBFjVFL6WMco3ZFL1d4HUJiXoWdoSMoQr7IiwVu2Ymz3Hci1RiwKWSplmqPh1WMHeqzne+4n1KkWON1RX3j66qY04LFsL73ldvHfbDwqyF3Wzi/9eP0U4m72ZRM4zP+kkAha12V3ZvkXcYQwqHBUCFzsTXXVP/AIt4G/fdS57pt0fr4TepFhTrc5pSQuIkBlvHTx1hCvObQR0VZaxaOF34W726/RfRJgc2ef63sVUhPx6aRZo1jYDp4+i42kJ1Uexu8VtIH+h0TyVAzcS7k9Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91309dbb-d1ab-41a0-bf54-08db402e36aa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:59:03.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bSNOxR7C70ktfoSz7t61hZoYoFO3pIzaFHNlkO/cOo9/KYQGhYr5HNk/hQaWccF4V/T3CPQti/0fQbrE8jpAt+5+PSTjL2VrxEDZsxtwIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180142
X-Proofpoint-GUID: TiO-s7Rg298Xvg-DHxAUeeVkHcQBbwba
X-Proofpoint-ORIG-GUID: TiO-s7Rg298Xvg-DHxAUeeVkHcQBbwba
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/12/23 02:58, Igor Mammedov wrote:
> On Tue, 11 Apr 2023 18:00:49 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> On Tue, 28 Mar 2023 11:59:26 -0400
>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>>> Currently i386 QEMU generates MADT revision 3, and reports
>>> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>>>
>>> For MADT revision 4, that introduces ARM GIC structures, which do
>>> not apply to i386.
>>>
>>> For MADT revision 5, the Local APIC flags introduces the Online
>>> Capable bitfield.
>>>
>>> Making MADT generate and report revision 5 will solve problems with
>>> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>>
>> So spec mandates 3 possible states
>>    00t - not present and not can't be added later ever
>>    01t - present
>>    10t - not present but might be added later
>> and outlawed 11t combination
>>
>> 00t - doesn't make much sense (i.e. why put such entry in MADT in the 1st place)
>>
>> but looking at kernel commit aa06e20f1be, it looks like
>> ACPI_MADT_ONLINE_CAPABLE was introduced to accommodate
>> firmware/hw folks who would stuff MADT with LAPIC entries
>> for all possible CPU models, and then patch it depending on
>> actually used CPU model instead of dynamically creating LAPIC
>> entries. (insane)
> 
> on second thought, QEMU doesn't need rev 5 MADT with this flag complications.
> Also I see that kernel side fix ended up in checking ACPI spec version instead
> of dealing with MADT revisions mess.
> 
> So for x86 lets bump revision to 3 or 4 to be in sync with
> what QEMU actually uses.

If bumping to only 3 or 4, then there is no need for this patch series.

>    
>>
>>   
>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>> ---
>>>   hw/i386/acpi-common.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
>>> index 52e5c1439a..1e3a13a36c 100644
>>> --- a/hw/i386/acpi-common.c
>>> +++ b/hw/i386/acpi-common.c
>>> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>>>   {
>>>       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>>>       /* Flags – Local APIC Flags */
>>> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>>> -                     1 /* Enabled */ : 0;
>>> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>>> +                     true /* Enabled */ : false;
>>> +    /*
>>> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
>>> +     * if Enabled is set.
>>> +     */
>>> +    bool onlinecapable = enabled ? false : true; /* Online Capable */
>>
>>> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
>>> +        enabled ? 0x1 : 0x0;
>> align the last line with onlinecapable ....'
>>
>> move /* Enabled */ and /* Online Capable */ comments right to magic values
>> i.e. onlinecapable ? 0x2 : 0x0 | /* Online Capable */ ...
>>

Done.

I've gone ahead and posted a v2 with these changes; keeping MADT.revision at 5.
eric


>>>   
>>>       /* ACPI spec says that LAPIC entry for non present
>>>        * CPU may be omitted from MADT or it must be marked
>>> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>>>       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>>> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>>>                           .oem_table_id = oem_table_id };
>>>   
>>>       acpi_table_begin(&table, table_data);
>>
> 


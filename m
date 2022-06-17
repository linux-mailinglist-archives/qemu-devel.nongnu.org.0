Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D054F867
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 15:40:01 +0200 (CEST)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2CCe-0003AZ-5Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 09:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2C9v-0000Yf-Hw
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:37:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2C9s-0000qX-VS
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:37:11 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HBbc3Z032716;
 Fri, 17 Jun 2022 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=I1ZuQ4QF5u69kiJp4Qk0rkjaFJDAhXIkmHEUYswTCdE=;
 b=vkEd7lJrfNy2NqkXmIssyxMmiSajubJbfa/jAbsL6RbhXQAuJiLwzHYVlpznmHS6wMBA
 2CTMBVPHLkSdHo5cwQtxVfEd9OGw7jGGKU2CGZvM62MRPaNxQSzSEWVGPtz0HN+DKgZO
 Sx9qRru7/nB4mXWSKaXDytLysGdRXTUdqtk946Gqjhd+bDtXa4q+EvV8PncsNSzM/2G0
 szGp250nRhScKjTxkJWeY71BftqcpuW/4A0/27Ysk2S7OI5U1QRmuIThhfs5CDue4CKx
 5WgW+bpbCl/bdPZdlFkXU8tWi0/DAl+4/T5x/vS7MjUDWOD/Xwt8NvNYHhXtybcNoKnS yg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2x0k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 13:37:02 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HDWJEN031148; Fri, 17 Jun 2022 13:37:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpr2cebrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 13:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3+UfucXAZNtcf8b5uF0TTiNkzm5mhoD9/lwQeVzPPQ3PH3PTtIYzZSvcFEi4WBMHkInjAiX/0l/Ul8zbyd+iNr/l+lJ8NNCKk4mTpnbANkWdcvE5OpWmImqRE3qiNk7wFsC5+cw6Jh51Pd7NVm/zC9snURiAiQE30C0luuCmc6E/HbCsAoXWEHDdq+syNuGhDMX/ilgrWmtW+mZRym2okD1FRNtWPeeZbCoU6E21JoJuZChtLqEt7NFL34TA+nE2++Uum0AdfMyu/BS9NDK8DbjVWT/gWfEHC8bteQ6aBH0t40Dj8YCqtVpyt6g+jRWFAhX/CI5UOKc4omFWRiWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1ZuQ4QF5u69kiJp4Qk0rkjaFJDAhXIkmHEUYswTCdE=;
 b=c9jKhGcp4DFKby9avEnyXDi24YNBp1z54dJoIXwzw8M3oMnUhuZVl/CzBvB53WUnQEodMBxCzoXX/xrzTltlLYnKi38+Wn/S/tLQ1TKQnH5QFMovAWXqKEU2pRNb+8iqGF2trOOK+5bJXyylce9H+IxcuHqrUUKYTsxg+eBuZrvV3AE2ucapgCriJafiLy9j3cKV0RyNlKx4X5nKA1m3dNnXocF2ju4eKDa27OMd8Lxh4WsedwQn1hqQMqE6QN7vRRjmwhhci7yeg3T28PrLLgKy9QuyO5vVH0DenO/uGuuV/Lo8TpOw2TdGJAH1oBipIkya5ZXNWTfrkYgtTVhE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1ZuQ4QF5u69kiJp4Qk0rkjaFJDAhXIkmHEUYswTCdE=;
 b=vUyj2Hfy3+DWX4Lfn8CcmvnnU81wZ+q3YsjKHqPMerKKrUsQIfrYe3EPb0s2HxgdAX4issBo/B1a8ra9WdgMO3N4HSNfZ3+pXP8S1LoPSZ/GUoyuGHSGxTHy9TPSl8IOpDKRgYxGesqKuqM+InLcax85R2qkQIxgmn6dChGGQj8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1459.namprd10.prod.outlook.com (2603:10b6:404:43::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 13:36:59 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 13:36:59 +0000
Message-ID: <d3f9b1bd-5867-9499-d5a9-77192bb2b608@oracle.com>
Date: Fri, 17 Jun 2022 14:36:52 +0100
Subject: Re: [PATCH v5 5/5] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-6-joao.m.martins@oracle.com>
 <20220616162739.71f3f2f0@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220616162739.71f3f2f0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:208:55::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab73274e-8106-41c2-f2d0-08da50667427
X-MS-TrafficTypeDiagnostic: BN6PR10MB1459:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1459F44E804099C9A247173ABBAF9@BN6PR10MB1459.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FrPchK402yKGuGMZr32J7sGAYs9nEheNqT28hQ9ED2UAXg/+/ja9D5vzKUA7mrAayPzqDy+oGsDGy9nPFkIyDl5WqMv1npumMp+EEx4JttV4DARDmNgwzg6yHMqEvfJyEOeOLHzpDxRQfQ5JJO+fx4QPDJqYCr+eYdU/kPE5L8KvamzPvC6lt4+yHdDtqK4K6A6b2Wm5nC+WvS2MaIKwS8jfl0MvhUGnIGTMArKVOKyAOosT2CmPWyXtksnUpVMS+cAmdjyDuUHMDKPpOSEC0O9lL/JWDb9fbCZsoSqUIRJQRxoORNeNVbf1vdcF+ILNmp+M1jmfON1XgavQSCwimjuT34hPWUIn7U+LdMTHGILGgN/roagq5qS2m35Z7yAFpy85pXfMR5VJh64LxJ80ZEMF0QTli3SdYl4cZ61Htl9nDLf+BVIBfqH1Sgmmcp5ikoGLcHjM1bubQVUtZ0uX2er2ysIzwN9rRKXYPc8NJ+0U80F5wZuEDErepei47UE0D1pD6nhPCrbtLXXEKp0NXQYEvNnM8O0D8WVl9VP8fv1sDCKRRCXVa2+NQb7nVMLfs8mCx+SYFtxfA+5+TsKymHIwmXeAMU3J8yRsUNMxn8P68kYLGGKEGtLJkFIrMOcjaIi1bTUvGKbKWx0jrNgyW10Y8deo0RPnP4F2uhOY2w2hYFMug/gYQeW9uWCoHr7voNZdWtr3OIeXCOIB8CNURQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(54906003)(4326008)(38100700002)(86362001)(186003)(5660300002)(6666004)(31696002)(66556008)(31686004)(2616005)(36756003)(6916009)(26005)(8936002)(66476007)(66946007)(316002)(7416002)(6512007)(83380400001)(6506007)(53546011)(498600001)(6486002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFR4K2F2MkhmcTJGNDJQMllVUnNxQThkdjIwZmMxWklTRSt1eU8vbTV0M01a?=
 =?utf-8?B?bFoyYVNiVXgrM05aZjdmVWNMTmNDMUJGVkhpYjF0YmN6YkE2aUVuT1Nndk5P?=
 =?utf-8?B?akhJMlhMWGFhNkpwemtaWHhXdk5VZXJXem9OSTBYYUpPT2NlTytmdzd5K0Vi?=
 =?utf-8?B?Ry9HV0JVUWU5bnRTc2dmaFBQREZ6TUJ1Z2ZiVENSL0o4ZVpoUk5hWlhWYTNJ?=
 =?utf-8?B?Qk50T0l0L1FkaDlnMHFnVFZLb1NvMThXNEFxMWJFbmtGVW5BM0NneEN4WDdo?=
 =?utf-8?B?ZzN3bkxZVDFCbEo0V01COWgyMmNZTU5UcHJNMEVyN3B4S01qUENTcDF2R1Yr?=
 =?utf-8?B?cnpYRE9lMmh4VFVJUSt1K0xoRUlUWExCVXY5Q3ZLemFpeURKZ3hvdzh3QTN5?=
 =?utf-8?B?UCs5T2ptZmdibjNzTkpRdW9HazFIcDFJcjA0Nk1Kb2RpdjFRVWtadFRNK1Uw?=
 =?utf-8?B?ci95ajVQMCtEMmUwUXNTK2ZYYXNjbDVpTGFLUWYyTyttVm5DR2o1N3BFczlS?=
 =?utf-8?B?UFgyNDQ4Z0VVaHJNdHBxYkVsZ3ZnWk41S2ZDa01VTzNFZUljNXdXWHlyN3dZ?=
 =?utf-8?B?NFRVRmpISG1ERFRMdjRGN0ludUZFTkFsalREVFZmcS9zRU9BQVpKWkJCSjJ1?=
 =?utf-8?B?ZzJMVU9TNm9kOWYyTldtY2pOTjdacDM1S3NVT1lOU1ZXWk1wejF1ZFd5VEZw?=
 =?utf-8?B?c1BJMkpDWkQzZllodnFPT3JWQ2lVeDRuRFd2ODcvb05QNkNZWGFLR0kxWGRs?=
 =?utf-8?B?WkMySDhjVi9PSzMvZWdIUkIvMWM5YkQ4WHBkdEpjWXQ4dlhKMHZmaGtsTjhK?=
 =?utf-8?B?WVhRTjU3ZlZLUldkemsxak9vOVNYY3hEQlE4WE56SCtoUWdDcERRS1BXMmRh?=
 =?utf-8?B?SGtXWjU5OEJaYnduQ2JXeHFXZGhWTmU2NG9hbEsyL3E3bzZsTGN2U1R6T1ZP?=
 =?utf-8?B?ZUZNM0ZuZHlSM0FtT20vdDhlY3B2UnhQb1JGSjNNbkFHSUNVL2RKUG45Nzhh?=
 =?utf-8?B?enpDNml3WEY3eFNPb1g5SGd5L25KQmQ5VVFCN3V5TTNKWUZ0ZUZ1YmgxVnRC?=
 =?utf-8?B?c0Rub0lrS2N4VkFxZlA0Mjc2L0hoTG9JbnF0VVRoUUdMbExwYW1FTE1lWjcx?=
 =?utf-8?B?S2YzQ3VFSGw2bmRMQ3hrWHEzY1p2NzJKejZrTlcrVkRsSWpKWFBCeFovaEVu?=
 =?utf-8?B?SnNUbnV2Ty9hWXRGUU9ESUhNK2l3VkFLNXdFV2VJMzFDbGhrOHNtNVRVNHVK?=
 =?utf-8?B?MzRqMDJNdzZPOUgxMUpKZCtOL09FSUVySTZZVjV3T2FBTE9lNzlHRHpUNHNK?=
 =?utf-8?B?OE1Ea1QvMWFQNGZLbVVvL2o1WENxL1NXbHBMYzJqMStlS2Q1L1JTNVpRam9Z?=
 =?utf-8?B?c1Rici9CU0Q5TU1HclNWZElWKzZQVFA1TUF6bk10ZUMzTEVSMUF5UUk0SFJm?=
 =?utf-8?B?MmFXM3FPazlFOXo4c1h6UzZtVDNXZDRmL2c0L3hsWWtBbzA0dXhleW1PdUpi?=
 =?utf-8?B?a0NyU044UmZaNEU5dy8yU2pMTTM2am02ZTNjT3kwV240VTNGQjNQK29SL3B1?=
 =?utf-8?B?bWxjM1dUVWxnL0ZHRDRHQjRLTUpzTVdGUG41OWtPQ2tVbU5KYmZSbkhDU1g3?=
 =?utf-8?B?eElhRTlyOWNydlViVThjREtXcmVvaWtZSFhaalJpZ0Z0S3ZWYUpPUnk5ZS9M?=
 =?utf-8?B?dElTUlZ6OWdXMXlTTlM3dlVCai92azlGaGsrWmdmSkxMeXhCYVcvazZXS1pO?=
 =?utf-8?B?Smw1NnJJOTQzZ1luamZ6elRtUEx5VDVlT3RycEV1RjlET3JteU51YitaZTZm?=
 =?utf-8?B?bTQ4eUY0QlE2UEp6dFh2bjJwZVJDd3czQWRGREwrMkt0bndCZjlxSVUwdTRx?=
 =?utf-8?B?SXdFOXVHcHBJdmhzZUpETWV4ajVjNjZGTlV2dTBVNC9NZUNHZXY0dVc4YWFw?=
 =?utf-8?B?TndaZ1N6NDdqNS9zdXgvQVJIQ3hwQVhWM0tTL1JScEk4Z2RRNVNIQ1JMc2hN?=
 =?utf-8?B?aEkySjloakJXZFNkL1hlZFI3L0laWlpPY2N2a2NBenpXbFhVKzdkcXY3cUdn?=
 =?utf-8?B?MXBWZVl1MUkrclNKaTh0R0FjWCt5YXRBRWgyTTdlTWVIYjUrNlhla1NaTlJX?=
 =?utf-8?B?RDkwdC9NVlA5VGdFV1NyUEFjMmEzQlBaYWVpSDdKRVpyY0NtaGZGQk1tdmxK?=
 =?utf-8?B?MWVSVTdldWlWNXVSM1RROFlIV1hHd1JzZ1Z3MDljMGNmSHIwZFZqWElwMlJF?=
 =?utf-8?B?Z0N5aVFVcEhlZjhCU1Q2ZW5uUFI3QTE2dW95YXZpcmFLWWZxbFREeWtoaDJH?=
 =?utf-8?B?QVRkbXNRTWtFR0syemxpSHl5VnQyMFMyZGVuMU11Mi8ySFNRaXl6Vk4yeEdn?=
 =?utf-8?Q?Bf9nTTN6JPUGWSYM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab73274e-8106-41c2-f2d0-08da50667427
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 13:36:59.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+1OnZ8+1AjbspQMn6Wu5lTvJMOUQdX3zKP7gBsXxIghOgYk2cRHZs6+TRc3MuHZNpcAUPTWnUWPdXgvbRmHTuo5MXl/0faOBx1VfN+H1lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1459
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170060
X-Proofpoint-GUID: mA4sZhZl0-2EA_QRAmxfhPbQFQ9XkVCj
X-Proofpoint-ORIG-GUID: mA4sZhZl0-2EA_QRAmxfhPbQFQ9XkVCj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 6/16/22 15:27, Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:32 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> The added enforcing is only relevant in the case of AMD where the
>> range right before the 1TB is restricted and cannot be DMA mapped
>> by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
>> or possibly other kinds of IOMMU events in the AMD IOMMU.
>>
>> Although, there's a case where it may make sense to disable the
>> IOVA relocation/validation when migrating from a
>> non-valid-IOVA-aware qemu to one that supports it.
>>
>> Relocating RAM regions to after the 1Tb hole has consequences for
>> guest ABI because we are changing the memory mapping, so make
>> sure that only new machine enforce but not older ons.
> 
> is old machine with so much ram going to work and not explode
> even without iommu?
> 
Depends on your definition of work.

And that's the purpose of this patch, to still allow graceful
failures on hosts with different hypervisor kernel versions that
would use versioned machine (like pc-q35-7.0 or older)

e.g. if you boot a guest with pc-q35-7.0 on a 4.19 kernel it will boot
whereas on a v5.14 kernel with same pc-q35-7.0, the memory map would
stay the same, but it would fail as a >= 5.4 kernel will validate
whether IOVA.

It will 'work' as before for old machine, meaning you are dependent on the
kernel to validate IOVAs and prevent dma maps or not. Without IOMMU enabled
you don't need this, but you also can't do VFIO (or the like vDPA)

>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c         | 7 +++++--
>>  hw/i386/pc_piix.c    | 2 ++
>>  hw/i386/pc_q35.c     | 2 ++
>>  include/hw/i386/pc.h | 1 +
>>  4 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 652ae8ff9ccf..62f9af91f19f 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -862,6 +862,7 @@ static hwaddr x86_max_phys_addr(PCMachineState *pcms,
>>  static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>                                            uint64_t pci_hole64_size)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      CPUX86State *env = &X86_CPU(first_cpu)->env;
>>      hwaddr start = x86ms->above_4g_mem_start;
>> @@ -870,9 +871,10 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>      /*
>>       * The HyperTransport range close to the 1T boundary is unique to AMD
>>       * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> -     * to above 1T to AMD vCPUs only.
>> +     * to above 1T to AMD vCPUs only. @enforce_valid_iova is only false in
>> +     * older machine types (<= 7.0) for compatibility purposes.
>>       */
>> -    if (!IS_AMD_CPU(env)) {
>> +    if (!IS_AMD_CPU(env) || !pcmc->enforce_valid_iova) {
>>          return;
>>      }
>>  
>> @@ -1881,6 +1883,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>      pcmc->has_reserved_memory = true;
>>      pcmc->kvmclock_enabled = true;
>>      pcmc->enforce_aligned_dimm = true;
>> +    pcmc->enforce_valid_iova = true;
>>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>>       * to be used at the moment, 32K should be enough for a while.  */
>>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 57bb5b8f2aea..74176a210d56 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -437,9 +437,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>>  
>>  static void pc_i440fx_7_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_i440fx_7_1_machine_options(m);
>>      m->alias = NULL;
>>      m->is_default = false;
>> +    pcmc->enforce_valid_iova = false;
>>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>>  }
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 4d5c2fbd976b..bc38a6ba4c67 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -381,8 +381,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>>  
>>  static void pc_q35_7_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_q35_7_1_machine_options(m);
>>      m->alias = NULL;
>> +    pcmc->enforce_valid_iova = false;
>>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>>  }
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 9c847faea2f8..22119131eca7 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -117,6 +117,7 @@ struct PCMachineClass {
>>      bool has_reserved_memory;
>>      bool enforce_aligned_dimm;
>>      bool broken_reserved_end;
>> +    bool enforce_valid_iova;
>>  
>>      /* generate legacy CPU hotplug AML */
>>      bool legacy_cpu_hotplug;
> 


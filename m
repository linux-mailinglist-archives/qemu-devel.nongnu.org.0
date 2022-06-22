Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F7556EF4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 01:20:16 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o49dv-000221-3Q
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 19:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o49cE-0001LC-5F
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 19:18:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o49cB-00018p-1Q
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 19:18:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MIPRAo021455;
 Wed, 22 Jun 2022 23:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=UcuSdzAHiVepjW7XI/UZ+Q0Aa5AVyIMv+47Recv9ep0=;
 b=NlsOzVO7Ky/SXErN/9JzgwLiu8//TwiaitCVNx/1+lcjJ72FV01F+1x9rTfFQ/OzASdK
 hNLLS7js4F5OZC9DIQGE+gdnmdxm7UPYD+yXIM+KkuQ34CyjGxJ5rVEsYJxuEBoV23TS
 qtLbtP63f3pB6HMosFu3GlECodaQ5uVcNKK+u3SiN84jOpmJfF5ptv6gchIRMsRDBVG9
 S9ycCsKryLNqNEyBXqlTv7+Dqy87R9X381mCg8wpPu2vLEDwIrkbdBYLQoLaL6K0+MvP
 R9XQwUPqNk5mmtrmRi6spU3IM1p5vCd7zVz1/imYX5J3AUjl83Gu/Gd4dIuaI+zNmLeM FA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6at1s1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 23:18:17 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25MNGkUo022794; Wed, 22 Jun 2022 23:18:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtg5w0291-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 23:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPe4NqSxEfvkYQDHZIYA4+XOF4kAZ7hSq+3xXzH1BGLEYBZC4nATIAck1Dkxwx17t1GGvQCqJhykP6Pv0Yte78l6EKhe7rkt2GW4jk2t+9oK3UjYnh/RIV0x8jF3iassMtwyoLcG+fQKKY6wbr/6OQz0COPJT8k0PLt4p5kKPwZdE6V7moY7DBz+3jbVZy9nmX19Tj8lNDW7J3kT50IgOegjCl/zwr/h5S44RLpoJMUfSMLmLEx1bgoXlxlPwpzosUpH3mYtzxDkAgBpBrpfFZrVmaWbtESTvZNTdGoAwS5cOWSUsQPnGa/jcMipCr3UTjg6CW9PmiZwaGtWwG71Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcuSdzAHiVepjW7XI/UZ+Q0Aa5AVyIMv+47Recv9ep0=;
 b=FMxvM1aKH1AGsUXlb5GSvayluJGJfw1IzJEpFTvfLXyMgNa6r4Ni9hCAtLpweea5G0jsvLfQ5r+3l5i4L+H4yxHI0DO4idbtnaAwXZtoBs1MfyTyil8ITbMd5Od73Eym5jLVbyuhq+1l0XpUsYJDdiD3wwBel1DbOlYU8q9as+HGF0sg8d+bW0BtWHcaL04xuarzFeUQnjo0g9xbpZX7o/bRKNkGH7+lvnJFcCbn85Ysv3JeYYI5CsxiLPn2HNDDmjP2+s+0OqjUB4/9YgWcJqrJoyJmF6XYDmSvjSSR5Gu5E2OTKLV5RK1HCDG9uApiDRGSxzSFEsa3wjha4pWPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcuSdzAHiVepjW7XI/UZ+Q0Aa5AVyIMv+47Recv9ep0=;
 b=D3E2/Arsc+qtnLAvQQ4Cl7DLjJcGdpA43MQqmFcQNtKh8jleEaNikNVswWBDPC3ITP0ZVMF4yipzGTJiDt8VttmWUpg6/iar97HDRqJGewfm0HlWu0D7uhxnysShWYCONtlX72ahOe9NI84eqkykkIbvOeaLpEuSKUohmMi0f5Q=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BL0PR10MB2817.namprd10.prod.outlook.com (2603:10b6:208:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 23:18:14 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 23:18:14 +0000
Message-ID: <5bcd894f-ad8e-2b39-c4a0-33814eacd85d@oracle.com>
Date: Thu, 23 Jun 2022 00:18:06 +0100
Subject: Re: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 wei.huang2@amd.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220622163750.12424dc3.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220622163750.12424dc3.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::25) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58336c3d-f98d-43b6-e464-08da54a57b3a
X-MS-TrafficTypeDiagnostic: BL0PR10MB2817:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB2817E737A54D7F0D3A4064F9BBB29@BL0PR10MB2817.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jC9aMYJWH+rnbFcb22ScZ50pn2OFoRBUVfEFqLIyLD5M21SEdqWn6Lcga9duKojZcGONj1o9S9ZgC2USi3BFPGAQOieJKdNHAXdHPHIBhL/zEzisimIAcmzZmxrWMI3/K0mdZYCpErY0noXna1EtUQFEgSmeFwsytlScndWRHsnEWBmcmjXglMpPi8BvM8VJG0+Ksqd5qG/wC0PaNreWyLYxr4sMjQmJCKK31H0VyVAIkrmmx+hXEbCgcyuwL6RQ83Y3QqdR6iOrne6m4D6UI0VJBSiijVeQ8dgzSWHrtXktzEVgJvU6QK253v9DUg4yX0ASylXxCRCkXGVk/fXamBLQKwNekw93jOHcDcv6szDCu+J2DjYGR4D53dbP0bBwQ6C6NNNvtt9CmND60fp6cuHiSLjZuIFIredQdMY6BQNXiZwET1JZSQDQXp4PzPYwnvLsidxqfzYkXRHycxZPay7R0PSpB35luUJXcL0SmfSde8I5xkLGWvDESXxQVq7hOLGJ5sFs9B7JN8TTeqPH1AYqGSz9sJhGNAH1aRxYzMwStNQnANQtodFenafFrMnWzAT5/20n1biApt7yfiYxj8L37yFYb4OjCCFainaalCBz/nC74kIgSOSj2/8/Duefsl9ueHhSHW3+g929ltSOqWFQSj51xOPH4yXxfSPXYGUQJsQ66nvr1ltGj/1DxMomBYno38BdyOWmyJWsqxlW4nnJim6y/iE6VOsEmNOhChram3buBnzShWg/t96WzOCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39860400002)(376002)(4326008)(8676002)(5660300002)(53546011)(66476007)(54906003)(66946007)(36756003)(41300700001)(8936002)(66556008)(6666004)(186003)(6512007)(6916009)(2616005)(83380400001)(6506007)(26005)(316002)(31696002)(478600001)(2906002)(7416002)(86362001)(38100700002)(31686004)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTlZcnVsa1RwUW1scE1VSTBIbXRsQnl1VDkrdTlKcEc2NEdmRlBwcnBVNWMy?=
 =?utf-8?B?YUpkTzZ1VU1Sd1dna3ZIZzZCTTRlNlZEZi96YVhjWjJqbzR0dWZnWU9IaEVG?=
 =?utf-8?B?dEVLbUd4L2doaSs1S1JpOHM5MUpzd01FTUpRTzBjTDE1OVZDbUtsaEhQcFhL?=
 =?utf-8?B?ZEliR2tsdXJCaHBDeVRzcWFadHVUa0RMQlpERllSMWI0ZlBLZGw0c2ZLenFJ?=
 =?utf-8?B?anZydWlNdFVjYWw5T3g5aFp6eGhENnlkUFMrV21tRXlveUpQZWRvZHpPdWt3?=
 =?utf-8?B?bkEyWS81MEFCT2Eyb08vemN0SloyaVUyaWJVKzVxN0pXWjNwSzlzYzVrNHhs?=
 =?utf-8?B?MkdmQndlTnUybmwra3hTZEpyS3hYUGUra2RrSXNIWVE1K2hZRnVya3VpZWlw?=
 =?utf-8?B?c2c5b3hpS1FJc3FFaTVReGVaemlkMFpkUTlKa21TL0dIb2laNEVVcHdkYy94?=
 =?utf-8?B?b0tib1lqYzFWS1M1cDRLOHVhSWRsdERBb3A2UG1tK0ZsMlhONG5XZkkvMUlm?=
 =?utf-8?B?TlNrN0Q5aFp4ZDM2RG9sMGFCL2w4eTVBVkZrMkpnVlNWNUU2Wi9LNFBWdGNE?=
 =?utf-8?B?V2E1NGxla2ttK0ZzWjBBeDJIUzY2b0wzWUpSSjZXWDFESndQdW9sOVdoN05y?=
 =?utf-8?B?UnppcWFFZUdPa1Y1a2NWd2JTTlMxR1VrVGVSLzFrN3JDbU1lUlF0WkxwOTZ5?=
 =?utf-8?B?MUZzbm1raHBDekU0bkhESGY0OStkd1RIcFFMVjNIWXZnU1lvMml0Q3FHd2hp?=
 =?utf-8?B?RTUvY29qb21FNjU5VUkyNGhVclczL2VkTzhuRkcyOE1qaE5UcFhGbmN6aGI2?=
 =?utf-8?B?WmFWYm5HOXRwUW8rYXBYQnYxcTBSYWN5SUxsY3BTa2Z3SmE5aGVtVWY5UWlE?=
 =?utf-8?B?R3JsVVlCTWxUb2RFQkhyVS9Ca0ZLSHJpRVY4WTBFMWpPYVFxNnpNcHErMHhW?=
 =?utf-8?B?SjFHN21mVEdIUTJqbUt0THJ0RmJBc3lzbmxmMkUxamgrL3VSbFlodlhSdUxo?=
 =?utf-8?B?RHZjNDFTWndlcFZNTWlUbGp3SElaSmhFMDN1c29YRGg2Ky9QUmNnVG03YkJE?=
 =?utf-8?B?ZW9oK3dyNDRoTUdDUWNZYk8zcDNRanZxNGp2bUQyYzJKTUczM0lBdUhUK1Fm?=
 =?utf-8?B?eVNIMUFJY1hvcit2TlA5MXFlWjdRMm14cDFtRFk4K0E3enVjQkNlcGdLUDly?=
 =?utf-8?B?cWhPUlR3amtkTm5ZaUwzbjdEd0xabVNCdXJYekNta3BVZldUaFJjaXF6OUdo?=
 =?utf-8?B?UHpUV1gyRDZFMHl3WjJkcHVnVnZIZ2QyVXJOQng5Q0pkRldjTjQvZHp4NjJt?=
 =?utf-8?B?dUdjdFJWdEM1czFxTy9WNW5vRjNwaExXZ1lZajBHV2t5WlpQVVUxa1MzWnJY?=
 =?utf-8?B?b2s1eGpNRE1kQlNJZFFNekRIelE0ekpMVnVlazNwTnJ2cFRLVGd0RERQcVg3?=
 =?utf-8?B?cjExUFJkaHR5QkpOVy92TXcxbEdxTHVsRUN1RzFoeG1qUWpLOTRNa211UHpu?=
 =?utf-8?B?T1p0OEZteUdVRDdhZXkvNkJHM2pQdVJQMnVxbDJoRUNlZ1krV3d3cnNkM25s?=
 =?utf-8?B?ZE5pWE1rRXFZczdtRi9aR1YvTzhjM05semYyWWF6TkwyY1loMlQwdVNnSHgz?=
 =?utf-8?B?OVFmM0R3NXAxUXVKUG9LODdsNzNsNjBNanJqSU1JenFJQndwNkZEVytDNTVB?=
 =?utf-8?B?azdZWXpjcEJTUkFudlVJa1JhZ0VPVnBjQ2ZwT2haUC9YeXRpaG5zZ0lPeXox?=
 =?utf-8?B?YTA5TFVJNVZGd2luTXFON3JZODJSbnN6RTJJNStrN3k1OEpWcTlaMXFoSDI4?=
 =?utf-8?B?S1pmRFBJZTVxVnlzMFFRRUNXb29peFpEM09MeU9XWTJJTFRNbXR5djlCbjZR?=
 =?utf-8?B?SU5sdVVwQjBVWTJwRFZUYlM4RU11NVZZUC81c1FNRWVRK1lndkVHTm94VzdY?=
 =?utf-8?B?MTZmeW5WalBpUGJBQUpiZHpoNlNZWktxckxPSUtmUnZVNUVLVFFoNWZsQTAz?=
 =?utf-8?B?THFpY1hTUDlGNnhES2FRNlZ4QzBRbWd0OSswN2lzK1dMLytONXFpNXRJVHA3?=
 =?utf-8?B?NkxmdVh5aVBRNUlZZUxRczRlU0VNczVrbmc0SXdXc0laWTVrOFpKWnZSWHpk?=
 =?utf-8?B?K1NLVTVCdVRMT1lxQk5Cdy83cTBCbVVHVHhXQllkbTZUQlg5b0RBNEJuL2xM?=
 =?utf-8?B?VFNKaGNHa0Z0clpSeHBETjRMSWRzTFJOMDl2cW9vcmM2QkFTVGlLUUZPTHRC?=
 =?utf-8?B?d1pTekErY3U3NXluS2pXYkx5TEtvTHBVaW5MOCtEV3pEeTV4ZE53Rk1QVGMz?=
 =?utf-8?B?cVNaY0NSNHgzN0MyNnUyM05aS1d3MXpPbFNtbU82NVRGR3RmUnViUWtQdUw5?=
 =?utf-8?Q?vx+8TJiFvSvP979s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58336c3d-f98d-43b6-e464-08da54a57b3a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 23:18:14.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U1e+Dlv+5p1pOpna9xd8y336VElE77G1qwk3ibMEmdBxnWZt6r8lD6ROsDhXd87GIOYFCzXG7I60P7w5H3evhLZAauwARJrRXmCpzkJSjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2817
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-22_08:2022-06-22,
 2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220106
X-Proofpoint-ORIG-GUID: ZcYODezOfEHguwmPOqSuwevCeBYc2BxN
X-Proofpoint-GUID: ZcYODezOfEHguwmPOqSuwevCeBYc2BxN
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

On 6/22/22 23:37, Alex Williamson wrote:
> On Fri, 20 May 2022 11:45:27 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> v4[5] -> v5:
>> * Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
>> * Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
>> commit message;
>>
>> ---
>>
>> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
>> particularly when running on AMD systems with an IOMMU.
>>
>> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
>> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
>> affected by this extra validation. But AMD systems with IOMMU have a hole in
>> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
>> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
>> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
>>
>> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
>> of the failure:
>>
>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
>> 	failed to setup container for group 258: memory listener initialization failed:
>> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
>>
>> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
>> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
>> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
>> as documented on the links down below.
>>
>> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
>> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
>> to be above the 1T if the maximum RAM range crosses the HT reserved range.
>> It is organized as following:
>>
>> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
>>          address of the 4G boundary
>>
>> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
>> 	     to get accessing to pci_hole64_size. The actual pci-host
>> 	     initialization is kept as is, only the qdev_new.
>>
>> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
>> possible address acrosses the HT region. Errors out if the phys-bits is too
>> low, which is only the case for >=1010G configurations or something that
>> crosses the HT region.
>>
>> patch 5: Ensure valid IOVAs only on new machine types, but not older
>> ones (<= v7.0.0)
>>
>> The 'consequence' of this approach is that we may need more than the default
>> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
>> address, consequently needing 41 phys-bits as opposed to the default of 40
>> (TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
>> pick the right value of phys-bits (regardless of this series), so we warn in
>> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
>> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
>> old seabios. 
>>
>> Additionally, the reserved region is added to E820 if the relocation is done.
> 
> I was helping a user on irc yesterday who was assigning a bunch of GPUs
> on an AMD system and was not specifying an increased PCI hole and
> therefore was not triggering the relocation.  The result was that the
> VM doesn't know about this special range and given their guest RAM
> size, firmware was mapping GPU BARs overlapping this reserved range
> anyway.  I didn't see any evidence that this user was doing anything
> like booting with pci=nocrs to blatantly ignore the firmware provided
> bus resources.
> 
> To avoid this sort of thing, shouldn't this hypertransport range always
> be marked reserved regardless of whether the relocation is done?
> 
Yeap, I think that's the right thing to do. We were alluding to that in patch 4.

I can switch said patch to IS_AMD() together with a phys-bits check to add the
range to e820.

But in practice, right now, this is going to be merely informative and doesn't
change the outcome, as OVMF ignores reserved ranges if I understood that code
correctly.

relocation is most effective at avoiding this reserved-range overlapping issue
on guests with less than a 1010GiB.

> vfio-pci won't generate a fatal error when MMIO mappings fail, so this
> scenario can be rather subtle.  NB, it also did not resolve this user's
> problem to specify the PCI hole size and activate the relocation, so
> this was not necessarily the issue they were fighting, but I noted it
> as an apparent gap in this series.  Thanks,

So I take it that even after the user expanded the PCI hole64 size and thus
the GPU BARS were placed in a non-reserved range... still saw the MMIO
mappings fail?

	Joao


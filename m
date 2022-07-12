Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830705716D8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:11:21 +0200 (CEST)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCrQ-0001CK-Jv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBCiC-0008Lj-Li
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:01:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBCi3-0001if-A1
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:01:46 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C9xUO3022661;
 Tue, 12 Jul 2022 10:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=W2POB74nSJK9umbFAik1j2zBJHQJ8FrEImUwU787rY4=;
 b=LhA9cG0Mx13NI6Uef56oWbf7nRPco9qXhOvk1ZwkrsMoQ6PsMBjT8nT28gSdvi4wuM1J
 ct69mkPM15dFhju0bxzL0sOQZPTPghYzlyBUU6WFEJzl04z+VFJEJ/tsmhxVfgjf0e+c
 ojRde9de4wPwEtkbIW/wuh2TCohFaLBldRsAgFZllNL1Sd7xoUcTn6Vr3vWacfF50qEU
 sJUz0NPEPG0fPoC110jy81pNoWd2ySmBE+75GdQgUNFUflElWTVN6jZIo/FRsrVlWsSK
 VZVS7qcO6V9mK6FLgvFT0qZ3sVuUN2RnIVZ1j4l2vjYNREbLTqhiCkkIWd2NLm6Y6wpp 0Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71r165c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 10:01:29 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26C9uA54003590; Tue, 12 Jul 2022 10:01:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7043dxeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 10:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaM2oKgT10Jomu+yWQfodSPPwdNxOfPpay4e8Czm4oRh7nZbaXlo0skDsDZxwa+yfdUc3IUsPBIEERwe3bFZZfzPYYZ+ycx6zlIPzCFWj3fQXKJXW+d1h5fa+CE3Pno3EH91MGFDu7+TpcOjVfBkTtnWZsQBwKLgzSc9L/VtbY004Rn9mTi2yb5dq8dIWhpnS23vInY73Nj7Iq2m/2lkItgk8mDN+GTLWHk/zWRik83A+RbQ9ZQY88UsElyVzJH+gFxF6r90meQtE8y68oisBBUHPV+dLD8nS1JcXxRrH1aSqkhZbM6xzzfGLv3LJl1n8vp+42BxwJUtL7Ncesv41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2POB74nSJK9umbFAik1j2zBJHQJ8FrEImUwU787rY4=;
 b=Buo04tmAasQ6y1Z2fjYSsjxRqP+gwAcqpJQVS73PALcYjECb78s0+A4AIWrfQsyCzZwLHN7AvrVUhS+AOoab0LMC0ceEx3oAiomcoQxyqjej11QFLhWQhbsUxBwZfX9NeKx4q8C6bDXvqDWEi+q5DK6QOFV3vtKJO1Ncmpu2UsRKjzDefHph9mXLD/xHITyNDLjYlhzjRgAvPfwlvR7dunYIG/e6YqY0ej4IxAHIKu3nTC1FoZCHCCA+3k9lQlBIfwB4ySM+KNhjnt7BI7qA/kOgG4jD+U0ooO2peDrn7Tkdx/JKJaQvJFOMyq4n2dFdDBR5hrm+9625TIoJ3cJ1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2POB74nSJK9umbFAik1j2zBJHQJ8FrEImUwU787rY4=;
 b=kG8h5uS9eH1RgclX2G9L6TkqcTeW7LMGW86zamo7Lr2bUy3v8Prxp3l2HBUYUGIZJYsP6B7DPRNgQf11JFRWMnbncjPhlqiZdwoxHJGIUv30JdUSOjrbKZYe+eU4t66nFPzPsq+97j8VO7nkoNwZJJyPmIKZczyOcrVfxjQOGHk=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM5PR10MB1595.namprd10.prod.outlook.com (2603:10b6:3:13::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 10:01:26 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:01:26 +0000
Message-ID: <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
Date: Tue, 12 Jul 2022 11:01:18 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220712110615.09c3e303@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf00db06-fa95-4b16-39b6-08da63ed7b9d
X-MS-TrafficTypeDiagnostic: DM5PR10MB1595:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfoJ205YDn+XnZ8rZPNhc/qo2Is/zhhdJfk3sgvXIkpryYSATbhWetqcTzwCi2hMM5DE6rfS+SUUJfE+ijhA9OxcxzWrhbwt85DPIy1CJSxloqJzqAD0g73wXWoI7ooLFwnXt6sf+9ESHQ/+o+qHBRj6REgKMQSL1B9IhymqiRTy68FHCjB+Dt4H5BF08oPcxki05oLfWUts0T65jMvbGfUeXyYNEpO12HUNFjKxlfRWa3/Dqp0bKy98VXfVkH/UIw5pk7nV603EGwwnmLCSbN7AQltf8/RzlcpZ8qsM8r6hd8lGWTIdqfEajL7lmRIaueEZsMiDTyj/wgLLxTrFyKaxewKWfy5n+WGHvgL8lXvm/ukTFrGJL3JdAxtDBbeVhrDeVXaJN/vF6jyzAYq85Xg9wPyLGDdHaXZTQYh+T6EAQ9MYMdDrr0yiqdGpFo2osvtQyXz6s6sroQbR19PAINeUcC7sy1wO33IHqtf5cNsIrCzsJJYedetwn2vueZoIP3P0a9lvEa0kkPmtmgp4d9gD5hfGiVt29QnRY5PnulKulFAwpI4D+xW9OOjcKzhQbz+kxB5YbbZF/iK/LYCLuP2rvjPqjk+kSJ2ym0aMPLlxKnrKltN+NfN6A15ca5MuAvG+OQ5Ijm7TMzEi+4IAv8stEl3lCUolkbmrVtv6sC/xxj0hvY0tj3G8H7UUJHwwD7aNPO+CMcjmlbu8+aHbVvOpo9ilufh6/VurVE8GEMzMAI+XJUW9S1uPn3R+7w3GJfT//xOZmHfHwm/ntV/cyWTSMBpZAWIBs7s0/KiDKmffs6LjiPtdQ6u9rlDU7DVMJmdpDWfELX3oKIuYEekrCr9l6oWJ3W0LIcMJv+Fz2aek1hTTIsABMksrnZB9u3zVb++xQVN6C43HjF+BxhfVvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(366004)(376002)(396003)(346002)(186003)(38100700002)(83380400001)(86362001)(6916009)(54906003)(31696002)(4326008)(8676002)(6486002)(66946007)(66476007)(66556008)(316002)(478600001)(26005)(8936002)(53546011)(7416002)(6506007)(5660300002)(36756003)(6512007)(2616005)(31686004)(2906002)(6666004)(41300700001)(966005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxsWFJZUTJDcFRTOW1NVHBqdi9mdXcyZWljY3FFOUdmaGZUcUdLNGpJY3Rj?=
 =?utf-8?B?MHVEZGlIcVpPN244amVOS3NOOW9Tb3YvQkw0RHd4Y3pUeGtFaDNta21IMkNm?=
 =?utf-8?B?eUlMK09BYXFsUUFISE5HcWFvamJtbXJjc0Z2N3p4MWFCMjZNaXZETE4vSWVW?=
 =?utf-8?B?SzBjUTZ2bjlkU2dFV0lKL3YwVzFCSDVCeE0zSGdDYTRHSWVGdm1pRHliTUds?=
 =?utf-8?B?WTlxaGhmb2oxMVFtR3VrbWFDRjRmZVhibmpxYzd1S0k5YlZBTGplcVMrRVkr?=
 =?utf-8?B?OFA2OGg1OWI5SW1mbWJjdmZLOUpzWEMyS1h2cE9idGVDL29QT011bHFmN1Ny?=
 =?utf-8?B?Uk96UUp1RFc0VWorczEzZmEzZnZkcUZnMVdmQk1kb1VTamhOUm5IZUxXRjl1?=
 =?utf-8?B?eFBadkUxTDVES0gydldCZzJpejFCR3MxTnBUUnpwdk5GVXkrR3pGQm9FZVU1?=
 =?utf-8?B?ZjV1Skd1YXEyQjF4ejkzMzF5NElVU2Z3eXVublE4VndycWxBU3RpcXhEY0lR?=
 =?utf-8?B?REF4TmcyK0tBZHExMjU5SzVpMFRZQXhqUXd1aEdmU3doeDA5V1dnUk1TQVl4?=
 =?utf-8?B?WkNrcTVTalVielZWNTRDem5FZEVhNmZYS0VYQTJ6emt1aE1EamEyd0VlREJn?=
 =?utf-8?B?TkJWOXozek95cTRZd05iOWhQem5ubmR3bGZlb0dKclZsNWJ0L2JRc1NXUk9B?=
 =?utf-8?B?Unl3MUd1aXJaVlhLNkU5N1ovamNXRG53c2s5TjNzcGtHRnRIa2lLZ0g2Z3ZC?=
 =?utf-8?B?UVprTWVscHBrK3I3endTekczR2pEU2RPS3VTWlNSWWNwSWdSWkRENHJiTHg0?=
 =?utf-8?B?VmVGK2pRbEdLSHNrKzNsQVZ5TEl0UElnTVJoVFdrSFI0WUxqT1hISmI5cFlU?=
 =?utf-8?B?azBQbkphVnkwdXViWkZmYU5MZVpZZmZsOXVMMkVoVnNydWdqSk04dTZ0enUv?=
 =?utf-8?B?RmJRYkdkYUI0QjhmcCtTdjdqb1N0cU13bFNqUUc1cGYxTlU2YkhqdWJkMXRx?=
 =?utf-8?B?VEoxdSszWW5ST3BNOXJtZCtRaFBjaUh1b3JveFJTQjRzL29KczhPRmxwN3Ey?=
 =?utf-8?B?NmkyRnpDOWVQNHgvUVR1cSt0TVpDTC9INjY1eE9Pc2hMd0UzQXExRlYzVDAx?=
 =?utf-8?B?TDVzVm9Yc3VObkRWTGRmNXBUWGxKTUxtYm9SZllWenBIdFFXUncxQ0wycXRx?=
 =?utf-8?B?S0NzZVd5WGRQNnRlcDIwWngwcG44SzNmTjV3SmN2N0tiSXpWSzh4RFFwWGUz?=
 =?utf-8?B?Sm8zaVZKbUJIQWRURnZ5UlkreXJGdEl2aGkzcThoNTJVQTk1ajJCeE1MVEY5?=
 =?utf-8?B?dlRNSFM3dGFaa3E5UVhuMGR3VEFlK3NzWWNJTnpuZ3V4ZUNFcHJvN0xrZmpS?=
 =?utf-8?B?djFhRENsMXg3alJnUVBqNFVHUWl2aElkV2VHMzdMUVdHMG4rYng1UTF1cjhw?=
 =?utf-8?B?TEhiNHQzVlo2Z1lGNEdaNmUxdksyaC9oNVFmb2tPcGs1NnpGVVNxRUIyWU1S?=
 =?utf-8?B?aWpVTUhqWmthRmxvRUc2VVlQcDNzYTJ3c3hRYitnSVBUTWRtUG1qNlNwdkJE?=
 =?utf-8?B?dVNuRHZTMUdsdlc0RnRrVlB6NWdCWUVWc21wUnNWditLbmdsRVhubkhpQytN?=
 =?utf-8?B?YTZSUHRkY2ZlS0pXUCtTU3pnZHdUeUVybHRoYlkxcFkzV1hLNzBkclRMaHpJ?=
 =?utf-8?B?Y0dHUi9hdlNhSnFNSG52Qm1NblVVRnp2eGtOMjBodDJNVWRjK3JxV3U0TURC?=
 =?utf-8?B?R2YyVFZIMmlLckowWlBYN3BNbXRoUUd0ZzN2WjF3YTBWZGZ0SG1NT1RpbmE4?=
 =?utf-8?B?UEp6ejdXMVhEWVplS2ZWM0p1Z2ZKUUVoMXZkTUZGMG1oa3I1MmkyRWd5TGFZ?=
 =?utf-8?B?ZGowdHVWN1FiclQwaENkL2p2c05Bd3Y1aXJDd0wxYWVmREJCb1cvaVRpZkVV?=
 =?utf-8?B?SEpmdDNQaWFmYzdrNDVGZ2NkMXhkYTlzcjNPOWIvYjJqQ215MFBLWWhGcTRh?=
 =?utf-8?B?WXhmN1BPdlJ3NXNVODk1UVJjNW5tdXNlRndWTjdQamJiakRRbkI4Wmd1ckxu?=
 =?utf-8?B?bjJpbHo5STE4M3ZsVFQ5ZHM3RHBHb2Q3cDNzUURNcTQ3SStKUklxMXA4TnIw?=
 =?utf-8?B?SjQ4bjRXdUU1MTl2WGVLTmlmdkpKbVRzdlNVdDNOQ09qK3JWU3RRTFNzcmxk?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf00db06-fa95-4b16-39b6-08da63ed7b9d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:01:26.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sz8LdsLEYVHV04cheoDhmwcC3o09LaDDAE+mA8Teyllb4zII1ulXCrx+lfHRtcvJnvGKuPEvuYzTkgvZUt5bmDF2sQyWMARnKzlNctV8ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1595
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-12_05:2022-07-08,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120037
X-Proofpoint-ORIG-GUID: L9h4ajMUTujQ-g0sLVDwEaQAVuLZkURF
X-Proofpoint-GUID: L9h4ajMUTujQ-g0sLVDwEaQAVuLZkURF
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

On 7/12/22 10:06, Igor Mammedov wrote:
> On Mon, 11 Jul 2022 21:03:28 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 7/11/22 16:31, Joao Martins wrote:
>>> On 7/11/22 15:52, Joao Martins wrote:  
>>>> On 7/11/22 13:56, Igor Mammedov wrote:  
>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>>  
>>>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>>>> index a79fa1b6beeb..07025b510540 100644
>>>>>> --- a/hw/i386/pc.c
>>>>>> +++ b/hw/i386/pc.c
>>>>>> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>>>>>      return start;
>>>>>>  }
>>>>>>  
>>>>>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
>>>>>> +                                hwaddr above_4g_mem_start,
>>>>>> +                                uint64_t pci_hole64_size)
>>>>>> +{
>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>> +  
>>>>>  
>>>>>> +    if (!x86ms->above_4g_mem_size) {
>>>>>> +        /*
>>>>>> +         * 32-bit pci hole goes from
>>>>>> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>>>> +          */
>>>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>>>>>> +    }  
>>>>> this hunk still bothers me (nothing changed wrt v5 issues around it)
>>>>> issues recap: (
>>>>>  1. correctness of it
>>>>>  2. being limited to AMD only, while it seems pretty generic to me
>>>>>  3. should be a separate patch
>>>>> )
>>>>>  
>>>> How about I instead delete this hunk, and only call pc_set_amd_above_4g_mem_start()
>>>> when there's @above_4g_mem_size ? Like in pc_memory_init() I would instead:
>>>>
>>>> if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
>>>>     hwaddr start = x86ms->above_4g_mem_start;
>>>>
>>>>     if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
>>>>         pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>>>>     }
>>>>     ...
>>>> }
>>>>
>>>> Given that otherwise it is impossible to ever encounter the 1T boundary.
>>>>  
>>>
>>> And while at it I would also remove any unneeded arguments from pc_max_used_gpa(),
>>> which would turn the function into this:
>>>
>>> +static hwaddr pc_max_used_gpa(uint64_t pci_hole64_size)
>>> +{
>>> +    return pc_pci_hole64_start() + pci_hole64_size;
>>> +}
>>>
>>> I would nuke the added helper if it wasn't for having 2 call sites in this patch.
>>>   
>>
>> Full patch diff further below -- after removing pc_max_used_gpa() and made further
>> cleanups given this code can be much simpler after using this approach.
>>
>>>> If not ... what other alternative would address your concern?
>>>>  
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index e178bbc4129c..1ded3faeffe0 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -882,6 +882,62 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>      return start;
>>  }
>>
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
>> +                                          hwaddr maxusedaddr)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    hwaddr maxphysaddr;
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      hwaddr cxl_base, cxl_resv_end = 0;
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>
>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>                                  x86ms->above_4g_mem_size);
>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>      linux_boot = (machine->kernel_filename != NULL);
>>
>>      /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
> 
> it has the same issue as pc_max_used_gpa(), i.e.
>   x86ms->above_4g_mem_size != 0
> doesn't mean that there isn't any memory above 4Gb nor that there aren't
> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
> max_used_gpa
> 
Argh yes, you are right. I see it now.

> I'd prefer to keep pc_max_used_gpa(),
> idea but make it work for above cases and be more generic (i.e. not to be
> tied to AMD only) since 'pc_max_used_gpa() < physbits'

Are you also indirectly suggesting here that the check inside
pc_set_amd_above_4g_mem_start() should be moved into pc_memory_init()
given that it's orthogonal to this issue. ISTR that you suggested this
at some point. If so, then there's probably very little reason to keep
pc_set_amd_above_4g_mem_start() around.

> applies to equally
> to AMD and Intel (and to trip it, one just have to configure small enough
> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
> 
I can reproduce the issue you're thinking with basic memory hotplug. Let me see
what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.

I would really love to have v7.1.0 with this issue fixed but I am not very
confident it is going to make it :(

Meanwhile, let me know if you have thoughts on this one:

https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/

I am going to assume that if no comments on the above that I'll keep things as is.

And also, whether I can retain your ack with Bernhard's suggestion here:

https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/

>> +        hwaddr maxusedaddr = pc_pci_hole64_start() + pci_hole64_size;
>> +
>> +        /* Bail out if max possible address does not cross HT range */
>> +        if (maxusedaddr >= AMD_HT_START) {
>> +            pc_set_amd_above_4g_mem_start(pcms, maxusedaddr);
>> +        }
>> +
>> +        /*
>> +         * Advertise the HT region if address space covers the reserved
>> +         * region or if we relocate.
>> +         */
>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>> +            cpu->phys_bits >= 40) {
>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +        }
>> +    }
>> +
>> +    /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>>       */
>>
> 


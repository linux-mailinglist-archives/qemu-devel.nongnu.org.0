Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C614A6AC9B8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEX8-00078r-IT; Mon, 06 Mar 2023 12:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEX6-000720-5Y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEX4-0007b9-6c
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:55 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Gx2h9003870; Mon, 6 Mar 2023 17:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=6TqgkWlecr27xOSgeHiJpqgy+PXD11AK4DHp97bvSWI=;
 b=VSbJWSZjrNjwp1Tyfh+YaV2dknokMcg3yISW85uc49DjvyExTuRCo6z6hOC0aIBog67A
 WzNfFLTJq7lUv8GUg7XweLQVtb7dngSe2h8ShZlPefjLi6InYzMGPtUvx9dh2HSaP7fe
 oe20Rta5fiRVbMiblNexIORiPXp51jnzS+14CM/PssCrA7xVhlu5QSDfnBJtB1k+6a77
 YcZVpOTM2e6G9GFEUZSw6LbZcYcq3GMN5eRfCtVeAfIuf7tOqH3XRUywXNFqK18k4Fse
 rQst4KkxF5awPCu+lXR+JD2MXnqD8mOm/aayQ2XJHapBdJUZNbS9R72x0Cogc7FZfGOZ sw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168kfwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:21:52 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326H8VEO037528; Mon, 6 Mar 2023 17:21:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txd9pe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccp1YwtgtjeV7abi/mH6e99AGRonBdeM83v/3YbeGXu5kS4UEPj6PZZq+CcFiEM+W/k1A7qJVB+oaPdg39zrKib4uGItiAZ/LkrJN6joQQe/8cR16RmRD2HjtfTVJ0BMKdbJSVa3PSEf2fDDRXnHoyKVQw4bHRh6w9vF0GI1EdNK7fWa/8EXIxOQEjHCA7CUGrnMWAigtw0EFEbWlsgq7sBUw/T1EkC99Bv/8JydVA9256VSTbyQHNcxeUsllZIQiLK7/fO1Zzz343EKKqTgMMfTxkmbfUAEb28eui+XKnOUQODdiyi/op2JVuH6CL4uIVvJBfeJ0il/XiRE3jmqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TqgkWlecr27xOSgeHiJpqgy+PXD11AK4DHp97bvSWI=;
 b=iDChtgheRYes8wZ0U3hJadtDX0pOcZiDPWRmKBXFPiMauiHOjwYwZ9OEFOPUHUIgX8Rq9Z0lEiV1YvsAwUxXKscwiMxwrIuHDcVl5MWXg9Ysh+mvL+PbntpN971IRyQo9N1qYYY8446VEz+IzlvEqvxq+DdMuV7RvPHSkLYeYWNmr8HXkNsprZl5bjAZQVSUWZsZvdrdLXA2KnJIbfEgWVN99DmW9Yb9VpH+Cob6asi8tg1zPviRDpjQC15NMWSBNeuQHUkJK7kVHoONxTkt0PWPhoJi47SFig+8xBZhnCHl3ZE33BZaTLTskCNy1M0/SAc5Ai6z/IssdluqaakWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TqgkWlecr27xOSgeHiJpqgy+PXD11AK4DHp97bvSWI=;
 b=wBzwiklrDcv/X6pYb+wVyKe42JdEMsR2c5FQ0dHeDyLaXzvttLX439DJwSpaQjJC+jzzpqFaaKcLlVXUCoiosn9j5HwrawNvPWzoAdTRVCOpvroZNLiSCHQ1Qr34Z1R7rkIB3NgS2HlfCUdrJPVBA3t9/MibUm76mPVFVCbE488=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA2PR10MB4569.namprd10.prod.outlook.com (2603:10b6:806:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:21:49 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 17:21:47 +0000
Message-ID: <839eab50-1cc5-c22f-ba31-d9d71e809e7e@oracle.com>
Date: Mon, 6 Mar 2023 17:21:41 +0000
Subject: Re: [PATCH v3 13/13] docs/devel: Document VFIO device dirty page
 tracking
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-14-joao.m.martins@oracle.com>
 <6ac284df-144d-a71d-5d65-6b14969fdf7b@redhat.com>
 <58e2daab-d8da-a572-6297-807cecc2852c@oracle.com>
In-Reply-To: <58e2daab-d8da-a572-6297-807cecc2852c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA2PR10MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 197dda68-c3c6-45b6-16a2-08db1e6743f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4O6i1nvxCE0ZrPyTE+cEdhsjJgduGBpGLzC9djB/y2IQQskBFUUHp1fbBbpOM1E+UgumE4n5BlwdzsnopiG4Mi8+3d6fhYs3xf3msmT6ft8TLb4PLvVlRBPqpqF+IZt9OojAHEb+u4+Xn1KJlzdPOL+WtsjIZbqW6zpT/RVV5ujPBZuKb+KkJJPxfmaJgOd2OuIetu8bBGREXkjuyRDS+1E5o7GKoNLG5+wZqeT/MouxGYAob4m25Zaelz4M4tOm9Hp+COAj1QyvOAoSRo+t6pKQMS5/4naXObuRHEEq8Sweiwof7BXPtxxXCLPY13izMfTiq5y22VQOY9yuuyVqVN4hqqU/CqG94Lb/IwLq82uzgbBWkXnttsL9tnmwtyFW3Qqe3R1nxIb0JSaHvIeJfeVFshfCuFvnVnJ6/DycFffi7gKJi2AAYWJSuVbhYIOSlJYZlMEcFNMi4qoJk96UyHDHuA8ZUAdtOLADmgjbZc4/OYK70cQrEwgZ4u3KPwqsMrVvoZFE1Se14y6LX1H5rXFuz0JaZ7Ud1GakSFL4c3g84MeMcApsZuUqUYWBTdpwlfNEGZPr9PU11CpFowIFhdwqTOQchUJAqrLGWl+gzrkwRHNKMIoTYCThYB6I8t+RWUC1Qlg3BXxgz2DK9icjWOnPa0N+7/SBRhgjEihu365627S3zYym55Y0ewP5xDt4OAQyrKsA57fBOVk7W6NZz3DM5if5C5d4ac745zAiE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199018)(36756003)(31696002)(86362001)(66476007)(8676002)(66946007)(66556008)(41300700001)(5660300002)(4326008)(6486002)(478600001)(54906003)(316002)(2906002)(8936002)(38100700002)(53546011)(186003)(26005)(6506007)(6666004)(6512007)(2616005)(83380400001)(66574015)(31686004)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blVyNytKZ2NyN1NXU3VaL2JHVGVkV1dERUpjY0kyb2VMQWR5M3V5UGZkYTdZ?=
 =?utf-8?B?SXNxamMwM2t3NnNFVkFlR2hZeFNOWHV4WVVOQlA4bzNLb2pWRGhvOWM0N1cw?=
 =?utf-8?B?OXNpV3p6eUlDSDlKdDRHR3c3NGhGNGkwcVlERnFTL2Vpb053TCtRcVhhRFU0?=
 =?utf-8?B?TGtJR1ZtL0JCbmtRd0dEK05CaU9yemtycE1HbkZPMGhuV2pVaEhxbm0xWlhP?=
 =?utf-8?B?WmhwUW15NURsMUt6NEZoaktralhaV24wUDArcGVobWQwdjVCazd5VEJaaEYr?=
 =?utf-8?B?TEVMb0JVR2dEU2k1WmE1UllaYjYzL0dGL2o0QjdkZUFNaGtkaHZYMm1VZlRo?=
 =?utf-8?B?M2lmZGNFYVBCbjRVTjF4UVZGaUg1SGdzcThyNXpacEhMeERkbnhacWJuY2Y5?=
 =?utf-8?B?WU5jclM1SktaUHJ1VklobzdJNWVpc0RzRHZFL0h0czRJY2JGVUo3SWEwVG9D?=
 =?utf-8?B?ZXNvNDliWnQ1MUI2SGNlS0NEYmVTRnBCajdVQW9QWTVFRzJUR20rQi9vbnpV?=
 =?utf-8?B?QzF3Vm9hUHRjWU01N2ttSUt5TkFBaDlObHFsUFJwYzEzdHcxSmpKMWpudmda?=
 =?utf-8?B?QkFaTkt1VGg4eU1hS01kemRBZ2xnWkF4V2pjZE1NZ2xUMTNPT0x2LzkyY2Y4?=
 =?utf-8?B?OVRPQkl4RXlJdnd5dGxOdXpFWnduU2RjUnc2bUJZWUZPRmlyK0Z2OWc2dkVL?=
 =?utf-8?B?YXgxeXhaTHo2Y0JqSkJWdWdkOUM4N2ZjbnZ0eGsvakpGa2g0WThIRWQwZ3hC?=
 =?utf-8?B?bVAxdzdYNCtISXBqaG1xMUt3UGZSWFhUSitocjBvRXFETWs2WlVpaTBJcDBY?=
 =?utf-8?B?bzVUUklkZ3dPZGJBVlV4U21INlFMZnVSWWVyeGE5U0gyQ0FkSmZTNGtQeWlQ?=
 =?utf-8?B?UTVXWlFiSzEwdFFJMGFDRmpKYzdOc20vS21saVVkalFaOWdjaE5OVUZ3M1Qv?=
 =?utf-8?B?bVJkcUVmN1NHanAwdHRPc2N3d2cvMmRzVU8zbUxDSTN2aE1WZ3VJelJNb1VO?=
 =?utf-8?B?TnYvcVpHdHkreXR1SGhKVSswazhsSU15aE1UMDBHK0xCTjNxZGJaTFFVMXRY?=
 =?utf-8?B?bmtFN05YTmpRLzRwbzNTVHJkcnl2WS85K00vQUQ4WjNqUzg3ZDBEazdQdWtC?=
 =?utf-8?B?YkhPSnVNKzhHZDJpVjcvb1FSTGcybHFtTGdmem1IMWpITGNiYjJFNWxQREFB?=
 =?utf-8?B?TUp3QjI4dkFBNkVDa1V3Nlg2MHJKK0NZbER1V01lbVNQYkdTTWViVmRpU1Rl?=
 =?utf-8?B?SDQ0ZzVTNnN5bVJqaHNkQWdmYTFhbVAweHZnMDFFblFpYmVCYmdZUG1sWmg3?=
 =?utf-8?B?VzBnQmdMUVliZ084Rk8wbWhiVkxqWUw0Snk2c00vbDVuTGhuZWlLTDdIbXJR?=
 =?utf-8?B?ODJzUjBuMFZONlVQMWsvc29yMHpNZCtmUjRjaE5DOEljbEJ0SnFEQTljRUpJ?=
 =?utf-8?B?bndmSXUyc0U3V3puRHZmc3NjVGpQTVZpNnpqM29UVDNuMjNtQ29PMUI5cFVy?=
 =?utf-8?B?bk0rcE90WGZrYThFdkQ5bkR2a05xQUc2SnB2ck42UXQwSmMzNmJ4Q2xzMXBK?=
 =?utf-8?B?V3lINVUvV1RGdGhRaUdRSDNmSGpObkp1REY3WGxxcFhRYzE4bTFGZVh1OGwr?=
 =?utf-8?B?S0VzbzF1c3drV2NWb1ppRWNMQWRzYjcra3A3Qm85Nm5TRjFkeHF3N2I2VTA5?=
 =?utf-8?B?NzVLL01uMGxjMGFoQ2hvVjlxcUt5TkdFN1BJZk81dkJjVml4b3pIR3cxSTAy?=
 =?utf-8?B?em9WNzNNREFUcnNwZmtjVFcwbW9ZVGNFU3pIbVJHNklzeUJQektrZ3NaV29v?=
 =?utf-8?B?VVA3ek5mVTJsY29oWGg3SHlGUVZKSXJrb1hyaDc3cVdiQnkwQmQ2T1pjNmVS?=
 =?utf-8?B?NDU2bS9zQ25DWW8zSXlidlg3M1hCeks3UTQyaUhtWkdISnJCVTRIQTlRcDFY?=
 =?utf-8?B?NThHb3VRaFJvRWkyVjBlcXFWVlR6UWl3cWh1WG9vMFdjdWJyU210VWtQbUxj?=
 =?utf-8?B?T2o5SjdUTWU4WlVSRzl3eVhwQVpwTk9PNGZpY2ROa3BmdlVXZS9selQ0aHlB?=
 =?utf-8?B?WVpCVHBKU0N3R1hEQXJPbkxFTDNXZEhwaVlYRE4zNm91L2ZzYWtFKzY2bmNU?=
 =?utf-8?B?enk5QXZDaGlSYW1Pb3NUYkd1MU5tWmwxVDh3YXRWZVBWcGtGbHVZaitGN1c4?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wHffAeQS7RRRdMPGBU/gJ8IU9x58PcXC8du3sX2DRfhrk7usYiZ1pf2gbOmpm5Dt2Eyb++fO3tNuU4HOHFstl7ZSQ66mLgo9SJQCAk6Iq79PqG6q7/DUjT//dUSOc9zYusGrZeYlAEop4ErvUiJM4iFoKuBLoFgZKpToZHXJap7GbjugY8W30pde3QKykEhycYp9P6wXoHq4T1QWrukU01/MGRh3fc41OC6p9PGQTC3m+t28cdS96ezfP9sTMxz9MkOtPIa8ekEahRj6D4kyvSI0J8Ve2OLwYayhi2E9xqDMeVd2ITgVqD3+6XrkTbtmzPxkICrca/lyESS4wssIeA72CmlWZae3665dkwkvOT6768ADoEEl1hEfWtAUEVeVE4aWtFDGostRnOu3Z0FUsk15Ho9KfZY35SZRw6UZHzhHTC6kpdl4eCU9EJuQTPRqEM/sE2hOaN2L2ftIMMnXKQT6tziCSqU/yUlukiydG7mM9MiSRrx0YGZdkUo3hFCAO5aZSIh+wybgbuN/dO3uhqj+pp/JgzhjCZztBD3DENeBDcUBlQG1yxq3QMLvw/fBHT+c3e5SuBzi/4pksf7ZGu8nGVybr+Lv00KoER0RxAeQ4QRPkyl6oNPEon/o3lqkpFxVWODnlwSlc9+4nATgT8lDXAYPYBoL2PrnKlDkaE9Fh58PxtXWRldn0VEWhl4yDk2/2jbVC2rJqicvy1Rqo9zUVkvF1iQahifTjDdRC8Ihmk63yxSpih/imuGaBXBMudTZ7KiSKiBXHKH+1+jy6Ie3m53chu/5rzyb/lpZZMbyS6PZuAj7L6hetN2y58VU
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197dda68-c3c6-45b6-16a2-08db1e6743f8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:21:47.5260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoVYi7AW+8fJjwYSa1gCzJaIaaJISqmfIcyxWVvhuWVY8R7BQ4IgiP8sc03kfCTeA9u77Q6hEdCVOKkG2Z/VnrzqyTBzKI7ciXsqLwYt2qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4569
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_10,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060153
X-Proofpoint-GUID: UeSWkdRLEOxkOy4SeHJgW9wMGbkFRte1
X-Proofpoint-ORIG-GUID: UeSWkdRLEOxkOy4SeHJgW9wMGbkFRte1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/03/2023 17:18, Joao Martins wrote:
> On 06/03/2023 17:15, Cédric Le Goater wrote:
>> On 3/4/23 02:43, Joao Martins wrote:
>>> From: Avihai Horon <avihaih@nvidia.com>
>>>
>>> Adjust the VFIO dirty page tracking documentation and add a section to
>>> describe device dirty page tracking.
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>   docs/devel/vfio-migration.rst | 46 +++++++++++++++++++++++------------
>>>   1 file changed, 31 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>>> index c214c73e2818..1b68ccf11529 100644
>>> --- a/docs/devel/vfio-migration.rst
>>> +++ b/docs/devel/vfio-migration.rst
>>> @@ -59,22 +59,37 @@ System memory dirty pages tracking
>>>   ----------------------------------
>>>     A ``log_global_start`` and ``log_global_stop`` memory listener callback
>>> informs
>>> -the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
>>> -memory listener callback marks those system memory pages as dirty which are
>>> -used for DMA by the VFIO device. The dirty pages bitmap is queried per
>>> -container. All pages pinned by the vendor driver through external APIs have to
>>> -be marked as dirty during migration. When there are CPU writes, CPU dirty page
>>> -tracking can identify dirtied pages, but any page pinned by the vendor driver
>>> -can also be written by the device. There is currently no device or IOMMU
>>> -support for dirty page tracking in hardware.
>>> +the VFIO dirty tracking module to start and stop dirty page tracking. A
>>> +``log_sync`` memory listener callback queries the dirty page bitmap from the
>>> +dirty tracking module and marks system memory pages which were DMA-ed by the
>>> +VFIO device as dirty. The dirty page bitmap is queried per container.
>>> +
>>> +Currently there are two ways dirty page tracking can be done:
>>> +(1) Device dirty tracking:
>>> +In this method the device is responsible to log and report its DMAs. This
>>> +method can be used only if the device is capable of tracking its DMAs.
>>> +Discovering device capability, starting and stopping dirty tracking, and
>>> +syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
>>> +More info about the uAPI can be found in the comments of the
>>> +``vfio_device_feature_dma_logging_control`` and
>>> +``vfio_device_feature_dma_logging_report`` structures in the header file
>>> +linux-headers/linux/vfio.h.
>>> +
>>> +(2) VFIO IOMMU module:
>>> +In this method dirty tracking is done by IOMMU. However, there is currently no
>>> +IOMMU support for dirty page tracking. For this reason, all pages are
>>> +perpetually marked dirty, unless the device driver pins pages through external
>>> +APIs in which case only those pinned pages are perpetually marked dirty.
>>> +
>>> +If the above two methods are not supported, all pages are perpetually marked
>>> +dirty by QEMU.
>>>     By default, dirty pages are tracked during pre-copy as well as stop-and-copy
>>> -phase. So, a page pinned by the vendor driver will be copied to the destination
>>> -in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
>>> -it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
>>> -finding dirty pages continuously, then it understands that even in stop-and-copy
>>> -phase, it is likely to find dirty pages and can predict the downtime
>>> -accordingly.
>>> +phase. So, a page marked as dirty will be copied to the destination in both
>>> +phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
>>> +achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
>>> +dirty pages continuously, then it understands that even in stop-and-copy phase,
>>> +it is likely to find dirty pages and can predict the downtime accordingly.
>>>     QEMU also provides a per device opt-out option
>>> ``pre-copy-dirty-page-tracking``
>>>   which disables querying the dirty bitmap during pre-copy phase. If it is set to
>>> @@ -89,7 +104,8 @@ phase of migration. In that case, the unmap ioctl returns
>>> any dirty pages in
>>>   that range and QEMU reports corresponding guest physical pages dirty. During
>>>   stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
>>>   pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
>>> -mapped ranges.
>>> +mapped ranges. If device dirty tracking is enabled with vIOMMU, live migration
>>> +will be blocked.
>>
>> There is a limitation with multiple devices also.
>>
> I'm aware. I just didn't write it because the section I am changing is specific
> to vIOMMU.
> 
... and this patch is covering device dirty tracking


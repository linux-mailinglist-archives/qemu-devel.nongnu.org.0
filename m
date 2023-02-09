Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3590690C19
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:43:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ88A-0007jO-UU; Thu, 09 Feb 2023 09:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ888-0007iW-Dd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:42:32 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ884-0008Fb-BR
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:42:30 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319BO77m023942; Thu, 9 Feb 2023 14:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=kZ+lvZC9KGWoojULLCcJWA5UN30xacDhfrbBn0JgX+I=;
 b=r6P0/TOHJ72zGsOKUilwqIIHPmGypUShX8og+veMzq1Vp18EhzmsYOjVxj4GFhz8iu2a
 X6+xN8okYaeFu30LSJ4pTIK/Ld9xbdzxenjJZBRnvaQso47L7QX0+zZRJqyo0hMRkihQ
 2yyQw42XZBJIIppLGvHgH4ejX7sX2Zpfpk05/OG+bva4xDRUBhYLpkZXG2Z81+VZ1zG+
 s/7NW9gBGnyJKZ2kxiCe/hb+ecYzzbOM7JIEdhoNGE4oxniuH+XPMzcF3c9ETot2NXsf
 5e+S3kLYi2JEsbl6lNdieDlQHG0xj6zwJQhgY5e6L+8+IdlJYut5+M/aEIHDQ7l3rqfQ DA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdsdtuck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:42:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 319DkD2Y025717; Thu, 9 Feb 2023 14:42:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtfxwqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpPN22T63IwHbql8mJmQR7w8NZRIGsAVXTjYqm74urN0B4KWLGEUmOeugULqxWn8HuuZ7CdEoJ4dVCyeqk9cpT3/3z7c8cUTG4llNepxBUfREJene6NuqqR1TMAI3s4IiopABaLSGhy2HUahXaZAlf7UI/Yh0kEA89P4kt0uzjRzFtYCDLdWwgx4H9eTfOoad6pbYJWJERjSOYmfWqIV6iqPrUc6yB9tY2Dqo6QhD+WyhA/KObHD+v9yWiC5OJ22I+CmqvxR7qGxDX9UeymlALPCbdC9XueMWVl4KfQ+FICcvjqgNLbwtXCfDOyNuUwGxAv9vPNHk33xvigwbBAzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ+lvZC9KGWoojULLCcJWA5UN30xacDhfrbBn0JgX+I=;
 b=IOcGAvTBIxBC3Mgl3pBPWGwR8+JM+cZTV2Ko6zo0uN4Eo6h/VnWED3DUO0b+iaCh5+2/Rkyt6kdSUyH/93ENArBJczsZjO3Z9cxMa4b4n9Oy7TDizHLCcJg6Dy5XqhTKTVNzr7r9zFKmbao4itAjqaGvCIVO9mQLA36ndoWssPbcIRjEiIbp6OyFph0YUTfjTtOb+xoG2v/WhSPQ2aCvlJL4lmg8eAa3oUvdD7gyj5wmQZv95xP/j+PT21Ti9+QL9XdTR7T0+AJrGocFTv/pLcA39BLzRVAmcKNr/gCR1OqvYbxrO2ebRlLQoBaPMSj03lH2/dCDTZdtv1u3lkDORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ+lvZC9KGWoojULLCcJWA5UN30xacDhfrbBn0JgX+I=;
 b=F5FCAixd4xxBcJkxolXEpV4Rf8rFei494MjXzJRQOOP82KcLlf0fBOWRAKNLxUQGOdmIWSLVOXvj5GYGscpiMPKUtcj3ls0sfpuz5PCzwmJgHtEIrBMRsamvb5Ed22PXX0zJ/iDmaUCQDp3dSp3ZYqLg7mgEAmpUWUE5nkO1u+w=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SJ0PR10MB4606.namprd10.prod.outlook.com (2603:10b6:a03:2da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 9 Feb
 2023 14:42:23 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%8]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 14:42:22 +0000
Message-ID: <1fec588a-8db1-0444-123f-d8f0fc8600bd@oracle.com>
Date: Thu, 9 Feb 2023 09:42:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 0/4] string list functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <Y+TPbIIV34wyZMuW@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y+TPbIIV34wyZMuW@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::14) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SJ0PR10MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dfee5f-28ea-4d9c-d5f2-08db0aabda75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjJ9+Pu6k4cZzjAgfYPNkY0HfSwbphyQVBBS0zxzZ3s6gmrxHq98qfp2G7eZmUjsHhOPoy20J5aBtwgDXTxdoNInxJPFg1efOMtmMBfKVScIxqislnYCAt5UGceVte0ZfYBVsuyCAVNXqayIooCpyy3qTiMchDLxb89enxIiw2Jhn+YbaQ33kf5mkso9z7WO1Wdugo8HDlcBm/Ga3QOBhfFcwDcpqUaHjqwAqEm2gFaQuqPzcBTJuUG/GGLg7d513muCDF0B3VMhTaYVrxUIDcDggu9adBL5LRJKAXUV7xjfa85ixGE4kGfALFYkvUwlwYHhNoLM9Ha6b0iUzY8O+pza5Dlmfws/bZXfcIQyG61BARLr2ZyKLiqpS3TxMoHFGGkBNPUxDZGYMLoLbIWT3RQedtWck72PTOJPSFnYUJD0FwWmWASs6LTv4SY8FpeK4RfV2+F4jvgt6iQnNtRdBddnrwmd9R8QvzkLHxlzfaLmhJQRRs3HZybIYdv5CofNx8QFEcABYTPmLoUMUl8nR7SGVOg7uapqRXdZxtDOV+4ftQ/h6HpAZN4COEjRgWTirTEZaU6/uwYHr5kIUsm/bA8dmDQkpQU/j/7zwlVqLwibWA3e3r/pgj3zbJ+j7w+wxUVTKX2g/ejjD7aHG0oEJicnatBoc0DCLtLcixe8vD4co4fN9ZpwzEPPBpBDFOb+CRz3UKWKPnWcHAR03qgFhgVv0NXarMIIb4nqPbv9bSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(8936002)(26005)(186003)(6512007)(38100700002)(31686004)(2906002)(316002)(53546011)(5660300002)(6506007)(31696002)(54906003)(6666004)(83380400001)(2616005)(86362001)(66476007)(36756003)(478600001)(6486002)(66946007)(6916009)(36916002)(66556008)(41300700001)(44832011)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlkc2RrOGV3dGdmU0hFYmlTVXF0LzMwT3Z5MUxEK1dMK2R6OU03aHh1ZkFU?=
 =?utf-8?B?dCtqUjZhL0lPNHlQc3BOMm1jb3FhYTlCSE4vVkoyVFErYVhVd2xGaVdmMTZ4?=
 =?utf-8?B?RlBuYVV1RVBSN2tKSmd4NmdaQjBhWEZjRUJaYytLVDhQSFhlSm1UUVhIUlpP?=
 =?utf-8?B?enlJMHZMNlA1dVVhdkhJVWhBdUJjT2FwTkhtT1R6NVZxcEZlRk53bDJUUUdN?=
 =?utf-8?B?M3NWSFpZRUc4RlZmRkVVMC9rOUt3NGJhN1piREdlQTdRMjRwSnI2RUNyV1RQ?=
 =?utf-8?B?YW9DNE1Hb0lQY2M3bXh0YXM0RGlzQ0lMZzV6K1p6Zi9lUFg2N0d0bmRnWi90?=
 =?utf-8?B?c2RrSlJReTVFaEltUk1LeXdSSGI4ekppSzNEUFBCOWJEa2FlNGt3d1EzK2xi?=
 =?utf-8?B?a0tEbjJMMStvOVFoVW92NFlaSHhIaVNsQ2kreXNqWGROS2ExUkV0akNCbjVt?=
 =?utf-8?B?d0cyVkkvcktKNnFPNzBac1drWkxaeE9CR3o3VlAySzBTTVlQWHl0ZWZxMU1O?=
 =?utf-8?B?bmhoOW5tUCsvN3R6bXNlczJQN1RGOHJFNGtUNXJ6WFhSNjVBZ0tYRXNxMk1X?=
 =?utf-8?B?QVNUOWpOSUlGMHNFQmMzWmVXbEZvMEtoNlY5M3pEb2x1SUliQk14RkFmd2Yv?=
 =?utf-8?B?SWZwczVUYWpDRGFTZFZ5VEUvQ0VTMGh2ZjlobzlseVpIYUMwOE9mWkdUd2d1?=
 =?utf-8?B?S0dCRmk3ekFHbThZam9DKzNCaDhieW1URUc0WE1OZ2I3aUZ6L0xwTlB4dkRC?=
 =?utf-8?B?b09xTnc1TGxqNDVpU0dMdzZ4ZmhLNDcyWkQ5UTN4ZkJwZEJRcyt3aTgrUFlY?=
 =?utf-8?B?SVRqa0RtZWRGRFljR2psdkwrVWp1WkM5bHRPa1NjSFptbzdtNjc1SWs1Rmxo?=
 =?utf-8?B?ZVAxeHU4RzZxTjR3a2FDZ2RlNkpjOGpwRzgzcXlSR0x0b2NCMUpuK05EV2di?=
 =?utf-8?B?NTUxN0NwTWFKaTh3eCswVmRZRjFiTXZiYnAwM1NuUDFlQnNDZmgzZTlMZWtx?=
 =?utf-8?B?T1dLeDcyR3JHWjliWVNjWkx0eUpEOGVLTkp1TjUrT0hsbHJNZW5SR3dwd2x4?=
 =?utf-8?B?Tnk3dnFKVmFNNllVMlY5K04zM0ZxYjRpOGhEWEMvOVlzVGlIays4R00yOUxP?=
 =?utf-8?B?ZDc0WjNFKzlLZEJYRTZkQjVIRWV5Nm1ocGdiODd0UnBEV29Oa0JuMVFXVjJO?=
 =?utf-8?B?bE1MYU80V2RtSEVEOUtXZjc5bUttYWppZng5QjFNSm5IMUhaQ3A4cVNiMkla?=
 =?utf-8?B?MHBrZTNxck5XMFVtZ1VtdCsyaCtsZmJhbEdSQWRudkhZblBEUFNjY1kvUHV2?=
 =?utf-8?B?bXdKMnA1Z3IzRTN4amNDRVE1eU5vbjBmeVVqbGgxd2NWVk80Z3VBYURGRnI0?=
 =?utf-8?B?MXBURXRxVXpKd053ZjVuSG9RY3QxOGMwb3MrdUtDUUZPNVd2alZ1cWlHRVQv?=
 =?utf-8?B?UHFOaHlId2RTNHM0YTVaMk12UDR6WkFkajZLU3VXbW1Sb0ZwTjRXd0dEZ1pu?=
 =?utf-8?B?QkpRWlZXWUZXbGRjc2NIQUQvS25aS0tFMzM2cE5hZXgyWlFiQlVhZzJyemE5?=
 =?utf-8?B?aHNvU2h4NTQwVUVIbFYxelhmM2tma3RDSi91Y0UrNWw0V0tnSWtYR1dZSE1W?=
 =?utf-8?B?dFNQOXR3YTVMUGVDUFRyaFRlRUhlcWlsMVNwWUc2NUY3SjVteVVyS0RQRHJ4?=
 =?utf-8?B?NzdrbW9EMjViNVBPbTFNWkxONHRhaTVuZ1JDOXZJY1BFdnBjTXMySVNuU2Ji?=
 =?utf-8?B?S3piKzFLWkJPVkNJYlQyWlhFeHVTamJBWWRabDkzVjMxYkROQmhROWExZllB?=
 =?utf-8?B?SDBudlJtNUF1Zm9GSU9Ia283VkdHVFFxY2lSQzlwVWhETC9sQjJ6STFGSTNQ?=
 =?utf-8?B?a21UblQ4Q0FqSmZkek90Tjd2dDJrZ1BVR0dGS1ZIMDJxMFJmYnVRemo3OEdH?=
 =?utf-8?B?YnN2bjVhODRFS0M0V2l0aGd5cU5SbFBrOW9XM2d4UUdackNRWHBxMENzWVVP?=
 =?utf-8?B?NWhoUjlFTjVMM3pob1dhaVNORjNySi95YlhDZ2JLbURhVXNoR21UY1VLcTB3?=
 =?utf-8?B?dWN5YU9LQWQxaGlBNjdkK1diWlFxV29Udkd1SnlkQUhtdzgxMkJ5QzhPN1RO?=
 =?utf-8?B?UkhRcEFKUGQ5d2pTMzN1dGRPYWpGZlV2WHJKUUJTZEtMaHF3bDM3WjEwVHVs?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3qq/qyr3fQWQ9ucsXS6gDvE8Uomx4LpZTHi2GQ852ZkriMyq9iz96LJN2CP2uH64npcOTmSWChHmuX7dg3lMRRjUYQGNwQvtaDg6N5HAv7N/DTVnD5gvMnp8eRRWjZezf1TJvztpPm1y8FTj2cb36bcTSggRslATCS85w4vqCM5JVgrejAfhOBaKxmIOs8vgCNQG6Dnny2zBzZ17n6qdw9WZ6+aYQShsLGFc3CKexDGd5kIGhvvsNV8V+8fFUwgtpicK7BPwWPAo33hc1sQFV44+o4hHszad+k52P9Uk6Paei3kfROW5ulrf5nA/T8DG6BUY3rbePyumuldkRENkaj2D/QKkoirzgpXUjpdLI7EfUFZRplB+hLbJnX1rN5tydqB4z4xCup9/l7Lq6NlDnM8KfLhnbbooblF60fR90uqf+35WyDM4deOcEjjNV0l+ykdCJj0GUWb8AAxAEdrcb9g+pXfM1nTmShgLg5EQJEE7AmbDjs0kAFAr38PU+AQFb2pdUtu4eA355q+PWO3gce1djYZUtUipG6mXgWgX4CSsvNePlkaqPhDUIjQ6Qe+cInO+vHoXdmjUe61XYtcpmyLtHVa9aZYtNyltajeRje3oZPgqdsehAU3wACc+NxgqdxK76VDJBt603qLg8dB+NxQHr+tW5X5WBb+cjZH58vi1ZfiaheobEZDU5MIJ1j8rRo5hlRKfYm9rPuW8U1kDxEopgzaUQbt/xZDF7Z8Hg1Tz4J7h/3xPbllQdwVQ6sstkJwkjU9TwNJfoUfmAllXMNGlt78lvyI7L4TBo1/mJv0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dfee5f-28ea-4d9c-d5f2-08db0aabda75
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:42:22.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsrbQU5RH6zRGFHonq3qwJIiVKh1lVZuOUCtoeGZNs79uy6X4K8lczZwuzH9sOE4IIvm1u4VXprq5AS77zhjTtt3YYZQp4Vxj1zGaZojQXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=839
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090139
X-Proofpoint-ORIG-GUID: eX4BpquanIIM_CVVL1xt_X_tjWvCEB6i
X-Proofpoint-GUID: eX4BpquanIIM_CVVL1xt_X_tjWvCEB6i
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/9/2023 5:48 AM, Daniel P. Berrangé wrote:
> On Tue, Feb 07, 2023 at 10:48:43AM -0800, Steve Sistare wrote:
>> Add some handy string list functions, for general use now, and for
>> eventual use in the cpr/live update patches.
>>
>> Steve Sistare (4):
>>   qapi: strList_from_string
>>   qapi: QAPI_LIST_LENGTH
>>   qapi: strv_from_strList
>>   qapi: strList unit tests
> 
> I know that the 'strList' type falls out naturally from the
> QAPI type generator for arrays, but I've always considered
> it to be a rather awkward result.  The normal C approach
> would be to use 'char **' NULL terminated, which conveniently
> already has a bunch of helper APIs from glib, and is also
> accepted or returned by various other functions we might
> like to use.
> 
> Should we consider making the QAPI generator handle string
> lists as a special case, emitting 'char **' instead of this
> series ?
> 
> With regards,
> Daniel

That is an intellectually appealing idea, but it sounds like a disproportionate 
effort to handle this small use case.  It would also make string list handling
be different than the other qapi lists: boolList, sizeList, uint64List, etc.

- Steve


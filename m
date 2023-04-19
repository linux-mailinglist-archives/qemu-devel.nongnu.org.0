Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CC6E7B82
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:06:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp8QY-0008Ci-9q; Wed, 19 Apr 2023 10:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pp8QV-0008CS-0y; Wed, 19 Apr 2023 10:04:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pp8QS-0008Ds-Ix; Wed, 19 Apr 2023 10:04:50 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JBcEKA025393; Wed, 19 Apr 2023 14:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=0UzdfKJwMSaDxjEb+lljbwfz8Tq+msgraF5DKg3zgJk=;
 b=WF/0+VFpw9G7FnTSJP4LLoqPGIvRnAXyYhCHD9+90/2N9Ho3eb4Ct0AhdiyekEhPXPVE
 QkoHKP2MKDA7kFbEwgFjQkTWZ1G3d8Zs5224Lq4tLGELa8vE2IddEjTtq5brz1/MZKHA
 ma9hKR3CM2mW9IGUQ4iOUxzOzJjt/PeIgVX0Nqqm3g1JF9CFzINdnVWzeNwKaaafTKmQ
 AeCuZWWJZm07mKC2E7JBqgqGMchyfDVMKIcoGRTfW2G//qm/0El58rZYUFtdwrWPCWzc
 pkXr999RdF1x2xguic1FbDCEhgkCRH5AUHRKnBkHUF61rxPkKaap8E003aVeGIkQ/Lc/ ow== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykyd0e4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 14:04:43 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33JCDnnk011378; Wed, 19 Apr 2023 14:04:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc6pxr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 14:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jako25xd443UMcqlcdzIsVLcrlIf5tnJy6Bw8vAKufvJOGu1iJLYzXlpeqJi1EG6K708xAPALjn3pXOvGx7QYE7OGemO7rjC8ao+RVYhkWf4epB8euJiw3NJMd2W1ZowzFWfdqHKuSnNljF9wOtvu5BCdBdlb5ntPi7J9aZ5cC8lTNQNQhqEsPRJcgX20Z7G+Q+HokbA0oB/3F6+Wp4otrAgEcpPsjyvUtFOXvP/0bmuP+DU6ShJPo5wqu5afXFrgxK8uxfrcz4kTgV2Rz1w69KvZIhvRZ3+p92Q6KBU0Q1V1fcMxKfvKf6mHJfb/vN7bWteigdrY1ZaCNGryxYIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UzdfKJwMSaDxjEb+lljbwfz8Tq+msgraF5DKg3zgJk=;
 b=c6Ta9mbET9oW+IMNk1Az7K96qdaKlP2QqgFvkV28kPt4PCTlDo0TMXVpSwWxXVJP0wIpGL2K5QD0yGswRzAUcyXFfo1m7BN4kGgEsJRhxH/WXk+LKvcdyZbJMVpLrDNk7uqvFw/OdFjNnOckQeh61z5W6rCd9LgfQhk1E1Jjk21ZONYfU+0+POw9/wjMrXp+budiW5Q90GsF7BTOoIQeVMD+a5JEiGnoktCryym7vJa7CkGCArMUuCPrJaxu//em1sLTUN1N8wZ7I1xpSHDxqaUSypaOPbOdrniQIBIbk4w049xpsdJDUhAs5/Ga3p1Bi7UFbqLemsrgoXqaaQGFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UzdfKJwMSaDxjEb+lljbwfz8Tq+msgraF5DKg3zgJk=;
 b=pcDHRj55Gd+8lpzk7nqZOuabt0rAEeu6C9o0gLAyRHfISyPrBD5xd58sZBt3W01Jfb3pBU7fSjLu6+/KxtRKNcyPXs+lZRXEKIE6ENhHPysmO/q9N6Fx6rG68qud7jJwyxWZwX4hDcRYdhxMztiQjt9H+x7v1qM4zk6uhgSZQ4E=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:04:38 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 14:04:38 +0000
Message-ID: <74e7a97d-d9c6-bfc0-9ad9-bdfc2bcb6060@oracle.com>
Date: Wed, 19 Apr 2023 09:04:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/4] hw/acpi: arm: bump MADT to revision 5
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-3-eric.devolder@oracle.com>
 <20230419012905-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230419012905-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW5PR10MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b425124-6ba5-48d1-fc36-08db40df0337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIOBiHsfPR7W4cpq5bOfC6uZHVdFyZENrC1Rd0FhzNx2oK4jvPtF9fkdV5739l/0AgzQg+tw0c46oNFKG5CDYXTXuAfxMhgY4fctEAE7rDFF2no4jnx12PnNBuuNHOjY8ZkQpyWS2XpVdmAx2pOLUsK2S36FaQjoXLeVUjQBiP8m/2FWiYNJAUMiGzpiPXJMHwWbWZD+MEMF/ZeDIkxVYIf7BTy8fh9W8RI0tNakQoilnK2hyT4WrKIZ4BrM3kNw7aaP7JaYhNOUbjbkQT6q4HTTCFA901fCb8j1bQAeOpYzBlsUl33oeOfqRo82U20nj7aZN66BohqI06OJcjrpo0oruyCPE7ZAbhrPSSaI6QeJMZS3+nuXV5iqbO/fugVt03N+ETYm0jPw8BctkAtFV20ZS3GeVzf6Fv9qR9mkt1kjVQ6tQLtrRsJaBmFhIdgudKorVaBVMcvSBuaGM25/dA8ntvUBGneURMRQubKh+zA78tBnJTMwrVqUibnboAjtRbOB1pOEvB6YTlpuAjevInRi0rZbUVUbobSWBmomAbOIgk7uJyh6V/3UeSBbXg+YRYdyaZFYGLKtiC90iebP6xMxSHabYDo3yQudH4QBQ+lMO8w7lS6Ptxp/oeLUNLv+LKRCYgPhvoySwN2MKlCU9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(316002)(2616005)(83380400001)(478600001)(107886003)(6666004)(6486002)(6916009)(4326008)(41300700001)(66556008)(66946007)(66476007)(6512007)(6506007)(186003)(53546011)(31686004)(5660300002)(7416002)(8936002)(2906002)(38100700002)(31696002)(86362001)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3p5VmQvSTBoRVZtQXQwYko2VTAxWkZVRHVBUk1tNHYyMy8vNUlhQlVHbUhX?=
 =?utf-8?B?YkI5ZTJOc212NnkrVWpFTytpN0xpR3BwZkx3dWN2SlVKbEloR3BxZGRpSGR2?=
 =?utf-8?B?ZkVweGp0OGFORHY4d0JtSnMvTmlKU3F2SUxtekxKR1ZucElzaHpDNnAzeDJW?=
 =?utf-8?B?cXp2bDArSFhYUFdiRFFvOUdPdExrOEduMjRZYlFiOHpJK01nK0xQWlVmOHp5?=
 =?utf-8?B?TXEvV3htT25YNlFKNlJmQTAzUFJpWW93aTdFN0tSb3Z1NHdEQ3ZFZUMvdHVL?=
 =?utf-8?B?U3NzeDBHYlQxMHBjS2M1VGxUbS9ZYXRqVTNkQ0NHTGhrcU9XaWtVZjBSMkJQ?=
 =?utf-8?B?T0RHZmdaTll5azhNZGZ1NkQzTDhZK3pkY0srR0dySDhYWnpycWlNSUd6M3ZD?=
 =?utf-8?B?Nk1tTjYxWEdyclJLbnlsTWl2Mm1UdlgrQklPcVltMjN5REhtcDcwSk50Q1ZR?=
 =?utf-8?B?YVQ2aUF1ZlVzUlhaRDRKR09wRnNFQm91dy9aaElTRnlsWS9YR2d0ZS91aUV2?=
 =?utf-8?B?bkhRQ2NPUTBnV1JrN3ZTdlpRSzlJa3VnU2VCdDdNQWg4SFdocmdQY2ljUXBk?=
 =?utf-8?B?eHZGaDFaZXFWS0doSVhUSWNLT05UUVlKU1hRRzU4d1lQZHlaMzFsRWtZUFA1?=
 =?utf-8?B?MStweEZ5bXFVbWswMXhjU1pCeGx1T2NrV1hmaUg0QnZMSE55ZjNNdnVvM2xq?=
 =?utf-8?B?NGF5VjIvc2t3REdsTjdWYUd0OXhSc3ZPRHdLeFh5MGRLcFN2RE9PS1lRNGlQ?=
 =?utf-8?B?d0RHU01Xb3hrME1ZZ1plbUErZkJKUmZNTTQxZDgyc0RXQzNlSTRtZFZCYjZo?=
 =?utf-8?B?NEx0NGYrZi93ZG0rYjBqWi9BT2lEcmZQRmhTQ3hVSXo1QjR0bTRXUVFnYmw3?=
 =?utf-8?B?dmU0WStTd0VoVVBkb1dveS9adVZKZEprTW5XeXM4QzAyUWNzalpteDZtNGR1?=
 =?utf-8?B?ZHlDYitNZzJVV1hrNlRuRlBRVk4rb0l1cEZVbTFsMWtveDFWbzRKMUI2d0Nt?=
 =?utf-8?B?UE8xVUZCRk9IYW9Kb2pLTXJjaTQrVkVkUCs5MlkvT29VSjBqTkM2Yzl6ZUFw?=
 =?utf-8?B?MDVxcFJlM3hnWThHY2FqdHdTN2UxUEJOcjNRWjdYeTlNRHNvcFU3ZmZGTVRz?=
 =?utf-8?B?enJNbTdHWTgwOUNGaHpabEI0QldnRE5iYW1KSGptbjRzNHNBQnJkT0ZaZGoy?=
 =?utf-8?B?anpuSDZONFo0WHovSzg0ZnJRMHV5OGt5aVNkRWV1SmNNbWoxWU10c0s4NDFI?=
 =?utf-8?B?U3BHUHg5cENRejFoWGJOd1lGRWlENHNpcnZvVXVYeGtyKzZkM0d0UEIvWjJv?=
 =?utf-8?B?MkE0aDhhb2FmQUZtQlhES1BiREZVWWJJOURMenEvTEdFQWFoS21ZTitkZE1m?=
 =?utf-8?B?eDRtUjlqcWpzQXRBUjY5aVU3WEFNYTlQVE83UkdaZ0FJWHU2ajF0aFQxbnN3?=
 =?utf-8?B?dFFEVUFlKzY0WUx3czFqNmtoaXowYnBSQ1M5d2RzTFJ5ZlRlUEVIRWpDR3A2?=
 =?utf-8?B?S2RKRlVGeG93WGRldHFtTDlIOUs5bzlFTlBFS3hmNXFnZlYvb1B3U1BNanUx?=
 =?utf-8?B?RVoyYjFoZTZtN1F2SW9yemhodFQrRFkzdCtCS1BjQ0FRYU95d01KdG1yVmhL?=
 =?utf-8?B?Q1FzdTBDQUltcVBGTmFrWFdCNkU1OVd5cjB5dnJ3Rm5tN2RMSDRURFNuNUVO?=
 =?utf-8?B?bG5mUFRVdXQwMlFJZi9waC9xYkNDaDJSV0NibEI4bjhRNUxPV2ZMaXlmOTJ5?=
 =?utf-8?B?aVZSNm0xa2gyUTMvYWV6V09LZDV1N0U5aUhLVy91ZEhLdXovU1pOVXJRMzJD?=
 =?utf-8?B?TVg3L1JsYU5iOUd2UWw2K2Z4K2lXbzE3N1FnS1hvOHhpTVRwQTY0bDVnekFu?=
 =?utf-8?B?NUI5ZlVib0VkZlNsNnFoYllkdm15MFlCMEdHdUcrSERzZWtSbzBkVGprY3RB?=
 =?utf-8?B?dDVKOGdEcGdOamt2WXQ0ZnpGV1hBdHg5QjZDZGp6ZDMyd2JBd1dNc2p4dWFF?=
 =?utf-8?B?YVF0THVoemFOdEdIbklNbjZCMDEybGZ5RXhIcE5KNmswZnN5QmJWK0RQOGFO?=
 =?utf-8?B?NlBaNGcwMTk1YVJpTGxkVzZ1T29HNGVLRnh0MXF3UnF4eS9vbzN0Yjl0SzRL?=
 =?utf-8?B?cDN2Mk5hQjA0Nk9OMGpLQ3ZnVkZ4cTZiUWZZYlc1blZsWW1kYXl1RzI0SXRB?=
 =?utf-8?Q?XjCiDqm43v3yNvd/zVwF1U8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uDhAqi0+8JneOqJoObKcHyXHPfWQKi4IcLkpx1uuS7AaAEQmnw17/BA9miJkVj6NbXc+dobihAh6DzDtl2Rez3EyxhyUf0TgtO2FZfwUOZPsZBEpHkDbUe+f2iGEKTAASCJLmuJTxEqdOu82qw6QAnXIgHF9khiwb9yMWryP7SWtO4uEjU9f+GOidyOehYKPJ0PJ5isC1Om72NuJLnB1olLhdutGZGBV0ooR/ZbdME/oXxPOSc2oF4pVaUHu8WCfNNxjs/qD0LXmboVEjqVbeBdjJH6f5jQuPwTlWgQiLiXFFJCb00qG01pOo7fazOj9ZnUJWwqBCbBD/ludD61zorHRjU4aMWOoChPcMIJhHni34XHGbJysu3wKmCU+b2lWa1k30EQlRLe0J3v+Gugn14ATJsMGsLo8Pb7tobIPt2S+C/gc3Lmw/ESZVpav9vdtrt4+kivaxS40MWolOZ7ZY/MRl7A/7JdwmXxSQMgIAvTm0oHT7v0PQPbUgTNhXoLebL0WF0Xh7maHWZonaalZmr68D/jHR70lsNv4AmOIIRaTbGVMPNlGCx87G/EYavNgKIr9Qs026xITV/B6cbNBH6NuTyE5LlBN5c2snHda0llGUiC2MY2brJhG7FVQzbaumuVR96wAoxMGsR7hrOnuBrkaJKu9TvJWrzuKEhmFXYTFFAY/5VE9vjr4taSNQU6v8ZL1u5F3e1oFD8V3nqGkVLr6DCBHpL9axHJdElrUOoAS9aXK5w4ZKYNKwSk51/O348oiUQ9tbwBu4hqMBP8964gjnmBzQ2rrG22+yJvznjl1LgsoVdT0r8RGmm1xU3t2zplU3fpN5Tt4ztTKxv3nU9wCD5nMnSfltNhc4UOXgcBaSU9naNl4xvm3sK4VBfgPEWCCkyPRPeSZLfq/hSR/Zg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b425124-6ba5-48d1-fc36-08db40df0337
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:04:38.1080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ObBtQs8eq4PAqOg2mUS/JhCWkUrjCw10bcFm0QP5KDb4i208r9hDLk5yvk5cScfaCtjdZpGqDAm8nZkovf52Ya9qkK/v04VRoYowWt8Zlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5825
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_09,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190126
X-Proofpoint-GUID: nLz7rz7alUBnlQhgGaQNSKnmlkSfmELK
X-Proofpoint-ORIG-GUID: nLz7rz7alUBnlQhgGaQNSKnmlkSfmELK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/19/23 00:30, Michael S. Tsirkin wrote:
> On Tue, Apr 18, 2023 at 12:52:17PM -0400, Eric DeVolder wrote:
>> Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
>> introduces MADT revision 5.
>>
>> For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
>> field. This new 2-byte field is created from the existing 3-byte
>> Reserved field. The spec indicates if the SPE overflow interrupt is
>> not supported, to zero the field.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> So why do we bother changing this? I'd rather defer until
> we actually intend to fill this field.

Perfectly reasonable to me. I'll drop the ARM change going forward.
eric

> 
>> ---
>>   hw/arm/virt-acpi-build.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 4156111d49..23268dd981 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       int i;
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       const MemMapEntry *memmap = vms->memmap;
>> -    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = vms->oem_id,
>>                           .oem_table_id = vms->oem_table_id };
>>   
>>       acpi_table_begin(&table, table_data);
>> @@ -763,7 +763,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           /* Processor Power Efficiency Class */
>>           build_append_int_noprefix(table_data, 0, 1);
>>           /* Reserved */
>> -        build_append_int_noprefix(table_data, 0, 3);
>> +        build_append_int_noprefix(table_data, 0, 1);
>> +        /* SPE overflow Interrupt */
>> +        build_append_int_noprefix(table_data, 0, 2);
>>       }
>>   
>>       if (vms->gic_version != VIRT_GIC_VERSION_2) {
>> -- 
>> 2.31.1
> 


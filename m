Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF646ABA49
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:47:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7Pn-0007mK-PX; Mon, 06 Mar 2023 04:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZ7PS-0007lx-PV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:45:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZ7PM-0004Nt-Jk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:45:34 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3268JC1n005615; Mon, 6 Mar 2023 09:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=VWl/WB1FE8n+71LM3EzNs6XlCEfhKD25Aad6XSq8k3s=;
 b=XcMte/dM7nskeV63eVXiPhSUHWw7cVB2Gy5fxN7/030CAw2roDo51SxMDsiZiwFM56HR
 oE/5NRY1GyZ/lt3a1fRubXH6h7Ty3Ds/CN+42gO9U1MCuJNvFCFE2dPM8Oeif8dDdn/j
 K8IcpAfQpHwd+62DyGbAb0pTOXGxfM4uS27gvbZ6QmtzxcdURzuHhEhk6bVXenRZk48t
 Ni3/a2hEQs87/7xi8HlMTDm8wDU9sx5JsnblRGB0ww4dctCMhP53d1UUyu/hb/cpuxTk
 UFgiqk9NTaK724jukRDBytQDGRDTBtGDMhaB4++VMCUXDCkK6Jqxox8DJj4Q3qR8x//a eQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xtgd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 09:45:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3269WCoO028608; Mon, 6 Mar 2023 09:45:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1d8sgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 09:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7wHj7ve54emJlx9IEHW62Bi4cGone0DdZ7gUFotIHSporUhC3s7NgHE+zskpHg5PU4AVBZ9nh+8ymJZg7tnZe15qys43JtcXiQHrG5xAc3FFfoSqk0TKWTd03YQVRwQd/p8YtLTj2LWWEr77NN++cvKCJHleVlFIPEXbPFUw8nXKbJ3QLKr0iWajorHZecHGXrV3mNeUfjGXX0ZID4zoffgzFJlmzQOIFzDKSRGVz3m6ljZvFp1CqKGBxg1XZQ17cw55QVYH/5cGPck+qoIWF7epFAqbmwioDMmLfLZlSk+AiUT3AUJFWH8VOYPTJuh3VHSA4yhG0g8h+AGv/JNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWl/WB1FE8n+71LM3EzNs6XlCEfhKD25Aad6XSq8k3s=;
 b=gTeTi3e29EUNfyNvzl2Q+XyleTeDfNrFBz0aItXxEPHgsdNwGKlJEiOsv5lGxs1ZIVGzRvGsOI9gnVMuBO2dKAkwW58CNWAxTe0/bFyI1f9Nh6lda1psaQzMotJ4aAVs2Dl1TRYxT/PBrklVKhgwOvKksmPqPwnPrA6ci1S+SpSpHsuR8o15DQm8de1zdVo1R/EvH1JSVFAo8sj99gf4PxljW/YO58Q77J+zJMRbpDK80JRlyayQ6ea0OooQQ1lym5m/+9YXHcswN3OjXhuf2Wejxzi1iiEDmV67fXpGE15tDGJRUobqd/p3oPlUeCsAHLd5nJR9dq2rvy1FDd6+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWl/WB1FE8n+71LM3EzNs6XlCEfhKD25Aad6XSq8k3s=;
 b=dp5xf+1Q9z76UcZfzv1WrqYpzJvgRZjbkQxnJT6js7bxupHOcxZGjDszZBxNR3Qa7g+FEcHoPD2GwVxp8pwGK4J2XJOBoBPKgZVzhszD39ho3hOCESs6fQU+qZJgRDNLW4gUeE0Zula87JhXmFEAYVpZ01dTvXGUns/sEzFeYQc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5753.namprd10.prod.outlook.com (2603:10b6:510:146::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 09:45:21 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 09:45:21 +0000
Message-ID: <73116eef-872b-5845-4a95-01d6155f288e@oracle.com>
Date: Mon, 6 Mar 2023 09:45:15 +0000
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230305135734.71d54dd1.alex.williamson@redhat.com>
 <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
 <20230305191913.562b7a85.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230305191913.562b7a85.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::31) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH0PR10MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 995e0539-5d10-4a78-7bda-08db1e278069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLEAR59+mIPrHg8E8DhBYqbCdpv02ZlCTD3nCD+9VLJdkRdh3sHoz6N8FPRpEgASM/h22nDyyexlXcS57aoldcNL1Jy+lmf/e2r0x5uf8sGm5dbtVEMH2x9JmZ9f+GR5oBtqIYLBdYF1NLl6aDJUK76nBdiWZ+7p9kSJyeE8oJxIzwDaek4sLgUUG1jBXJk2VfN0oOwvSVEF6u7AGvV0jwDItQoamxraFbKFGUwsdd1Q6yKaC58tTmaxX7kgvXiLtC6XY7l4wPS7rnlsSw30LKIOvs12CE02aIxJ+ldTh3O54W5X9WfuQyGD63lKFy5MO3bmvKA/UD1i/LZWQH4CYbPPQTwf9aqHNmFFIaGJTMxNwNyxKPLBknmuDTHespg6ZoHRUTnabk0KjaFgsPqtGv5lVrykoAeJQLN97Erb96MbBIPSD/FWtvpq2HVXPrQ0e3k5wzSGfofDFFU0zOhH3YTcfFmkXXhi9dpe2rSSp7woLipAF2p1GpruNaTYOhPGH4YgToawgMadFiXko6r3AKJUCAPEkRbjTP18J8yJoFTfeQsTISz41IoO+UkaXbkFunEVdj2jbQdZpe/h78ZtCx3qiH2AbC+PigUIDVx5cxKS1jNMSEbQAAyFvVjHGpsiC0BXs1RJQJWHcfe5d17o095Ttj96O8S9xxRHDX83t5cV3MIUXTaEg3+Bn5T1jf5PNLlZgf3/M9s7OJT4zEqNf95I1Ah46AV7TLopQZxzuGU6cwdvvLyCz80fHbUtB8W3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(4326008)(6916009)(8676002)(83380400001)(66556008)(66476007)(66946007)(186003)(26005)(316002)(36756003)(6666004)(966005)(6486002)(53546011)(478600001)(6512007)(6506007)(2616005)(54906003)(41300700001)(38100700002)(2906002)(86362001)(31686004)(31696002)(5660300002)(8936002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lrSWVXWnIvNDhHZUtmK2tOYVJDdUtlNWlMMnUybWxjblg4ejFad0Q5VkdO?=
 =?utf-8?B?T2ZEdE10Rkd3cjc2dU1YQkMyK3F3UDlRWW14RGlUZmdaai9zSEtWbE9PNFJh?=
 =?utf-8?B?T0ZHWW5teXVITEZsRTdTVlh5NkIyYVBwR0pjUm1WVmVxSFRIVU1TRThFWWM5?=
 =?utf-8?B?N01XNjkwWHluMkVBRUtvNGVTQXVlaGtZU1Y5R2o4eUdxK1N0OFlZazFRdVVN?=
 =?utf-8?B?Rmozdno0NmUvb0JrM3NzWUhhNFE1aC9GWmVJR0ExMm43NHYzQUNkRk5HVGZl?=
 =?utf-8?B?TXk4Vkp3YVdjaVduLzVNZ3A0UGJGSDlPNnhSbHVWdDh0Y3g4MmQ4TWE5SjFS?=
 =?utf-8?B?UkE4SUQyWWhYeFQ5UHQ4a2ltdHIzVXFydFNJSTJTcFFxUVF1dFBhalR0Qnpq?=
 =?utf-8?B?Q3ZrYlFDYTVuU2pNSithQngwdVE0a0o1bTR3MVdFdWk0a093Y3Y3VnFIOWxF?=
 =?utf-8?B?clFLa2FxUThwdjVqRTE4cXBINEE3STAwTUljNWpQOURKK2FBUXpoSGJVY2wr?=
 =?utf-8?B?T0U0ZktscTgvVmFONndlUVNMcmF4OTE2L0RCcm1uUlpzWlV4ZFBjOU5lQ1pi?=
 =?utf-8?B?eHpVYkZyQ25sNkdZRUtnUWF5dlVCSWlxbkRKWWxMT2J2b05uZEplMFZRSGxD?=
 =?utf-8?B?czZQRG0wcU52c1ZWWS9jYWpqMkt3M3lTRVdxdUVtMnN1UHJMSlJkZWM0cllp?=
 =?utf-8?B?MytRZ3I5MHJuRkhVL0tCbmFvMVhvOHc1Q01GUTV2R1Z5dlJwdTRyMzhxZTJt?=
 =?utf-8?B?OGp3RVlyTVVFdmF5cmYyYVdqdXhzbkgxajVIMkU4YjlOazVPTFNFMG9oSWNJ?=
 =?utf-8?B?M2g3T3V6anh6S3FvYlBsYmNnekh2dUNjT1VzOEN4cmJKd2w1SGZRNUtoSDIv?=
 =?utf-8?B?bUFKS2MvMmladDBab1FKbHh4NE5WM2tZT1NYZ3VYNTlCQVlXQUtYRkpvUllZ?=
 =?utf-8?B?OGphVmdQN3BmejZyM3JrZjJWUEg1ZThCUnlKRWVDbkpTNXArV2xUUm0vNXYv?=
 =?utf-8?B?K1RNV1F3Z2JwaWR4SXN3bU9Zb1dmUFVaVXVSVkcvbVdVcVFCS3l1Y3RQV2xK?=
 =?utf-8?B?NWJVUzZWYWhCWU9kTFpyVCtYaEJURHZ6aGJYOXdxZ0RtZTRCZUdEL0Z2Rkt5?=
 =?utf-8?B?TTF6Yk5xQXB4dWdKOE83dGdUcW5OQU1kTDZqUzdLUUUvWGxqbloxRWdFcE9P?=
 =?utf-8?B?K29pQ2JhOE5xamQwQ3NhYkJ6VnExeWkyRGJKQVBtLzk5UG1aRTU0Y0tkZXU4?=
 =?utf-8?B?YXZwZXdqL2RhdnZNcE93QXIwZFdPVXRzdTRxMnlCdVZXVVpKMjFHazVQcit0?=
 =?utf-8?B?NGxaQzJyZ0ZMLzFRRUkyc0Y1UjJhbVk0TVExTUhKVlFCdWpZVWIzUjdHbWpj?=
 =?utf-8?B?TEVwZ2g3Z2hzVVlLTVNLaEE0WWpLa3EzN2RJQ3huRzRwNmJqbWkycm5ka0VM?=
 =?utf-8?B?NzBPQVVaQnZPMGFSWWJWQk9ueFErbVppWUZhWDByemh5ZzBXOW95K2o3eHRp?=
 =?utf-8?B?d3pzUnZmNWQ0dnVhS00ySDAwTkFwb09mTUFNbXprVklaTWRPOU9Id0ZCSmxZ?=
 =?utf-8?B?UFdyR2pmbDVHczhvY1lzNEU3THhJcG94b0dmdm04Z1Voc3hKdGMzT0wvbGgr?=
 =?utf-8?B?cWNTV09xaEVSY1dVNXdsVDBnNXBaaTdMKzZDd3NXblN5UEFUaDgvbC9NaFlL?=
 =?utf-8?B?Rnh2SklwVmxsQVZ2OXVhNmpSZ3Fvb0hMUnRBUGNaVXo0bk5CR1l4dUV5VEFZ?=
 =?utf-8?B?R1ZURFBLS2JwQlVBWjZVVVB1cFFMSmlNLzZSMVpYOFlGTjR3TEkwOW50UW1u?=
 =?utf-8?B?b0grMlBIeC9PWEdWSlpGMGxBYUxLeGxSY0ZyeFNDZEN5QXJHN0hYVzMrMGJo?=
 =?utf-8?B?dXZnSzViODNoQi9LQkdndGQ3V1dZT0s4c3BxandIbnUyc2FGVytLUlE5cUZH?=
 =?utf-8?B?NEp2VVBKanVOZXNLOEVqbXlJd1ZCVnVCUWFyMFVqMUFzZWN6ODUzelp4VXZ3?=
 =?utf-8?B?WlN1YjhhdDNxbkV4SEVGWGlOdmRaZDdkSlg2NmZQT2wzbHJ5TlgyNnBzRjBO?=
 =?utf-8?B?ODUwcUNMTnhmQjFGMUlxRFpMVHJrV3NiSXdsNGdYajFaNXJsZVZoVzlHWWxh?=
 =?utf-8?B?MFFkQVY1VTZ1eW5QVVdsSUp1cjBtdnA5QmplQ1RORGFzVTFmRkZ5Nkd6YmxV?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rF9aqcegxOOQLfSHjMCEH+eYF/RXh5DaxlR4x0P6HUUSs8bkdUdJ1RZaVhFfWo+woFGiMtMyG9D3yxu9Y0E3iIip/TBNa7RQYvZTU6girZesjm0Q06EQSaX0sJE2Q6AY+gCxqyiBBkMw0hpqUo66mbn3/1w+8cqNynBqcK3izEGI+pok8WQeJgTQaL+wRmmaaZJrgYRb2moIqrisiSuGueFe2nsAsOxE7bm70oIiFPJ+aPiU0caXqB407pdpGrBnWNL4NrYWkwHpFmwd8hsvWKmyLV3gIWWOtanXEFBOLuY/mt8DPxmBpG4UjohI+EXb6caEy1+QrXI5nE88+62WEeR7/3djol1f3b6OIBHX+WBqkydxzlU1eItY1SMldH+iyqS4opQcq7a70BOp6XW0sjl0ZqdCJo7TwHmaKf61VkrhuZbrnQt1sy3ZGzim8STp+nyQQD1GhCIJLC8reCBjEiGAhzgehczjcpH0FUgkC/o+7Q3zsHIMBAUUZV579/0JVWM71121xI1gkoG9cVXKMD39y7evluHzta4CU9/Ts/Lmtp1TQ25Fsn3OU3DrvSnPmZ+9la9vS0xgDlD4am0cpI5oKhqp5GAk6xWiqUsp7TGieiY7PRo0PYxHehiYICS9Ow7h3MEx120rqFyZ1zGLL7T/2G29TPtJBRolSm6d2GIFfNkHHirwhNTaJSimLjAK6v2lM4/9BqwUdDHVKmDE8YMotyQ2XeluRAM4RpcHRC3jgtzGF3UZjgPJ6pBCwu0FeDfsjxSdcv7jf1dwmuQZNsj/X1A09lQXD0TC/6wz8acRVo6AktFgIXGctqDl8W9I
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995e0539-5d10-4a78-7bda-08db1e278069
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 09:45:21.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XfXXcGXPuOZddrvneCXPbjCiLNhnY7rrVzVILZJ4jqU12xm5Aw9L3zNJFZLrjVrYVpbWrjSrzY1XspBwAoxymr64/iV9Qu+Nx/acxer/lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_02,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=984 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060084
X-Proofpoint-GUID: cR2OJsZ-d1klqcTO5Rem8t2FzxZt8GAX
X-Proofpoint-ORIG-GUID: cR2OJsZ-d1klqcTO5Rem8t2FzxZt8GAX
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 06/03/2023 02:19, Alex Williamson wrote:
> On Sun, 5 Mar 2023 23:33:35 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 05/03/2023 20:57, Alex Williamson wrote:
>>> On Sat,  4 Mar 2023 01:43:30 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> Hey,
>>>>
>>>> Presented herewith a series based on the basic VFIO migration protocol v2
>>>> implementation [1].
>>>>
>>>> It is split from its parent series[5] to solely focus on device dirty
>>>> page tracking. Device dirty page tracking allows the VFIO device to
>>>> record its DMAs and report them back when needed. This is part of VFIO
>>>> migration and is used during pre-copy phase of migration to track the
>>>> RAM pages that the device has written to and mark those pages dirty, so
>>>> they can later be re-sent to target.
>>>>
>>>> Device dirty page tracking uses the DMA logging uAPI to discover device
>>>> capabilities, to start and stop tracking, and to get dirty page bitmap
>>>> report. Extra details and uAPI definition can be found here [3].
>>>>
>>>> Device dirty page tracking operates in VFIOContainer scope. I.e., When
>>>> dirty tracking is started, stopped or dirty page report is queried, all
>>>> devices within a VFIOContainer are iterated and for each of them device
>>>> dirty page tracking is started, stopped or dirty page report is queried,
>>>> respectively.
>>>>
>>>> Device dirty page tracking is used only if all devices within a
>>>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
>>>> used, and if that is not supported as well, memory is perpetually marked
>>>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
>>>> support, the last two usually have the same effect of perpetually
>>>> marking all pages dirty.
>>>>
>>>> Normally, when asked to start dirty tracking, all the currently DMA
>>>> mapped ranges are tracked by device dirty page tracking. If using a
>>>> vIOMMU we block live migration. It's temporary and a separate series is
>>>> going to add support for it. Thus this series focus on getting the
>>>> ground work first.
>>>>
>>>> The series is organized as follows:
>>>>
>>>> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>>>>   adding device dirty page tracking.
>>>> - Patches 8-10: Implement device dirty page tracking.
>>>> - Patch 11: Blocks live migration with vIOMMU.
>>>> - Patches 12-13 enable device dirty page tracking and document it.
>>>>
>>>> Comments, improvements as usual appreciated.  
>>>
>>> Still some CI failures:
>>>
>>> https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474
>>>
>>> The docker failures are normal, afaict the rest are not.  Thanks,
>>>   
>>
>> Ugh, sorry
>>
>> The patch below scissors mark (and also attached as a file) fixes those build
>> issues. I managed to reproduce on i386 target builds, and these changes fix my
>> 32-bit build.
>>
>> I don't have a working Gitlab setup[*] though to trigger the CI to enable to
>> wealth of targets it build-tests. If you could kindly test the patch attached in
>> a new pipeline (applied on top of the branch you just build) below to understand
>> if the CI gets happy. I will include these changes in the right patches (patch 8
>> and 10) for the v4 spin.
> 
> Looks like this passes:
> 
> https://gitlab.com/alex.williamson/qemu/-/pipelines/796750136
> 
Great, I've staged this fixes in patches 8&10!

I have a sliver of hope that we might still make it by soft freeze (tomorrow?).
If you think it can still make it, should the rest of the series is good, then I
can follow up v4 today/tomorrow. Thoughts?

	Joao


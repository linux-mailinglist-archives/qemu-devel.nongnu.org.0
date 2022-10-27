Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1D610545
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 00:01:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooArd-0007bN-No; Thu, 27 Oct 2022 17:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooAra-0007b4-CY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooArX-0001PF-Eb
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:34 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RKRMMx024771;
 Thu, 27 Oct 2022 21:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=zDXwCZZO8CJMSGb9zt3fatG+AmqAYlTAsXYcP7BdVQI=;
 b=SxtTPiOfOhnKeDVTgVuhut52kXQDp5P20Jn8XL3lnpeKFT7faBsRZ5uP9lstXb1tijcx
 S6hy739u2Ct1u+7usXAoWyVl+Ga21S536EY9qKkblCrmqB5VGrshv1KHe7oUbZlvFnxz
 HITCx9yfHL9YMwmIR15dt3MAnYl812aEUPZC7Oto7UlxYxv/1ECZwl7cSm5cetbEFRJX
 nWmmxU40o6bUP79nNeAbwOB8jGhy0GbXJxQ9CEPBmw1Kjss+Jd9XXfxiUik/4oGSoCib
 GVTgMhQu9a9EbrnRIxoCbbh+7B+2kYmttj9pDG2kRv9PrvaKhVDm3qNmqMKkE9mUG6Aw 8Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfays3nv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 21:56:25 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29RKxexu032714; Thu, 27 Oct 2022 21:56:23 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagnf1f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 21:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSgnv3oe9XbZnLB39FlnY7gL64xji0IAVMghRSfooYaYS8d4pgoBj1Vj/2Pgi9oBcOhVvFP2hfQCahktCcR6LfFk9a6+xWA/hlZLkCry0mRoV6HrvNaPYkZIoz/A/mYCbBVike0dEIj/htQYU5D8JlVFoshaI48mZhD1td091DW1SFdTPBYoAp+Jeb02KkEjya+ThFs/Sz1w6A8ZTzupg+y5yeGG/7S4J8ZBVPzKdDjHsStY7LQ2wBnLdHCu+lHH0w9q/oZX/fXKJ4n2F+0JT8pz1pQ6rYhFDZM6D82fvIwhNo0lxfbWC+SmvWhowiox1FjJvQfyYg9hcnig/EyLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDXwCZZO8CJMSGb9zt3fatG+AmqAYlTAsXYcP7BdVQI=;
 b=Lh0VsRbxBLqxtP4lrHRAdrMVf9R4SBcmaNGrx98ZsV8YWbRK+rpE9sYpsgvC9fhS0sZqXABGhhuKY9gnoDwqdeuGPZQ8SiSTqiBGE7Sj0UKTBiuC4ANnflPSk1VhBTloUhMu3Mrg9QXEdoOIxeOAQozdzXWIbxN1IseGco2x1n5gArfmCPtzIL36tUTHgooW0tfScFwpAiczExskwOwOgm6HF6I2N0IDOSADsMo8GZhz4Kvqn+fMxMLK51LxkHbLE4oluLllks6yVkc9PsZhdOWHaKRlTHrIBMzzJrh2bq/l4/FqtFEYT1IBELZS2Jp52X1kyHtY6tmjDT6BZijpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDXwCZZO8CJMSGb9zt3fatG+AmqAYlTAsXYcP7BdVQI=;
 b=afpTHO6xrmEd98AYuJpbqdZatqk7QLOxPZ9ub5msjjCCmYGsiWYMwp3hh35Zyw/B/DGFTK3lfJyA2mr9FbTbrUunfn5PQsEqtcbYhkkS4TJuKzbM4gIMpp4BPOHuyumJrKj9emcoqunqYiWSn3azc7yTfjrnxQ3wOG1iKe5FlOM=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SJ0PR10MB5583.namprd10.prod.outlook.com (2603:10b6:a03:3df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 21:56:21 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a%5]) with mapi id 15.20.5723.032; Thu, 27 Oct 2022
 21:56:21 +0000
Message-ID: <dca26485-162a-6c61-33af-94e062503e11@oracle.com>
Date: Thu, 27 Oct 2022 14:56:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>,
 Shuo Wang <shuo.s.wang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
 <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
 <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
 <d625202e-9729-a050-db31-da2a5d89d58c@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <d625202e-9729-a050-db31-da2a5d89d58c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SJ0PR10MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd67313-8a73-4c21-80df-08dab8661541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTaXmT02IOH4iBU3U0mLKhbtGzMNpBDyPb5ymX15Nw2x6IVtg4jsh/gNsUQMmGxNpAjFkdY86YWlrpPLtj5NGt2WCXBCd3QRinb7iczcVbgzhEV+0zRPUxJ44/i+KQr0x93BuDzqDPz97Nis24iG7Mmh2fNuWHlCX9+oqORHZfQEWQVNlrnp42fmKpokEYzxj3FC5xNnGbOoT/hlxQ0yK8oLSlC7xZuPY5O8YbGhUokTg3Wjm0kpSjB9CSCJ6INYEs6YKBluy5sI8f71DDwHdnEBJrxtFziJKWiyviwR/f4R0dKT2Noy3I0BRSPCvI0Li0ajXVxgeJzOKYHc7CfRlwkH9O2HRkp7L8WbOBP9cOHuz6kiTEQvRXtkRyNggUwY4r45xRR2ZfxwAlF+LMeacDSwoQy6AGSiXEhzXdb6Cnpsv0PVBz2EncPYffPs4WnTHGISyzJLQQMsMU0gVGwn0gr753GuFiNWJf6mTLq5kVgBx/wTPBzXW4dPbKfalTNmfkwig6d3hyFaQfjXiMeEAu6dyWGhSF1n7XqBvCdb7zGkHzNJBIBtehSJ3uJwtJEX8LI3CAGDMGUGLzRa+n7M6ifXh4WtSs3TGWtso36ltgtrHqR6euhB1m8syfkNdxb3Oa9XpZuR7PnRVUZGAytBX7NnVBgl5bpR5GYBm2p8FlXzrUfOk6GjPjQsDxztKacMWV11866s+eMaHbzhyIUGWB2Auto1O/BOOyaoqHO7L1kA6Q799RTBu5cfL+6fMl6umVc0s/IGLLPXxw/iBuTf9FigCsqz4g4wR7PJEgSQ+qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199015)(478600001)(31686004)(86362001)(66899015)(54906003)(6916009)(316002)(4326008)(8676002)(66476007)(66946007)(107886003)(66556008)(6666004)(31696002)(6486002)(6506007)(36916002)(53546011)(8936002)(41300700001)(6512007)(26005)(5660300002)(38100700002)(186003)(2906002)(66574015)(2616005)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODdhdXBvZUFhWXNkUU5RUm5tMGZZSW1IWmFYTittVzN5TDNWdm80cS9lZnR2?=
 =?utf-8?B?YVlkdjNwRmJ5d3Iyd0JvZFE3U2NQTDFqVnF2ZHc5bkJkV1UvUi95WEVvUGhO?=
 =?utf-8?B?c1hpUmhZWnNiWWY2VWp5TGxxUTR6dlRSRjZNdCswaXdleHg1UWZLdEtmUVFR?=
 =?utf-8?B?QTRhNUV1N3k0aVhjWUU0Y3d3ZGpqQ2FEQmpLY3NUVDFhaDhCUGJKUUdMRmpL?=
 =?utf-8?B?OFQxM1o4dXdBRHdWTVFRaWF1QTBxYnZpak9UajR5U2k0RWcxeFo1b2RKWEJZ?=
 =?utf-8?B?emFJRVMrSXkvNHV1dUs0UzlWSko2MkV2RUdKQXhKb0F3a1NlNEV2bmhOY0ww?=
 =?utf-8?B?dUxzRm5IcC9sMHZNT1FiQ2tuNXBrL0dwYmM3SFRLY2d1bTBTb0RWQldPbXhZ?=
 =?utf-8?B?VVlObDBlN3A3anZxVEkrQ3JHS0RkYlhoWlNvQ0trZmpFQkZQMTZvOUZ3Wjh1?=
 =?utf-8?B?Q002QnF0QXExOTBtdG9MT3lwQ25sUGoxNGpmbEpvOG53RWZUci9nSEViMVBJ?=
 =?utf-8?B?dXd6SmhtRXg3RExncUIreTNrc0RGYkZtVDZlRDZDQVRNRmFCRG1uS1ppbzBJ?=
 =?utf-8?B?QkQvcjczV2RNTjNuUXpETXRPK3I3UGN3bnlJSlhhb3VDYWVEd2NSenRhOG5P?=
 =?utf-8?B?SDN2UkRZRWFvU0d4T1I5R2MrelBWdGUwbDNrOFR0QU9FV1d6MGRQcWRUWWJq?=
 =?utf-8?B?S2hvR1IzcXAwcnRSVkd3Yi9mbk12TEdlM0hsRlVzYmlsWEY2RDhFQTZxZ3RN?=
 =?utf-8?B?aS9LZWk1b2NZS0tWbFpySmp1eFZTRVJrL3NNWVF5TGV1T1lCckdZZ01zSXo0?=
 =?utf-8?B?ZndxOGE2UWNuS08xdlZMMXloMXJMT1g4MExmME1KYUszV3pyUUFoM1ZZNGkw?=
 =?utf-8?B?aGN5dFUwTHFCY3J5UzRERi9rYVFjWEt0TmFOSWpqVlkzTGtZam5DdnB0N2RP?=
 =?utf-8?B?MDFZOU1IQWVUS1dyMWt5M2lvOVg2NW00UXhqUXUvc3hEVm0rZ1MvVXdYeGtt?=
 =?utf-8?B?dDBZNHAyNHNYYktQa2ZzeDVqTmJ2d1NsM1l5aVBRZnEzdzkwVFhFektCVmpI?=
 =?utf-8?B?N2dxNndocDVYRUc2YTFBVXVGZVRSVXEzelIyREhsdW9TMU90dEFaRGU0VWdQ?=
 =?utf-8?B?RUdiUWVNa3BUcGNUWFpMZEV0OXkrUzlaV00xQ1hTMXRXdEpabUhlVUUrbzc5?=
 =?utf-8?B?eUhqWExLVVhmekNDTU4wZDNuU244VXVPbVlGT0xNaFZJTkZKWGNmSXp6V0Ey?=
 =?utf-8?B?ZWVJdXdwVWR0cGkrL1B1NGZYRHA5T0RPeUh3aDhYL2t3ZzhMKzNrMHM0TmZi?=
 =?utf-8?B?WWpLcVpCd3hQcGNhbXk2dHJjZjhNbWdlR2xJc0J4RkJBWk9ySllSZWFKZHRC?=
 =?utf-8?B?VDhrOVVvL3IrYTBYSTdMazlHb1Myb1NaYTkwZ2NvWFhvcjlzQnJtcldsTTFj?=
 =?utf-8?B?K0tYQlRlRHVDN3k4YjNyNURTTXcrR21ra0lyaGhXRm8zYVhFMUFkNGdzLytS?=
 =?utf-8?B?Qno5NWhmZWpEdDR3UFFEVERvK29DckZnN3FlYXhuVWwxWXpNQ3piMzBjVjZv?=
 =?utf-8?B?Z3NWMFp4QXBaVUM2UmRPZFdhQ0M5ejBVVTNGMXkya20rN050SjUyR0krMzFU?=
 =?utf-8?B?RDMybkRicnZ2ai9kNHdENUlqNEx5V0ZieUl2UlZlV3dJemszY3NxNWVXdTU3?=
 =?utf-8?B?Z2kxc1MyYVZVQTdqSnFRUE9pRTZwZFp5NVJ0SG05YXVZWW1NMlNQWGNYU3NX?=
 =?utf-8?B?RzBEWUhCdFcwQ0pPRUpmSWVmTFBiNFNCcUJnUHMxYk5IcFFJNUNOOGpDRFhE?=
 =?utf-8?B?NVFMSDNCYlJCaTdXSnA1ZVZoM1V0VWk5SXVHTmdmejhvOTJVWWhlQlo1R0lp?=
 =?utf-8?B?SVZwMG5qNk9ySjA4Yi91NmJxRERYdjdVU0hWSFpycUJzQ3BRRnZ6L1A2MjZC?=
 =?utf-8?B?U2dYU0c4VWMvOWlvdjA3c1NMTVlUQjRQR3VmeGprUVJLc2FQa0FYTjBZSTJN?=
 =?utf-8?B?dFBvRUpaSzZ5aWYzQVhqelZzcWFtNmFVYzg2OGhCSzIxazFJeU1BY3BweElr?=
 =?utf-8?B?TzIxSWlFaDZPQkhOSmQ2bE5Yend4NUVGamxhdDZrdno5eHBjL2lWZWN1SkNI?=
 =?utf-8?Q?uYqB42azFwedzrNCo92LBFDQe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd67313-8a73-4c21-80df-08dab8661541
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 21:56:21.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiUmdfAz+jmom2YWdPHD/SnqBFqqHMF63gJwbLo6omH14n1vMoH5lP05L4aFCm6lCBvpG973hGh+ammwyFec4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5583
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270123
X-Proofpoint-ORIG-GUID: wKkJVumpvyRorvJIzp4SUCfkBNOro-Nn
X-Proofpoint-GUID: wKkJVumpvyRorvJIzp4SUCfkBNOro-Nn
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jason,

Sorry for top posting, but are you going to queue this patch? It looks 
like the discussion has been settled and no further comment I got for 2 
weeks for this patch.

Thanks,
-Siwei

On 10/13/2022 4:12 PM, Si-Wei Liu wrote:
> Jason,
>
> On 10/12/2022 10:02 PM, Jason Wang wrote:
>>
>> 在 2022/10/12 13:59, Si-Wei Liu 写道:
>>>
>>>
>>> On 10/11/2022 8:09 PM, Jason Wang wrote:
>>>> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com> 
>>>> wrote:
>>>>> On 10/8/2022 10:43 PM, Jason Wang wrote:
>>>>>
>>>>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com> 
>>>>> wrote:
>>>>>
>>>>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>>>>> backend as another parameter to instantiate vhost-vdpa net client.
>>>>> This would benefit the use case where only open file descriptors, as
>>>>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>>>>> process.
>>>>>
>>>>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>>>>>
>>>>> Adding Cindy.
>>>>>
>>>>> This has been discussed before, we've already had
>>>>> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
>>>>> has been proposed here. (And this is how libvirt works if I 
>>>>> understand
>>>>> correctly).
>>>>>
>>>>> Yes, I was aware of that discussion. However, our implementation 
>>>>> of the management software is a bit different from libvirt, in 
>>>>> which the paths in /dev/fdset/NNN can't be dynamically passed to 
>>>>> the container where QEMU is running. By using a specific vhostfd 
>>>>> property with existing code, it would allow our mgmt software 
>>>>> smooth adaption without having to add too much infra code to 
>>>>> support the /dev/fdset/NNN trick.
>>>> I think fdset has extra flexibility in e.g hot-plug to allow the file
>>>> descriptor to be passed with SCM_RIGHTS.
>>> Yes, that's exactly the use case we'd like to support. Though the 
>>> difference in our mgmt software stack from libvirt is that any 
>>> dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ) 
>>> can't be allowed to get passed through to the container running QEMU 
>>> on the fly for security reasons. fd passing is allowed, though, with 
>>> very strict security checks.
>>
>>
>> Interesting, any reason for disallowing fd passing?
> For our mgmt software stack, QEMU is running in a secured container 
> with its own namespace(s) with minimally well known and trusted 
> devices from root ns exposed (only) at the time when QEMU is being 
> started.  Direct fd passing via SCM_RIGHTS is allowed, but fdset 
> device node exposure is not allowed and not even considered useful to 
> us, as it adds an unwarranted attack surface to the QEMU's secured 
> container unnecessarily. This has been the case and our security model 
> for a while now w.r.t hot plugging vhost-net/tap and vhost-scsi 
> devices, so will do for vhost-vdpa with vhostfd. It's not an open 
> source project, though what I can share is that it's not a simple 
> script that can be easily changed, and allow passing extra devices 
> e.g. fdset especially on the fly is not even in consideration per 
> suggested security guideline. I think we don't do anything special 
> here as with other secured containers that disallow dynamic device 
> injection on the fly.
>
>> I'm asking since it's the way that libvirt work and it seems to me we 
>> don't get any complaints in the past.
> I guess it was because libvirt doesn't run QEMU in a container with 
> very limited device exposure, otherwise this sort of constraints would 
> pop up. Anyway the point and the way I see it is that passing vhostfd 
> is proved to be working well and secure with other vhost devices, I 
> don't see why vhost-vdpa is treated special here that would need to 
> enforce the fdset usage. It's an edge case for libvirt maybe, but 
> supporting QEMU's vhost-vdpa device to run in a securely contained 
> environment with no dynamic device injection shouldn't be an odd or 
> bizarre use case.
>
>
> Thanks,
> -Siwei
>
>>
>>
>>> That's the main motivation for this direct vhostfd passing support 
>>> (noted fdset doesn't need to be used along with /dev/fdset node).
>>>
>>> Having it said, I found there's also nuance in the 
>>> vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation: 
>>> the fd to open has to be dup'ed from the original one passed via 
>>> SCM_RIGHTS. This also has implication on security that any ioctl 
>>> call from QEMU can't be audited through the original fd.
>>
>>
>> I'm not sure I get this, but management layer can enforce a ioctl 
>> whiltelist for safety.
>>
>> Thanks
>>
>>
>>> With this regard, I think vhostfd offers more flexibility than work 
>>> around those qemu_open() specifics. Would these justify the use case 
>>> of concern?
>>>
>>> Thanks,
>>> -Siwei
>>>
>>>>   It would still be good to add
>>>> the support.
>>>>
>>>>> On the other hand, the other vhost backends, e.g. tap (via 
>>>>> vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as 
>>>>> parameter to instantiate device, although the /dev/fdset trick 
>>>>> also works there. I think vhost-vdpa is not  unprecedented in this 
>>>>> case?
>>>> Yes.
>>>>
>>>> Thanks
>>>>
>>>>> Thanks,
>>>>> -Siwei
>>>>>
>>>>>
>>>>>
>>>>> Thanks
>>>>>
>>>>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>>>>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>>>>
>>>>> ---
>>>>> v2:
>>>>>    - fixed typo in commit message
>>>>>    - s/fd's/file descriptors/
>>>>> ---
>>>>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>>>>   qapi/net.json    |  3 +++
>>>>>   qemu-options.hx  |  6 ++++--
>>>>>   3 files changed, 27 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index 182b3a1..366b070 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev 
>>>>> *netdev, const char *name,
>>>>>
>>>>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>>       opts = &netdev->u.vhost_vdpa;
>>>>> -    if (!opts->vhostdev) {
>>>>> -        error_setg(errp, "vdpa character device not specified 
>>>>> with vhostdev");
>>>>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>>>>> +        error_setg(errp,
>>>>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= 
>>>>> was specified");
>>>>>           return -1;
>>>>>       }
>>>>>
>>>>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>>> -    if (vdpa_device_fd == -1) {
>>>>> -        return -errno;
>>>>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>>>>> +        error_setg(errp,
>>>>> +                   "vhost-vdpa: vhostdev= and vhostfd= are 
>>>>> mutually exclusive");
>>>>> +        return -1;
>>>>> +    }
>>>>> +
>>>>> +    if (opts->has_vhostdev) {
>>>>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>>> +        if (vdpa_device_fd == -1) {
>>>>> +            return -errno;
>>>>> +        }
>>>>> +    } else if (opts->has_vhostfd) {
>>>>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), 
>>>>> opts->vhostfd, errp);
>>>>> +        if (vdpa_device_fd == -1) {
>>>>> +            error_prepend(errp, "vhost-vdpa: unable to parse 
>>>>> vhostfd: ");
>>>>> +            return -1;
>>>>> +        }
>>>>>       }
>>>>>
>>>>>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>>> index dd088c0..926ecc8 100644
>>>>> --- a/qapi/net.json
>>>>> +++ b/qapi/net.json
>>>>> @@ -442,6 +442,8 @@
>>>>>   # @vhostdev: path of vhost-vdpa device
>>>>>   #            (default:'/dev/vhost-vdpa-0')
>>>>>   #
>>>>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
>>>>> +#
>>>>>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>>>>>   #          (default: 1)
>>>>>   #
>>>>> @@ -456,6 +458,7 @@
>>>>>   { 'struct': 'NetdevVhostVDPAOptions',
>>>>>     'data': {
>>>>>       '*vhostdev':     'str',
>>>>> +    '*vhostfd':      'str',
>>>>>       '*queues':       'int',
>>>>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] 
>>>>> } } }
>>>>>
>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>> index 913c71e..c040f74 100644
>>>>> --- a/qemu-options.hx
>>>>> +++ b/qemu-options.hx
>>>>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>>>       "                configure a vhost-user network, backed by a 
>>>>> chardev 'dev'\n"
>>>>>   #endif
>>>>>   #ifdef __linux__
>>>>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>>>>> +    "-netdev 
>>>>> vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>>>>       "                configure a vhost-vdpa network,Establish a 
>>>>> vhost-vdpa netdev\n"
>>>>> +    "                use 'vhostdev=/path/to/dev' to open a vhost 
>>>>> vdpa device\n"
>>>>> +    "                use 'vhostfd=h' to connect to an already 
>>>>> opened vhost vdpa device\n"
>>>>>   #endif
>>>>>   #ifdef CONFIG_VMNET
>>>>>       "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>>>>> @@ -3280,7 +3282,7 @@ SRST
>>>>>                -netdev type=vhost-user,id=net0,chardev=chr0 \
>>>>>                -device virtio-net-pci,netdev=net0
>>>>>
>>>>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>>>>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>>>>       Establish a vhost-vdpa netdev.
>>>>>
>>>>>       vDPA device is a device that uses a datapath which complies 
>>>>> with
>>>>> -- 
>>>>> 1.8.3.1
>>>>>
>>>>>
>>>
>>
>



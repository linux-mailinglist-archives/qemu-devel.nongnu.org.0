Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D364D6AC374
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBxu-0003WJ-FW; Mon, 06 Mar 2023 09:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZBxr-0003VB-2x
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:37:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZBxo-0006Lk-Di
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:37:22 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326CxPO4021965; Mon, 6 Mar 2023 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=95BRIE5PNJ7qqcoPcHfmJJgMGvbEbpRQeCnVrFBBEPI=;
 b=LLfGb43f58pPfnWr+pAzPZIJHC3awbwrYnSD3uZVZuryrOpfhqroUV6R+PHluloKZ+wl
 ffijFRu+CwbtzpqmtRpo2OzLDeWWmHGkIAJINHcP0xzcF2ntyD+mWvIRnKE4o15XqUX2
 3JRoUYWCQakGQR74BLBHIrp/qiA79RVgtJdCfpJz9bybFKFcXomi8JhV/KBLPvN6MH1o
 uHI+UhZr62kqxmiGsIW9Uxo+e2cEo8deuXpM7+XJzJrH/hYWovC/tVO3qrEnwAMfvu2Q
 bgsfGwx/yRBvvKWUOIhnckLdcWh/oetzh11Aufn1C731tCAqay/GuNWi2nuLsvObpVsD Qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xu1dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 14:37:17 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326Dod4X037521; Mon, 6 Mar 2023 14:37:14 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txd2jgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 14:37:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbChFuSoJv4SkB3gn3sA8GZiC687oPuKI+9icCxMaGS063DkicixhKTWh0HEfg4jtqnwz1Rn+oZP7Oo4sJFF4OogJoAe54wOwiAYIJBzyDRbNaZMwLi9P7bwdbtE5HDRwlfxNiuQd4mk83asI+GxcnUKkrbki3YfKmKbOrnGUJx+uAmEY5HSN9kzfJ2d7z7vqDxuqja3Ku+UUhFvNdGcdasDPk/BDy5LQ8mjuyET4nzUSU+PpIZKzrWST+Xk+cJxHAtNL167yrmF6VSWuzCkL8jBfBUQz6ET4CJSXm/CrH76r8Xzbii9KwzP6FYA5fQBTHtcSFt45UF+hm3Kqoa6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95BRIE5PNJ7qqcoPcHfmJJgMGvbEbpRQeCnVrFBBEPI=;
 b=moFhV4cvcL3KItxA/TIRd3cy2ykVdHfNALuCY23MGzYrdxlQHZpndLd2MbCG0sblWZyMz/MLBdp+XVk7nSX+y2lkWrTiIp4YcYkC3wWNYKwMWRCdBWzcMhP8VgBP9ok/8xrSU/qEnqU5pXexWMiQFLjKRnruvEnN9Rg74DDLkwlMvkiNqupFpe3HsWw+0z0U8GFAj31NmeffR9/A+GzmR1oe+iUiEmRQcQ+u5qPxQ7gzXKXrGn1Y7NJVfl+wVILvLDLf8ApZCrd2dFhG5ikPfyHHVaRTR5KQ1fo3nH3NOxvvgw0T16ZuKVcb+j6KPV/beXnNnZ8Nr1kBtntzEZqq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95BRIE5PNJ7qqcoPcHfmJJgMGvbEbpRQeCnVrFBBEPI=;
 b=xIY5rg5oQriGgdtCJtaAfkKSeQ5xo+Wlwhwl3r/TmzO3Quo2azo2KO8E2zK0CS3w2L9SJ9iIUK78pO7HzL8SC7Y/F4Vb6koAjfPpFp/OQcUv6pZTZGJA+CFzIS+ss3OOG7t8fO2C+6gSmPFExM6M5/2lc4yMQZkXDNywyQFbvOE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5281.namprd10.prod.outlook.com (2603:10b6:208:30f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Mon, 6 Mar
 2023 14:37:12 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 14:37:12 +0000
Message-ID: <1e41f0d1-5b65-4a90-c8ac-16177d6460a6@oracle.com>
Date: Mon, 6 Mar 2023 14:37:04 +0000
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
 <2d1677ea-4895-f7e9-a6dd-0973cd270e5b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <2d1677ea-4895-f7e9-a6dd-0973cd270e5b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BLAPR10MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d64a065-27ef-460a-4a00-08db1e504586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAs8cXtr+yyokv2B3iPEC+JoPlNKw3LlSDTILwOJHzjhina7td8Xs/NZSE8lHDqz5EOUevdMqWvYPZsp12Lud92eUQyND4s2tI6lGC3uCdquBQMxxm/RJ+JOWdmFF+SEWHwJ56Xuyd7c4Tzm5BnDayV4FG9s54oegd1mlMur/01d/lGBwVHXzkYxJ4XG+x+Dic68mGAAA/jmgduoApGMZ3TxZ7EzmVqE7eaEviii1jeinmK+usRz22W8drRrcxRTiz8B4ExIk2UZxnLvOx8vpa58Mb45bkZKsvtiUeUAAgG/ITh7WfAUwOKszfncFquhE3JvggBilnZPs34Z2w1EAwN9ujunFTXGkd9/VRvNw7cB7oYAebDuSFfq1MWmax5O830QOBPw1Xjmkqd3fMjVMcuqrLs1cpItsbQK61E2O5OvVUi1xnKmr7Yt3pNqHlHByt7rc6bK6prrC8TLZduCeBHjUXsSL8h6aIJywH8V6nlnRZ5YIsLJ9u9snCStrxVGWJH+jAP0NJ7rFTJvQcbUSr0z0UoK89t47S/upuckUnYSCGXPDVCJOSbXjX1sv5dPo8UqXmMo3rgkVekTxDgPvDhkIwVGxDud3KX0LCgGhDQ+YLxU8tlwKzNCVSAI0GUeMzaggyKyAUQxh5pm3HMIsRMqNd1DEap7HBqaZKFaTLiixW9GQh2pf5XqVjvEykMDJM8GJGDA3yPDktIPSbE5OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199018)(31686004)(5660300002)(8936002)(66556008)(66476007)(66946007)(2906002)(6916009)(8676002)(4326008)(54906003)(316002)(478600001)(36756003)(66574015)(6666004)(26005)(6506007)(6486002)(53546011)(6512007)(2616005)(41300700001)(31696002)(86362001)(83380400001)(186003)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ZPZGF3N2dqbkJIUzJOQTh4Q3lmbEZmQWg4bnFmRHNHQ3BpTGc5d3hMVm40?=
 =?utf-8?B?ck13Z1lUQm8yRmVMa3ZLNHlOdm5PUy8yZXc2VVZZWlVPR1BNWDU2V3d3RW0r?=
 =?utf-8?B?SGlPekc2VkF4ME9uNmJjNDcvVG04TXl0cDIyMkFvY004ME05VDJVZWpZWHNi?=
 =?utf-8?B?YWdXWmM2TmRITE43OXduR1g5aEV0S1VESnk3cnVhSkljNDBiUlFLbkhJSWVr?=
 =?utf-8?B?MWpZckFtcHZDR1RyZmlkVG9WN21BemJwcHFZWm1PVDg2clgzNmhweG5BWDBT?=
 =?utf-8?B?dWhyN3dvYWQveXhSZ1pyMXlvVE12ckJZNWo5N0hWZy9zOWpNTURxTHpuZWl0?=
 =?utf-8?B?aFRhajBVVXBwb3ZLYkdnZXRURVBkcTFaWjFlcFBRTTZVeXZSRVdWazlMWHVZ?=
 =?utf-8?B?dTFsUER1b1h3cjljUE96R0ZOUUVUN3NpN08yV1NXQklTWFU1Ry9FMktpSTNt?=
 =?utf-8?B?ZnkwNGV4L2FFdlVZbDdqLzAwMzM2YXVuQWF1cE5ucTQ5VXp2cEhWN3BRSGlr?=
 =?utf-8?B?LytRZm1PMEtKV2xnbU82UlFSZ2J0ajJNL01BSVBxejIzNkVURmNKRVQ1dndM?=
 =?utf-8?B?cVBsdktmMmlaMGtnNWh1WTdwVXJuL3JLRXZlRUpHelhVVktmSEtjUlZWd1BK?=
 =?utf-8?B?d3hlVm94UG5lMjU5NVozVjl2ZDV5NFVFbWp0QlhUdUpnZkJ1dEZLN3Z3cmgv?=
 =?utf-8?B?d0MxQzRGMlhZNnR3ZDZ5TVNwTUgyMm91RzVZeHFhQWczVVhIRU8vUVJmZWpM?=
 =?utf-8?B?NmdkVUdsaEtyQ3NVYWdicFZIZkNWSWV4MEt2a3hoNnBxZUZCRTBnUUd4TVFS?=
 =?utf-8?B?UnJ2aHQweFlQT0luMW9YdUl4NiszVzJCZWVTSE00QTJpVG5FSVNRL1BuL3ZI?=
 =?utf-8?B?OVlWd0xpM1Q3dFFqck13RzhvVFZMWkwwMnI5RnRVQ2ZTaytLUUN0eWZQNG1l?=
 =?utf-8?B?VkExMmlrNkx3NHJUdnNab2Nva3Fha0xoR2E1aW55WHpKTmNXQncrS3RUd3R1?=
 =?utf-8?B?T25XNEZyUE0xT1pOQjBNQm9maGV0NGlkSlNvT3NJRmVnNG8ra3kyb1ZFbi9j?=
 =?utf-8?B?K1QxbXFjaGYyNFRvU2NHc2VaS01rT0oveVFLU2UxZEJSTk4yakozTzlkNnBC?=
 =?utf-8?B?QWtTeTlpMTFxSVkvbVpFN3p5YkNHQXNLQXdPblF5UWZBSjlXbmtoNGlYZ1p5?=
 =?utf-8?B?NVlHTWZackpuNnlrN2VqdWlsby8vUmdnMFVGR1hwSnMzZ0hZU1RYbnFoaE9y?=
 =?utf-8?B?N08zckZVZXdqb3dLSXd6WXNxTDdYZEs1a3VhQmxTWE5vM3VnNW56SWoxZjMz?=
 =?utf-8?B?aGpISnYySHFybGtYZVFsQTg5SmpaNmFHV0VKTGhpaXNHS1ZkQ0tieHF2azlh?=
 =?utf-8?B?VW1aSHhoQ242WDNqWnpDQjhaQS9OMGRZUFNtdjZ2dEFZNHFOL1AyNEVEbEY4?=
 =?utf-8?B?OEdrZENSYnhiZGVSQUUxQ1F2ZTRIQ002bkw1V1Zpc1JXRlFlVHZpN2JEZEZB?=
 =?utf-8?B?Qk90akZocTFFSmtUcGpCUXEyK3Z0amgzeEdlRm92KzZPVnpyaE1IQ3FENFpG?=
 =?utf-8?B?TFRsWmlTZU5aZEk2V2RsbFF0b0tHaTlNd2VYNVRKV1N2VDY3aVcwckxHZ29r?=
 =?utf-8?B?Z2N3VjhCaEpZdE00bkR6bHNEb05PQkpwQzhZaGRNUEs4MEtTLzJuWkJvNmdG?=
 =?utf-8?B?SWY3SE9wdXVhUmluM1dpd0xEdjVrNlRiNEdiTVBYdTRramsyeUJTdTRLU2t2?=
 =?utf-8?B?UWphaEMvR3BRdnFDOTVpMVJqalM0MFRsSzAyMHU2OHZML252WDhMTkxtZ0Vr?=
 =?utf-8?B?Wm1Bc2RUaWJNYVQwLytubTY3N0cyRmdJdktxZWU3M0pZQnVDZ3UrQWlWY3cw?=
 =?utf-8?B?QVFjelBET0tUZ202bDJkVGZNSjk3NjVpdWZ5ajNGdCtMWWo2Vy9QNklmTGcw?=
 =?utf-8?B?Tnd0ekJCNUxmblJEMkFQMWNmQ0c0QUdBMEhYc3NsZGg0M3ZZejk5c3ZHeHpx?=
 =?utf-8?B?NklqQnlZZkxFVWx5dWpMbDMzR3VZY0dycWxzbmNXeER4T0crV2hKOEJ6TXJm?=
 =?utf-8?B?MDl1VWUraSsyR2xzS0o1TDVCWnRaR3pwTjNCWVVxV0J4T3B0N1pxYXhxZitw?=
 =?utf-8?B?anZJaVZoNUpnbHk5VlVuOHcvdnNJQTBzYUF4alNlMnlaR29PaXRIbFJNMlVM?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: f0kHnt30OXLjjiuVOxQOxb6GYAkP964ZJkehCXvTd/GeEEekdy4QJ162GEYIDdAEWSbl8zgwF3sNqrJjdMnuhzSQn+PYgZZ21VJ1gpZXA3K/R0GPmrNi/SB58NXrNKNyxla9Rj/glBbmgc/Ps3E7neIUs41ULRuRUlPCo3IQjHEqod4JhYfvXSTnIYvTFIBCcO1HGVmAwDc4BsO8dAia3POV6AjGnm9vKbcg2JOVehi/DwUKau2+yKJFozz+2S6+xNvvA0zmp9FQVR6JjBr/tWui7Oh1yoRvtvxwTxlVvOlNRUd7myX6Mv5TSQlwLKfiAoMuzw/jdG+AkLTrXR258e5dPL3ZXOyLB0MmHDo8+Qh6ycmRdYihYE4TN7q/7FNItI4pNdab7oAeyRhLljAwGxjcw0jV+uyEqZnFgN4Dq0zCBbJS6358TgpyWTiLfxQ5gL4a4nMktidDxE0uVszLp8htX1x72E1xRSK5EaknvQW1zjZgE9BQYE4Ga5vTOqbmCoYHKzByn3oYiTxAR2mRy0sO1iplBHlx3SL8P6zbHDXr3cG9UL+mx+wU/48S7k/pi9tuIuTO91OM99NOzoVTYDufenWwSgh0KkA0w3rNVf0vqfFGgfsE5+X7/n3LCSISXcs24KuZyhecUDg10++dRY6xkANA3zpz8/ueNfDKXJjPI2E8hGyo4rTIsfK/ZGZxQF3JdXtNR2RRcLpf8A06/aqtLaTMzQkB5EqdyWgYePKRWST65Hn0GBYsA0mFKk1XIPNxQMJLQJ2dgzOD1Y4Ub2gfGTsr8V5JXhG/J4TO2XyX3mNBgStrLZY2fE9wCFLL
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d64a065-27ef-460a-4a00-08db1e504586
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 14:37:11.8671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH314PoM21cl6QTKvpH3xNTy5OFftCZp3sJeSUnYqRXkdM3SlK8DdwzjMe7yFQn+lFnk2oEViUg8k1NJ9Bmafzm5w3SI9gfNVh8FkzVcfd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060128
X-Proofpoint-GUID: 7v7cf6xjuYr08xLgFf_s-7FxyK0dGXT9
X-Proofpoint-ORIG-GUID: 7v7cf6xjuYr08xLgFf_s-7FxyK0dGXT9
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

On 06/03/2023 13:41, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
>> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events          |  1 +
>>   include/hw/vfio/vfio-common.h | 11 +++++
>>   3 files changed, 96 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ed908e303dbb..d84e5fd86bb4 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -44,6 +44,7 @@
>>   #include "migration/blocker.h"
>>   #include "migration/qemu-file.h"
>>   #include "sysemu/tpm.h"
>> +#include "qemu/iova-tree.h"
>>     VFIOGroupList vfio_group_list =
>>       QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
>> *container, bool start)
>>       return ret;
>>   }
>>   +/*
>> + * Called for the dirty tracking memory listener to calculate the iova/end
>> + * for a given memory region section. The checks here, replicate the logic
>> + * in vfio_listener_region_{add,del}() used for the same purpose. And thus
>> + * both listener should be kept in sync.
>> + */
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end)
>> +{
>> +    Int128 llend;
>> +    hwaddr iova;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(llend) - 1;
>> +    return true;
>> +}
>> +
>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer,
>> +                                            tracking_listener);
>> +    VFIODirtyTrackingRange *range = &container->tracking_range;
>> +    hwaddr max32 = (1ULL << 32) - 1ULL;
>> +    hwaddr iova, end;
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(container, section, &iova, &end)) {
>> +        return;
>> +    }
>> +
>> +    WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
>> +        if (iova < max32 && end <= max32) {
>> +                if (range->min32 > iova) {
>> +                    range->min32 = iova;
>> +                }
>> +                if (range->max32 < end) {
>> +                    range->max32 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min32, range->max32);
>> +        } else {
>> +                if (!range->min64 || range->min64 > iova) {
>> +                    range->min64 = iova;
>> +                }
>> +                if (range->max64 < end) {
>> +                    range->max64 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min64, range->max64);
>> +        }
>> +    }
>> +    return;
>> +}
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-tracking",
>> +    .region_add = vfio_dirty_tracking_update,
>> +};
>> +
>> +static void vfio_dirty_tracking_init(VFIOContainer *container)
>> +{
>> +    memset(&container->tracking_range, 0, sizeof(container->tracking_range));
>> +    qemu_mutex_init(&container->tracking_mutex);
>> +    container->tracking_listener = vfio_dirty_tracking_listener;
>> +    memory_listener_register(&container->tracking_listener,
>> +                             container->space->as);
> 
> The following unregister+destroy calls seem to belong to a _fini routine.
> Am I missing something ?
> 
The thinking is that once we register the memory listener, it will iterate
over all the sections and once that is finished the memory_listener_register
returns. So the state we initialize here isn't needed anyelse other than to
create the range and hence we destroy it right away. It was at container_init()
but it was unnecessary overhead to keep around if it's *only* needed when we
start/stop dirty tracking.

So the reason I don't add a _fini method is because there's no need to teardown
the state anywhere else other than this function.

I would argue that maybe I don't need the mutex at all as this is all serialized...

> Thanks,
> 
> C.
> 
>> +    memory_listener_unregister(&container->tracking_listener);
>> +    qemu_mutex_destroy(&container->tracking_mutex);
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>       int ret;
>>   +    vfio_dirty_tracking_init(container);
>> +
>>       ret = vfio_set_dirty_page_tracking(container, true);
>>       if (ret) {
>>           vfio_set_migration_error(ret);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..d97a6de17921 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t
>> iova, uint64_t offset_wi
>>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova,
>> uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64"
>> is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
>> region_del 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
>> 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min,
>> uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" -
>> 0x%"PRIx64"]"
>>   vfio_disconnect_container(int fd) "close container->fd=%d"
>>   vfio_put_group(int fd) "close group->fd=%d"
>>   vfio_get_device(const char * name, unsigned int flags, unsigned int
>> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..96791add2719 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -23,6 +23,7 @@
>>     #include "exec/memory.h"
>>   #include "qemu/queue.h"
>> +#include "qemu/iova-tree.h"
>>   #include "qemu/notify.h"
>>   #include "ui/console.h"
>>   #include "hw/display/ramfb.h"
>> @@ -68,6 +69,13 @@ typedef struct VFIOMigration {
>>       size_t data_buffer_size;
>>   } VFIOMigration;
>>   +typedef struct VFIODirtyTrackingRange {
>> +    hwaddr min32;
>> +    hwaddr max32;
>> +    hwaddr min64;
>> +    hwaddr max64;
>> +} VFIODirtyTrackingRange;
>> +
>>   typedef struct VFIOAddressSpace {
>>       AddressSpace *as;
>>       QLIST_HEAD(, VFIOContainer) containers;
>> @@ -89,6 +97,9 @@ typedef struct VFIOContainer {
>>       uint64_t max_dirty_bitmap_size;
>>       unsigned long pgsizes;
>>       unsigned int dma_max_mappings;
>> +    VFIODirtyTrackingRange tracking_range;
>> +    QemuMutex tracking_mutex;
>> +    MemoryListener tracking_listener;
>>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>>       QLIST_HEAD(, VFIOGroup) group_list;
> 


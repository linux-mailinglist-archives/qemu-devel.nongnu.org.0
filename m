Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C234768C5DD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:35:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6Jw-0005A3-UT; Mon, 06 Feb 2023 13:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pP6JZ-00058o-Vk
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:34:06 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pP6JX-0002Lf-BK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:34:05 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316INhta011254; Mon, 6 Feb 2023 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=8PY4Gc7Qfdgdgeg+G7zwys+vzfgkzUSYNH7iIm4bq0c=;
 b=us9p7xfNXCkj7Bp90UXk6IhWeG1bjtDts7gfwyDnd1x2Of1vM+FIirM80yxS9rA+noUh
 HwLaUD+4auIojiSzHakwm9X1e3UQmyCqHnw5kT8GOtxaGdObe/HsoCXDYcLgdaNGSC8t
 7MEZkBh/MQ37otLjY033X+eLV3sykpeVqwkG7ESSMdMjRxDJdEdabCaELEGGljsl0yIJ
 EKbc5jUOJov8t7MgkqY7NZylajC9pkF5NFcYnB6j4epJDGZW7HdA0f572GnO1Wl7qiuz
 ww/gr/9IrzkjB+zbwvCXPa0HkHiIlJZCar4h13wdA1VQIGio3VyW0NCTraBIhcBmZYqz 2g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe9nbm7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 18:33:57 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316I50KP001661; Mon, 6 Feb 2023 18:33:56 GMT
Received: from outbound.mail.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtay0pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 18:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lehIzYYtX3lUOebo1ggLioIyuQeL2uldXyCg5xBjjrY7McrQEoK0tEgm1lKR+LamzAYE33tTK3Ml9y6XqKYBnYjafHcz0FYFYNC358T9GU0OgTJPH++rWwogSrWe7uusvSKqOB2OjKWTlSdc8w1XsynMNECGHsrlswVjkII1/8rBz4WUrRlgVF5EVcZYLWctwdUDCTk43/zR/OzCrT06Kod4qdTZ3cqsAUfhpKNuvvjn2Xp7B1p/J8RinxkI5QIy8v1zmIHGOQn4okDBf7JGNi/nWOvDVCDJT1WScaKXKID7q4Dg0AfZ4Xz3yBlJIY49ip1l643/FOLMLY+GEXRl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PY4Gc7Qfdgdgeg+G7zwys+vzfgkzUSYNH7iIm4bq0c=;
 b=agdQb4PwfXC+U5/uzD+1GWIQ92DrbD2uAsaxQGZSOgJjO6o4kW7d1w142a+J5i3/a9vxE4S5d6ENd6WIiMmkLyyELGqwAn7CR2taTBghil2vbKO+tWvT+Fg+jPAIH+xyoLGm0/hAckU/N7cPgpoFBczRGWMC+uybXdfhKiD1kp/vixeXd2r/jNyx7APLN6kW7Bl2vFjHrfYOc0/L+i8CCGEpSkrHXq4rggb41g0rBC8Ry4FnQMn7YEaofZvxsyBKypfDBAykvGtb6Dafz0s5lz/wARkTLf5xmhq5wME5HNE4lnrmCzbirJdw+GWkM/SlotlAj0O2F672AuzqkitTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PY4Gc7Qfdgdgeg+G7zwys+vzfgkzUSYNH7iIm4bq0c=;
 b=Jfw/gtr8wMsIcGKToP8Sqt25Mb5XYy2vILLR6Ru1/QTdmARm0DFrSpHCU4eDhgn0YtCafcpiQs83/dy9HtRr7s+arAz8wN9J30rG8z5kWAZ906SGUhX3mHop8MOrfCpFc21QQBH1At28MOfOAuEIbWumD6xUJEyHB62OwcWqwbI=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by IA0PR10MB7181.namprd10.prod.outlook.com (2603:10b6:208:400::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.11; Mon, 6 Feb
 2023 18:33:54 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.015; Mon, 6 Feb 2023
 18:33:54 +0000
Message-ID: <16c64158-5c0c-c4ee-9b11-9b4441ed4fd7@oracle.com>
Date: Mon, 6 Feb 2023 13:33:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V1] meson: fix dependency on qemu-keymap
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <1674663436-380426-1-git-send-email-steven.sistare@oracle.com>
 <CAMxuvayo6rOUUWD5_vbOaOnu+r6p2NUfvRHH1uuYMw9sJYVuww@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMxuvayo6rOUUWD5_vbOaOnu+r6p2NUfvRHH1uuYMw9sJYVuww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|IA0PR10MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 379645da-3d8e-4eef-f617-08db0870b325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHc1Q2PmwNzWCmL3Xu1P51RDEcE2iKQmeftlIMsxjFx3w5HYHyqKXxJVIpUvJizYwodwocG3EvVI26NCn7g6UHnydoC1U5v/f8r7mIIS0ri4/zsDSIPRqxNrRNBeKH5FKXUGxhQDKoET8cxpr/Tar/Kkx3f0yl+m1R2etb5Gkzqh7Fl4rvtwgTc9QoilZ+soVJ23hHEQPvUJpVzSJgGNdHEjwXD4XloHZQ67J4bwFQjl/jF/l1MVOnWth6tuidslWP/R2eIFWVBt7b8hpgKfJGVh7AF+pSiO/P3VStxvAdRqMZUIwPMv0YUQD142HQMTMcyVZCB6bDAmiS59STeX5WHUB4LiWveqdLmFkTCOWxLBiKApiN1uR52v5tCFhkwDPiGzTaPPSDP7pqVnvq3/fEcafbgpN700W0q6slXhvRHYD3tNtIdgcomVX8oZeKuA4Z52vBa7oKli6CPh/msFnyQKwyx5Ojy3skX65Xs9v8B5MbUcQnDTsXg9ddoWxNRErG5gidGpUcMdCnPGZ9HwtHzlsrbZU4678uHKRWBPqbT99hDQDdkchNJKkRQ+dMdxyUXH753lIXXvyHS7/nH1C9ifKwbw2FTPDmihDektxbxOu9kquu2SCy6gGhGWuVhVvkRbmbYaGa4WZWBXfUzv1/McqnLYr4YwLBsSz7cZZd95JAaZP2HmIo7kxToc3oaTpubysd+1ZzugJFkooQ5f6Kh55DLRpYZmS7xPAl4CD+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(31686004)(2906002)(6916009)(8676002)(66556008)(66476007)(36916002)(6512007)(4326008)(2616005)(66946007)(31696002)(86362001)(36756003)(6486002)(41300700001)(83380400001)(8936002)(5660300002)(38100700002)(6506007)(478600001)(316002)(186003)(54906003)(53546011)(26005)(44832011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFE2Wm9GWWhlVjJnVTIvT2Z1WDkyU2JPbS8yMmpGaEpqSkFjSFphSUJpYWFJ?=
 =?utf-8?B?Q0tQeWdoR3c1REdCZGFURU1UaXBSSFpYYXF4azFLS29lNmtkdmJSbVljSzd6?=
 =?utf-8?B?NVVHbFJUOHY2bk1KVTR2b2xaSTVydzluNTZoZnVHNHB4TTl1dHhXWlRPK29t?=
 =?utf-8?B?MWtES09Rb2JnR0NGZk1ya3hHVFlYOHJQMCtHalVnb2dYV1JtYkh5UGtkQnl4?=
 =?utf-8?B?N1kxU0ZDNEtIVXhSd0lBTmpIT0JBSVNwUnBMa3RwMkVXbk5RcFRVZHE0a3Rj?=
 =?utf-8?B?THg3NlEwdDc3WTVmUklXZ0JNZE1DS1JSTVNoUHNKTGZmdVVNWWhjcEdXUllD?=
 =?utf-8?B?aXo2Wk0wNGl3bExEUEtDbHZualRDd0t0cEVRaHJJQlVzNzBocHEvRVovYnRi?=
 =?utf-8?B?QWNWZlBKaHI4NXVNYXRSMWJEb3QzaU1nVCszZ1VsdlJucXQ3Uk1XcmxHVTRB?=
 =?utf-8?B?dm1vU25rVXI4bXl4ZGJnLzU1RDk3ZTRjQ0JqWTdmNWlXQS92R29SaVl4YWo1?=
 =?utf-8?B?SUtPZkNNdXFjQTdueDc2dGgyYTA3c3BVS004VFlaNlVNeGYvaUNHVm45VmJX?=
 =?utf-8?B?YVIreDFlM3lOVUJpM3BCcUlOSWdnVmoxOWEvblpzWHpPc05lK0lHckZGbWtD?=
 =?utf-8?B?UWNFbVhsR2EyZ0dnd2wwZnFiQlJYZ0QxaFBONGEwdHVRUUFXdGVuZ2hvWDNr?=
 =?utf-8?B?OTI4T0VEcCtxWnFqRDJUcGVaZ0E5V2txMGFpbFF6aXdodXlEbEdKYlBIdyta?=
 =?utf-8?B?WTFLU1lzSWJOSnZtdkxZRG1BM0ZXOVVhaDJka0ltVTRMYmM2ZlFlM0FPRStG?=
 =?utf-8?B?VjhodWUvTlNDVERtb3Zzak5RblBRWEZteTQ2Yi8rdE10TEgxQm85THV3ZnB2?=
 =?utf-8?B?SW13dmxsN3pLTWlOclA1TWM4ckwvOTNkamoxcG8zUHY1NTlqZTFVSW5wSG9J?=
 =?utf-8?B?a3U4NTYvZFF5eUVMNkVjWVVCdkVBemJRNnhBQlM5MW5GRks0Y3VYdHp5cWNZ?=
 =?utf-8?B?bVBDQ2VDemhxSGtzVldVWDBsOC9sUHhXSFJCZkhWZUNqRjF2bm81Ykh6QW9O?=
 =?utf-8?B?ckdVT1JLMkNZZWI0ZEJHLzFxUWFzUUkvby9XazMwdlY3MFdVUCtDZlF1Tnh1?=
 =?utf-8?B?ZFZjMFFnb09vTlcvQXZCQ1VaTTNobEQ0MkpwU3A3eXZTNTdxT1ZtaDlOcVNz?=
 =?utf-8?B?cXRaWFJaZ1BsQTNYUzRJV0FEVzZhaGlhWUExWVFSaGZSRU9MM3kvNkUwYjhB?=
 =?utf-8?B?amFtT25VbHYyZTVkR0F3dDJDYVcxeWVjd0ViNHhvTkhZU3k3bmlBbm5JdDRB?=
 =?utf-8?B?VHN3SkJndWlOeVI3L0d3KzhwODdqRkI4OUxyTXRpOG02eDZ1cGdQZ1J6dVU3?=
 =?utf-8?B?ZFdTUWJ5NW1RUHNTK3ZBODJuYjB0bGRabnVSQzM0RzFubm9wbWVDRHVacnhV?=
 =?utf-8?B?U0VjcE9VUFZLLzdtQXlCNlFBYlZPZGpDSmp5NkZZZ0dUNEtVV0szckJRSUli?=
 =?utf-8?B?Q21GemtvR2U0MmMwM2NEejZkcks1aXl2c29pWk9RaVVqSEZsMnozNGV5d2l2?=
 =?utf-8?B?eTFuYngydjBjR3A2cy9KNnNqTFZiMnprWUUwOXk1VWVnL3VkaFkwWSs0TkZY?=
 =?utf-8?B?VFVWVVVTNUpSaE9keUd5ZjRBbk9FWWdLWnIvanE2S0J4UjAwby9yZ3VpZGpw?=
 =?utf-8?B?N0hiNkplRE9GUjhNL2dBM05qNTlRaXZvOHJMbVdwRDMvYmNuQmNOZmIyRDRT?=
 =?utf-8?B?cjZIeEx4Y3BmOURkRDJGbHZIakJBZFh4RFgvTDZjWklqaDFKNGtBNUNSTmVI?=
 =?utf-8?B?UWhncElpWS9KWUw5ZkZ3c1BEWDVPbzJSWlJhSElEWGFDUGZqRFFmVkRlQ1Jx?=
 =?utf-8?B?bi9GWlQ0ZDNEYkI5YkZ0NzVwZVpCKy9ZbDJxajlUV1cxRU9NRGo0QmpxcGFL?=
 =?utf-8?B?THBrZnQ1SlhWUXpBZGY1ZHN3S0NkZkNmQ29FWnBhZnlLNEU3bHd0eTBPRVpM?=
 =?utf-8?B?VEFGTmovQmlzam9VaXgrKys3b05MbG1UWGwwenR5SUpwNHVvWjJHUWpVN2J0?=
 =?utf-8?B?REJJWFFHMkpVZTluV2RscVBDRkZURmsvdFcxVFpHK0JtQktHak1TVkJ5eGg4?=
 =?utf-8?B?MklUanZVYVFxejhYZHBOWmZacEdGRWhqekdIaGpNSVJOWFJsa0dXZVlRK3hT?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: F8X4CW1Nd5FYBmPd861LTLGpn6qMLO3uTyJBDvkguK1J+fNKYAJWHxs/k+DybEyebBr4IBYQSBYisbTPQSqfIIElZ+yCPsGZ7RL+ZZ8E9A2327iTX9fx+TX0qFqpZVShrXcOz6eHcjkapSNP60ciqs3Q4bz9BOWvSdq4PVnFRM7TcpNEf1JWWG30RTvzJ7msBSwhwK1S6oUSYskCPTcnERnlMjo/wFBsRjQMyxW5T2su4GWugBd1Mk1DO5Rz5YhaQWzPkZ8al6ld/KZQmO2pOLW5EQW1bgrsWDT0PoHsUN5SDpVMVQu3Qed4TM2m5QksmYNtvjG8OgtaIXuKqyy0L+RjuOUErW8SLsWjBXw153+OKseW3ZORuWA6Cba0A33aedtqoZYXfGv045dKSAFKTIv5m97cfRO+0mLLoh29O6ehbcgeDDkxCSYt9R6li3IOEhZ8ttFStXqn7jij50NqK5weBOxbhX+klBNsg0k81mdT9fsw7dcMWCWyqFdy9rK4l7M7yTNz4ojcLAd61a8/+nZ22ZkLgeYAKxYUfN88BJu+TpsqlpUTv6bMFj/EQA+AhRsifagQ3nQFRrm8lXr/nLXN7oH1m84JjJdHBJRlpovND/sf3i+pOejJwlzzIAUlDs2+Avga30NqKJ2IsnydKR6zeW5Ggi4A0atht7h8hc/Qw60cr0+PXSvTRu8zkJ3sOt3RTJTTfkGbYmkqpT9LubcNeAaEqvMw6CrwQsRrGYljuKRGqRwK3EVn0HJAOJVyWSNxw/dhkx0w85rchKv9Kljfso04IicpQAwkJqWYDxM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379645da-3d8e-4eef-f617-08db0870b325
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 18:33:54.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwgleFLMofw5nr24vSOEPQmMZUr3T58VvcBHItXsty5Sz4hJHmWmtUyJiN7/8uecpt66RvCEJr7sDWC5vKMMazrnZjd0mqHnyjm4dj0BDsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060161
X-Proofpoint-ORIG-GUID: zLYGpqGhZfneNW7vEH3luvGu17Ja7NOG
X-Proofpoint-GUID: zLYGpqGhZfneNW7vEH3luvGu17Ja7NOG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 2/6/2023 1:55 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jan 25, 2023 at 9:28 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     When qemu-keymap is not available on the host, and enable-xkbcommon
>     is specified, parallel make fails with:
> 
>       % make clean
>       ...
>       % make -j 32
>       ...
>       FAILED: pc-bios/keymaps/is
>       ./qemu-keymap -f pc-bios/keymaps/is -l is
>       /bin/sh: ./qemu-keymap: No such file or directory
>       ... many similar messages ...
> 
>     The code always runs find_program, rather than waiting to build
>     qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
>     rather than config_host_data.  Making serially succeeds, by soft
>     linking files from pc-bios/keymaps, but that is not the desired
>     result for enable-xkbcommon.
> 
>     Examining all occurrences of 'in config_host' for similar bugs shows one
>     instance in the docs, which is also fixed here.
> 
>     Fixes: 28742467c9c0.. ("meson: convert pc-bios/keymaps/Makefile")
> 
> Or rather fixing commit 4113f4cfee ("meson: move xkbcommon to meson").

Yes, thanks.

> A lot of CONFIG_ keys were set during configure, loaded in 'config_host' and now they are set by meson in 'config_host_data'.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      docs/devel/kconfig.rst      | 2 +-
>      pc-bios/keymaps/meson.build | 2 +-
>      2 files changed, 2 insertions(+), 2 deletions(-)
> 
>     diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
>     index 69674d0..cc1a456 100644
>     --- a/docs/devel/kconfig.rst
>     +++ b/docs/devel/kconfig.rst
>     @@ -306,6 +306,6 @@ variable::
> 
>          host_kconfig = \
>            (have_tpm ? ['CONFIG_TPM=y'] : []) + \
>     -      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
>     +      ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
> 
> 
> ok
>  
> 
>            (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
>            ...
>     diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
>     index 06c75e6..a9e5103 100644
>     --- a/pc-bios/keymaps/meson.build
>     +++ b/pc-bios/keymaps/meson.build
>     @@ -33,7 +33,7 @@ keymaps = {
>        'tr': '-l tr',
>      }
> 
>     -if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
>     +if meson.is_cross_build() or not config_host_data.get('CONFIG_XKBCOMMON')
> 
> 
> Can you replace it with not xkbcommon.found() instead?

Yes, that works.

I will submit the V2 patch with your changes momentarily.

- Steve

>  
> 
>        native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
>      else
>        native_qemu_keymap = qemu_keymap
>     -- 
>     1.8.3.1
> 


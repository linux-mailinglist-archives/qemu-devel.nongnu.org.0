Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C614056A753
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:58:34 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Tth-00085H-QJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TpJ-0003wT-J9
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:54:02 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TpD-00039u-IC
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:54:01 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267EltbH026209;
 Thu, 7 Jul 2022 15:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TYnp43lGNinnkrTT9C6jgLJYw1Oo1c9En2hf6GLm6+g=;
 b=bLwgMz1seP3qXNY2QablYFtWh4jW3Yh5A7pV3lop5wfipZxal8HDQYatU35F2QBn6pZE
 5623hN8SHbdCc8p9vRxMuVJJ+yjF0+k4dBllBOEUFGMm/GBvtVHsqfrD+S2aTrDGBB5m
 HiCuRBhmYgxOzt+xJP/J2u+HCQMsm2TDRZU3bpNpuL9r43LTzjLgv3PsqykZV7L9cOuq
 uws6iyaSBX4rbEKdkONdbGKECLJRBzLlXs+NpFqHjB+YmpHcUYZUbEZja48qucnyR+R8
 +P09DAGXdS02pBnKM0sn09o3NgMbAa4ennwBMV6nBjhDGxD4cmWXucapPqDXuUKyBBtQ tw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubywgg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:53:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267Fntmu033005; Thu, 7 Jul 2022 15:53:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4udfjubp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myROqcUxUyBoowvp2v4kY+EadlB8SvW5jeAByY4RRGMb1QpFQ2eGL8wv2LCOP8OH+ZN1dHoi2yddt3VtIc3MyEdSfJQmsag9eBzlRURXuXS9QJHbfE1PF5atlCv35MU5ODFozCqpNQAGt1s/8r4/3uYw59TDqkm4cWnVXnHhO0nEEbHKUb1ymeGV8AxVxcfbjGiWM6fWgJ5uT7Dyd5LH3rV6ZQobrHytNCBHF0gz52wFa+hPjU+puECMifFkxFJnxMpF5eLKwOYnOOr+mqBSjg1lOlS55akQqe+arKKp/yboKzcSxpIEi0u5f1SPPhvLxi2dY2Pnh795PNJLsaG9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYnp43lGNinnkrTT9C6jgLJYw1Oo1c9En2hf6GLm6+g=;
 b=EGEDrK7khGEBmGU0kf0lzMg3Z2zyIKEb0MWCEA7SVypjtaIaAHsg0KZ3TFLJ0vZhFWRSkomVjoheiOgDzCKmSF3pLcglEl0TR6OrLC2zZlE8+dXORVimZdG7N6xF4Vq16m9347QHRoJI3yI2ecHFBYATZBMd+TT6oonjIwGnwnTzILn8Bg6ShBOZWCHuEpEr4TG4BWpqc4/Kq4tlnYqmwIljtfjiwbHPc8fXY3/c/q3hAej788p4Q/05bJKOtDWdZ7PVH+3EF+LVlRaGfwnCMhX2H3xUg4Ek2u66HpQWRhAG90uTGZmpvgrlKBytdXyZ30JpnrQXn4tefwzzV1rxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYnp43lGNinnkrTT9C6jgLJYw1Oo1c9En2hf6GLm6+g=;
 b=mq6yPrN/pNwbdP1BMDNG7ipVqQ9MJu2AUfbK6gk0XQhDnpHsvq7WaONM5On9o2fZF5Hf3eeXn8slJzmvrofCFgPU8nUSZ7qVK92eoT0PmXDJ4Pmo6vY1ycbp7z2NzTAcIbc/VdCmPBNENu965bR/uuUhRxoLtMgqY5FBJCX+fkQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5756.namprd10.prod.outlook.com (2603:10b6:510:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 15:53:45 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:53:45 +0000
Message-ID: <1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com>
Date: Thu, 7 Jul 2022 16:53:32 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220701161014.3850-10-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:208:122::26) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75b31fc-35a0-4f56-e3dc-08da6030df81
X-MS-TrafficTypeDiagnostic: PH0PR10MB5756:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIgu37/L3drH1epnqt/HotgTyJ8QqB//dAWPcwHAGeEfEkDwQXJA3ICqBYQw3VCkZLF1NCp0IeOw5trMqzsz+M2zXvMnVmP7ifPeMkn2venJReeB8v+opM4vHlKdn4uRDdSqexOAskGG70O8q4hdoEvwU4B3tsJMGaYA3Xa4cWHqvhA4ErxAOWt4jQFMPfDFM4yPulVouil/moo1eBSzkp94+uBwkGlpbP/OhCviz6JMP2nN8car3qlemrcHEKSohX7x884Yex7uWkZRTMz3pxXGSmqYUJt7Y8ZAUD48//Ny3QcXvdgT5phXIk224dB35ZmbJKsCx7MyA5fy9Im0AZzhyl2iLbiMTLWCY5An1PYF58D7knJe8ZWAIsClCLFrCA3hpAQkT3FCvdrT8tvcsaNpy0nzkGiVWb/f9OhmOVGUnJcsxybtoKMN/1cAdqf/CDt9DVcuAfY7tH/+XBQ9DXghPzYZ7dom6sReRpTLLeH2Bn7P7Pqm8cufxwKvFdkUzM7eyPiNcoE9wzC3437/I+4FHTqAN+RnyDNWkC+yZ5JqI44LNm92Rh8PTd8EQOZ+ElM0XSxJyfkkY2BjE4TQ7iiIDWob2L/zEAEB8lZ8vDSYoauVkNjXNP8QwifKikefHgf4yCJ2XjXEpzEbMtCMIYv+bfyOLtzhzKEi/vDqrJmYVpQd7hW1jpgnjIr2Qgi+tzm94cpKSY3nYGMRP4ie8mczayb7C0SeuEY1BJEBK4H/RX25l58EQ7mkQvU3v9ddDvAElLM9DO2h/zRoF11gpyh7mOezXdV6NJAdYU+tLzlYSmBxJTvxLcf9L0hpeEqv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(110136005)(54906003)(31686004)(6512007)(26005)(8936002)(83380400001)(53546011)(6506007)(5660300002)(7416002)(316002)(478600001)(6486002)(41300700001)(6666004)(31696002)(86362001)(38100700002)(8676002)(66476007)(66556008)(186003)(36756003)(4326008)(2906002)(2616005)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWhlMmQxSnhqUEMrUFBJVy9iUE52UDFMMm15cnhsbDExWmJLWHFCQ2Z6alB4?=
 =?utf-8?B?Z0xucThWb0R1N01xbGkwdE91Z3h5NlduVHlWd2hZSEhqdlpHTXNQUm5yWHV0?=
 =?utf-8?B?UHN0cXRIQ0cxVE9xZ0hrYlJtMWZYdWlUN01UN1hJTldOLzVtMTBKbnZ5emFz?=
 =?utf-8?B?UHF0UWg1eGQ0OVZWRDN3d2FBMnFPbDBLRVVlRWNWRmw3WWZTTlZNd3ROeDBh?=
 =?utf-8?B?VUttZHZUUmp6L3prNmJxNjI1SDlPMW9LMjFiaEJWWGxSSGZtQ2tmbFhZT2Rl?=
 =?utf-8?B?bUNkOG93N3p3QU9wYzJqUmttRHdpMC9KYkpGRWZwcVFzT1JMU2RUY1Z0NHlD?=
 =?utf-8?B?SlIxUUdSalgvMGpxNmoyOUhCRm1KV3dIN1ZGY2E4WFNZMWU4NDF3UlVkNEpq?=
 =?utf-8?B?RGMzYjNBR0ZVVXE1cktLdmN2Z0pCSWVZbm9ZMnlpSEdSNHZ3RTkwbElBOXNF?=
 =?utf-8?B?TWYrV0VLaW1CbEtrNTR0RndWWXh3cFpRM0tPUTFSd0tqSHhjUW1MSTExalVo?=
 =?utf-8?B?Qi9PWTRUdExSR0E5WUpOQWJZbERqc3VCOTZ5dXJ6R0NyblJSem1oajNiWUll?=
 =?utf-8?B?TXhseG9ERVZST0wvZXNpSXJJTFdTMUpRY09hQ3NTTUhjTXVMckw3K2x4M3ly?=
 =?utf-8?B?U1BMSytqcjhHS002cys1ZTZIYlhSMHByejF6bzFRT3gvSCsvMjgwV1g1SFpQ?=
 =?utf-8?B?SmJsd2tuT0xJeVFnMGY3L3NJRGFzcE51QmJZT085TFFSU2ZkZi9kemY5WnBE?=
 =?utf-8?B?VjhkY3lLVSs4aHdlN0pLa3UwTjAxT1pjUFQ0MFZuVE5DcFlLQXJtaDVJcFVW?=
 =?utf-8?B?SWc5aFhqSllNVmNrcWI2NFFaV0pHUjJKOHFUZjBFVUN0cTVUbTlEaTdUd2xm?=
 =?utf-8?B?ekw3TWRIcHprMWxkYVhaQVdKdFJJanA5NUphbmg0amt1dFI1VjQ3NHZ2SjBF?=
 =?utf-8?B?SElBUXN5N1lycFZNZWY1ZHNlRHlqZ2tiN2NxY2pDUHNiRVJ5R2wvL1VnZXB1?=
 =?utf-8?B?bmJQL2U0Y3BZZVM5QmplS3JSdXRHWm8wUVdJSE9WS2dObXlqcE9WZCs4d1F1?=
 =?utf-8?B?VlB4M29kOUs2NXI5NFBRSW1VKzVtdzh3aG9CYVRwbUlTNGdPM1dPWStWREJu?=
 =?utf-8?B?alVQNnFxU0tNL3R1SC9ZVDNBYXMvaVlhSkJzVHFlYVE5VjVnZXNnVzZLNHoy?=
 =?utf-8?B?V1lpNGgxUjBSOW5nNnJqYXNXUzhhZFZ4R2V2VDJhdHVYU3VxU2xORHpSbC9o?=
 =?utf-8?B?LzU0Nk9YVjlEUnVHWUd3dFBJRC9OOXE5ZmpZRE1TdmtkRTkvNTNONGNEY2xq?=
 =?utf-8?B?NnozY3lUalRSS3FZOWx0L29ibU00Nkg1THV4ckRuRys3R1N4TXZQdE4vWHJS?=
 =?utf-8?B?UytSY0plakVyeUl5dEVJYjdNZzJLc1ZRU3RsdjZlbmIyU2lRcDRqaFltcm1Q?=
 =?utf-8?B?MlZ6ZDJIbTRycjhyU0N3OUx0K2lGelVhbVRNU3U5dFRxOEJGc0FtNkdYVTZv?=
 =?utf-8?B?a1VnczZkODR5c0EvdWIxRTVOdjJINytweGd6WVl3bExEL21pNDkwY3VNUXNm?=
 =?utf-8?B?aXR6VjJwcjJsQVRUblNxbWVIdW5SR1Z5QjlqOGpCSVVkd3pMMTFUWkovOFhy?=
 =?utf-8?B?L2NDRUwzNVIxNnQ3S0lxVGV6bGpWOG83M0o2RWw2VGl0Q3hzd1ByNWxHdk83?=
 =?utf-8?B?Q0cwQzY5NWVXbFhuMW1TSGFkVkRGczBncisrWWdxdU0yTFlydkR5RXBJWU9V?=
 =?utf-8?B?VkN6WEsyVHJZUUtyZGllOTh4MjFXZ0doV0VYS1h2c3IxV2RiM3dPRm1EbTBs?=
 =?utf-8?B?eTFnbFZGU0hwOVVqNkdReUZhdmVYeUZGZkNoN3NlRWJhZXpldjBsT25JaHhz?=
 =?utf-8?B?aVJjN3NvRFQzZkN3ZmRLdFphdGt2U2d5N1JveUVQd2ZCMVlaUFNKQUxXWmtw?=
 =?utf-8?B?ZlVpWDN5VVFaVkVNMVFHOWw4VnNqWkFwSGRsWVFGUUdOUGZDdzBrWUNZbGhp?=
 =?utf-8?B?RlBnRjU1N0NGaU42Z0l4bm5RbXBQM0J0L0Z4eG9KTm0vZlNXYXJLY2sybnA0?=
 =?utf-8?B?WlUyVHAwZ2FSUHJ2ZWt4dnppczNEYkVtRU9HTXkyZldFTjZ3VEFBaGxMNlVr?=
 =?utf-8?B?eHgyMStlajg5VkRaSDN3VlhiYjdDL0trZFRZZENHcllxUmVQeVBvSUxHRTdQ?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75b31fc-35a0-4f56-e3dc-08da6030df81
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:53:45.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OtK0zZyCZzo+lQQ5Ri5EjsiBUfD9tjbhAtDSJpmPdmfW2PxWRQ+dfIGUgVdYCD/s+uctWli9mut3X7zgnadi/1cO+VGTxYARd16yUp5LL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5756
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070063
X-Proofpoint-ORIG-GUID: h7htH58mRtwzFZyuBCv0cM6KCM_2y6y-
X-Proofpoint-GUID: h7htH58mRtwzFZyuBCv0cM6KCM_2y6y-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/1/22 17:10, Joao Martins wrote:
> +    /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (IS_AMD_CPU(&cpu->env)) {
> +        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
> +
> +        /*
> +         * Advertise the HT region if address space covers the reserved
> +         * region or if we relocate.
> +         */
> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
> +            cpu->phys_bits >= 40) {
> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +        }
> +    }
> +

[As part of Alex discussion in previous version there's this other case where VMs with
memory less than 1T but having enough GPUs (say each having 40G to state an example) can
have PCI devices placed within reserved HT region.]

Changing fwcfg 'reserved-memory-end' to 1T (bearing that phys_bits is correctly
configured) without triggering above-4g relocation ... fixes the case above. As
'reserved-memory-end' is ultimately what virtual firmware uses (SeaBIOS and OVMF) for
hole64 start. Though, I am at odds whether to include this. Meaning, whether this is the
VMM going around a fw bug[*] even after e820 is described accurately, or if this is the
right to do in the VMM?

Part of the reason I haven't done this was because the issue doesn't happen if VMM user
describes the correct pci-hole64-size in q35/pc that's big enough to cover all VFIO
devices (which is ultimately correct). Thoughts?

[*] as it should look at *all* reserved ranges including those above ram.

>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
> @@ -938,6 +1038,7 @@ void pc_memory_init(PCMachineState *pcms,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +

Spurious new line here that I will fix on v7.

>      if (x86ms->above_4g_mem_size > 0) {
>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",


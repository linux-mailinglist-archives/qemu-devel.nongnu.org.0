Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E512FD04A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:51:08 +0100 (CET)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Cx0-0001kx-VY
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2Cva-0001K8-Jg
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:49:38 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2CvV-0007QJ-3N
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:49:37 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCeLqZ104388;
 Wed, 20 Jan 2021 12:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=oJuGMpGY6UV407RL3vcSy0u81rx5S8uhXEV/AIEYgcY=;
 b=aHRYPcqa9tFMd06Rj2QMctBvDs79hpCdGd69Ysqgy5rszHiyCxrLp4i3Arcwk+S73gOK
 Lbqr4x44eNkG9hXJbzHytdEl0L7UJoOtzP1OcSna8sti9g9cBCUpMoYlpaledrNrzK3B
 aenbFgl7eydw2OrgpgsahrNOZ5gGl/ZIGCg1W4LiOvJ0PPlKTAcfGPWz/GghhKrj2i0y
 C2P4pFTkcNbnItSLKP0eYORWmuEedW4NR8wiaPMgAhTpSMVGGcTY51vujQBdRQM/eUU3
 tavK8glfO5vWJonGlqs54yK9BYZufo2JLlrwDfJiOmhcbiaXDdJiaNPe3/dzJCboby5y NQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmt8yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:49:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCafZH061441;
 Wed, 20 Jan 2021 12:49:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3020.oracle.com with ESMTP id 3668qw5a1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbeINW8hpNEo5ov9CuUY4JBZ2gYtGYEUvhUvioLzkPva6+tBGn/u0ibj6MDVe9tQ7SUfxNrvbGszA/lUUGCpl1IN6rz8FcUuvXjhVFf63ySwmdk8qmeBCNcBZ98XVcu9nrmeIAr7AIWPwqLtckVQV9kEPekOzYYFPMd2rLGfiYwq9mOAv6qdA1loL8PYkOWwyEpdeqq5w6LKR3vDge3HaQXt7u7+MnnwTo07PphJKL7JYnz+7eCDmR8SckqUj1sPLesgBa2q3fuNBZ3vsxksTVrQqkNLK53btH81ttR+3gVeoCwpAPIEsK8UN7+ofAFNulYBcP2agdq2j0T6Bv+Tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJuGMpGY6UV407RL3vcSy0u81rx5S8uhXEV/AIEYgcY=;
 b=NQNft2LzZw47n80OaklmJgwYKDVJbMt26HCOqy9dBj8u+1dDlhkKC0cFbvPVDDRjWBXJ+iKXXhL+zVSjEm5+8UcFVfih6nzqm70gmaRvUcQHy6TVi26wlbAAYplajXBN0djnf+LNqRedgAekaCFHciL8zYHBks4FeYH/dC3ZI9/2Atj4tb6wl2vhuFRs/WSWYy9BJhhgkdGGX9O1D+/1YzUOXBGv1hub0nNWn7tG4ZcXjSeCFs/tuNKXu/+AoUXr++I4QMP6dSvM293Qu0aNgMBvCLSzTNYtGIyh53XgJSI0yP7cQel8qV3GE8iY6rhBhD4KX1Jy6DC+Hfy48Wi+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJuGMpGY6UV407RL3vcSy0u81rx5S8uhXEV/AIEYgcY=;
 b=Au8322zaeE1rBZxidpo+qEaROwfKaagr3+5M96G/Wr03u5VhW5wUpCjmv8ZPXguReuMF5w4SHsrYeuCYGiad/BfvMBkBaUuHlWShzh/yVVxjlr79+v2Fc+hyVWhIgYWaq/s0pJO0SDqd9sNRcqoGcdoo82M+tN0kAdKprX7s2go=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR1001MB2237.namprd10.prod.outlook.com
 (2603:10b6:301:32::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Wed, 20 Jan
 2021 12:49:27 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:49:27 +0000
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
To: Yan Vugenfirer <yvugenfi@redhat.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
 <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <d4ca12bc-4c97-c839-c9e6-f713796b6f54@oracle.com>
Date: Wed, 20 Jan 2021 14:49:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ro
X-Originating-IP: [141.85.241.41]
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.17.0.254] (141.85.241.41) by
 LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74006566-46a5-4209-3763-08d8bd41d250
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2237:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22374A738EEB02ED79AA779088A20@MWHPR1001MB2237.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMAbExJKZme/BVoPkmYvaoJeiRzX4Np2dZEpU1oUsEwH7dF/AreHlxX02jP93V5fpsbRJWY6sE/NDmlEtH9+EEJqT+VA80U8asa1w8VFzVYZU2fqkU1iVwDDy+x96D68iQRw1ZUGZ4WRHO0328op4VIK/ghUks0HPd6eEJqT0ilLUwAhZpFl6IrHH5TUDgI0Jis7c/bMDBeLO+18fzKVnJnAcdyPT/iNdg0fTCkT5AAoOHCF9aXcD9J0XvXG87P0n2gwZOOLWizPIyz3VU75n3SDFZHSfWDxNdeDxwSsruLIzTALdqwZEXM08JxNqxNSp8QFZhlKvAGRUAJszl2msH2l4NHIUxySd6CsoBdnMQTKCJGFoDlDaY9kXQAxHu4c9FqU2UWYcvfgx0caXXzn42z21TlwuZNqip6QrTSUb4l5QVKbkdcCCJGESOcjCsMrJeaGQXxL8yV7wJ/2OPC7PckGuc6RFRn1V5sGD9B/Is0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(66556008)(4326008)(478600001)(186003)(66946007)(316002)(36756003)(4744005)(6916009)(66476007)(5660300002)(44832011)(31686004)(86362001)(16526019)(31696002)(16576012)(6486002)(26005)(2906002)(8676002)(6666004)(8936002)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODZGbVg5R2lCQUgycnhMRU91UHRpLzQydnI0Y2RJM0plaVJTNmZhcWphSXBE?=
 =?utf-8?B?dDN6NTJtR3lyQXJFcVVUZWZlZnhuamxZc3JGc3JGc0dQQ04xSTVVVm95bVh5?=
 =?utf-8?B?bTVrMkpKNUJ3Q1ZMTHMzSXEwTGdwWWo4QktFQVZ0dUllNnVsbFUzU1pHcVRC?=
 =?utf-8?B?NGpmMGxwT25CRmJ5NDdvaWdxZFVxcERGV1VnRTBNRGY2NFhTWHFZRU1pc3BK?=
 =?utf-8?B?SFpkK2FlNmhrb2FqZU1NeEtjODY5QytOUmQ4TTVweUJkQVk3REtyemtMcEZN?=
 =?utf-8?B?SkduN3lFVSswQ3pDcjFwODB1aDN6SHlRY3FHbFY2anhCbTN0UFQvVmZjOGpN?=
 =?utf-8?B?anI1ODNpSWpOQ3RVRTNLNG5wcHNaS3djSXF4OEw5c2xCVngrZnNzaUx4L1Q5?=
 =?utf-8?B?MnFNOUZUWkNyQitzd2lJdEVYR1BhMWdSVnRNaTEySDRnZmREdnU3aGVaRndz?=
 =?utf-8?B?b3M3ZjkyRzFKdTB3VFpxUitNWXlhekt2MFNxYXQ3djhWdjdUbENyZTdOTjM4?=
 =?utf-8?B?ZmRBRDcxUzNRTWVUK3BEanRMelp5b1duSWVOTnduZ0lrdE92R05TdGk0eTA0?=
 =?utf-8?B?YjRsU2hTZHBVMzF5M1UwaDFXSTBzU2ZJc2RHa0ZWREdDOXNEbENQQkluZHFw?=
 =?utf-8?B?UFJrRkw5SnU3L0xGWDAwTGd6MGw0Yk16TFVHK2FUa1pHdWppV3VOV2oxVkVE?=
 =?utf-8?B?ZXlrc3lTMUxGZ3VjMlg0TVJ6cVNRQkhFR2NzbmxPeXAzb3Jza3VFTElwUVhK?=
 =?utf-8?B?QlFpeDM3YWpXeDR5TVV0dWljNDNHM0NjWkJkenFkUVpGekZvS29qNG5zVlJL?=
 =?utf-8?B?M1llcXpQK3gxSTFpTlNWWnZId2dNN3lNdHFuSjBOS0dwT0FYOWZXak1SaHpn?=
 =?utf-8?B?YnpnREtGZE9XaEpyeWZxSDhCamtuYlo1bjlEcUIyVUtwVkxza0gvU1hmSGVn?=
 =?utf-8?B?dUQrYXNOZFZXK2tMdGh6aWpQVUMrcFZxUlJsSjg2M2VSby9YamVGSWZQYU5W?=
 =?utf-8?B?NG1vcjNvZEVsL0pQR3BSNnVnRmJBYkllcjh6anRIUEIwRllRZk1pSDN4VWZ2?=
 =?utf-8?B?SGg3WktSL1dLaUtObWsxblU4QU0ycWJpaU4rSjRSNEFiRzRvT3VSMkIvWkxu?=
 =?utf-8?B?M095Qzl6NVhocnI4bDFPZy9JQUJWWDFsZXBRcGpFRmpkS0doK0F5eFIzUW9T?=
 =?utf-8?B?aDR1K2hDcndjbkRMRTM0cjJucUpWOUJyNUJmd1V4NGNmZk4wcG1JUCtKUlpH?=
 =?utf-8?B?c3N4djdIYW9rOTlseGs3M2RrN1kxeHVaa1JDQXprM1FCMHg1cW5MVHVNRkZj?=
 =?utf-8?Q?gRVTa6vqA7PjYiYNVwmgRcwjb69XG4muMS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74006566-46a5-4209-3763-08d8bd41d250
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:49:27.3320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47P5GPtPWjScYz7UB6RAP6WLJ+ajxhullLLGjBqJBDxf5VTPh+bqG1GtS8q6L1VjIHvgxV7+443YeUUB0QBuwc0UvCWZz1pYb74v0j8rd2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2237
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> +    device_class_set_props(dc, pvpanic_pci_properties);
>> +
>> +    pc->realize = pvpanic_pci_realizefn;
>> +    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
>> +    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
> Please fill out subsystem and subsystem vendor IDs as well:
> pc->subsystem_vendor_id
> pc->subsystem_id
Will send v5 now with these info filled out.


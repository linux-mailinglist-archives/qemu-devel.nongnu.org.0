Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA83325F00
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:30:30 +0100 (CET)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYW5-0007FX-78
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lFYNw-0001mG-CO; Fri, 26 Feb 2021 03:22:05 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:46132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lFYNp-0004qr-9j; Fri, 26 Feb 2021 03:22:03 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q88n3B192828;
 Fri, 26 Feb 2021 08:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : from : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=S98PnY2j7pUM8fJRVKKLGMSpQfRV7JuvYP1wnvP9f0o=;
 b=e7Eo0JbHLhYmrxlnynEDpw7v55ap+sKXXHpfy1S0/1nyxDT2J6VAoUJQIKsUA3mKYHJl
 AhXzgcjMSlI8XfXpvWfp5TdnwOS1IDCPnolW1xfUJEhgBUr/XdolcwnHcJ3yYZhC2Rsb
 32SRBog/LX+U0gO+/27VJ54BrU8fKOKN6qaXl2QprPizyVQ70mIiBMPTgGaWIrUDYpZd
 QKE6AX7nssw0AxTUcAUekd7s73LzaYfKrERmahjCR0byFKcV6HLWRdpZSyYIey3nWPA/
 H97YKF2kfLjLqqzezZI16DZ86PBnxafkz2LgGo/fuqyzCpTJEl2QtgFnO5/IG8TuTH7g PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36vr62beyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 08:21:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q8AIAQ054088;
 Fri, 26 Feb 2021 08:21:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3020.oracle.com with ESMTP id 36uc6vkkd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 08:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnHNbWP90fMd1dNWHy2RiFcqeiLhltDUBxftungHIkhlOte/yjd+PgyAw1H94DenriN8icyF/8YTYG8JETm4WmjbdVMQrwitAVaGpmp8kmfXzwUZaeE/Xk3fPzQWIrD0yKkppvIpmalH4zIrtdRbqcRGz9Wx1J43QJqBsQ+yEdVvILirnZTAnJ8lXO8SCptZ3W9Avn/qF8P6opAwCk49qGgYf9d1bYFSE/xzKqJB7J2UpFiVyTzXbPsiKMMeauRE5DoEvPPXC7TSYngXgZCnqesemZhX2ehl1V0xV+RnPNDT9lDT5eRu3LQfjEdWZBT+RVgGzCS18I7CXmiSlXZZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S98PnY2j7pUM8fJRVKKLGMSpQfRV7JuvYP1wnvP9f0o=;
 b=LDsFHWIpQN5s0UbCwxSSU16Gl9Kap/zrDy59HH+FcGW6CjwcRTBXvGMb+a9NfA5JvUBBu9A68oaQIOOjAUI9cr719BaQf40ieC8sq1QHBK3BA0gOFZkw6qhtYu03pLrV21oamai4ylohDHbGtxT6kV9duziNob/iS9HkKaUo9k803MlkIAlvvRFhBCc004nco1DWO8t5iRw6GAsebaXuyKxeKuZY0tSVCNLXzgHiBlBu4INIM/mWAZPpcjxZaNr6rl6A/QWNXYM4OhWaLLBVYOrXZSOlENhGnBHMG7mKsLZnsfAaD0MGYTomZ9uylLpZzDbthlWJ4/trLqWGJE5qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S98PnY2j7pUM8fJRVKKLGMSpQfRV7JuvYP1wnvP9f0o=;
 b=XwvNkh6HoBDNb02RWHxARW1x9ozhulkXST8h3Gw2NZ8h9KMZagztas4Om8MfnyZ6FfpcJ9KcpaglwFmoQk3v6wZkmcBCdvDPzw98vfj4MOsK2kYLYSdE/58daPbFG1R5Kjs3kV56qP+UFV83ENOWwyy4BBWlJ70PGJ9adH7L48A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB2427.namprd10.prod.outlook.com (2603:10b6:5:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Fri, 26 Feb
 2021 08:21:40 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 08:21:40 +0000
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 2/3] hw/block/pflash: Move code around
In-Reply-To: <20210225230238.3719051-3-philmd@redhat.com>
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-3-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Fri, 26 Feb 2021 08:21:34 +0000
Message-ID: <m2lfbbb5o1.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::18) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Fri, 26 Feb 2021 08:21:37 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 9ec0427f;
 Fri, 26 Feb 2021 08:21:34 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2457896-301f-4090-be95-08d8da2f8a9f
X-MS-TrafficTypeDiagnostic: DM6PR10MB2427:
X-Microsoft-Antispam-PRVS: <DM6PR10MB242783524B57D77BC35968FF889D9@DM6PR10MB2427.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlhKWPMtekTJLBcH3KD1K+3V2igjcYLpCirGKM2/bot8a1SD0i5bvPHzs6zY8wb8vLpPaix7uWAURx5I75ijpjR1AMDV6OMTYObljq4oCvK/GxkLLdKnMc7UZd0AlJFoblbvcct4Fcbpnci8+lOs0O9s6ZtpQt8J9WtOdONouQdM3o/LaM9JyTXZY1h7hjnBdbtK8xLASdQgT/uS03VL0ZKQyeqxaVgU9L+phgBL1Zrz5isLd1s8tqYIVHbcLujYFyTY6xw0jdeGmotIjlxqP2F5ipN1kJURqISy37QsI2qWmhpFJY0lmbE3gfNKpHb9SlaP/kpZD0gdtCLXZgw3333Z+FUrbuEH8k0GhBXmmYA9mFd0snR2sra/LciM0QI5K3yMfHkELASTFgfIignu07b5vBJw26EXG3XxhSZLcCexMiM0jucaM0ZpSVmF+i6h/iDsWCGWYtM2kNOduIaoPTqKwJ3pegNTAjVT4OznxtlkoGCx/jsOE+lPAX5LzVrF4P/weiS5Eyha0hfVyWJbnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(396003)(136003)(366004)(2906002)(66556008)(83380400001)(36756003)(86362001)(8936002)(52116002)(54906003)(66476007)(66946007)(186003)(4326008)(8676002)(316002)(7416002)(2616005)(478600001)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXlDaG51ODR3ditZYlhaWDlmTjAvMENlbHdvMklKUktUek1oM1dYbWpIUHpQ?=
 =?utf-8?B?SWFBSWhVbTdXQlh1Vkk0a3ZJVG5RUUJPN0o2ek1FNkxFYzBGMlZ2bGZHUW4y?=
 =?utf-8?B?UzdPT2lsSXVWQTZLR2IxZWpRWlA1VCtneE5NQVhyWCtJTzVZMm5VbHlhLzRL?=
 =?utf-8?B?andDM3p6azlkODNZVXRlV2pjRitBNWZleFVhV0o0eFQ5ejBIc013YnlXRmU3?=
 =?utf-8?B?Qm9uVE1YcHpYdVRucis4dkV5algzM1E3Y2tLdVJqZGpJSUk3UHozTXNGSVk4?=
 =?utf-8?B?bG9saUovbE5SQ295VTQvRlBRd0xTSk1OczBIY1pxbC9qUnY5djIybVVCcDZ0?=
 =?utf-8?B?Yy9xb2piM0t5M2V4VEdwT3prM0dHeXlCZHlKejUvWWg4Zi8yOHVZTDl6UDZL?=
 =?utf-8?B?ZWtUcHp1K3FSeFVVaEgvUEhuUCsyYXdqcHN5QUk1My9VTTFzUzhpazlQdDRs?=
 =?utf-8?B?ZlE2d09xMDY5cEgzSTI2LzVCQktUbGtaVVBhakFlTG9talQ0RUJlcEpVTkcw?=
 =?utf-8?B?OGcxajVxTHVRY0NoY2FsSUxqMUVVZEIrT3RxaVpQNVJiK3FsbGFGYnFRd3NW?=
 =?utf-8?B?KzFDM2VDMmNQMHExaGtES3ZxN3RnUDdoZEtLdDhOT0pFZUFCSjBXc0x5bnpD?=
 =?utf-8?B?MEEzMnprNlp0NEJzeTdDdEt6c3NqOFVrTGZBd3p0OWxKZDM3UCtNdDRHWEh3?=
 =?utf-8?B?VU9XaUNiS04zd3VVODMvUkhQWEl5KzlkSHduc3ZSMmdqQ3NoY2l6YTArZTZu?=
 =?utf-8?B?SW54b0lOQ1hlQWw5Z3MwOUEwcktOTDA0Z0JiS3pORG1jMW55NmlVTW1xeEd6?=
 =?utf-8?B?TmJDN1ZJY3c5QzdhUWYraU8zSFQxdG9IdWFZNmlxWmJhUXVCODdjVzVXRFls?=
 =?utf-8?B?aUV5RVRnVm95di9xYUlwSS94TkpSbmZmNTE1T0tJcjc3b2lWUjJyMS8yam9q?=
 =?utf-8?B?bWRMMUsxWWJLczhxVmROeTZ2RXJQUnZabFBHTVNMOXFFNWRzMHVtRnBTeFc0?=
 =?utf-8?B?b2M2YlJrcUtDZXRqbnI1endGMEZHRkJET2FYeS9OcFo3RmQvNzdndlZGdlQz?=
 =?utf-8?B?bzJnS3Yzc0Uxbk1GWXd3dWY3WmN2THk3aFVONmFDU0VDYTZPK3haT0VUaEFa?=
 =?utf-8?B?Uy9VL09KV1BRdnZaWC9HMkpkUC82MVByMWMxTDZQOWdJeFpsaEZNRHhESW5n?=
 =?utf-8?B?dm41T1NUNVd1QWovYXNlc0hpbVN0QlB6N1lqUjJ0UWhsUllEaVRiMnhheE1q?=
 =?utf-8?B?T29NN1ZZS2ZDTWJIdmp2aytKdE5wV2h6aU13SXRwZ1V4VzdlcG9IcXFPUlBk?=
 =?utf-8?B?bEM5cGZENDNIU1RrLzk0R0pBaVg0a2RJNXhWdkM4NHdNUkxVclJmSDE0TEI1?=
 =?utf-8?B?cnBLaHlSQ0JKazFzUnlrOEhRNFROcG52RittZC9UVHk2QjBKcUMwRjVoTGdO?=
 =?utf-8?B?cEhSY1ZCZU5JR1A1L1AxRjFBUDNOWUhwN2hYTER0SHZ0eUtnVkx2N2p2ZnNM?=
 =?utf-8?B?ZU1mS1hRUjFIQVRsZU50NXJYbVRTMi9oNktxaTdzdlJ4OFdNa05pdnUyMmVJ?=
 =?utf-8?B?TWxzZERiME9DNEVGNktkOGxVVzBvdDlrcTZVT2FIa2ZLZWZBQUZBOVV0Rkdk?=
 =?utf-8?B?c1pZb3FzWUNJUkFxb0xzekhKRmJnaXkrdW1wb05lam1rTDJGTGcvTWRWb0ZC?=
 =?utf-8?B?Zi9MdStLNVJzaVNVQytMSEhuNEVIckErNGFiZk5ud2VBaCt5Q3hUdnRRYk9L?=
 =?utf-8?B?VnZHMmdsZXE1NEdDeVpkOFFFaXJ6UXFZNEJYNXFKK1FUZCtZdmg2dERMekVR?=
 =?utf-8?B?WG1tbFlDbnVkZ2Fydmhndz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2457896-301f-4090-be95-08d8da2f8a9f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 08:21:40.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2AWhAfNgPxqgZ8MAF6rg+WFBK5MHs6s1KqlvdaQ1RbAjYO/CUuswModBB5QGGdqc14svEmugnQPPvA5MEKm024Z+qNSmzd140GbNEKaVY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2427
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260063
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260063
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-02-26 at 00:02:37 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> First do the block checks, so we know if it is read-only or not.
> Then create the MemoryRegion. This will allow optimization in
> the next commit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi01.c | 24 ++++++++++++------------
>  hw/block/pflash_cfi02.c | 18 +++++++++---------
>  2 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 22287a1522e..a5fa8d8b74a 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -731,18 +731,6 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>      }
>      device_len =3D sector_len_per_device * blocks_per_device;
> =20
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
> -    pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> -
>      if (pfl->blk) {
>          uint64_t perm;
>          pfl->ro =3D !blk_supports_write_perm(pfl->blk);
> @@ -755,6 +743,18 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>          pfl->ro =3D 0;
>      }
> =20
> +    memory_region_init_rom_device(
> +        &pfl->mem, OBJECT(dev),
> +        &pflash_cfi01_ops,
> +        pfl,
> +        pfl->name, total_len, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +
>      if (pfl->blk) {
>          if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_l=
en,
>                                           errp)) {
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 7962cff7455..4f62ce8917d 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -791,15 +791,6 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>          return;
>      }
> =20
> -    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
> -                                  &pflash_cfi02_ops, pfl, pfl->name,
> -                                  pfl->chip_len, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
> -    pfl->storage =3D memory_region_get_ram_ptr(&pfl->orig_mem);
> -
>      if (pfl->blk) {
>          uint64_t perm;
>          pfl->ro =3D !blk_supports_write_perm(pfl->blk);
> @@ -812,6 +803,15 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>          pfl->ro =3D 0;
>      }
> =20
> +    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
> +                                  &pflash_cfi02_ops, pfl, pfl->name,
> +                                  pfl->chip_len, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    pfl->storage =3D memory_region_get_ram_ptr(&pfl->orig_mem);
> +
>      if (pfl->blk) {
>          if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
>                                           pfl->chip_len, errp)) {
> --=20
> 2.26.2

dme.
--=20
She's as sweet as Tupelo honey, she's an angel of the first degree.


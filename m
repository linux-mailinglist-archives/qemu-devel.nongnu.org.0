Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08D3322FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:27:45 +0100 (CET)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZaa-0003Mz-5c
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVE-0006Sd-Gk; Tue, 09 Mar 2021 05:22:12 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVA-00026e-9k; Tue, 09 Mar 2021 05:22:12 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129AJpMT178077;
 Tue, 9 Mar 2021 10:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=OfWhrClSVfpIViHkehDCY5UZqAjogxardqY1XyI6Tfw=;
 b=l51UgzuIdkyDprNCxFqLaqF4pe/MSd9kDPXwYVQDH0lOYN73hn/4AtzfB3SlK8sdurT3
 RkCMcVRydosy/J9p9Hrpsmj0ZJxUfjexdMOxKM/lUY8QkPvpYUzqgdi8K0lvFgMzWLTM
 p25xGtKfGVUq4DPeMvzDW71v3uph8ZjXjWncqZdanfhKYM8+iPbXHC5iNJbevRHAc9aP
 jz7QykVRe5sCaf5KWyOc7bM1bQTM+sgi1rYdTGAyAP6BQyuaodzBRdVtISLRXNPZJN2O
 OX+6Z6CqDIs+PPr4w2eJU2vZ1m2NyKQk4YMp+zQ9fdgQB76YBQLCNSVHE0lqJKgiQ4zx Lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 3742cn6rdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129ALUa2158580;
 Tue, 9 Mar 2021 10:22:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 374kmy995w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0/nO3bnriMqVtOCfBPkOUda7D7nLr2OwCktUAfPkTW6KSHh9RMBff4OjosRAV7sMBfeVj36/2C+6ArFJb01dvHh6FJZ/RYbvNW8mmshg70UglqBthJcOA7dP+Naejhs2A1BR73fhNeeoYFTusK0hqCB9surEzkUpA3FnYjYJqVbquM5lnXT6Mh7GezjjHGip9fVaPWbmJNlD8WB/OF4fv17+wBQ6E+dKR+rlIkEFzLoYU5Zpl+gUmW4TDgRVt0ofbemtPKDSJUs7IxovKkWveAIHeO6L8Sb5eE1Rr4Q1WsFiTt8p2FY6//M8bnPXmFsWksGh7dW2KqPrCZmx8gJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfWhrClSVfpIViHkehDCY5UZqAjogxardqY1XyI6Tfw=;
 b=aMjGaVTkOpEEPIHovqzv3n6oJqOg5xdyS0j+yc4LOdJdW3o31OT6HGvB25GK0wizss8woEPNxjP4esCWMh2G44qFhttruwXRmf+rgMEnKtyI3b3A4yBMbnabM2i7O+iGmVMgHLYAZA3X11xa5SzBabFWfOI68Ph25SUq04gmNkKiuGXyb+LFBLh9tVRy+eWyLeLVh9AJ2oCibgNMWIWyCV/Ggnyqb7irrtGGZhm1lDj35hS5rYUulyRuVkiA7nJ8upkTsjdtIkk1BcS2HpWmtNFE5+yYG0hyjmKUlhDalhZIq9bGqx6bAVR4BrEmJzDlMLUklJg9bWWcVI+OGup0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfWhrClSVfpIViHkehDCY5UZqAjogxardqY1XyI6Tfw=;
 b=mVPHAh88xgvT4Nh7y6lJZAXoJNzSIB66naBoav6zNGXgzx72wF3EAGXuiIbqle+XQMMd6+SvKzZ1AeUOui6FHIARPACb9ZEELRJL7FLjRDA4cF1pSUm8R+7umrT10CFBbZ/xf4nD1l1KktWfjmj0INMrIpTSqSn8or0sdGBVOrk=
Authentication-Results: weilnetz.de; dkim=none (message not signed)
 header.d=none;weilnetz.de; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:22:03 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:22:03 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] coroutine rwlock downgrade fix, minor VDI changes
Date: Tue,  9 Mar 2021 10:21:53 +0000
Message-Id: <20210309102157.365356-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 10:22:01 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4264daef;
 Tue, 9 Mar 2021 10:21:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e42418d4-bdb4-4c0e-4f83-08d8e2e52e74
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5184CABB847796E1C4D8BC7888929@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JF+wIB1nMKHcXno67r9zG931Jv6Y+/YXUM2GSECs2nUD2QqRWwSz0EO/G31eUIPjUfHGofuZRF2alI4DBQfd8uODxT7eldo30xHTnuDX4bOiRNxu6cZmlBFZG1pP9RkrlbdcG+EMQO1z1p3hR2/D3jaKbGsdgGcQA1TszkaL37sT6GJW/Bm5XzaG65Zww5yoLLuc/hATbBngwNoW7gg8rAlLK4TRtvFRqLxgAYdSaxTWqbh1Vu7PjwRlD4J+hILJGdFbBUlsmY+6V2acAsnMxzYFqlN6ySnX5h3FCBL0rn1ihOnzTl6/C3rLkBjD72gUfR058CY6c2+kGiUAIVetkk5U3mW63MB90EjZyORr+38BL/RI/uZd9aR+EMtKiiE/6gtTzyfothpK1c5hrNgM3JGQgCtMmL5Th9sdysVzYvgHd467rp+cTntnrZVJczk6mgA8JWAtbjCrie1AOuIGW+y339xDQeW63i5WoqMn5Tft1KRI4g3kZOvg9MokSw7NqQr7uHIq/zG5W/1yn9fbLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(2616005)(66946007)(6666004)(478600001)(107886003)(86362001)(1076003)(6916009)(66556008)(54906003)(66476007)(8936002)(8676002)(186003)(5660300002)(316002)(44832011)(52116002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TwZjKrzSmBJXGjKS/7C29s5nGpXXImdD4vNLjU8a1+8s09ZfYKCSr2IzWdXO?=
 =?us-ascii?Q?Mq45DIKgTxPy+iT5nyU7JHAf+D8Gbc+/+xDItbNVo4JvKX2duRMdfN6+gIdK?=
 =?us-ascii?Q?t8vUwAziCukkZQbElRAKVSlFhKJkMk56RQgYVk7LZAsk8hrU0LxZq21/ww88?=
 =?us-ascii?Q?kJCX99fRVxpW8n3frzx6Itlsa4bguJn3Ukuagq6gtVGKTUDrJ7b9mhPYqGyt?=
 =?us-ascii?Q?00yL94MhRzneFGT+T9WJmGxcxGIIHFtuRBxpoq61hudsF1KTJOK2guQSxWuL?=
 =?us-ascii?Q?l0l9jWAvVxYUIoj5n9c1Uc7eXingwb8z83latp7Hm5yL2mJZLNGHf1/RnASY?=
 =?us-ascii?Q?Gvc1TO6aR0FkhJPmuAmgR0G8aiNcc3Ni1wPR7zij1ZJxs/UBoYo7z3YKZta8?=
 =?us-ascii?Q?nqgFY48iZBZ1UeZA4URKf0ieUhALlbMTQ099OurNPfFpb3UwzPp7dCxzDqw0?=
 =?us-ascii?Q?++7qs5dg5A41MHAF8XyRxr3WILAjvlatQ6Ln3iofZW0LJXAlfsa3iwYGC+qK?=
 =?us-ascii?Q?Fmt4Cfa8J2XFC96Uo4sbTGpDsvDhj6BWRwlyE1bYX0md+3oCMIJdd8rqfhDw?=
 =?us-ascii?Q?gxgz+gAKWjDi7UVK9uADHuscifQPWVmQEeexDHjjB2CWwh2RB4IlPRUItwav?=
 =?us-ascii?Q?/OVlZHLDr97wkh++zBIVLGJrM1an9LIHXUyzLtDrvTVbLUbRH/LaC/dMGmgP?=
 =?us-ascii?Q?LThTGNhT5OwekMdHxQwndLDQUPudlBmwcfpPhU4QU3G3+Gm4cRoers9Iq8g5?=
 =?us-ascii?Q?RMzOP1SCLPqhzJvzkrEQm37uwljFFNlG5llm6oWBf+vd6tFE7qmMXzBRQTTg?=
 =?us-ascii?Q?2GZgpea9PVmcqfENNcVKpPy89+18IqtIJjBFHNxbcsFFwjUNPUWY/gMSEobp?=
 =?us-ascii?Q?mhf6U8omgIi0vLy/+E72hHHcgS35Lppzy+R1iCz4dxJR3m968IRy5ErzWi0a?=
 =?us-ascii?Q?xnKZnLPMuahnH47TuQcrboWbb/SXsPME3INcXyMrDrZBDGKibAbN9BoGe3T1?=
 =?us-ascii?Q?b6503G/eVmqMxsJ7GbcPyeu6HGNo/gmgcddTgjsjNB7csQJorEuz63cJyjG1?=
 =?us-ascii?Q?Zm5QhSG5cr9MITGEVZyBNqLcgV5b22OvEmbQsEtEooJmF6zbbPDtEHHtBvkO?=
 =?us-ascii?Q?IMiDya4pnKjei7zGa3qHHB4tIhWKQeRo4xITQKoEF4VEes4AEPoIuX2Lkdu6?=
 =?us-ascii?Q?wkIHQf+gC0y29P5TAxT3RfN9avTQsyAz+J19d0LKTwY7A9KQgsz3JSkb4wWg?=
 =?us-ascii?Q?zL2TfUkFlBHHRWDvVTNKnrwSHQx9DY9ye+ifNVHeI9qOIwPw4LI4rALAnK6J?=
 =?us-ascii?Q?eybbCMJyy8UhRm8lYiA5BGHexN33vtf1vJ38XSUbZ2nz0A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42418d4-bdb4-4c0e-4f83-08d8e2e52e74
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:22:03.0776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G78BIzBgx/WJ+3WWa1HYXOnnjCc+2nklBiukHbf5asDqwXC5hwHwuFV22wx67owiiO3oGGrsA8lXCF88uBPGBArXz+xsAqZ2x3TFGJEgveA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1011 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
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
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RFC because changing the coroutine code is scary and I'm new to it.

Stressing the VDI code with qemu-img:

  qemu-img convert -p -W -m 16 -O vdi input.qcow2 output.vdi

leads to a hang relatively quickly on a machine with sufficient
CPUs. A similar test targetting either raw or qcow2 formats, or
avoiding out-of-order writes, completes fine.

At the point of the hang all of the coroutines are sitting in
qemu_co_queue_wait_impl(), called from either qemu_co_rwlock_rdlock()
or qemu_co_rwlock_upgrade(), all referencing the same CoRwlock
(BDRVVdiState.bmap_lock).

The comment in the last patch explains what I believe is happening -
downgrading an rwlock from write to read can later result in a failure
to schedule an appropriate coroutine when the read lock is released.

A less invasive change might be to simply have the read side of the
unlock code mark *all* queued coroutines as runnable. This seems
somewhat wasteful, as any read hopefuls that run before a write
hopeful will immediately put themselves back on the queue.

No code other than block/vdi.c appears to use
qemu_co_rwlock_downgrade().

The block/vdi.c changes are small things noticed by inspection when
looking for the cause of the hang.

David Edmondson (4):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine/mutex: Store the coroutine in the CoWaitRecord only once
  coroutine/rwlock: Wake writers in preference to readers

 block/vdi.c                | 11 +++++++----
 include/qemu/coroutine.h   |  8 +++++---
 util/qemu-coroutine-lock.c | 25 +++++++++++++++----------
 3 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.30.1



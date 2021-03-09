Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AB3322F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:25:46 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZYf-0008DZ-Jd
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVF-0006TG-Tg; Tue, 09 Mar 2021 05:22:13 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:41646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVB-00028Y-S2; Tue, 09 Mar 2021 05:22:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129AJRbE064315;
 Tue, 9 Mar 2021 10:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=P5pVq2cofdt/N/W3R0Lvus5sEULtpEmWq+jruztvHs0=;
 b=QJYH18inV4I3IQBiQ6GONuKdbYyH/7ihnFHD1b2usUl1Y+CNXrKHmHv8FK+9Ywm7R4o8
 VGmHB3JISffxeu/9uNX3AsZzU7OIQ6e00vM9HPDn4LJxtwppL7EPbWBHyrCZVVMDZx9u
 rQGlIopY9MUNu3BTtHCzikAlugFVEAYNhxNu1Edt/Ig4Q6qFHCfePFQd9OX1rDLnNG8Q
 CELyQH9CUu80EV+OSXLhtofg+CzMn06L8PUsB2trOYV056RZoHfvi5NRV7c9KvYef3Rf
 YuuMbc9uxNSuU7jaV9zXuqSeEbcnbDvxtTeknJbwZmheTR0yH6pvAFS2Tf2CGATe8v7c hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3741pmesh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129ALUa6158580;
 Tue, 9 Mar 2021 10:22:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 374kmy995w-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIVgEQryqMxUiiqJkDoW8hD5EPVXKYEjwKWDp7qROGgVYE+CmXKZmAY/c4qOntXqUqZ2FxkkPmzpm5wN6SzbgWTjB3Li39iRy4fWqrfZNZKLNP1aMTzOkPRVfwcPP+2KsOMk/PW1o7GnO91eLNwaHWkYTVdiqz3e5+hjI4tjbmRJY78m1XRLS4KfyMuOddMUpXyseutDcoY+fqzaOTG9RVGhjf6iqsACH3q3dCFfky//pcAx1568ZVYeLzFK0QXULWL8kuwL/dKyTu+LDwKmpjWiUFjHJXrfN2eJIiwT9EsXzxXyJuS7iwR49OzuW8dsvgB0eEpkZ/H0D+xYKH2BJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5pVq2cofdt/N/W3R0Lvus5sEULtpEmWq+jruztvHs0=;
 b=U76MRX6FXwNhANWJiay4S7iT+ASeMNixyRo25RNzaAiBvMFq/14k0ZxJjlFhOnjPF3FOkWo0tlxc9BOkIKRJZZU9XYBjVqO+9olIEDJ0VTgd4BqYGgs33Z4UOho5TllijUENToWOKHiZP+0bh/0ZPHcP+6IeEsuvCUDpv22Wn7iTxGlAfajkWmIpdPAXiFeA4RjDQfXHIS4h920F9Rwb3cWoYEO3bixekQ0n//+5xdcETYpxpuamuEpjhpPKt4e9f1RJRr1rJ7XfcIUehdVkfEuSYIv1oZ0cK26YrhBEzm+pM48t7vi2I88k92KYO4L2yzwck3nDqugDu+iab8uE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5pVq2cofdt/N/W3R0Lvus5sEULtpEmWq+jruztvHs0=;
 b=zSBM1m4tR6sOPDOreJOAwloSFwI2jybE79LhMuj9fLs0Npaw/bpbPSbr/gNzu619f0PATeJfJnOsAlLxIQE/tbZLicqOn4VVHteFQzfgg9Igzl3waduPZIimD8zRiJXH6hYdWtpFS50melmsdZJ5dB44mz9plzKV1cMMAF5KXbw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:22:06 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:22:06 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] coroutine/mutex: Store the coroutine in the
 CoWaitRecord only once
Date: Tue,  9 Mar 2021 10:21:56 +0000
Message-Id: <20210309102157.365356-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309102157.365356-1-david.edmondson@oracle.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 10:22:04 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 6d14312f;
 Tue, 9 Mar 2021 10:21:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0836d4-ed4d-43aa-4b31-08d8e2e5305e
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5184A6DCE3EDE44FDB09A72488929@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dN9sL62fkYNchDajhRhZCeDcR0HYMDAR/vB/Mqx+CZDG0YzBBztRMfCFeLs/f+ULjQ0Tg3aRHNfSkCrB8Hm7XvMyJKB9L6VZuZ1NhGlitLAsZ+Gi7EqzlD+RcAzxUcdVMjof1InRfSjCZXA5OsbwEIEnK4nR3BHBbb274kmmChmoCGqZQcuUQ6C/Icp8vmLy79qTkHkCjK4DxWsMs/S1oI+1pPmheQHvCsYCRD8xTnFQGZ0fS5kyaM3bKjYwQC9uPHwP9qbKjVt0EfSadGjncpnwyGylNRuL+Gl8xQ9ICmzVC0qEa+hEa1zMD+TzAk2he7TkXGb7RAQhwlmmmRjtR+dH+XVomM40BrTECmQI0uhUI6RCgq9LPZwWmDQ0IF6P85gs6flyn7iqmMv9tsYQdR9aGL5ZGBqVsjvzQ8UWlaE+0orqSpmSF6Q8BBcFgnvgunR7QHcv+ynBszeLBkmq4sx7wpRC4j4GVk5seCDe8p38gDrSsxF3j2cdUBKLjYgvS0U9AnZfGP0Zk8qQ5qva/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(396003)(39860400002)(346002)(366004)(136003)(2616005)(66946007)(4744005)(478600001)(107886003)(86362001)(1076003)(6916009)(66556008)(54906003)(66476007)(8936002)(8676002)(186003)(5660300002)(316002)(44832011)(52116002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JXMSBNEXLNOQHYtUUi+ZAB8I5e5w5Ae2QmShFA8n5fcWtxfhAQTKdo8Ohg93?=
 =?us-ascii?Q?AGX51YcivJXIyAWJc1XiPwPWDSROwUY/UYTiSExMyTXPXbLILe2tPSHP5fPE?=
 =?us-ascii?Q?mBXa1S7XgL2831lUWLR0aFW6m6lyJ6fdLYeYsUBb7PwIgBqf8vVEDgPXsRVx?=
 =?us-ascii?Q?S0yNINVBRdwXdoYdz+/z0UpuvCHRDXvXfStygl9gNN7GUWJu5F3x7bYJSD76?=
 =?us-ascii?Q?d+cSxxbueS6EHRiWGxNgOi5n2WfQb84TKZGZnXezeMCphkQ9Mbbq11SAajbe?=
 =?us-ascii?Q?T31D0gulqWzApo+gMZDz9XectJhG6EFppu8Cm+UCZeIw/miEem9Hyd+k7RVB?=
 =?us-ascii?Q?u47vdtQErVpNBCog9TxjpRGyg3j0wpt6t+4hit5ThlCcU44DgqJEM1UF5wLM?=
 =?us-ascii?Q?Eeo5m6dMIwKhjGYbhfNb8ejOuWg1UwJUlvRq/ExPHu19jZdVmaUPUq3kTsUO?=
 =?us-ascii?Q?D/2n8XG4fiA8avQ4TVmRfAhSfhFpzzSmTxVNRUUz0hJwjstpLPLMJzTA62xd?=
 =?us-ascii?Q?RTfEXiKsHdiVA+SSm8a5C5DG7r3ZyAXybGH1VvO0pHLPeigYSAXtOqLOLhgf?=
 =?us-ascii?Q?JJ92XDjJYCqrks4K7oQa0n95fOI5TaCWxHs5NotanMMouMd8w6BO7cyvCGK3?=
 =?us-ascii?Q?UfCwlrL9fcc1MFDbvrFuCcQ1Lt3rudqlQ4OU61xy03QF1blxLzZznjH0Xi7T?=
 =?us-ascii?Q?OBL+4CerP95/e870jI/NBOcbZOeI/nVDjt//PuTU1dtWYm7fGkdo66DoMUfV?=
 =?us-ascii?Q?rVsLWNx1q5ehbam2dT67uS8QbeYM79UJvElGChxuMDZthiV5IfMh85dVT4FJ?=
 =?us-ascii?Q?MMMlUUy845Sx33N76i2BmLnzQWUNrnjxq1VJnFo1CmJpncdX55QVhcr7ZPL2?=
 =?us-ascii?Q?9/rdCWqRoD5skbnfP2XBYf7NHcC/zr0oYJ8G7azYmBLLsCQpthtyLyDXqiPo?=
 =?us-ascii?Q?k+TcgQCvVMcbQssvRy73ObnTdPQt949/dPl3wf6IX3IMiMu1vfgKH4rhl4iZ?=
 =?us-ascii?Q?WhzI4uNQIiTw0vrFoAEASyOeOEbLTCEzhF4wr6/34I8mFHfB65Hx1/KWYat2?=
 =?us-ascii?Q?wk1UEfOXJzxor/4mjMtHt7ue9m73JPsq/ZMtryexyA+i1yD7iA5Q0aZi+1gG?=
 =?us-ascii?Q?g6n2xu/FIe5NcVZUWzTmUYa+hEtKIARmblaqzMWlba+PQqLQkMhga6QnGHyF?=
 =?us-ascii?Q?JDtcMPoqAahOrSx02a0Oopj1FVVqiT4lXMaEMZIUqehIhkOIbhmBC5jsUnum?=
 =?us-ascii?Q?eXYbdTNIUJPOeKyMMrNFeAxNBE8Un7FbCfIO6neSTsILfeyU8FMs01HFunoD?=
 =?us-ascii?Q?VAu1xnDXkb4vrXqogcRjIxEH9oOIy2cS1nSlNie9YPTF/g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0836d4-ed4d-43aa-4b31-08d8e2e5305e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:22:06.2997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGqO4IEOiSipSBWI32hk3Nfw0a+EibRClse6CcXiKGoaH+hfLecEoVhADbeFcitE4AxNEH+IbA9ucX6gmEz11fy0pwF6uo1WW+CnXxHOKIA=
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
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

When taking the slow path for mutex acquisition, set the coroutine
value in the CoWaitRecord in push_waiter(), rather than both there and
in the caller.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 util/qemu-coroutine-lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5816bf8900..eb73cf11dc 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -204,7 +204,6 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     unsigned old_handoff;
 
     trace_qemu_co_mutex_lock_entry(mutex, self);
-    w.co = self;
     push_waiter(mutex, &w);
 
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
-- 
2.30.1



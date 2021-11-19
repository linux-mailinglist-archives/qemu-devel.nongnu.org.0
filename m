Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CA545775F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:54:27 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9xq-0007C9-8W
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9vf-0005T8-1Q
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9vc-0001Lw-4t
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:10 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJIUJB2027682; 
 Fri, 19 Nov 2021 19:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=E/eaho/x5cfhPMODmzB5J7492lsQV58yWTibmFBgPQ4=;
 b=GeFfIcPnyDJ1ayeKJo+SmhuQIIeaumSD33Hi1y9JOyr3/cg109ENHcUmd8ebAjbYKX7T
 5poATWh0bE8tD1cM1hRmx7jemW6tZYjKo0rbIMDv5f0MAY73wGp7+1IJQyKpKGRTYYhy
 TU/GhMP5BIE7t/30FkqAuaC1JzHE/kbwU9wxSiGR/CYUOVi9seT7PqaBjy0u65BnYp2h
 xres3S84dTIVp/DN7UA4wftU0/+uy8jZ7Pldm3fkDgHmFsMpfDc0crb3dANeiwql+7yS
 8NhJU1ITzKk84yQiAKwlKzxaMhaMzdvlO6+JoXoBaEwon6tCKHtILkLzeakkA+PffxTg XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cefpbh4fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJJlDMc112819;
 Fri, 19 Nov 2021 19:52:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 3caq4ycm7c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak5xPl25uL1YwCEcdxOcv6Ekwz8jx2HD0BsVABSO0wb8mxSuXmaDSRMVNvq0sJOdVcTZo1P7GAVWFU1sOZOJt07Ww/IGn1RCpT4vnKUimMZxDfConmQJD7dPIfXmj5WAkszz6AgTlXZJAv71ASThaOZnYmHFALMpuIqfZYHshy7xSOWuKpSw74Tq7/dV9kwHAUQ5m/021EGTDcR77ilpzP6b8PUjF3cZCFWvSayUDd6Kya47+TLzQIvwE2iL0AYYqfZuIFbqrpzWcOySqAANUWyWoEKhnqiyu2bUYnnd65kE/jWcAs3W9iqHGwuzLKvmYsBxOUR3DGjPzJ8dOKobfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/eaho/x5cfhPMODmzB5J7492lsQV58yWTibmFBgPQ4=;
 b=Vy/DPpOcijda58z9OqYUAMTZNWfddA5FugOk6WeVboa6tpuSF2Ju7SBHx0eqdfD/Kq4o3phHE5izoKu0kiJ26dA6XtMfPIBAZjnqLNBHI8jN0iu1E4LMa4OMZ0maJSz4MlcfjSZ29xeMb5ox+ixUj+bu6HfjeDkwEo/poDTeHOhPZEzT1G9cNu+u+tlpE/64WtZz8MHtQqeB0382zAvVO8enIhdVBSW+mQnhUXToaqbP8JLNNWT6AvGXHX9yPdVCyLJripQkIYoJoAmmKIiUjUD88I43AdLvFd6WkjqfJnLpe0Qu+oOmD09nTAtU0b6oWmC/JDJ33+MSpYl1lGZ03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/eaho/x5cfhPMODmzB5J7492lsQV58yWTibmFBgPQ4=;
 b=xQ1h9BFBuPULloGoZY8EIxeylhi0VJXHHDK7optaTsVi2JqxNVi/Dh78bqCuncU9bnRPFp3FrECtI7YbIEOAkbNylZKDOGsXLpAqxNAS4e+TYXuEOt/7/YhVS9vKqS5kcXg8A9Sor+gKmlF3o5ker4+uKdz8xaA6x0Js73xAcgs=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 19 Nov
 2021 19:52:01 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 19:52:01 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] qmp: Support for querying stats
Date: Fri, 19 Nov 2021 13:51:51 -0600
Message-Id: <20211119195153.11815-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211119195153.11815-1-mark.kanda@oracle.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.175) by
 SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 19:52:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0dfafe1-8299-4e2a-b396-08d9ab960dbd
X-MS-TrafficTypeDiagnostic: SA2PR10MB4603:
X-Microsoft-Antispam-PRVS: <SA2PR10MB460302A7906FE67EB33AD3EEF99C9@SA2PR10MB4603.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIraXwYK7ZYxPFKp0gbCNxl2k8baBpKNviPzE6h2uST2A3BUHDffczFXVGadxWr2dy243Fjgnix/dG5vQlm5KdYFrzbjIVmp07CsZtp5kY4U0vyTB5AxbuiU0JTGUubpjUTS+habSRoVweJ+MunGUhPLAR4RhenLf+05+3PkakdFdL6mrGVTdq2xvF4232i/Iwl3pZijW89m/LknN0q4wZqM19P8hYzuz1K8CxEex35YcEcCgQ+ivrbfU1f1cWbc7tDy8NoYky/F/dJXKGLMcx1B9LSDhK3wMdc0wmgMxMFRUUTpLTPRldveKRfpva+tkq/XnOBlDP1dJsMdHZN4NvflMihGfW+NXqXQXSKvzJV7YQCr/F15XE+6Fuf5tIuQWl5wTmVF4Gr4sgwO6a2t9KZ3hXPd2UF88YzQd2+HafcFVqkF+D9FhQuofEbVFpht0CTNX/QDUk1Xgg9FgYXUeuhkzrYeQqA0nBIYNtuKwt2feSYKfYY2L8M1pGDDAOAEa/TsuV3vLvzgzBlZgQz/1XhLRjygmSOsR1tEKR0J7RyMWSoLXLKoy1CHGmORRKWruWXoANUVFHyplCpsoPsOrEx8v0XJssyezZOSHkkpHDh9PQFEMnraIKBDEwQafJeidUQe4ekrX5EzIkEWMAqVWkgrtzY5b0fOG+RNf6z8nkm3homKOAzz7ym7Gwm6gtoaFyUma+TFJTq8osLrKXTkjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(8936002)(2906002)(508600001)(86362001)(38100700002)(36756003)(316002)(5660300002)(4326008)(1076003)(6666004)(38350700002)(8676002)(26005)(66476007)(7696005)(52116002)(6916009)(44832011)(6486002)(83380400001)(186003)(66946007)(66556008)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YsjOqzxKTumYQ5kdNSMO054dz+Fn9QCk4ZFu8Pok4ng7zcFl25vbgJXw8ucA?=
 =?us-ascii?Q?9iye3DDBgjleerRObxsW4eNf8EBsy+SJV0BOiSjlhB3ln5KLrnG7hrrhZ0z5?=
 =?us-ascii?Q?ExH8fah0zYIZ2MpIqKrkQhFfbaT7LKQcTfLMyLPPer6mXsSLg9AeMQaem8cu?=
 =?us-ascii?Q?1iLa0of/QWyJ2BwgFCL0bHbCDCaEdO0afStdY1ykvFfQhhPigMIGj209dqP7?=
 =?us-ascii?Q?oI8PzuQkbyU1izaXHxGCZRozJaVo0L4V8KcwV1Se0eGDWeaYGhA0oXCAszdY?=
 =?us-ascii?Q?Giy4+O+EFd65pemlZdZC9dd1loyLIjWeN1tgUJqFIho9GytnWbBGsXtdrJJ+?=
 =?us-ascii?Q?9uN9zGX9NQA4+E0IyPSCw0lxKKPX5cGkbwxO2P2SxpDUW3cVAmaLckAw6fSE?=
 =?us-ascii?Q?9s56fAleDkKi1dc9yLBE8ALIv1kgrcD6F3/8zKFn9DZY7B1G7xY5XWsQGaCI?=
 =?us-ascii?Q?aFvUKUVixHVAUPFUWhCevg2a8DFj2iQ22AD2mDpVgs+UT9xAkxLOZsByzTWl?=
 =?us-ascii?Q?T//0MeIRqr8Tq15G7Hz7qmisB+e0zEDn+wahIMZDsg+a1ffl7OIq+q3C5sYp?=
 =?us-ascii?Q?VzGyR79FEcwuYbTeZ7HBRuyPtZ9KCF1lwpd87BnIwRankEPYVkpMYYaE9me1?=
 =?us-ascii?Q?vt5QEDo1YzfOWKVFzBcukXwDurxMJ2sjrWdUhgJ9JqBet9ZHOZrKn/akbjo3?=
 =?us-ascii?Q?H5QJw9wZqHP/UPlA8H3wpZnyNPIJAtBGp0Dn527YRybYaUmd5qO4K4jXcYoc?=
 =?us-ascii?Q?KoCBuGHEemG7YE7J8tomOTOqK8nLvfwU4USJCA8z3miX+N4vlOooHRGhNQav?=
 =?us-ascii?Q?DaBzPIQ8nv4Hi6FOEYN0TEkwL8g4zY4cOYjPyqRGRDGsRNsarOO+31jT3cXj?=
 =?us-ascii?Q?xkCQq0OnO3K+dvF2c2QSYI7UW8o+OIZeEdwzoX93DqmDhC6TAE+v8msJK6Ra?=
 =?us-ascii?Q?36Emm9gcLInFgFetaTmkX8IvsQ0kJiJ+xuoHu2e9utpPEjGiDsn8HAHXAPXr?=
 =?us-ascii?Q?OF58oJBVjUscPQR3Y/zE/7HpwcJtjakb0sMXXsZQvH4Y0uL09+22XcOT7g6L?=
 =?us-ascii?Q?fbyWX4AL5gKLQhw/0/nUtF01Ua5vtFqTetUaIQCmpPQGApHS3OzPmhRM+RFC?=
 =?us-ascii?Q?h+xd/+6FxhChWlJ4iMD8qTG/Qil/QA2VmY5bA2bmQP97K+nJ8TaIsZXnvoig?=
 =?us-ascii?Q?X79ajOW5VEdkUbGicsNs3vaal9VmjaxT9QRL0tVV6ZmKoadbXa3Jtv1EQcjS?=
 =?us-ascii?Q?1Dtq3c958Ivu/VhsBGjIVki3CARci2B11LwTESDKJ5IB3ukndiIkS3DvChgb?=
 =?us-ascii?Q?XMB4llBdVMXkS7NOfl1aL8WZewqF08D3K6jWGoqD8wgYpB1UgaY4+lgfdu+y?=
 =?us-ascii?Q?gXn4cWd7YFrXAZO8FpuP6E6jtwZXJSHnqVAE1tLkYv6xtT/6gGztQlZwo4hU?=
 =?us-ascii?Q?qO++TdkgeO44GmPQWlIXZ28gkyG976QpfghMvNHO0l7XIE31Il0by01tvPL0?=
 =?us-ascii?Q?Kl3gvbPP46Y/mCDcwsL4vF7nGULazS6nCISthfcJH75mF/umySqIro0cJ1iK?=
 =?us-ascii?Q?mgzu9cbCxwQrPSiu64aI3/66TIrpVnbIklf76qjVf8rSDrXAbJATBZNueAHM?=
 =?us-ascii?Q?LEyBlcTrvUQXuCEAt3cyNsQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dfafe1-8299-4e2a-b396-08d9ab960dbd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:52:01.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBT4B/fqkf+XyemOj46AD+L9uQgDXbBftNAHykY4is/ILix0Ta/MzfoobaRNYTniqPmWAagw/UxFJ213pclJyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190106
X-Proofpoint-ORIG-GUID: mtUjwsPd0fsbpUSIfNVjlNqOsnJjGou4
X-Proofpoint-GUID: mtUjwsPd0fsbpUSIfNVjlNqOsnJjGou4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce qmp support for querying stats. Provide a framework for
adding new stats and support for the following commands:

- query-stats
Returns a list of all stats, with options for specifying a stat
name and schema type. A schema type is the set of stats associated
with a given component (e.g. vm or vcpu).

- query-stats-schemas
Returns a list of stats included in each schema type, with an
option for specifying the schema name.

- query-stats-instances
Returns a list of stat instances and their associated schema type.

The framework provides a method to register callbacks for these qmp
commands.

The first usecase will be for fd-based KVM stats (in an upcoming
patch).

Examples (with fd-based KVM stats):

{ "execute": "query-stats" }
{ "return": [
    { "name": "vcpu_1",
      "type": "kvm-vcpu",
      "stats": [
        { "name": "guest_mode",
          "unit": "none",
          "base": 10,
          "val": [ 0 ],
          "exponent": 0,
          "type": "instant" },
        { "name": "directed_yield_successful",
          "unit": "none",
          "base": 10,
          "val": [ 0 ],
          "exponent": 0,
          "type": "cumulative" },
...
    },
    { "name": "vcpu_0",
      "type": "kvm-vcpu",
      "stats": ...
...
 },
    { "name": "vm",
      "type": "kvm-vm",
      "stats": [
        { "name": "max_mmu_page_hash_collisions",
          "unit": "none",
          "base": 10,
          "val": [ 0 ],
          "exponent": 0,
          "type": "peak" },
          ...

{ "execute": "query-stats-schemas" }
{ "return": [
    { "type": "kvm-vcpu",
      "stats": [
        { "name": "guest_mode" },
        { "name": "directed_yield_successful" },
        ...
        },
    { "type": "kvm-vm",
      "stats": [
        { "name": "max_mmu_page_hash_collisions" },
        { "name": "max_mmu_rmap_size" },
        ...

{ "execute": "query-stats-instances" }
{ "return": [
    { "name": "vcpu_1",
      "type": "kvm-vcpu" },
    { "name": "vcpu_0",
      "type": "kvm-vcpu" },
    { "name": "vm",
      "type": "kvm-vm" } ]
}

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 include/monitor/monitor.h |  27 ++++++++
 monitor/qmp-cmds.c        |  71 +++++++++++++++++++
 qapi/misc.json            | 142 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 240 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 12d395d62d..14d3432ade 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -56,4 +56,31 @@ void monitor_register_hmp(const char *name, bool info,
 void monitor_register_hmp_info_hrt(const char *name,
                                    HumanReadableText *(*handler)(Error **errp));
 
+/*
+ * Add qmp stats callbacks to the stats_callbacks list.
+ *
+ * @name: name of stats callbacks
+ * @stats_fn: routine to query stats - with options for name and type:
+ *    StatsList *(*stats_fn)(StatsList *list_tail, bool has_name,
+ *        const char *name, bool has_type, const char *type, Error **errp)
+ *
+ * @schema_fn: routine to query stat schemas - with an option for type:
+ *    StatsSchemaList *(*schemas_fn)(StatsSchemaList *list tail, bool has_type,
+ *                                   const char *type, Error **errp)
+ *
+ * @instance_fn: routine to query stat instances:
+ *     StatsInstanceList *(*instances_fn)(StatsInstanceList *list_tail,
+ *                                        Error **errp)
+ */
+void add_stats_callbacks(const char *name,
+                         StatsList *(*stats_fn)(StatsList *,
+                                                bool, const char *,
+                                                bool, const char *,
+                                                Error **),
+                         StatsSchemaList *(*schemas_fn)(StatsSchemaList *,
+                                                        bool, const char *,
+                                                        Error **),
+                         StatsInstanceList *(*instances_fn)(StatsInstanceList *,
+                                                            Error **));
+
 #endif /* MONITOR_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 343353e27a..c7bdff1e1c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -466,3 +466,74 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+typedef struct StatsCallbacks {
+    char *name;
+    StatsList *(*stats_cb)(StatsList *, bool, const char *, bool,
+                           const char *, Error **);
+    StatsSchemaList *(*schemas_cb)(StatsSchemaList *, bool, const char *,
+                                   Error **);
+    StatsInstanceList *(*instances_cb)(StatsInstanceList *, Error **);
+    QTAILQ_ENTRY(StatsCallbacks) next;
+} StatsCallbacks;
+
+static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
+    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
+
+void add_stats_callbacks(const char *name,
+                         StatsList *(*stats_fn)(StatsList *,
+                                                bool, const char *,
+                                                bool, const char *,
+                                                Error **),
+                         StatsSchemaList *(*schemas_fn)(StatsSchemaList *,
+                                                        bool, const char *,
+                                                        Error **),
+                         StatsInstanceList *(*instances_fn)(StatsInstanceList *,
+                                                            Error **))
+{
+    StatsCallbacks *entry = g_malloc0(sizeof(*entry));
+    entry->name = strdup(name);
+    entry->stats_cb = stats_fn;
+    entry->schemas_cb = schemas_fn;
+    entry->instances_cb = instances_fn;
+
+    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
+}
+
+StatsList *qmp_query_stats(bool has_name, const char *name, bool has_type,
+                           const char *type, Error **errp) {
+    StatsList *list_tail = NULL;
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        list_tail = entry->stats_cb(list_tail, has_name, name,
+                                    has_type, type, errp);
+    }
+
+    return list_tail;
+}
+
+StatsSchemaList *qmp_query_stats_schemas(bool has_type, const char *type,
+                                         Error **errp)
+{
+    StatsSchemaList *list_tail = NULL;
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        list_tail = entry->schemas_cb(list_tail, has_type, type, errp);
+    }
+
+    return list_tail;
+}
+
+StatsInstanceList *qmp_query_stats_instances(Error **errp)
+{
+    StatsInstanceList *list_tail = NULL;
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        list_tail = entry->instances_cb(list_tail, errp);
+    }
+
+    return list_tail;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 358548abe1..a0a07ef0b1 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,145 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @StatType:
+#
+# Enumeration of stat types
+# @cumulative: stat is cumulative; value can only increase.
+# @instant: stat is instantaneous; value can increase or decrease.
+# @peak: stat is the peak value; value can only increase.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatType',
+  'data' : [ 'cumulative', 'instant', 'peak' ] }
+
+##
+# @StatUnit:
+#
+# Enumeration of stat units
+# @bytes: stat reported in bytes.
+# @seconds: stat reported in seconds.
+# @cycles: stat reported in clock cycles.
+# @none: no unit for this stat.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatUnit',
+  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
+
+##
+# @StatData:
+#
+# Individual stat
+# @name: Stat name
+# @type: @StatType
+# @unit: @StatUnit
+# @base: Exponent base (2 or 10)
+# @exponent: Used together with @base
+# @val: List of uint64 values
+#
+# Since: 7.0
+##
+{ 'struct': 'StatData',
+  'data': { 'name': 'str',
+            'type': 'StatType',
+            'unit': 'StatUnit',
+            'base': 'uint8',
+            'exponent': 'int16',
+            'val': [ 'uint64' ] } }
+
+##
+# @Stats:
+#
+# Stats per resource (e.g. vm or vcpu)
+# @name: Resource name
+# @stats: List of @StatData
+#
+# Since: 7.0
+##
+{ 'struct': 'Stats',
+  'data': {'name': 'str',
+           'type': 'StatSchemaType',
+           'stats': [ 'StatData' ] } }
+
+##
+# @query-stats:
+#
+# @name: Stat name (optional)
+# @type: Type name (optional)
+# Returns: List of @Stats
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats',
+  'data': { '*name': 'str', '*type': 'str' },
+  'returns': [ 'Stats' ] }
+
+##
+# @StatSchemaType:
+#
+# Enumeration of stats schema types
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatSchemaType',
+  'data' : [ ] }
+
+##
+# @StatSchemaEntry:
+#
+# Individual stat in a schema type
+#
+# Since: 7.0
+##
+{ 'struct': 'StatSchemaEntry',
+  'data': { 'name': 'str' } }
+
+##
+# @StatsSchema:
+#
+# Stats per @StatSchemaType
+# @type: @StatSchemaType
+# @stats: @StatCchemaName
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchema',
+  'data': { 'type': 'StatSchemaType',
+            'stats': [ 'StatSchemaEntry' ] } }
+
+##
+# @query-stats-schemas:
+#
+# @type: type name (optional)
+# Returns: List of @StatsSchema
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats-schemas',
+  'data': { '*type': 'str' },
+  'returns': [ 'StatsSchema' ] }
+
+##
+# @StatsInstance:
+#
+# @name: resource name
+# @type: @StatSchemaType
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsInstance',
+  'data': { 'name': 'str',
+            'type': 'StatSchemaType' } }
+
+##
+# @query-stats-instances:
+#
+# Returns list of @StatsInstance
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats-instances',
+  'returns': [ 'StatsInstance' ] }
-- 
2.26.2



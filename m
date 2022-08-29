Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9BF5A46C9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:08:55 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbhO-0006BV-D2
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbf3-0003LG-Ou
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 06:06:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbf1-0004rK-Vy
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 06:06:29 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T7BNJl027736;
 Mon, 29 Aug 2022 10:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=jy5S0uglOPbgSLWHlsZBcz5AK8ysl3QKC22ZvFsrA2s=;
 b=JnYgsYhsJRDI92Y9PjQZjA3LarUizl2beZjmL/cSD5o9cLmOJsycOjBaLn59RuA8YJ/v
 O107+WcsbaspdOAmMTW+YUtYiu+Q+NVGuOOZZaLCWiosPERJAkPcKV5WY8Fc/Lq07+u+
 rLmkjM1fhCtne7of930o0tYVis+tj1OcOkXCFi2WIXUg6/rvbRPgjTKA2Cd3Npt2wtIg
 lsUpmuwXcL9vCpuu2IyWJCDhJABQmwMoEYTQxetUzWhS1vx22GNwkdAOf6un0zTl8/eY
 tqHkefAnv2Qw50Lx9OaCTz99zucyqg60gMALoawSgTcepKdcvvBY9btglwKIA7JyhHUm TA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7b59tw4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:06:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27T9X7ep019404; Mon, 29 Aug 2022 10:06:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q2acxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMs419AwbnPzpX7Dc+4XqlwTq+IWAbm0FA/OyQFXwck/Zsku+fttY2gTnoRRoS1JG6YEwE1UeizyHIRk+rIjdnnKgPcSKjvQzmD7eImhfctaACp2/VDyi1nfieTUSkNdaO63qfp0PVPhgeaUZmvMij0fwggd3DwUTvQK9PLtahNckK/5Za3BTYEVKJ6Rw6eL7LkGQnFVu5ZNHAyOXtInlrQUaDjV2b9moqImubU6EfXYWMxk4GPLiWuCzhsDKAvYXpqjgAJL3jDWzDqsHVi22fDr7IlyDYOSq+jXQ0qDGI2XSxIcNG1zVymDx+5h/vYcS8N25yEb3Rkpolxvs717aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jy5S0uglOPbgSLWHlsZBcz5AK8ysl3QKC22ZvFsrA2s=;
 b=HZ5QaVANyOBLF4KtB3c4rfKvp3JMpxXrpb0sIqFOvA8A+OBSL5+fFeyKD8QoQCvJFZTtqOM/HsiSF6SH+ZR5s1V8BmzcwQpyup2CXrCQziw+qpx5rraCLsylG0okB4gseOgfWW01nYWTMF3b9i5/39NKzP2zfloHyn8lqMquSB0BdFKavtlF04RfcW2X6F7wQIVwpFlmBohIk2nqpGgMVXqzJs+Z5jCACYMaSd1l4VSJDpynAjW1yOBoishlPCqBIchS/SNGqBHZQDj93IsygStEU6YGIrcAzWfgEgMtDDullgImqrG3wNiGQoHbgaK5eqbOxj3YECkFp4O6dCctRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy5S0uglOPbgSLWHlsZBcz5AK8ysl3QKC22ZvFsrA2s=;
 b=SvqVWaYoqovVyQWLgcTq9Ub3vUocRmGlrhKCsuOTajDX9hEEQc8X0GgEAj0D+7wMjowq/o8G1fHuu3a53G+eQvfWorcXOPOXIXJebwu3pfwEMfF+y0ShsBnHEG52j4ivg3NQ3WFq3+r5pYDC465ki+ZIJ62PM1+p7FMTlg9V7Bk=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:06:20 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:06:20 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, armbru@redhat.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org, f4bug@amsat.org
Subject: [PATCH 2/2] util/log: add timestamp to logs via qemu_log()
Date: Mon, 29 Aug 2022 03:06:22 -0700
Message-Id: <20220829100622.1554-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829100622.1554-1-dongli.zhang@oracle.com>
References: <20220829100622.1554-1-dongli.zhang@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:5:3af::29) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f68ea9-6755-4c9b-da31-08da89a61ef0
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VQ9r2Y8ONJYkqkaZGENxtlxlL1/7+zH3vgR/cYKcbcFVzfW4kk0cmlwDG7qbAzbi9MboAf1uZwQ4hH6ul1BK0dS7V63cUiY0ilWBdtU8onD/+MO6KHw2M4e47NanhFF/H2/lzk5JY4akAl7/GsSlLYTH/np3gvx8135Cro9BUGFpmV0jvn8v6W/0ih0C1utXSDhOXIZBo7TZ2FfbfrhR8m49yCB2PY0RaP1p+NGeXH37KyQR8MU4m9KtBQIyTETQCA0ScLJ+w0dz7fjtqJq8cQinfTijxfs5s30gMuXHstvqavnRuj2YP0yHTZXXS6DvBF7Gt5c1HxBDx6qHfKHFEovXA1QUVVHK3LWJqELlVQK9EeMQ2d4MuSOSDIrrbjtTBiyzUnGyaxVIczavzOk3ZRZBSo27ac4qgUDj81ESOucv/ZKLeOMuDcsDQLtDdRmweLdcCCaPubv6GWl6+KP1qwLPDKeBLJF04GPY3VZ+nJwwaLmvSdCdHj2bZCM6/Cd5t0a4YrCe9KNCGrB67BZAck7lxttiR2k7zsUtZ1X5wUsSC0GArz/Ag48P9aYY8kWoarRFwUxv2P4fxgADr2Xi31v3NYFBKgnaDv1+sJvti7/Iv5ysBWgp58qCeWaUXxYQVaL3E4OVf2ThlhhdGYz7F6LPYjb/1eZazXKbcTF4f3A2JTMOuTDLs01mZ489JVo6pSQZcP+qVvtQpYx4egS/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(346002)(136003)(39860400002)(2906002)(6512007)(4744005)(38100700002)(26005)(44832011)(6506007)(2616005)(186003)(1076003)(83380400001)(6916009)(8676002)(66946007)(4326008)(66476007)(66556008)(6486002)(316002)(41300700001)(36756003)(8936002)(5660300002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0irjMOE8TGur/ARXylpxBOfEiYJGCFxgfDo+bJqqZJTAoa0O9p0+kf7QqWfG?=
 =?us-ascii?Q?lTQnSVPOR/lR7NWiYdWFOHtW4p+0qt+JHBly6NvxoMz/xk76fEc57LwZmHiW?=
 =?us-ascii?Q?q1fpohrPxnkDkIOIjIZZNeDfgXNMxqH3sWDXJ/TEehkSba0FrwYlDdwz+O93?=
 =?us-ascii?Q?lmDQzAJFJ+AWupMVgiiQCVmWbdzdngSAzygP9jRs5SHMnO7/NcevQDyCLlDm?=
 =?us-ascii?Q?z2nzXztzrM/WpCqProqWdyTb0ioU7gyX6A3M71pDJ1okoK2fM4C7ro8dg+5Z?=
 =?us-ascii?Q?SXP276dKmrJ7I78Um5JPGxFvfyebgoNYT4b65WgqHwVJ3FYd0fzxQbR5wdFA?=
 =?us-ascii?Q?LWLCxxqk009Jv2cfNzlma+jwrIZeOry3HoebfkN0Tqjtc1IDRldo4hgVK240?=
 =?us-ascii?Q?oqJVpkCNtkvAImSYgTlkK9Ec+vQnOrQR1FxH1UpKRKCTf9wacTBgbL4wuXSG?=
 =?us-ascii?Q?3MJqRDA6xgrOfBKrc44nm77dkYOHIXCEzeLfzLowmpWi+kKK42A435G2vpBU?=
 =?us-ascii?Q?Wnw+FTIedsJwKw4kAQ1smljq+mjio/jDT+6Ca+sTVIsMbVzTAed1CbgaHkQz?=
 =?us-ascii?Q?DQHpyhC485DFXz7nnTvA9l9hP/BX3DucNiLLfaj/dheZ5e1WKYL3IxmrCXRF?=
 =?us-ascii?Q?mkHn/C6FoUeM/i81m6n52+/7GySJDerv/DeVg14lteroN3dwCyQoZgy1d7z5?=
 =?us-ascii?Q?D31nsz++VqtAu5A5QwFTG/wF3LOFjTmkzYpNljWDnK2ihZUkWU9bNqZU8QBE?=
 =?us-ascii?Q?dZ0MF6Y8AFp5qasCeoWL3+QjEAiEE6M51SkH3q4r8xyEnHCI2pA38a7u0ywb?=
 =?us-ascii?Q?l0gfL2PkhEGl+VS6fQpCSaglBb6LfGK7PN3ZeviS2Nq4gOOjcWScqnCpdAtX?=
 =?us-ascii?Q?mFGNnf13y+d11KJm8FgE1h85RJkVMSLTszUuqsoFR8hxGXXKjaTRMutQlEep?=
 =?us-ascii?Q?nUUSioe7rf4s9O7SE7gYSOSlZlUnk/H30oBsyTnhyjgEVP4Xrj7ngG0rSKou?=
 =?us-ascii?Q?K3gesFctv5b2AWZWxVK2QwrTAvC+wGWadfBVgUmX0D6HyBfJHATfDYcZWk6V?=
 =?us-ascii?Q?8mBu2yWnz52k4Q5CYj66xlN1TugYRrRMuIZnWaqBwDtgtugl27m6o9nzwH4q?=
 =?us-ascii?Q?M7wIcRgATImCoq9Z2FUtUsw12EIIMk+RHp2I4yNsBp0fJWvE5NQSDNPUyqY5?=
 =?us-ascii?Q?BaWWUAHfit2+h+9dE7Diaw9Y8IMny91u35FzhRn2QvhexDzTFDl9Pa++SpQp?=
 =?us-ascii?Q?WW4alSC/JANcrRaTKbRawKxsRIQNiEKFCQw8k9ZKo+l/xk8EruZew350q35f?=
 =?us-ascii?Q?uRZisHHVYP0eEz4CpO3OeW04joj6ZW63nfxNEQmJrS/e5ibUBkBKgh4D2h0v?=
 =?us-ascii?Q?SwUa9mgYmiX+q/QfaDfJaBO0XpnyY9nwB9dLXR5Ytlx2MTJYo/C5v0TzFuwR?=
 =?us-ascii?Q?+X690KDvPNChfj3bCGyc/XIKBvYiZUBaA+yp1XCs5bWAUO2NNMjEGZ9B8tQr?=
 =?us-ascii?Q?IEBMVswbF9SezPnBy3W8tgomk4GZyBs8kegrpmp3FU+TgYTy/QXSYMuAbarq?=
 =?us-ascii?Q?m6EnSQ9EKjYBphulNUtM/95ypRi9jIy9NCE87gAV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f68ea9-6755-4c9b-da31-08da89a61ef0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:06:20.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhxLX59h/BwweNe/gjaRHV7xbWuo8GjN77885Ow4ftQkOROzbJ8UgUpJ4S61mWlF1e43lxCcsD1HE4DvKZOuJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290050
X-Proofpoint-ORIG-GUID: X-dqI4kTMI4RKLtXJQiq3455NkJFNfCr
X-Proofpoint-GUID: X-dqI4kTMI4RKLtXJQiq3455NkJFNfCr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The qemu_log is very helpful for diagnostic. Add the timestamp to the log
when it is enabled (e.g., "-msg timestamp=on").

While there are many other places that may print to log file, this patch is
only for qemu_log(), e.g., the developer may add qemu_log/qemu_log_mask to
selected locations to diagnose QEMU issue.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Please let me know if we should use 'error_with_guestname' as well.

 util/log.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/log.c b/util/log.c
index d6eb037..f0a081a 100644
--- a/util/log.c
+++ b/util/log.c
@@ -129,8 +129,15 @@ void qemu_log(const char *fmt, ...)
 {
     FILE *f = qemu_log_trylock();
     if (f) {
+        gchar *timestr;
         va_list ap;
 
+        if (message_with_timestamp) {
+            timestr = real_time_iso8601();
+            fprintf(f, "%s ", timestr);
+            g_free(timestr);
+        }
+
         va_start(ap, fmt);
         vfprintf(f, fmt, ap);
         va_end(ap);
-- 
1.8.3.1



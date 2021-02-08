Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB3314388
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:12:52 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fi7-0003qR-Bw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc9-0000rB-Gn
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:33 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc1-0002l3-Dw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:32 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KuQrP001246;
 Mon, 8 Feb 2021 20:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=q1IJVxa3AzhQVcC6f1jaVW1MTy9h5ziV/tasrzD8OwA=;
 b=bcUmajmz/qOSi5rBy16ZdKIWMzNeL5PPLtR7m71HI5KXnWQp5HppDmU8Vnp0OGqZbaxg
 /pLgpEMLQLA0hPTB5usAjZfO3K7yHGZaoxW7jy0IO3E19vGNv+kGIUja/XLj9w25wpAm
 9JzMVMLib+4y/U4gbOMzn2x05NankhE/eP7UYcTu+loHW8+B9vIcRKqNbBxEU6EvgBXu
 w/f+wDB3sGoKCBQZFctadMWP2Jy+owV3fHPQNAIztogsPxmVmGtTdl6em8fW/K+Y5/KB
 43+w4as+xF6h+5mC51I3NpF70NH+uPw3ilJsML6GPNY+TIRAyR0aPE3H7GVvpH85C48r yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 36hjhqncxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5rqj157115;
 Mon, 8 Feb 2021 20:58:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3030.oracle.com with ESMTP id 36j4pmtykn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeqetFJ3dcmp3wTmf5dCSPvNXQVcb3fin1mo2NiQ/TDbZrY2SYXgz1F14m1NLZ/d6qfcIVANYfMgGcu0u4EfOUeu9zmwvro2WHY/6+J/oJtIawi7Ma3rVRBTvqc+qbTHnXOIKQrtWzbYHdiDb7kUWdGBk53tiQUpqBWB39DcxagE/k/nZ7fMq1Z1Uve51uyPx37pQHvNcnUDuobqoY7PSmJ6sa21dGvp+bWhtdQLURafisZXJhDNSv5NYP9LbFTPc9v0nYHX19UQgf2JA5uuk75tnpfGy5MZ8T9bLqz8z6whVpBmd5quJ2BPNM12/wTs9ZuqV5X0IPitaMInAT8deA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1IJVxa3AzhQVcC6f1jaVW1MTy9h5ziV/tasrzD8OwA=;
 b=ewT51oOvsfmJBar/4vBhBSrvFo4nsLW7JFCE9ovneKOLGQiCZ02meJlk+kVWYu21JqNTRoXVzuKn9y4cLqTiMjTtbyiEgWHo7taxDB7HM5h/gcrtkPqomAbm+O0gF4i6DcgLhbpfwiZDb1SHQujckpx1Tnay8pVriXTOMcBu+7z602IkC+zrEdUoy0vpVeEJgVLYdH2QuRTW72MgRWjQGX0Vj5tqW6Qmrxqb5kP8OphB/ajOXfnDkGjNiO+ARa/mc5vcjYpQXnHs54qhrvx4EIQkeq0ZJXLKSaS6OYw7qm91w7M1xXXO36XkNGZ4FYhVH/mhCr5S9wxo5AutuuzPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1IJVxa3AzhQVcC6f1jaVW1MTy9h5ziV/tasrzD8OwA=;
 b=EwD8p2QcQzgtMSsHB6hJzhkqO72kP+GdJWdzgKBCS+uRzsKTC8dDHnDQuUG22Zf60pth1N12QGzVTL/otDoBZDtqe9i+Kax67Vb4EYIrGzmRmSDRptZmxyei/cB575cJbqTDDT//8vdZ/ldqHZqGT+WOngOIX51hDCNmmrF6uz8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:19 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] ACPI ERST: support ERST for x86 guest
Date: Mon,  8 Feb 2021 15:57:57 -0500
Message-Id: <1612817879-21511-6-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ef60008-76bf-448b-41aa-08d8cc7443a4
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB159929513E250DAA9F66B1EA978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoYDsi7oJzpvaqycjKLtGBPfFNoQ+PAXI4Lx2SGq8NOviKb5Z+ExQXX3DozZG66mXs3tnQW6NjPdav8uoADqHdKQEwg2zyyZECbWNlnJKYY/PWSe58rJ4i69SYd8rP5Ky6NtXAPfLZ2d2UCiohOyPpB5ZhyAV/Qz3R6xuxAVVGN0w4zrLc8nEmSgO6NRFNLFWNf8jx5JvsbCIXf+5xo4HQcIooKCoB9l3E7L5dWczZ0wIo20V22IrGdwR0facOIRLc5Laxwaj+frBL00JNvfkDiKUa5OIakmpHt6YN/+zSv7Yp/GL2twZbYbQVEHkIL/nrcEPvAmtY9Umot5srZzEgc0DFjUnqgg6+JR+P8CCRPKImeCVkgIszXQXo2gs3EZYkvW7qgq6Sx/7yCDbreCIyo1d0srGSDsbke71mK/wYnM3OFAwaputZReDzUglwPpwBRTxMwXR8OTsrrB64y6JbS893QNNUXI2O9OTTSkTLY2hZ39H6wMiKz9E4SbcpqByw+Jn0AiR2LdW0eRlpeIZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(4744005)(5660300002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W8bUBXKyptVe5tUWgfXQMNMZHJDKYOdWpq9dAbCT64MgNMsmHb8yTuUuphn3?=
 =?us-ascii?Q?WSVf0EivP9MxTDegK+Y2Vm0J1AqGuSB9piiDRHZxON1jESMB9a0K2eVSyy9V?=
 =?us-ascii?Q?8QhJhHLUC3EN+f3XzG74kNCB9qlp1ehRKGlQCmsY24gRG65tpHEcGY3Ve8JK?=
 =?us-ascii?Q?tu/L10fahiNvczkp6b7OCsGn6aY6tO2mwvqiwb5YZuvIsi32dv88FRnt3zBF?=
 =?us-ascii?Q?DO7eKcLuX1ZLN1xIN24WzMcYd5SmkVJJuJHvuC9hzlNiGi04ko7tLAy7Ixpo?=
 =?us-ascii?Q?vhMpgPRZpluh/PW9MI7w7XdGzuIMJBJo08EPKKenMA3VfOcHnRFBKBJaC8ZV?=
 =?us-ascii?Q?r2NyFdFmuerVJ2JVdT9L2AHBI5OIVp4aaL7CmwVg1MMyKOS8JEjeXvUUIeHi?=
 =?us-ascii?Q?Jq5Z/iqUNsn/nb8uuSSLR4bxyIsefNEZrOGvbhkBichyQjabbKZk9GKnp6fl?=
 =?us-ascii?Q?MI2AnukuA320hZydaUgq242uTX6CabKlIULb2wJ1XxKIW6exJ15wNQopJ6Xf?=
 =?us-ascii?Q?hfeHdlwfoGjli/LaFEFMHXsyhqp/PV0w1SabwOypeL6493ofQu/CfQViPsUP?=
 =?us-ascii?Q?0lwgIC+yHH6KnkohrjpHRDfHiak2eEyEmErzzVAAmB7ms5Nc6slYPGhtgdPZ?=
 =?us-ascii?Q?K7sZo6ZuSp9AVtpExEHoTqWzA7L/OEu8zItc0Bvf+aBSBL9cmVmxrQE+1tTF?=
 =?us-ascii?Q?t9xz8dyv3vWSef7Bue5tkDBsS3+fkGlfr1CEt5vQTP4PEwQypOMnPzJTOR1/?=
 =?us-ascii?Q?GTDTU6nyrQUZUwHfZ3NSSvCsqVqdeccMtj+IMG7WAo9VP2p85T1WNJtwzpSF?=
 =?us-ascii?Q?CP19drH7KM7ApkDpslzsWoiW5y/tVS4ZQt5d2F25KPnr0ZLbh3zwC2eIgSlK?=
 =?us-ascii?Q?9wd9sqNd4zYjINtrW8Ax59gqUA9yFqeAqaT6o0EbCv7wy6+th5e7+uIV625P?=
 =?us-ascii?Q?1wVkWlZxD6xAUMCHZqAhZJJaXMIqu7krLvfLNhT6bATf+rIk4wDn1yvOHtQr?=
 =?us-ascii?Q?nZrfLauhE/PEizjEq1uSzMiBhw6Rqp9dmR77I8rt81RlOREO0fU24MXeoAiJ?=
 =?us-ascii?Q?U6zo7cq38tjfS/kDLiaNImh/tlYcMIMFDPLmRHrYXWGRtHBQAUn7Gwi+ZOi5?=
 =?us-ascii?Q?yVjvStQg1SvG5bnDpTCxIW+/kiU5uVRdxhNRG3nzV3/nqFz7Ahuft01MMo4y?=
 =?us-ascii?Q?LvCqs2r9bF93uTNBIU6NiRLEwKSpEV25XZ7BTdb+n3TJgW8dg65ROmfeXknK?=
 =?us-ascii?Q?x1V6hEMID0Imj7BQ+lZoQ3Vrysaxy4DbHB0wC0Wt5GgeBhnhv72c9Hxt886h?=
 =?us-ascii?Q?8dwUidYgfp20+S6niV60VxGh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef60008-76bf-448b-41aa-08d8cc7443a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:19.8087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhbEnknkYqJc/11MGn9zLI8hT3Wo92r2ulFrNMqAulf33YAFDUEaG6+ZzQ4eAVz/s0N8aJS3T6m0+w8PQ+mjxqj16W3UiN9RW74O9IA6OAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080119
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=eric.devolder@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change includes ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f18b71d..2c0b27d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "hw/boards.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
@@ -2196,6 +2197,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     acpi_build_madt(tables_blob, tables->linker, x86ms,
                     ACPI_DEVICE_IF(x86ms->acpi_dev));
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_erst(tables_blob, tables->linker, HPET_BASE + 0x10000UL);
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
-- 
1.8.3.1



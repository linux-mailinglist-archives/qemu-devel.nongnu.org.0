Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8D4E7A68
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:25:08 +0100 (CET)
Received: from localhost ([::1]:34778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpYZ-0001DC-AH
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:25:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTp-0007P2-Ja
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTn-00034e-IY
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:13 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHWvXE031098; 
 Fri, 25 Mar 2022 19:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=Z92lWFG8ZomQkrq/Q56jJzZytbWN2tvFjLcdoleJJLJ3s1ug1ggAXOmQBO8RUDl24oIc
 YGWTzfjvw15G3wDmtCoaB7NiMZLSuPuoK8Qglwf7BthiohR9si+lpmutX17bZd5zq57j
 FxQ3VxyhRbFV6nfu6TUE8kvVHbwoxVI+oxcdLILRR3j2sPu8cUdew5Wir/wW4QqchQ8r
 OnpzdDASHUbAruX6/cpLnU2Sst9LvAO1hzisKKBnYkuevBBZIxir2GaT86K6JUvQOvBX
 qIOjLmZmIu6yLXjhRzAvY5kB0wSDVCQMU8J5+eSP6YSDEaiDFk9HqNMG0MZl+5Ki8Xpk NQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s10503-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHJ3p125557;
 Fri, 25 Mar 2022 19:20:05 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by userp3020.oracle.com with ESMTP id 3exawjj7y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ8RlyJzSVASU/K2BSAcBHTVClmk0GUjo1AZjzX95po8nqvczV4+mngW/t5B4dBYsR3O//fG9/sa21BB465Ktgnotnx9YmDY44TDBK3BwMxxnOGX8rFpq2CAetr0iB7X3Hm0IPrywU+ltVHo3rB+Hn6qc2mS3wfamwuZxWusB2w967UHWhngBJLy9b21/AcPnI7u+XBHLlwJY1BbY5nwMUz8ap92JQmGdzr82lmAG3YYYqHDwHDALDwygpAJrQbn8dM2LmeGrQJRgOVd3l6ynQAaY8jInoQZ1dhBKnWaGxMIHfep+yqW0IX4kx9R9jGRWZaTLtW36tUZ6BDEs10+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=jYEQJ2annrLl2ULbsUAi9P/YkC9xue+ifsqaDYpebQkjCo4g9dJa07HNMaGFVAZsfuu+kQFWLAAg7UhZZOZ8ezSyIWhJMgRH6+AmcXD4jNhuJTCptgizrKxa62RRC5PEbcK3As5OtT3ORe5lgI4qUNqcwI3UH77fcQ9zjN2qG7t9E6/pjsMe37Bdljebv9VR4SwGMZGNqXXZhXUYcgJIq//ti6LmYQMUkRRWTKAUYLHjaPGazCmVUSvtOVbsPf6BKiybVwJsXK6s/TsCyVWAH6BH9FvhVK/oXdkezoCosAGmbU0LlblhLVuC+9wpqSKLxMyR2EhSs/9b1z817Z/Ogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=OSn72t810IYaOznNOq879tEbGf0reb0im5ki1Ibrt+X6MWK/XHqS7DzLB6rQ96W7EFwNOdI7tvX5F2ON5udCdgHw7y/o6g1nMOlCWzZL383sWYuHj3dK7TVEdOOvE+Krt8grkMhBMjI8VdmKY7/uTZxf9agk5xhXF1kKa8za5Ls=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:04 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:04 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/17] configure: require cmake 3.19 or newer
Date: Fri, 25 Mar 2022 15:19:34 -0400
Message-Id: <b0369495b565afb72150363cd6d5073d28f75a81.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f75d122f-73cb-4a69-755d-08da0e9476d8
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52060AF88102ACCECAE935FB901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 87s3JMIIdB+mHMf/e0JuRNGAnJub+5Qy8yR7X2m9moOPBLA6VQHRf5uyi0yQjU3nHpP8UmNc2cPBopJXLC1iFlVvlePf1QeTeCd7Oiv8goADzK3xz6FXvUXsfkhLUmqiGJ/rK2I+fmkiBB6vwqJdk6HJKlpEE8ktBrFURf0MnUsc5jXQT6GipcVuKKKBIzJkHVmGjc189SJGG7QI5hDw/43XlrvOAjo9RNlu1pw2Esjdfz9eqaYVmhd7BTN0L0ReJ2v/uK+m06TWW7diU3LPNacYG86bPWkUDG8Nq6OtgrBtzmK255Nmwa+Bs5bslf8+CB5QqotbsljNsVvbjcgFBKD+N/DAUY51jPWeuM6aJ4WYTwO5qOzQJh8z47voH23R0WCdVy0mr2lz1RaDn+4bKoinPOHY50dWObnnOaKBmJuoN3n4ifyNU7LKBwjwHwlPJOD/nCEMDLihOwCJhIb6uvY8C4RZ9JK5cL6MZa/XV58ohCsX9Hw5PxLn5Pjmg9kut65D9LX36r9B6dvvYDAfyoky+NmrMwma0wTKTR4NpVHP+X0xMYKvYOqVDjqO2PIL4+GfKbNmPxC18zMQ4RkJC9e7yGg+OSbteT9ebZv1qD1up/Zx+yvdissywGWIfQxgLhm1ztkKohLEmQc6Rpy1kiC/3mQfK3RImIbVZY9PQTJGuQ9ibBBEKy5nZ9YXKg347r3+n2/7RVIZPmvc4r+9Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9wUP6s63Ryk2p5iFFqvIqdHPpk6p7gS7oPxUiLIWnqyp0po+TEMElPAE0Gm?=
 =?us-ascii?Q?iI0Dl/zM+wasY5ephyo35+8Pxk6GVr+co58mAJbRVPbBFFt5PG1RijeZCd3I?=
 =?us-ascii?Q?yck82OyXmd4l96egvKF26slGufXLFsQd7Iks+3dwt44iBwIBJrdIFcHTzALY?=
 =?us-ascii?Q?4TdcVUgDz/Z7fG8ssHYUCQgCVVBcsX5VweqWJYYI9OyPQlYi64SxwvdO4Nqm?=
 =?us-ascii?Q?N0pZLfnxhX5qyW7Vg4kI715Pn70UHCeFetKVR+Y7VVIkD8FhIuCd1E5aypk0?=
 =?us-ascii?Q?fKEAgOH3q4OAqI0ym9s8lKS/g3ta0GqjWOOOARYEr3i+TCM7aDCpgnVk6pdR?=
 =?us-ascii?Q?GKvYPLjHNlf7m9054ym5omQrwQAiuHSZ7qx1Deh1Slx0oBklEydzcplSSDYK?=
 =?us-ascii?Q?cyhKxNWJPQWlN5QjkmxdNijqy8PDc17GFw66iIymd7GhYeGjXJs715KjjaG3?=
 =?us-ascii?Q?IrL1x+xkml1W3gnjPn0tK14I1zYy7aCJ3gKy3BoVQEztCXVSbdn5IhPQGpri?=
 =?us-ascii?Q?2xjO4TUvxyDmxAlATVjCLlqo/U8uYBIh75hxf/WKVS4DPN4MJk7AmJQgxkic?=
 =?us-ascii?Q?pzdjbxuW1PqD+5yp9sE0G7u5Lc3j2g/grOjpAtX/nnumhbdjB6hJfdVrtxkp?=
 =?us-ascii?Q?6eAsxWJOMj7eb3qRrKxW4iN0OVZUwOLiKccmIscrDmoNp0iknd/KFeXNVdgA?=
 =?us-ascii?Q?cYns3M8eDJkPLHBzunRFF0rQXTLgTHIRjhEZ4AaL2CvL0e/zJpgOKal8vOH2?=
 =?us-ascii?Q?UxD/Cj29G8zvWMrpguAVd365cp9W9aIvZZ8RnaF1plTi5vtAFedxmJ2d4jhP?=
 =?us-ascii?Q?dgguWywEpVcJA0pyLQc/6G5d6PzX6dGUrMcqqe08xl8zz7Btr4wagxWwft2S?=
 =?us-ascii?Q?7VSBFls4FuCSyQF3hl8lK+9fx1iIzy93Amn2AbohYagFiMfn0qciiUGbeUrJ?=
 =?us-ascii?Q?YPaBqrSwAmfz9pISSC9QrAdXFHCAhRn9cI0XEyQKewjl9+IRCQ+DqTReXget?=
 =?us-ascii?Q?ieiVRSsw8DlhmelsZKMnPNJ+wZRKifVK2zASQ1TfRA3kPDbfxiS4sRqv1DTF?=
 =?us-ascii?Q?NpLErPetZENxO7b3eYqrynKpQpacWVNHuCUc2H1I1RjOC+PwMnCyDMv/y6v1?=
 =?us-ascii?Q?zSauV42VPdFjEPKcHRXGKp4edA3ZJkFJKc5f9f4TDdv6r63flNBz74Z7cI7Y?=
 =?us-ascii?Q?ybCo1AtiuH8RQQkao1IM9qtF5X+f2EM2IDn0kvZW6DEjZCxzTU3OFy/Pf8lW?=
 =?us-ascii?Q?X1nIqtTRG12eZdPCosVyZGcTbbT2m4aUawH+7xnmAPS/bg4lBxOtLvQjBOu/?=
 =?us-ascii?Q?kjtwfG4Dbo3m5DBofaIM4fmJZpXt11Mr2sYrgWwC8b+jfXtPKJixXOMMF4B6?=
 =?us-ascii?Q?SPWFPHlnqy+E1QwuOigpTWK/BelFB2qBWfUJAI04bGziq+ksN/FXT2rSRy5B?=
 =?us-ascii?Q?9YGN+FyywDiMbBue2NGT0FYMYUFW+8cTuB3tAfUP1cVb4HkstY2kMhkhEsLL?=
 =?us-ascii?Q?9xyzsx1FH0nVccSNnBhnYbRmLCoUt3HEArTZy8o/yk/NfqJzPwusp2bKjWJi?=
 =?us-ascii?Q?VzFMfzlhy/rWm2k+wY8gWEM5FaaOrpwC3euIjxfWebuji1c20MIBF/peRTeu?=
 =?us-ascii?Q?7q11Youh7hgYqpv+1V3CzXu2IPUkAk25D2g1YtkznD20fnvXr7S+1MptIfht?=
 =?us-ascii?Q?t8RgBinll5Q2eUzoc3CKfrue8N1swZyM5eIHQI/HihgAycKTezb0UjgVy6PH?=
 =?us-ascii?Q?uqYoIKFFHw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75d122f-73cb-4a69-755d-08da0e9476d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:04.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdVIUSI15yLjhxCtXbB6WOg7WuB91vE/YWf5Yt0QbhydujJJ1YHYoM18ABCrLDhBNjTZlcGd667q4kq8aHuFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250106
X-Proofpoint-GUID: ZLScpFBL0ON4sWCRmC65e0HZFaNB881O
X-Proofpoint-ORIG-GUID: ZLScpFBL0ON4sWCRmC65e0HZFaNB881O
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cmake needs to accept the compiler flags specified with
CMAKE_<LANG>_COMPILER variable. It does so starting with
version 3.19

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/configure b/configure
index 7c08c18358..7a1a98bddf 100755
--- a/configure
+++ b/configure
@@ -250,6 +250,7 @@ stack_protector=""
 safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
+cmake_required="no"
 
 if test -e "$source_path/.git"
 then
@@ -2777,6 +2778,21 @@ if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action"
     exit 1
 fi
 
+# Per cmake spec, CMAKE_<LANG>_COMPILER variable may include "mandatory" compiler
+# flags. QEMU needs to specify these flags to correctly configure the build
+# environment. cmake 3.19 allows specifying these mandatory compiler flags,
+# and as such 3.19 or newer is required to build QEMU.
+if test "$cmake_required" = "yes" ; then
+    cmake_bin=$(command -v "cmake")
+    if [ -z "$cmake_bin" ]; then
+        error_exit "cmake not found"
+    fi
+    cmake_version=$($cmake_bin --version | head -n 1)
+    if ! version_ge ${cmake_version##* } 3.19; then
+        error_exit "QEMU needs cmake 3.19 or newer"
+    fi
+fi
+
 config_host_mak="config-host.mak"
 
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
-- 
2.20.1



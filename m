Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF11507BEC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 23:29:49 +0200 (CEST)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngvPw-0001yx-Es
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 17:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvP2-0001KE-Iz
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:28:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvP0-0000y3-P5
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:28:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JIPdAj024809; 
 Tue, 19 Apr 2022 20:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=CpbOo1KS9NnVJe7Fqr0tjHQVLVAIrCQyQlXZzi5kXqJv0DvJDSZNAXivYlNDaYjcvJzs
 jVA4+MEnreWkafphV2+b0nmhjLjuxpMzKQp4KbNA9+AuMp5tdV7JBfzlCTxk824gcL1O
 NxgQ5V5UVw7a9Gb4lez0rn7STu3r+NGCz6W7sSvH683+DtHeO9EseSLSByQUV+RxWiwk
 NVskOJU20dg9SyqdKHS9zTQUz4EVFvplW0eMHod+edxpjo7BJwjmY1qqGmI8XGTrjKU0
 oUDPvXv8ZWBHVoQDGKP0xPQVSTwYRtLYWSxe/dX4LwGgE8a1iSJOf/gWoof7c5mDhgON JA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9f2ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:55 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZqfQ016962; Tue, 19 Apr 2022 20:44:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88spju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuCROHUysgNppXE8pZItpKsexlvtB5Ugsrlf22Dnd97E1Z3zgj8g4OXssR89xLcWi5jU/WLLg9eUL590tru2eENQpwKEAHVG0RxxWZFaZh83biYsFi22w7y5DLYK/FFLoT4uNgBCDUDXGOygYLkK6brBlV2s/9boaEaBkckbiB4S45sEiOcPR3BqnR/+00M7fJtlDbIn+fG1Mop2DSMzOXkAauOfkcDVvtKBOKLNIE59oNeDo+AjkqGvO9g24oW9hMWAWRP7ZIlYJMAwze5A/rPXBt/Tu4fgKmHH/RAbgiGma+ERUI6NurJ2SzgOn1Ha/cchYUaDXuXdRR4edN8M6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=moAjzEjAUgmrpjt0bhJ6/xdCvGS1bBGRSmTj/EibjZKibZro0wdy+Rnen036jhe6lnJGlFo0iEJztaQLudnBG1SxUFbAxfwiK27QekbE0qXf5IGn6KsP17Opt/qFiSkIU0zgvFR7/xv9mxC5vgJf3l1+Fad+yeWXbabTWNtfV0ID+I6VKBI9HuPpDUTsgCaStyCp83A8VDLgSXXbQuoizCJivIEh8ZExyNfprOe04+pnrDDOx7PABDzHcaFckws4HrhNK50FHPv5Xf2rHMo2ICDc6lFcix2fLtYb+TqlcvPK4d98rVizsQ2oaULRehecINodWnGPpj/VdKxHu22JYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EVNMPpr6k/hMW2jc8BXhPzp5xFjCzcnb8zDOMEGWlQ=;
 b=U1U9JICpResChPItlCs+p4v14uWo7tHrRAVsJNTOpvS8rC/yE0gnOD6kJ1v64JZdwJ5JT4eJpOPIw4WniqbUGOsqB7kF34v7tKapxnytnbV2RCFXF2T361qpE5/L4tHuGVT1NyNbNRjTBSmah+zXBMTlIT/3PCyXkdOJNyRkPKo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:50 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/17] configure: require cmake 3.19 or newer
Date: Tue, 19 Apr 2022 16:44:10 -0400
Message-Id: <83fd16c0d73483e75fbcc4afb13e8ca9345e6cc5.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768cb30a-b188-4551-cdfa-08da2245731a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998FA6F02AF885876B52F8990F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oP0XIbnb8thrzhMg1Gb8prVS7mZjqKiyVxnzsLCjMiYw5m8XUVIkr+SQ7UQYbd9rVtRvhBs+r8zqHu2yzF8iKv407LamlUZyuq+G0vJDBlJJ4mDXvcp3/h+DW5KF503T5NH2Q8WtfP1E0V82RsLx3Us3aBMamhTirsvOjt4hYS87bpBy4r/7eRZVLzVx9N8IVQpJNWlo1No+Qighi8dNc2WgMfAd2g6h7qS2kZ61hHZGvf6Q6c9bTcZgRXN8et0CYtmZgTk+am+yH86fVaO7HVu2tJOeWgx09TlB+fix8GSZpyMYhIHhy2iHTEQnXaow0bRerVZcnivex20eApLsetkboi7te9NSETPdRx3d1bVlnjS40RK2VDPh0MhVc7+HwoPpGGqM3UPxLnseyr1EIx3vyyW6dMUxZfPFu5/i0ogxYVjU6cnnJDcDLQWECTn+KiqhykkP5y1TD2E86MNCjvqSGat6cNg5SRqO1VMXCVFabxmcoG37gAhcx18+Py6TsBMZGB2cU3WrksqWnlxhezRsSL1Gok/Vkgi/7dcSU0pYpHP07bHUbFe9YP8wvi4gGA5USkR5puB2Q1dH0MD5TC5XXxpQchn9bnULYuA9Sq68Paeg2XeV/dyNi4fQRys2v0LEFcHgbegbi94wxt+xm7gXRbXSXg3BlviOc9seRgwbjIYRz6CK9r6m2e/ttnLeqvEqpDM/2yvdGS9vyFewBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUiKjNCrLe6R8ROA4PK5YoXfIMrZn2y1UCUtLYNsVdxG13xnpYmGjyg1fbGJ?=
 =?us-ascii?Q?7Tk4a0C1P8swJo9XgTYNm1Q3rPi4reHdGFzqXMaxkEYHQ1bnJBk+OEg488Y7?=
 =?us-ascii?Q?1CGSesQajLe1KO4ZE6vrWVTcd1MCn4AXxQkZEy11uHgHdHqxm3E9WJI90uKw?=
 =?us-ascii?Q?cZ5Dbb73+yle5PZajDUUYm9t4OKM2z3PvbxjP+IBeqs93YjnKLda+FUQeyR2?=
 =?us-ascii?Q?fFQIP508zBMzrLwQJOM/vbLvX8j6fA8Kgq4XErLgFf1DNVyglNQ3QgSGnsUH?=
 =?us-ascii?Q?i4BE19zJM7DGl45kFQ2fhVq3n8V03295o8t0TpXzOyzlCSoPb+LyM39TBFkd?=
 =?us-ascii?Q?A3o9ln4XdKjIoJB81ZqORfsEic6/+zA1d2ONepBQ4YwCShbZTFPmrkheeZb4?=
 =?us-ascii?Q?JeM3DirQXvad7blEQ2KPf1+la1K/3cHKyt22EonkvqO/ZSrzrbrunHZCrMwl?=
 =?us-ascii?Q?W2Munw4FMfFjOTMGQwMTc5/V2T8TEgHAxsb1EeX2M4IhXDj7PiQzExZW4Zbc?=
 =?us-ascii?Q?ARYs9k/teg6YYALJxzp8k/HUZ4cavm6W5eWuySONxgPCbkSjeboqpDDiDLHF?=
 =?us-ascii?Q?jdJfQ0ZK1eXk+gQA4WoCuMdpE20f9fU0ubK2riYUDU3Xtlpfhp962I5uUixI?=
 =?us-ascii?Q?VfYlqxiTPs113GjVN5V2EtgzOZ6tFHIVn2YCAReGFHY/ruES4RoxFpKQGFGM?=
 =?us-ascii?Q?w+L6BWsDSho3NsQ0Ux5ZIkNCwjKdMu+7eCTOt9sn6uYXF5RxNH2cubTwJVmd?=
 =?us-ascii?Q?bBaQOtTOnrvs6qLA6F+zRAsJdZO8cG0z6Cq/Hp/WeRWad4FDyzHyXyg/EJ+c?=
 =?us-ascii?Q?DP8sr9iMpemAe2fvii3Dy24tZmw+gtVvYDATX67h+8huKes5+SkW5MCXCWcY?=
 =?us-ascii?Q?BHykvwdFiEymKplrbYrzQfDwL5BW44y7S0kECJ7mIygpmgXx4Nv2MODLfD3l?=
 =?us-ascii?Q?fW+5Xq6/UWb28ANz9W8YSfI8lre/YrZkt1DM0xBJQ/UYobjwMkJzXoJ9glLA?=
 =?us-ascii?Q?vY4w/q1ojFUfeJQAxlAdgqF0o4DE6Hdh4q94EsgjhPjmtBGRuapJju7yCkxW?=
 =?us-ascii?Q?raa64u7U0ub8u3uiqMbxu42k5SnD8GyrLlZ8LSnj3477wuGIqXG4hSp5ZOz+?=
 =?us-ascii?Q?uOrGbNdWWcrNk7PNWtCnQ4lXEU3BosyVVfJCnr1CqJT2/9tyPFGPyC8oZmdu?=
 =?us-ascii?Q?HYbiWGjZJLIPVI9qSmWZmYVxnFTd0kQyBr7mAwfGGsM2K1Ibndh/gy+MAlY3?=
 =?us-ascii?Q?nFuyBjb75dZj/A4L/uI+bn1UoND3PPfaeTrGpTnr1tfT8NiCN7iA4yHDtwzQ?=
 =?us-ascii?Q?3kOOZlrdylydE9WYee3qLGh7Dmjs6vDvrWykjzAsMhgyiplDmdfgsONlIzxx?=
 =?us-ascii?Q?XNeb7awQXfO2h/6yCJWe2/+5w4B+R7ZEW3emYfVFuGxpmSN7xmUUNA4pui90?=
 =?us-ascii?Q?LaS6ZSGlPPODS6pgkL14rxBOE0VdEPYnEtiQd3bZqj54LD7umajeXHfL7920?=
 =?us-ascii?Q?bqXqJw0zFDJhD6eK9ZmUYFkIjKAMG207CLLMisNXsI5X4woTGI8y9sVj3Jnz?=
 =?us-ascii?Q?37/nyokoA53uJ90AI9VgkuiM6qiMpAjD1lIjiw7VABLjFj+f2yv2EhfmvHjb?=
 =?us-ascii?Q?bR7bxZIUrrCQkf40W8cNBeggRCkdpf9g0pzutnfXTTOBZXt8xwnpAMlN3yQo?=
 =?us-ascii?Q?BoKgabwkbAU8kwlRMyHYy7iPnPW6LdxsXGDq1vrMIi0OypsdJs85RA9Uk4Ek?=
 =?us-ascii?Q?dGlFdPGr8w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768cb30a-b188-4551-cdfa-08da2245731a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:50.7601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqHwC6RKWj6Br1pd0uucLExcY4095HaKH7/TQCrGHaGsqQeoHi0X9RZ1pgA+JotCsv5OTNzEWR+oOrRq35Yt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: NpMHn7UfSWXrMobHArBcbQmnCyz_gMc9
X-Proofpoint-GUID: NpMHn7UfSWXrMobHArBcbQmnCyz_gMc9
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
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



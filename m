Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5873BED0A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:29:30 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BMX-0003BT-Rp
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKU-0000FA-Fv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006jW-9n
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNPJ027412; Wed, 7 Jul 2021 17:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=GiRtNFHV2ddlH5s8xRtUUSzZTJrtCh/5NUeLljNBiNw=;
 b=MNaSA2JHUNvU09eQ9cImh0I6OxvtXtpH3NiGj26+tmGnJTtYJTdWBCsj9zkgQk2A3M54
 t2+9/R+Gie5zSuoCxFM/h57IIAOFnRA/UEd3TCuHdIte6aGB63GmLdULmdqe9TSV0Ww3
 7jDbKYA0iFEtWMqH5JQPEiLaoDuWeQr8ojB8eCii1UWiuznBT+dXBIQGLgR+Z2GTnnyd
 xo0XZQxDZAloA6dZCXp/YCCv5oAZq8+92/rbr+2UdcG4PUAthNKMwB8CwVC5WlxLecQ1
 fTvDmAs0gGoCx82QnHq+egzwvPu0SWiQl54HOdlnZvaqy7OO2ci36JGMhmfZwWCw2cq3 0Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smmq6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9YX026110;
 Wed, 7 Jul 2021 17:27:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 39jd13ub9h-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d183zsXD2KC+DwAucEIcLwwnyy6THYRPO6j+SHVsu6veL6Jv3jIuwCqnR/RTSptsMlNznR4CJZzv2Cbz/a3KPwoungmpXLau5t31QUdd+UPu1wb5YnWTGq38lDAx0+5ePYg2piXOBTSLbq56UXXGKvVkDDexE/+DOr3JtIIckWa7xNI4ynThKOG7O5RWsq3fL03/SMV0hrsIQb/3oK6PmFzschyqKQN4YV6xr92PaYr6aHUzQf4j1UYMICNOAr1tqvE/r9ZQRIlgaj+/7mp/XvhQoO3o4B/W8Q/ynEOEfrfijcdZ16PvmgoDn54tXn8yII5P5PBuLNY7GsrSWM2Ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiRtNFHV2ddlH5s8xRtUUSzZTJrtCh/5NUeLljNBiNw=;
 b=Uc6ksRCWyzqRF6hOL+QyNZL463sBmALWJt1LmTQNPcHVUGGV6O8gL7Rb9jHmvI1dXmLmCmroSR42QpJuS5+93VEhCb6Yy01V4CafjfLmm470pu2WlVwk8Lo7QcwwctQhcCAdFWiGre3SJ4iOtI+v22/ESNCyebneFa6+HbWiQ+SlJPXgNhaSXJJpL9SFyjl5dwDIamo6JC/jtNastoNPlXOC9qaJxYxhdZXhi2b76gwlvfmNXKE3yG1gZ+VdmHvLLLM27LEM9OegI6gvGlSyRGlFbn2SLm0c9+bPdtBNtKbziscxM3JJuOCQ+qreQuyddVs5LRa5OkjuB0i9HQkx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiRtNFHV2ddlH5s8xRtUUSzZTJrtCh/5NUeLljNBiNw=;
 b=tdO1LIwZH70gDEEHsHk6NnBcnV1jlrI39vflnjfP6h94OfNm+tPujeApoDpfr7NvtUKUXpD0OFZiSGttVXUwvhxNqoBr4jAp7ERQZ1viwcoB84akI4rbkuNEOGESbF0utWUCFabG/L2IlLN4pA7L+zljAPdB44bqdzFImQtz4k0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:09 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 04/25] cpr: HMP interfaces for reboot
Date: Wed,  7 Jul 2021 10:20:13 -0700
Message-Id: <1625678434-240960-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce4e29d-a5c8-402c-be18-08d9416c72f7
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB4104149AA2CC3B5B63CCE6F2F91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJiLPsuZUurjM9w840FCwkJeAia6zAqNi3iKH7nGkfLmN1qNTZ5zUcceZKlQmd9PXjWx7G/1oE3DrAFtvLn9iP1CM13QzqrAuxNwGYDnmjMTvyKPAaD8dajwYI2/vX+vVvlxvSaPSlO3/FKKC0aOpieGOdbKjo5MpIZE7sspciXQE4GLypDu1wU2LENxu9DgcOyILOLOQoBmQAyTcfdPJSn/BSiHNLTimJ9lilLBVfkod3ClpSVhz3i4U7qahhCJwdDGA6HyOpngDRdDor2dFb6RI3hF48bU6Pc04ytwxGdt/tJTO94myS49fgqtb96VZ4416rqVXbQT9PwnjCjOy3iuFs7T182rr7wps5BpPLqw53/D2QN//2vqePTo63sl+M/4Dyhmca9mtKLcym76VqZV+4vrs0JgLXoeiOrxJAxeqt7iztBE91w0AZiAxetNCxiWqPMZhu9iDrvH0nNWmNrYYlRTCjmv/JY40CNkw8GAOgl87EfqqAMpLx8USZXAq/YlCn1vCElc6yi9UMle+krdt/0/nYt/7e/nhK01ygPs0JIfM4LnGZ7VdzK7CNkRWXBq29AloTR1ikdEaUu0X0g/JqhXKzc8IgxAg6yDxsMnMm9r0sSnq5L1VXg4QEDY3wJwUJ6a4EW494nDhp0GQdo7rUFh0rJ9Z9ug58lgVH+RmdCbARV6AeVu9h/RSONxh1O8UkoATFkHmUFMMB8Oag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLwzU1n+F3+RakCmQmB2fxg1n1VXWVur9tI/jAPb79WReL0qQd0H21x0p2Qh?=
 =?us-ascii?Q?MuElQgwiVo7KR/8bBsHX/05uprSNAJKN3g3tnO7TcF9fGLiRUxFOeomIfd3L?=
 =?us-ascii?Q?Sanysc/wbGqE7xVu6wjSbc3X7tj0k7krMwfoKfMeb3dgHF5h0OspgugA3bdV?=
 =?us-ascii?Q?KpL8jyC2MuXjzeDSQ/rDNLsqmBcHpT2NoptTVW29sjh8spHFuX4iN3gB5UIm?=
 =?us-ascii?Q?bxcfU3jZ80NKOywQ94gQX/plH2U9QWH7Eo/PJMHoqHAL1/NyOrTfe9VgO1jf?=
 =?us-ascii?Q?KUcq/rW8jfzKVsdGhwYIr88xM1z+p8bByCrjI6dpjad2ARpO089UvyAm0YhG?=
 =?us-ascii?Q?4UmsyJ4tLuwfpRr4QeT1oSyCq41dkg/rK5S5/R2ziaEucwX7imq1inEaCKd4?=
 =?us-ascii?Q?pZIQJJZlruvL5NkW01FCqGsSf4siQ5DEprbZ9cd1arNlZyOjL1ja/5XfQqVc?=
 =?us-ascii?Q?edhEUDDFGHkGTV7i1KC7dzYyM6zEnpLFdjNLGjEIYYHNhwnAKi4+WPH47qfP?=
 =?us-ascii?Q?4on5T2jupc8B/kVNtxndN5DSDd3KD1GJjKs4yf73KjycSuV7w/g+Fnzg0sk5?=
 =?us-ascii?Q?XDeuN3u2JjqxKJ2v385n57OfR0KVmWaCKURZD1RPkz8VuohGI8CLBD9Nne02?=
 =?us-ascii?Q?pCHVj37LGrq4B0vG1j+i94MUJfuKKCoe/01/L+3Emdt73IZhgB/QbS4Nw44K?=
 =?us-ascii?Q?4ZA9gBT/0ZWsnS2EZ2FjC2Dg8WryCuusMjX0jISQWQnnETMvaSjew5rRzB1X?=
 =?us-ascii?Q?C17Ke10CDuKUr4xxpO3YBFwf/OlmSRCrPADi8sz37wJMvkLzl9ZLU/nIpapW?=
 =?us-ascii?Q?bZrRJAbMpklD89bryM8V3NKd64kexAJK8meXM9MvZAI99gEJDoxRpsMM+m/t?=
 =?us-ascii?Q?0JfSGkd/7ROWGWAwpB5ED7w+chnddBLD7ptML9eTJLIAIg63uocAw0TCW1o9?=
 =?us-ascii?Q?Sj/ZKISjQ0A0IWpXffiSJcHYoFHlUIrfk1wDJ1xAN3MdhOfeWePH+rUTfEHz?=
 =?us-ascii?Q?GNZaDpBaidoJfAPscFszwM9i3ZVNGZ+lFdfqHpmMvuj/zIR5mX09k4BSEGDf?=
 =?us-ascii?Q?eJLbX1ggSGAMYCPFxKvtOHtogFCyjX0EyZODMJYy7o6fnWcnn6DekCtMhETm?=
 =?us-ascii?Q?OITsEKMIJjtSm/8qCNfHD50AQidGZ0Gm8IrsOr6Vzd4Byzi4RixkPczlEeU6?=
 =?us-ascii?Q?oZ8EMjp9wwstbigV977pW8pdA5HdVfYsgWmcHQh5bkVYNBC+g3sFVl6aVz4r?=
 =?us-ascii?Q?97AwKT2AxU0DjhqinXk67MDHu6IoUzsQd0rIJebWnHLNePkrDaPbIxnUaOd9?=
 =?us-ascii?Q?3zPhQhrfLTAQIZHs/FdF1EOk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce4e29d-a5c8-402c-be18-08d9416c72f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:09.2337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6omumkV/K0UDXsOVUtJyss2vwAIT1vrtpic669Ei9EMCmCJZS0+sd5Nx+UG/Fs1lXMzF4m/wISX20MafsgT/fhBEnjiwEMOA+1Oc5LzReg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: fuyQheFQfY9qqh13gpaME4GmbWhxWNrE
X-Proofpoint-ORIG-GUID: fuyQheFQfY9qqh13gpaME4GmbWhxWNrE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cprsave <file> <mode>
  Call cprsave().
  Arguments:
    file : save vmstate to this file name
    mode: must be "reboot"

cprload <file>
  Call cprload().
  Arguments:
    file : load vmstate from this file name

cprinfo
  Print to stdout a space-delimited list of modes supported by cprsave.
  Arguments: none

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  3 +++
 monitor/hmp-cmds.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce..11827ae 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -351,6 +351,50 @@ SRST
 ERST
 
     {
+        .name       = "cprinfo",
+        .args_type  = "",
+        .params     = "",
+        .help       = "return list of modes supported by cprsave",
+        .cmd        = hmp_cprinfo,
+    },
+
+SRST
+``cprinfo``
+Return a space-delimited list of modes supported by cprsave.
+ERST
+
+    {
+        .name       = "cprsave",
+        .args_type  = "file:s,mode:s",
+        .params     = "file 'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cprsave,
+    },
+
+SRST
+``cprsave`` *file* *mode*
+Pause the VCPUs,
+create a checkpoint of the whole virtual machine, and save it in *file*.
+If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+reboot, and guest ram must be backed by persistant shared memory.  To
+resume from the checkpoint, issue the quit command, reboot the system,
+and issue the cprload command.
+ERST
+
+    {
+        .name       = "cprload",
+        .args_type  = "file:s",
+        .params     = "file",
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cprload,
+    },
+
+SRST
+``cprload`` *file*
+Load a virtual machine from checkpoint file *file* and continue VCPUs.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa105..98bb775 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -58,6 +58,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cprinfo(Monitor *mon, const QDict *qdict);
+void hmp_cprsave(Monitor *mon, const QDict *qdict);
+void hmp_cprload(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0942027..8e80581 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1177,6 +1178,53 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cprinfo(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    CprInfo *cprinfo;
+    CprModeList *mode;
+
+    cprinfo = qmp_cprinfo(&err);
+    if (err) {
+        goto out;
+    }
+
+    for (mode = cprinfo->modes; mode; mode = mode->next) {
+        monitor_printf(mon, "%s ", CprMode_str(mode->value));
+    }
+
+out:
+    hmp_handle_error(mon, err);
+    qapi_free_CprInfo(cprinfo);
+}
+
+void hmp_cprsave(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *mode;
+    int val;
+
+    mode = qdict_get_try_str(qdict, "mode");
+    val = qapi_enum_parse(&CprMode_lookup, mode, -1, &err);
+
+    if (val == -1) {
+        goto out;
+    }
+
+    qmp_cprsave(qdict_get_try_str(qdict, "file"), val, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cprload(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_cprload(qdict_get_try_str(qdict, "file"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1



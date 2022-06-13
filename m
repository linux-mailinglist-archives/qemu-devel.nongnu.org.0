Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0411549F93
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:39:34 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qqT-0000NP-RC
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfY-0008Ms-KX
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfW-0001uN-NC
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:16 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdgnL014531;
 Mon, 13 Jun 2022 20:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=fz3jm2GAzc1GLZcrUqH3Od7sIh75a+jjNV5uif38Zs5CI/hSRp2O4PSKnLqNjps1eS01
 mQdikCEnlZxANWwWI4KLPMK5rAfEIxTFdWLM4eE2Zo4xEKxd2IJwdCnmjs3c+MZqAPyu
 33zeJQKPOdG3NpztEONM+VTanXMNQmK64d9reVvFhTC0HZicXhTCtBXjO0IReesWTCil
 tldTgaCh8WF/Of+ameYQg7AUNy0u/RcdxXwTO8o0MupQPi7SSGswEGMuW0bYf8NY9huE
 BTAceB8RYxv5hLclCIrMaKIB4MGaOK+AVoctLjT6siTRVbNGoYNcD0r7e7Z2iD9zzOsJ vA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktc3q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:02 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5SQ007030; Mon, 13 Jun 2022 20:28:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCsionLOWhQUdLKoj4VoS3vSOaY5VB/Gy5HOjUUv4gcl/rPVZ5IBR1G9hbFWxy732iA/KHEF1kuX/TStKjhPvo+1AoRA4MsSqICev0krtfeNUPhjfC8EZpRMrhakDoeV6Xh0lTmR/OfhxSaNrMPW32vCfgsWLOV5HeIjU+HdBvUK8EuMU3QX+rab8lk7m94CYBxlYiIl24gel3wHyRqn7nVyvjPWqMoBo6sokNHT0rwi9jAwho2DpFVdToF0OmLogDI5DNb9PhFcZ80fYOlcgCNrHI8UAyijk714lbK+UKLIsmKzrF2Uti6G5uNtxEw4V1jvAM5dKoAl7nsaY1/CzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=ULDqepWFridYyVv3JZjam+EpK9gEIZWDiMKSVcZ93VRJurLCx0Qk4T8dGsLBrKzlb8iyH+szGWRFGCnbt84Rx3uJ4673tpl0eXeT4xM9GtzrqdnH9HHU9FBvSaxk2fQQbHFoc86t3KGcNcMkpYAfZRfadusXpd5qHcTosydRhgDBx9l/mZlK8Ofk8+EztooBvRsbVEWYlhEnM6aE1ZFA9YSLe1uJ4w07XBJwQ749AsyLiQfVIkq2hN/hEDvidTeNRSOSuDFnkOt9SWgJi8owQ8FS9QI3njGJ1NT/3PgxHVLhh2Gcgdrgwq5vE42ih5ZnOODc5Nyv37UX8uNXx7FukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=qTlYqzFtSNusyj+FvC8nogOhteRm5+W5sDfQQY2lDvIHSiu1+dt/odlY2wLBwPWvYzUYRo8nbI8OJdsQq4+y1x4aAe9kuzIW874QkBnNtTVvu+hyLfdReEN0i3XF7I/6CUS9eQc3G+4DuDxGvk6xGxihsMP5zxidNJyiiQU8ZAs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:33 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:33 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 09/14] vfio-user: handle PCI config space accesses
Date: Mon, 13 Jun 2022 16:26:29 -0400
Message-Id: <be9d2ccf9b1d24e50dcd9c23404dbf284142cec7.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de369c76-1417-47d2-57bc-08da4d7b256b
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045BFAD9F11AC62ED34D74F90AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdKkgyimmjNPW7/hkENtisMc2I/rWhWjE6pxWgIlBvQy58GzR1DLOxsjlSaRRlWYPOY5bJ6xfiwNdDTTpn4Cn/1PEyOOn9p+EmiLgEdsSSggi1ALXCeR7eQk3nvPC00S3qACKmU8w4L0VzfAwwnbHf3IH6thtjtSk6XdIoh7+w84BtzYZxXE3k3YZPX1BGHiDcgh1E9PIDPMqzSgJeA62Vv8ckYnt3QBOiXlzLXddnZiwajjxBW9cCPjzbYVf9ydRq/2fsQarxJgvY9nmbY16LQOU/jrfYc5wvhZonlL4oET12IbHrvuqXS0Z0Cl7xqOvnT2kmuZCGW/sPAY6IrT5g2gYZ+Bnk/W+AjhSgUbBw70aeQsO/U4qa6m5rhAbl+20bZpgRprk1v6HbhsOHT4fOLSZNPLY/9p8DUhUfrYIcGcTDM8CnY/VYzpCsd3zaWRKrcZMEXZRF8kvLXK/d90JMYWNJQVUOGG48tdNaVaekT8PrJuLYeHsuchNYTq+cXj+UoClSmSiEQtoe3tmH0wKf82F4yzxjKnJheX0/Oci1PqHPyuTMvCgxYRcf6kLsf2WS+0KQTgAQ03DOV42TRKDwxusunV/YPlxh8z4Wr9G+yyMwrOiyxgM3l3ZJ/wcKztmHDX+YymYw09SFvjWK+JzQrN4O5l6MH1sJMVe3hJL3qSWVwuXle5eiEPH9Xy4af/Ui3WQu5n8Sd2BPjBHc1ydA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(6666004)(83380400001)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?twdNQHVRJJIl7MAhBRzUgXyN/OJR/O56KirfLdg1X75EXkmxex7cucpDDzFU?=
 =?us-ascii?Q?nrCcF3zwwMwteBWW4gc8/hOLLdqlDBlg0WaOxllzM2M58djZAspVXsoRR+Fe?=
 =?us-ascii?Q?lzVOfssZrMxdXUS6HdmxQsJhy0KTiKX47OrA0eHYIaJDDwp1T/wENeuUD8gJ?=
 =?us-ascii?Q?H2GUFTzsCvjQzBM3AAesRrpTvR0e+MPRCaR62DcpIZVO7QFyVoY/S0jnf2wj?=
 =?us-ascii?Q?EDyxjem3PhwmGL0mt90WjCn6oWplFYSC7AKU/t0LM0AyaItXOacpJyuMHQUY?=
 =?us-ascii?Q?qods1NgwXQtZsbjM4s/R1iuxNPBsrbys2p7+iEQYjuWwLvAcwLD0Rc0VivX4?=
 =?us-ascii?Q?oZVEfLnxcWMRCtF+qDOpyXER7bDtVvvv7Uv4cjzuikwaxhkgJLYhzIR3IWiq?=
 =?us-ascii?Q?4J8aIJ3J6Cp5sIz3ZzXbCBT6nCrzkrpU5AwsE+XtsEAV0uNOniu4AkIUax8R?=
 =?us-ascii?Q?Sa1FNdNpFcf4h2pY1bEA/3zURdA6I3cre9vnJ1AJqAXVu4P0gvZFzHR37qa3?=
 =?us-ascii?Q?cGxFwV0DKhCdW31Ew9FFrMtktziVwveTJX5I4vOhdKvH4f/thcZE9PUNDWxu?=
 =?us-ascii?Q?Cw9QlqTcRGnwGosw0bzE1ixX8fG10vi2/jgeTURwZPWdQ2c62m4ioIh3z3Qc?=
 =?us-ascii?Q?E1oAUqJ8xiomVfXWO9+KRhvstxUgoaKmVyBuNmzJ+A2cR3qOEpKuACk/GhlH?=
 =?us-ascii?Q?7YFj2GbJ0klK4CofUE9+ORndo0HJQqh5oOzh+w9Q/D+ZdHuVDMhMX46wK/2U?=
 =?us-ascii?Q?ldcWItIpo9QU9Liv2mm4n4rkpdG34GztYNvlDTHIlW+coD5/wDM2V819MKFe?=
 =?us-ascii?Q?+W2i1zoEVsUs7n/7m3o3jCJj7LgTWY6JV6DCh2uARtX5/h96xojS1Q2yvIq8?=
 =?us-ascii?Q?Tnki6jt2qngdmAKgIYn927hlJJs9o54CnRC1I1owGwToxOfEzYNYpgFhIWkK?=
 =?us-ascii?Q?q8QyJsoga6ka+5dlTHSAeFtM5zZDGpdmetiKccAv+o/txF8eEzrx21fs4Pk/?=
 =?us-ascii?Q?zzdF7Q/QrXHqbqVEtbUvTbZ3MkCze+hXKMbtcpUb9moXmLhLYkAKg7dhN+T9?=
 =?us-ascii?Q?cos1oqg8y6cou3Yb0G6kCrtTpAAZ/DFWawHOrKV0QoqZnaUKWOeDn7DJ0Hb2?=
 =?us-ascii?Q?0tYJQ4d6tNYxHpIcEJQju4oPmN4xtR2m2H0W/5+i9sooB3lBoqCjIrOTCvRj?=
 =?us-ascii?Q?NiM/a3Ba2GEcQOjno5+S7ahuQ+s6HRQcRwz8r4OHQiLWNalYxpNzYtWIpcqz?=
 =?us-ascii?Q?C8CmQrrsqXYMU2LlG0zn17tWFlYiIUD2wbn+AtiCgfLwC76/7AsrVFQgFLeu?=
 =?us-ascii?Q?PKZZvksy91YRjgeU5aNArQ8kYzfbmGmKKYj528OKJTeswoPeMcGIaaWB++q3?=
 =?us-ascii?Q?QHwVZWmmzjqsmur6b4fsu7zGQYo3FhBaHJJOYC77Z/jlMVWe/CkupwSlnpKi?=
 =?us-ascii?Q?nwZ/A3BR3atfWBeOr8pPosbCbzM+3HABQOrXoy+nzGUTgdwpNPtzQlO72M8X?=
 =?us-ascii?Q?PLTI0/4PULNsopH5El4lUDk+T4/f91etfXyfZwVAJ1HvRflMSVLzH2yGa9j0?=
 =?us-ascii?Q?ymNhXdXuh764oUmR/yh7jSWLQo2f2baCSgQ15hPTejehV/YDkP789WgW+zFF?=
 =?us-ascii?Q?ivn1HOuEIpwK9hgvTf79pMVI5jwafeBrCPOmtRQy5Gh0fiz7rFnCX3LfjTLW?=
 =?us-ascii?Q?vObE1IDZnMvHxpHaGwLDFqV+vflVJ9sSunNXgjfcvLysmI69Enofat4VCa9N?=
 =?us-ascii?Q?I6ZizaLgiQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de369c76-1417-47d2-57bc-08da4d7b256b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:33.2641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uS+idQAd6AKs6Unp+ypei1FLvl06ve0zfKfkQyHq3ofVFPXgu2OZG2+VoCz8XyD5CpkaJSBCkhKnOD1JGrZWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: 5W4m1-orqrNtO_zDrdSF06kwOmV3vcq3
X-Proofpoint-ORIG-GUID: 5W4m1-orqrNtO_zDrdSF06kwOmV3vcq3
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 51 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 178bd6f8ed..cef473cb98 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -244,6 +245,45 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    /*
+     * Writes to the BAR registers would trigger an update to the
+     * global Memory and IO AddressSpaces. But the remote device
+     * never uses the global AddressSpaces, therefore overlapping
+     * memory regions are not a problem
+     */
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -336,6 +376,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1



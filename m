Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB24942A2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:52:37 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIse-0004ac-RP
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj5-0007fn-I3
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj3-0007II-Mm
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJXoEs032613; 
 Wed, 19 Jan 2022 21:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Sgg3dfn6R4QsKjUop0+pdEQhxDfekvxo0eblJFMVtdw=;
 b=pLiKtRk96KC9A3cCq0J05/0tVk7zTu1zuNLDgLgL23pNk4fYV65vG5op4qO/PsZKZR8x
 /vU5yz/ztGcAF6XgcBwYEiqL8H2snMu2/yNi/LB1KVuoNxCZMGKXJ1f81GEd/tgYDjih
 biERlM/vrjV4Dp9VzpwqNIdQ3s4jEH0ZU2oubScudy4ad40evKcgyOfkJjvVn2VrAIi8
 cdygqCLTc2Lito2RG/ATXJ+mRMMnzgBcLpwxD8JLihVSZhcrLAtF4C6TxtAUlPKvpT13
 TPAR45V6w5UNjjwWygTRbN15Pulj6XyyzomVopCIaSQEil1XDZWzvytXhfzsf31SAV7Y uA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLauxn147043;
 Wed, 19 Jan 2022 21:42:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb6hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHsDKa6h9yPcC++jRZn5cfOjKHCjeDSOPUEd1JEtG4eiRykHUSJIqRQjB4bfQlsEmfByfXEuUKxV8iCfVax8t3QIgNXsIhTTJU12UfbuiXuo8rpRmJoo19LTMu5116bFyHp9NyIXz33Zo/OEespk33o7Tn0ZZK0GJaNXVcUzQMoRAoFEuSO2Npw3cDMxL6gO46CJXW9h+mVE39XZ+XBTgOY/p6ajW7tIiqI5pC/sL2J18dCVfNh8z+tzTquxlowSapNTJw2NUsWJRQ5jMivDffqIZG5MD32qlN6fIbeq1pcS98bBBnzqQzzd/aaCAlI1nV+5rAckGrSZcA/lWRU6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgg3dfn6R4QsKjUop0+pdEQhxDfekvxo0eblJFMVtdw=;
 b=T0sQD7y0EheLuhljw3daRGWiAVkQ+HISc+zpxgu+VLf+jWp2GFW12ar6BIkQfft1+DUMHguR+/GVQLFrFfCz2tjUNoEoYVj6BJsnopvXgOVrF6tazRmDIZBNLvtPK1ZggT21v5Qqy9NOatgSHKn0MzyrH/pqZfpJuq01RPS+oublmVI5hcIydvpVUKy52JNA8JMZ55ubIQoFxSYxUbE3+PELpDW9ZwJUsRPus9+jsEL06saSSIVZl12UK+ecXOcGCjQ4zLbU0A3rmlANoOINAabc4cXNpwBIsujKUP2t8d6VfGJ0X+pdB4BNI2JLx5s1RdaOWdnFDSOlxowU5XbLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgg3dfn6R4QsKjUop0+pdEQhxDfekvxo0eblJFMVtdw=;
 b=wDPqHIKdYMhtxoqMzp8LG26gP5HZg9UqjwSOvdHM5kq1QoqqPu4kWyQ+KWwd/wvlr1MjL1+XbfSk9oeCSHcKKKAKSJvsu53c7PLG/FeDNZc1uZxcaArB/rzS4TxUL3cMCKUlY3V4kDFRwTGSQbQrPNbY7zIEhyxMuKSo8GTTEGc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:34 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:34 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/18] qdev: unplug blocker for devices
Date: Wed, 19 Jan 2022 16:41:54 -0500
Message-Id: <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d45f73ea-57b8-42b6-c3b5-08d9db949a8b
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB588734583F9D79F0539B0ACB90599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyFaMIiGhn9Mt2Zg1fLCHLYDTjJqsEN2OsfHjncDLgZls+N2UJqk/tcdVHXPI8kKjUdBAJoBty88tHaTqVOjk48d4+/uzIH9CXXmvpklSNgGUF2sEY67wYC2Z/xT0Bd/m9iRDFzmbBHZH7H3/v+aKuGRAWZVLwumdGxCEjys1V6TWeFsSE/rNYO93zwjQCmschr//P5imygM2ZBHnoHHeY6x80Ir3mJXTWCDAspec5sDX1pgSgNBK/5dhsClwi06PJ8lQT0NhmeZefZiAtSW2Qmqn/NoMoGPXEE32HaCW5UQLsrXQOzEwmq+ThYpVv2jEWR3/EMF5eps+fJMFHx+JJwWwq0Q38+wEYrMwZroC59kcxxNfCtYkAN/oSsS5pKBNegwb7Fj6+l1RLos3peLEouiDBYP/MJl9JRDtPAlHkkT+F7t94xRRMP4ZD/KSRi7yHnjgS27A2Rgs8voERAO9gU/Pf2dLEAfQo/IePsT8udKBWMtmDhIw72cJI8JMxrRWFTJtCbY/6kT2MJ4AO3d+CNNQru3tq3oSTxHbFKUQeclzGcNAzAGqUvOb6YtgotCEL264QDFR9+H8EHNCVNw4javqXctD+zifXSWw7036OMNugx9ZWVEiLZ/MsatS/kJqTpPP41RayWSYBgn5SfipuE8zxTxAXMcHhYnt7bJyY5wHrpDgXUY9dtG5+urfSFAx6k0EGw3x7WwEI/YBJZ+uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MZmP2ZDhIx+Qv+/m4bCR/o4157zSwh4d9r0FoNzNBWE9DrY1XwymY9w4Kg8E?=
 =?us-ascii?Q?+lfwmLhyZQn8zHwOd9akuw4aJVOv15C566fNI4R2uJxeA0uPLOI3b+6hcSgE?=
 =?us-ascii?Q?ufkk8Cz7xqt1PocpPZ1KH3hGq529/GwGOTHDg4LHotnTexcZQwvz3RPNHRXR?=
 =?us-ascii?Q?3zUfgiDE6GeZ1QpKGX6vKXk+xeXqUIuSfyP5wV1yImHAblNq5uLSCYlrN5u0?=
 =?us-ascii?Q?Zd5hbzRZrYOJxwwwQg+tAjOqZWYva2CI5iX9xfF5fjoC0vy0LoGQ2A0XLtjm?=
 =?us-ascii?Q?cplQ02dFfynzZRnNmx5aCXNUgXx8pjQkpTrxfxz9nBTbx9gwIBvMIGWE7dNM?=
 =?us-ascii?Q?gexwASdn+EPh5Z4XeMzBGLzd8P2V2ZxYW+pzAEEe8JzzvbrQ+I70R93fCnYz?=
 =?us-ascii?Q?QAzntLlPjwx44RP0bNURbhzF1rV1bsEINelhzjwjneDsHAvVOXcTQF2RubJ9?=
 =?us-ascii?Q?XdeLJGQcudze6y39MJBeZMhqH8JFOXEUALk0Q5SmziH3v9MQ+G9PMjfakDmF?=
 =?us-ascii?Q?1MAlbA5ar5Rwr84MJOdfXqaqx3RSf0+f9jPscYj1C8qXSRGwvcxmmhD1CDPJ?=
 =?us-ascii?Q?NLBZHFX0mXl24lr2W413gHSH9zjD9NPL/oerPnEbbruJ8aOB4u+JGqN2hEgX?=
 =?us-ascii?Q?XnCZ4JfnYx8/3+CcRGuwz2mJ4QQfMVwhf7Dphjb0BwsOOx3szt4Dv+UePY8R?=
 =?us-ascii?Q?dch5/odybCsuN0Ia52I/YcRhy3oI1bffamq21qfPx3bYWFAfDjf6G2ZZowfL?=
 =?us-ascii?Q?z1Lk5l/d/EVf0xeXipSjnrsmCXplo34VGBcX9BhlwipE1Zf85JRsYvWGEop3?=
 =?us-ascii?Q?4KCPd1XKScHNWN8FKafOKXjBGF1XXMr3KP5O/kLaDu94+EE/ACQKsWJqmULb?=
 =?us-ascii?Q?jirRGrgDqCZSDs0LAXdujp7gX0mJ26PTF7IKe4tJXJtZWwN4FT/sGV+6E9yM?=
 =?us-ascii?Q?kknU10OCu08axlfq/FCc9Z4MYxi9ifJbX/n7H0G/2kzE0bU3f88bta0DhzIw?=
 =?us-ascii?Q?cSPZgSCOAV0yWgJP9rszWekCazr+cB/TVcPnXuogY7GVqN7c8Q6nK9h8U/pe?=
 =?us-ascii?Q?j9cnD20DeSvDoT1+2NyiLA5+dBUB75c9aDURJE2G476a58/DevpOdX8CXUhL?=
 =?us-ascii?Q?NhfzPHKoHx12YMNSEkQtlZFm2LC3Val3lNBVjcBRHJ6fmiCw4/M4QyjVxfV/?=
 =?us-ascii?Q?5je1ITwpEckWSz7KGt8u7yGgWhBsn5nSt3L4KJ38QT+WY8i073JR30DTQ0tC?=
 =?us-ascii?Q?OVN3i8ulbLSSfOazDrUe6/ryu32WEmnkQgMP4KTyj8wVx7Y/pBCn5TfGWSfi?=
 =?us-ascii?Q?0z0G797mdi9FwI/YM4QfY823obz3kP4bXRkyvNsN6zddgu9AWPZRhbeA9Soq?=
 =?us-ascii?Q?DBSRhjm3PteJnJBqWL4GkUp/sDa/DzDMgdeX8URSCqoMCIYU1bKl5ALXigkc?=
 =?us-ascii?Q?hMTQBfS12eR23XvS+BVRJRXlqsszkqZBDVEoWKR7CYBtSaAheyLCUavzGIWK?=
 =?us-ascii?Q?XmKl/wSCEVOoQ39GKnkXh4l6oNww4Lqls7dhFVQ3/57baQ9Fzqtw6oHwHQJr?=
 =?us-ascii?Q?RMU213BzqN04K/STYkLdKjD1d/Z8ZZ7cgQ7BSxpys9k8Ja+vArbhWV9jFnGi?=
 =?us-ascii?Q?128kFcdqdwfUCVt/4Nt2ONA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45f73ea-57b8-42b6-c3b5-08d9db949a8b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:34.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSKLNPGsqyVjxEOemeScArEbkVKG8MykBw2yQNwCFJnToIb1En4o6PYSFPJt8saFMTefp0M7QuotmQWVMXsTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: 5WubduOuCCe_U5s-_pYzxOQsJrlIdp2m
X-Proofpoint-ORIG-GUID: 5WubduOuCCe_U5s-_pYzxOQsJrlIdp2m
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/qdev-core.h |  5 +++++
 softmmu/qdev-monitor.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index eed2983072..67df5e0081 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -433,6 +434,10 @@ typedef bool (QDevPutBusFunc)(BusState *bus, Error **errp);
 bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
                       Error **errp);
 
+int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **errp);
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7306074019..1a169f89a2 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -978,10 +978,45 @@ void qmp_device_del(const char *id, Error **errp)
             return;
         }
 
+        if (qdev_unplug_blocked(dev, errp)) {
+            return;
+        }
+
         qdev_unplug(dev, errp);
     }
 }
 
+int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (!migration_is_idle()) {
+        error_setg(errp, "migration is in progress");
+        return -EBUSY;
+    }
+
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+
+    return 0;
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 void hmp_device_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
2.20.1



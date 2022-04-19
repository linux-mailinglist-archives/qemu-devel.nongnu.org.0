Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE09507CCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:47:15 +0200 (CEST)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwcs-0006PV-6x
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwbu-0005Sw-Bv
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:46:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwbq-0003ts-PY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:46:13 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JItnlP024789; 
 Tue, 19 Apr 2022 20:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=KN9oJlGP0zhJbibs4XB8SqYga+5NPHmkVj/ceis5QnqHJek8qkfT/jwfuPv53HHo3w94
 LzGQ0RD2nEuRpK1cIvddUteoWo/6eiBfThfTTAu/RzlwEu+4YXstYk0fWjypDssZmtrV
 DhAXIKswfUuyw0p1e0altIh8JqthKtN2PRLqJZwF8RovsU+zUqQwuc8DJMKnx8c2pYju
 iP0fKfoFjPFX5scvI6qoJLbRxnonej4detAgqkBQc+0EQnQAbfpQIqNijvxS343XPdPX
 /9Gk8xMUsmzdgZN7T5p71ORS5eAsYD1mC3Yff2wq2buReR1O+eGrbB/mm3+zZAp4KgJz eg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9f2a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:48 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZgmG016834; Tue, 19 Apr 2022 20:44:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88sphj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLvtHfNJAskHW6OPvQ7Txw567t6wdjYZBjb6oK1GZiivTAXfduEzPoB2xZHMYRV3fs8nhT/hx+4y8kFHYAtfxtKZoUEg/n1MNwSn8f+9BRkECAQGCDeFJW55vCcInOJiMA2QtIC5kq65Yb9Swf6lXzQ/R1LW5N8FDcwKmEZU2lSA147aAoWjyRZlxU3OthudlTjwJ8wJTx4A6P3LcAADpaNwGUFFKYA3yjnsySP6Q2uqG2axYPJjq6SphT3RBbY6EjRFJHVzyrXZUEgkpfdSrBivKrVn+crzbqNBlX9NkLtoffcN/QeQykpJZbcpGnqYXjN5yC+tZgEsaq27VakX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=QQRyeHuk+lRSyb869SH0XgZtWhsfBgevjUezamAYOIcn2Hb0VLWKmmZnSb0gj0HHaUijV7eoUpZKGtH6alM+NIWR4BS0P9Lfjp5YefW2ddUZrqWF5tSr4C83sljsHuoFx4hucJK4hAbDkItdYtEmswap4DaFCTxDFib2wTStq4p/vVBsmkdHVU+IRbpaZsHdTJPhC73MsmmHEPsfRMTtIwmSg7ceO/EM9UF6UNZwnQUej4+uq2XxMTgHzM2YU3C1MijKO2dZmVro+t2Gm4Cwn8zjfR+UzaWBOfnDqMaMPPM8ZstoH63PBEC8Jdggs1fQEFoROfXIK3AtLvI50fZrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=XQxA6sfD61jA97O2yY5NUgifEAn7hiVFtBMUxcoTDbuSbkUh/EbHhnpEkSDWCXD+jtTPiTbhji/lOx5rgCuuk8ZmbzwcTB65Bn5dx2ynIorF8RyY+gjIUNH2f1n9BsWzRn5VOVU1znzhJXl6ZUYQvo93Yz2jfHc1hIgoZNXLa18=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/17] remote/machine: add HotplugHandler for remote machine
Date: Tue, 19 Apr 2022 16:44:08 -0400
Message-Id: <156a5c927777f2c424daec8ec8e75c65641bf75e.1650379269.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 00ad5753-2f24-4107-a5aa-08da22456e6b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998C11EB0D65BFC6F5D66FC90F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +EPsZ5MObuTl6y26Uk1npQpC/R7bAk0yqoiyFYPJFZBub78ljWHkvB24Alq4/TSp3ACWVTXjuEAV/jmCazmpiVrSkTwWntfjRRPz/eTVsqGsQEKPZyNvBm/16i0bqkBdYuuDYErRMZDEAOSi3vZC8X+qIqXZpPKFrb7+7VqaT1bdgz3+OVpK7+b/nDWwKb2Pxi+6VH+hbE4BC4v/Gbkis8dJElFFOwXNS5+4nNdNdDs2k8woBXQWBkabivrAx/RMyS7eBo4RaLmbiQpOjzV5QtImMUbIs0nGll+cvWr97a7tu492Mzw+7aiYCtklmbjsNQyBf71eakE7ftpc/ohIjF7pcQt26Z1AjiFcFn/d8Y3pmr/3KEZ2oyo7H6MC6+q8XGxuX40jMOFdy+UwVTLP4Lj+gZ0jzcn+jZmefKy2hf42spysBD/DUFfdmHdMbNAfz07xWfJJ6YAqWz20HSlwNveksBrZdZ9fG3fe//OQWRuvckUUpKDXqxJW3lopqu2FNGjMKLD7FGKrdc1LsybAeMnefhiUGsvU2A6eotZAz+Q91c2iTVc9S5lFIBvf+7sa7XBBquOo9OZur057grgKZpKJ1qulYyNwqyV/EQOunjR0iRS6E4Yzxr24IVKnxg2qvE0XXoEBbOGO4ZaRGHgrZFWKJW4Bak/nHanCR6nEynUOk8gUY4dXW8MdixMdbz569L3hWh1WPcrU48s2Oz7S+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIppgOKefsVSKMau/qvKmGQBVeyig8tjueKZjbhs+ZfQmsxKQ/ySupsVmx6w?=
 =?us-ascii?Q?h8dDdkX9DVJIGcyLKnseknBBFC1yzmwkg18PzIafzgzVkGCcMDi3wcMV+I/a?=
 =?us-ascii?Q?xvivROfcnsU49YU+kGSNs8QeRQwvwEpvKd6o/htHKzF1Q7ViuBxMB4uvGS1J?=
 =?us-ascii?Q?l9eKqbnr06g31xuG29Zj6PNK8n6klvis/O2pG1GM31m2pZFrG4gidDuqFQZp?=
 =?us-ascii?Q?9HDYaWV1WOODwEeVPwK566xTXX178UWvPrw9/mUio82lIdOOYdc9eljL3kTG?=
 =?us-ascii?Q?EbaDSKREDQRPbtA5Fm0tGEld7p7bYpH8hXGv5bOuxp/++3iTY57svKdW0Ol/?=
 =?us-ascii?Q?ATTpq9+VkyR5LZ6XlGq9fJK/s60WqRgqx9x8/teck0mquelSNHycIT4NWuWG?=
 =?us-ascii?Q?SZr0QTAdVL+9u4eVgveGm5o7G/Y/WsASSRW2A8l4yemgMwKun88s+ohnZ6Gu?=
 =?us-ascii?Q?FKIHvPRDS3KIbwf4gPGdMllVty6ZO9RugdHF9Bndpm4TxTB8JO/PiIjILabe?=
 =?us-ascii?Q?VrKUV7xfx0pCNi7zr/H1CyajVfTYUZz2ercM0PwsFVzsPWLt8tX7gZBvuVsI?=
 =?us-ascii?Q?LswZClCvMdaTSREfkMDwb8drKio8u/36yRl1tJWpkQCYExhGoaWAQ3iZPwd3?=
 =?us-ascii?Q?DSAdGSplFMEBI1+GbqPjUayLyccFDtkdSaYUNT53LrdRvIEjPId82Ab32fOr?=
 =?us-ascii?Q?1R5seBOFYi3M0g9jAY5NdNshs4atPgJFV7UAuy+60v5y4ATbgp1Tc/A9FvgU?=
 =?us-ascii?Q?PdRobviRnkXCKsz+qsQckd2RXjyGJAb797zLRGQ+nJ63xQ/qAdPL6PJ7Knjk?=
 =?us-ascii?Q?ZEgjletRf2SIHuchWzld6zMeGCsudjoRJL2216WwPu2rvnZvi3FncTLsMqsX?=
 =?us-ascii?Q?I+zop6z2bFBGBWh54F57FBunjEna1gq/BT0lkDyW0AYT0MKgEw9Wum23jYh9?=
 =?us-ascii?Q?cY9PKeF6U0njbX0hdJ+ckPt6chTTBwA+1hTKSmJDsA6fwWyKsmUdGWBnZQf7?=
 =?us-ascii?Q?IEFNmhKXQjqZVuDGLmm6HkgXyWphytMQlu28jrKu+CjDaefcQiJHN71dV0M/?=
 =?us-ascii?Q?B7rLdL9gHxdjN/R3KwmnRzcJXK+F0hB7q2iO1BIPoNq9xAVO39sB8vXLW9hb?=
 =?us-ascii?Q?PJAY/54B9A2xBKX60U/+uWyALdepCUA8QULoXXmRpKwr+SvymCSPvwEPp+bz?=
 =?us-ascii?Q?qozRTvJONqD85CaxQwHIpA8fv+86aqFDxQMzyhA6LEoKnogu/CYsWoXvmJ04?=
 =?us-ascii?Q?59ItrCqYQHN/nVj5f4JpZx+ZIrgup9zxJGovQvWi4cUEIXzS5OFO/YuiIM3i?=
 =?us-ascii?Q?H/un8L6Kw4bWw+NBSPfOI5Wqm+YaRlH9CXNiX9XMG86KZn4gElv/+N+0zLEF?=
 =?us-ascii?Q?vA84S2BzJ6S14RryUcelp/JWAvjS9HMeQlVJ6Ye9IIrNKst9evVPT0T5XVBA?=
 =?us-ascii?Q?x8XohSIopC80KVZkNOxxP7SuPeZacV/1LlnrGu3SNbeG9pEnfi3ocQHfUXjg?=
 =?us-ascii?Q?zYvmgE6Z4sbMFQuZIYHr+U1JRY1FNstMoolgjZwZV3jT3eCKvSUJVM0W8LP6?=
 =?us-ascii?Q?ikT3mulhrNfi5QzZu3hubunNZkVtpsJjjWI4YiBtLXL876AIMxzfaCf71aRQ?=
 =?us-ascii?Q?6FZ2vb2eWHiYYoqJqNLsry1muraudoPT1D3dztNcHNYQCLXyBejLSqZzf6Y2?=
 =?us-ascii?Q?KFm0yyRG+DeiO6mwqC3K+fxy7izl+WiqAq4SC2HChpMC817uW1MSFCwfZfY/?=
 =?us-ascii?Q?Q2SRfa2WNg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ad5753-2f24-4107-a5aa-08da22456e6b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:43.1513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLyL++mTRr/sX21HN97iWxlx/3akPkJGEfjSCUc1r3LPv7Bdubv4QjBK4A2SfgLy14Jpxg61UU1301UpOB12bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: AuwdXkkg2EsXDF5TFiyu4yq4j-6UobIP
X-Proofpoint-GUID: AuwdXkkg2EsXDF5TFiyu4yq4j-6UobIP
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5..0c5bd4f923 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,14 +55,19 @@ static void remote_machine_init(MachineState *machine)
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
+
+    hc->unplug = qdev_simple_device_unplug_cb;
 }
 
 static const TypeInfo remote_machine = {
@@ -69,6 +75,10 @@ static const TypeInfo remote_machine = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
     .class_init = remote_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void remote_machine_register_types(void)
-- 
2.20.1



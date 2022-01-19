Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F764942CB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:07:33 +0100 (CET)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ76-0000UA-Ns
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj7-0007i0-5n
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj5-0007JS-Dn
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:44 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJVgQO032608; 
 Wed, 19 Jan 2022 21:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wyZTzIqTTMHOQtMH2lH/reAbZNCqbHUDB1iKn9ZLzh4=;
 b=Do3XSI5q41ilG2Msulor0kEYSfpUJh71Y2ZW/KTC42HOVDUMRcoR7eAF6fFnPrPNSVnc
 oNxvmDsmhYR6/HXP83dfRfFi/wWgXt1cqTGUqE/yVq3OAHApLaOWoegvhum7TV8Xa0pf
 qBBu+GirnC2h61GHqehc1Tz/IqCNE2pUD1YdxsWQKaPenfd9r/rJ5mOSihBbQmTj1jxB
 EAcUmkGS5XK2LZITSxurYf1Zm2b46ablwYbwY5E4JBn74Wnw3fjn5hOD2qrC63Ai7ecQ
 UHGV+BRIeYo1TFXdunrOU+8WoAeA8f0oBFVKhHvpJjtsMot38TRgo1nVwO/VHNDyZfcU TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaukd147054;
 Wed, 19 Jan 2022 21:42:40 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb6k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffmU7hk/Ak3Ao2/NK8jKkobyY5cBP98XkzlbNnxjEI4ZMbsJHaEkP/lfgHUbp0fsLm5g+2xCIQ0hmxCyiS8/+ZFy43lBB8ZjQ+2X7/GRzjBjAmXBod80d0uQ49br/Hwhb4Ee/8q+V4VfAtSfY5RPndcvqIprxhUuc78GNAQwVUPna82qaPdnSfIWkK5K2hQotNCMxJ5jHVUZNkEwTmieQWx2TV6Y3xoa0BE/gvvUQXPKcAWphVk3Zvkkl7dzESCUO6TV2EiJOo650NSndVBOeN5UuEBOt4V4m4DABfoS3mO/c0u65GT3u2ce8ESD8Bu2KKCevdMTi8p28ZUclemMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyZTzIqTTMHOQtMH2lH/reAbZNCqbHUDB1iKn9ZLzh4=;
 b=kBYWGuxrsEAWvcYMU/UxAJRzIDKtdbhtEfW3frQ+SOpQ77Xc6ag6mFilLIsR0EPUdOjN4UmaBC2mIEyX1G5z8edueTcYnqSYwI/6OSJdurfy0CdfwKWAsGjiSHqDyLMQ2AeeMJAmqvDh4T19msk1M2p8aIkwLxy7r5Eq5vm5XOcu+ajeBw84nFefH0qFyD2ZrCXyUNUF3mUEJtCJOWBkvk/nJxziTCMi10ADJz8dNeDuRKc+cECyUPX3LU6MTnH1ClAAB7XxTnuLCnV4oUyNIlZM2nd8UwOH8VUZZ2OAjgTtLelE1P21YQDY1Vu0xgA7HZidlAOyv0IP5ztwQhDrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyZTzIqTTMHOQtMH2lH/reAbZNCqbHUDB1iKn9ZLzh4=;
 b=g2REhWQMYI51XAb7MUAolP8vbw+X1UD0A0ggnYQqSfVVs7QW1ijr8J92bJfuusKDdOxPkKUFnWkS/cJxdMT2RwNtf0ucd27+9yv0srs6dQOlF4Z9rB9InNh6Q2jONBLMesITdAyzN/nABhcmzZq1xJKjUePbLiUXLzv21B0KpEE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Date: Wed, 19 Jan 2022 16:41:55 -0500
Message-Id: <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebf07d0f-167c-4c4e-8d10-08d9db949ca6
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB588756FB32365A3001E38C7C90599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QFPFE+NkyFsQ8pafpmvJrsUl4uWBXhAvcvBa8bnUwz3hVoP2Y74HCKnozcpv7K6UGACSvKuIXVgEE7ACFKBNJgNSxkodGxVJxZYnuu4759opQb1Qtn3s+moFX0285nXSqWzjrSKSrO0mOUaAhTDyOvcvyL/vBNZ93c03BJ93G8qQWsk1e3lU+oHbFnOLfwW0vscN3S+dYr7zKKPDSLQ/VEc50GDPckbrOaH7OiT3TUfQEh63LJG0fsq5XLHCjEGRY5vpQFYkTOvGEWgmJEqfd6zZHa0OC/xxZKylLO3cEdAkjY8drfg3NDVZirg4vaAMNtBquhX0XYTM323iPCPEr5a/XtGn7OdcfPR1tB0/m2TRt4XTuxKU6m0TJLUm25AJMyNc3dv60yqyNsKBZru1lGbtFSK8eXJ8uE7TVMyIlj3JJOQBAr9lSfgnvOOeV+pc4xnt7s83URkIUymbCuwDiGwquW0O6+KgBWJcatqAnMSKEFXPL/m6a52rYasuDxZp5bxwBKl+fklcrUrfj8k5XsfFZctWsquwKFYb5k2sy28zksBpLwmBwChuzu9QhlFiyoLvNU0/7VmZEH0zrBW+gv50x0IESzPgVEQq1r1doqA+JcOmlmnfihE+0Fcvjn1+CMlIcXAU4RlSdOJRX0pl1Mc2rOzR/vV40PX1XUSIoO77KWZLcG9/kFLuNcvUsj+Y2vhNKE9TdF5WU64O3l88g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78pGWACBJrqVjMGZAPDZt3gw7uaTFtTJVGvP8CtN0z0Tq4pMzWReFEho3Pml?=
 =?us-ascii?Q?CLKrJDWcw/Q07E9wv2mAQa0LtqAHS1HfszsK4NkKIyJpwzZmb1UYd9NVIHI4?=
 =?us-ascii?Q?esUeCrM0BcMbiZo4Niz/7Df4qAPD/s+58OQdyGkAFEwaXmfvo5z4g0wcie3B?=
 =?us-ascii?Q?/v7fRz/0nvI5WlwAyeFpk/x4UnSmMEIwBbOEEs7WkjxFl4Ig0fpMOZQSPvGh?=
 =?us-ascii?Q?g+fq0gB/josWhYQnFeBrTlToD9n4VhSZ6x2YPndq+wMV1EDbm4PupRcBBl08?=
 =?us-ascii?Q?M6oVmD3ScUQ+cq4GBmQAmKZKpxFN87Zc0+GodIs9UBfc755uOeddq3C57ZhZ?=
 =?us-ascii?Q?szR+Dg9Zamn8WxtKRWGcL5QtDBsdDXugVHkUZ6nzSUBzNuHNINFbfoQbp4PW?=
 =?us-ascii?Q?/r1F1dXMrjwNFs3upJt+l7glK+2xUbsbLhq0l685zFkKRvAWEBDRjze+cH/b?=
 =?us-ascii?Q?Ulh7nrjijRgO9VqkccSEyhWdkdXGaF7lIYZif7OTnwRCl/7dRnbpr0jAT7yk?=
 =?us-ascii?Q?58QEfW40uv63q0kooOZljzrt4bYG1tboEiZoLMrqJSA+7aXs4SvrXEJCGT8s?=
 =?us-ascii?Q?96lOHZHLsTsYyajSZS2nBABS6ap61xQdtEjGC+jZ6IhbqPpKN8V5smpeK9pM?=
 =?us-ascii?Q?/2CVb7Fd/2TA+yhyUqdi3jeU3bHaSTWtl7SOkAsGyhnF+Nka14Jk+mg1vUsF?=
 =?us-ascii?Q?IAFUKvTNqXWozSXS8X1Ms3HOBV6VeZ2thh3/QahWA9mg/PHTYKnkPu8AU9Mz?=
 =?us-ascii?Q?Urwx/toVIUUVQaK5deEpX80hhkVv0lbwALaQM1Knz1qbcpwGAcYhvguXaPec?=
 =?us-ascii?Q?QY61ID2wiV/g0PYhUsVjizrp4nAZZ+1FAHRWabX5YwxrO3q5W2ZsltIvIhVB?=
 =?us-ascii?Q?ZopnE/caeVhGRkTF0+2A+hMASRTa4ld6bmk02WtV3hd4yPZJkg5FRs3uM0J9?=
 =?us-ascii?Q?IHUJzP8k2DbykaETYwoSgoiDKaWjCsHm8EMh/H1h2UoUAQT824Lpi9J6Hty4?=
 =?us-ascii?Q?5S7P5W/36nu1wt39B79yq7M1NHP7XC1urdJOcqcYW7kvf8n4kd9/WpATt6qe?=
 =?us-ascii?Q?OZnUhvmvdKCmrGugNZ1xIj+tf+ApyERaRy1qCM1NNBrM+WofCDQUwX5R2TAa?=
 =?us-ascii?Q?t9vpHmwoayzKW0+/2hulX/Z23Tm+o66lWoAlrAbTGM1ePi8o5pVyEtyhnjaD?=
 =?us-ascii?Q?lmMAdybARmkxR5EyNZzttYpldYxt+v2+QZA2ZWGzUikpJ8CLNj0sN3dB2zR+?=
 =?us-ascii?Q?GPtHHmk5MULZtRcgCB7cv00Nf+Vx0NKteKXK15l3EHYmzZu1wYUBf/pCAbRh?=
 =?us-ascii?Q?OZqSzJjRbbhHfNsNzd1NKlba4R+ZqWMKaGAjgDM2dbp2Dxrxvt9ht+4aVBTc?=
 =?us-ascii?Q?9dea14L08KgWdeDIGCuQ17QaKYAr50QeiB5gHVxe28e0pGMyBFgR/qdtEzIQ?=
 =?us-ascii?Q?TzheV3hM1U7WXkpmBYYUhVYb3vu4d15UrPrqgK0OicHCQf3wd87rxuQ5b/5P?=
 =?us-ascii?Q?PI6Uxu4+7H/73/WURblRwi/6LTEv06gKrhs81yR8NsScvcAfgl3Y9DVArnwR?=
 =?us-ascii?Q?7a/3ut7d0cBnROAFXx/ABVHqH3CfoOeuc0NTnn6xn7nsuRCZZ9Vgdu7yDW1z?=
 =?us-ascii?Q?oekShAIgJgx6rA20Z16f+vo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf07d0f-167c-4c4e-8d10-08d9db949ca6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:38.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6B+WjRMAl+B0pggSrPKosMQcj2Pbpgz46rmp9gRyrnGcqgpmJwNP41M4ZE/Lo8ZlCagZFFM+tnrIOeTAt+wPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: 0NbD483njkdLx47N5td8kZgST5nJEAIG
X-Proofpoint-ORIG-GUID: 0NbD483njkdLx47N5td8kZgST5nJEAIG
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/machine.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5..220ff01aa9 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -54,14 +54,39 @@ static void remote_machine_init(MachineState *machine)
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
+}
+
+static void remote_machine_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                       DeviceState *dev, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "Only allowing PCI hotplug");
+    }
+}
+
+static void remote_machine_unplug_cb(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "Only allowing PCI hot-unplug");
+        return;
+    }
+
+    qdev_unrealize(dev);
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
+
+    hc->pre_plug = remote_machine_pre_plug_cb;
+    hc->unplug = remote_machine_unplug_cb;
 }
 
 static const TypeInfo remote_machine = {
@@ -69,6 +94,10 @@ static const TypeInfo remote_machine = {
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



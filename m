Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316284942BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:03:09 +0100 (CET)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ2p-0002Yf-OM
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj3-0007eB-TG
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIiy-0007Hz-QE
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:39 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJU0LM031218; 
 Wed, 19 Jan 2022 21:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=7GDmlaYvkS/vx5UBUB7NUvEFhcZLgp9qiCrYmHbnuzY=;
 b=DPofaA59G5u+fPCHkOJ4xzuTAafVe5y2oDz444UPXuvUEG3BX4jGLZWAFtFPZxTA8wOT
 3LzNNSLoBSdkznpWHUVI/lfCZIOoy2oSscinILGbeeue406G5wVmwWUCT34iA6ed3MOe
 N2GNU+3eYmIyOizCWKskxF1oHFClPIVqM2LpgnBFweNdseXsZ5KQ2C8CR2pvrM/NILMq
 xYmmiS0fyDD/ha5dx+Il0dKD8RFW4BKDviD7zJPpJDe+NTOmEcMjHba/V8LYfj9uQSQ3
 XEof65zEYG4U4giseleP6dMEgYRdfmLiOntq+50J5ex8CXyoARpwxaYg9g/Kcghm0sdO rA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa7NZ131748;
 Wed, 19 Jan 2022 21:42:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3020.oracle.com with ESMTP id 3dkqqr64pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSx0QqUCThn05yGfhXlfYwi6nsW0MF1pGcnaW2NtpfZsO70B4XmIx2Hh4XnAHLen7tMu1avYFQd1PtlkXqbl4SRkjPyxZw4y4LK9Lr6q1+X/e6jiE06AQfGJE+ZpUc5J4f6PcWdnJvq04tX4b5uIKRQDIdQVDlXrrH2fIzvgIh/ZdsCGJ1i/0VnYlAeWmFW2OGUHBpq3hVMGKzxLW6CCdFvfA/n2PvjTk1GPXaOX+j3OyM+puAki6d2MEpt16XkdDGPTGA2Ri28fGyq4oDg3tV7cPFE99GVTUHGQClnI1nboZqEH3VLrh1IBZTwr1CLF/GkT7BynazU3Jp8w04UeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GDmlaYvkS/vx5UBUB7NUvEFhcZLgp9qiCrYmHbnuzY=;
 b=O2GjWxZMoQtz0uno9SX7TOyQpjkgY3k/W7ce9bUgFBZTu0pttIPGEq9zwcxUdBQkbZgbGxV0OY1V7loHUkXtRy0VjscQW1qhJ4+rZ7ulzoqga1Xhxm3IiZ5WzikEEndoM0V/0AuZIRJSRXSHF5SMOM1g/NfJ7NbtsOtyp4cfNimjS5ocsfN/4itIBy1sedgXPehe1G+k1/VDhV7SmS7RBCAciTUxpCsXPSgiKtOsjZ2WzP7R7wWMpksoHdSrPZYdZc/9l1wEvrgw7cIL14jBoAY+nnLtE947BObKHf6LKTCQdJGaOEaLlieUHKqhZoz8uuX6fpzeTXUa0Kmm8loRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GDmlaYvkS/vx5UBUB7NUvEFhcZLgp9qiCrYmHbnuzY=;
 b=D8NC9YDdm+qqWqFcABASFDA4pw8SFSyqzFQZIkH7SS42q6WGDDUS+RlpvrUemGCucXcu4jd2hnmZ2OIL96ZLOBEBGW5WYl+Q8qINL2ToD6m3cHcUy1JNI3uKysfGTjSBuyKrhfe8f2jwIiz6D5qu3iWFYaS04P5Mz7YuwU7zI34=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:31 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:31 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/18] pci: create and free isolated PCI buses
Date: Wed, 19 Jan 2022 16:41:53 -0500
Message-Id: <566b2ccf8a7a5ce2ccb21f66c988a0feee83ee8f.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe88294c-9492-40f3-5d8a-08d9db949873
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58870BDBBBC117626A3B59E490599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iGpHrfMyumQYsgYps/DBDle3txeWsQGWQdGvjrLHp5msiWYZuKYdgWeFwpogbfwM8JRUHK8EM6+Kifm3nlMpVfw8ydh692u2axHO1ok0N3ME1QcAaNQ0+2YZRdsBFHErCb9YxSgWXyWcbJRrT4JPBmcDWCh2dl5yPRnXg/2dInywlGwGJRG1QJmI4LS8gdIXpOXi5cxksrgumMQQzIfFWbGZojFAtIPUZsTI8uNAuPVR1y/Atw6Ia8fH7l83QwnZC5W9Xk4m5I3khLUR1ywxi+7tpliF/rVJib16pWONe4G2Qu56e62hF/72TnfVC+b6UBQMm6B7ro1Sph71zMwM8KUzsarYckSwHpGGYkNCJZ1JE35MdJOIMhx+SZZpvsuMqOdtuGGkTTQcpNj4hDN/uP0sDkh4C9CifkdPd9HcoH707NwvHicRsBVe498gU1Luri3H4xmeG5HLifEnMlTkFjBix/Ztfv8Hn0l2Cv9BClQszcmTZFniu/iDke9x4pWVwFherdVfdHaApcMANlCbTCBD+FYzEGFPeX2hLpGB2Bfq9l4wNG7Jd1wMgnkzWovAvraxinCdO5HPNteI98qdZ9rP7oVS1zzLgf9rTLZq74CmqNXRznjoyK6710Ysc3Y7iNU+HqEpgCuuT281EecrIWLSiPTK3efobOpf5xhbL8U6UT61ufyj0hlhh8cKroDhuC4TYtR2lh45SXNitXzDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(30864003)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOTe+wDKw1Xgiu9UsVNrRWgVM7n3EGRmYoJXjgAHRDpJMXhH2NHCQEf2wfnA?=
 =?us-ascii?Q?XNFSzGODm4jFo12WRKeNwQmB/kPmBT0Njcw1eDTOLEw9F6Pn6Nrezd3NH02w?=
 =?us-ascii?Q?NKx8IfuIqUIJf88rqpsC9IRgGJuMUH4bwdbOY9y/jBg6N5tW8KPL1xysWuRG?=
 =?us-ascii?Q?VYvrki3kUy2+xFRoXnTdBgTkdCTu2STFgHb1LuGPbx/iKTpSh7Qa3zuWhTK1?=
 =?us-ascii?Q?j31zAe3ExPqgvzlG0hERL0O4qEoYs3zOyKqbIJk1geYH3ktFJpL+TTEAGYa8?=
 =?us-ascii?Q?D/qbEj6IjtSXcp3N6qFpcsJzfRdc3PmfxVlN7p2ehcuVejPP775RV6Nfu+N3?=
 =?us-ascii?Q?ivwJ8V9Ilg3Pal2Vt9T7ghLciESfA2LW4JJh5CbHmf9ce8GvJfL17Bd8DFyJ?=
 =?us-ascii?Q?mfBir3KqARoN6+BJucykpoiZEkUmTKhUyunlfXTe3zwGFdXvWVCZkUTfIgjv?=
 =?us-ascii?Q?ZdoP8w/lBQpvuAWfDF980AfUUCAV8wa+GFYh7crACMctdDjxzuolvJyxKGo/?=
 =?us-ascii?Q?i55Gn3ifutXEkzGn6E+lV8hT0RzKPTftTHPVypXSfW2zRb8s9dnMTU+xFIcJ?=
 =?us-ascii?Q?6sV2n6IsGzQoVXdt0eukywgdD8rAYY1IticX7reQKXgxa8Fdo6aJs0NqBQQI?=
 =?us-ascii?Q?Y8Kn68Hf75KlGszwDGSgeMdTWNITLNN35jj6HGLwqGQaSbpMKW12IZyRVPib?=
 =?us-ascii?Q?uWzVfsEB1+tUo2J/qa7GXvRDuQX24VjY7ZsMyFJaSTpf4Tp2443+N7saitvN?=
 =?us-ascii?Q?NGbUsbeaA0xEaRIidz0ST3HHTCUkziYguauIn7b8b+EP/cPD2O0SddElPxDh?=
 =?us-ascii?Q?DDhHuZQLMNJN2uSy0hyDRjkfpSJvV6+h//S17Sefk69Vk3CvpBS3ff8OnvDX?=
 =?us-ascii?Q?Gh8Xanphzuq4oRk8T8FW8fy/NCUM6kMDP9cLfgJF8mOJBcmNEg+bKC2nLeYl?=
 =?us-ascii?Q?M6yMg6ot87R5kqtV9ikT/fQ/n4mU5OpKqhFSwAVGCgtteaYWR/saNvSxyG9L?=
 =?us-ascii?Q?nb+8+anh0y3EycoI9ioS7US+UcP2hgnpdrSEbo9SB587e3DZRiTH4CNPf8Zs?=
 =?us-ascii?Q?Foy50QFIjX3cGKMsLwOIrDVljUNPGexwbRqH3GHHYfaYqJUAJkU3wo6IpxzS?=
 =?us-ascii?Q?EyWnIQg2yMpTavNJ+FnBN+zt8Wzo9GTm5DhTJJ1yZ0m0XJTY+6uVLlrmmRD7?=
 =?us-ascii?Q?6xtSIh9KQQrqVLDqqc0N5BIGNv2vIK1mFHNGab9UuNh6w3FN4sNNz49E9ZDh?=
 =?us-ascii?Q?hiQf5ElQGXz92RtmuXnBsXfqvvC27KzWydiMttUaAhb/LX6tC5OL9qPovLWt?=
 =?us-ascii?Q?H5zjKESPRbkOSHXQUgggotKzS/DSEvXb2FmfO3q4jpQWnkxJbQppCijKlmRd?=
 =?us-ascii?Q?8GiVjqsKvdwxzZp6Y9TGRiQJtM+vqz3sj9KlHUpJrIHlQln5Kdu4T9RV9Ni4?=
 =?us-ascii?Q?hJ7be5qtAiKFaayxjhTb3AJkMjA0vmCKx1GQ4BR8/zUNGys3ER2hLsCfU9qB?=
 =?us-ascii?Q?CDJC3pEZtFmW4yeMZJfzKN4tqXtjMcT1b/eelsRd+C4TC5DnnwsdmXlT4mLI?=
 =?us-ascii?Q?edRTYZo5fuefeVBMU70OB8NGyEZmRXqlDds7GVjqGdr76EvpuEVUprluYNXW?=
 =?us-ascii?Q?fQpwuSzO+dTQJrwZ8kvIiOs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe88294c-9492-40f3-5d8a-08d9db949873
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:31.0850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EDyVqzzmkq8d4LwN3q+yHB5+0Qm8ITyaDAKuPQ7KjQU7UH04sUQxxGASFuT50vf74EZmpVCUYHfPxFs6pDeMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: 6rm0hcRbmW-ASFsLBcFcPl9hB_PZiU8L
X-Proofpoint-ORIG-GUID: 6rm0hcRbmW-ASFsLBcFcPl9hB_PZiU8L
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

Adds pci_isol_bus_new() and pci_isol_bus_free() functions to manage
creation and destruction of isolated PCI buses. Also adds qdev_get_bus
and qdev_put_bus callbacks to allow the choice of parent bus.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h   |   4 +
 include/hw/qdev-core.h |  16 ++++
 hw/pci/pci.c           | 169 +++++++++++++++++++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  39 +++++++++-
 4 files changed, 225 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 9bb4472abc..8c18f10d9d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -452,6 +452,10 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
 
 PCIDevice *pci_vga_init(PCIBus *bus);
 
+PCIBus *pci_isol_bus_new(BusState *parent_bus, const char *new_bus_type,
+                         Error **errp);
+bool pci_isol_bus_free(PCIBus *pci_bus, Error **errp);
+
 static inline PCIBus *pci_get_bus(const PCIDevice *dev)
 {
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..eed2983072 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -419,6 +419,20 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * Find parent bus - these callbacks are used during device addition
+ * and deletion.
+ *
+ * During addition, if no parent bus is specified in the options,
+ * these callbacks provide a way to figure it out based on the
+ * bus type. If these callbacks are not defined, defaults to
+ * finding the parent bus starting from default system bus
+ */
+typedef bool (QDevGetBusFunc)(const char *type, BusState **bus, Error **errp);
+typedef bool (QDevPutBusFunc)(BusState *bus, Error **errp);
+bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
+                      Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
@@ -691,6 +705,8 @@ BusState *qdev_get_parent_bus(DeviceState *dev);
 /*** BUS API. ***/
 
 DeviceState *qdev_find_recursive(BusState *bus, const char *id);
+BusState *qbus_find_recursive(BusState *bus, const char *name,
+                              const char *bus_typename);
 
 /* Returns 0 to walk children, > 0 to skip walk, < 0 to terminate walk. */
 typedef int (qbus_walkerfn)(BusState *bus, void *opaque);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index d5f1c6c421..63ec1e47b5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -493,6 +493,175 @@ void pci_root_bus_cleanup(PCIBus *bus)
     qbus_unrealize(BUS(bus));
 }
 
+static void pci_bus_free_isol_mem(PCIBus *pci_bus)
+{
+    if (pci_bus->address_space_mem) {
+        memory_region_unref(pci_bus->address_space_mem);
+        pci_bus->address_space_mem = NULL;
+    }
+
+    if (pci_bus->isol_as_mem) {
+        address_space_destroy(pci_bus->isol_as_mem);
+        pci_bus->isol_as_mem = NULL;
+    }
+
+    if (pci_bus->address_space_io) {
+        memory_region_unref(pci_bus->address_space_io);
+        pci_bus->address_space_io = NULL;
+    }
+
+    if (pci_bus->isol_as_io) {
+        address_space_destroy(pci_bus->isol_as_io);
+        pci_bus->isol_as_io = NULL;
+    }
+}
+
+static void pci_bus_init_isol_mem(PCIBus *pci_bus, uint32_t unique_id)
+{
+    g_autofree char *mem_mr_name = NULL;
+    g_autofree char *mem_as_name = NULL;
+    g_autofree char *io_mr_name = NULL;
+    g_autofree char *io_as_name = NULL;
+
+    if (!pci_bus) {
+        return;
+    }
+
+    mem_mr_name = g_strdup_printf("mem-mr-%u", unique_id);
+    mem_as_name = g_strdup_printf("mem-as-%u", unique_id);
+    io_mr_name = g_strdup_printf("io-mr-%u", unique_id);
+    io_as_name = g_strdup_printf("io-as-%u", unique_id);
+
+    pci_bus->address_space_mem = g_malloc0(sizeof(MemoryRegion));
+    pci_bus->isol_as_mem = g_malloc0(sizeof(AddressSpace));
+    memory_region_init(pci_bus->address_space_mem, NULL,
+                       mem_mr_name, UINT64_MAX);
+    address_space_init(pci_bus->isol_as_mem,
+                       pci_bus->address_space_mem, mem_as_name);
+
+    pci_bus->address_space_io = g_malloc0(sizeof(MemoryRegion));
+    pci_bus->isol_as_io = g_malloc0(sizeof(AddressSpace));
+    memory_region_init(pci_bus->address_space_io, NULL,
+                       io_mr_name, UINT64_MAX);
+    address_space_init(pci_bus->isol_as_io,
+                       pci_bus->address_space_io, io_as_name);
+}
+
+PCIBus *pci_isol_bus_new(BusState *parent_bus, const char *new_bus_type,
+                         Error **errp)
+{
+    ERRP_GUARD();
+    PCIBus *parent_pci_bus = NULL;
+    DeviceState *pcie_root_port = NULL;
+    g_autofree char *new_bus_name = NULL;
+    PCIBus *new_pci_bus = NULL;
+    HotplugHandler *hotplug_handler = NULL;
+    uint32_t devfn, slot;
+
+    if (!parent_bus) {
+        error_setg(errp, "parent PCI bus not found");
+        return NULL;
+    }
+
+    if (!new_bus_type ||
+        (strcmp(new_bus_type, TYPE_PCIE_BUS) &&
+         strcmp(new_bus_type, TYPE_PCI_BUS))) {
+        error_setg(errp, "bus type must be %s or %s", TYPE_PCIE_BUS,
+                   TYPE_PCI_BUS);
+        return NULL;
+    }
+
+    if (!object_dynamic_cast(OBJECT(parent_bus), TYPE_PCI_BUS)) {
+        error_setg(errp, "Unsupported root bus type");
+        return NULL;
+    }
+
+    parent_pci_bus = PCI_BUS(parent_bus);
+
+    /**
+     * Create TYPE_GEN_PCIE_ROOT_PORT device to interface parent and
+     * new buses.
+     */
+    for (devfn = 0; devfn < (PCI_SLOT_MAX * PCI_FUNC_MAX);
+         devfn += PCI_FUNC_MAX) {
+        if (!parent_pci_bus->devices[devfn]) {
+            break;
+        }
+    }
+    if (devfn == (PCI_SLOT_MAX * PCI_FUNC_MAX)) {
+        error_setg(errp, "parent PCI slots full");
+        return NULL;
+    }
+
+    slot = devfn / PCI_FUNC_MAX;
+    pcie_root_port = qdev_new("pcie-root-port");
+    if (!object_property_set_int(OBJECT(pcie_root_port), "slot",
+                                 slot, errp)){
+        error_prepend(errp, "Failed to set slot property for root port: ");
+        goto fail_rp_init;
+    }
+    if (!qdev_realize(pcie_root_port, parent_bus, errp)) {
+        goto fail_rp_init;
+    }
+
+    /**
+     * Create new PCI bus and plug it to the root port
+     */
+    new_bus_name = g_strdup_printf("pci-bus-%d", (slot + 1));
+    new_pci_bus = PCI_BUS(qbus_new(new_bus_type, pcie_root_port, new_bus_name));
+    new_pci_bus->parent_dev = PCI_DEVICE(pcie_root_port);
+    hotplug_handler = qdev_get_bus_hotplug_handler(pcie_root_port);
+    qbus_set_hotplug_handler(BUS(new_pci_bus), OBJECT(hotplug_handler));
+    pci_default_write_config(new_pci_bus->parent_dev, PCI_SECONDARY_BUS,
+                             (slot + 1), 1);
+    pci_default_write_config(new_pci_bus->parent_dev, PCI_SUBORDINATE_BUS,
+                             (slot + 1), 1);
+    pci_bus_init_isol_mem(new_pci_bus, (slot + 1));
+
+    QLIST_INIT(&new_pci_bus->child);
+    QLIST_INSERT_HEAD(&parent_pci_bus->child, new_pci_bus, sibling);
+
+    if (!qbus_realize(BUS(new_pci_bus), errp)) {
+        QLIST_REMOVE(new_pci_bus, sibling);
+        pci_bus_free_isol_mem(new_pci_bus);
+        object_unparent(OBJECT(new_pci_bus));
+        new_pci_bus = NULL;
+        goto fail_rp_init;
+    }
+
+    return new_pci_bus;
+
+fail_rp_init:
+    qdev_unrealize(pcie_root_port);
+    object_unparent(OBJECT(pcie_root_port));
+    pcie_root_port = NULL;
+    return NULL;
+}
+
+bool pci_isol_bus_free(PCIBus *pci_bus, Error **errp)
+{
+    ERRP_GUARD();
+    PCIDevice *pcie_root_port = pci_bus->parent_dev;
+
+    if (!pcie_root_port) {
+        error_setg(errp, "Can't unplug root bus");
+        return false;
+    }
+
+    if (!QLIST_EMPTY(&pci_bus->child)) {
+        error_setg(errp, "Bus has attached device");
+        return false;
+    }
+
+    QLIST_REMOVE(pci_bus, sibling);
+    pci_bus_free_isol_mem(pci_bus);
+    qbus_unrealize(BUS(pci_bus));
+    object_unparent(OBJECT(pci_bus));
+    qdev_unrealize(DEVICE(pcie_root_port));
+    object_unparent(OBJECT(pcie_root_port));
+    return true;
+}
+
 void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq, pci_map_irq_fn map_irq,
                   void *irq_opaque, int nirq)
 {
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..7306074019 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -64,6 +64,9 @@ typedef struct QDevAlias
 #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
 #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
 
+static QDevGetBusFunc *qdev_get_bus;
+static QDevPutBusFunc *qdev_put_bus;
+
 /* Please keep this table sorted by typename. */
 static const QDevAlias qdev_alias_table[] = {
     { "AC97", "ac97" }, /* -soundhw name */
@@ -450,7 +453,7 @@ static inline bool qbus_is_full(BusState *bus)
  * If more than one exists, prefer one that can take another device.
  * Return the bus if found, else %NULL.
  */
-static BusState *qbus_find_recursive(BusState *bus, const char *name,
+BusState *qbus_find_recursive(BusState *bus, const char *name,
                                      const char *bus_typename)
 {
     BusChild *kid;
@@ -608,6 +611,20 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     return prop->name;
 }
 
+
+bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
+                      Error **errp)
+{
+    if (qdev_get_bus || qdev_put_bus) {
+        error_setg(errp, "callbacks already set");
+        return false;
+    }
+
+    qdev_get_bus = get_bus;
+    qdev_put_bus = put_bus;
+    return true;
+}
+
 DeviceState *qdev_device_add_from_qdict(const QDict *opts,
                                         bool from_json, Error **errp)
 {
@@ -642,7 +659,13 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
                        driver, object_get_typename(OBJECT(bus)));
             return NULL;
         }
-    } else if (dc->bus_type != NULL) {
+    } else if (dc->bus_type != NULL && qdev_get_bus != NULL) {
+        if (!qdev_get_bus(dc->bus_type, &bus, errp)) {
+            return NULL;
+        }
+    }
+
+    if (!bus && dc->bus_type != NULL) {
         bus = qbus_find_recursive(sysbus_get_default(), NULL, dc->bus_type);
         if (!bus || qbus_is_full(bus)) {
             error_setg(errp, "No '%s' bus found for device '%s'",
@@ -891,10 +914,12 @@ static DeviceState *find_device_state(const char *id, Error **errp)
 
 void qdev_unplug(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
     HotplugHandler *hotplug_ctrl;
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
+    BusState *parent_bus = qdev_get_parent_bus(dev);
 
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
@@ -930,7 +955,15 @@ void qdev_unplug(DeviceState *dev, Error **errp)
             object_unparent(OBJECT(dev));
         }
     }
-    error_propagate(errp, local_err);
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (qdev_put_bus) {
+        qdev_put_bus(parent_bus, errp);
+    }
 }
 
 void qmp_device_del(const char *id, Error **errp)
-- 
2.20.1



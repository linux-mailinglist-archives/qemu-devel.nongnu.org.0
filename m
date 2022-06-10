Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B957A546DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:03:53 +0200 (CEST)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkrI-0001bb-Rx
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf0-0000Bl-N4
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkev-0000PT-SI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:10 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJiBnp009130;
 Fri, 10 Jun 2022 19:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=Y8kM+OsNZ+kdm6IgYuuPutKAvdXnm/tKWRKjQV/d8G2cp6V20qbL+So0xDSN6tmBrn+8
 8e2FDgJY/nfuZkEz0LrNk7BvLXWbVA6lcfAHqwvGFM9wccHGB+3ZSRRyVeVjnZz1irYA
 1YEcOySxWB6GICpsOMiggqJPM87BeAtMH9u5hu4jFFz0tAlkadZusSuS9x//bRxugYke
 e0Zqm6+65nbXzcOGeI7Pg72sonhkd109SCoJ0d2fX+oeOnTlNJfD/MOPDYRQUOckRFSq
 W6JIZL4FSZkY3iCeaBo9Q1yf++Jmmwy+AmgGoDJP+epq9AFTOy4T0kPCTbHEBzPJZ09J pg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfydqxdes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:55 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkgoC023013; Fri, 10 Jun 2022 19:50:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6egag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx/KVra+b5fL15e+q5CFcFpXktzW2b9vQXQAL04yO6os2JNpQFl8Rb5dSE0ajToVcN/Mo3Frbvac4E5Ncb4OPqvO+0/17oWGQqFI2VOYiUslOOVXkZUoaKF3HKS/OsKBmKwp93wddXLaxjk8NkSZCbUzCqAivlQ5YGD+Me9IUd1jf3U2mX2p+C9Q01XGrWQtP4A5JrIMPYx0Kko0LJsBI1+BOeFsyMQJgofq0i20NpVGestkPC0bY67As/IKFzXzrEyS6XYK7CosmX1OsaS8+y0FtQp+cAC2cNuVuOseKllmT8dgAhdP6Zs97Jhm1gTca+tvTRMrtg3/zTiwfC1Wug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=JrrXMWOm000yS8X95/4RXgMux+7hrWYM8tYNazqkicsthL8ZgOAHVTwpkLa8+dkP84YZ0xG+CZ4d39QO38ZAHJWbgw93N08BYxA9fbATYLucUXj2qnzHrt23hOjw200k13dL5nW8MNCGmNfL5wT54eJR7rM7jXD5HrJ+58vyrpIS0gjpJ3XLkKhzZ14C1fyaHGUOgbKubeqz7MqJCHizjGXHecvOd1nnMNKo6v2gsQi1gnp6qKZMcE7w4HwGXwCBmNJgPC0rDtj/y/nwHdLxXBe0qowONov9jBgkYbQ+S27Me4PTY6Cf+vJ3JzOWKa7OG4R+pnRMqwuCZKqYe86IyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=fV4J/nrsS05OihU6zpM8VgfJxvzt3uejFmmNZh0jJuOwTafG1KkYe9Pti9+f+zbc6nYm9eG/gdnvCLkVmfSlx2uqoReHEZEPJPqL8Af2qRs54TsXJfjgjsvIfrfus3e8T19OujsAUsaRUrQ0EZrZ4wuY0iGih++uFAp0GoHBM3g=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB6254.namprd10.prod.outlook.com (2603:10b6:8:8f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Fri, 10 Jun 2022 19:50:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:52 +0000
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
Subject: [PATCH v11 02/14] remote/machine: add HotplugHandler for remote
 machine
Date: Fri, 10 Jun 2022 15:50:29 -0400
Message-Id: <be6bb36c85b2994fefd8b14454d80d0f12849980.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22f63981-24d9-465a-cbf4-08da4b1a865c
X-MS-TrafficTypeDiagnostic: DM4PR10MB6254:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB6254A94B4931CA552E13EAD290A69@DM4PR10MB6254.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p92CBdItwvytW3f+BE8i3PVcjy6MYM9aGEDiTld/Wa0w9Q2XrpUjoJ1a5UHidJmv5rzO5scn+IBMRBjxVe0k3WMAszf7JZ2b9z62O0w1UzSnSiP18Jcr9bDgUWGPC7V3sdmnIlHv183eTuvqyZRVVimDO5LqdlVs/q1iRDuXHWSCLJRygrwqBnd6i3LyW/E8rYdLIHpK7sW4dd35gsbwf+/oZMo1QFlY5CYk0bjS/5FxtKnU9I/S+wOSIwhunMfLjfmH3LfB5CkmvIw2YZMMDv9klqObQCeS55f1t53kluXTCqJhk1i/lB9P928y8iJiW01XElFC0C/eOpbMVFQR/RE1To8GMDoaIJ7jul3lab5gFz9hiusfhTd1+NftozBN/jjTO6s9vumzIU8b44HNebJ2cPXmvPgDXryfumzD317ekTDP+xo+O7blEMGT84lFyDvNGQNXUnRB7UZ/UOE84uxHq2OMPsbPpa7864UAVxd54qd654JXHNJcthiKGIMvFMOWI2gVmOB3Z2eRIhJVZuc4hyOJiEgejwp5UAEBxQ3uc97Hy3nETr0Wxn8qeZ3N/fhIopWJgd3LSYyHrHN7iXkKbwJo1VwizD7Vv69WWqYbKi69uW5QkM81gfhMTdrv828JgTDnGqTbP69LLM800pFiQbw7AJh8VbBsvYcpqL/nOCpSWgPupZTWJuaYhCDf0Hp8rVtisIk41sVFYMlfJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(26005)(8936002)(2616005)(6512007)(6666004)(36756003)(186003)(6916009)(316002)(6486002)(38350700002)(2906002)(6506007)(86362001)(107886003)(66946007)(8676002)(4326008)(66556008)(5660300002)(7416002)(52116002)(508600001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7x1Hh5O2geNQZCnEhJMlDwuP2RghP5Sp8CEml8bYxv2ALHPXDerZYeI4trYS?=
 =?us-ascii?Q?7unMW3chgDy5bvEVI1c9k8SzWzyVlgLWK/t+Nam3RZJqYCQaFNUtUhRTvCAJ?=
 =?us-ascii?Q?3Gr2ifeESf5SEypQLDGMe7Gynbbup/iWto979I3IBQbWG26Rcv0qPdMCiTNO?=
 =?us-ascii?Q?59fBggsQMDvF4PJwvm9ShIvQnleLlvY33p2+trxLHzGGYqNMHqPPPj8MZ2KS?=
 =?us-ascii?Q?oyAGViH2+7UZOyU1aYjautIsM8+BllOo/pGSHr4h9pV0xyIkeHdJjwoMmbyd?=
 =?us-ascii?Q?B5pO51YTDsjoY2eoMEAQir8YfjaVFEFGZqo3iKpXoljtDaShHmagLLWqkbTD?=
 =?us-ascii?Q?vGguceO16sBPKeIMvCa8/w6RHEBPdkeSH66wZ+SL0DZAnTtQLmxrnqCcAobS?=
 =?us-ascii?Q?TVEAFuvLEd/L7L8iP6c1fK06WoJHuGZrqiDhFXbDSeXX0W/JYCb+mN5xbVva?=
 =?us-ascii?Q?2C+UFy1VisCQ9N0Mouv2Qsq9resTamMmetskrp7n1uhePbr0v8/cbTvFNVIL?=
 =?us-ascii?Q?1X0TsnI+Kt00XvY7kYhwE5s/SQilxJoV5pQ02qfTHgEsyku+WmBnvgqmYiZB?=
 =?us-ascii?Q?8xrogSmEWSsWZHFTeGaHRrTsoMpt/Ws2sTnADism3w4rvcYLs3zkR1r6tNRV?=
 =?us-ascii?Q?Mt8OlnI7SII7nHBAlmIw4XS/1KLC2c1ruq041yhPUt/WPTqy/WEM6yyi1eC+?=
 =?us-ascii?Q?hqIVImUxTAdIEsrJWXZWBOKB74Hdsc9F73PHk5QoNzs6Q/chQIYkjGLYXbQ4?=
 =?us-ascii?Q?7rlVz6IALPG5+0c6/6fLUJMZVtenb8v/nWajY/98DdYMNLSvVaMISXSt2ke6?=
 =?us-ascii?Q?nhZQsB0HSjDPRop6Kd83OGW0mrZ5S84XSfpAxJuxwrZuIL4jnj0f2sPvi53n?=
 =?us-ascii?Q?ptYxFfTsoCMlScOsc9OpM5gRF+fghdxEOu6v7Kx4QjwUExoPuLfnjDOCxmIr?=
 =?us-ascii?Q?2tcY+QhEFJPR7Urz83qN4VqDdRH+FkANlclenBMsBd1zIR1rymwfqjLUKhjO?=
 =?us-ascii?Q?h/ic5rF28FzxnKtsxBslbihy8k6zxL5qpNKVWeJM17OWS+N2ViBuQOSWEt8t?=
 =?us-ascii?Q?KY4EliApXOLwc8M6J9qdwqcWRpv/1Hrxf7Tm4EPYP/y0hJnynUIsxEBaz3ju?=
 =?us-ascii?Q?FUnmzETg6LGn2raYHrItxi+OEXC2GeVcM93I+wBIY5tjRX9v8BW1NIB9ji3A?=
 =?us-ascii?Q?qXxVLcSNP9JZ8X7nGXtQMX00Vot2Av3Dk0Nc+YG4xHvuCZxy5D+K9JdnmVf0?=
 =?us-ascii?Q?MlyJjBlCToVTTJgTwMG4HpMzRMBebYCXmPNcZfjDgbF9MQXCGp06iYTMb3ZG?=
 =?us-ascii?Q?Q08Pl/ObKWIDJi9hXOxtiVLWZCBd/7/YHg7WfY1r9K5L8pv/xoREK85WLiJw?=
 =?us-ascii?Q?+MSoABZUhaDsBe0RItbUuJKFihu0qJyetX99aHrelCacp35Itb+zc9rhu8er?=
 =?us-ascii?Q?bjpsYJU5Hr3L3+S75dckhtjQamFG45ro03MDAFTFkgnceTA6Z1bSZCZOedNJ?=
 =?us-ascii?Q?LzDuIudXOF8wbQD2dOuIikMS7uDndXnRGFpdk/1AzL3fRPtCZFDRVAsk91oY?=
 =?us-ascii?Q?mUwgHQgkEH1uuEaHcBF3uHfj2fGP37LSYsTnZ5NPAtbFGvHPNarigMNFlhsf?=
 =?us-ascii?Q?YfxboMcdgbnMj1+Pzathe9e7LVtNR5Xo2a7yKzIPhugKBr6YnyKPNrztaby8?=
 =?us-ascii?Q?EqVytosr/ADLcUdDK9CoDMi5XQO+I4tsejlh8fdjGJP1QgNXTajVTpGiyh5y?=
 =?us-ascii?Q?DTdiMWBwlA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f63981-24d9-465a-cbf4-08da4b1a865c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:52.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmShbvqYvMK3/Hvl1wzuj2MtHBgB1CuCmYdWldiqgkJvdKheqDTPx6HJP3irnbE1XkiVS+PYovXJWPRbEGDBoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: 0B01p0Hvv-oRSwHd86a8cCiNg4RPS86v
X-Proofpoint-ORIG-GUID: 0B01p0Hvv-oRSwHd86a8cCiNg4RPS86v
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 92d71d47bb..a97e53e250 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -53,14 +54,19 @@ static void remote_machine_init(MachineState *machine)
 
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
@@ -68,6 +74,10 @@ static const TypeInfo remote_machine = {
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



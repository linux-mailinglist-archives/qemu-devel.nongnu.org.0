Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D3507B3D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:52:06 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngupR-0006BM-Av
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujG-0006TA-Jw
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujE-0003R5-Nb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:42 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JI6Whs013493; 
 Tue, 19 Apr 2022 20:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Qtbqi3jNJilFCSXwpwj7SQyG41+yGTZTZXxiBislSBQ=;
 b=HmZR/2CVvx8B4hd8Bv/v2Ac41CH0SPsyWN2xgFDnOFnuA9yUUuPsOTnUWl8wsJjJ/M1R
 0EfMccnVE84JwIoOY5rSCsesFwzQRShqft+8HsiGaC9Zyip/M3KAyxKutfsa5p0b2qdi
 WKvkuugUBWp42RwHhrEfnPOt82eO7tsFM9kyjCWpDfYh97vh0FtnjmALeLN9LLTSdmY1
 iXUebXA/A4Uj0qsQV5eYiFvQCYoN8Q+JSdFQrmdYU25Q02bnmaD08au4AFyrNPEl9yoT
 0O9QlV+KSR28PUB1lhzvKwj14lsvf4wGCkdEB7hoYfKTDdXcZgpuQ4HLCK7K0H8XD0Uh OQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtf7nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:38 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZl3J034159; Tue, 19 Apr 2022 20:45:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm830dya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAa75D603BxTjB01N7SCt1PSL7hlfOb0oVBrXRhdd2L26rOhbmtuZMsHie9TQilHka4UTHezqdfiJjFKntewckIWDMEVtPnrYhZfmgQ0seeti4TqXnV7Uk9PLdYHlVgPFX3Hbpjm1WyyNS7y9Igx9D+x2lCO80OhaGyasMTLByHCX9mg9/2FqXwFM+iJRZXAxQi4mnuHotdH5T+umLZ8htQVc/LHFalmQnOM5JMgbJcQlW+C8it/Nsxg7P1QUwK8IVmvGRcueR9hGh68325S1kZOPJUY+DYvnsJz08o75mxG/BX/eb2N34bNYyr1TQToIPmTzov7vG4Fzd3HsOjfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qtbqi3jNJilFCSXwpwj7SQyG41+yGTZTZXxiBislSBQ=;
 b=ajDwqV5TsW8vP1O7+SKiSctrOwJWiIjNUa4Pr6L8PDDmSPzygoIZ4oJTW5meiSJClCPwO2mk80DrvAybDb7jrwhl3qSpV/mo3huDQKZq7bmRiuSRvc3PTyFT8zWKp+g3bttfdalPNjbKXLUT+WFLzvwSpmArqHKmQxWAZZ4Q3kYb5NnGfQ02JUBRriw78VoWutQ8E/kQmYlJ2KDhFqNkdem/cfQjYr+Chkcnu1TxYSSSlZaLfAtGoe7UWv/X3EPpBpxp5jW6cRLz4k8cYwd7pQM63LZDUeEuRxMCWn+TLHAk4SosDJ2xpNxpa5aVr7eoaw9CDS6mocnsRXHsw4H28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtbqi3jNJilFCSXwpwj7SQyG41+yGTZTZXxiBislSBQ=;
 b=fRk/I49gvnB6WZdiuOo177E0hDSnz2oG4RDcvS0zKkHS1j10h1H6ba6HsMtcUwAVUjeTeEicnKLYd0jYXSQZJK7pnVau5IsW5NHbp2Hrf8g902JsgdzBQAGSj3KhBvKA4J8AKPGDVd8F0QxDvm5M0AVSLtA1c693BZw4vEef3Sc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:35 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:35 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/17] vfio-user: handle reset of remote device
Date: Tue, 19 Apr 2022 16:44:21 -0400
Message-Id: <9bbc332432abcf2b0a88ce04c6017a4b98f17801.1650379269.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c46a0b2-ce28-4423-ee58-08da22458d96
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998D19C7829129DD6066AD990F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K255OsJFD5Zo+8N5+lb6Iam4Qn5zFTVlTPRZoqlvQBig/537Xdr9EwCh0bkvLdiLqAWfX/Upv2xGPDIJe7mM8tENIM7+PtuTcYeRQnXwS7XarxGH2wjQQ5fv1rvwJBGbQWyFdXBNeIBab3SiFp+N2SYxlE59eaG9E7qTNnoWBqIy6t/o6X6SkSewAGHeAMfVnkSLISFnPRsmMMOrX02wcGeHHhGDen8IgslZaiVwLiMCZrV7Y5taaj8ybMgvEW2UV3zgVXdNDJ8/mWKqfhnxzlkZsOZB0ieje0eZeLP27B+XSUuKs/3LHx4jOFplWdKw1EXp2g3KnyEiM00GtqswTLMcvcY8qq7VuU3PSrg2E3MgrIK8cApyF55koTMuqWs26LOFgI8f7j8/FZIW/w59Orrny7KOiVCvNOHaFIbOuYaMx7mDzMOZzZnhcxrpSFNYE/enfM9gU9mtIABHd29mtmtReoF60f343VTdTCS82k6E4ixYQmeun29STqmNuJS41jcy9YkMfUqC5Sh5bibLXd/5gdryYxBWhJgHeoDeyI11wg8hbKUBYuNC4qT9QENPD08aOXmwapVNDHxj32tXD0jWxSkKET+WRZfrOTeEhuvXYebuAwSnzipqyY87BFGdBHcUFNrvhh72JBSEP+UKgkKs0QhznzZHH1jr+L0b5tbBQv+H6kqo+7NrREQpp9xHMno7Xkduhyr1sj91jqCbYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?khWWmNIwgHUGDvAJHtxstCBCViTSGCTWcghZSQhpA8Zi9Io3g4R2dsk4CVbt?=
 =?us-ascii?Q?btNvLVVh32sTAukL1P5KVTJ5eGQB8KYncdlwgJnESe0LVmDU2vg4Ig15AWgF?=
 =?us-ascii?Q?9GRMrzZvGsdl/KvEwuo+82Mvtze7HgBE9a7dgw74yUWiz1RKiuwXn2ErPN5T?=
 =?us-ascii?Q?cCOw8Q5LZr5/7A9IeMmlwdjLUDZsdDlyzDUdDWwly02qRuq6/qkoB4sNjSFy?=
 =?us-ascii?Q?2KjcEydWLyfXZ4lPRKeg4HsGMwHI/uburSnWr3yLFDf1pnq9Tdieq45FkpZG?=
 =?us-ascii?Q?Iq7yzJPh/2U8DCt/FvdFb47YNqVjfhVezNGQg64VyKBoIeFShQ59H4xNlKuG?=
 =?us-ascii?Q?rhyZ24de1Zb4qYS9Y2yY0yFqv56nI6PYmPDZoSOOmfbV6UmK90Df+ZJmlyPU?=
 =?us-ascii?Q?UAkou6rnUTJbrAQ4qF/0vW+VW9he9EGkZJbHZ3+zNdKwzgBEAj1Lx9IYwWfT?=
 =?us-ascii?Q?0T+vw+QvtwU/gRWY4aBLdOyO5cY9mqLm8fNCtdGchG3odvGFqI5PZ+K4Grfn?=
 =?us-ascii?Q?w96bypDlgPCipAINh3HRsrirFf0voSpEakSUXdxBycWDW8RjB87Rzd/l/jS6?=
 =?us-ascii?Q?qtG4N/rsR+5KVrscNODlWpB7xlP4Pw/0vnEvVVQHH6PisZpgJ3js/+WNJUlG?=
 =?us-ascii?Q?N2wZEA+lwWvmoDYB470bJ2XyjZxiFCQQJpL2px9QOmTYdcCwTgFm+FcnKvEi?=
 =?us-ascii?Q?4Ma9M3m9a8AfPOx7YDMmW0sLd9g8Vy6QGQUTLGpdCc4SLXVMNFgWj+m3WjMG?=
 =?us-ascii?Q?8M93r/7d7F31w1I1F+P7gYkQ/mYhpThYal+fwW9l4r/JaFE+kgxlMckTRh7V?=
 =?us-ascii?Q?VckZf+ZvOxlMlo+ca5PGDG1qUUcN9HDepMWIn+82C3a4FeGLvNd5SBtJlVPi?=
 =?us-ascii?Q?FrvQZA5QaqsdfEpvg/3qKV4ktKgOr59JdBQWOOAskQoNDSBilXqnJQqKrjwn?=
 =?us-ascii?Q?BctFBkUIhis/7v5Gu8gIl+rUn7TrITmB7TlwaD5BheSud5Py1LCFTmgPSG6i?=
 =?us-ascii?Q?ktEqhYIrIH2qCSZzB91iSCPRUunRwVdngGpt3BxAQ23T88Emh3MB7sqihSQA?=
 =?us-ascii?Q?T+7k9hFDMsGenA3J8onGzROzPgAMl9PGSrn5OAqZhnQHV/WLNaWs2CRMClRI?=
 =?us-ascii?Q?/FNHozsRhINgCKqx6gZJoigNVUR8hEihU5Y4vi1Hrq6d276HzFOr5G4PIBsW?=
 =?us-ascii?Q?+aLn3hxwd2Km8BKaIFMKHZtKi9jeEv9bukg4u8NUqsV+Lv99F618tHaNKsCg?=
 =?us-ascii?Q?v5iS+IUHI5C1gHsG0+1TCoxR0dlyHEyLV/A52pXW2No6gBDDwxCBRfh7tcaP?=
 =?us-ascii?Q?NpegG5drTepE/uhzKGUFKMaeK+l02rVVxV3rMKoXcOYA7V8jlzP0CJcvISLc?=
 =?us-ascii?Q?Okh2F2Und7lXFULniVgSycQHAJEiBKqwtE4gsDlvQGgDMueHFESTivED/fl3?=
 =?us-ascii?Q?7FwGe/ODypxEdUVTVTSSCWT6Gmb7BMDw7M8qK5CWMIBVHHoEGGYnXZRCmcq9?=
 =?us-ascii?Q?dJgkNY8vGs7kRRsrGizQmrZzkiY5YQ8SGeniilfU8/It9l2Cotm5tyXK/EtQ?=
 =?us-ascii?Q?FBH3lid761kF5rBtBs6LGikDllu7pwFG74a2JwMrbwOERZ4+IXnzz94swZRq?=
 =?us-ascii?Q?3O8HyrbNaRX3COzCUqd0u3PMb9GHkU5Dp2DBUXjRspgmjUjG90Phver0gdw4?=
 =?us-ascii?Q?MwTW6wVontjqPaMY+J6ZhS2NlVbjgCeOArQwPeECSEJ+5PNPt2tvVqqyTFVE?=
 =?us-ascii?Q?4d/eR/WsVg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c46a0b2-ce28-4423-ee58-08da22458d96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:35.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69nAID5vAAwej3NuEDGnajpi/RJ4m/Ducrnvk6ZQrqpFHHVOGQq6z2RSUZty+t7AEkL85dfBx3gMIdQmndN9/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: aQgnhY1TnigQUDFaToFzm757X6aEsISR
X-Proofpoint-GUID: aQgnhY1TnigQUDFaToFzm757X6aEsISR
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 70b4d8b9ce..8ca823aa01 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -623,6 +623,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
     pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    /* vfu_object_ctx_run() handles lost connection */
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -728,6 +742,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
-- 
2.20.1



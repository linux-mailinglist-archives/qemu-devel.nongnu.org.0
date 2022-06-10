Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8E546DA9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:53:55 +0200 (CEST)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkhe-0002sO-0l
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkey-0000A6-JK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkev-0000Nn-1V
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhqH0016306;
 Fri, 10 Jun 2022 19:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=2Zdz92DIdRxQ/SQlJYqfrwSbdJtovM/78KP0Csai8gY=;
 b=Mxri7Dd2UHyoLtbdeR9bC5Iy528bZRgL4YBdR9UPNsuWZPJhO1HAQyQP3HWr9MEody0K
 fjyskVGpXPb77FJc37Xubox2jO1d1WaxCYfp8twCyDgkm+zPCyMvcS95W6l19VD9TTzp
 VBcPFz4R3pvkDaFMc1XJ48vcfqMH9AIZt8PnS+vnQFE8NEMfW/wEdcvwHv0cZdn2qlzd
 TbHxsyPj/4tb3bD7YL0rg5TkNp4YaJK8BEahGUdBQXuNdXnA/TVolnEG2yhw8ELsTjaa
 JB+k6fGcUmG/3OQ5Dk5u6SdkP7pgOCqVjqBONBQ+4owsRje04IKSP3p08E3FDtb7Lstt 7A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxn4fa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:51 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjLKQ030549; Fri, 10 Jun 2022 19:50:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwudf28r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J06d4mhxHPAYnExDiiF/Hu+/1Tszqt8yGNEFpTb0Ul8qsVxRha1HCZ2Mudm1kGiDHvVPFPhenRFbJ0y2z+3VwIcTDt5NwuXp35FNE7VdfK1r8fBH/hJqNBmlZUciliapb96sJLR7EaCl3A8mP4ly2+I+gvfD+ejXuWADD1T3fCjN5VCcBTg22plC5aYfK+9HkSPRAW3RddMrUFh6WaR4nVV70eP2p0V5+s+KSjsocMuE7NVRNx7va3VIAvKc9fCvAZiGOkqKGj60V6OvhpQfpERy2QKvgUW8FIxwDn5ICelElLH03j8iJ61C8PYIRM9prQneW3pHxEVRfV6tC0zBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zdz92DIdRxQ/SQlJYqfrwSbdJtovM/78KP0Csai8gY=;
 b=UnIn5MWUeqCv4vGU1EXlU5qCyoVwXrAjiaw+ud4HXiGioEkKl9Vqt2VRfvLEtXgCozklYsa4AJQ1ZHFLrCn3jYqpBVtB6rkELPqHlA7iHz2naiGPcopMAIviOkHkL2hJKJBhnK8Y1GRXGcR8+/UWDgLzbPRUn3Yz26LipqwYihguOIvEDhEJvq6SRQODM7yr+DmqdCYWrvG1VPI/HWb1BdKJ9TvI2IlQY+a4LF7QfOQnhIYqaSMhijxwZkTr3wokQCOvbkBSgwv8+2bygXCWPS/MxaH1dPnSMmQEbaOmVzP4GzilQPyUbbT74huJhI2sht4K9jx8uc5D8sU4GPbZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zdz92DIdRxQ/SQlJYqfrwSbdJtovM/78KP0Csai8gY=;
 b=WnOwNtS1/NC4yuA/pe2srV5Su0tiSauQrlLGQcLS8h36ks1oZ/vDptw0bc1oF0M6HoHHztMWDJISW3D0iXGFWgwpgdEKZUE436+qaCd6EVUtBjt/13vTxhVOzcGwCLrLupV1cinKC/xxmV/jpopmZL1y8TsujdXNkwoqtTVsn4g=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB6254.namprd10.prod.outlook.com (2603:10b6:8:8f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Fri, 10 Jun 2022 19:50:47 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:47 +0000
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
Subject: [PATCH v11 00/14] vfio-user server in QEMU
Date: Fri, 10 Jun 2022 15:50:27 -0400
Message-Id: <cover.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f72f8901-4d78-48eb-9797-08da4b1a8391
X-MS-TrafficTypeDiagnostic: DM4PR10MB6254:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB62547C85AD211CF0B25511BA90A69@DM4PR10MB6254.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GiXt8wKKiEo/z7LPBN6icu0cI341kuJvpNxqbcJQL5NRortO0pUyljbekTJXzZWHZisDvPl9Tx01qbpRwsq8iQPUFd1LCOXduppocMS3tHs8wIWOecb5P5j6I+OBAqjeirRfyEiCfTIBKzWh+FEhZHlr0QfX8w+2jIaoea0EQtM22eLAYUP9ohUY/f9kO61cGvMg1VODMk58//vzXZgKhrz6rEA8V4EEMoI+8Wj2iDEs9Ci9cmL2uxo/PMzWSzomkgKoY7k/IK/ejXEYhZo5KAVO6DiK2Wq7/CefYSjogAAgP+j5OODH9s4YfOATO24z65nuIm06zi/MsU+coU93aIHNOmFZisKqHxnIRCQeh7dzT+gIRbD8m7I8KnlM0FToDr4rl25Mxi9SsGUdeo6r7bjPxOuXU/zXTsWlYN1+v3kVuiTqbe3ks3N+nVj6IT+//LFZUr5l+IsDV51sUXsA5coRtkEuZeXXlO+ylIL7O63fVl9PYZ+r6itkHWOgoQHTvjS1t4YCfjnnLwnQ0YL7k0FA4JZ1KcoYf6lspkuXVsJTSj4iV7SfkUabglwLNHMCt8PTBYTRc64cFHEgGkZ8nfr1NvQjGhTKRwxOpGx7aHN+klNiJdwyg4Nuhx6YAgG3WrW8GRnJbYuxJBEnpxeXawJOaURslITq/BlUbpKXVKe7hyqLB1kbqA1ukackN35aR8NEvOg4WN4pYCFH4m7PuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(26005)(8936002)(2616005)(6512007)(6666004)(36756003)(186003)(6916009)(316002)(83380400001)(6486002)(38350700002)(2906002)(6506007)(86362001)(107886003)(66946007)(8676002)(4326008)(66556008)(5660300002)(7416002)(52116002)(508600001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UN6fiQ9hulHDrzLNerLJ4DS5n67MFEiQQqnzMC0tlRiSOoS54X2+hhxlT9RU?=
 =?us-ascii?Q?Fng4lNhznEeZ61ccr1QgZR3C8qilCxP+gxC5p2NnRl1dOIaMnWMUW80R9st8?=
 =?us-ascii?Q?wiq7wutdMPq5XeS4sH0xJulQ3uA4Is625Y+yYM/0a9l6LfavfVXf6Vt+HIw6?=
 =?us-ascii?Q?KlB6dq9qkZ9SqOCCP22j1jsd3GN70tEj84GMuu9mqGp+4hDokD5YvL8oDQf+?=
 =?us-ascii?Q?WE5L4TTnMNoZybd2dPiu4yfSxDWSkfm7+CLrNGwJ+tQJhnDuUTByybw+HNBB?=
 =?us-ascii?Q?eJ6jDxiIokZKRcG5zOpB5fV2LatX86NRxOVwyol5kbOcwcc31wCyMEz9xymC?=
 =?us-ascii?Q?mbYp3A6zt7fnojMY8rfHS9DR/7NPmbeakYeaEhApn0KN55mCGTi1ZsqBsmuj?=
 =?us-ascii?Q?vWHOdVumc5LPqOZrHcfRQjnUbHu/LhEUF7qx2AY7FjrG0axzk7tusBHKDIBY?=
 =?us-ascii?Q?g+GSnwnwINH70rkkP/K5fqpNigHiYKKBdCYVnMpN52n04DFqFk4eVU2PwiPK?=
 =?us-ascii?Q?WPI0NnQQI0eOI1dyXdgU9rJ6nTzDx+5NWvxuozvo+T+qAyOOYQNFtaCzjfRP?=
 =?us-ascii?Q?oYwPD3TmovKObQzjrSLY3L6oqmbzHG99xnvFEs1DlTBu+ihXwcIPBsr02/rP?=
 =?us-ascii?Q?/jYgVVm5zzZAkaJ1l3llKqbeW9QLpUXyNbZ/zPjepEyS5VQePMZR0SkwiiYV?=
 =?us-ascii?Q?F28FpRjHLWpf+gqxcb7pULoryccS3thWwZYs3CP19UR7OHggXhFvEKpJ9L3i?=
 =?us-ascii?Q?FnziFEWpadfvgMCqEplZbB7z+52/pIKF079KW/e/a26vxQKDjHfDwFs0Ik0X?=
 =?us-ascii?Q?NRIbZ0qnLVNUe1CAOs36GxCcwgYswSmZ14heuMBRKMBJBtRPBerqtYUWmsiZ?=
 =?us-ascii?Q?F2eDBjKptuesh8hAXakIKO/Uy0wAESqJMkr8tPOe5wJMPxXUt33w/6EuQgn2?=
 =?us-ascii?Q?tfFdeMJwo+90NNmMPV91R2m6TUWqRNvSXaLCT23ZR2WYjgIUxAzGx88xKT+I?=
 =?us-ascii?Q?H3cgVyzZ9KSCgmTBirzCoS6/Vw7BmdW9T/DFSu7je7W9Qx1VVDuKFALicZx5?=
 =?us-ascii?Q?CdajR50Zj4nL2IFfGrDXzqkORyF4KgiMSc0RgQSSkYjdmuWXGGEpvRoUlomj?=
 =?us-ascii?Q?xSz0uflZShvXmA9I/tlQyud7Ag8+PVZjRawDmchT9jyWS2X6vQjvAn8CxlQ+?=
 =?us-ascii?Q?dvqu2W1XHWDDD0S6GLue/sUCR0YPhovvdUWFCqZuw4oapmsan7yIiRabNHkJ?=
 =?us-ascii?Q?9DGMHbdCePVgj43XzQTBcGScjVtv8WZeKSGu5d6wVcg4SUpQspGbVLJb6cg5?=
 =?us-ascii?Q?EbY8vbq7Vah2B8RAJDbMAxUrfFRHL6zNFjPPERlZs+M0SI2RAXMjmgsuOWxL?=
 =?us-ascii?Q?KHUYiPJ/XH3j6BJ456qws7QIKvEJfRyjccLlkaJWH3WQsTJwYqEBhW4Jf7g0?=
 =?us-ascii?Q?2fpZwB+1ZvTnVk02WdDSYeyd+U9yDMWB7RUXd3g8w5JBQF7B/L1WGHLyJ5LV?=
 =?us-ascii?Q?ckRJwuXKH8rYX/jiim9sTEDpq31ZFSQFTeBuBQz1V61RqsmslDmx0kSOmLOZ?=
 =?us-ascii?Q?EOBTaw0lL93UNGz4AXk/OQS+rJtSWBIUcbx/LhLfXe++lKsgd3g2TGrdtKGC?=
 =?us-ascii?Q?SsNuTVl1cbcNjgEsgvjIUy5cDz1wroItBLgBrZE04artRhr+18ZSec6d5mXB?=
 =?us-ascii?Q?j/A8cAOIi0BpJGTSqNRsyvqZuhL3lf9lt24miWHASBvsdFdhLGL1YLMANvJs?=
 =?us-ascii?Q?U5T9txD5Vg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72f8901-4d78-48eb-9797-08da4b1a8391
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:47.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dPYCq4rZVnMxC+JzlFmWlmYs8QrR02Ynlqb7gCfxfcVvtPj9dW18/rYQQIRSIbAJP3N4BIzvBUcTrUDx/2E0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=947 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: 4H5SFXftqX46-BqIjhZd-qkGP2_ghUKI
X-Proofpoint-ORIG-GUID: 4H5SFXftqX46-BqIjhZd-qkGP2_ghUKI
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

Hi,

This is v11 of the server side changes to enable vfio-user in QEMU.

Thank you for reviewing and sharing your feedback for the previous
revision. We have addressed your comments in this revision.

We made the following changes in this series:
[PATCH v11 13/14] vfio-user: handle device interrupts
  - Added msi_set_irq_state() and msix_set_irq_state() to mask
    and unmask individual MSI(x) vectors
  - Implement callbacks to handle the MASK/UNMASK actions
    initiated by SET_IRQS message
  - vfu_object_set_bus_irq() sets the maximum number of IRQS
    to max BDF. This only affects devices using INTx - allows
    multiple devices to use INTx

Thank you very much!

Jagannathan Raman (14):
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device

 configure                               |  17 +
 meson.build                             |  23 +-
 qapi/misc.json                          |  31 +
 qapi/qom.json                           |  20 +-
 include/exec/memory.h                   |   3 +
 include/hw/pci/msi.h                    |   1 +
 include/hw/pci/msix.h                   |   1 +
 include/hw/pci/pci.h                    |  13 +
 include/hw/qdev-core.h                  |  29 +
 include/hw/remote/iommu.h               |  40 +
 include/hw/remote/machine.h             |   4 +
 include/hw/remote/vfio-user-obj.h       |   6 +
 hw/core/qdev.c                          |  24 +
 hw/pci/msi.c                            |  48 +-
 hw/pci/msix.c                           |  35 +-
 hw/pci/pci.c                            |  13 +
 hw/remote/iommu.c                       | 131 ++++
 hw/remote/machine.c                     |  88 ++-
 hw/remote/vfio-user-obj.c               | 958 ++++++++++++++++++++++++
 softmmu/physmem.c                       |   4 +-
 softmmu/qdev-monitor.c                  |   4 +
 stubs/vfio-user-obj.c                   |   6 +
 tests/qtest/fuzz/generic_fuzz.c         |   9 +-
 .gitlab-ci.d/buildtest.yml              |   1 +
 .gitmodules                             |   3 +
 Kconfig.host                            |   4 +
 MAINTAINERS                             |   5 +
 hw/remote/Kconfig                       |   4 +
 hw/remote/meson.build                   |   4 +
 hw/remote/trace-events                  |  11 +
 meson_options.txt                       |   2 +
 stubs/meson.build                       |   1 +
 subprojects/libvfio-user                |   1 +
 tests/docker/dockerfiles/centos8.docker |   2 +
 34 files changed, 1527 insertions(+), 19 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user

-- 
2.20.1



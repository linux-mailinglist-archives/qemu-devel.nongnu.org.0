Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D0532DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:47:11 +0200 (CEST)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWkY-0001pl-Jx
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVP-0008JQ-NN
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVM-0003ZP-GE
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:31 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFK8Mh018480;
 Tue, 24 May 2022 15:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=TvzdtBJDcjTurNjzEr+mWbyhTwdThGjpTnc2Gd+SlLg=;
 b=OdIglgS91t8t2hn8s3uyS3omtlYTMWg638oJ7t3rxavTvhtDu8cGaDTz+7jcJtnxNRIb
 ZphmLeZKguePZQmWBrS9t6paJ4kcC3NyQwpGwqIKexRYGL7QDuEio9TRImYcZx5Fo46C
 lzQfbADkxDuJVMQQQbfMJCgXm+v+QMlE1S3zkyrcWaXf+66sd2VoDP713idjqi22wtdf
 E6J86HA5YTzXh9IN9mHTr5vcqEEnmAmxNe7C5dXpwaId3SBz6Ti5oehQSG6ngWCA9/Xt
 7f+SijwpPcC57DHyxktQ6sQrWth9/bJaWAfkpu8ZB8/UW1JvYfEflnMiFi49ZTTTAWKa wA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qps6tkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:25 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFSIb5025577; Tue, 24 May 2022 15:31:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8drft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip/g5vNRwjYUDecvHzjRbxsqxekovxNS4x2tnc+qm0NsaGTVmLHSW8wEGWxKZAX/fKshv5uS9Rkm4HpaeBgjEbtrVvpQOg6eYlLx/P5HqhVjGhHpiqw96/cdXiYDdW1RielRxgGjdB7OPxNQwAT1NfgWi0pZEguhYoraPO8IruTt34pYPq5sprj1DlV1aPt6lGybA4U9CK2iF0pEPm20QIqKBgHJ8C+hCLV4Pll2jc4m32FvGEvmAUQPn+GbDPYZzlcg/zZqO4yUMdzcjvVBoKcZW/SY5syq1KrmK9e+IOYFk8jk2QWQh6b7bHompwzpkdiGVMi1CHzzN8MBUJahDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvzdtBJDcjTurNjzEr+mWbyhTwdThGjpTnc2Gd+SlLg=;
 b=hZFLIod2IIIeJ9pCP5EY4rDvyTcG++j1wf54ynC3sSTtZ7VmgQMDBdTE5JvonXX7+mdfCQRO1GgPe9sZX7uQpQBwMSYGh5/frd6ahhUZfzgAvxkgqj7ZmEY1GS+MGyN1qhcvtx6rzq4c3m4IYHMS2KKheTR6n1V2YIbVjKPyHksjOhpDJVcqmjECsbIEdW03O6jttjlzMdhjHa3GuvuVEaZH62o/JM9J+zWFk247m2Bb8OSRMWJrhlWY3Izc0hp1NoyRa5uNhrl0tC0DmFmGLkLbXZfn3pBHu3B3WWK9cySz+rAE/dlOzwYXPzw1keF7Z7Ba9dQTSGKCfHyE+CzkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvzdtBJDcjTurNjzEr+mWbyhTwdThGjpTnc2Gd+SlLg=;
 b=PLbEqo2kdknXzc/TJQvwvS8cy0Rh/L0Olcwb44TXJ82XMgMcu764E3EV1Nv8a75yIgeapRo7cN2oIdAfyyigDEVtS7hdzwps7ECnWE1Gb9pCL5WuL5vxrEEVnq7DF3IwfGcezwOlQ3yE2IrHtbzgVX0aNgmJrd4+0B/+ieQtiJQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:23 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 14/14] vfio-user: handle reset of remote device
Date: Tue, 24 May 2022 11:30:33 -0400
Message-Id: <3f087d0e6eb70ca0ae2454b9f219b1c532290d1d.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a20a1d08-e587-4850-75a6-08da3d9a7512
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB311761F26AF08CAF070774B690D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIlgoCFLc6E5pLBdyOomalqvIhVgHNR0TuI376p/RpZuI5baYb+lRPdSz7Sz93zUFnRCA9D3XTyHXnjWN0ZXALB6sbHWMB8w4gLxTeGFHCw3VQtwewwolgvlbVH/x5WRAWYGsNoym9ws5WYUWwBnlfMBrCWxDMDKgvKO9xXVgCF1IioZE2cq27PcXKZ4bgPsvUxQ/ZcQksZHMkLPhnjB+XXn12w/+5g1rbYwydlHNoCOMrsFjeGntgV+hwFIUVlQSy/TT1zPtkZc6VbRC3LOPTNx3S21ejugHLQqdLpqmK4BPW+VBQC2ivxsKKnxbngx+OkppBAiqD7amDauZU0grjUFsVRvHc1G9VOILmPLRg6dFliW8cM2GHzH11nczVGgWOyD/QfCh49kQxvsUYlR/Q6TgDsY2k8Imve/NbMIw9kuVMPcW+nP6qROoP5fyipfpyyUHTRmLO8/8BVpiyx4mqwJt7ijPMtzwyeINUi+sBY42WMCgN1bZtkLJaoRs/LMb0R2UmJ4VfG7HUgfZwHtcFMBSqna8kLC2T3Num63Zw7zs8DYtjSpYoQ6VmLffP2qVJ+ZsyRtTUCrkFl0LPQxZ3vMjSSs6oDSTfaYxJnsLjrZ8rIRbuEGb1T6yUSO0KvMHnoE014cgumKE+cVydpBUpQTjOGyis+uNRauNR67sJmlpvoqfH0jWejJuOFlzMqeURyNVoq33nIR8iAv6EoCjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VrPZOxNKZ0epay+3xkDECrSjhhpJGbEvLNqVPGC6Cj1/b0NM0+AVqz6VN9g0?=
 =?us-ascii?Q?DrSYI5XJ6qSmYmviFDpb8ezgvjh4+r47nJ25u8AIEyZAUgqdYr6zO+RPu3C3?=
 =?us-ascii?Q?9xrJlqx9pJ2XI7jFNDt0Q26hn+Lhr4/DAtc94nIcqWV742VOxVkGwNmcI6dR?=
 =?us-ascii?Q?aW1YTMmMGfE4805LmbHTBnneSz6T+zhdlM8yQZzuixTu6GPvgFbqnqwXCI9F?=
 =?us-ascii?Q?i29OxXix6H7p8xecqHgcfJjQnyMh/TbBGaYg7vKjk5TgDSiH83YQyAV+eHvj?=
 =?us-ascii?Q?sEJY597SgJ2/kDpoVn7cF+hymDCovCzpSNUc3+MOwlj3Vu5tP4EcSkK92Zgi?=
 =?us-ascii?Q?U3d3tUSeKOZBaAe80AqkZvSESI44gbNLu/oQDiducat+PZW2RGn3HOLgHCLX?=
 =?us-ascii?Q?bmWSPZW0KtBCzajVEZa+mhmtxUWcjxP+4FgFuJ473Y4COEhm/rqMT0ixdQIe?=
 =?us-ascii?Q?K+coitoRdAxY3sXucVhz/9Ha71rSZ5dYz4IiRdMhcMRwqeuZ+FNJN3KQGOb+?=
 =?us-ascii?Q?HhSe76xL3bshnC9M0DJ//pw4NeiSnabDO34jcwlIKg74+aoCtSPdO8g+eI02?=
 =?us-ascii?Q?c5+rLq35OQDdlzaUbQcQoCh/1b/CeJ+zNue58j30Kcv+cptohpzX2uV23edR?=
 =?us-ascii?Q?6Ii5cUSFRWV0LbDKnpJhSHdZOBvPAoQS5n3tcIqGpfZkID7ofqXicwOPwZhF?=
 =?us-ascii?Q?MwMAVXY83Dj/NAPXjGGPVLa+6td8SVMXP2ppqWnntPGBmuOcc+p4hqbGlnni?=
 =?us-ascii?Q?H1p0k7SvKgKIZtSWL0G41GDWBS4qsq9ta+YtukxMuRbpm9/qajLwdMHCjmb3?=
 =?us-ascii?Q?mM58z+l5tCtrTUzS73dbs3O5pHSCaVRvzmdJ9H9LAzvXF4Ye9NPfLAYhmKMT?=
 =?us-ascii?Q?MSY3Cpk05zvTB/LBVolvE8kuUFNdTmwA/1J5bxAPONap2vONXcCCL8L47NGU?=
 =?us-ascii?Q?GiCJ6ZEAXPPN/c3lsRGtBGBoNmoUHtI7AWvLigsaOnTTt/Piu4DnE/UfDzBi?=
 =?us-ascii?Q?tRr56tCe/ybxYOlNyiAGDzGFKyhzFcD71/JcJopiry4fzeLCEs3kHYsJS9Ij?=
 =?us-ascii?Q?1GeZdgEye2h+A9gAAc0IaryZjpkG1fgux+qsM127qt6nCIDshxO3VHyAtMjF?=
 =?us-ascii?Q?jDAEd0q/0VhB2XPedoZy1Cws+Fdc7rXO3AaNtZ2fS2lEzpWCTm4t9M7I2WRE?=
 =?us-ascii?Q?Gka3hvlCjnxvHlsJ1zVbtK4xWUVlziaYYoI7KjjwB0edkprz15PLayYoIEqA?=
 =?us-ascii?Q?FHeGtZFa7ev63EsPEN5XRKjw/dwjL07GT77dCrVYTB1hgsGnKz8m2oOrVdCM?=
 =?us-ascii?Q?H+sbHPRZv5Gxc8JIU1iyEhtP6K8kiZWOMcyTXsNwDgeBWWJwp4EX47VArF6N?=
 =?us-ascii?Q?je+uoVNCR6grBY/AJhNcUEuBIsNfrOvE5Cz7X+FawX6hdQgkyjaCD2pzwDH0?=
 =?us-ascii?Q?l0HQQhvfhHL78OBSi3c/V+5TxvrFxMAzs7Xlj2bMpXUZxrFVYY2kYYDzPcJS?=
 =?us-ascii?Q?fPg4x4OPR0gZ1deCjqx3YM3iLlb5ulE7Ovl6l6t2fFiqC7TJLw1EI8E4TwKg?=
 =?us-ascii?Q?8ZCHu4lGF1V+lUyGh1rXa5JMd5giJO6iWCU1nPckW0iQrsEemahYJQqiaA0/?=
 =?us-ascii?Q?pH8FSlssgquWPxzvteAiQVzC99E8FGOFLzbraJbcU78++ZXUPpdfEEjj11hS?=
 =?us-ascii?Q?sklVjwSnQlUGBn8X08VEUfZmDvE4V6x3Ja1gbtgBCp3AxCGtqrFsHj1bW+I1?=
 =?us-ascii?Q?N7J00N5wcQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20a1d08-e587-4850-75a6-08da3d9a7512
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:23.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idehzOtJ/nu8BceAFvKUx9Ooc2b0ytNlxkKdDXATP0oKFtLbYe9LBQhJFrbZFq5oEb500V6dFuSwv+Uvi6KgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: eMDWUexXzDI5S3kFOyiA5GO4-Aza3CyM
X-Proofpoint-GUID: eMDWUexXzDI5S3kFOyiA5GO4-Aza3CyM
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

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index eeb165a805..c0c2277bfc 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -632,6 +632,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
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
@@ -751,6 +765,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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



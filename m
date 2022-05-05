Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED151C62A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:34:24 +0200 (CEST)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfMt-0003bA-1G
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-00063P-HF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0h-0002CE-51
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:31 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245F4QNL026132
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5aBUYX5OmAUgvb/9DYxS76pyxsIGUeT6S3INotjWpk4=;
 b=zR1/06KWyLEw0Rly0q6gU5QpEF3wiXtdCwvjlhvf/aCgZ/PmrI7V7XprW1NkE0tmUeff
 zmh8mbb2zyIL4d7dHpQ50UCZzL4WAatMJ5R2YicYf/eAaOzf4v4i/OB0LgUdewGVoLQl
 QqD01m2TB3NDyLP1Oi1/QfuHJS+vdmwacAXeeSifPo8JpWjU1lj0vwFaKv1blaD3XFKq
 Ji6gjZW+oQquK+bArh64gBTFdbzMTpXkwjBIxV/v6iKFI6qaoNqp6qHJ/VEPJsx0wJXF
 +Cw0LvQPiB8SUI3HpI9qOBl2Dp/hXHzo97y3sc0VTpCWvmH/gdGBt44wUCuzeC+dqxdL +A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bPI018925
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2e9b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcG5zkUkCrtFIlDjM3ZP50Zaub02doSKTZuxEPOpFpDHaD0rPruVPaNYIBBcOJnTTaiC/S3dptS4rcEsd0/R2QDeBziAnxR+nm54HHPcHsSx35hUM92aDoxWqZCjDv1bbZsYKmYOkrYjkAuZA++L06ABwAoQrGhyYmom/BIoY16XW12ydy1ftL8YMvj2Y2JN/vJhXgxlLb/oOZU6cFK4VzFWt3G0R+KQ+YU8RwzdN4GjsFYqozw65umuqD8+ylaPg2Xonm7KTkgi04eeiHCw8B/mfMxhGRDDHP5Btnwk9DYOKUwe4RrXkA1G5GStTV2NiFu/JB4PQAQo4ZZupW56Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aBUYX5OmAUgvb/9DYxS76pyxsIGUeT6S3INotjWpk4=;
 b=IZgBVG0k+OTl1uB/Tlcid9Y0jpuZPIlsZgPvJzujAjujlqAFwmNaexx2fcMdRi+M/ijPZ1mQ9Nb7oqhSPT3zRbiiyzl5xHA2oSErbaCK/X696VsoirxZixHyNo+aIsthyQSjAnhR7jAzdnW9qlSdzsu1jqGunck+UqEY1nn99tpJ+F3eeOxlK75XIAa8SGfQgorB+Xi0RNeg+SjGEJ/3gvVHHYwVsrBoRWe+/OSyxMBL2cGcMerM2KmzcJy4rKc+70JdUSWI/2rRuLtomumxmQIZpQScssNc892YIP4/W78Xfd22AB5fCX1e9S0+IbWS8YEYZkpyjn7cZ47lpkr6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aBUYX5OmAUgvb/9DYxS76pyxsIGUeT6S3INotjWpk4=;
 b=FxvXxPPcedQ+reSjofAecdcON94MTbpZJpf1XqCmYb36//K+mIci6Cx6x1KaR/X7rxTiTtUOEuc8Uy0nIIh8aiHKGoQeXUDavGXhrxFLlnazmzzFyLFDgfernY0DsjY8NNLgxlooA0pQy28jP2GfwupcrwJ53i+YibQCqKWkdp8=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:21 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:21 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 12/23] vfio-user: region read/write
Date: Thu,  5 May 2022 10:19:55 -0700
Message-Id: <8c4609c33a9f7d5289d0c3a86697b4b22bceb72d.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 553300cf-1663-4b06-6171-08da2eba45ae
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867FC5046AD4F2BF73CD5AAB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXXLUqMqnxp2bLkfVTFzDJEVYiQSnlI+sIzS9dtqLNBJYuxjVsWC1rjuGqkMjf/68fe8i7qjS3M0m0X/DtMKrGc10R04rQM06YAz5TXxgdb4ZHoX2rXIxfq/EL5qvjXPzGFvNI/Ea2UA10aZtn9+OleZwSsnCCU+ADFr5QVPg2xaD3GkNndk7AI4v0cG+3oU6+gr+NQkAEHUSxtC0vCI+uCeDqxRIW1b688ECnOBsbbWjLJm3hyNUHrluy5EECFejd0/od1cg8jXX/50HJUrQJ8BYcDqe4PXHphZ395fjcyRWmhmNpMnjn4VfW+qi3uDUfEyeZr+/7VoXDccsbJrwpsIIaOFeowFXnxb0w8WGYsrTlIcirglK1aIwA5B8IstQpcVeAXLl5CTU9uv6Ocp9d3Anc/I0kzTXyrMngAAI5ma/FPYAJzs1ecIZKSeiLdDHjS5RS2e0ngq3u/2RASc0urIisVXB4oPMxxQ0jOWRkP5D/wwa3aXhQc3zaoRP4UQGYxB1ny5iJ6787G4HOamIce9oWlrappFaODBAKEmEh/YDYexr3NVxCwZEjUjTFW+2Jo4lPiM7EhhTQCfTOwiKYiixWb8C6v3u75nrYSJUSBIpRi+OtBAQG0YRJjzYx2tyieSXdrYVFHAOvOgXGjqEu8q9ETCK3OjTM/LuutdCKleDd7/g3Av5i6nEXB/gaC9fwj02DbZx/aeqN89od5gFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucM7uVCz3pl+1QraGV0WW3rgG/H1IbgCGxB1w1zaWjA2jA0J9+dz852BCJGl?=
 =?us-ascii?Q?MJxzKHeniclKkerUx7Eor2uVicjWKX2BH2yppwGPmolQGtVpZEvxKkTiXGz0?=
 =?us-ascii?Q?Uwfyw2ApebPSBcYcmw7bA7GrUuhZDccjpac3dNA39RLH2Ye4BJdF0S3/CBHD?=
 =?us-ascii?Q?oY6dGJpxvig6fXmXlkoxoF7sY2H0IzZTvDeXgF9zMUTqDl/7I/65Zm1v1iaW?=
 =?us-ascii?Q?Wr0EgCIgX/amhG9VbUWQ68wVrKQNJq9v8dvuogSWRvSk6ChlvdKAsZduWRTT?=
 =?us-ascii?Q?DwBzG+vkkzyIkMsdHuA3WEx7mw3UkAu0ulLbINcJ/qkiYMVoKATvY/qbA1UB?=
 =?us-ascii?Q?wgzwcGLPjzF8+R9b4sQZZejArGrm943f/HD4IXjeGYnu6ojFbCUcWqIJoHel?=
 =?us-ascii?Q?UKc7VzzbLVNlF9wQoN1Bi+e4V+C9DLCbi7z7hpZ/68x4JsPgPAocE1QV2Av3?=
 =?us-ascii?Q?9aJngMsU7gGZjaooUn6g6hxslAJayAu4dQ5cF4nHLNSnpnPwwkX0ha4+XGI8?=
 =?us-ascii?Q?PGLdUhmL2ZMm2drUagPm77IjUBkONyOEmRMoDD6JrOltIWN1jKcc/ZU2YB08?=
 =?us-ascii?Q?QNOznRj5w+DzSMvfCMOK/QIZvT5XdLtcCXKoida44xCRw44nrYJFBLUiCANr?=
 =?us-ascii?Q?/Wz4dp/dNYFN8T9/o6PHd/hP34fNojeQfH09NzTxiACVaGd+Gf1PunaPFi/q?=
 =?us-ascii?Q?zi1jkaHxm+VJXAy6kVE3aquJtSSRdlESUT3hO+oNS/vwuCwlDieNgYYld900?=
 =?us-ascii?Q?ytw1u5dA2SFW+XZexDGUDRUBdy0K1eqGllr4jqUn4YRW2jx8H0wrPjQjMHNq?=
 =?us-ascii?Q?N3hyqBl3ImbL8NCBeGr/j0pAE6x42V+Et7jg4L1DtLoc7o+uCroZrL1hmwVc?=
 =?us-ascii?Q?bGVgdEDP8gVRM3/xKVs3dPopcG8q2C8o+mmxn7nZ96vCHh972O+9GD6KG4Qa?=
 =?us-ascii?Q?HPRtVvFEhmdX+RTbAyAL+bfjkofgb7aGr18G6prlVVCLMwVSCQVzwazuc7aP?=
 =?us-ascii?Q?6XmvGcRNFpTCsuDdC3aRq8mDlQDfcJQ5v/DvaBcsHVtTnaakWGdPBsZBKiUg?=
 =?us-ascii?Q?2JiHLP0uhMQzIqi1J0bsDcAr+VvRz7atT+3ZV+djrOj2cdJL3zbGi22ogt4f?=
 =?us-ascii?Q?9g+9hedcaQ/DpQp6df/QeywrTYyeW6/3zkWp2A7tpdSHiGZObsME87upsTXm?=
 =?us-ascii?Q?SHBUbC8qLdMhrnu30lwt18cf21XrnGMFgMVTDcw0g5Is9TSdXjVpk3SRXMvy?=
 =?us-ascii?Q?0RRLydjFmlGsT0+mMt2aV4FT/O0Tq3Yzr7tVwC+eCVZ/+DbmTlRLtuWnHHWd?=
 =?us-ascii?Q?JgkQHMfLEnnZfQuhl8jblEvGwvaiUrNl3RKsFyNXb9Ezgamf0tNlW6EdYH7W?=
 =?us-ascii?Q?KCHWfToUW91hRyRZk8cdLS9gklMOjtPQ8U2gE8j+34GjC4LuhKK1VUHLzNYj?=
 =?us-ascii?Q?FddBImPPYrDQPbNSrCzIBDeHA7c+jRn/WNEt6vaicFCn7C6uQj6BW97lWKlz?=
 =?us-ascii?Q?PPBXouy0nAVeCESqWEavdxsMptol57YRKSTuYUx6ymwKjYmXkheeT9RyjDIL?=
 =?us-ascii?Q?U095tucPTpZb+v27Y8Khq3BQ8ocoLBJEUc1sNo5Ra31H1k3px98BSFyboABr?=
 =?us-ascii?Q?i9VoqujU+M4wQBawvT1A7dXFUYxXGPPZQCXKHOoH03C8M+Xg1G2XlOJoY/wi?=
 =?us-ascii?Q?k63taFkj0Axk15b53WI1DIEss9JggHbZWeMU2T+YvN54kc9aGgoNWpw+HLHA?=
 =?us-ascii?Q?p9crwD1hjQwkXWcD5k6bI1I9VUMbhXA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553300cf-1663-4b06-6171-08da2eba45ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:19.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlfAJK5vOey4HcWLKBIdGODzq6WpA29fFz4+I5NHo/dkdd9wpQj+whFvVdDso05jGZhaWNcB8m86H1ZzkVsw4roZsv5S4WJqARBeTMnF10k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: -iWmQ9DRPtXVzUwaLTYQdxe-FTdlodtl
X-Proofpoint-ORIG-GUID: -iWmQ9DRPtXVzUwaLTYQdxe-FTdlodtl
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for posted writes on remote devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h                 |   1 +
 hw/vfio/user-protocol.h       |  12 +++++
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   7 +--
 hw/vfio/common.c              |  10 +++-
 hw/vfio/pci.c                 |   9 +++-
 hw/vfio/user.c                | 109 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 143 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ec9f345..643ff75 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -194,6 +194,7 @@ struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
     bool send_queued;   /* all sends are queued */
+    bool no_post;       /* all regions write are sync */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index caa523a..b1ea55f 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -120,4 +120,16 @@ typedef struct {
     uint64_t offset;
 } VFIOUserRegionInfo;
 
+/*
+ * VFIO_USER_REGION_READ
+ * VFIO_USER_REGION_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[];
+} VFIOUserRegionRW;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 633b3ea..a641351 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -77,6 +77,7 @@ typedef struct VFIOProxy {
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
 #define VFIO_PROXY_FORCE_QUEUED  0x4
+#define VFIO_PROXY_NO_POST       0x8
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2552557..4118b8a 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -57,6 +57,7 @@ typedef struct VFIORegion {
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
     int fd; /* fd to mmap() region */
+    bool post_wr; /* writes can be posted */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -180,7 +181,7 @@ struct VFIODevIO {
     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
                        void *data);
     int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
-                        void *data);
+                        void *data, bool post);
 };
 
 #define VDEV_GET_INFO(vdev, info) \
@@ -193,8 +194,8 @@ struct VFIODevIO {
     ((vdev)->io_ops->set_irqs((vdev), (irqs)))
 #define VDEV_REGION_READ(vdev, nr, off, size, data) \
     ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
-#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
-    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))
+#define VDEV_REGION_WRITE(vdev, nr, off, size, data, post) \
+    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
     int (*dma_map)(VFIOContainer *container,
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c30da14..351f727 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -213,6 +213,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    bool post = region->post_wr;
     int ret;
 
     switch (size) {
@@ -233,7 +234,11 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
+    /* read-after-write hazard if guest can directly access region */
+    if (region->nr_mmaps) {
+        post = false;
+    }
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, post);
     if (ret != size) {
         const char *err = ret < 0 ? strerror(-ret) : "short write";
 
@@ -1555,6 +1560,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->post_wr = false;
     if (vbasedev->regfds != NULL) {
         region->fd = vbasedev->regfds[index];
     } else {
@@ -2689,7 +2695,7 @@ static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
 }
 
 static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
-                                uint32_t size, void *data)
+                                uint32_t size, void *data, bool post)
 {
     struct vfio_region_info *info = vbasedev->regions[index];
     int ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 68d6f0c..98520dd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -51,7 +51,7 @@
                      (size), (data))
 #define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
     VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
-                      (size), (data))
+                      (size), (data), false)
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -1661,6 +1661,9 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     bar->type = pci_bar & (bar->ioport ? ~PCI_BASE_ADDRESS_IO_MASK :
                                          ~PCI_BASE_ADDRESS_MEM_MASK);
     bar->size = bar->region.size;
+
+    /* IO regions are sync, memory can be async */
+    bar->region.post_wr = (bar->ioport == 0);
 }
 
 static void vfio_bars_prepare(VFIOPCIDevice *vdev)
@@ -3445,6 +3448,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
+    if (udev->no_post) {
+        proxy->flags |= VFIO_PROXY_NO_POST;
+    }
 
     vfio_user_validate_version(vbasedev, &err);
     if (err != NULL) {
@@ -3504,6 +3510,7 @@ static void vfio_user_instance_finalize(Object *obj)
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
+    DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index c87699a..fb6851e 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -57,6 +57,8 @@ static void vfio_user_cb(void *opaque);
 
 static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
@@ -618,6 +620,33 @@ static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
     return 0;
 }
 
+/*
+ * async send - msg can be queued, but will be freed when sent
+ */
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (!(hdr->flags & (VFIO_USER_NO_REPLY | VFIO_USER_REPLY))) {
+        error_printf("vfio_user_send_async on sync message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = 0;
+    msg->type = VFIO_MSG_ASYNC;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+    }
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -1043,6 +1072,70 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                 uint32_t count, void *data)
+{
+    g_autofree VFIOUserRegionRW *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    if (count > max_xfer_size) {
+        return -EINVAL;
+    }
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    } else if (msgp->count > count) {
+        return -E2BIG;
+    } else {
+        memcpy(data, &msgp->data, msgp->count);
+    }
+
+    return msgp->count;
+}
+
+static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                  uint32_t count, void *data, bool post)
+{
+    VFIOUserRegionRW *msgp = NULL;
+    int flags = post ? VFIO_USER_NO_REPLY : 0;
+    int size = sizeof(*msgp) + count;
+    int ret;
+
+    if (count > max_xfer_size) {
+        return -EINVAL;
+    }
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size, flags);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+    memcpy(&msgp->data, data, count);
+
+    /* async send will free msg after it's sent */
+    if (post && !(proxy->flags & VFIO_PROXY_NO_POST)) {
+        vfio_user_send_async(proxy, &msgp->hdr, NULL);
+        return count;
+    }
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        ret = -msgp->hdr.error_reply;
+    } else {
+        ret = count;
+    }
+
+    g_free(msgp);
+    return ret;
+}
+
 
 /*
  * Socket-based io_ops
@@ -1092,8 +1185,24 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
+                                    off_t off, uint32_t size, void *data)
+{
+    return vfio_user_region_read(vbasedev->proxy, index, off, size, data);
+}
+
+static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
+                                     off_t off, unsigned size, void *data,
+                                     bool post)
+{
+    return vfio_user_region_write(vbasedev->proxy, index, off, size, data,
+                                  post);
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .region_read = vfio_user_io_region_read,
+    .region_write = vfio_user_io_region_write,
 };
 
-- 
1.8.3.1



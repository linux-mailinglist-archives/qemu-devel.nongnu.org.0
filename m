Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084B546DEF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:02:14 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkph-0006xf-2v
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf5-0000IG-E1
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf3-0000V1-9W
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:15 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhufc021488;
 Fri, 10 Jun 2022 19:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=hfNaw4hNyFdEt6EkHam3pLV7nuotXSHrEMYy8obzo9CLlVdYZ6Vyhz1Ei+MfIfSNEPog
 HgszXmokrGfcF0MHiG77lvc1yzc2ddTtZtIHELHdnebIr+pmmFRj0bH04MZYwTbArNai
 szUFr36CpmgxTbsgIHTUBTR7loej6P9/MMvKo5yHIz2bEms6KxeLdwqhru7NZyf370kZ
 hccbte9awqXGJ9I536LJwLGwRzOkEp89YQ9MRfmLT/NhQqDaUvV7tTtA6x+XJSehFrMU
 55dgeJFYqaLpzzdIh9Sa+Ulo0nVqywrT0EdNTyZMF8l5qZywcxjfzbB4RIyAlVcYZNkK 1w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexem0ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:09 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJklFC023143; Fri, 10 Jun 2022 19:51:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6egpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIP720iTqiUVZNvpB8Bz2zu3zSWNh5CsDPosejM4QdcypTaKXQDV90sqtd4AAeLB8DKkCamO8W9hoxOQrEz2jKp1tAQqGTQpfwEyInt7x3aGD2LRz7uZfgMVJ7RFOHdwoZownhUaho4hoZ+4rv6iwL2psynLiWM+E7WGHMWesSMtRV8NW9QeE5AGQugrncRbRh2yHxTsM7rG2Qm3w0NwFQ9PSLmfNHBP2HxGmdtlkWAAPBzmR4NTvano3FbIksP4hQAVtk7L99knLnwsR/x74HBQslhG1wjWSxBYyzAHEn18VjC6mDHCXIl9d9r7ss3utXRfERKekJUMsD7c3Dfk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=aCPgByc/3XfSuBimVgmIpZinHDwaUZBt1QtgoSH90PC22QxUO0hJkE/Tf9TIKN5UBZqbYQyYQFUaJ4WIh0CMy4E3VWewQXHJHOAnvNOkvnoe5e8uMh7HIinryzANHmDRw+yRu6dw9qRX2j2DzXS37YPc7Rk+JRdp0HX1pOTOveVSfgl+dKY47MLCo380QEykh6uxHKso6NvhN/ygfsP/b9WNxCjOQgC7w0uwSG3tSbT2G9IMvTnMiesQYta+AGAx2onklmzJ0KuxjNz6HwjYF093I9b64S8DBIRe9lkT6SOoDNIoY+vlUIQkSylNuBrNkJsUUROhZpS6VxUQPnhgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxB1j/mLLxFP2ZU5OMxJEGAjd5aoDWFj+Kc9VTbPREY=;
 b=gKhufIfhdrrooec+y5Ox2jB8KoIKwq1CSQOr2CBUTXpXC+tCtQ983zhKAu/lWh6MobGeMK4s0PF84noS+B6pmktalQhylATwvA6u2QZPbxxOgnq16UTIvxwIaKo5Z2bojMirKQm8Wq5nV/ZJQMZIsIXx2JcW/ocjAX9lv//i4zI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB6254.namprd10.prod.outlook.com (2603:10b6:8:8f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Fri, 10 Jun 2022 19:51:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:06 +0000
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
Subject: [PATCH v11 08/14] vfio-user: run vfio-user context
Date: Fri, 10 Jun 2022 15:50:35 -0400
Message-Id: <5e7944c5fd8afdeb2c6f8b1084407a4d57e86f99.1654889541.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: fde30a75-6035-4d68-6530-08da4b1a8efc
X-MS-TrafficTypeDiagnostic: DM4PR10MB6254:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB6254518A1EFA8B4C769BB21690A69@DM4PR10MB6254.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtpmwq5vUD6Mf8rGHzkCso76vaSqvgRJEaQ1iTRfQt6Uhcb8eqTdIYdA3GneY2v4Nujgq/rySH0OKOywuNJ8oIS/pxWt/kmw1RKWETqLjGojw5a7wWGTM4q539Dhw8+QI1k9BfdN1sVe0ZEzpMrMYMpRWCNFEUAp2oKXg7N7tADgk5B/m4kRZ8/BhvaVBbqPoqQdVovbqOiy+ZkPUpBXh4xsTtJK5U/rEQuo2nO0HbRL8BGDDnxtZv76cTIKB1vQASCBE1L6lVDITlon61B7THBIB6LJElNralyXVKwZ19lgGsf4k4fsamN9Mxe7myJkLmUyFgLw/C80FIZ7gLLa3q+kq3eY3CTrvF0ao2VNwh3Wvvdsx+qSirxwGF38Tk4SBwdLjlMErp9Val3ehLZu1lUFLyGWpzX9gAGDmANNfMRerhPnM77eD1+qRoBlxJXZu7OUeDLmQpiwDaXICUnAcQxo32qt6i60qaifUynqgRoMKjIxYyQwWlWwbCpmGPpvc76ge/bk/6ub/l6LYBpECjWdWCUuTcFlecLRXBUvnquZs+92TZeNvq8GkI1ySlXgDdTsLInCk2pED/Wg4Nz0B7O182ZRSlWQaXVZIRLlY7DuvewnUhMyGJ+rYmHcuSq4lu53htlQsI/PgDE/TduR7ne+PKKQDF2N1FnImCUcVWnHZjlQHID83HoH1iiWr4jcBEgyWK8rxvaNA2EBlppZHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(26005)(8936002)(2616005)(6512007)(6666004)(36756003)(186003)(6916009)(316002)(83380400001)(6486002)(38350700002)(2906002)(6506007)(86362001)(107886003)(66946007)(8676002)(4326008)(66556008)(5660300002)(7416002)(52116002)(508600001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QNOE30ZO1qqim5fL8NWTpMqA8dvo7zkDliBuTaZ0ewpSMBSzDtrGEbsf9AFY?=
 =?us-ascii?Q?BmN7T4mjBr9P6AKAliaKk/onKHSJRsR3PLB+Pm35Z5cGRTJHhxMflvKM3VeA?=
 =?us-ascii?Q?MXT8XLpCvzEyID81LF9xBWDihB4Ug57qWxnbMbR+jZw7AH20+B6TJjRrEike?=
 =?us-ascii?Q?sXDU2S8hzFcE+wc+zEWZYfCDYabli44VoAazCv+2aJvfujwfjnsU/+xB552x?=
 =?us-ascii?Q?NZ2VBdyerBubeTHA3VwfRlzTe7reO5Q7d7s0cuTnKJaWuyr58/ozvy/rlCX9?=
 =?us-ascii?Q?779Aoxu5jGoIiVX84Ah6RuVoEu7N9Johs0gV0MNXeYGfmHiyPbNwTdfR0+49?=
 =?us-ascii?Q?83xThtBL4VEgI+1P+W2PuoGL+vVIRIMT5X2/DBXNiN4c0b1sFRcqrO8Q3rvL?=
 =?us-ascii?Q?FVMQAR1AAP0/ot/zp/ZbuH31SqcdBUb4rDd8NfSCj/ahVMBFMTkzElCEJuwy?=
 =?us-ascii?Q?ExMlnFtd/1bL5d/QzfTEn8+h2zRCIP4ME5ZxEpWp/xJ+YUggu3AYX3epT4Be?=
 =?us-ascii?Q?375ByFdiWBGMComJKo8kDZtP74YlggkXejYZ9lJwRMBXS5KVlxhI2hkXIS+j?=
 =?us-ascii?Q?AUob2du2j/O22CtqqDwQkeuYIs0kmGqb7Wi8Yo3EcQ5LVpANcjJkgA0TKn8B?=
 =?us-ascii?Q?4Rw6QIdFL5sZOxRH39ajD97Nc4bMNKAIiT0WOoFlHKrlo2f7nch07v5fS2Rr?=
 =?us-ascii?Q?APYYFsacBiojtEHC5+6uwKqi014v3d9b+TcP2atJwDFd0Dw3ChEXup5ilC2I?=
 =?us-ascii?Q?dm8lexJOzzvEh5Cfa/52EC56xFNyFpZMDwd53TtvllmRZ+NLVPFPC4J1/XSv?=
 =?us-ascii?Q?1fvLWRhDLWnr0xJW8+Yzs0qgusmoYm+OTKVaVt/L4gSd1x2l7CodGoNUvuLt?=
 =?us-ascii?Q?O63q/x6ezPJC6t4waG40STo8dCXmXTa8p/4dUqqVTpiAsgwe51m9bjbivFMw?=
 =?us-ascii?Q?nqQKl+zhYgcv38ltAK63y0GE9wIbEo8Wrzss+xaYI2wWy5j+Crf07YFfGmmT?=
 =?us-ascii?Q?vzEk3k4ozVssXQqvqcKxeGFFBrzEidiLmmtKOBQZccqNtmXDdgnGVHW1g5II?=
 =?us-ascii?Q?0/eAwgWmN6d/i49qrHzvEhubOosOYd5dS4zUft0qFLs8UfOiyITH6yZPwUHM?=
 =?us-ascii?Q?cj1RNlmSD29N7ZFUlOQv1lRnDWhpw8rJxvFyJlWi8vD7+okNVJAZWwHiIJhw?=
 =?us-ascii?Q?BWSm77/BNdA64r0pr+66RyNlUMGqeImm7JY3Bmyd/HAoDl+dv2o7fBndHt9g?=
 =?us-ascii?Q?D/Cj+8E4caKJVxW3G12uI9H++jShbFL4jzYT9vjYXpGyhiEvo3S3HRVgMcos?=
 =?us-ascii?Q?oFEEVIggDS+EEyd9mTQESmHgMgJ9rGheR6CbXDk78LJqeToqOEBr77I8g9lv?=
 =?us-ascii?Q?sq9vot2UVnqxnbgnNFoZ9CrVOOxDTNq3kw7c3M9cavn83hi2Yvc6v+QEcGws?=
 =?us-ascii?Q?J5ZlVEfiGUVuqYCghS00QNi5CmgoOHe3La6ApxzKB5xjcUiadDJa03taxdM8?=
 =?us-ascii?Q?qT1zEBag5TkH0+y5DmQOa663URUleusHNnnasW0ez9f47/DcaHF2IW5YkllQ?=
 =?us-ascii?Q?JTxKDCIzOUgTm4zaaOieolE0brW3VSCyCkbDTIvhL4VzsmQvG146/PPkUdOg?=
 =?us-ascii?Q?UqfcA4uzqAMRuYF1wg8C/xBxLTn1EuCEpa4t4wwV+t9YdkFV9ZYc8gfhaAGO?=
 =?us-ascii?Q?YAu+A4bMmxiXKJBgOPkbMbUHL/UeZu4UDHHt+fS+bKPtQVfe+vOb9UXveuO1?=
 =?us-ascii?Q?f8Xej7jTmw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde30a75-6035-4d68-6530-08da4b1a8efc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:06.8203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkHH9AWVnNnElGmQQPdoOJBhjqn+00UxD8R0+SpMCUA6JAFeRaaBuvEfc2cUJtZQwC5oXSZ3c0SdWfzV6+aXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: MLjhGrpXEiAPMHtbrCAinkquBIcjOEnU
X-Proofpoint-ORIG-GUID: MLjhGrpXEiAPMHtbrCAinkquBIcjOEnU
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

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/misc.json            |  31 ++++++++++
 hw/remote/vfio-user-obj.c | 118 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 45344483cd..27ef5a2b20 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -553,3 +553,34 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int', 'qom-path': 'str' } }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object. It is the last component
+#          of @vfu-qom-path referenced below
+#
+# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM tree
+#
+# @dev-id: ID of attached PCI device
+#
+# @dev-qom-path: path to attached PCI device in the QOM tree
+#
+# Since: 7.1
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "vfu-id": "vfu1",
+#                "vfu-qom-path": "/objects/vfu1",
+#                "dev-id": "sas1",
+#                "dev-qom-path": "/machine/peripheral/sas1" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
+            'dev-id': 'str', 'dev-qom-path': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 3ca6aa2b45..178bd6f8ed 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -40,11 +43,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -86,6 +92,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -164,6 +172,78 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    const char *vfu_id;
+    char *vfu_path, *pci_dev_path;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                vfu_id = object_get_canonical_path_component(OBJECT(o));
+                vfu_path = object_get_canonical_path(OBJECT(o));
+                g_assert(o->pci_dev);
+                pci_dev_path = object_get_canonical_path(OBJECT(o->pci_dev));
+                 /* o->device is a required property and is non-NULL here */
+                g_assert(o->device);
+                qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
+                                                  o->device, pci_dev_path);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                g_free(vfu_path);
+                g_free(pci_dev_path);
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        (void)qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -184,6 +264,20 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
     }
 }
 
+/**
+ * vfu_object_init_ctx: Create and initialize libvfio-user context. Add
+ *     an unplug blocker for the associated PCI device. Setup a FD handler
+ *     to process incoming messages in the context's socket.
+ *
+ *     The socket and device properties are mandatory, and this function
+ *     will not create the context without them - the setters for these
+ *     properties should call this function when the property is set. The
+ *     machine should also be ready when this function is invoked - it is
+ *     because QEMU objects are initialized before devices, and the
+ *     associated PCI device wouldn't be available at the object
+ *     initialization time. Until these conditions are satisfied, this
+ *     function would return early without performing any task.
+ */
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
@@ -202,7 +296,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -241,6 +336,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -275,6 +385,7 @@ static void vfu_object_init(Object *obj)
         qemu_add_machine_init_done_notifier(&o->machine_done);
     }
 
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -288,6 +399,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_poll_fd != -1) {
+        qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+        o->vfu_poll_fd = -1;
+    }
+
     if (o->vfu_ctx) {
         vfu_destroy_ctx(o->vfu_ctx);
         o->vfu_ctx = NULL;
-- 
2.20.1


